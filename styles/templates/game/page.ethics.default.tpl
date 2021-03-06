{block name="title" prepend}{$LNG.lm_ethics}{/block}
{block name="content"}
<div id="page">
    <div id="content">
    {if $EthicsList}
        <div id="ally_content" class="conteiner">
            <div class="gray_stripe" style="color:#6ccdce;">
                <strong>{$LNG.tech.{$name}}</strong>                   
            </div>
            <div id="build_elements" class="race_elements">
                {foreach $EthicsList as $ID => $Element}
                <div id="ofic_{$ID}" class="build_box">
                    <div class="head">              
                        <a style="color:#6ccdce;"><strong>{$LNG.tech.{$ID}}</strong></a>
                    </div>
                    <div class="content_box">
                        <img style="float:right;" src="{$dpath}gebaeude/{$ID}.png" />
                        <div class="prices_mini" style="margin-left: 7px;">
                            <font style="color:#6ccdce;"><strong>{$LNG.in_bonus}</strong></font><br>
                            <font color="#6ccdce">{foreach $Element.elementBonus as $BonusName => $Bonus}{if $Bonus[0] < 0}-{else}+{/if}{if $Bonus[1] == 0}{abs($Bonus[0] * 100)}%{else}{floatval($Bonus[0])}{/if} {$LNG.bonus.$BonusName}<br>{/foreach}</font>
                        </div>
                        <div class="clear"></div>
                        <div class="btn_build_border">
                        {if $Element.maxLevel <= $Element.level}
                            <span class="btn_build red">{$LNG.et_yes}</span>
                        {elseif $Element.buyable}
                            <form action="game.php?page=ethics" method="post" class="build_form">
                                <input type="hidden" name="id" value="{$ID}">
                                <button type="submit" class="btn_build">{$LNG.et_one} {foreach $Element.costResources as $RessID => $RessAmount} {$LNG.tech.{$RessID}} <span style="color:{if $Element.costOverflow[$RessID] == 0}lime{else}red{/if}">{$RessAmount|number}</span>{/foreach}</button>
                            </form>
                        {else}
                            <span class="btn_build red">{$LNG.et_one} {foreach $Element.costResources as $RessID => $RessAmount} {$LNG.tech.{$RessID}} <span style="color:{if $Element.costOverflow[$RessID] == 0}lime{else}#666666{/if}">{$RessAmount|number}{/foreach}</span></span>
                        {/if}
                        </div>
                    </div>
                </div>
                {/foreach}
                <div class="clear"></div>
            </div>
        </div>
    {/if}
    </div>
</div>
{/block}
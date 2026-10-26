Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BCB606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 17:03:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7402310E307;
	Mon, 26 Oct 2026 17:03:26 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA0D10E307
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 17:03:24 +0000 (UTC)
Received: from 91-152-156-14.elisa-laajakaista.fi ([91.152.156.14]
 helo=[192.168.100.138])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1xLO6R-00000004jhX-2qfB; Mon, 26 Oct 2026 19:03:23 +0200
Message-ID: <4604a1d1d6371abad2ef5f884990933a8b7d9014.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: I915-ci-infra@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Oct 2026 19:03:32 +0200
In-Reply-To: <179302778362.71438.81729580967542316@221881a7231d>
References: <20261026094724.53374-1-luciano.coelho@intel.com>
 <179302778362.71438.81729580967542316@221881a7231d>
Content-Type: multipart/alternative; boundary="=-D2E4oz0FqB4t2EF0HoLG"
User-Agent: Evolution 3.56.2-10+b1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
Subject: Re: =?UTF-8?Q?=E2=9C=97?= Xe.CI.FULL: failure for drm/i915/display:
 reduce clock_gating interface between core and display (rev5)
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--=-D2E4oz0FqB4t2EF0HoLG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

The Xe.CI.FULL run for my series "drm/i915/display: reduce clock_gating
interface between core and display" (rev5) reported some possible
regressions:

https://patchwork.freedesktop.org/series/172330/
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/index.html

I don't think they're related to my changes. The same failures show up
in runs for other, unrelated series:

1. igt@kms_joiner@basic-force-big-joiner (shard-ptl, DMESG-WARN)
=C2=A0 =C2=A0=C2=A0igt@kms_joiner@basic-force-big-joiner@single (shard-lnl,=
 DMESG-
WARN)

The log is flooded with "[CRTC:354:pipe B] DSB 0 response timeout"
followed by "DSB 0 timed out waiting for idle". =C2=A0These two
series fail in exactly the same way on both PTL and LNL:

xe-pw-176818v1 ("drm/i915/cmtg: Fix CMTG disable timeout in
hsw_crtc_disable()", same xe-6010 base):
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176818v1/shard-ptl-3/igt@km=
s_joiner@basic-force-big-joiner.html
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176818v1/shard-lnl-3/igt@km=
s_joiner@basic-force-big-joiner@single.html

xe-pw-176714v1 ("drm/i915/psr: PSR2 and Panel Replay with the joiner",
xe-6002 base):
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176714v1/shard-ptl-2/igt@km=
s_joiner@basic-force-big-joiner.html
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176714v1/shard-lnl-4/igt@km=
s_joiner@basic-force-big-joiner@single.html

So it looks like a new issue in the base tree, not something caused by
these patches.

2.
igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip=C2=A0(shar=
d
-ptl, FAIL)

"CRC failure with async flip, crc shouldn't match for checked round",
with no kernel warnings. The same PASS -> FAIL happened on
an Xe BO series that doesn't touch display:

xe-pw-176571v1 ("drm/xe/bo: Add xe_bo_addr_iter"):
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-ptl-6/igt@km=
s_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

Could you please add filters for these failures and re-report the
results for the series?

Analysis assisted by Claude Opus 5.5.

Thanks!

--
Cheers,
Luca.


On Mon, 2026-10-26 at 15:16 +0000, Patchwork wrote:
> Patch Details
>=20
> Series:drm/i915/display: reduce clock_gating interface between core
> and display (rev5)
>=20
> URL:https://patchwork.freedesktop.org/series/172330/
>=20
> State:failure
> Details:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/index.html
> CI Bug Log - changes from xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1=
a_FULL -> xe-pw-172330v5_FULLSummaryFAILURE
> Serious unknown changes coming with xe-pw-172330v5_FULL absolutely
> need to be
> verified manually.
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-172330v5_FULL, please notify your bug team (I915-
> ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives
> in CI.
> Participating hosts (3 -> 3)No changes in participating hosts
> Possible new issuesHere are the unknown changes that may have been introd=
uced in xe-pw-
> 172330v5_FULL:
> IGT changesPossible regressions *=20
>    igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-
>    flip:shard-ptl: PASS [331] -> FAIL [330]
>  *=20
>    igt@kms_joiner@basic-force-big-joiner:shard-ptl: PASS [329] ->
>    DMESG-WARN [328] +1 other test dmesg-warn
>  *=20
>    igt@kms_joiner@basic-force-big-joiner@single:shard-lnl: NOTRUN ->
>    DMESG-WARN [327]
> Warnings * igt@kms_joiner@basic-force-big-joiner:shard-lnl:          SKIP=
 [326](IntelXE
>    #7086 [32] / Intel XE#7390 [31]) -> DMESG-WARN [325]
> Known issuesHere are the changes found in xe-pw-172330v5_FULL that come f=
rom
> known issues:
> IGT changesIssues hit *=20
>    igt@kms_big_fb@4-tiled-32bpp-rotate-90:shard-ptl: NOTRUN -> SKIP
>    [324] (Intel XE#5901 [323]) +3 other tests skip
>  *=20
>    igt@kms_big_fb@x-tiled-64bpp-rotate-90:shard-lnl: NOTRUN -> SKIP
>    [322] (Intel XE#1407 [321])
>  *=20
>    igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:shard-bmg: NOTRUN
>    -> SKIP [320] (Intel XE#607 [319] / Intel XE#7361 [318])
>  *=20
>    igt@kms_big_fb@yf-tiled-64bpp-rotate-180:shard-ptl: NOTRUN -> SKIP
>    [316] (Intel XE#5808 [315]) +6 other tests skipshard-bmg: NOTRUN ->
>    SKIP [317] (Intel XE#1124 [313]) +2 other tests skip
>  *=20
>    igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-
>    flip:shard-lnl: NOTRUN -> SKIP [314] (Intel XE#1124 [313]) +1 other
>    test skip
>  *=20
>    igt@kms_bw@connected-linear-tiling-3-displays-target-
>    2160x1440p:shard-ptl: NOTRUN -> SKIP [312] (Intel XE#7679 [310])
>  *=20
>    igt@kms_bw@connected-linear-tiling-4-displays-target-
>    2160x1440p:shard-bmg: NOTRUN -> SKIP [311] (Intel XE#7679 [310])
>  *=20
>    igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:shard-bmg:
>    PASS [309] -> SKIP [308] (Intel XE#367 [50])
>  *=20
>    igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:shard-ptl:
>    NOTRUN -> SKIP [307] (Intel XE#367 [50])
>  *=20
>    igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:shard-lnl: NOTRUN -> SKIP
>    [306] (Intel XE#2887 [298]) +2 other tests skip
>  *=20
>    igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:shard-
>    ptl: NOTRUN -> SKIP [305] (Intel XE#5822 [304]) +5 other tests skip
>  *=20
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:shard-bmg: NOTRUN
>    -> SKIP [303] (Intel XE#3432 [302])
>  *=20
>    igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-dp-1:shard-
>    bmg: NOTRUN -> SKIP [301] (Intel XE#2652 [300]) +3 other tests skip
>  *=20
>    igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:shard-bmg: NOTRUN -> SKIP
>    [299] (Intel XE#2887 [298]) +4 other tests skip
>  *=20
>    igt@kms_chamelium_audio@hdmi-audio-after-suspend:shard-bmg: NOTRUN -
>    > SKIP [297] (Intel XE#2252 [288]) +1 other test skip
>  *=20
>    igt@kms_chamelium_color@ctm-0-50:shard-lnl: NOTRUN -> SKIP [296]
>    (Intel XE#306 [295] / Intel XE#7358 [290])
>  *=20
>    igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-
>    lim:shard-ptl: NOTRUN -> SKIP [294] (Intel XE#8391 [293]) +3 other
>    tests skip
>  *=20
>    igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-
>    lim-lut1d:shard-bmg: NOTRUN -> SKIP [292] (Intel XE#7358 [290]) +1
>    other test skip
>  *=20
>    igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:shard-lnl:
>    NOTRUN -> SKIP [291] (Intel XE#7358 [290])
>  *=20
>    igt@kms_chamelium_edid@dp-mode-timings:shard-ptl: NOTRUN -> SKIP
>    [289] (Intel XE#2252 [288]) +1 other test skip
>  *=20
>    igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-3:shard-ptl:
>    NOTRUN -> SKIP [287] (Intel XE#6969 [286]) +7 other tests skip
>  *=20
>    igt@kms_content_protection@dp-mst-lic-type-1:shard-bmg: NOTRUN ->
>    SKIP [283] (Intel XE#2390 [282] / Intel XE#6974 [280])shard-ptl:
>    NOTRUN -> SKIP [285] (Intel XE#5832 [284] / Intel XE#6974 [280])
>  *=20
>    igt@kms_content_protection@dp-mst-type-0-suspend-resume:shard-ptl:
>    NOTRUN -> SKIP [281] (Intel XE#6974 [280])
>  *=20
>    igt@kms_content_protection@legacy:shard-lnl: NOTRUN -> SKIP [279]
>    (Intel XE#7642 [278])
>  *=20
>    igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:shard-bmg:
>    NOTRUN -> FAIL [277] (Intel XE#1178 [276] / Intel XE#3304 [275] /
>    Intel XE#7374 [274])
>  *=20
>    igt@kms_content_protection@uevent@pipe-a-dp-1:shard-bmg: NOTRUN ->
>    FAIL [273] (Intel XE#6707 [272] / Intel XE#7439 [271])
>  *=20
>    igt@kms_cursor_crc@cursor-onscreen-32x10:shard-bmg: NOTRUN -> SKIP
>    [270] (Intel XE#2320 [269]) +1 other test skip
>  *=20
>    igt@kms_cursor_crc@cursor-onscreen-512x170:shard-lnl: NOTRUN -> SKIP
>    [268] (Intel XE#2321 [262] / Intel XE#7355 [261])
>  *=20
>    igt@kms_cursor_crc@cursor-random-256x85:shard-lnl: NOTRUN -> SKIP
>    [267] (Intel XE#1424 [266])
>  *=20
>    igt@kms_cursor_crc@cursor-sliding-32x32:shard-ptl: NOTRUN -> SKIP
>    [265] (Intel XE#5900 [264]) +2 other tests skip
>  *=20
>    igt@kms_cursor_crc@cursor-sliding-512x512:shard-bmg: NOTRUN -> SKIP
>    [263] (Intel XE#2321 [262] / Intel XE#7355 [261])
>  *=20
>    igt@kms_cursor_legacy@cursora-vs-flipb-legacy:shard-ptl: NOTRUN ->
>    SKIP [260] (Intel XE#5962 [259])
>  *=20
>    igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:shard-lnl:
>    NOTRUN -> SKIP [258] (Intel XE#309 [257] / Intel XE#7343 [181])
>  *=20
>    igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:shard-bmg:
>    PASS [256] -> FAIL [255] (Intel XE#7809 [254])
>  *=20
>    igt@kms_dp_link_training@uhbr-mst:shard-ptl: NOTRUN -> SKIP [253]
>    (Intel XE#9533 [252])
>  *=20
>    igt@kms_dsc@dsc-with-output-formats-with-bpc:shard-lnl: NOTRUN ->
>    SKIP [251] (Intel XE#8265 [250]) +1 other test skip
>  *=20
>    igt@kms_feature_discovery@chamelium:shard-bmg: NOTRUN -> SKIP [248]
>    (Intel XE#2372 [247] / Intel XE#7359 [246])shard-ptl: NOTRUN -> SKIP
>    [249] (Intel XE#7359 [246])
>  *=20
>    igt@kms_feature_discovery@display-4x:shard-bmg: NOTRUN -> SKIP [244]
>    (Intel XE#1138 [243] / Intel XE#7344 [242])shard-ptl: NOTRUN -> SKIP
>    [245] (Intel XE#7344 [242])
>  *=20
>    igt@kms_flip@2x-plain-flip-interruptible:shard-ptl: NOTRUN -> SKIP
>    [241] (Intel XE#2316 [240]) +2 other tests skip
>  *=20
>    igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-
>    upscaling:shard-bmg: NOTRUN -> SKIP [238] (Intel XE#7178 [236] /
>    Intel XE#7351 [235])shard-ptl: NOTRUN -> SKIP [239] (Intel XE#7178
>    [236]) +1 other test skip
>  *=20
>    igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-
>    upscaling:shard-lnl: NOTRUN -> SKIP [237] (Intel XE#7178 [236] /
>    Intel XE#7351 [235])
>  *=20
>    igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:shard-ptl:
>    NOTRUN -> SKIP [234] (Intel XE#5800 [233] / Intel XE#6312 [217]) +6
>    other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-msflip-
>    blt:shard-ptl: NOTRUN -> SKIP [232] (Intel XE#6312 [217]) +7 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:shard-
>    lnl: NOTRUN -> SKIP [231] (Intel XE#656 [230] / Intel XE#7905 [212])
>    +4 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-
>    wc:shard-ptl: NOTRUN -> SKIP [229] (Intel XE#5812 [228]) +46 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt:shard-bmg:
>    NOTRUN -> SKIP [226] (Intel XE#7061 [210] / Intel XE#7356
>    [225])shard-ptl: NOTRUN -> SKIP [227] (Intel XE#7061 [210] / Intel
>    XE#7356 [225]) +1 other test skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:shard-bmg:
>    NOTRUN -> SKIP [224] (Intel XE#4141 [223]) +6 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-
>    blt:shard-lnl: NOTRUN -> SKIP [222] (Intel XE#6312 [217] / Intel
>    XE#651 [221])
>  *=20
>    igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-
>    fullscreen:shard-bmg: NOTRUN -> SKIP [220] (Intel XE#2311 [219]) +22
>    other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-
>    blt:shard-lnl: NOTRUN -> SKIP [218] (Intel XE#6312 [217])
>  *=20
>    igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-blt:shard-
>    lnl: NOTRUN -> SKIP [216] (Intel XE#7061 [210])
>  *=20
>    igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-
>    wc:shard-bmg: NOTRUN -> SKIP [215] (Intel XE#7061 [210]) +2 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-
>    blt:shard-ptl: NOTRUN -> SKIP [214] (Intel XE#7865 [206]) +13 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-msflip-
>    blt:shard-lnl: NOTRUN -> SKIP [213] (Intel XE#7905 [212]) +8 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-
>    render:shard-ptl: NOTRUN -> SKIP [211] (Intel XE#7061 [210]) +1
>    other test skip
>  *=20
>    igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:shard-
>    bmg: NOTRUN -> SKIP [209] (Intel XE#2313 [208]) +14 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-render:shard-lnl:
>    NOTRUN -> SKIP [207] (Intel XE#7865 [206]) +4 other tests skip
>  *=20
>    igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:shard-ptl: NOTRUN -
>    > SKIP [205] (Intel XE#9312 [204])
>  *=20
>    igt@kms_joiner@basic-big-joiner:shard-lnl: NOTRUN -> SKIP [203]
>    (Intel XE#6901 [202])
>  *=20
>    igt@kms_joiner@invalid-modeset-force-ultra-joiner:shard-bmg: NOTRUN
>    -> SKIP [199] (Intel XE#6911 [198] / Intel XE#7466 [197])shard-ptl:
>    NOTRUN -> SKIP [201] (Intel XE#6900 [200])
>  *=20
>    igt@kms_mst@mst-suspend-read-crc:shard-ptl: NOTRUN -> SKIP [196]
>    (Intel XE#8348 [195])
>  *=20
>    igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:shard-lnl:
>    NOTRUN -> SKIP [194] (Intel XE#7283 [191])
>  *=20
>    igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:shard-bmg:
>    NOTRUN -> SKIP [192] (Intel XE#7283 [191]) +1 other test skipshard-
>    ptl: NOTRUN -> SKIP [193] (Intel XE#7283 [191])
>  *=20
>    igt@kms_plane_lowres@tiling-x:shard-ptl: NOTRUN -> SKIP [190] (Intel
>    XE#5946 [189])
>  *=20
>    igt@kms_plane_multiple@2x-tiling-none:shard-ptl: NOTRUN -> SKIP
>    [188] (Intel XE#4596 [187] / Intel XE#5854 [186])
>  *=20
>    igt@kms_plane_multiple@tiling-yf:shard-ptl: NOTRUN -> SKIP [185]
>    (Intel XE#5020 [184])
>  *=20
>    igt@kms_plane_scaling@2x-scaler-multi-pipe:shard-ptl: NOTRUN -> SKIP
>    [183] (Intel XE#5879 [182] / Intel XE#7343 [181])
>  *=20
>    igt@kms_plane_scaling@planes-downscale-factor-0-5:shard-lnl: NOTRUN
>    -> SKIP [180] (Intel XE#2763 [179] / Intel XE#6886 [177]) +3 other
>    tests skip
>  *=20
>    igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-
>    scaling@pipe-d:shard-ptl: NOTRUN -> SKIP [178] (Intel XE#6886 [177])
>    +4 other tests skip
>  *=20
>    igt@kms_pm_backlight@brightness-with-dpms:shard-bmg: NOTRUN -> SKIP
>    [176] (Intel XE#2938 [175] / Intel XE#7376 [174] / Intel XE#7760
>    [173])
>  *=20
>    igt@kms_pm_dc@dc3co-framedrop-check:shard-ptl: NOTRUN -> SKIP [172]
>    (Intel XE#8395 [171] / Intel XE#8396 [169]) +1 other test skip
>  *=20
>    igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888:shard-ptl: NOTRUN
>    -> SKIP [170] (Intel XE#8396 [169]) +1 other test skip
>  *=20
>    igt@kms_pm_dc@deep-pkgc:shard-lnl: PASS [168] -> FAIL [167] (Intel
>    XE#2029 [166] / Intel XE#7395 [165])
>  *=20
>    igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:shard-ptl: NOTRUN ->
>    SKIP [164] (Intel XE#7304 [160]) +2 other tests skip
>  *=20
>    igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-
>    1:shard-ptl: NOTRUN -> SKIP [163] (Intel XE#5858 [161]) +1 other
>    test skip
>  *=20
>    igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-
>    edp-1:shard-ptl: NOTRUN -> SKIP [162] (Intel XE#5858 [161] / Intel
>    XE#7304 [160]) +3 other tests skip
>  *=20
>    igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:shard-
>    bmg: NOTRUN -> SKIP [159] (Intel XE#1489 [158]) +2 other tests skip
>  *=20
>    igt@kms_psr@fbc-psr2-sprite-blt:shard-bmg: NOTRUN -> SKIP [157]
>    (Intel XE#2234 [156] / Intel XE#2850 [155]) +5 other tests skip
>  *=20
>    igt@kms_psr@fbc-psr2-sprite-blt@edp-1:shard-ptl: NOTRUN -> SKIP
>    [154] (Intel XE#1406 [151] / Intel XE#5835 [153]) +3 other tests
>    skip
>  *=20
>    igt@kms_psr@pr-dpms:shard-ptl: NOTRUN -> SKIP [152] (Intel XE#1406
>    [151])
>  *=20
>    igt@kms_rotation_crc@bad-pixel-format:shard-ptl: NOTRUN -> SKIP
>    [150] (Intel XE#5821 [149])
>  *=20
>    igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:shard-ptl:
>    NOTRUN -> SKIP [148] (Intel XE#5813 [147])
>  *=20
>    igt@kms_setmode@invalid-clone-exclusive-crtc:shard-bmg: NOTRUN ->
>    SKIP [144] (Intel XE#1435 [143] / Intel XE#8695 [142])shard-ptl:
>    NOTRUN -> SKIP [146] (Intel XE#5910 [145])
>  *=20
>    igt@kms_vrr@flip-dpms@pipe-a-edp-1:shard-ptl: PASS [141] -> FAIL
>    [140] (Intel XE#4227 [139] / Intel XE#7397 [138]) +3 other tests
>    fail
>  *=20
>    igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:shard-bmg:
>    NOTRUN -> ABORT [137] (Intel XE#8868 [136])
>  *=20
>    igt@xe_configfs@survivability-mode:shard-ptl: NOTRUN -> SKIP [135]
>    (Intel XE#8428 [134])
>  *=20
>    igt@xe_create@multigpu-create-massive-size:shard-ptl: NOTRUN -> SKIP
>    [133] (Intel XE#5878 [132])
>  *=20
>    igt@xe_evict@evict-large-external:shard-ptl: NOTRUN -> SKIP [131]
>    (Intel XE#5764 [130]) +5 other tests skip
>  *=20
>    igt@xe_evict@evict-mixed-many-threads-small:shard-bmg: PASS [129] ->
>    INCOMPLETE [128] (Intel XE#6321 [127] / Intel XE#8355 [126])
>  *=20
>    igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:shard-
>    lnl: NOTRUN -> SKIP [125] (Intel XE#6540 [124] / Intel XE#688 [123])
>    +1 other test skip
>  *=20
>    igt@xe_exec_balancer@no-exec-virtual-rebind:shard-lnl: NOTRUN ->
>    SKIP [122] (Intel XE#7482 [120]) +3 other tests skip
>  *=20
>    igt@xe_exec_balancer@once-parallel-userptr-rebind:shard-ptl: NOTRUN
>    -> SKIP [121] (Intel XE#7482 [120]) +6 other tests skip
>  *=20
>    igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:shard-bmg:
>    NOTRUN -> SKIP [119] (Intel XE#2322 [118] / Intel XE#7372 [117]) +3
>    other tests skip
>  *=20
>    igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-
>    invalidate:shard-lnl: NOTRUN -> SKIP [116] (Intel XE#1392 [115])
>  *=20
>    igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:shard-
>    ptl: NOTRUN -> SKIP [114] (Intel XE#5575 [113] / Intel XE#7484
>    [112]) +3 other tests skip
>  *=20
>    igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-
>    fault:shard-bmg: NOTRUN -> SKIP [111] (Intel XE#8374 [108]) +2 other
>    tests skip
>  *=20
>    igt@xe_exec_fault_mode@once-multi-queue-invalid-fault:shard-lnl:
>    NOTRUN -> SKIP [110] (Intel XE#8374 [108]) +2 other tests skip
>  *=20
>    igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-
>    race:shard-ptl: NOTRUN -> SKIP [109] (Intel XE#8374 [108]) +1 other
>    test skip
>  *=20
>    igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr:shard-
>    bmg: NOTRUN -> SKIP [107] (Intel XE#9003 [106])
>  *=20
>    igt@xe_exec_multi_queue@few-execs-preempt-mode-priority:shard-ptl:
>    NOTRUN -> SKIP [105] (Intel XE#8364 [102]) +11 other tests skip
>  *=20
>    igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority:shard-
>    bmg: NOTRUN -> SKIP [104] (Intel XE#8364 [102]) +7 other tests skip
>  *=20
>    igt@xe_exec_multi_queue@one-queue-preempt-mode-priority-smem:shard-
>    lnl: NOTRUN -> SKIP [103] (Intel XE#8364 [102]) +3 other tests skip
>  *=20
>    igt@xe_exec_reset@cm-multi-queue-close-fd:shard-ptl: NOTRUN -> SKIP
>    [101] (Intel XE#8369 [96])
>  *=20
>    igt@xe_exec_reset@gt-stress-reset-bo-invalidation:shard-ptl: PASS
>    [100] -> DMESG-WARN [99] (Intel XE#8652 [98])
>  *=20
>    igt@xe_exec_reset@multi-queue-cat-error-on-secondary:shard-lnl:
>    NOTRUN -> SKIP [97] (Intel XE#8369 [96])
>  *=20
>    igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-
>    single-vma:shard-ptl: NOTRUN -> SKIP [95] (Intel XE#6196 [94])
>  *=20
>    igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-
>    invalidate:shard-bmg: NOTRUN -> SKIP [93] (Intel XE#8378 [90]) +4
>    other tests skip
>  *=20
>    igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:shard-
>    lnl: NOTRUN -> SKIP [92] (Intel XE#8378 [90])
>  *=20
>    igt@xe_exec_threads@threads-multi-queue-hang-basic:shard-ptl: NOTRUN
>    -> SKIP [91] (Intel XE#8378 [90]) +5 other tests skip
>  *=20
>    igt@xe_madvise@atomic-global:shard-lnl: NOTRUN -> SKIP [89] (Intel
>    XE#7980 [88])
>  *=20
>    igt@xe_mmap@pci-membarrier:shard-ptl: NOTRUN -> SKIP [87] (Intel
>    XE#5100 [86] / Intel XE#7408 [85])
>  *=20
>    igt@xe_multigpu_svm@mgpu-concurrent-access-basic:shard-lnl: NOTRUN -
>    > SKIP [84] (Intel XE#6964 [82])
>  *=20
>    igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:shard-ptl: NOTRUN ->
>    SKIP [83] (Intel XE#6964 [82])
>  *=20
>    igt@xe_pat@l2-flush-opt-svm-pat-restrict:shard-ptl: NOTRUN -> SKIP
>    [81] (Intel XE#7590 [80])
>  *=20
>    igt@xe_pat@pat-sw-hw-compare:shard-ptl: NOTRUN -> FAIL [78] (Intel
>    XE#7695 [77]) +1 other test failshard-bmg: NOTRUN -> FAIL [79]
>    (Intel XE#7695 [77])
>  *=20
>    igt@xe_pm@s2idle-d3cold-basic-exec:shard-bmg: NOTRUN -> SKIP [74]
>    (Intel XE#2284 [73] / Intel XE#7370 [72])shard-ptl: NOTRUN -> SKIP
>    [76] (Intel XE#5741 [75])
>  *=20
>    igt@xe_pm_residency@gt-c6-freeze@gt0:shard-bmg: PASS [71] -> FAIL
>    [70] (Intel XE#9254 [69]) +1 other test fail
>  *=20
>    igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:shard-bmg: NOTRUN ->
>    SKIP [68] (Intel XE#4733 [67] / Intel XE#7417 [66]) +1 other test
>    skip
>  *=20
>    igt@xe_query@multigpu-query-hwconfig:shard-bmg: NOTRUN -> SKIP [65]
>    (Intel XE#944 [64]) +1 other test skip
>  *=20
>    igt@xe_query@multigpu-query-invalid-query:shard-ptl: NOTRUN -> SKIP
>    [63] (Intel XE#6019 [62]) +2 other tests skip
>  *=20
>    igt@xe_survivability@i2c-functionality:shard-lnl: NOTRUN -> SKIP
>    [61] (Intel XE#8415 [60])
>  *=20
>    igt@xe_vm@overcommit-fault-vram-lr:shard-ptl: NOTRUN -> SKIP [59]
>    (Intel XE#9597 [58])
> Possible fixes *=20
>    igt@kms_async_flips@alternate-sync-async-flip:shard-bmg: FAIL [57]
>    (Intel XE#3718 [56] / Intel XE#6078 [53]) -> PASS [55]
>  *=20
>    igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:shard-bmg:
>    FAIL [54] (Intel XE#6078 [53]) -> PASS [52]
>  *=20
>    igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:shard-bmg:
>    SKIP [51] (Intel XE#367 [50]) -> PASS [49]
>  *=20
>    igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-edp-1:shard-ptl:
>    FAIL [48] (Intel XE#9673 [47]) -> PASS [46] +1 other test pass
>  *=20
>    igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:shard-lnl:
>    FAIL [45] (Intel XE#301 [41] / Intel XE#3149 [44]) -> PASS [43] +1
>    other test pass
>  *=20
>    igt@kms_flip@flip-vs-expired-vblank@b-edp1:shard-lnl: FAIL [42]
>    (Intel XE#301 [41]) -> PASS [40] +2 other tests pass
>  *=20
>    igt@kms_hdmi_audio_bw@audio-bw-hblank80:shard-bmg: FAIL [39] (Intel
>    XE#9313 [38]) -> PASS [37]
>  *=20
>    igt@kms_hdmi_inject@inject-audio:shard-ptl: SKIP [36] (Intel XE#7308
>    [35]) -> PASS [34]
>  *=20
>    igt@kms_joiner@invalid-modeset-force-big-joiner:shard-lnl: SKIP [33]
>    (Intel XE#7086 [32] / Intel XE#7390 [31]) -> PASS [30]
>  *=20
>    igt@kms_pm_dc@dc5-dpms-suspend-resume:shard-lnl: FAIL [29] (Intel
>    XE#8399 [28]) -> PASS [27]
>  *=20
>    igt@xe_exec_threads@threads-hang-userptr-invalidate-race:shard-lnl:
>    FAIL [26] (Intel XE#9096 [25]) -> PASS [24]
>  *=20
>    igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:shard-bmg:
>    ABORT [23] (Intel XE#6652 [22] / Intel XE#9470 [21]) -> PASS [20]
>  *=20
>    igt@xe_pm@s4-basic:shard-lnl: DMESG-WARN [19] (Intel XE#7727 [18]) -
>    > PASS [17]
>  *=20
>    igt@xe_pm@s4-mocs:shard-ptl: ABORT [16] (Intel XE#9362 [13]) -> PASS
>    [15] +1 other test pass
>  *=20
>    igt@xe_pm@s4-vm-bind-prefetch:shard-lnl: ABORT [14] (Intel XE#9362
>    [13]) -> PASS [12]
> Warnings *=20
>    igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:shard-lnl: SKIP
>    [11] (Intel XE#3414 [10] / Intel XE#3904 [8] / Intel XE#7342 [7]) ->
>    SKIP [9] (Intel XE#3904 [8] / Intel XE#7342 [7]) +12 other tests
>    skip
>  *=20
>    igt@kms_tiled_display@basic-test-pattern-with-chamelium:shard-bmg:
>    SKIP [6] (Intel XE#2509 [5] / Intel XE#7437 [4]) -> SKIP [3] (Intel
>    XE#2426 [2] / Intel XE#5848 [1])
> Build changes * IGT: IGT_9163 -> IGT_9164
>  * Linux: xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a -> xe-pw-
>    172330v5
> IGT_9163: 9163
> IGT_9164: 9164
> xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a:
> d56ff005f0d16ec136ee31fe3238eb447fefdc1a
> xe-pw-172330v5: 172330v5

[1] Intel XE#5848
    https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
[2] Intel XE#2426
    https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
[3] SKIP
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-8/ig=
t@kms_tiled_display@basic-test-pattern-with-chamelium.html
[4] Intel XE#7437
    https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
[5] Intel XE#2509
    https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
[6] SKIP
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-6010-d56ff005f0d16ec136ee3=
1fe3238eb447fefdc1a/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-wi=
th-chamelium.html
[7] Intel XE#7342
    https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
[8] Intel XE#3904
    https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
[9] SKIP
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-3/ig=
t@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
[10] Intel XE#3414
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
[11] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-6010-d56ff005f0d16ec136ee=
31fe3238eb447fefdc1a/shard-lnl-6/igt@kms_rotation_crc@primary-y-tiled-refle=
ct-x-90.html
[12] PASS
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-4/i=
gt@xe_pm@s4-vm-bind-prefetch.html
[13] Intel XE#9362
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
[14] ABORT
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-6010-d56ff005f0d16ec136ee=
31fe3238eb447fefdc1a/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
[15] PASS
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-7/i=
gt@xe_pm@s4-mocs.html
[16] ABORT
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-6010-d56ff005f0d16ec136ee=
31fe3238eb447fefdc1a/shard-ptl-3/igt@xe_pm@s4-mocs.html
[17] PASS
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-4/i=
gt@xe_pm@s4-basic.html
[18] Intel XE#7727
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
[19] DMESG-WARN
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-6010-d56ff005f0d16ec136ee=
31fe3238eb447fefdc1a/shard-lnl-5/igt@xe_pm@s4-basic.html
[20] PASS
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-2/i=
gt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
[21] Intel XE#9470
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/9470
[22] Intel XE#6652
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
[23] ABORT
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-6010-d56ff005f0d16ec136ee=
31fe3238eb447fefdc1a/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_g=
uc_ct_send_recv.html
[24] PASS
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-3/i=
gt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
[25] Intel XE#9096
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
[26] FAIL
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-6010-d56ff005f0d16ec136ee=
31fe3238eb447fefdc1a/shard-lnl-6/igt@xe_exec_threads@threads-hang-userptr-i=
nvalidate-race.html
[27] PASS
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-5/i=
gt@kms_pm_dc@dc5-dpms-suspend-resume.html
[28] Intel XE#8399
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
[29] FAIL
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-6010-d56ff005f0d16ec136ee=
31fe3238eb447fefdc1a/shard-lnl-8/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
[30] PASS
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-4/i=
gt@kms_joiner@invalid-modeset-force-big-joiner.html
[31] Intel XE#7390
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/7390
[32] Intel XE#7086
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086
[33] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-6010-d56ff005f0d16ec136ee=
31fe3238eb447fefdc1a/shard-lnl-4/igt@kms_joiner@invalid-modeset-force-big-j=
oiner.html
[34] PASS
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-8/i=
gt@kms_hdmi_inject@inject-audio.html
[35] Intel XE#7308
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
[36] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-6010-d56ff005f0d16ec136ee=
31fe3238eb447fefdc1a/shard-ptl-4/igt@kms_hdmi_inject@inject-audio.html
[37] PASS
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-7/i=
gt@kms_hdmi_audio_bw@audio-bw-hblank80.html
[38] Intel XE#9313
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/9313
[39] FAIL
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-6010-d56ff005f0d16ec136ee=
31fe3238eb447fefdc1a/shard-bmg-10/igt@kms_hdmi_audio_bw@audio-bw-hblank80.h=
tml
[40] PASS
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-5/i=
gt@kms_flip@flip-vs-expired-vblank@b-edp1.html
[41] Intel XE#301
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
[42] FAIL
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-6010-d56ff005f0d16ec136ee=
31fe3238eb447fefdc1a/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1=
.html
[43] PASS
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-3/i=
gt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
[44] Intel XE#3149
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
[45] FAIL
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-6010-d56ff005f0d16ec136ee=
31fe3238eb447fefdc1a/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interr=
uptible@c-edp1.html
[46] PASS
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-2/i=
gt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-edp-1.html
[47] Intel XE#9673
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/9673
[48] FAIL
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-6010-d56ff005f0d16ec136ee=
31fe3238eb447fefdc1a/shard-ptl-3/igt@kms_cursor_edge_walk@256x256-top-botto=
m@pipe-a-edp-1.html
[49] PASS
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-7/i=
gt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html
[50] Intel XE#367
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
[51] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-6010-d56ff005f0d16ec136ee=
31fe3238eb447fefdc1a/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-target=
-2560x1440p.html
[52] PASS
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-3/i=
gt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html
[53] Intel XE#6078
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
[54] FAIL
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-6010-d56ff005f0d16ec136ee=
31fe3238eb447fefdc1a/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-f=
lip@pipe-a-dp-2.html
[55] PASS
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-3/i=
gt@kms_async_flips@alternate-sync-async-flip.html
[56] Intel XE#3718
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
[57] FAIL
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-6010-d56ff005f0d16ec136ee=
31fe3238eb447fefdc1a/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-f=
lip.html
[58] Intel XE#9597
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/9597
[59] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-4/i=
gt@xe_vm@overcommit-fault-vram-lr.html
[60] Intel XE#8415
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415
[61] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-2/i=
gt@xe_survivability@i2c-functionality.html
[62] Intel XE#6019
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
[63] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-6/i=
gt@xe_query@multigpu-query-invalid-query.html
[64] Intel XE#944
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
[65] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-2/i=
gt@xe_query@multigpu-query-hwconfig.html
[66] Intel XE#7417
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
[67] Intel XE#4733
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
[68] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-6/i=
gt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html
[69] Intel XE#9254
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254
[70] FAIL
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-2/i=
gt@xe_pm_residency@gt-c6-freeze@gt0.html
[71] PASS
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-6010-d56ff005f0d16ec136ee=
31fe3238eb447fefdc1a/shard-bmg-10/igt@xe_pm_residency@gt-c6-freeze@gt0.html
[72] Intel XE#7370
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
[73] Intel XE#2284
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
[74] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-6/i=
gt@xe_pm@s2idle-d3cold-basic-exec.html
[75] Intel XE#5741
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741
[76] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-8/i=
gt@xe_pm@s2idle-d3cold-basic-exec.html
[77] Intel XE#7695
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
[78] FAIL
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-6/i=
gt@xe_pat@pat-sw-hw-compare.html
[79] FAIL
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-1/i=
gt@xe_pat@pat-sw-hw-compare.html
[80] Intel XE#7590
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
[81] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-2/i=
gt@xe_pat@l2-flush-opt-svm-pat-restrict.html
[82] Intel XE#6964
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
[83] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-8/i=
gt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html
[84] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-1/i=
gt@xe_multigpu_svm@mgpu-concurrent-access-basic.html
[85] Intel XE#7408
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
[86] Intel XE#5100
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
[87] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-2/i=
gt@xe_mmap@pci-membarrier.html
[88] Intel XE#7980
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980
[89] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-4/i=
gt@xe_madvise@atomic-global.html
[90] Intel XE#8378
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
[91] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-1/i=
gt@xe_exec_threads@threads-multi-queue-hang-basic.html
[92] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-2/i=
gt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html
[93] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-3/i=
gt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate.html
[94] Intel XE#6196
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
[95] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-3/i=
gt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma.ht=
ml
[96] Intel XE#8369
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
[97] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-3/i=
gt@xe_exec_reset@multi-queue-cat-error-on-secondary.html
[98] Intel XE#8652
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652
[99] DMESG-WARN
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-8/i=
gt@xe_exec_reset@gt-stress-reset-bo-invalidation.html
[100] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-6010-d56ff005f0d16ec136e=
e31fe3238eb447fefdc1a/shard-ptl-1/igt@xe_exec_reset@gt-stress-reset-bo-inva=
lidation.html
[101] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-7/=
igt@xe_exec_reset@cm-multi-queue-close-fd.html
[102] Intel XE#8364
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
[103] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-6/=
igt@xe_exec_multi_queue@one-queue-preempt-mode-priority-smem.html
[104] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-4/=
igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority.html
[105] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-6/=
igt@xe_exec_multi_queue@few-execs-preempt-mode-priority.html
[106] Intel XE#9003
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/9003
[107] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-7/=
igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr.html
[108] Intel XE#8374
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
[109] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-2/=
igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race.html
[110] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-4/=
igt@xe_exec_fault_mode@once-multi-queue-invalid-fault.html
[111] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-3/=
igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-fault.html
[112] Intel XE#7484
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
[113] Intel XE#5575
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
[114] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-6/=
igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
[115] Intel XE#1392
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
[116] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-2/=
igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html
[117] Intel XE#7372
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
[118] Intel XE#2322
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
[119] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-7/=
igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html
[120] Intel XE#7482
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
[121] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-2/=
igt@xe_exec_balancer@once-parallel-userptr-rebind.html
[122] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-2/=
igt@xe_exec_balancer@no-exec-virtual-rebind.html
[123] Intel XE#688
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
[124] Intel XE#6540
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
[125] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-6/=
igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html
[126] Intel XE#8355
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
[127] Intel XE#6321
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
[128] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-10=
/igt@xe_evict@evict-mixed-many-threads-small.html
[129] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-6010-d56ff005f0d16ec136e=
e31fe3238eb447fefdc1a/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-sm=
all.html
[130] Intel XE#5764
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
[131] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-7/=
igt@xe_evict@evict-large-external.html
[132] Intel XE#5878
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/5878
[133] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-6/=
igt@xe_create@multigpu-create-massive-size.html
[134] Intel XE#8428
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/8428
[135] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-2/=
igt@xe_configfs@survivability-mode.html
[136] Intel XE#8868
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
[137] ABORT
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-1/=
igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html
[138] Intel XE#7397
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
[139] Intel XE#4227
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
[140] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-7/=
igt@kms_vrr@flip-dpms@pipe-a-edp-1.html
[141] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-6010-d56ff005f0d16ec136e=
e31fe3238eb447fefdc1a/shard-ptl-4/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html
[142] Intel XE#8695
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695
[143] Intel XE#1435
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
[144] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-3/=
igt@kms_setmode@invalid-clone-exclusive-crtc.html
[145] Intel XE#5910
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/5910
[146] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-2/=
igt@kms_setmode@invalid-clone-exclusive-crtc.html
[147] Intel XE#5813
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
[148] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-3/=
igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
[149] Intel XE#5821
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
[150] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-3/=
igt@kms_rotation_crc@bad-pixel-format.html
[151] Intel XE#1406
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
[152] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-3/=
igt@kms_psr@pr-dpms.html
[153] Intel XE#5835
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835
[154] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-8/=
igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html
[155] Intel XE#2850
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
[156] Intel XE#2234
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
[157] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-6/=
igt@kms_psr@fbc-psr2-sprite-blt.html
[158] Intel XE#1489
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
[159] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-7/=
igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
[160] Intel XE#7304
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
[161] Intel XE#5858
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
[162] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-4/=
igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1.html
[163] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-8/=
igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html
[164] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-6/=
igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
[165] Intel XE#7395
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395
[166] Intel XE#2029
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
[167] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-4/=
igt@kms_pm_dc@deep-pkgc.html
[168] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-6010-d56ff005f0d16ec136e=
e31fe3238eb447fefdc1a/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
[169] Intel XE#8396
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
[170] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-3/=
igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888.html
[171] Intel XE#8395
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
[172] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-3/=
igt@kms_pm_dc@dc3co-framedrop-check.html
[173] Intel XE#7760
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
[174] Intel XE#7376
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
[175] Intel XE#2938
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
[176] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-2/=
igt@kms_pm_backlight@brightness-with-dpms.html
[177] Intel XE#6886
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
[178] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-5/=
igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d.html
[179] Intel XE#2763
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
[180] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-5/=
igt@kms_plane_scaling@planes-downscale-factor-0-5.html
[181] Intel XE#7343
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
[182] Intel XE#5879
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/5879
[183] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-2/=
igt@kms_plane_scaling@2x-scaler-multi-pipe.html
[184] Intel XE#5020
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
[185] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-3/=
igt@kms_plane_multiple@tiling-yf.html
[186] Intel XE#5854
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
[187] Intel XE#4596
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
[188] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-4/=
igt@kms_plane_multiple@2x-tiling-none.html
[189] Intel XE#5946
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/5946
[190] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-3/=
igt@kms_plane_lowres@tiling-x.html
[191] Intel XE#7283
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
[192] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-10=
/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html
[193] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-1/=
igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html
[194] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-6/=
igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html
[195] Intel XE#8348
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348
[196] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-1/=
igt@kms_mst@mst-suspend-read-crc.html
[197] Intel XE#7466
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
[198] Intel XE#6911
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
[199] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-9/=
igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
[200] Intel XE#6900
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
[201] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-7/=
igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
[202] Intel XE#6901
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
[203] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-3/=
igt@kms_joiner@basic-big-joiner.html
[204] Intel XE#9312
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312
[205] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-1/=
igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html
[206] Intel XE#7865
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
[207] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-5/=
igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-render.html
[208] Intel XE#2313
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
[209] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-10=
/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
[210] Intel XE#7061
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
[211] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-8/=
igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render.html
[212] Intel XE#7905
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
[213] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-8/=
igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-msflip-blt.html
[214] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-4/=
igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt.html
[215] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-5/=
igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc.html
[216] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-3/=
igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-blt.html
[217] Intel XE#6312
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
[218] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-6/=
igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-blt.html
[219] Intel XE#2311
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
[220] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-2/=
igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html
[221] Intel XE#651
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
[222] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-2/=
igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt.html
[223] Intel XE#4141
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
[224] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-3/=
igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
[225] Intel XE#7356
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
[226] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-3/=
igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt.html
[227] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-6/=
igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt.html
[228] Intel XE#5812
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
[229] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-6/=
igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html
[230] Intel XE#656
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
[231] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-6/=
igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
[232] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-8/=
igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-msflip-blt.html
[233] Intel XE#5800
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
[234] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-7/=
igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
[235] Intel XE#7351
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
[236] Intel XE#7178
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
[237] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-5/=
igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html
[238] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-4/=
igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
[239] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-8/=
igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
[240] Intel XE#2316
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
[241] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-4/=
igt@kms_flip@2x-plain-flip-interruptible.html
[242] Intel XE#7344
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
[243] Intel XE#1138
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
[244] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-10=
/igt@kms_feature_discovery@display-4x.html
[245] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-1/=
igt@kms_feature_discovery@display-4x.html
[246] Intel XE#7359
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359
[247] Intel XE#2372
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
[248] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-1/=
igt@kms_feature_discovery@chamelium.html
[249] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-4/=
igt@kms_feature_discovery@chamelium.html
[250] Intel XE#8265
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
[251] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-2/=
igt@kms_dsc@dsc-with-output-formats-with-bpc.html
[252] Intel XE#9533
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/9533
[253] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-6/=
igt@kms_dp_link_training@uhbr-mst.html
[254] Intel XE#7809
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
[255] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-10=
/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
[256] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-6010-d56ff005f0d16ec136e=
e31fe3238eb447fefdc1a/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-ato=
mic-transitions.html
[257] Intel XE#309
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
[258] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-5/=
igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
[259] Intel XE#5962
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
[260] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-3/=
igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
[261] Intel XE#7355
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
[262] Intel XE#2321
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
[263] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-7/=
igt@kms_cursor_crc@cursor-sliding-512x512.html
[264] Intel XE#5900
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
[265] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-6/=
igt@kms_cursor_crc@cursor-sliding-32x32.html
[266] Intel XE#1424
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
[267] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-2/=
igt@kms_cursor_crc@cursor-random-256x85.html
[268] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-3/=
igt@kms_cursor_crc@cursor-onscreen-512x170.html
[269] Intel XE#2320
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
[270] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-4/=
igt@kms_cursor_crc@cursor-onscreen-32x10.html
[271] Intel XE#7439
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
[272] Intel XE#6707
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
[273] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-7/=
igt@kms_content_protection@uevent@pipe-a-dp-1.html
[274] Intel XE#7374
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
[275] Intel XE#3304
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
[276] Intel XE#1178
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
[277] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-2/=
igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html
[278] Intel XE#7642
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
[279] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-3/=
igt@kms_content_protection@legacy.html
[280] Intel XE#6974
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
[281] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-4/=
igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
[282] Intel XE#2390
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
[283] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-9/=
igt@kms_content_protection@dp-mst-lic-type-1.html
[284] Intel XE#5832
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/5832
[285] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-2/=
igt@kms_content_protection@dp-mst-lic-type-1.html
[286] Intel XE#6969
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
[287] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-7/=
igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-3.html
[288] Intel XE#2252
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
[289] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-6/=
igt@kms_chamelium_edid@dp-mode-timings.html
[290] Intel XE#7358
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
[291] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-2/=
igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
[292] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-8/=
igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d=
.html
[293] Intel XE#8391
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
[294] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-5/=
igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim.html
[295] Intel XE#306
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
[296] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-2/=
igt@kms_chamelium_color@ctm-0-50.html
[297] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-1/=
igt@kms_chamelium_audio@hdmi-audio-after-suspend.html
[298] Intel XE#2887
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
[299] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-2/=
igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html
[300] Intel XE#2652
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
[301] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-7/=
igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-dp-1.html
[302] Intel XE#3432
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
[303] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-2/=
igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
[304] Intel XE#5822
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
[305] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-5/=
igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
[306] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-3/=
igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
[307] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-7/=
igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html
[308] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-8/=
igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html
[309] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-6010-d56ff005f0d16ec136e=
e31fe3238eb447fefdc1a/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-targe=
t-1920x1080p.html
[310] Intel XE#7679
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
[311] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-1/=
igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html
[312] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-8/=
igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html
[313] Intel XE#1124
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
[314] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-3/=
igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
[315] Intel XE#5808
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
[316] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-8/=
igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
[317] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-4/=
igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
[318] Intel XE#7361
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
[319] Intel XE#607
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
[320] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-10=
/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
[321] Intel XE#1407
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
[322] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-8/=
igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
[323] Intel XE#5901
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
[324] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-5/=
igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
[325] DMESG-WARN
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-1/=
igt@kms_joiner@basic-force-big-joiner.html
[326] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-6010-d56ff005f0d16ec136e=
e31fe3238eb447fefdc1a/shard-lnl-1/igt@kms_joiner@basic-force-big-joiner.htm=
l
[327] DMESG-WARN
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-1/=
igt@kms_joiner@basic-force-big-joiner@single.html
[328] DMESG-WARN
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-3/=
igt@kms_joiner@basic-force-big-joiner.html
[329] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-6010-d56ff005f0d16ec136e=
e31fe3238eb447fefdc1a/shard-ptl-6/igt@kms_joiner@basic-force-big-joiner.htm=
l
[330] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-8/=
igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
[331] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-6010-d56ff005f0d16ec136e=
e31fe3238eb447fefdc1a/shard-ptl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bp=
p-rotate-180-async-flip.html

--=-D2E4oz0FqB4t2EF0HoLG
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head>
 =20
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
<style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head>
<body><div>Hi,</div><div><br></div><div>The Xe.CI.FULL run for my series "d=
rm/i915/display: reduce clock_gating interface between core and display" (r=
ev5) reported some possible regressions:</div><div><br></div><div>  <a href=
=3D"https://patchwork.freedesktop.org/series/172330/">https://patchwork.fre=
edesktop.org/series/172330/</a></div><div>  <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-172330v5/index.html">https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-172330v5/index.html</a></div><div><br></div><div>I do=
n't think they're related to my changes.  The same failures show up in runs=
 for other, unrelated series:</div><div><br></div><div>1. <a href=3D"mailto=
:igt@kms">igt@kms</a><a href=3D"mailto:_joiner@basic-force-big-joiner">_joi=
ner@basic-force-big-joiner</a> (shard-ptl, DMESG-WARN)</div><div>&nbsp; &nb=
sp;&nbsp;<a href=3D"mailto:igt@kms">igt@kms</a><a href=3D"mailto:_joiner@ba=
sic-force-big-joiner">_joiner@basic-force-big-joiner</a>@single (shard-lnl,=
 DMESG-WARN)</div><div><br></div><div>   The log is flooded with "[CRTC:354=
:pipe B] DSB 0 response timeout" followed by "DSB 0 timed out waiting for i=
dle". &nbsp;These two</div><div>   series fail in exactly the same way on b=
oth PTL and LNL:</div><div><br></div><div>   xe-pw-176818v1 ("drm/i915/cmtg=
: Fix CMTG disable timeout in hsw_crtc_disable()", same xe-6010 base):</div=
><div>     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17681=
8v1/shard-ptl-3/igt@kms_joiner@basic-force-big-joiner.html">https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-176818v1/shard-ptl-3/igt@kms_joiner@basic-=
force-big-joiner.html</a></div><div>     <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-176818v1/shard-lnl-3/igt@kms_joiner@basic-force-bi=
g-joiner@single.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17681=
8v1/shard-lnl-3/igt@kms_joiner@basic-force-big-joiner@single.html</a></div>=
<div><br></div><div>   xe-pw-176714v1 ("drm/i915/psr: PSR2 and Panel Replay=
 with the joiner", xe-6002 base):</div><div>     <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-176714v1/shard-ptl-2/igt@kms_joiner@basic-=
force-big-joiner.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1767=
14v1/shard-ptl-2/igt@kms_joiner@basic-force-big-joiner.html</a></div><div> =
    <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176714v1/sha=
rd-lnl-4/igt@kms_joiner@basic-force-big-joiner@single.html">https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-176714v1/shard-lnl-4/igt@kms_joiner@basic-=
force-big-joiner@single.html</a></div><div><br></div><div>   So it looks li=
ke a new issue in the base tree, not something caused by these patches.</di=
v><div><br></div><div>2. <a href=3D"mailto:igt@kms">igt@kms</a><a href=3D"m=
ailto:_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip">_big_fb@4-=
tiled-max-hw-stride-64bpp-rotate-180-async-flip</a>&nbsp;(shard-ptl, FAIL)<=
/div><div><br></div><div>   "CRC failure with async flip, crc shouldn't mat=
ch for checked round", with no kernel warnings.  The same PASS -&gt; FAIL h=
appened on</div><div>   an Xe BO series that doesn't touch display:</div><d=
iv><br></div><div>   xe-pw-176571v1 ("drm/xe/bo: Add xe_bo_addr_iter"):</di=
v><div>     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1765=
71v1/shard-ptl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-asyn=
c-flip.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard=
-ptl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.htm=
l</a></div><div><br></div><div>Could you please add filters for these failu=
res and re-report the results for the series?</div><div><br></div><div>Anal=
ysis assisted by Claude Opus 5.5.</div><div><br></div><div>Thanks!</div><di=
v><br></div><div>--</div><div>Cheers,</div><div>Luca.</div><div><br></div><=
div><br></div><div>On Mon, 2026-10-26 at 15:16 +0000, Patchwork wrote:</div=
><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729=
fcf solid;padding-left:1ex"><div><b>Patch Details</b></div>
<div><table>
<tbody><tr><td><b>Series:</b></td><td>drm/i915/display: reduce clock_gating=
 interface between core and display (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/172330/">https://patchwork.freedesktop.org/series/172330/</a></td></tr=
>
<tr><td><b>State:</b></td><td>failure</td></tr> <tr><td><b>Details:</b></td=
><td><a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/in=
dex.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/index.ht=
ml</a></td></tr></tbody></table> </div><h1>CI Bug Log - changes from xe-601=
0-d56ff005f0d16ec136ee31fe3238eb447fefdc1a_FULL -&gt; xe-pw-172330v5_FULL</=
h1><h2>Summary</h2><p><strong>FAILURE</strong></p><p>Serious unknown change=
s coming with xe-pw-172330v5_FULL absolutely need to be<br> verified manual=
ly.</p><p>If you think the reported changes have nothing to do with the cha=
nges<br> introduced in xe-pw-172330v5_FULL, please notify your bug team (I9=
15-ci-infra@lists.freedesktop.org) to allow them<br> to document this new f=
ailure mode, which will reduce false positives in CI.</p><h2>Participating =
hosts (3 -&gt; 3)</h2><p>No changes in participating hosts</p><h2>Possible =
new issues</h2><p>Here are the unknown changes that may have been introduce=
d in xe-pw-172330v5_FULL:</p><h3>IGT changes</h3><h4>Possible regressions</=
h4><ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p><ul=
>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a/shard-ptl-5/igt@kms_big_=
fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-pt=
l-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">=
FAIL</a></li>
</ul></li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p><ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a/shard-ptl-6/igt@kms_join=
er@basic-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-3/igt@kms_joiner@basic-fo=
rce-big-joiner.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul></li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner@single:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-lnl-1/igt@kms_joiner@basic-force-big-jo=
iner@single.html">DMESG-WARN</a></li>
</ul></li>
</ul><h4>Warnings</h4><ul>
<li>igt@kms_joiner@basic-force-big-joiner:<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a/shard-lnl-1/igt@kms_join=
er@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7086">Intel XE#7086</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7390">Intel XE#7390</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-l=
nl-1/igt@kms_joiner@basic-force-big-joiner.html">DMESG-WARN</a></li>
</ul></li>
</ul><h2>Known issues</h2><p>Here are the changes found in xe-pw-172330v5_F=
ULL that come from known issues:</p><h3>IGT changes</h3><h4>Issues hit</h4>=
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-5/igt@kms_big_fb@4-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/5901">Intel XE#5901</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-lnl-8/igt@kms_big_fb@x-tiled-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1407">Intel XE#1407</a>)</li>
</ul></li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-10/igt@kms_big_fb@y-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/607">Intel XE#607</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>)</li>
</ul></li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-8/igt@kms_big_fb@yf-tiled-64bpp-rot=
ate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5808">Intel XE#5808</a>) +6 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-4/igt@kms_big_fb@yf-tiled-64bpp-rot=
ate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</=
p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other =
test skip</li>
</ul></li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-8/igt@kms_bw@connected-linear-tilin=
g-3-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul></li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-1/igt@kms_bw@connected-linear-tilin=
g-4-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul></li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a/shard-bmg-7/igt@kms_bw@l=
inear-tiling-1-displays-target-1920x1080p.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-8/igt@kms=
_bw@linear-tiling-1-displays-target-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</=
li>
</ul></li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-7/igt@kms_bw@linear-tiling-4-displa=
ys-target-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul></li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-lnl-3/igt@kms_ccs@bad-pixel-format-yf-t=
iled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-5/igt@kms_ccs@crc-primary-rotation-=
180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +5 other tests ski=
p</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-dp-1:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-b-dp-1.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +3 other tests skip=
</li>
</ul></li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-y-=
tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-after-suspend:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-1/igt@kms_chamelium_audio@hdmi-audi=
o-after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-lnl-2/igt@kms_chamelium_color@ctm-0-50.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/306">Intel XE#306</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul></li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim:</=
p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-5/igt@kms_chamelium_color_pipeline@=
plane-fixed-matrix-yuv-rgb-bt601-lim.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8391">Intel XE#8391</a>) +3 other =
tests skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lu=
t1d:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-8/igt@kms_chamelium_color_pipeline@=
plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 =
other test skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-lnl-2/igt@kms_chamelium_color_pipeline@=
plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul></li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-6/igt@kms_chamelium_edid@dp-mode-ti=
mings.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-3:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-7/igt@kms_color_pipeline@plane-lut1=
d-ctm3x4@pipe-a-plane-3.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +7 other tests skip</l=
i>
</ul></li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-9/igt@kms_content_protection@dp-mst=
-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-2/igt@kms_content_protection@dp-mst=
-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5832">Intel XE#5832</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-4/igt@kms_content_protection@dp-mst=
-type-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@legacy:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-lnl-3/igt@kms_content_protection@legacy=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7642">Intel XE#7642</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-2/igt@kms_content_protection@lic-ty=
pe-0-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374=
</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-1:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-7/igt@kms_content_protection@uevent=
@pipe-a-dp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6707">Intel XE#6707</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-4/igt@kms_cursor_crc@cursor-onscree=
n-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-lnl-3/igt@kms_cursor_crc@cursor-onscree=
n-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-lnl-2/igt@kms_cursor_crc@cursor-random-=
256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1424">Intel XE#1424</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-6/igt@kms_cursor_crc@cursor-sliding=
-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/5900">Intel XE#5900</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding=
-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-3/igt@kms_cursor_legacy@cursora-vs-=
flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5962">Intel XE#5962</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-=
flipa-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a/shard-bmg-10/igt@kms_cur=
sor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-10/i=
gt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809">Intel XE#7=
809</a>)</li>
</ul></li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-6/igt@kms_dp_link_training@uhbr-mst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/9533">Intel XE#9533</a>)</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-lnl-2/igt@kms_dsc@dsc-with-output-forma=
ts-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-1/igt@kms_feature_discovery@chameli=
um.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2372">Intel XE#2372</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7359">Intel XE#7359</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-4/igt@kms_feature_discovery@chameli=
um.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7359">Intel XE#7359</a>)</li>
</ul></li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-10/igt@kms_feature_discovery@displa=
y-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1138">Intel XE#1138</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-1/igt@kms_feature_discovery@display=
-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7344">Intel XE#7344</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-4/igt@kms_flip@2x-plain-flip-interr=
uptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p=
><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bp=
p-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351=
</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-8/igt@kms_flip_scaled_crc@flip-32bp=
p-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +1 other t=
est skip</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p><u=
l>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)=
</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-7/igt@kms_frontbuffer_tracking@drrs=
-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +6 other=
 tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-msflip-blt:</p><u=
l>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-8/igt@kms_frontbuffer_tracking@drrs=
hdr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +7 other test=
s skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +4 othe=
r tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:</p>=
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-6/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +46 other t=
ests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-=
abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-6/igt@kms_frontbuffer_tracking@fbc-=
abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other te=
st skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-=
shrfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:</p><u=
l>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</=
li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:</=
p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +22 other=
 tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-blt:<=
/p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-blt:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc:</p><ul=
>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests=
 skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt:</p><ul=
>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-4/igt@kms_frontbuffer_tracking@fbch=
dr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +13 other test=
s skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-msflip-blt:</p><ul=
>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-lnl-8/igt@kms_frontbuffer_tracking@fbch=
dr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +8 other tests=
 skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcp=
srhdr-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test sk=
ip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-10/igt@kms_frontbuffer_tracking@psr=
-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +14 other tests =
skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-render:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-lnl-5/igt@kms_frontbuffer_tracking@psrh=
dr-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +4 other tests skip</=
li>
</ul></li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-1/igt@kms_hdmi_audio_bw@suspend-mem=
-audio-recovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/9312">Intel XE#9312</a>)</li>
</ul></li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-lnl-3/igt@kms_joiner@basic-big-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6901">Intel XE#6901</a>)</li>
</ul></li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-9/igt@kms_joiner@invalid-modeset-fo=
rce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-7/igt@kms_joiner@invalid-modeset-fo=
rce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6900">Intel XE#6900</a>)</li>
</ul></li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-1/igt@kms_mst@mst-suspend-read-crc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8348">Intel XE#8348</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-lnl-6/igt@kms_plane@pixel-format-4-tile=
d-bmg-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-10/igt@kms_plane@pixel-format-4-til=
ed-dg2-rc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-1/igt@kms_plane@pixel-format-4-tile=
d-dg2-rc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-3/igt@kms_plane_lowres@tiling-x.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/5946">Intel XE#5946</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-4/igt@kms_plane_multiple@2x-tiling-=
none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4596">Intel XE#4596</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-3/igt@kms_plane_multiple@tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5020">Intel XE#5020</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-2/igt@kms_plane_scaling@2x-scaler-m=
ulti-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5879">Intel XE#5879</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-lnl-5/igt@kms_plane_scaling@planes-down=
scale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other tests =
skip</li>
</ul></li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d:<=
/p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-5/igt@kms_plane_scaling@planes-down=
scale-factor-0-5-unity-scaling@pipe-d.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other=
 tests skip</li>
</ul></li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-2/igt@kms_pm_backlight@brightness-w=
ith-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2938">Intel XE#2938</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-3/igt@kms_pm_dc@dc3co-framedrop-che=
ck.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/8395">Intel XE#8395</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-3/igt@kms_pm_dc@dc3co-framedrop-che=
ck@psr2-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p><ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a/shard-lnl-3/igt@kms_pm_d=
c@deep-pkgc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-172330v5/shard-lnl-4/igt@kms_pm_dc@deep-pkgc.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Int=
el XE#2029</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7395">Intel XE#7395</a>)</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-6/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7304">Intel XE#7304</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</=
p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-8/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a>) +1 other =
test skip</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:<=
/p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-4/igt@kms_psr2_sf@fbc-psr2-primary-=
plane-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304=
</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-7/igt@kms_psr2_sf@psr2-primary-plan=
e-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests ski=
p</li>
</ul></li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-6/igt@kms_psr@fbc-psr2-sprite-blt.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2850">Intel XE#2850</a>) +5 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt@edp-1:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-8/igt@kms_psr@fbc-psr2-sprite-blt@e=
dp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5835">Intel XE#5835</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr@pr-dpms:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-3/igt@kms_psr@pr-dpms.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Int=
el XE#1406</a>)</li>
</ul></li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-3/igt@kms_rotation_crc@bad-pixel-fo=
rmat.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5821">Intel XE#5821</a>)</li>
</ul></li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-3/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul></li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-3/igt@kms_setmode@invalid-clone-exc=
lusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1435">Intel XE#1435</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8695">Intel XE#8695</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-2/igt@kms_setmode@invalid-clone-exc=
lusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5910">Intel XE#5910</a>)</li>
</ul></li>
<li>
<p>igt@kms_vrr@flip-dpms@pipe-a-edp-1:</p><ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a/shard-ptl-4/igt@kms_vrr@=
flip-dpms@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-7/igt@kms_vrr@flip-dpms@pipe=
-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4227">Intel XE#4227</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +3 other tests fail</li=
>
</ul></li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-1/igt@sriov_basic@pf-unbind-with-vf=
s-enabled-numvfs-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8868">Intel XE#8868</a>)</li>
</ul></li>
<li>
<p>igt@xe_configfs@survivability-mode:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-2/igt@xe_configfs@survivability-mod=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/8428">Intel XE#8428</a>)</li>
</ul></li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-6/igt@xe_create@multigpu-create-mas=
sive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5878">Intel XE#5878</a>)</li>
</ul></li>
<li>
<p>igt@xe_evict@evict-large-external:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-7/igt@xe_evict@evict-large-external=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5764">Intel XE#5764</a>) +5 other tests skip</li>
</ul></li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a/shard-bmg-10/igt@xe_evic=
t@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-10/igt@xe_evict@ev=
ict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a=
>)</li>
</ul></li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-lnl-6/igt@xe_evict_ccs@evict-overcommit=
-parallel-instantfree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 ot=
her test skip</li>
</ul></li>
<li>
<p>igt@xe_exec_balancer@no-exec-virtual-rebind:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-lnl-2/igt@xe_exec_balancer@no-exec-virt=
ual-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7482">Intel XE#7482</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@xe_exec_balancer@once-parallel-userptr-rebind:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-2/igt@xe_exec_balancer@once-paralle=
l-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7482">Intel XE#7482</a>) +6 other tests skip</li>
</ul></li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +3 other =
tests skip</li>
</ul></li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>=
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul></li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-6/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>) +3 o=
ther tests skip</li>
</ul></li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-fault:</p><ul=
>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-3/igt@xe_exec_fault_mode@many-execq=
ueues-multi-queue-invalid-fault.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests=
 skip</li>
</ul></li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-invalid-fault:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-lnl-4/igt@xe_exec_fault_mode@once-multi=
-queue-invalid-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race:</p><ul=
>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-2/igt@xe_exec_fault_mode@twice-mult=
i-queue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 other test =
skip</li>
</ul></li>
<li>
<p>igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-7/igt@xe_exec_mix_modes@exec-multi-=
queue-spinner-interrupted-lr.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/9003">Intel XE#9003</a>)</li>
</ul></li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-priority:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-6/igt@xe_exec_multi_queue@few-execs=
-preempt-mode-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +11 other tests skip</l=
i>
</ul></li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-4/igt@xe_exec_multi_queue@many-exec=
s-preempt-mode-dyn-priority.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +7 other tests ski=
p</li>
</ul></li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-priority-smem:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-lnl-6/igt@xe_exec_multi_queue@one-queue=
-preempt-mode-priority-smem.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +3 other tests ski=
p</li>
</ul></li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-close-fd:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-7/igt@xe_exec_reset@cm-multi-queue-=
close-fd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8369">Intel XE#8369</a>)</li>
</ul></li>
<li>
<p>igt@xe_exec_reset@gt-stress-reset-bo-invalidation:</p><ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a/shard-ptl-1/igt@xe_exec_=
reset@gt-stress-reset-bo-invalidation.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-8/igt@xe_exec=
_reset@gt-stress-reset-bo-invalidation.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8652">Intel XE#8652</a>)</=
li>
</ul></li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error-on-secondary:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-lnl-3/igt@xe_exec_reset@multi-queue-cat=
-error-on-secondary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul></li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vm=
a:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-3/igt@xe_exec_system_allocator@pat-=
index-madvise-pat-idx-uc-comp-single-vma.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
</ul></li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate:</p><ul=
>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-3/igt@xe_exec_threads@threads-multi=
-queue-cm-fd-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +4 other tests=
 skip</li>
</ul></li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-lnl-2/igt@xe_exec_threads@threads-multi=
-queue-cm-shared-vm-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul></li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-hang-basic:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-1/igt@xe_exec_threads@threads-multi=
-queue-hang-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +5 other tests skip</li>
</ul></li>
<li>
<p>igt@xe_madvise@atomic-global:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-lnl-4/igt@xe_madvise@atomic-global.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7980">Intel XE#7980</a>)</li>
</ul></li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-2/igt@xe_mmap@pci-membarrier.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/51=
00">Intel XE#5100</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7408">Intel XE#7408</a>)</li>
</ul></li>
<li>
<p>igt@xe_multigpu_svm@mgpu-concurrent-access-basic:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-lnl-1/igt@xe_multigpu_svm@mgpu-concurre=
nt-access-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul></li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-8/igt@xe_multigpu_svm@mgpu-latency-=
copy-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul></li>
<li>
<p>igt@xe_pat@l2-flush-opt-svm-pat-restrict:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-2/igt@xe_pat@l2-flush-opt-svm-pat-r=
estrict.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7590">Intel XE#7590</a>)</li>
</ul></li>
<li>
<p>igt@xe_pat@pat-sw-hw-compare:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-6/igt@xe_pat@pat-sw-hw-compare.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7695">Intel XE#7695</a>) +1 other test fail</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-1/igt@xe_pat@pat-sw-hw-compare.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7695">Intel XE#7695</a>)</li>
</ul></li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-6/igt@xe_pm@s2idle-d3cold-basic-exe=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-8/igt@xe_pm@s2idle-d3cold-basic-exe=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5741">Intel XE#5741</a>)</li>
</ul></li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a/shard-bmg-10/igt@xe_pm_r=
esidency@gt-c6-freeze@gt0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-2/igt@xe_pm_residency@gt-=
c6-freeze@gt0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/9254">Intel XE#9254</a>) +1 other test fail</li>
</ul></li>
<li>
<p>igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-6/igt@xe_pxp@regular-src-to-pxp-des=
t-rendercopy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +1 other test skip<=
/li>
</ul></li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-bmg-2/igt@xe_query@multigpu-query-hwcon=
fig.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-6/igt@xe_query@multigpu-query-inval=
id-query.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6019">Intel XE#6019</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@xe_survivability@i2c-functionality:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-lnl-2/igt@xe_survivability@i2c-function=
ality.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8415">Intel XE#8415</a>)</li>
</ul></li>
<li>
<p>igt@xe_vm@overcommit-fault-vram-lr:</p><ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172330v5/shard-ptl-4/igt@xe_vm@overcommit-fault-vram-l=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/9597">Intel XE#9597</a>)</li>
</ul></li>
</ul><h4>Possible fixes</h4><ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a/shard-bmg-9/igt@kms_asyn=
c_flips@alternate-sync-async-flip.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5=
/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a></=
li>
</ul></li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a/shard-bmg-9/igt@kms_asyn=
c_flips@alternate-sync-async-flip@pipe-a-dp-2.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/s=
hard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">=
PASS</a></li>
</ul></li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a/shard-bmg-8/igt@kms_bw@l=
inear-tiling-1-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-b=
mg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">PASS</a></=
li>
</ul></li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-edp-1:</p><ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a/shard-ptl-3/igt@kms_curs=
or_edge_walk@256x256-top-bottom@pipe-a-edp-1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/9673">Intel XE#9673</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/sh=
ard-ptl-2/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-edp-1.html">PA=
SS</a> +1 other test pass</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p><ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE=
#3149</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-172330v5/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-e=
dp1.html">PASS</a> +1 other test pass</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p><ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-5/igt@km=
s_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> +2 other tests pass</li=
>
</ul></li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank80:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a/shard-bmg-10/igt@kms_hdm=
i_audio_bw@audio-bw-hblank80.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/9313">Intel XE#9313</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-bmg-7/igt@km=
s_hdmi_audio_bw@audio-bw-hblank80.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p><ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a/shard-ptl-4/igt@kms_hdmi=
_inject@inject-audio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7308">Intel XE#7308</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-8/igt@kms_hdmi_i=
nject@inject-audio.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p><ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a/shard-lnl-4/igt@kms_join=
er@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7086">Intel XE#7086</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7390">Intel XE#7390=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1723=
30v5/shard-lnl-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS=
</a></li>
</ul></li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-suspend-resume:</p><ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a/shard-lnl-8/igt@kms_pm_d=
c@dc5-dpms-suspend-resume.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-5/igt@kms_p=
m_dc@dc5-dpms-suspend-resume.html">PASS</a></li>
</ul></li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p><ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a/shard-lnl-6/igt@xe_exec_=
threads@threads-hang-userptr-invalidate-race.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/sh=
ard-lnl-3/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">PA=
SS</a></li>
</ul></li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a/shard-bmg-2/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9470">Inte=
l XE#9470</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-172330v5/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_s=
end_recv.html">PASS</a></li>
</ul></li>
<li>
<p>igt@xe_pm@s4-basic:</p><ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a/shard-lnl-5/igt@xe_pm@s4=
-basic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7727">Intel XE#7727</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-4/igt@xe_pm@s4-basic.htm=
l">PASS</a></li>
</ul></li>
<li>
<p>igt@xe_pm@s4-mocs:</p><ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a/shard-ptl-3/igt@xe_pm@s4=
-mocs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/9362">Intel XE#9362</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-172330v5/shard-ptl-7/igt@xe_pm@s4-mocs.html">PASS=
</a> +1 other test pass</li>
</ul></li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p><ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a/shard-lnl-2/igt@xe_pm@s4=
-vm-bind-prefetch.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/shard-lnl-4/igt@xe_pm@s4-vm-=
bind-prefetch.html">PASS</a></li>
</ul></li>
</ul><h4>Warnings</h4><ul>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p><ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a/shard-lnl-6/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342"=
>Intel XE#7342</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-172330v5/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect=
-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +12 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a/shard-bmg-1/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel X=
E#7437</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-172330v5/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2426">Intel XE#2426</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul></li>
</ul><h2>Build changes</h2><ul>
<li>IGT: IGT_9163 -&gt; IGT_9164</li>
<li>Linux: xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a -&gt; xe-pw-172=
330v5</li>
</ul><p>IGT_9163: 9163<br> IGT_9164: 9164<br> xe-6010-d56ff005f0d16ec136ee3=
1fe3238eb447fefdc1a: d56ff005f0d16ec136ee31fe3238eb447fefdc1a<br> xe-pw-172=
330v5: 172330v5</p></blockquote></body></html>

--=-D2E4oz0FqB4t2EF0HoLG--

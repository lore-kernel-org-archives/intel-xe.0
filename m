Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05289FF885A
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 09:23:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B485610EA25;
	Tue,  5 May 2026 09:23:51 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8145210EA1C
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 09:23:49 +0000 (UTC)
Received: from 37-219-152-235.nat.bb.dnainternet.fi ([37.219.152.235]
 helo=[192.168.101.111])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1wKC0F-00000004rnF-3OiH; Tue, 05 May 2026 12:23:47 +0300
Message-ID: <26076c773a3dea3bc54f55a026de36dd50e08d08.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: I915-ci-infra@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Luca Coelho <luciano.coelho@intel.com>
Date: Tue, 05 May 2026 12:23:42 +0300
In-Reply-To: <177741286820.22699.5138585782196992906@5ab824fced77>
References: <20260428095104.818360-1-luciano.coelho@intel.com>
 <177741286820.22699.5138585782196992906@5ab824fced77>
Content-Type: multipart/alternative; boundary="=-jSN5NokdFAvjcSKybwe6"
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
Subject: Re: =?UTF-8?Q?=E2=9C=97?= Xe.CI.FULL: failure for drm/i915: move
 more display dependencies from i915 (rev5)
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--=-jSN5NokdFAvjcSKybwe6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Same thing as with the results for i915 (intel-gfx). =C2=A0This test is not
related to the changes I made in this series, so can this be re-
reported, please?

--
Cheers,
Luca.


On Tue, 2026-04-28 at 21:47 +0000, Patchwork wrote:
> Patch Details
>=20
> Series:drm/i915: move more display dependencies from i915 (rev5)
>=20
> URL:https://patchwork.freedesktop.org/series/163785/
>=20
> State:failure
> Details:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/index.html
> CI Bug Log - changes from xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153c=
c_FULL -> xe-pw-163785v5_FULLSummaryWARNING
> Minor unknown changes coming with xe-pw-163785v5_FULL need to be
> verified
> manually.
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-163785v5_FULL, please notify your bug team (I915-
> ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives
> in CI.
> Participating hosts (2 -> 2)No changes in participating hosts
> Possible new issuesHere are the unknown changes that may have been introd=
uced in xe-pw-
> 163785v5_FULL:
> IGT changesWarnings * igt@xe_module_load@load:shard-bmg:          (PASS [=
301], PASS [301],ABORT[30
>    2], PASS [300], PASS [301], PASS [300], PASS [300], PASS [295], PASS
>    [295], PASS [296], PASS [296], PASS [296], PASS [299], PASS [299],
>    PASS [299], PASS [298], PASS [298], PASS [297], PASS [297], PASS
>    [297], PASS [296], PASS [295]) -> (ABORT [287], PASS [293], PASS
>    [294], PASS [294], PASS [294], PASS [293], PASS [292], PASS [292],
>    PASS [292], PASS [291], PASS [291], PASS [290], PASS [290], PASS
>    [291], PASS [289], PASS [290], SKIP [289], PASS [289], PASS [289],
>    PASS [288], PASS [288], PASS [288], ABORT [287]) (Intel XE#2457
>    [286] / Intel XE#7405 [285])
> New testsNew tests have been introduced between xe-4945-
> 58d98cc42c584c191cd8399a8d0b710c6f6153cc_FULL and xe-pw-
> 163785v5_FULL:
> New IGT tests (2) *=20
>    igt@kms_cursor_edge_walk@128x128-right-edge@pipe-a-dp-2:Statuses : 1
>    pass(s)Exec time: [3.41] s
>  *=20
>    igt@kms_cursor_edge_walk@128x128-right-edge@pipe-d-dp-2:Statuses : 1
>    pass(s)Exec time: [3.29] s
> Known issuesHere are the changes found in xe-pw-163785v5_FULL that come f=
rom
> known issues:
> IGT changesIssues hit *=20
>    igt@kms_big_fb@linear-64bpp-rotate-90:shard-bmg: NOTRUN -> SKIP
>    [284] (Intel XE#2327 [122]) +1 other test skip
>  *=20
>    igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:shard-bmg:
>    NOTRUN -> SKIP [283] (Intel XE#7059 [282] / Intel XE#7085 [281])
>  *=20
>    igt@kms_big_fb@y-tiled-32bpp-rotate-270:shard-bmg: NOTRUN -> SKIP
>    [280] (Intel XE#1124 [119]) +8 other tests skip
>  *=20
>    igt@kms_big_fb@yf-tiled-16bpp-rotate-180:shard-lnl: NOTRUN -> SKIP
>    [279] (Intel XE#1124 [119]) +1 other test skip
>  *=20
>    igt@kms_big_fb@yf-tiled-addfb:shard-bmg: NOTRUN -> SKIP [278] (Intel
>    XE#2328 [277] / Intel XE#7367 [276])
>  *=20
>    igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:shard-lnl: NOTRUN
>    -> SKIP [275] (Intel XE#2887 [116]) +1 other test skip
>  *=20
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:shard-bmg: NOTRUN
>    -> SKIP [274] (Intel XE#3432 [113])
>  *=20
>    igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:shard-bmg: NOTRUN ->
>    SKIP [273] (Intel XE#2887 [116]) +11 other tests skip
>  *=20
>    igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:shard-lnl: NOTRUN ->
>    SKIP [272] (Intel XE#2669 [271] / Intel XE#7389 [270]) +3 other
>    tests skip
>  *=20
>    igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:shard-bmg:
>    NOTRUN -> SKIP [269] (Intel XE#2652 [268]) +8 other tests skip
>  *=20
>    igt@kms_cdclk@mode-transition:shard-bmg: NOTRUN -> SKIP [267] (Intel
>    XE#2724 [266] / Intel XE#7449 [265])
>  *=20
>    igt@kms_chamelium_color@ctm-blue-to-red:shard-bmg: NOTRUN -> SKIP
>    [264] (Intel XE#2325 [263] / Intel XE#7358 [262]) +1 other test skip
>  *=20
>    igt@kms_chamelium_edid@dp-edid-change-during-hibernate:shard-bmg:
>    NOTRUN -> SKIP [261] (Intel XE#2252 [110]) +5 other tests skip
>  *=20
>    igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:shard-
>    bmg: NOTRUN -> SKIP [260] (Intel XE#6969 [258]) +10 other tests skip
>  *=20
>    igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:shard-
>    bmg: NOTRUN -> SKIP [259] (Intel XE#6969 [258] / Intel XE#7006
>    [257]) +1 other test skip
>  *=20
>    igt@kms_content_protection@dp-mst-type-0-suspend-resume:shard-bmg:
>    NOTRUN -> SKIP [256] (Intel XE#6974 [255])
>  *=20
>    igt@kms_content_protection@suspend-resume@pipe-a-dp-2:shard-bmg:
>    NOTRUN -> FAIL [254] (Intel XE#1178 [104] / Intel XE#3304 [103] /
>    Intel XE#7374 [102]) +2 other tests fail
>  *=20
>    igt@kms_content_protection@uevent:shard-bmg: NOTRUN -> FAIL [253]
>    (Intel XE#6707 [252] / Intel XE#7439 [251]) +1 other test fail
>  *=20
>    igt@kms_cursor_crc@cursor-onscreen-32x10:shard-bmg: NOTRUN -> SKIP
>    [250] (Intel XE#2320 [99]) +1 other test skip
>  *=20
>    igt@kms_cursor_crc@cursor-sliding-256x85:shard-lnl: NOTRUN -> SKIP
>    [249] (Intel XE#1424 [248])
>  *=20
>    igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:shard-lnl: NOTRUN ->
>    SKIP [247] (Intel XE#309 [246] / Intel XE#7343 [245])
>  *=20
>    igt@kms_cursor_legacy@flip-vs-cursor-atomic:shard-bmg: NOTRUN ->
>    FAIL [244] (Intel XE#7571 [243])
>  *=20
>    igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:shard-
>    bmg: NOTRUN -> SKIP [242] (Intel XE#2286 [241] / Intel XE#6035
>    [240])
>  *=20
>    igt@kms_dp_link_training@uhbr-mst:shard-bmg: NOTRUN -> SKIP [239]
>    (Intel XE#4354 [238] / Intel XE#7386 [237])
>  *=20
>    igt@kms_dsc@dsc-fractional-bpp:shard-bmg: NOTRUN -> SKIP [236]
>    (Intel XE#2244 [235]) +1 other test skip
>  *=20
>    igt@kms_flip@blocking-wf_vblank@a-dp2:shard-bmg: NOTRUN -> FAIL
>    [234] (Intel XE#6266 [233]) +1 other test fail
>  *=20
>    igt@kms_flip@flip-vs-expired-vblank@a-edp1:shard-lnl: PASS [232] ->
>    FAIL [231] (Intel XE#301 [136])
>  *=20
>    igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-
>    upscaling:shard-bmg: NOTRUN -> SKIP [230] (Intel XE#7178 [88] /
>    Intel XE#7351 [87]) +1 other test skip
>  *=20
>    igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-
>    downscaling:shard-bmg: NOTRUN -> SKIP [229] (Intel XE#7178 [88] /
>    Intel XE#7349 [228])
>  *=20
>    igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:shard-bmg:
>    NOTRUN -> SKIP [227] (Intel XE#2311 [74]) +25 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:shard-
>    bmg: NOTRUN -> SKIP [226] (Intel XE#4141 [82]) +8 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt:shard-bmg:
>    NOTRUN -> SKIP [225] (Intel XE#7061 [79] / Intel XE#7356 [78]) +2
>    other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-
>    blt:shard-lnl: NOTRUN -> SKIP [224] (Intel XE#656 [223])
>  *=20
>    igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-
>    wc:shard-bmg: NOTRUN -> SKIP [222] (Intel XE#2313 [71]) +24 other
>    tests skip
>  *=20
>    igt@kms_hdr@brightness-with-hdr:shard-bmg: NOTRUN -> SKIP [221]
>    (Intel XE#3374 [220] / Intel XE#3544 [219])
>  *=20
>    igt@kms_joiner@basic-ultra-joiner:shard-bmg: NOTRUN -> SKIP [218]
>    (Intel XE#6911 [217] / Intel XE#7378 [216]) +1 other test skip
>  *=20
>    igt@kms_joiner@invalid-modeset-force-big-joiner:shard-lnl: NOTRUN ->
>    SKIP [215] (Intel XE#7086 [214] / Intel XE#7390 [213])
>  *=20
>    igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-
>    clamping:shard-bmg: NOTRUN -> SKIP [212] (Intel XE#7283 [65]) +2
>    other tests skip
>  *=20
>    igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:shard-
>    bmg: NOTRUN -> SKIP [211] (Intel XE#7130 [210]) +1 other test skip
>  *=20
>    igt@kms_plane_multiple@2x-tiling-4:shard-lnl: NOTRUN -> SKIP [209]
>    (Intel XE#4596 [208] / Intel XE#5854 [207])
>  *=20
>    igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-
>    75@pipe-a:shard-bmg: NOTRUN -> SKIP [206] (Intel XE#2763 [62] /
>    Intel XE#6886 [61]) +3 other tests skip
>  *=20
>    igt@kms_pm_backlight@brightness-with-dpms:shard-bmg: NOTRUN -> SKIP
>    [205] (Intel XE#2938 [204] / Intel XE#7376 [202])
>  *=20
>    igt@kms_pm_backlight@fade:shard-bmg: NOTRUN -> SKIP [203] (Intel
>    XE#7376 [202] / Intel XE#870 [201])
>  *=20
>    igt@kms_pm_dc@dc6-psr:shard-bmg: NOTRUN -> SKIP [200] (Intel XE#7794
>    [199]) +1 other test skip
>  *=20
>    igt@kms_pm_dc@deep-pkgc:shard-bmg: NOTRUN -> SKIP [198] (Intel
>    XE#2505 [197] / Intel XE#7447 [196])
>  *=20
>    igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:shard-bmg:
>    NOTRUN -> SKIP [195] (Intel XE#1489 [54]) +7 other tests skip
>  *=20
>    igt@kms_psr2_su@page_flip-p010:shard-bmg: NOTRUN -> SKIP [194]
>    (Intel XE#2387 [193] / Intel XE#7429 [192])
>  *=20
>    igt@kms_psr@fbc-psr2-cursor-plane-move:shard-bmg: NOTRUN -> SKIP
>    [191] (Intel XE#2234 [51] / Intel XE#2850 [50]) +8 other tests skip
>  *=20
>    igt@kms_psr_stress_test@flip-primary-invalidate-overlay:shard-bmg:
>    NOTRUN -> SKIP [190] (Intel XE#7795 [189])
>  *=20
>    igt@kms_rotation_crc@primary-rotation-270:shard-bmg: NOTRUN -> SKIP
>    [188] (Intel XE#3904 [187] / Intel XE#7342 [186])
>  *=20
>    igt@kms_scaling_modes@scaling-mode-center:shard-bmg: NOTRUN -> SKIP
>    [185] (Intel XE#2413 [184])
>  *=20
>    igt@kms_sharpness_filter@filter-strength:shard-bmg: NOTRUN -> SKIP
>    [183] (Intel XE#6503 [47]) +1 other test skip
>  *=20
>    igt@kms_vrr@max-min:shard-bmg: NOTRUN -> SKIP [182] (Intel XE#1499
>    [181])
>  *=20
>    igt@xe_eudebug@vm-bind-clear:shard-bmg: NOTRUN -> SKIP [180] (Intel
>    XE#7636 [38]) +11 other tests skip
>  *=20
>    igt@xe_eudebug@vma-ufence-faultable:shard-lnl: NOTRUN -> SKIP [179]
>    (Intel XE#7636 [38]) +1 other test skip
>  *=20
>    igt@xe_evict@evict-beng-mixed-many-threads-small:shard-bmg: PASS
>    [178] -> INCOMPLETE [177] (Intel XE#6321 [176])
>  *=20
>    igt@xe_evict@evict-small-multi-queue-priority:shard-bmg: NOTRUN ->
>    SKIP [175] (Intel XE#7140 [35]) +1 other test skip
>  *=20
>    igt@xe_exec_balancer@no-exec-cm-virtual-rebind:shard-lnl: NOTRUN ->
>    SKIP [174] (Intel XE#7482 [173])
>  *=20
>    igt@xe_exec_basic@multigpu-once-null-rebind:shard-bmg: NOTRUN ->
>    SKIP [172] (Intel XE#2322 [32] / Intel XE#7372 [31]) +8 other tests
>    skip
>  *=20
>    igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm:shard-bmg:
>    NOTRUN -> SKIP [171] (Intel XE#7136 [28]) +9 other tests skip
>  *=20
>    igt@xe_exec_fault_mode@once-multi-queue-rebind-prefetch:shard-lnl:
>    NOTRUN -> SKIP [170] (Intel XE#7136 [28])
>  *=20
>    igt@xe_exec_multi_queue@many-execs-close-fd:shard-lnl: NOTRUN ->
>    SKIP [169] (Intel XE#6874 [25]) +1 other test skip
>  *=20
>    igt@xe_exec_multi_queue@max-queues-preempt-mode-basic-smem:shard-
>    bmg: NOTRUN -> SKIP [168] (Intel XE#6874 [25]) +25 other tests skip
>  *=20
>    igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-
>    rebind:shard-lnl: NOTRUN -> SKIP [167] (Intel XE#7138 [22])
>  *=20
>    igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-
>    race:shard-bmg: NOTRUN -> SKIP [166] (Intel XE#7138 [22]) +7 other
>    tests skip
>  *=20
>    igt@xe_multigpu_svm@mgpu-migration-prefetch:shard-bmg: NOTRUN ->
>    SKIP [165] (Intel XE#6964 [164]) +1 other test skip
>  *=20
>    igt@xe_page_reclaim@many-vma-same-bo:shard-bmg: NOTRUN -> SKIP [163]
>    (Intel XE#7793 [16]) +1 other test skip
>  *=20
>    igt@xe_pat@pat-index-xelp:shard-bmg: NOTRUN -> SKIP [162] (Intel
>    XE#2245 [161] / Intel XE#7590 [160])
>  *=20
>    igt@xe_peer2peer@write:shard-bmg: NOTRUN -> SKIP [159] (Intel
>    XE#2427 [158] / Intel XE#6953 [157] / Intel XE#7326 [156] / Intel
>    XE#7353 [155])
>  *=20
>    igt@xe_pm@d3cold-basic-exec:shard-bmg: NOTRUN -> SKIP [154] (Intel
>    XE#2284 [13] / Intel XE#7370 [12])
>  *=20
>    igt@xe_prefetch_fault@prefetch-fault:shard-bmg: NOTRUN -> SKIP [153]
>    (Intel XE#7599 [152])
>  *=20
>    igt@xe_pxp@pxp-stale-bo-exec-post-suspend:shard-bmg: NOTRUN -> SKIP
>    [151] (Intel XE#4733 [6] / Intel XE#7417 [5])
>  *=20
>    igt@xe_query@multigpu-query-invalid-extension:shard-bmg: NOTRUN ->
>    SKIP [150] (Intel XE#944 [1]) +1 other test skip
>  *=20
>    igt@xe_sriov_auto_provisioning@exclusive-ranges:shard-lnl: NOTRUN ->
>    SKIP [149] (Intel XE#4130 [148] / Intel XE#7366 [147])
>  *=20
>    igt@xe_sriov_flr@flr-vf1-clear:shard-bmg: NOTRUN -> FAIL [146]
>    (Intel XE#6569 [145])
>  *=20
>    igt@xe_wedged@wedged-at-any-timeout:shard-bmg: NOTRUN -> DMESG-WARN
>    [144] (Intel XE#5545 [127])
> Possible fixes *=20
>    igt@core_hotunplug@hotreplug-lateclose:shard-bmg: SKIP [143] (Intel
>    XE#6779 [142]) -> PASS [141]
>  *=20
>    igt@intel_hwmon@hwmon-read:shard-bmg: SKIP [140] (Intel XE#5177
>    [139] / Intel XE#6703 [3]) -> PASS [138]
>  *=20
>    igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:shard-lnl:
>    FAIL [137] (Intel XE#301 [136]) -> PASS [135] +1 other test pass
>  *=20
>    igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-
>    huge:shard-bmg: SKIP [134] (Intel XE#6703 [3]) -> PASS [133] +149
>    other tests pass
>  *=20
>    igt@xe_exec_system_allocator@threads-many-mmap-remap:shard-bmg: SKIP
>    [132] (Intel XE#6557 [76] / Intel XE#6703 [3]) -> PASS [131]
>  *=20
>    igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-huge-
>    nomemset:shard-bmg: FAIL [130] -> PASS [129]
>  *=20
>    igt@xe_intel_bb@render@render-linear-256:shard-bmg: ABORT [128]
>    (Intel XE#5545 [127] / Intel XE#6652 [126]) -> PASS [125] +1 other
>    test pass
> Warnings *=20
>    igt@kms_big_fb@4-tiled-8bpp-rotate-90:shard-bmg: SKIP [124] (Intel
>    XE#6703 [3]) -> SKIP [123] (Intel XE#2327 [122]) +1 other test skip
>  *=20
>    igt@kms_big_fb@yf-tiled-16bpp-rotate-270:shard-bmg: SKIP [121]
>    (Intel XE#6703 [3]) -> SKIP [120] (Intel XE#1124 [119]) +2 other
>    tests skip
>  *=20
>    igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:shard-bmg: SKIP
>    [118] (Intel XE#6703 [3]) -> SKIP [117] (Intel XE#2887 [116]) +1
>    other test skip
>  *=20
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:shard-bmg: SKIP
>    [115] (Intel XE#6703 [3]) -> SKIP [114] (Intel XE#3432 [113])
>  *=20
>    igt@kms_chamelium_hpd@dp-hpd-storm:shard-bmg: SKIP [112] (Intel
>    XE#6703 [3]) -> SKIP [111] (Intel XE#2252 [110]) +1 other test skip
>  *=20
>    igt@kms_content_protection@lic-type-1:shard-bmg: SKIP [109] (Intel
>    XE#6703 [3]) -> SKIP [108] (Intel XE#7642 [107])
>  *=20
>    igt@kms_content_protection@suspend-resume:shard-bmg: SKIP [106]
>    (Intel XE#6703 [3]) -> FAIL [105] (Intel XE#1178 [104] / Intel
>    XE#3304 [103] / Intel XE#7374 [102])
>  *=20
>    igt@kms_cursor_crc@cursor-random-32x10:shard-bmg: SKIP [101] (Intel
>    XE#6703 [3]) -> SKIP [100] (Intel XE#2320 [99])
>  *=20
>    igt@kms_cursor_crc@cursor-sliding-512x512:shard-bmg: SKIP [98]
>    (Intel XE#6703 [3]) -> SKIP [97] (Intel XE#2321 [96] / Intel XE#7355
>    [95])
>  *=20
>    igt@kms_fbcon_fbt@fbc-suspend:shard-bmg: SKIP [94] (Intel XE#6703
>    [3]) -> SKIP [93] (Intel XE#4156 [92] / Intel XE#7425 [91])
>  *=20
>    igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-
>    downscaling:shard-bmg: SKIP [90] (Intel XE#6703 [3]) -> SKIP [89]
>    (Intel XE#7178 [88] / Intel XE#7351 [87]) +1 other test skip
>  *=20
>    igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-
>    blt:shard-bmg: SKIP [86] (Intel XE#6703 [3]) -> SKIP [85] (Intel
>    XE#2311 [74]) +4 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:shard-
>    bmg: SKIP [84] (Intel XE#6703 [3]) -> SKIP [83] (Intel XE#4141 [82])
>    +3 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt:shard-bmg:
>    SKIP [81] (Intel XE#6703 [3]) -> SKIP [80] (Intel XE#7061 [79] /
>    Intel XE#7356 [78])
>  *=20
>    igt@kms_frontbuffer_tracking@fbcdrrs-suspend:shard-bmg: SKIP [77]
>    (Intel XE#6557 [76] / Intel XE#6703 [3]) -> SKIP [75] (Intel XE#2311
>    [74])
>  *=20
>    igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:shard-
>    bmg: SKIP [73] (Intel XE#6703 [3]) -> SKIP [72] (Intel XE#2313 [71])
>    +7 other tests skip
>  *=20
>    igt@kms_joiner@invalid-modeset-big-joiner:shard-bmg: SKIP [70]
>    (Intel XE#6703 [3]) -> SKIP [69] (Intel XE#6901 [68])
>  *=20
>    igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-
>    clamping:shard-bmg: SKIP [67] (Intel XE#6703 [3]) -> SKIP [66]
>    (Intel XE#7283 [65]) +1 other test skip
>  *=20
>    igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-
>    75:shard-bmg: SKIP [64] (Intel XE#6703 [3]) -> SKIP [63] (Intel
>    XE#2763 [62] / Intel XE#6886 [61])
>  *=20
>    igt@kms_pm_rpm@package-g7:shard-bmg: SKIP [60] (Intel XE#6703 [3]) -
>    > SKIP [59] (Intel XE#6814 [58] / Intel XE#7428 [57])
>  *=20
>    igt@kms_psr2_sf@psr2-cursor-plane-update-sf:shard-bmg: SKIP [56]
>    (Intel XE#6703 [3]) -> SKIP [55] (Intel XE#1489 [54]) +1 other test
>    skip
>  *=20
>    igt@kms_psr@fbc-psr2-sprite-plane-onoff:shard-bmg: SKIP [53] (Intel
>    XE#6703 [3]) -> SKIP [52] (Intel XE#2234 [51] / Intel XE#2850 [50])
>    +1 other test skip
>  *=20
>    igt@kms_sharpness_filter@invalid-filter-with-plane:shard-bmg: SKIP
>    [49] (Intel XE#6703 [3]) -> SKIP [48] (Intel XE#6503 [47])
>  *=20
>    igt@kms_tiled_display@basic-test-pattern:shard-bmg: SKIP [46] (Intel
>    XE#2426 [45] / Intel XE#5848 [44]) -> FAIL [43] (Intel XE#1729 [42]
>    / Intel XE#7424 [41])
>  *=20
>    igt@xe_eudebug_online@single-step:shard-bmg: SKIP [40] (Intel
>    XE#6703 [3]) -> SKIP [39] (Intel XE#7636 [38]) +2 other tests skip
>  *=20
>    igt@xe_evict@evict-small-multi-queue:shard-bmg: SKIP [37] (Intel
>    XE#6703 [3]) -> SKIP [36] (Intel XE#7140 [35])
>  *=20
>    igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:shard-bmg:
>    SKIP [34] (Intel XE#6703 [3]) -> SKIP [33] (Intel XE#2322 [32] /
>    Intel XE#7372 [31]) +2 other tests skip
>  *=20
>    igt@xe_exec_fault_mode@many-multi-queue-rebind:shard-bmg: SKIP [30]
>    (Intel XE#6703 [3]) -> SKIP [29] (Intel XE#7136 [28]) +2 other tests
>    skip
>  *=20
>    igt@xe_exec_multi_queue@one-queue-preempt-mode-basic-smem:shard-bmg:
>    SKIP [27] (Intel XE#6703 [3]) -> SKIP [26] (Intel XE#6874 [25]) +6
>    other tests skip
>  *=20
>    igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate-
>    race:shard-bmg: SKIP [24] (Intel XE#6703 [3]) -> SKIP [23] (Intel
>    XE#7138 [22]) +2 other tests skip
>  *=20
>    igt@xe_non_msix@walker-interrupt-notification-non-msix:shard-bmg:
>    SKIP [21] (Intel XE#6703 [3]) -> SKIP [20] (Intel XE#7622 [19])
>  *=20
>    igt@xe_page_reclaim@binds-null-vma:shard-bmg: SKIP [18] (Intel
>    XE#6703 [3]) -> SKIP [17] (Intel XE#7793 [16])
>  *=20
>    igt@xe_pm@d3cold-mocs:shard-bmg: SKIP [15] (Intel XE#6703 [3]) ->
>    SKIP [14] (Intel XE#2284 [13] / Intel XE#7370 [12])
>  *=20
>    igt@xe_pmu@fn-engine-activity-load:shard-bmg: SKIP [11] (Intel
>    XE#6703 [3]) -> FAIL [10] (Intel XE#5937 [9])
>  *=20
>    igt@xe_pxp@pxp-stale-queue-post-termination-irq:shard-bmg: SKIP [8]
>    (Intel XE#6703 [3]) -> SKIP [7] (Intel XE#4733 [6] / Intel XE#7417
>    [5])
>  *=20
>    igt@xe_query@multigpu-query-topology-l3-bank-mask:shard-bmg: SKIP
>    [4] (Intel XE#6703 [3]) -> SKIP [2] (Intel XE#944 [1])
> {name}: This element is suppressed. This means it is ignored when
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> Build changes * Linux: xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc -=
> xe-pw-
>    163785v5
> IGT_8874: 4568b2c141ab630c34f8eb2b9afab8cbf8f3ce9e @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc:
> 58d98cc42c584c191cd8399a8d0b710c6f6153cc
> xe-pw-163785v5: 163785v5


[1] Intel XE#944
    https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
[2] SKIP
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/ig=
t@xe_query@multigpu-query-topology-l3-bank-mask.html
[3] Intel XE#6703
    https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
[4] SKIP
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd83=
99a8d0b710c6f6153cc/shard-bmg-2/igt@xe_query@multigpu-query-topology-l3-ban=
k-mask.html
[5] Intel XE#7417
    https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
[6] Intel XE#4733
    https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
[7] SKIP
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/ig=
t@xe_pxp@pxp-stale-queue-post-termination-irq.html
[8] SKIP
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd83=
99a8d0b710c6f6153cc/shard-bmg-2/igt@xe_pxp@pxp-stale-queue-post-termination=
-irq.html
[9] Intel XE#5937
    https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
[10] FAIL
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/i=
gt@xe_pmu@fn-engine-activity-load.html
[11] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd8=
399a8d0b710c6f6153cc/shard-bmg-2/igt@xe_pmu@fn-engine-activity-load.html
[12] Intel XE#7370
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
[13] Intel XE#2284
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
[14] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/i=
gt@xe_pm@d3cold-mocs.html
[15] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd8=
399a8d0b710c6f6153cc/shard-bmg-2/igt@xe_pm@d3cold-mocs.html
[16] Intel XE#7793
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
[17] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/i=
gt@xe_page_reclaim@binds-null-vma.html
[18] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd8=
399a8d0b710c6f6153cc/shard-bmg-2/igt@xe_page_reclaim@binds-null-vma.html
[19] Intel XE#7622
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/7622
[20] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/i=
gt@xe_non_msix@walker-interrupt-notification-non-msix.html
[21] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd8=
399a8d0b710c6f6153cc/shard-bmg-2/igt@xe_non_msix@walker-interrupt-notificat=
ion-non-msix.html
[22] Intel XE#7138
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
[23] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/i=
gt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate-race.html
[24] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd8=
399a8d0b710c6f6153cc/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm=
-fd-userptr-invalidate-race.html
[25] Intel XE#6874
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
[26] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/i=
gt@xe_exec_multi_queue@one-queue-preempt-mode-basic-smem.html
[27] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd8=
399a8d0b710c6f6153cc/shard-bmg-2/igt@xe_exec_multi_queue@one-queue-preempt-=
mode-basic-smem.html
[28] Intel XE#7136
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
[29] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/i=
gt@xe_exec_fault_mode@many-multi-queue-rebind.html
[30] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd8=
399a8d0b710c6f6153cc/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-re=
bind.html
[31] Intel XE#7372
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
[32] Intel XE#2322
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
[33] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/i=
gt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html
[34] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd8=
399a8d0b710c6f6153cc/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-userptr=
-invalidate.html
[35] Intel XE#7140
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
[36] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/i=
gt@xe_evict@evict-small-multi-queue.html
[37] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd8=
399a8d0b710c6f6153cc/shard-bmg-2/igt@xe_evict@evict-small-multi-queue.html
[38] Intel XE#7636
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
[39] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/i=
gt@xe_eudebug_online@single-step.html
[40] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd8=
399a8d0b710c6f6153cc/shard-bmg-2/igt@xe_eudebug_online@single-step.html
[41] Intel XE#7424
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
[42] Intel XE#1729
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
[43] FAIL
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-6/i=
gt@kms_tiled_display@basic-test-pattern.html
[44] Intel XE#5848
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
[45] Intel XE#2426
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
[46] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd8=
399a8d0b710c6f6153cc/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.h=
tml
[47] Intel XE#6503
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
[48] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/i=
gt@kms_sharpness_filter@invalid-filter-with-plane.html
[49] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd8=
399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter-wi=
th-plane.html
[50] Intel XE#2850
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
[51] Intel XE#2234
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
[52] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/i=
gt@kms_psr@fbc-psr2-sprite-plane-onoff.html
[53] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd8=
399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_psr@fbc-psr2-sprite-plane-onoff.ht=
ml
[54] Intel XE#1489
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
[55] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/i=
gt@kms_psr2_sf@psr2-cursor-plane-update-sf.html
[56] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd8=
399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_psr2_sf@psr2-cursor-plane-update-s=
f.html
[57] Intel XE#7428
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428
[58] Intel XE#6814
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
[59] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/i=
gt@kms_pm_rpm@package-g7.html
[60] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd8=
399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_pm_rpm@package-g7.html
[61] Intel XE#6886
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
[62] Intel XE#2763
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
[63] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/i=
gt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
[64] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd8=
399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20=
-downscale-factor-0-75.html
[65] Intel XE#7283
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
[66] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/i=
gt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html
[67] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd8=
399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_plane@pixel-format-yf-tiled-ccs-mo=
difier-source-clamping.html
[68] Intel XE#6901
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
[69] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/i=
gt@kms_joiner@invalid-modeset-big-joiner.html
[70] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd8=
399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_joiner@invalid-modeset-big-joiner.=
html
[71] Intel XE#2313
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
[72] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/i=
gt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
[73] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd8=
399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndsc=
rn-indfb-msflip-blt.html
[74] Intel XE#2311
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
[75] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/i=
gt@kms_frontbuffer_tracking@fbcdrrs-suspend.html
[76] Intel XE#6557
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
[77] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd8=
399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-suspe=
nd.html
[78] Intel XE#7356
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
[79] Intel XE#7061
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
[80] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/i=
gt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt.html
[81] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd8=
399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-abgr16161=
6f-draw-blt.html
[82] Intel XE#4141
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
[83] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/i=
gt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
[84] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd8=
399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primsc=
rn-shrfb-plflip-blt.html
[85] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/i=
gt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
[86] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd8=
399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-prims=
crn-cur-indfb-draw-blt.html
[87] Intel XE#7351
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
[88] Intel XE#7178
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
[89] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/i=
gt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
[90] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd8=
399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-t=
o-16bpp-ytile-downscaling.html
[91] Intel XE#7425
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
[92] Intel XE#4156
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
[93] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/i=
gt@kms_fbcon_fbt@fbc-suspend.html
[94] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd8=
399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_fbcon_fbt@fbc-suspend.html
[95] Intel XE#7355
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
[96] Intel XE#2321
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
[97] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/i=
gt@kms_cursor_crc@cursor-sliding-512x512.html
[98] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd8=
399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x512.=
html
[99] Intel XE#2320
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
[100] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/=
igt@kms_cursor_crc@cursor-random-32x10.html
[101] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd=
8399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_cursor_crc@cursor-random-32x10.ht=
ml
[102] Intel XE#7374
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
[103] Intel XE#3304
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
[104] Intel XE#1178
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
[105] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/=
igt@kms_content_protection@suspend-resume.html
[106] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd=
8399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_content_protection@suspend-resume=
.html
[107] Intel XE#7642
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
[108] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/=
igt@kms_content_protection@lic-type-1.html
[109] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd=
8399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_content_protection@lic-type-1.htm=
l
[110] Intel XE#2252
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
[111] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/=
igt@kms_chamelium_hpd@dp-hpd-storm.html
[112] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd=
8399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-storm.html
[113] Intel XE#3432
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
[114] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/=
igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
[115] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd=
8399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-d=
g2-mc-ccs.html
[116] Intel XE#2887
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
[117] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/=
igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
[118] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd=
8399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_ccs@bad-rotation-90-y-tiled-gen12=
-rc-ccs.html
[119] Intel XE#1124
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
[120] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/=
igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
[121] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd=
8399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.=
html
[122] Intel XE#2327
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
[123] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/=
igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
[124] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd=
8399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_big_fb@4-tiled-8bpp-rotate-90.htm=
l
[125] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-10=
/igt@xe_intel_bb@render@render-linear-256.html
[126] Intel XE#6652
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
[127] Intel XE#5545
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
[128] ABORT
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd=
8399a8d0b710c6f6153cc/shard-bmg-2/igt@xe_intel_bb@render@render-linear-256.=
html
[129] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/=
igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-huge-nomemset.html
[130] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd=
8399a8d0b710c6f6153cc/shard-bmg-2/igt@xe_exec_system_allocator@threads-shar=
ed-vm-many-mmap-huge-nomemset.html
[131] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/=
igt@xe_exec_system_allocator@threads-many-mmap-remap.html
[132] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd=
8399a8d0b710c6f6153cc/shard-bmg-2/igt@xe_exec_system_allocator@threads-many=
-mmap-remap.html
[133] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/=
igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge.ht=
ml
[134] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd=
8399a8d0b710c6f6153cc/shard-bmg-2/igt@xe_exec_system_allocator@process-many=
-large-execqueues-mmap-new-huge.html
[135] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-lnl-2/=
igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
[136] Intel XE#301
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
[137] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd=
8399a8d0b710c6f6153cc/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-inter=
ruptible@b-edp1.html
[138] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/=
igt@intel_hwmon@hwmon-read.html
[139] Intel XE#5177
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
[140] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd=
8399a8d0b710c6f6153cc/shard-bmg-2/igt@intel_hwmon@hwmon-read.html
[141] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/=
igt@core_hotunplug@hotreplug-lateclose.html
[142] Intel XE#6779
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
[143] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd=
8399a8d0b710c6f6153cc/shard-bmg-2/igt@core_hotunplug@hotreplug-lateclose.ht=
ml
[144] DMESG-WARN
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/=
igt@xe_wedged@wedged-at-any-timeout.html
[145] Intel XE#6569
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
[146] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-10=
/igt@xe_sriov_flr@flr-vf1-clear.html
[147] Intel XE#7366
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
[148] Intel XE#4130
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
[149] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-lnl-8/=
igt@xe_sriov_auto_provisioning@exclusive-ranges.html
[150] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/=
igt@xe_query@multigpu-query-invalid-extension.html
[151] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-10=
/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
[152] Intel XE#7599
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
[153] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/=
igt@xe_prefetch_fault@prefetch-fault.html
[154] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-10=
/igt@xe_pm@d3cold-basic-exec.html
[155] Intel XE#7353
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
[156] Intel XE#7326
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
[157] Intel XE#6953
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
[158] Intel XE#2427
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
[159] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/=
igt@xe_peer2peer@write.html
[160] Intel XE#7590
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
[161] Intel XE#2245
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
[162] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/=
igt@xe_pat@pat-index-xelp.html
[163] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/=
igt@xe_page_reclaim@many-vma-same-bo.html
[164] Intel XE#6964
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
[165] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-10=
/igt@xe_multigpu_svm@mgpu-migration-prefetch.html
[166] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-10=
/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html
[167] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-lnl-8/=
igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind.html
[168] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/=
igt@xe_exec_multi_queue@max-queues-preempt-mode-basic-smem.html
[169] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-lnl-8/=
igt@xe_exec_multi_queue@many-execs-close-fd.html
[170] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-lnl-8/=
igt@xe_exec_fault_mode@once-multi-queue-rebind-prefetch.html
[171] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/=
igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm.html
[172] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-10=
/igt@xe_exec_basic@multigpu-once-null-rebind.html
[173] Intel XE#7482
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
[174] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-lnl-8/=
igt@xe_exec_balancer@no-exec-cm-virtual-rebind.html
[175] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/=
igt@xe_evict@evict-small-multi-queue-priority.html
[176] Intel XE#6321
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
[177] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-6/=
igt@xe_evict@evict-beng-mixed-many-threads-small.html
[178] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd=
8399a8d0b710c6f6153cc/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-thread=
s-small.html
[179] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-lnl-8/=
igt@xe_eudebug@vma-ufence-faultable.html
[180] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/=
igt@xe_eudebug@vm-bind-clear.html
[181] Intel XE#1499
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
[182] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-10=
/igt@kms_vrr@max-min.html
[183] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/=
igt@kms_sharpness_filter@filter-strength.html
[184] Intel XE#2413
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
[185] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-10=
/igt@kms_scaling_modes@scaling-mode-center.html
[186] Intel XE#7342
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
[187] Intel XE#3904
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
[188] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-10=
/igt@kms_rotation_crc@primary-rotation-270.html
[189] Intel XE#7795
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795
[190] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/=
igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
[191] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/=
igt@kms_psr@fbc-psr2-cursor-plane-move.html
[192] Intel XE#7429
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
[193] Intel XE#2387
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
[194] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-10=
/igt@kms_psr2_su@page_flip-p010.html
[195] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/=
igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html
[196] Intel XE#7447
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7447
[197] Intel XE#2505
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
[198] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-10=
/igt@kms_pm_dc@deep-pkgc.html
[199] Intel XE#7794
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
[200] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/=
igt@kms_pm_dc@dc6-psr.html
[201] Intel XE#870
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
[202] Intel XE#7376
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
[203] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/=
igt@kms_pm_backlight@fade.html
[204] Intel XE#2938
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
[205] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-10=
/igt@kms_pm_backlight@brightness-with-dpms.html
[206] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/=
igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.htm=
l
[207] Intel XE#5854
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
[208] Intel XE#4596
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
[209] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-lnl-8/=
igt@kms_plane_multiple@2x-tiling-4.html
[210] Intel XE#7130
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
[211] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/=
igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html
[212] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-10=
/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.=
html
[213] Intel XE#7390
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7390
[214] Intel XE#7086
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086
[215] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-lnl-8/=
igt@kms_joiner@invalid-modeset-force-big-joiner.html
[216] Intel XE#7378
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
[217] Intel XE#6911
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
[218] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-10=
/igt@kms_joiner@basic-ultra-joiner.html
[219] Intel XE#3544
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
[220] Intel XE#3374
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
[221] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/=
igt@kms_hdr@brightness-with-hdr.html
[222] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/=
igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
[223] Intel XE#656
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
[224] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-lnl-8/=
igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
[225] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-10=
/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt.html
[226] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/=
igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
[227] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/=
igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html
[228] Intel XE#7349
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
[229] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/=
igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling=
.html
[230] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-10=
/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.htm=
l
[231] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-lnl-6/=
igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
[232] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd=
8399a8d0b710c6f6153cc/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp=
1.html
[233] Intel XE#6266
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
[234] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/=
igt@kms_flip@blocking-wf_vblank@a-dp2.html
[235] Intel XE#2244
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
[236] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/=
igt@kms_dsc@dsc-fractional-bpp.html
[237] Intel XE#7386
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
[238] Intel XE#4354
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
[239] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/=
igt@kms_dp_link_training@uhbr-mst.html
[240] Intel XE#6035
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
[241] Intel XE#2286
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
[242] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/=
igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
[243] Intel XE#7571
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
[244] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/=
igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
[245] Intel XE#7343
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
[246] Intel XE#309
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
[247] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-lnl-8/=
igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
[248] Intel XE#1424
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
[249] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-lnl-8/=
igt@kms_cursor_crc@cursor-sliding-256x85.html
[250] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/=
igt@kms_cursor_crc@cursor-onscreen-32x10.html
[251] Intel XE#7439
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
[252] Intel XE#6707
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
[253] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/=
igt@kms_content_protection@uevent.html
[254] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/=
igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html
[255] Intel XE#6974
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
[256] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/=
igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
[257] Intel XE#7006
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
[258] Intel XE#6969
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
[259] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/=
igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2.html
[260] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/=
igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0.html
[261] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/=
igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
[262] Intel XE#7358
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
[263] Intel XE#2325
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
[264] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/=
igt@kms_chamelium_color@ctm-blue-to-red.html
[265] Intel XE#7449
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
[266] Intel XE#2724
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
[267] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/=
igt@kms_cdclk@mode-transition.html
[268] Intel XE#2652
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
[269] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-10=
/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html
[270] Intel XE#7389
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
[271] Intel XE#2669
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
[272] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-lnl-8/=
igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
[273] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/=
igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html
[274] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/=
igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
[275] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-lnl-8/=
igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
[276] Intel XE#7367
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
[277] Intel XE#2328
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
[278] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-10=
/igt@kms_big_fb@yf-tiled-addfb.html
[279] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-lnl-8/=
igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
[280] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/=
igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
[281] Intel XE#7085
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
[282] Intel XE#7059
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
[283] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/=
igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
[284] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/=
igt@kms_big_fb@linear-64bpp-rotate-90.html
[285] Intel XE#7405
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
[286] Intel XE#2457
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
[287] ABORT
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-5/=
igt@xe_module_load@load.html
[288] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/=
igt@xe_module_load@load.html
[289] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/=
igt@xe_module_load@load.html
[290] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-6/=
igt@xe_module_load@load.html
[291] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/=
igt@xe_module_load@load.html
[292] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-7/=
igt@xe_module_load@load.html
[293] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-10=
/igt@xe_module_load@load.html
[294] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-3/=
igt@xe_module_load@load.html
[295] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd=
8399a8d0b710c6f6153cc/shard-bmg-7/igt@xe_module_load@load.html
[296] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd=
8399a8d0b710c6f6153cc/shard-bmg-2/igt@xe_module_load@load.html
[297] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd=
8399a8d0b710c6f6153cc/shard-bmg-10/igt@xe_module_load@load.html
[298] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd=
8399a8d0b710c6f6153cc/shard-bmg-9/igt@xe_module_load@load.html
[299] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd=
8399a8d0b710c6f6153cc/shard-bmg-8/igt@xe_module_load@load.html
[300] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd=
8399a8d0b710c6f6153cc/shard-bmg-6/igt@xe_module_load@load.html
[301] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd=
8399a8d0b710c6f6153cc/shard-bmg-3/igt@xe_module_load@load.html
[302] ABORT
      https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd=
8399a8d0b710c6f6153cc/shard-bmg-5/igt@xe_module_load@load.html

--=-jSN5NokdFAvjcSKybwe6
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
<body><div>Hi,</div><div><br></div><div>Same thing as with the results for =
i915 (intel-gfx). &nbsp;This test is not related to the changes I made in t=
his series, so can this be re-reported, please?</div><div><br></div><div>--=
</div><div>Cheers,</div><div>Luca.</div><div><br></div><div><br></div><div>=
On Tue, 2026-04-28 at 21:47 +0000, Patchwork wrote:</div><blockquote type=
=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding=
-left:1ex"><div><b>Patch Details</b></div>
<div><table>
<tbody><tr><td><b>Series:</b></td><td>drm/i915: move more display dependenc=
ies from i915 (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/163785/">https://patchwork.freedesktop.org/series/163785/</a></td></tr=
>
<tr><td><b>State:</b></td><td>failure</td></tr> <tr><td><b>Details:</b></td=
><td><a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/in=
dex.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/index.ht=
ml</a></td></tr></tbody></table> </div><h1>CI Bug Log - changes from xe-494=
5-58d98cc42c584c191cd8399a8d0b710c6f6153cc_FULL -&gt; xe-pw-163785v5_FULL</=
h1><h2>Summary</h2><p><strong>WARNING</strong></p><p>Minor unknown changes =
coming with xe-pw-163785v5_FULL need to be verified<br> manually.</p><p>If =
you think the reported changes have nothing to do with the changes<br> intr=
oduced in xe-pw-163785v5_FULL, please notify your bug team (I915-ci-infra@l=
ists.freedesktop.org) to allow them<br> to document this new failure mode, =
which will reduce false positives in CI.</p><h2>Participating hosts (2 -&gt=
; 2)</h2><p>No changes in participating hosts</p><h2>Possible new issues</h=
2><p>Here are the unknown changes that may have been introduced in xe-pw-16=
3785v5_FULL:</p><h3>IGT changes</h3><h4>Warnings</h4><ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-5/igt=
@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-=
bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/sh=
ard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153c=
c/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6=
153cc/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd8399a8d0b710=
c6f6153cc/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd8399a8d0=
b710c6f6153cc/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191cd83=
99a8d0b710c6f6153cc/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584c191=
cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42c584=
c191cd8399a8d0b710c6f6153cc/shard-bmg-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98cc42=
c584c191cd8399a8d0b710c6f6153cc/shard-bmg-8/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-58d98=
cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-8/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4945-5=
8d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-9/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-49=
45-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-9/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-10/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-10/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-10/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bm=
g-7/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-5/igt@xe_module_load@=
load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-163785v5/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-163785v5/shard-bmg-3/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5=
/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-10/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-163785v5/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-7/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-163785v5/shard-bmg-7/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v=
5/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-163785v5/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-6/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v=
5/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-6/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-163785v5/shard-bmg-9/igt@xe_module_load@load.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v=
5/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-163785v5/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-5/i=
gt@xe_module_load@load.html">ABORT</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405</a>)</li>
</ul></li>
</ul><h2>New tests</h2><p>New tests have been introduced between xe-4945-58=
d98cc42c584c191cd8399a8d0b710c6f6153cc_FULL and xe-pw-163785v5_FULL:</p><h3=
>New IGT tests (2)</h3><ul>
<li>
<p>igt@kms_cursor_edge_walk@128x128-right-edge@pipe-a-dp-2:</p><ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.41] s</li>
</ul></li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-right-edge@pipe-d-dp-2:</p><ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.29] s</li>
</ul></li>
</ul><h2>Known issues</h2><p>Here are the changes found in xe-pw-163785v5_F=
ULL that come from known issues:</p><h3>IGT changes</h3><h4>Issues hit</h4>=
<ul>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/igt@kms_big_fb@linear-64bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/igt@kms_big_fb@linear-max-hw-stri=
de-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul></li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/igt@kms_big_fb@y-tiled-32bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-lnl-8/igt@kms_big_fb@yf-tiled-16bpp-rot=
ate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2328">Intel XE#2328</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7367">Intel XE#7367</a>)</li>
</ul></li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-lnl-8/igt@kms_ccs@ccs-on-another-bo-y-t=
iled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-bas=
ic-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +11 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-lnl-8/igt@kms_ccs@random-ccs-data-4-til=
ed-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2669">Intel XE#2669</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) +3 other tests skip</=
li>
</ul></li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-10/igt@kms_ccs@random-ccs-data-4-ti=
led-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +8 other tests skip</l=
i>
</ul></li>
<li>
<p>igt@kms_cdclk@mode-transition:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/igt@kms_cdclk@mode-transition.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2724">Intel XE#2724</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul></li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/igt@kms_chamelium_color@ctm-blue-=
to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-ch=
ange-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +5 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/igt@kms_color_pipeline@plane-lut3=
d-green-only@pipe-b-plane-0.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +10 other tests sk=
ip</li>
</ul></li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/igt@kms_color_pipeline@plane-lut3=
d-green-only@pipe-d-plane-2.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) +1 o=
ther test skip</li>
</ul></li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/igt@kms_content_protection@dp-mst=
-type-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@suspend-resume@pipe-a-dp-2:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/igt@kms_content_protection@suspen=
d-resume@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a=
>) +2 other tests fail</li>
</ul></li>
<li>
<p>igt@kms_content_protection@uevent:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/igt@kms_content_protection@uevent=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6707">Intel XE#6707</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7439">Intel XE#7439</a>) +1 other test fail</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/igt@kms_cursor_crc@cursor-onscree=
n-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding=
-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1424">Intel XE#1424</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-=
flipa-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cur=
sor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7571">Intel XE#7571</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul></li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/igt@kms_dp_link_training@uhbr-mst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4354">Intel XE#4354</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7386">Intel XE#7386</a>)</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/igt@kms_dsc@dsc-fractional-bpp.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-dp2:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/igt@kms_flip@blocking-wf_vblank@a=
-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6266">Intel XE#6266</a>) +1 other test fail</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p><ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-lnl-6/igt@kms_flip@flip-=
vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32b=
pp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#735=
1</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE=
#7349</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs=
-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +25 other tests skip</l=
i>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +8 other tests sk=
ip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc=
drrs-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 oth=
er tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p><=
ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p=
><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-=
1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +24 other =
tests skip</li>
</ul></li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul></li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-10/igt@kms_joiner@basic-ultra-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/6911">Intel XE#6911</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7378">Intel XE#7378</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-lnl-8/igt@kms_joiner@invalid-modeset-fo=
rce-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7086">Intel XE#7086</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7390">Intel XE#7390</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clampin=
g:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-10/igt@kms_plane@pixel-format-4-til=
ed-dg2-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +2 o=
ther tests skip</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/igt@kms_plane@pixel-format-4-tile=
d-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>) +1 other test skip</=
li>
</ul></li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-lnl-8/igt@kms_plane_multiple@2x-tiling-=
4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4596">Intel XE#4596</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:=
</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#688=
6</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-10/igt@kms_pm_backlight@brightness-=
with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2938">Intel XE#2938</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7376">Intel XE#7376</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_backlight@fade:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/igt@kms_pm_backlight@fade.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/737=
6">Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/870">Intel XE#870</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/igt@kms_pm_dc@dc6-psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">I=
ntel XE#7794</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-10/igt@kms_pm_dc@deep-pkgc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505=
">Intel XE#2505</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7447">Intel XE#7447</a>)</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</=
li>
</ul></li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-10/igt@kms_psr2_su@page_flip-p010.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2387">Intel XE#2387</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul></li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/igt@kms_psr@fbc-psr2-cursor-plane=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +8 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/igt@kms_psr_stress_test@flip-prim=
ary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7795">Intel XE#7795</a>)</li>
</ul></li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-10/igt@kms_rotation_crc@primary-rot=
ation-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul></li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-10/igt@kms_scaling_modes@scaling-mo=
de-center.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2413">Intel XE#2413</a>)</li>
</ul></li>
<li>
<p>igt@kms_sharpness_filter@filter-strength:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/igt@kms_sharpness_filter@filter-s=
trength.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_vrr@max-min:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-10/igt@kms_vrr@max-min.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">In=
tel XE#1499</a>)</li>
</ul></li>
<li>
<p>igt@xe_eudebug@vm-bind-clear:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/igt@xe_eudebug@vm-bind-clear.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7636">Intel XE#7636</a>) +11 other tests skip</li>
</ul></li>
<li>
<p>igt@xe_eudebug@vma-ufence-faultable:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-lnl-8/igt@xe_eudebug@vma-ufence-faultab=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7636">Intel XE#7636</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-8/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-6/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li=
>
</ul></li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/igt@xe_evict@evict-small-multi-qu=
eue-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7140">Intel XE#7140</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-virtual-rebind:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-lnl-8/igt@xe_exec_balancer@no-exec-cm-v=
irtual-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7482">Intel XE#7482</a>)</li>
</ul></li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-10/igt@xe_exec_basic@multigpu-once-=
null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +8 other tests skip<=
/li>
</ul></li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/igt@xe_exec_fault_mode@many-execq=
ueues-multi-queue-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +9 other tests skip</li>
</ul></li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-rebind-prefetch:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-lnl-8/igt@xe_exec_fault_mode@once-multi=
-queue-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>)</li>
</ul></li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-close-fd:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-lnl-8/igt@xe_exec_multi_queue@many-exec=
s-close-fd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6874">Intel XE#6874</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-basic-smem:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/igt@xe_exec_multi_queue@max-queue=
s-preempt-mode-basic-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +25 other tests skip=
</li>
</ul></li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-lnl-8/igt@xe_exec_threads@threads-multi=
-queue-mixed-shared-vm-rebind.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>)</li>
</ul></li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:</=
p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-10/igt@xe_exec_threads@threads-mult=
i-queue-mixed-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +7 other=
 tests skip</li>
</ul></li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-prefetch:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-10/igt@xe_multigpu_svm@mgpu-migrati=
on-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@xe_page_reclaim@many-vma-same-bo:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/igt@xe_page_reclaim@many-vma-same=
-bo.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/igt@xe_pat@pat-index-xelp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/224=
5">Intel XE#2245</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7590">Intel XE#7590</a>)</li>
</ul></li>
<li>
<p>igt@xe_peer2peer@write:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/igt@xe_peer2peer@write.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">=
Intel XE#2427</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6953">Intel XE#6953</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul></li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-10/igt@xe_pm@d3cold-basic-exec.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7370">Intel XE#7370</a>)</li>
</ul></li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/igt@xe_prefetch_fault@prefetch-fa=
ult.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7599">Intel XE#7599</a>)</li>
</ul></li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-10/igt@xe_pxp@pxp-stale-bo-exec-pos=
t-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul></li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-9/igt@xe_query@multigpu-query-inval=
id-extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-lnl-8/igt@xe_sriov_auto_provisioning@ex=
clusive-ranges.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4130">Intel XE#4130</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7366">Intel XE#7366</a>)</li>
</ul></li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-10/igt@xe_sriov_flr@flr-vf1-clear.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6569">Intel XE#6569</a>)</li>
</ul></li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163785v5/shard-bmg-8/igt@xe_wedged@wedged-at-any-timeo=
ut.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5545">Intel XE#5545</a>)</li>
</ul></li>
</ul><h4>Possible fixes</h4><ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@core_hot=
unplug@hotreplug-lateclose.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6779">Intel XE#6779</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/igt@core=
_hotunplug@hotreplug-lateclose.html">PASS</a></li>
</ul></li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@intel_hw=
mon@hwmon-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/5177">Intel XE#5177</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/igt@in=
tel_hwmon@hwmon-read.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p><ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-lnl-6/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shar=
d-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS=
</a> +1 other test pass</li>
</ul></li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge=
:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@xe_exec_=
system_allocator@process-many-large-execqueues-mmap-new-huge.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Inte=
l XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-163785v5/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-e=
xecqueues-mmap-new-huge.html">PASS</a> +149 other tests pass</li>
</ul></li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-remap:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@xe_exec_=
system_allocator@threads-many-mmap-remap.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6=
703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
63785v5/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-mmap-remap.ht=
ml">PASS</a></li>
</ul></li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-huge-nomemset:<=
/p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@xe_exec_=
system_allocator@threads-shared-vm-many-mmap-huge-nomemset.html">FAIL</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/sh=
ard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-huge-nom=
emset.html">PASS</a></li>
</ul></li>
<li>
<p>igt@xe_intel_bb@render@render-linear-256:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@xe_intel=
_bb@render@render-linear-256.html">ABORT</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/sha=
rd-bmg-10/igt@xe_intel_bb@render@render-linear-256.html">PASS</a> +1 other =
test pass</li>
</ul></li>
</ul><h4>Warnings</h4><ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_big_=
fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/igt@kms_b=
ig_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test ski=
p</li>
</ul></li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_big_=
fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/igt@km=
s_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other te=
sts skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_ccs@=
bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-=
2/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887=
</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_ccs@=
crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bm=
g-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3=
432</a>)</li>
</ul></li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_cham=
elium_hpd@dp-hpd-storm.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/igt@kms_cham=
elium_hpd@dp-hpd-storm.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_cont=
ent_protection@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/igt@kms_c=
ontent_protection@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_cont=
ent_protection@suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/igt@k=
ms_content_protection@suspend-resume.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374"=
>Intel XE#7374</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_curs=
or_crc@cursor-random-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/igt@kms_=
cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_curs=
or_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/igt@k=
ms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355=
</a>)</li>
</ul></li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_fbco=
n_fbt@fbc-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/igt@kms_fbcon_fbt=
@fbc-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4156">Intel XE#4156</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>=
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_flip=
_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#=
6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
163785v5/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytil=
e-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +1 other test skip=
</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p><ul=
>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#670=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163=
785v5/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1637=
85v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard=
-bmg-2/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Inte=
l XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7356">Intel XE#7356</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/=
shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1637=
85v5/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_join=
er@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/igt@k=
ms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p><ul=
>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_plan=
e@pixel-format-yf-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#670=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163=
785v5/shard-bmg-2/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-c=
lamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p><ul=
>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_plan=
e_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#670=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163=
785v5/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-fact=
or-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_pm_r=
pm@package-g7.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/igt@kms_pm_rpm@packag=
e-g7.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6814">Intel XE#6814</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7428">Intel XE#7428</a>)</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-update-sf:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_psr2=
_sf@psr2-cursor-plane-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/ig=
t@kms_psr2_sf@psr2-cursor-plane-update-sf.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 o=
ther test skip</li>
</ul></li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_psr@=
fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/igt@kms=
_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)=
 +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@kms_shar=
pness_filter@invalid-filter-with-plane.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bm=
g-2/igt@kms_sharpness_filter@invalid-filter-with-plane.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6=
503</a>)</li>
</ul></li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-8/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shar=
d-bmg-6/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">In=
tel XE#7424</a>)</li>
</ul></li>
<li>
<p>igt@xe_eudebug_online@single-step:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@xe_eudeb=
ug_online@single-step.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/igt@xe_eudebu=
g_online@single-step.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@xe_evict@evict-small-multi-queue:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@xe_evict=
@evict-small-multi-queue.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/igt@xe_evi=
ct@evict-small-multi-queue.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>)</li>
</ul></li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@xe_exec_=
basic@multigpu-no-exec-userptr-invalidate.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard=
-bmg-2/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Inte=
l XE#2322</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7372">Intel XE#7372</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-rebind:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@xe_exec_=
fault_mode@many-multi-queue-rebind.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/=
igt@xe_exec_fault_mode@many-multi-queue-rebind.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>)=
 +2 other tests skip</li>
</ul></li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-basic-smem:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@xe_exec_=
multi_queue@one-queue-preempt-mode-basic-smem.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/s=
hard-bmg-2/igt@xe_exec_multi_queue@one-queue-preempt-mode-basic-smem.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/68=
74">Intel XE#6874</a>) +6 other tests skip</li>
</ul></li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate-race:</=
p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@xe_exec_=
threads@threads-multi-queue-cm-fd-userptr-invalidate-race.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel X=
E#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-163785v5/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-fd-userpt=
r-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@xe_non_msix@walker-interrupt-notification-non-msix:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@xe_non_m=
six@walker-interrupt-notification-non-msix.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shar=
d-bmg-2/igt@xe_non_msix@walker-interrupt-notification-non-msix.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7622">In=
tel XE#7622</a>)</li>
</ul></li>
<li>
<p>igt@xe_page_reclaim@binds-null-vma:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@xe_page_=
reclaim@binds-null-vma.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/igt@xe_page_=
reclaim@binds-null-vma.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul></li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@xe_pm@d3=
cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/igt@xe_pm@d3cold-mocs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul></li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@xe_pmu@f=
n-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2/igt@xe_pmu@f=
n-engine-activity-load.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5937">Intel XE#5937</a>)</li>
</ul></li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-termination-irq:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@xe_pxp@p=
xp-stale-queue-post-termination-irq.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg-2=
/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">In=
tel XE#7417</a>)</li>
</ul></li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc/shard-bmg-2/igt@xe_query=
@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163785v5/shard-bmg=
-2/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944<=
/a>)</li>
</ul></li>
</ul><p>{name}: This element is suppressed. This means it is ignored when c=
omputing<br> the status of the difference (SUCCESS, WARNING, or FAILURE).</=
p><h2>Build changes</h2><ul>
<li>Linux: xe-4945-58d98cc42c584c191cd8399a8d0b710c6f6153cc -&gt; xe-pw-163=
785v5</li>
</ul><p>IGT_8874: 4568b2c141ab630c34f8eb2b9afab8cbf8f3ce9e @ https://gitlab=
.freedesktop.org/drm/igt-gpu-tools.git<br> xe-4945-58d98cc42c584c191cd8399a=
8d0b710c6f6153cc: 58d98cc42c584c191cd8399a8d0b710c6f6153cc<br> xe-pw-163785=
v5: 163785v5</p></blockquote><div><br></div><div><span></span></div></body>=
</html>

--=-jSN5NokdFAvjcSKybwe6--

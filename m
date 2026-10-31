Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FAE606A31A
	for <intel-xe@archiver.kernel.org>; Sat, 31 Oct 2026 04:09:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B17F10E1AE;
	Sat, 31 Oct 2026 04:09:36 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC4610E1AE;
 Sat, 31 Oct 2026 04:09:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1793794939035585294=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/dp=2C_drm/i915=3A_conv?=
 =?utf-8?q?ersions_from_seq=5Ffile_to_drm=5Fprinter?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 31 Oct 2026 04:09:35 -0000
Message-ID: <179341977517.97306.10353384718704121026@221881a7231d>
X-Patchwork-Hint: ignore
References: <cover.1793361738.git.jani.nikula@intel.com>
In-Reply-To: <cover.1793361738.git.jani.nikula@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1793794939035585294==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/dp, drm/i915: conversions from seq_file to drm_printer
URL   : https://patchwork.freedesktop.org/series/177252/
State : success

== Summary ==

CI Bug Log - changes from xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20_FULL -> xe-pw-177252v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-177252v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-ptl:          NOTRUN -> [SKIP][1] ([Intel XE#5808])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-ptl-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
    - shard-lnl:          NOTRUN -> [SKIP][2] ([Intel XE#1124])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-lnl-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2652]) +7 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-bmg-10/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][4] ([Intel XE#3304])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-bmg-7/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-1.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][5] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-bmg-10/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [PASS][6] -> [FAIL][7] ([Intel XE#3098] / [Intel XE#3149])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-bmg-10/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][8] ([Intel XE#3098] / [Intel XE#3149])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-bmg-10/igt@kms_flip@2x-plain-flip-ts-check-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-ptl:          NOTRUN -> [SKIP][9] ([Intel XE#5812]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-ptl-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#656] / [Intel XE#7905])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#7905])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-lnl-3/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][12] ([Intel XE#7865])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-ptl-4/igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-mmap-wc.html
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#7865])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-lnl-3/igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-mmap-wc.html

  * igt@xe_exec_balancer@once-virtual-userptr-invalidate:
    - shard-ptl:          NOTRUN -> [SKIP][14] ([Intel XE#7482])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-ptl-4/igt@xe_exec_balancer@once-virtual-userptr-invalidate.html
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#7482])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-lnl-3/igt@xe_exec_balancer@once-virtual-userptr-invalidate.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-close-fd:
    - shard-ptl:          NOTRUN -> [SKIP][16] ([Intel XE#8364])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-ptl-4/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-close-fd.html
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#8364])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-lnl-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-close-fd.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [PASS][18] -> [ABORT][19] ([Intel XE#9362])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20/shard-lnl-7/igt@xe_pm@s4-exec-after.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-lnl-8/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-mocs:
    - shard-bmg:          [PASS][20] -> [ABORT][21] ([Intel XE#9399])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20/shard-bmg-1/igt@xe_pm@s4-mocs.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-bmg-8/igt@xe_pm@s4-mocs.html
    - shard-ptl:          [PASS][22] -> [ABORT][23] ([Intel XE#9362])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20/shard-ptl-1/igt@xe_pm@s4-mocs.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-ptl-7/igt@xe_pm@s4-mocs.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-bmg:          [PASS][24] -> [FAIL][25] ([Intel XE#9254]) +1 other test fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-bmg-2/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [FAIL][26] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:
    - shard-bmg:          [FAIL][28] ([Intel XE#6078]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][30] ([Intel XE#301]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][32] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][33] +1 other test pass
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][34] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][35] +1 other test pass
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_reset@gt-stress-reset-destroy-vm-context:
    - shard-lnl:          [DMESG-WARN][36] ([Intel XE#8652]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20/shard-lnl-5/igt@xe_exec_reset@gt-stress-reset-destroy-vm-context.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-lnl-7/igt@xe_exec_reset@gt-stress-reset-destroy-vm-context.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-ptl:          [ABORT][38] ([Intel XE#9362]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20/shard-ptl-3/igt@xe_pm@s4-vm-bind-userptr.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-ptl-4/igt@xe_pm@s4-vm-bind-userptr.html
    - shard-lnl:          [ABORT][40] ([Intel XE#9362]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20/shard-lnl-5/igt@xe_pm@s4-vm-bind-userptr.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-lnl-3/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [DMESG-WARN][42] ([Intel XE#9365]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20/shard-bmg-5/igt@xe_survivability@runtime-survivability.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-bmg-3/igt@xe_survivability@runtime-survivability.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][44] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][45] ([Intel XE#3544])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652
  [Intel XE#9254]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365
  [Intel XE#9399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9399


Build changes
-------------

  * Linux: xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20 -> xe-pw-177252v1

  IGT_9171: 9171
  xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20: 29f9258a2788a1066c0910c480e65c80887f4d20
  xe-pw-177252v1: 177252v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/index.html

--===============1793794939035585294==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>drm/dp, drm/i915: conversions from seq_file to drm_printer</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177252/">https://patchwork.freedesktop.org/series/177252/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20_FULL -&gt; xe-pw-177252v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-177252v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-ptl-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-lnl-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-bmg-10/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-bmg-7/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-bmg-10/igt@kms_content_protection@srm@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-bmg-10/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-bmg-10/igt@kms_flip@2x-plain-flip-ts-check-interruptible@cd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-ptl-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-lnl-3/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-ptl-4/igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-lnl-3/igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-virtual-userptr-invalidate:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-ptl-4/igt@xe_exec_balancer@once-virtual-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-lnl-3/igt@xe_exec_balancer@once-virtual-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-close-fd:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-ptl-4/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-lnl-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20/shard-lnl-7/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-lnl-8/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20/shard-bmg-1/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-bmg-8/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9399">Intel XE#9399</a>)</li>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20/shard-ptl-1/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-ptl-7/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-bmg-2/igt@xe_pm_residency@gt-c6-freeze@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254">Intel XE#9254</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-stress-reset-destroy-vm-context:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20/shard-lnl-5/igt@xe_exec_reset@gt-stress-reset-destroy-vm-context.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652">Intel XE#8652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-lnl-7/igt@xe_exec_reset@gt-stress-reset-destroy-vm-context.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20/shard-ptl-3/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-ptl-4/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20/shard-lnl-5/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-lnl-3/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20/shard-bmg-5/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365">Intel XE#9365</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-bmg-3/igt@xe_survivability@runtime-survivability.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_hdr@brightness-with-hdr:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177252v1/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20 -&gt; xe-pw-177252v1</li>
</ul>
<p>IGT_9171: 9171<br />
  xe-6034-29f9258a2788a1066c0910c480e65c80887f4d20: 29f9258a2788a1066c0910c480e65c80887f4d20<br />
  xe-pw-177252v1: 177252v1</p>

</body>
</html>

--===============1793794939035585294==--

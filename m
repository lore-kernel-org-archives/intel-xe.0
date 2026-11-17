Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1221606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 11:39:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A985810F54A;
	Tue, 17 Nov 2026 11:39:48 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4798410F54A;
 Tue, 17 Nov 2026 11:39:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4556508200502538117=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/dp=3A_Extend_HDR_m?=
 =?utf-8?q?ode_to_HLG?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vidya Srinivas" <vidya.srinivas@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Nov 2026 11:39:47 -0000
Message-ID: <179491558728.36437.2243438226861607117@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261117104808.2023577-1-vidya.srinivas@intel.com>
In-Reply-To: <20261117104808.2023577-1-vidya.srinivas@intel.com>
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

--===============4556508200502538117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: Extend HDR mode to HLG
URL   : https://patchwork.freedesktop.org/series/178778/
State : success

== Summary ==

CI Bug Log - changes from xe-6157-db48dbf452968dc67982a615cd37cd54fe774049_BAT -> xe-pw-178778v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 13)
------------------------------

  Additional (2): bat-nvls-2 bat-bmg-2 

Known issues
------------

  Here are the changes found in xe-pw-178778v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - bat-nvls-2:         NOTRUN -> [SKIP][1] ([Intel XE#8742]) +4 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@fbdev@eof.html

  * igt@fbdev@write:
    - bat-bmg-2:          NOTRUN -> [SKIP][2] ([Intel XE#2134]) +4 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-bmg-2/igt@fbdev@write.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-bmg-2:          NOTRUN -> [SKIP][3] ([Intel XE#2233])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-nvls-2:         NOTRUN -> [SKIP][4] ([Intel XE#8757])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-bmg-2:          NOTRUN -> [SKIP][5] ([Intel XE#2489] / [Intel XE#3419]) +13 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-bmg-2:          NOTRUN -> [SKIP][6] ([Intel XE#2482]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-nvls-2:         NOTRUN -> [SKIP][7] ([Intel XE#8756] / [Intel XE#8783]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-bmg-2:          NOTRUN -> [SKIP][8] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html
    - bat-nvls-2:         NOTRUN -> [SKIP][9] ([Intel XE#8761] / [Intel XE#8773])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-nvls-2:         NOTRUN -> [SKIP][10] ([Intel XE#8755]) +13 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-nvls-2:         NOTRUN -> [SKIP][11] ([Intel XE#8758] / [Intel XE#8784]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-bmg-2:          NOTRUN -> [SKIP][12] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@xe_evict@evict-small-multi-vm:
    - bat-nvls-2:         NOTRUN -> [SKIP][13] ([Intel XE#8777]) +9 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@xe_evict@evict-small-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - bat-nvls-2:         NOTRUN -> [SKIP][14] ([Intel XE#8744]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_balancer@no-exec-virtual-basic:
    - bat-nvls-2:         NOTRUN -> [SKIP][15] ([Intel XE#8741]) +17 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@xe_exec_balancer@no-exec-virtual-basic.html

  * igt@xe_exec_multi_queue@many-queues-basic-smem:
    - bat-nvls-2:         NOTRUN -> [SKIP][16] ([Intel XE#8377]) +13 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@xe_exec_multi_queue@many-queues-basic-smem.html

  * igt@xe_exec_multi_queue@priority:
    - bat-bmg-2:          NOTRUN -> [SKIP][17] ([Intel XE#8364]) +13 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-bmg-2/igt@xe_exec_multi_queue@priority.html

  * igt@xe_huc_copy@huc_copy:
    - bat-nvls-2:         NOTRUN -> [SKIP][18] ([Intel XE#8746])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_bo:
    - bat-nvls-2:         NOTRUN -> [SKIP][19] ([Intel XE#8792])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-nvls-2:         NOTRUN -> [SKIP][20] ([Intel XE#8791] / [Intel XE#8792])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-bmg-2:          NOTRUN -> [SKIP][21] ([Intel XE#2229])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:
    - bat-nvls-2:         NOTRUN -> [SKIP][22] ([Intel XE#9657])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-nvls-2:         NOTRUN -> [SKIP][23] ([Intel XE#8791])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@vram:
    - bat-nvls-2:         NOTRUN -> [SKIP][24] ([Intel XE#8747])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-bmg-2:          NOTRUN -> [SKIP][25] ([Intel XE#1420] / [Intel XE#7590])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html
    - bat-nvls-2:         NOTRUN -> [SKIP][26] ([Intel XE#8748])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-bmg-2:          NOTRUN -> [SKIP][27] ([Intel XE#2245] / [Intel XE#7590])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
    - bat-nvls-2:         NOTRUN -> [SKIP][28] ([Intel XE#8743])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-bmg-2:          NOTRUN -> [SKIP][29] ([Intel XE#2236] / [Intel XE#7590])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html
    - bat-nvls-2:         NOTRUN -> [SKIP][30] ([Intel XE#8745])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@xe_pat@pat-index-xelpg.html

  
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2434]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2489
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#3419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419
  [Intel XE#6314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8377
  [Intel XE#8741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8741
  [Intel XE#8742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8742
  [Intel XE#8743]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8743
  [Intel XE#8744]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8744
  [Intel XE#8745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8745
  [Intel XE#8746]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8746
  [Intel XE#8747]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8747
  [Intel XE#8748]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8748
  [Intel XE#8755]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8755
  [Intel XE#8756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8756
  [Intel XE#8757]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8757
  [Intel XE#8758]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8758
  [Intel XE#8761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8761
  [Intel XE#8773]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8773
  [Intel XE#8777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8777
  [Intel XE#8783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8783
  [Intel XE#8784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8784
  [Intel XE#8791]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8791
  [Intel XE#8792]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8792
  [Intel XE#9657]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9657


Build changes
-------------

  * Linux: xe-6157-db48dbf452968dc67982a615cd37cd54fe774049 -> xe-pw-178778v1

  IGT_9196: 9196
  xe-6157-db48dbf452968dc67982a615cd37cd54fe774049: db48dbf452968dc67982a615cd37cd54fe774049
  xe-pw-178778v1: 178778v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/index.html

--===============4556508200502538117==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: Extend HDR mode to HLG</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178778/">https://patchwork.freedesktop.org/series/178778/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6157-db48dbf452968dc67982a615cd37cd54fe774049_BAT -&gt; xe-pw-178778v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 13)</h2>
<p>Additional (2): bat-nvls-2 bat-bmg-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-178778v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8742">Intel XE#8742</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-bmg-2/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8757">Intel XE#8757</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2489">Intel XE#2489</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419">Intel XE#3419</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8756">Intel XE#8756</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8783">Intel XE#8783</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>)</li>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8761">Intel XE#8761</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8773">Intel XE#8773</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8755">Intel XE#8755</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8758">Intel XE#8758</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8784">Intel XE#8784</a>) +2 other tests skip</li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@xe_evict@evict-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8777">Intel XE#8777</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8744">Intel XE#8744</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-virtual-basic:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@xe_exec_balancer@no-exec-virtual-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8741">Intel XE#8741</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-basic-smem:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@xe_exec_multi_queue@many-queues-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8377">Intel XE#8377</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@priority:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-bmg-2/igt@xe_exec_multi_queue@priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8746">Intel XE#8746</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8792">Intel XE#8792</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8791">Intel XE#8791</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8792">Intel XE#8792</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9657">Intel XE#9657</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8791">Intel XE#8791</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8747">Intel XE#8747</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8748">Intel XE#8748</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8743">Intel XE#8743</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178778v1/bat-nvls-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8745">Intel XE#8745</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6157-db48dbf452968dc67982a615cd37cd54fe774049 -&gt; xe-pw-178778v1</li>
</ul>
<p>IGT_9196: 9196<br />
  xe-6157-db48dbf452968dc67982a615cd37cd54fe774049: db48dbf452968dc67982a615cd37cd54fe774049<br />
  xe-pw-178778v1: 178778v1</p>

</body>
</html>

--===============4556508200502538117==--

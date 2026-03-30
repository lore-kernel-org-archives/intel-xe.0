Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4521061B18
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 18:23:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B3B10E6DB;
	Mon, 30 Mar 2026 18:23:50 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F3610E6DB;
 Mon, 30 Mar 2026 18:23:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6214250646307228111=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Panel_Replay_BW_optimizati?=
 =?utf-8?q?on_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 30 Mar 2026 18:23:48 -0000
Message-ID: <177489502880.413734.9741437681598437669@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260330133620.3750559-1-animesh.manna@intel.com>
In-Reply-To: <20260330133620.3750559-1-animesh.manna@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============6214250646307228111==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Panel Replay BW optimization (rev4)
URL   : https://patchwork.freedesktop.org/series/163080/
State : failure

== Summary ==

CI Bug Log - changes from xe-4819-8c24b61314434b46cbe4da73f10bce90b0ea45d6_FULL -> xe-pw-163080v4_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-163080v4_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-163080v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-163080v4_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4819-8c24b61314434b46cbe4da73f10bce90b0ea45d6/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163080v4/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163080v4/shard-bmg-5/igt@xe_module_load@reload-no-display.html

  
Known issues
------------

  Here are the changes found in xe-pw-163080v4_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unplug-rescan:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#6779])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163080v4/shard-bmg-5/igt@core_hotunplug@unplug-rescan.html

  * igt@fbdev@pan:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2134])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163080v4/shard-bmg-5/igt@fbdev@pan.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#6703]) +443 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163080v4/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@xe_exec_compute_mode@twice-basic:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#6557] / [Intel XE#6703]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163080v4/shard-bmg-5/igt@xe_exec_compute_mode@twice-basic.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2229]) +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163080v4/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_multigpu_svm@mgpu-migration-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#6964])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163080v4/shard-bmg-5/igt@xe_multigpu_svm@mgpu-migration-prefetch.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][10] ([Intel XE#301]) -> [PASS][11] +1 other test pass
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4819-8c24b61314434b46cbe4da73f10bce90b0ea45d6/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163080v4/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964


Build changes
-------------

  * Linux: xe-4819-8c24b61314434b46cbe4da73f10bce90b0ea45d6 -> xe-pw-163080v4

  IGT_8835: 8835
  xe-4819-8c24b61314434b46cbe4da73f10bce90b0ea45d6: 8c24b61314434b46cbe4da73f10bce90b0ea45d6
  xe-pw-163080v4: 163080v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163080v4/index.html

--===============6214250646307228111==
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
<tr><td><b>Series:</b></td><td>Panel Replay BW optimization (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163080/">https://patchwork.freedesktop.org/series/163080/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163080v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163080v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4819-8c24b61314434b46cbe4da73f10bce90b0ea45d6_FULL -&gt; xe-pw-163080v4_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-163080v4_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-163080v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-163080v4_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4819-8c24b61314434b46cbe4da73f10bce90b0ea45d6/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163080v4/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163080v4/shard-bmg-5/igt@xe_module_load@reload-no-display.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-163080v4_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163080v4/shard-bmg-5/igt@core_hotunplug@unplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779">Intel XE#6779</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163080v4/shard-bmg-5/igt@fbdev@pan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163080v4/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +443 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163080v4/shard-bmg-5/igt@xe_exec_compute_mode@twice-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163080v4/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163080v4/shard-bmg-5/igt@xe_multigpu_svm@mgpu-migration-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@flip-vs-expired-vblank-interruptible:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4819-8c24b61314434b46cbe4da73f10bce90b0ea45d6/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163080v4/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4819-8c24b61314434b46cbe4da73f10bce90b0ea45d6 -&gt; xe-pw-163080v4</li>
</ul>
<p>IGT_8835: 8835<br />
  xe-4819-8c24b61314434b46cbe4da73f10bce90b0ea45d6: 8c24b61314434b46cbe4da73f10bce90b0ea45d6<br />
  xe-pw-163080v4: 163080v4</p>

</body>
</html>

--===============6214250646307228111==--

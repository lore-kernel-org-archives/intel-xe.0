Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D880CC6B3A
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 11:34:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28509112354;
	Thu, 15 Oct 2026 11:34:11 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7F4112359;
 Thu, 15 Oct 2026 11:34:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7872213467282133252=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_FD_close_cleanup_for_XE_=28?=
 =?utf-8?q?rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniel Charles" <daniel.charles@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Oct 2026 11:34:10 -0000
Message-ID: <179206405063.29190.1423419325491065097@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261015050136.1069815-1-daniel.charles@intel.com>
In-Reply-To: <20261015050136.1069815-1-daniel.charles@intel.com>
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

--===============7872213467282133252==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: FD close cleanup for XE (rev3)
URL   : https://patchwork.freedesktop.org/series/175996/
State : success

== Summary ==

CI Bug Log - changes from xe-5950-ea0d7e7169afc7f6dfdc72e2e5e44e8710dabda3_BAT -> xe-pw-175996v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 15)
------------------------------

  Additional (1): bat-nvls-2 

Known issues
------------

  Here are the changes found in xe-pw-175996v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-nvls-1:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#8762] / [Intel XE#9069])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5950-ea0d7e7169afc7f6dfdc72e2e5e44e8710dabda3/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html

  * igt@fbdev@eof:
    - bat-nvls-2:         NOTRUN -> [SKIP][3] ([Intel XE#8742]) +4 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@fbdev@eof.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-nvls-2:         NOTRUN -> [SKIP][4] ([Intel XE#8757])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-nvls-2:         NOTRUN -> [SKIP][5] ([Intel XE#8756] / [Intel XE#8783]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-nvls-2:         NOTRUN -> [SKIP][6] ([Intel XE#8761] / [Intel XE#8773])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-nvls-2:         NOTRUN -> [SKIP][7] ([Intel XE#8755]) +13 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-nvls-2:         NOTRUN -> [SKIP][8] ([Intel XE#8758] / [Intel XE#8784]) +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@xe_evict@evict-small-multi-vm:
    - bat-nvls-2:         NOTRUN -> [SKIP][9] ([Intel XE#8777]) +9 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@xe_evict@evict-small-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - bat-nvls-2:         NOTRUN -> [SKIP][10] ([Intel XE#8744]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_balancer@no-exec-virtual-basic:
    - bat-nvls-2:         NOTRUN -> [SKIP][11] ([Intel XE#8741]) +17 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@xe_exec_balancer@no-exec-virtual-basic.html

  * igt@xe_exec_multi_queue@many-queues-basic-smem:
    - bat-nvls-2:         NOTRUN -> [SKIP][12] ([Intel XE#8377]) +13 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@xe_exec_multi_queue@many-queues-basic-smem.html

  * igt@xe_huc_copy@huc_copy:
    - bat-nvls-2:         NOTRUN -> [SKIP][13] ([Intel XE#8746])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_bo:
    - bat-nvls-2:         NOTRUN -> [SKIP][14] ([Intel XE#8792])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-nvls-2:         NOTRUN -> [SKIP][15] ([Intel XE#8791] / [Intel XE#8792])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-nvls-2:         NOTRUN -> [SKIP][16] ([Intel XE#8791])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@vram:
    - bat-nvls-2:         NOTRUN -> [SKIP][17] ([Intel XE#8747])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-nvls-2:         NOTRUN -> [SKIP][18] ([Intel XE#8748])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-nvls-2:         NOTRUN -> [SKIP][19] ([Intel XE#8743])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-nvls-2:         NOTRUN -> [SKIP][20] ([Intel XE#8745])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@xe_pat@pat-index-xelpg.html

  
#### Possible fixes ####

  * igt@xe_exec_fault_mode@invalid-va:
    - bat-wcl-1:          [FAIL][21] ([Intel XE#9524]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5950-ea0d7e7169afc7f6dfdc72e2e5e44e8710dabda3/bat-wcl-1/igt@xe_exec_fault_mode@invalid-va.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-wcl-1/igt@xe_exec_fault_mode@invalid-va.html

  * igt@xe_gt_freq@freq_range_idle:
    - bat-wcl-1:          [SKIP][23] ([Intel XE#9525]) -> [PASS][24] +1 other test pass
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5950-ea0d7e7169afc7f6dfdc72e2e5e44e8710dabda3/bat-wcl-1/igt@xe_gt_freq@freq_range_idle.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-wcl-1/igt@xe_gt_freq@freq_range_idle.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-wcl-1:          [FAIL][25] ([Intel XE#9525]) -> [PASS][26] +1 other test pass
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5950-ea0d7e7169afc7f6dfdc72e2e5e44e8710dabda3/bat-wcl-1/igt@xe_pm_residency@gt-c6-on-idle.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-wcl-1/igt@xe_pm_residency@gt-c6-on-idle.html

  
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
  [Intel XE#8762]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762
  [Intel XE#8773]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8773
  [Intel XE#8777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8777
  [Intel XE#8783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8783
  [Intel XE#8784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8784
  [Intel XE#8791]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8791
  [Intel XE#8792]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8792
  [Intel XE#9069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069
  [Intel XE#9524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9524
  [Intel XE#9525]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9525


Build changes
-------------

  * Linux: xe-5950-ea0d7e7169afc7f6dfdc72e2e5e44e8710dabda3 -> xe-pw-175996v3

  IGT_9146: 9e6040664f13f0767bb4d1028b422b7ee00425dc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5950-ea0d7e7169afc7f6dfdc72e2e5e44e8710dabda3: ea0d7e7169afc7f6dfdc72e2e5e44e8710dabda3
  xe-pw-175996v3: 175996v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/index.html

--===============7872213467282133252==
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
<tr><td><b>Series:</b></td><td>FD close cleanup for XE (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175996/">https://patchwork.freedesktop.org/series/175996/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5950-ea0d7e7169afc7f6dfdc72e2e5e44e8710dabda3_BAT -&gt; xe-pw-175996v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 15)</h2>
<p>Additional (1): bat-nvls-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-175996v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5950-ea0d7e7169afc7f6dfdc72e2e5e44e8710dabda3/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762">Intel XE#8762</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069">Intel XE#9069</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8742">Intel XE#8742</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8757">Intel XE#8757</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8756">Intel XE#8756</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8783">Intel XE#8783</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8761">Intel XE#8761</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8773">Intel XE#8773</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8755">Intel XE#8755</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8758">Intel XE#8758</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8784">Intel XE#8784</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@xe_evict@evict-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8777">Intel XE#8777</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8744">Intel XE#8744</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-virtual-basic:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@xe_exec_balancer@no-exec-virtual-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8741">Intel XE#8741</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-basic-smem:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@xe_exec_multi_queue@many-queues-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8377">Intel XE#8377</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8746">Intel XE#8746</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8792">Intel XE#8792</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8791">Intel XE#8791</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8792">Intel XE#8792</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8791">Intel XE#8791</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8747">Intel XE#8747</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8748">Intel XE#8748</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8743">Intel XE#8743</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-nvls-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8745">Intel XE#8745</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@invalid-va:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5950-ea0d7e7169afc7f6dfdc72e2e5e44e8710dabda3/bat-wcl-1/igt@xe_exec_fault_mode@invalid-va.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9524">Intel XE#9524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-wcl-1/igt@xe_exec_fault_mode@invalid-va.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_range_idle:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5950-ea0d7e7169afc7f6dfdc72e2e5e44e8710dabda3/bat-wcl-1/igt@xe_gt_freq@freq_range_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9525">Intel XE#9525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-wcl-1/igt@xe_gt_freq@freq_range_idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5950-ea0d7e7169afc7f6dfdc72e2e5e44e8710dabda3/bat-wcl-1/igt@xe_pm_residency@gt-c6-on-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9525">Intel XE#9525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175996v3/bat-wcl-1/igt@xe_pm_residency@gt-c6-on-idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5950-ea0d7e7169afc7f6dfdc72e2e5e44e8710dabda3 -&gt; xe-pw-175996v3</li>
</ul>
<p>IGT_9146: 9e6040664f13f0767bb4d1028b422b7ee00425dc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5950-ea0d7e7169afc7f6dfdc72e2e5e44e8710dabda3: ea0d7e7169afc7f6dfdc72e2e5e44e8710dabda3<br />
  xe-pw-175996v3: 175996v3</p>

</body>
</html>

--===============7872213467282133252==--

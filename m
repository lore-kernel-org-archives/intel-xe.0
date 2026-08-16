Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907E8C5DF66
	for <intel-xe@archiver.kernel.org>; Sun, 16 Aug 2026 23:26:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD6410E37C;
	Sun, 16 Aug 2026 23:26:16 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5268910E023;
 Sun, 16 Aug 2026 23:26:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1230998459450126680=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_pm=5Fpme_support_on_display?=
 =?utf-8?q?_hotplug?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 16 Aug 2026 23:26:15 -0000
Message-ID: <178692277533.57258.14476598534438203908@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260816224005.886035-1-vinod.govindapillai@intel.com>
In-Reply-To: <20260816224005.886035-1-vinod.govindapillai@intel.com>
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

--===============1230998459450126680==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: pm_pme support on display hotplug
URL   : https://patchwork.freedesktop.org/series/172305/
State : failure

== Summary ==

CI Bug Log - changes from xe-5603-ceef0899403ceea5643d80a02bfdf9587f3845b8_BAT -> xe-pw-172305v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-172305v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-172305v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 13)
------------------------------

  Additional (1): bat-nvls-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-172305v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-nvls-2:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5603-ceef0899403ceea5643d80a02bfdf9587f3845b8/bat-nvls-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v1/bat-nvls-2/igt@core_hotunplug@unbind-rebind.html

  
Known issues
------------

  Here are the changes found in xe-pw-172305v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-nvls-1:         NOTRUN -> [SKIP][3] ([Intel XE#8757])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v1/bat-nvls-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-nvls-1:         NOTRUN -> [SKIP][4] ([Intel XE#8759])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v1/bat-nvls-1/igt@kms_dsc@dsc-basic.html

  * igt@xe_evict@evict-small-multi-vm:
    - bat-nvls-1:         NOTRUN -> [SKIP][5] ([Intel XE#8777]) +9 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v1/bat-nvls-1/igt@xe_evict@evict-small-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - bat-nvls-1:         NOTRUN -> [SKIP][6] ([Intel XE#8744]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v1/bat-nvls-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_balancer@twice-virtual-userptr-invalidate:
    - bat-nvls-1:         NOTRUN -> [SKIP][7] ([Intel XE#8741]) +17 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v1/bat-nvls-1/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html

  * igt@xe_exec_multi_queue@many-queues-userptr-invalidate:
    - bat-nvls-1:         NOTRUN -> [SKIP][8] ([Intel XE#8377]) +13 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v1/bat-nvls-1/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html

  * igt@xe_huc_copy@huc_copy:
    - bat-nvls-1:         NOTRUN -> [SKIP][9] ([Intel XE#8746])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v1/bat-nvls-1/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_bo:
    - bat-nvls-1:         NOTRUN -> [SKIP][10] ([Intel XE#8792])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v1/bat-nvls-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-nvls-1:         NOTRUN -> [SKIP][11] ([Intel XE#8791] / [Intel XE#8792])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v1/bat-nvls-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-nvls-1:         NOTRUN -> [SKIP][12] ([Intel XE#8791])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v1/bat-nvls-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@vram:
    - bat-nvls-1:         NOTRUN -> [SKIP][13] ([Intel XE#8747])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v1/bat-nvls-1/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-nvls-1:         NOTRUN -> [SKIP][14] ([Intel XE#8748])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v1/bat-nvls-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-nvls-1:         NOTRUN -> [SKIP][15] ([Intel XE#8743])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v1/bat-nvls-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-nvls-1:         NOTRUN -> [SKIP][16] ([Intel XE#8745])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v1/bat-nvls-1/igt@xe_pat@pat-index-xelpg.html

  
  [Intel XE#8377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8377
  [Intel XE#8741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8741
  [Intel XE#8743]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8743
  [Intel XE#8744]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8744
  [Intel XE#8745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8745
  [Intel XE#8746]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8746
  [Intel XE#8747]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8747
  [Intel XE#8748]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8748
  [Intel XE#8757]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8757
  [Intel XE#8759]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8759
  [Intel XE#8777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8777
  [Intel XE#8791]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8791
  [Intel XE#8792]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8792


Build changes
-------------

  * Linux: xe-5603-ceef0899403ceea5643d80a02bfdf9587f3845b8 -> xe-pw-172305v1

  IGT_9057: 8f7d5198bdb1c5af7c97b967a0bcbe77b653e8a0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5603-ceef0899403ceea5643d80a02bfdf9587f3845b8: ceef0899403ceea5643d80a02bfdf9587f3845b8
  xe-pw-172305v1: 172305v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v1/index.html

--===============1230998459450126680==
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
<tr><td><b>Series:</b></td><td>pm_pme support on display hotplug</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172305/">https://patchwork.freedesktop.org/series/172305/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5603-ceef0899403ceea5643d80a02bfdf9587f3845b8_BAT -&gt; xe-pw-172305v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-172305v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-172305v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 13)</h2>
<p>Additional (1): bat-nvls-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-172305v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5603-ceef0899403ceea5643d80a02bfdf9587f3845b8/bat-nvls-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v1/bat-nvls-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-172305v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v1/bat-nvls-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8757">Intel XE#8757</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v1/bat-nvls-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8759">Intel XE#8759</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm:</p>
<ul>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v1/bat-nvls-1/igt@xe_evict@evict-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8777">Intel XE#8777</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v1/bat-nvls-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8744">Intel XE#8744</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr-invalidate:</p>
<ul>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v1/bat-nvls-1/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8741">Intel XE#8741</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-userptr-invalidate:</p>
<ul>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v1/bat-nvls-1/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8377">Intel XE#8377</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v1/bat-nvls-1/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8746">Intel XE#8746</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v1/bat-nvls-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8792">Intel XE#8792</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v1/bat-nvls-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8791">Intel XE#8791</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8792">Intel XE#8792</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v1/bat-nvls-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8791">Intel XE#8791</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v1/bat-nvls-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8747">Intel XE#8747</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v1/bat-nvls-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8748">Intel XE#8748</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v1/bat-nvls-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8743">Intel XE#8743</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v1/bat-nvls-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8745">Intel XE#8745</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5603-ceef0899403ceea5643d80a02bfdf9587f3845b8 -&gt; xe-pw-172305v1</li>
</ul>
<p>IGT_9057: 8f7d5198bdb1c5af7c97b967a0bcbe77b653e8a0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5603-ceef0899403ceea5643d80a02bfdf9587f3845b8: ceef0899403ceea5643d80a02bfdf9587f3845b8<br />
  xe-pw-172305v1: 172305v1</p>

</body>
</html>

--===============1230998459450126680==--

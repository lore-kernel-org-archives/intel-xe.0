Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE81C9830E
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 08:14:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7570610E75B;
	Fri, 25 Sep 2026 08:14:39 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF6D10E5A6;
 Fri, 25 Sep 2026 08:14:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8631671369616203270=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/fbdev=3A_Move_helpers_t?=
 =?utf-8?q?o_clients/_subdirectory_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Sep 2026 08:14:38 -0000
Message-ID: <179032407888.206383.5496976053839259852@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260925071933.44283-1-tzimmermann@suse.de>
In-Reply-To: <20260925071933.44283-1-tzimmermann@suse.de>
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

--===============8631671369616203270==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/fbdev: Move helpers to clients/ subdirectory (rev3)
URL   : https://patchwork.freedesktop.org/series/174787/
State : success

== Summary ==

CI Bug Log - changes from xe-5824-999838292166407bbe911a41dee23112c49e9d44_BAT -> xe-pw-174787v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 13)
------------------------------

  Additional (1): bat-wcl-2 
  Missing    (2): bat-bmg-vm bat-ptl-vm 

Known issues
------------

  Here are the changes found in xe-pw-174787v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - bat-wcl-2:          NOTRUN -> [SKIP][1] ([Intel XE#7241]) +4 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174787v3/bat-wcl-2/igt@fbdev@eof.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-wcl-2:          NOTRUN -> [SKIP][2] ([Intel XE#7245])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174787v3/bat-wcl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-wcl-2:          NOTRUN -> [SKIP][3] ([Intel XE#7240]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174787v3/bat-wcl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-wcl-2:          NOTRUN -> [SKIP][4] ([Intel XE#7246])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174787v3/bat-wcl-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-wcl-2:          NOTRUN -> [SKIP][5] ([Intel XE#7237]) +13 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174787v3/bat-wcl-2/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-wcl-2:          NOTRUN -> [SKIP][6] ([Intel XE#2850]) +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174787v3/bat-wcl-2/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@xe_evict@evict-small-multi-vm:
    - bat-wcl-2:          NOTRUN -> [SKIP][7] ([Intel XE#7238]) +11 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174787v3/bat-wcl-2/igt@xe_evict@evict-small-multi-vm.html

  * igt@xe_exec_balancer@twice-virtual-userptr-rebind:
    - bat-wcl-2:          NOTRUN -> [SKIP][8] ([Intel XE#7482]) +17 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174787v3/bat-wcl-2/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html

  * igt@xe_exec_multi_queue@many-queues-userptr-invalidate:
    - bat-wcl-2:          NOTRUN -> [SKIP][9] ([Intel XE#8364]) +13 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174787v3/bat-wcl-2/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-wcl-2:          NOTRUN -> [SKIP][10] ([Intel XE#7239]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174787v3/bat-wcl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_mmap@vram:
    - bat-wcl-2:          NOTRUN -> [SKIP][11] ([Intel XE#7243])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174787v3/bat-wcl-2/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-wcl-2:          NOTRUN -> [SKIP][12] ([Intel XE#7247] / [Intel XE#7590])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174787v3/bat-wcl-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-wcl-2:          NOTRUN -> [SKIP][13] ([Intel XE#7242] / [Intel XE#7590])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174787v3/bat-wcl-2/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-wcl-2:          NOTRUN -> [SKIP][14] ([Intel XE#7248] / [Intel XE#7590])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174787v3/bat-wcl-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_waitfence@reltime:
    - bat-ptl-2:          [PASS][15] -> [FAIL][16] ([Intel XE#9115])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/bat-ptl-2/igt@xe_waitfence@reltime.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174787v3/bat-ptl-2/igt@xe_waitfence@reltime.html

  
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#7237]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7237
  [Intel XE#7238]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7238
  [Intel XE#7239]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7239
  [Intel XE#7240]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7240
  [Intel XE#7241]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7241
  [Intel XE#7242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7242
  [Intel XE#7243]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7243
  [Intel XE#7245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7245
  [Intel XE#7246]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7246
  [Intel XE#7247]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7247
  [Intel XE#7248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7248
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#9115]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115


Build changes
-------------

  * Linux: xe-5824-999838292166407bbe911a41dee23112c49e9d44 -> xe-pw-174787v3

  IGT_9112: 8d3284b5ae16ca1aef353dfaffb6c0896ceacc19 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5824-999838292166407bbe911a41dee23112c49e9d44: 999838292166407bbe911a41dee23112c49e9d44
  xe-pw-174787v3: 174787v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174787v3/index.html

--===============8631671369616203270==
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
<tr><td><b>Series:</b></td><td>drm/fbdev: Move helpers to clients/ subdirectory (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174787/">https://patchwork.freedesktop.org/series/174787/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174787v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174787v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5824-999838292166407bbe911a41dee23112c49e9d44_BAT -&gt; xe-pw-174787v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 13)</h2>
<p>Additional (1): bat-wcl-2 <br />
  Missing    (2): bat-bmg-vm bat-ptl-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-174787v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-wcl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174787v3/bat-wcl-2/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7241">Intel XE#7241</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-wcl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174787v3/bat-wcl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7245">Intel XE#7245</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-wcl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174787v3/bat-wcl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7240">Intel XE#7240</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-wcl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174787v3/bat-wcl-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7246">Intel XE#7246</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-wcl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174787v3/bat-wcl-2/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7237">Intel XE#7237</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-wcl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174787v3/bat-wcl-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm:</p>
<ul>
<li>bat-wcl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174787v3/bat-wcl-2/igt@xe_evict@evict-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7238">Intel XE#7238</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr-rebind:</p>
<ul>
<li>bat-wcl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174787v3/bat-wcl-2/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-userptr-invalidate:</p>
<ul>
<li>bat-wcl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174787v3/bat-wcl-2/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-wcl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174787v3/bat-wcl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7239">Intel XE#7239</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-wcl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174787v3/bat-wcl-2/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7243">Intel XE#7243</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-wcl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174787v3/bat-wcl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7247">Intel XE#7247</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-wcl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174787v3/bat-wcl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7242">Intel XE#7242</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-wcl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174787v3/bat-wcl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7248">Intel XE#7248</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/bat-ptl-2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174787v3/bat-ptl-2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115">Intel XE#9115</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5824-999838292166407bbe911a41dee23112c49e9d44 -&gt; xe-pw-174787v3</li>
</ul>
<p>IGT_9112: 8d3284b5ae16ca1aef353dfaffb6c0896ceacc19 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5824-999838292166407bbe911a41dee23112c49e9d44: 999838292166407bbe911a41dee23112c49e9d44<br />
  xe-pw-174787v3: 174787v3</p>

</body>
</html>

--===============8631671369616203270==--

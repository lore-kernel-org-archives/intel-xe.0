Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2BDCFD635
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 08:24:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E81E610E23B;
	Thu,  8 Jan 2026 08:24:03 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE8110E23B;
 Thu,  8 Jan 2026 08:24:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5434505997577502534=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Remove_device_private_page?=
 =?utf-8?q?s_from_physical_address_space_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jordan Niethe" <jniethe@nvidia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 Jan 2026 08:24:02 -0000
Message-ID: <176786064238.135428.14340826053287570289@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260108060102.41357-1-jniethe@nvidia.com>
In-Reply-To: <20260108060102.41357-1-jniethe@nvidia.com>
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

--===============5434505997577502534==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Remove device private pages from physical address space (rev4)
URL   : https://patchwork.freedesktop.org/series/159738/
State : failure

== Summary ==

CI Bug Log - changes from xe-4343-25815d6185d3efe226238025baddf01299c4b070_FULL -> xe-pw-159738v4_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-159738v4_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-159738v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-159738v4_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_system_allocator@many-execqueues-free:
    - shard-bmg:          NOTRUN -> [ABORT][1] +7 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-3/igt@xe_exec_system_allocator@many-execqueues-free.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-free-nomemset:
    - shard-bmg:          [PASS][2] -> [ABORT][3] +6 other tests abort
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4343-25815d6185d3efe226238025baddf01299c4b070/shard-bmg-10/igt@xe_exec_system_allocator@threads-many-large-execqueues-free-nomemset.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-large-execqueues-free-nomemset.html

  
Known issues
------------

  Here are the changes found in xe-pw-159738v4_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#1124])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_content_protection@dp-mst-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#6743])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-1/igt@kms_content_protection@dp-mst-suspend-resume.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2311]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-3/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@xe_exec_multi_queue@many-queues-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#6874]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-9/igt@xe_exec_multi_queue@many-queues-userptr.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          [PASS][9] -> [FAIL][10] ([Intel XE#5625])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4343-25815d6185d3efe226238025baddf01299c4b070/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  * igt@xe_exec_system_allocator@process-many-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#4943]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-3/igt@xe_exec_system_allocator@process-many-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-many-malloc-prefetch-madvise:
    - shard-bmg:          [PASS][12] -> [INCOMPLETE][13] ([Intel XE#6480])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4343-25815d6185d3efe226238025baddf01299c4b070/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-malloc-prefetch-madvise.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-malloc-prefetch-madvise.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#6964])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-10/igt@xe_multigpu_svm@mgpu-atomic-op-prefetch.html

  
#### Possible fixes ####

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][15] ([Intel XE#4459]) -> [PASS][16] +1 other test pass
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4343-25815d6185d3efe226238025baddf01299c4b070/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][17], [PASS][18], [PASS][19], [PASS][20], [PASS][21], [PASS][22], [PASS][23], [PASS][24], [PASS][25], [PASS][26], [PASS][27], [PASS][28], [PASS][29], [SKIP][30]) ([Intel XE#2457]) -> ([PASS][31], [PASS][32], [PASS][33], [PASS][34], [PASS][35], [PASS][36], [PASS][37], [PASS][38], [PASS][39], [PASS][40], [PASS][41], [PASS][42], [PASS][43], [PASS][44], [PASS][45], [PASS][46])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4343-25815d6185d3efe226238025baddf01299c4b070/shard-bmg-10/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4343-25815d6185d3efe226238025baddf01299c4b070/shard-bmg-10/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4343-25815d6185d3efe226238025baddf01299c4b070/shard-bmg-10/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4343-25815d6185d3efe226238025baddf01299c4b070/shard-bmg-2/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4343-25815d6185d3efe226238025baddf01299c4b070/shard-bmg-2/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4343-25815d6185d3efe226238025baddf01299c4b070/shard-bmg-2/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4343-25815d6185d3efe226238025baddf01299c4b070/shard-bmg-9/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4343-25815d6185d3efe226238025baddf01299c4b070/shard-bmg-9/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4343-25815d6185d3efe226238025baddf01299c4b070/shard-bmg-1/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4343-25815d6185d3efe226238025baddf01299c4b070/shard-bmg-3/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4343-25815d6185d3efe226238025baddf01299c4b070/shard-bmg-9/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4343-25815d6185d3efe226238025baddf01299c4b070/shard-bmg-1/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4343-25815d6185d3efe226238025baddf01299c4b070/shard-bmg-3/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4343-25815d6185d3efe226238025baddf01299c4b070/shard-bmg-9/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-10/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-2/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-9/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-9/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-1/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-10/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-9/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-2/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-2/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-1/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-3/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-3/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-1/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-10/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-1/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-10/igt@xe_module_load@load.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#6480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6480
  [Intel XE#6743]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6743
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964


Build changes
-------------

  * Linux: xe-4343-25815d6185d3efe226238025baddf01299c4b070 -> xe-pw-159738v4

  IGT_8692: 8692
  xe-4343-25815d6185d3efe226238025baddf01299c4b070: 25815d6185d3efe226238025baddf01299c4b070
  xe-pw-159738v4: 159738v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/index.html

--===============5434505997577502534==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>Remove device private pages from physical ad=
dress space (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/159738/">https://patchwork.freedesktop.org/series/159738/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-159738v4/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-159738v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4343-25815d6185d3efe226238025baddf0129=
9c4b070_FULL -&gt; xe-pw-159738v4_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-159738v4_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-159738v4_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1597=
38v4_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-free:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v4/shard-bmg-3/igt@xe_exec_system_allocator@many=
-execqueues-free.html">ABORT</a> +7 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-free-nomemset=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4343-25815d6185d3efe226238025baddf01299c4b070/shard-bmg-10/igt@xe_exec=
_system_allocator@threads-many-large-execqueues-free-nomemset.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4=
/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-large-execqueues-fre=
e-nomemset.html">ABORT</a> +6 other tests abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159738v4_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v4/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v4/shard-bmg-1/igt@kms_content_protection@dp-mst=
-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6743">Intel XE#6743</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v4/shard-bmg-10/igt@kms_frontbuffer_tracking@drr=
s-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v4/shard-bmg-3/igt@kms_psr@psr2-sprite-plane-ono=
ff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v4/shard-bmg-9/igt@xe_exec_multi_queue@many-queu=
es-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6874">Intel XE#6874</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4343-25815d6185d3efe226238025baddf01299c4b070/shard-lnl-1/igt@xe_exec_=
system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shar=
d-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vm=
a.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v4/shard-bmg-3/igt@xe_exec_system_allocator@proc=
ess-many-mmap-free-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-prefetch-madvise:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4343-25815d6185d3efe226238025baddf01299c4b070/shard-bmg-9/igt@xe_exec_=
system_allocator@threads-many-malloc-prefetch-madvise.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-b=
mg-2/igt@xe_exec_system_allocator@threads-many-malloc-prefetch-madvise.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/6480">Intel XE#6480</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159738v4/shard-bmg-10/igt@xe_multigpu_svm@mgpu-atomic-=
op-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4343-25815d6185d3efe226238025baddf01299c4b070/shard-lnl-2/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4459">Intel XE#4459</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-lnl-1/igt@kms_vrr@cmrr@=
pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4343-25815d6185d3efe226238025baddf01299c4b070/shard-bmg-10/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4343-25815d6185d3efe226238025baddf01299c4b070/shard-bmg-10/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-4343-25815d6185d3efe226238025baddf01299c4b070/shard-bmg-10/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-4343-25815d6185d3efe226238025baddf01299c4b070/shard-bm=
g-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-4343-25815d6185d3efe226238025baddf01299c4b070/shar=
d-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-4343-25815d6185d3efe226238025baddf01299c4b070/=
shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-4343-25815d6185d3efe226238025baddf01299c4b=
070/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-4343-25815d6185d3efe226238025baddf0129=
9c4b070/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-4343-25815d6185d3efe226238025baddf=
01299c4b070/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-4343-25815d6185d3efe226238025b=
addf01299c4b070/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4343-25815d6185d3efe226238=
025baddf01299c4b070/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4343-25815d6185d3efe22=
6238025baddf01299c4b070/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4343-25815d6185d3e=
fe226238025baddf01299c4b070/shard-bmg-3/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4343-25815d618=
5d3efe226238025baddf01299c4b070/shard-bmg-9/igt@xe_module_load@load.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
57">Intel XE#2457</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-159738v4/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-=
bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-9/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
159738v4/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-1/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-159738v4/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard=
-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-2/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-159738v4/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-1/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-159738v4/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard=
-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-1/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-159738v4/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-159738v4/shard-bmg-10/igt@xe_module_load@load.html">PASS</=
a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4343-25815d6185d3efe226238025baddf01299c4b070 -&gt; xe-pw-159=
738v4</li>
</ul>
<p>IGT_8692: 8692<br />
  xe-4343-25815d6185d3efe226238025baddf01299c4b070: 25815d6185d3efe22623802=
5baddf01299c4b070<br />
  xe-pw-159738v4: 159738v4</p>

</body>
</html>

--===============5434505997577502534==--

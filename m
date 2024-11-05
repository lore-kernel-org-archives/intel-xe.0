Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C2BD1CA28
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 05:20:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF4710E4BD;
	Tue,  5 Nov 2024 05:20:57 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F190610E2CA;
 Tue,  5 Nov 2024 05:20:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8192660177907273604=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_A_couple_exec_IOCTL_fixes_=28rev?=
 =?utf-8?q?2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 Nov 2024 05:20:56 -0000
Message-ID: <173078405696.1410130.10204832865774995730@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241105043524.4062774-1-matthew.brost@intel.com>
In-Reply-To: <20241105043524.4062774-1-matthew.brost@intel.com>
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

--===============8192660177907273604==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: A couple exec IOCTL fixes (rev2)
URL   : https://patchwork.freedesktop.org/series/140910/
State : success

== Summary ==

CI Bug Log - changes from xe-2161-fffb00b58c0ce4d5a729f3bbd7f05d38ff3dbe63_BAT -> xe-pw-140910v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-140910v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [PASS][1] -> [FAIL][2] ([Intel XE#886]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2161-fffb00b58c0ce4d5a729f3bbd7f05d38ff3dbe63/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140910v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@xe_evict@evict-beng-small:
    - bat-adlp-7:         NOTRUN -> [SKIP][3] ([Intel XE#261] / [Intel XE#688]) +15 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140910v2/bat-adlp-7/igt@xe_evict@evict-beng-small.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         NOTRUN -> [SKIP][4] ([Intel XE#288]) +32 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140910v2/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-bmg-2:          [PASS][5] -> [INCOMPLETE][6] ([Intel XE#2874] / [Intel XE#2998]) +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2161-fffb00b58c0ce4d5a729f3bbd7f05d38ff3dbe63/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140910v2/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-adlp-7:         NOTRUN -> [SKIP][7] ([Intel XE#2229])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140910v2/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Possible fixes ####

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [SKIP][8] ([Intel XE#455]) -> [PASS][9] +1 other test pass
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2161-fffb00b58c0ce4d5a729f3bbd7f05d38ff3dbe63/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140910v2/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-page-flip@edp-1:
    - bat-adlp-7:         [DMESG-WARN][10] ([Intel XE#2871]) -> [PASS][11] +1 other test pass
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2161-fffb00b58c0ce4d5a729f3bbd7f05d38ff3dbe63/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140910v2/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-adlp-7:         [INCOMPLETE][12] ([Intel XE#2874]) -> [PASS][13] +1 other test pass
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2161-fffb00b58c0ce4d5a729f3bbd7f05d38ff3dbe63/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140910v2/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2871]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2871
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * Linux: xe-2161-fffb00b58c0ce4d5a729f3bbd7f05d38ff3dbe63 -> xe-pw-140910v2

  IGT_8097: 2e7c8e4b88a50e33e10d6c13286818aa833bef9b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2161-fffb00b58c0ce4d5a729f3bbd7f05d38ff3dbe63: fffb00b58c0ce4d5a729f3bbd7f05d38ff3dbe63
  xe-pw-140910v2: 140910v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140910v2/index.html

--===============8192660177907273604==
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
<tr><td><b>Series:</b></td><td>A couple exec IOCTL fixes (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140910/">https://patchwork.freedesktop.org/series/140910/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140910v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140910v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2161-fffb00b58c0ce4d5a729f3bbd7f05d38ff3dbe63_BAT -&gt; xe-pw-140910v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140910v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2161-fffb00b58c0ce4d5a729f3bbd7f05d38ff3dbe63/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140910v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140910v2/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140910v2/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2161-fffb00b58c0ce4d5a729f3bbd7f05d38ff3dbe63/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140910v2/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998">Intel XE#2998</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140910v2/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2161-fffb00b58c0ce4d5a729f3bbd7f05d38ff3dbe63/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140910v2/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip@edp-1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2161-fffb00b58c0ce4d5a729f3bbd7f05d38ff3dbe63/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2871">Intel XE#2871</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140910v2/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2161-fffb00b58c0ce4d5a729f3bbd7f05d38ff3dbe63/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140910v2/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2161-fffb00b58c0ce4d5a729f3bbd7f05d38ff3dbe63 -&gt; xe-pw-140910v2</li>
</ul>
<p>IGT_8097: 2e7c8e4b88a50e33e10d6c13286818aa833bef9b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2161-fffb00b58c0ce4d5a729f3bbd7f05d38ff3dbe63: fffb00b58c0ce4d5a729f3bbd7f05d38ff3dbe63<br />
  xe-pw-140910v2: 140910v2</p>

</body>
</html>

--===============8192660177907273604==--

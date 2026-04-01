Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA4410FCADC
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 21:11:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1BBD10E492;
	Wed,  1 Apr 2026 21:11:49 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882D610E492;
 Wed,  1 Apr 2026 21:11:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6557549955312757951=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_USE_drm_mm_instead_of_drm_?=
 =?utf-8?q?SA_for_CCS_read/write_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 01 Apr 2026 21:11:48 -0000
Message-ID: <177507790853.425430.18204801237937220425@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260401161528.1990499-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260401161528.1990499-1-satyanarayana.k.v.p@intel.com>
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

--===============6557549955312757951==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: USE drm mm instead of drm SA for CCS read/write (rev3)
URL   : https://patchwork.freedesktop.org/series/163588/
State : failure

== Summary ==

CI Bug Log - changes from xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2_FULL -> xe-pw-163588v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-163588v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-163588v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-163588v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_sriov_vfio@region-info:
    - shard-lnl:          NOTRUN -> [SKIP][1] +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v3/shard-lnl-1/igt@xe_sriov_vfio@region-info.html

  
Known issues
------------

  Here are the changes found in xe-pw-163588v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][2] -> [FAIL][3] ([Intel XE#301]) +4 other tests fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v3/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][4] -> [FAIL][5] ([Intel XE#7340] / [Intel XE#7504])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v3/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][6] -> [FAIL][7] ([Intel XE#7340])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v3/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [PASS][8] -> [FAIL][9] ([Intel XE#2029] / [Intel XE#7395])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v3/shard-lnl-5/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_setmode@basic@pipe-a-edp-1:
    - shard-lnl:          [PASS][10] -> [FAIL][11] ([Intel XE#6361]) +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2/shard-lnl-1/igt@kms_setmode@basic@pipe-a-edp-1.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v3/shard-lnl-2/igt@kms_setmode@basic@pipe-a-edp-1.html

  
#### Possible fixes ####

  * igt@kms_vrr@flipline:
    - shard-lnl:          [FAIL][12] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][13] +1 other test pass
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2/shard-lnl-7/igt@kms_vrr@flipline.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v3/shard-lnl-1/igt@kms_vrr@flipline.html

  
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7504


Build changes
-------------

  * IGT: IGT_8839 -> IGT_8840
  * Linux: xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2 -> xe-pw-163588v3

  IGT_8839: 8839
  IGT_8840: 8840
  xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2: 5d36e6d54e963f0c1137aaf2249d2baa781f08c2
  xe-pw-163588v3: 163588v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v3/index.html

--===============6557549955312757951==
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
<tr><td><b>Series:</b></td><td>USE drm mm instead of drm SA for CCS read/write (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163588/">https://patchwork.freedesktop.org/series/163588/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2_FULL -&gt; xe-pw-163588v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-163588v3_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-163588v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-163588v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_sriov_vfio@region-info:<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v3/shard-lnl-1/igt@xe_sriov_vfio@region-info.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-163588v3_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v3/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v3/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7504">Intel XE#7504</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v3/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v3/shard-lnl-5/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395">Intel XE#7395</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2/shard-lnl-1/igt@kms_setmode@basic@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v3/shard-lnl-2/igt@kms_setmode@basic@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_vrr@flipline:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2/shard-lnl-7/igt@kms_vrr@flipline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v3/shard-lnl-1/igt@kms_vrr@flipline.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8839 -&gt; IGT_8840</li>
<li>Linux: xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2 -&gt; xe-pw-163588v3</li>
</ul>
<p>IGT_8839: 8839<br />
  IGT_8840: 8840<br />
  xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2: 5d36e6d54e963f0c1137aaf2249d2baa781f08c2<br />
  xe-pw-163588v3: 163588v3</p>

</body>
</html>

--===============6557549955312757951==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51A7C3DA63
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 04:27:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C58110E3C1;
	Tue, 23 Jul 2024 04:27:54 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33DA310E3C1;
 Tue, 23 Jul 2024 04:27:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6271805858057503489=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Convert_live_tests_to_parameteri?=
 =?utf-8?q?zed_style_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Jul 2024 04:27:52 -0000
Message-ID: <172170887220.358732.5584479789320504734@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240720142528.530-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240720142528.530-1-michal.wajdeczko@intel.com>
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

--===============6271805858057503489==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Convert live tests to parameterized style (rev3)
URL   : https://patchwork.freedesktop.org/series/136163/
State : success

== Summary ==

CI Bug Log - changes from xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f_BAT -> xe-pw-136163v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-136163v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-7:         [PASS][1] -> [SKIP][2] ([Intel XE#455]) +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/bat-adlp-7/igt@xe_live_ktest@xe_bo.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/bat-adlp-7/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-lnl-1:          [PASS][3] -> [SKIP][4] ([Intel XE#2229])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/bat-lnl-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/bat-lnl-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-pvc-2:          [PASS][5] -> [SKIP][6] ([Intel XE#2229])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/bat-pvc-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/bat-pvc-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
    - bat-adlp-7:         [PASS][7] -> [SKIP][8] ([Intel XE#2229])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [FAIL][9] ([Intel XE#886]) -> [PASS][10] +1 other test pass
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * Linux: xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f -> xe-pw-136163v3

  IGT_7933: 7933
  xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f: 51eaf1afceb400cf4fe9ed1147dffccc4cc8204f
  xe-pw-136163v3: 136163v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/index.html

--===============6271805858057503489==
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
<tr><td><b>Series:</b></td><td>Convert live tests to parameterized style (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136163/">https://patchwork.freedesktop.org/series/136163/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f_BAT -&gt; xe-pw-136163v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136163v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/bat-adlp-7/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/bat-adlp-7/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/bat-lnl-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/bat-lnl-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/bat-pvc-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/bat-pvc-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f -&gt; xe-pw-136163v3</li>
</ul>
<p>IGT_7933: 7933<br />
  xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f: 51eaf1afceb400cf4fe9ed1147dffccc4cc8204f<br />
  xe-pw-136163v3: 136163v3</p>

</body>
</html>

--===============6271805858057503489==--

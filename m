Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF62ECE582
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 09:27:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98AB810E73F;
	Tue, 10 Sep 2024 09:27:44 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A9C10E73F;
 Tue, 10 Sep 2024 09:27:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6945298405061341266=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_Add_a_xe=5Fbo_subtest_?=
 =?utf-8?q?for_shrinking_/_swapping_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Sep 2024 09:27:43 -0000
Message-ID: <172596046339.979952.15988242324076964137@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240909085654.5064-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240909085654.5064-1-thomas.hellstrom@linux.intel.com>
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

--===============6945298405061341266==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add a xe_bo subtest for shrinking / swapping (rev3)
URL   : https://patchwork.freedesktop.org/series/138262/
State : failure

== Summary ==

CI Bug Log - changes from xe-1918-40360ec4ceee7e8c16a187299cadf3e6babc8114_BAT -> xe-pw-138262v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-138262v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-138262v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-138262v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit (NEW):
    - bat-atsm-2:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v3/bat-atsm-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
New tests
---------

  New tests have been introduced between xe-1918-40360ec4ceee7e8c16a187299cadf3e6babc8114_BAT and xe-pw-138262v3_BAT:

### New IGT tests (1) ###

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - Statuses : 7 pass(s) 1 skip(s)
    - Exec time: [0.38, 43.89] s

  

Known issues
------------

  Here are the changes found in xe-pw-138262v3_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [SKIP][2] ([Intel XE#2229] / [Intel XE#455]) -> [PASS][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1918-40360ec4ceee7e8c16a187299cadf3e6babc8114/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v3/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
    - bat-adlp-7:         [SKIP][4] ([Intel XE#2229] / [Intel XE#455]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1918-40360ec4ceee7e8c16a187299cadf3e6babc8114/bat-adlp-7/igt@xe_live_ktest@xe_bo.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v3/bat-adlp-7/igt@xe_live_ktest@xe_bo.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-adlp-7:         [SKIP][6] ([Intel XE#2229] / [Intel XE#455]) -> [SKIP][7] ([Intel XE#2229])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1918-40360ec4ceee7e8c16a187299cadf3e6babc8114/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v3/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
    - bat-adlp-vf:        [SKIP][8] ([Intel XE#2229] / [Intel XE#455]) -> [SKIP][9] ([Intel XE#2229])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1918-40360ec4ceee7e8c16a187299cadf3e6babc8114/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v3/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * Linux: xe-1918-40360ec4ceee7e8c16a187299cadf3e6babc8114 -> xe-pw-138262v3

  IGT_8011: 26dca87f1252b7f6f0c0f833050256f0244d61e9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1918-40360ec4ceee7e8c16a187299cadf3e6babc8114: 40360ec4ceee7e8c16a187299cadf3e6babc8114
  xe-pw-138262v3: 138262v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v3/index.html

--===============6945298405061341266==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add a xe_bo subtest for shrinking / swapping (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138262/">https://patchwork.freedesktop.org/series/138262/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1918-40360ec4ceee7e8c16a187299cadf3e6babc8114_BAT -&gt; xe-pw-138262v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-138262v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-138262v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-138262v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit (NEW):<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v3/bat-atsm-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-1918-40360ec4ceee7e8c16a187299cadf3e6babc8114_BAT and xe-pw-138262v3_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:<ul>
<li>Statuses : 7 pass(s) 1 skip(s)</li>
<li>Exec time: [0.38, 43.89] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-138262v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1918-40360ec4ceee7e8c16a187299cadf3e6babc8114/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v3/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">PASS</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1918-40360ec4ceee7e8c16a187299cadf3e6babc8114/bat-adlp-7/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v3/bat-adlp-7/igt@xe_live_ktest@xe_bo.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1918-40360ec4ceee7e8c16a187299cadf3e6babc8114/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v3/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1918-40360ec4ceee7e8c16a187299cadf3e6babc8114/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138262v3/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1918-40360ec4ceee7e8c16a187299cadf3e6babc8114 -&gt; xe-pw-138262v3</li>
</ul>
<p>IGT_8011: 26dca87f1252b7f6f0c0f833050256f0244d61e9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1918-40360ec4ceee7e8c16a187299cadf3e6babc8114: 40360ec4ceee7e8c16a187299cadf3e6babc8114<br />
  xe-pw-138262v3: 138262v3</p>

</body>
</html>

--===============6945298405061341266==--

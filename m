Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F490C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 09:19:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C86510E080;
	Mon, 19 Aug 2024 09:19:05 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C323A10E080;
 Mon, 19 Aug 2024 09:19:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0250240162157867996=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_TTM_shrinker_helpers_and_xe_buff?=
 =?utf-8?q?er_object_shrinker_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 19 Aug 2024 09:19:04 -0000
Message-ID: <172405914479.678045.15580363934196710822@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240819083449.56701-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240819083449.56701-1-thomas.hellstrom@linux.intel.com>
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

--===============0250240162157867996==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: TTM shrinker helpers and xe buffer object shrinker (rev8)
URL   : https://patchwork.freedesktop.org/series/131815/
State : success

== Summary ==

CI Bug Log - changes from xe-1790-02f693a1a747b2784cedbbd7f6cf35be9a652d94_BAT -> xe-pw-131815v8_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-1790-02f693a1a747b2784cedbbd7f6cf35be9a652d94_BAT and xe-pw-131815v8_BAT:

### New IGT tests (1) ###

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - Statuses : 9 pass(s)
    - Exec time: [3.78, 56.59] s

  

Known issues
------------

  Here are the changes found in xe-pw-131815v8_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - bat-lnl-1:          [PASS][1] -> [FAIL][2] ([Intel XE#1069])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1790-02f693a1a747b2784cedbbd7f6cf35be9a652d94/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v8/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html

  
#### Possible fixes ####

  * igt@xe_evict@evict-beng-small-cm:
    - bat-pvc-2:          [DMESG-FAIL][3] ([Intel XE#482]) -> [PASS][4] +3 other tests pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1790-02f693a1a747b2784cedbbd7f6cf35be9a652d94/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v8/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          [FAIL][5] ([Intel XE#1000]) -> [PASS][6] +3 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1790-02f693a1a747b2784cedbbd7f6cf35be9a652d94/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v8/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [SKIP][7] ([Intel XE#2229] / [Intel XE#455]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1790-02f693a1a747b2784cedbbd7f6cf35be9a652d94/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v8/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
    - bat-lnl-1:          [SKIP][9] ([Intel XE#2229]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1790-02f693a1a747b2784cedbbd7f6cf35be9a652d94/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v8/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
    - bat-adlp-7:         [SKIP][11] ([Intel XE#2229] / [Intel XE#455]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1790-02f693a1a747b2784cedbbd7f6cf35be9a652d94/bat-adlp-7/igt@xe_live_ktest@xe_bo.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v8/bat-adlp-7/igt@xe_live_ktest@xe_bo.html
    - bat-lnl-2:          [SKIP][13] ([Intel XE#2229]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1790-02f693a1a747b2784cedbbd7f6cf35be9a652d94/bat-lnl-2/igt@xe_live_ktest@xe_bo.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v8/bat-lnl-2/igt@xe_live_ktest@xe_bo.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-adlp-7:         [SKIP][15] ([Intel XE#2229] / [Intel XE#455]) -> [SKIP][16] ([Intel XE#2229])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1790-02f693a1a747b2784cedbbd7f6cf35be9a652d94/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v8/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
    - bat-adlp-vf:        [SKIP][17] ([Intel XE#2229] / [Intel XE#455]) -> [SKIP][18] ([Intel XE#2229])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1790-02f693a1a747b2784cedbbd7f6cf35be9a652d94/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v8/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482


Build changes
-------------

  * Linux: xe-1790-02f693a1a747b2784cedbbd7f6cf35be9a652d94 -> xe-pw-131815v8

  IGT_7975: 7975
  xe-1790-02f693a1a747b2784cedbbd7f6cf35be9a652d94: 02f693a1a747b2784cedbbd7f6cf35be9a652d94
  xe-pw-131815v8: 131815v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v8/index.html

--===============0250240162157867996==
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
<tr><td><b>Series:</b></td><td>TTM shrinker helpers and xe buffer object shrinker (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131815/">https://patchwork.freedesktop.org/series/131815/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v8/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1790-02f693a1a747b2784cedbbd7f6cf35be9a652d94_BAT -&gt; xe-pw-131815v8_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-1790-02f693a1a747b2784cedbbd7f6cf35be9a652d94_BAT and xe-pw-131815v8_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [3.78, 56.59] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-131815v8_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_reset@cm-close-fd-no-exec:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1790-02f693a1a747b2784cedbbd7f6cf35be9a652d94/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v8/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1790-02f693a1a747b2784cedbbd7f6cf35be9a652d94/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v8/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1790-02f693a1a747b2784cedbbd7f6cf35be9a652d94/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v8/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1790-02f693a1a747b2784cedbbd7f6cf35be9a652d94/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v8/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">PASS</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1790-02f693a1a747b2784cedbbd7f6cf35be9a652d94/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v8/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">PASS</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1790-02f693a1a747b2784cedbbd7f6cf35be9a652d94/bat-adlp-7/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v8/bat-adlp-7/igt@xe_live_ktest@xe_bo.html">PASS</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1790-02f693a1a747b2784cedbbd7f6cf35be9a652d94/bat-lnl-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v8/bat-lnl-2/igt@xe_live_ktest@xe_bo.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1790-02f693a1a747b2784cedbbd7f6cf35be9a652d94/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v8/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1790-02f693a1a747b2784cedbbd7f6cf35be9a652d94/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v8/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1790-02f693a1a747b2784cedbbd7f6cf35be9a652d94 -&gt; xe-pw-131815v8</li>
</ul>
<p>IGT_7975: 7975<br />
  xe-1790-02f693a1a747b2784cedbbd7f6cf35be9a652d94: 02f693a1a747b2784cedbbd7f6cf35be9a652d94<br />
  xe-pw-131815v8: 131815v8</p>

</body>
</html>

--===============0250240162157867996==--

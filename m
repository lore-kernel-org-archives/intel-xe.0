Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6BEC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 00:44:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E53010E141;
	Tue, 12 Dec 2023 00:44:01 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5EF0210E141;
 Tue, 12 Dec 2023 00:43:58 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 57410AADED;
 Tue, 12 Dec 2023 00:43:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3108481300590176778=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/managed=3A_Add_drmm=5Freleas?=
 =?utf-8?q?e=5Faction_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Date: Tue, 12 Dec 2023 00:43:58 -0000
Message-ID: <170234183832.31294.6188656746180268793@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231211220939.215024-1-michal.winiarski@intel.com>
In-Reply-To: <20231211220939.215024-1-michal.winiarski@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============3108481300590176778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/managed: Add drmm_release_action (rev3)
URL   : https://patchwork.freedesktop.org/series/127086/
State : success

== Summary ==

CI Bug Log - changes from xe-568-b76c0e2128dd79ee1609d0d389e040c6e7499261_BAT -> xe-pw-127086v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-127086v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_create@create-execqueues-noleak:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#524])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-568-b76c0e2128dd79ee1609d0d389e040c6e7499261/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127086v3/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-atsm-2:         [PASS][3] -> [FAIL][4] ([Intel XE#999])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-568-b76c0e2128dd79ee1609d0d389e040c6e7499261/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127086v3/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - bat-adlp-7:         [FAIL][5] ([i915#2346]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-568-b76c0e2128dd79ee1609d0d389e040c6e7499261/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127086v3/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [FAIL][7] ([Intel XE#480]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-568-b76c0e2128dd79ee1609d0d389e040c6e7499261/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127086v3/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-WARN][9] ([Intel XE#282] / [i915#2017]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-568-b76c0e2128dd79ee1609d0d389e040c6e7499261/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127086v3/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/999
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346


Build changes
-------------

  * Linux: xe-568-b76c0e2128dd79ee1609d0d389e040c6e7499261 -> xe-pw-127086v3

  IGT_7635: 0b796be8ce05cb2070ce5136d248f438c962d11e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-568-b76c0e2128dd79ee1609d0d389e040c6e7499261: b76c0e2128dd79ee1609d0d389e040c6e7499261
  xe-pw-127086v3: 127086v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127086v3/index.html

--===============3108481300590176778==
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
<tr><td><b>Series:</b></td><td>drm/managed: Add drmm_release_action (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127086/">https://patchwork.freedesktop.org/series/127086/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127086v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127086v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-568-b76c0e2128dd79ee1609d0d389e040c6e7499261_BAT -&gt; xe-pw-127086v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-127086v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_create@create-execqueues-noleak:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-568-b76c0e2128dd79ee1609d0d389e040c6e7499261/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127086v3/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-568-b76c0e2128dd79ee1609d0d389e040c6e7499261/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127086v3/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/999">Intel XE#999</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-568-b76c0e2128dd79ee1609d0d389e040c6e7499261/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127086v3/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-568-b76c0e2128dd79ee1609d0d389e040c6e7499261/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127086v3/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-568-b76c0e2128dd79ee1609d0d389e040c6e7499261/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127086v3/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-568-b76c0e2128dd79ee1609d0d389e040c6e7499261 -&gt; xe-pw-127086v3</li>
</ul>
<p>IGT_7635: 0b796be8ce05cb2070ce5136d248f438c962d11e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-568-b76c0e2128dd79ee1609d0d389e040c6e7499261: b76c0e2128dd79ee1609d0d389e040c6e7499261<br />
  xe-pw-127086v3: 127086v3</p>

</body>
</html>

--===============3108481300590176778==--

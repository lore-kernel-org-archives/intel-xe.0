Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DF3C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  1 Nov 2023 16:47:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5AF10E742;
	Wed,  1 Nov 2023 16:47:22 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id A6FF710E744;
 Wed,  1 Nov 2023 16:47:20 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A1B25AADF2;
 Wed,  1 Nov 2023 16:47:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4436930226175616597=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Wed, 01 Nov 2023 16:47:20 -0000
Message-ID: <169885724063.29320.18037231522323462622@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231101151528.1840900-1-lucas.demarchi@intel.com>
In-Reply-To: <20231101151528.1840900-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_st?=
 =?utf-8?q?arting_with_=5B1/3=5D_drm/i915/lnl=3A_Extend_C10/C20_phy?=
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

--===============4436930226175616597==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/3] drm/i915/lnl: Extend C10/C20 phy
URL   : https://patchwork.freedesktop.org/series/125857/
State : success

== Summary ==

CI Bug Log - changes from xe-461-49b8b946bd15ce7c4d19b2c0fde51fed7b7c7db0_BAT -> xe-pw-125857v1_BAT
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

  Here are the changes found in xe-pw-125857v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([i915#2346])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-461-49b8b946bd15ce7c4d19b2c0fde51fed7b7c7db0/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125857v1/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-7:         [PASS][3] -> [FAIL][4] ([Intel XE#480]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-461-49b8b946bd15ce7c4d19b2c0fde51fed7b7c7db0/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125857v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346


Build changes
-------------

  * Linux: xe-461-49b8b946bd15ce7c4d19b2c0fde51fed7b7c7db0 -> xe-pw-125857v1

  IGT_7568: 9e3c3791e7e0297f277211b19a3388a1ee87f3d0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-461-49b8b946bd15ce7c4d19b2c0fde51fed7b7c7db0: 49b8b946bd15ce7c4d19b2c0fde51fed7b7c7db0
  xe-pw-125857v1: 125857v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125857v1/index.html

--===============4436930226175616597==
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
<tr><td><b>Series:</b></td><td>series starting with [1/3] drm/i915/lnl: Extend C10/C20 phy</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125857/">https://patchwork.freedesktop.org/series/125857/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125857v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125857v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-461-49b8b946bd15ce7c4d19b2c0fde51fed7b7c7db0_BAT -&gt; xe-pw-125857v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-125857v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-461-49b8b946bd15ce7c4d19b2c0fde51fed7b7c7db0/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125857v1/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-461-49b8b946bd15ce7c4d19b2c0fde51fed7b7c7db0/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125857v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-461-49b8b946bd15ce7c4d19b2c0fde51fed7b7c7db0 -&gt; xe-pw-125857v1</li>
</ul>
<p>IGT_7568: 9e3c3791e7e0297f277211b19a3388a1ee87f3d0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-461-49b8b946bd15ce7c4d19b2c0fde51fed7b7c7db0: 49b8b946bd15ce7c4d19b2c0fde51fed7b7c7db0<br />
  xe-pw-125857v1: 125857v1</p>

</body>
</html>

--===============4436930226175616597==--

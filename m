Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479C8C52D7C
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 20:16:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1E310E365;
	Mon, 19 Aug 2024 20:16:54 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B588010E364;
 Mon, 19 Aug 2024 20:16:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2840204923089455136=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/i915/display=3A_platform_ide?=
 =?utf-8?q?ntification_with_display-=3Eis=2E=3CPLATFORM=3E_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 19 Aug 2024 20:16:53 -0000
Message-ID: <172409861373.694904.5264747579307808315@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1724092799.git.jani.nikula@intel.com>
In-Reply-To: <cover.1724092799.git.jani.nikula@intel.com>
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

--===============2840204923089455136==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: platform identification with display->is.<PLATFORM> (rev3)
URL   : https://patchwork.freedesktop.org/series/135017/
State : success

== Summary ==

CI Bug Log - changes from xe-1796-19d5b3fcc4a8dcf26076e522c794164f4d3e40c0_BAT -> xe-pw-135017v3_BAT
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

  Here are the changes found in xe-pw-135017v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][1] -> [DMESG-FAIL][2] ([Intel XE#324])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1796-19d5b3fcc4a8dcf26076e522c794164f4d3e40c0/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135017v3/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_exec_fault_mode@twice-basic-prefetch:
    - bat-bmg-1:          [PASS][3] -> [DMESG-WARN][4] ([Intel XE#877])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1796-19d5b3fcc4a8dcf26076e522c794164f4d3e40c0/bat-bmg-1/igt@xe_exec_fault_mode@twice-basic-prefetch.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135017v3/bat-bmg-1/igt@xe_exec_fault_mode@twice-basic-prefetch.html

  
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * IGT: IGT_7975 -> IGT_7976
  * Linux: xe-1796-19d5b3fcc4a8dcf26076e522c794164f4d3e40c0 -> xe-pw-135017v3

  IGT_7975: 7975
  IGT_7976: 41e91236c40668d603495a21e5a22708a6501121 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1796-19d5b3fcc4a8dcf26076e522c794164f4d3e40c0: 19d5b3fcc4a8dcf26076e522c794164f4d3e40c0
  xe-pw-135017v3: 135017v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135017v3/index.html

--===============2840204923089455136==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: platform identification with display-&gt;is.&lt;PLATFORM&gt; (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135017/">https://patchwork.freedesktop.org/series/135017/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135017v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135017v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1796-19d5b3fcc4a8dcf26076e522c794164f4d3e40c0_BAT -&gt; xe-pw-135017v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135017v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1796-19d5b3fcc4a8dcf26076e522c794164f4d3e40c0/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135017v3/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-basic-prefetch:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1796-19d5b3fcc4a8dcf26076e522c794164f4d3e40c0/bat-bmg-1/igt@xe_exec_fault_mode@twice-basic-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135017v3/bat-bmg-1/igt@xe_exec_fault_mode@twice-basic-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7975 -&gt; IGT_7976</li>
<li>Linux: xe-1796-19d5b3fcc4a8dcf26076e522c794164f4d3e40c0 -&gt; xe-pw-135017v3</li>
</ul>
<p>IGT_7975: 7975<br />
  IGT_7976: 41e91236c40668d603495a21e5a22708a6501121 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1796-19d5b3fcc4a8dcf26076e522c794164f4d3e40c0: 19d5b3fcc4a8dcf26076e522c794164f4d3e40c0<br />
  xe-pw-135017v3: 135017v3</p>

</body>
</html>

--===============2840204923089455136==--

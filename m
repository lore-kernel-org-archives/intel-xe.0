Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D660E7717F
	for <intel-xe@archiver.kernel.org>; Mon, 16 Dec 2024 08:08:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2729C10E10D;
	Mon, 16 Dec 2024 08:08:48 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC9F10E10D;
 Mon, 16 Dec 2024 08:08:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6113730447828154797=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/i915/display=3A_handle_hdmi_?=
 =?utf-8?q?connector_init_failures=2C_and_no_HDMI/DP_cases_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Dec 2024 08:08:46 -0000
Message-ID: <173433652684.3208802.10374286391318318186@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1734099220.git.jani.nikula@intel.com>
In-Reply-To: <cover.1734099220.git.jani.nikula@intel.com>
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

--===============6113730447828154797==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: handle hdmi connector init failures, and no HDMI/DP cases (rev2)
URL   : https://patchwork.freedesktop.org/series/142118/
State : success

== Summary ==

CI Bug Log - changes from xe-2371-fb3d98511a2f6375a5c989ca5520aa31b689b119_BAT -> xe-pw-142118v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-142118v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [PASS][1] -> [SKIP][2] ([Intel XE#455]) +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2371-fb3d98511a2f6375a5c989ca5520aa31b689b119/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v2/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-page-flip@edp-1:
    - bat-adlp-7:         [PASS][3] -> [DMESG-WARN][4] ([Intel XE#3517]) +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2371-fb3d98511a2f6375a5c989ca5520aa31b689b119/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v2/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-dpms@a-edp1:
    - bat-lnl-1:          [DMESG-WARN][5] ([Intel XE#3729]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2371-fb3d98511a2f6375a5c989ca5520aa31b689b119/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html

  
  [Intel XE#3517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3517
  [Intel XE#3729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3729
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * Linux: xe-2371-fb3d98511a2f6375a5c989ca5520aa31b689b119 -> xe-pw-142118v2

  IGT_8156: edf352a96646c8d793f0c1eb11795112f9bde725 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2371-fb3d98511a2f6375a5c989ca5520aa31b689b119: fb3d98511a2f6375a5c989ca5520aa31b689b119
  xe-pw-142118v2: 142118v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v2/index.html

--===============6113730447828154797==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: handle hdmi connector init failures, and no HDMI/DP cases (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142118/">https://patchwork.freedesktop.org/series/142118/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2371-fb3d98511a2f6375a5c989ca5520aa31b689b119_BAT -&gt; xe-pw-142118v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142118v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2371-fb3d98511a2f6375a5c989ca5520aa31b689b119/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v2/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip@edp-1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2371-fb3d98511a2f6375a5c989ca5520aa31b689b119/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v2/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3517">Intel XE#3517</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-dpms@a-edp1:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2371-fb3d98511a2f6375a5c989ca5520aa31b689b119/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3729">Intel XE#3729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2371-fb3d98511a2f6375a5c989ca5520aa31b689b119 -&gt; xe-pw-142118v2</li>
</ul>
<p>IGT_8156: edf352a96646c8d793f0c1eb11795112f9bde725 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2371-fb3d98511a2f6375a5c989ca5520aa31b689b119: fb3d98511a2f6375a5c989ca5520aa31b689b119<br />
  xe-pw-142118v2: 142118v2</p>

</body>
</html>

--===============6113730447828154797==--

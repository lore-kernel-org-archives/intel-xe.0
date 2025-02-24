Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C530EC021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 23:11:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0FDE10E088;
	Mon, 24 Feb 2025 23:10:56 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0B210E075;
 Mon, 24 Feb 2025 23:10:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5622565656300970988=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_xe=5Fgen=5Fwa=5Fo?=
 =?utf-8?q?ob=3A_replace_program=5Finvocation=5Fshort=5Fname_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniel Gomez via B4 Relay" <devnull+da.gomez.samsung.com@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Feb 2025 23:10:55 -0000
Message-ID: <174043865562.1758402.7528164931362168731@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250224-macos-build-support-xe-v3-1-d2c9ed3a27cc@samsung.com>
In-Reply-To: <20250224-macos-build-support-xe-v3-1-d2c9ed3a27cc@samsung.com>
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

--===============5622565656300970988==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: xe_gen_wa_oob: replace program_invocation_short_name (rev2)
URL   : https://patchwork.freedesktop.org/series/139088/
State : success

== Summary ==

CI Bug Log - changes from xe-2703-9c30a334a46272b014f3923d3d5c29ba0f962de7_BAT -> xe-pw-139088v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-139088v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_pat@pat-index-xelp@render:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3970]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2703-9c30a334a46272b014f3923d3d5c29ba0f962de7/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139088v2/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html

  
#### Possible fixes ####

  * igt@xe_vm@munmap-style-unbind-userptr-one-partial:
    - bat-adlp-vf:        [DMESG-WARN][3] ([Intel XE#3970]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2703-9c30a334a46272b014f3923d3d5c29ba0f962de7/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-userptr-one-partial.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139088v2/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-userptr-one-partial.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * Linux: xe-2703-9c30a334a46272b014f3923d3d5c29ba0f962de7 -> xe-pw-139088v2

  IGT_8246: 2670886863d5821273146d7f94cdd3c8e3a4fe0b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2703-9c30a334a46272b014f3923d3d5c29ba0f962de7: 9c30a334a46272b014f3923d3d5c29ba0f962de7
  xe-pw-139088v2: 139088v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139088v2/index.html

--===============5622565656300970988==
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
<tr><td><b>Series:</b></td><td>drm/xe: xe_gen_wa_oob: replace program_invocation_short_name (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139088/">https://patchwork.freedesktop.org/series/139088/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139088v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139088v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2703-9c30a334a46272b014f3923d3d5c29ba0f962de7_BAT -&gt; xe-pw-139088v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139088v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_pat@pat-index-xelp@render:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2703-9c30a334a46272b014f3923d3d5c29ba0f962de7/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139088v2/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_vm@munmap-style-unbind-userptr-one-partial:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2703-9c30a334a46272b014f3923d3d5c29ba0f962de7/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-userptr-one-partial.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139088v2/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-userptr-one-partial.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2703-9c30a334a46272b014f3923d3d5c29ba0f962de7 -&gt; xe-pw-139088v2</li>
</ul>
<p>IGT_8246: 2670886863d5821273146d7f94cdd3c8e3a4fe0b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2703-9c30a334a46272b014f3923d3d5c29ba0f962de7: 9c30a334a46272b014f3923d3d5c29ba0f962de7<br />
  xe-pw-139088v2: 139088v2</p>

</body>
</html>

--===============5622565656300970988==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FD7C3ABCB
	for <intel-xe@archiver.kernel.org>; Sun, 11 May 2025 23:35:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8330F10E1B9;
	Sun, 11 May 2025 23:35:10 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81CC410E177;
 Sun, 11 May 2025 23:35:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4496358007891979323=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm=3A_Create_an_app_info_o?=
 =?utf-8?q?ption_for_wedge_events_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 11 May 2025 23:35:08 -0000
Message-ID: <174700650852.67151.10681327983665200928@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250511224745.834446-1-andrealmeid@igalia.com>
In-Reply-To: <20250511224745.834446-1-andrealmeid@igalia.com>
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

--===============4496358007891979323==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm: Create an app info option for wedge events (rev2)
URL   : https://patchwork.freedesktop.org/series/145636/
State : success

== Summary ==

CI Bug Log - changes from xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9_BAT -> xe-pw-145636v2_BAT
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

  Here are the changes found in xe-pw-145636v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_pat@pat-index-xelp@render:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#3970]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145636v2/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * IGT: IGT_8359 -> IGT_8360
  * Linux: xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9 -> xe-pw-145636v2

  IGT_8359: 807f0cbcc771d1d0bb0d27a78231a5f92dc02126 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8360: b6a8dbcc0b75910046f88ac40d7274aa74d7d651 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9: b0db97d4270c697ade930cfefdb7aaef12cd80c9
  xe-pw-145636v2: 145636v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145636v2/index.html

--===============4496358007891979323==
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
<tr><td><b>Series:</b></td><td>drm: Create an app info option for wedge events (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145636/">https://patchwork.freedesktop.org/series/145636/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145636v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145636v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9_BAT -&gt; xe-pw-145636v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-145636v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_pat@pat-index-xelp@render:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145636v2/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8359 -&gt; IGT_8360</li>
<li>Linux: xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9 -&gt; xe-pw-145636v2</li>
</ul>
<p>IGT_8359: 807f0cbcc771d1d0bb0d27a78231a5f92dc02126 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8360: b6a8dbcc0b75910046f88ac40d7274aa74d7d651 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9: b0db97d4270c697ade930cfefdb7aaef12cd80c9<br />
  xe-pw-145636v2: 145636v2</p>

</body>
</html>

--===============4496358007891979323==--

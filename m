Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7488FCCD199
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 12:32:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C80810E296;
	Mon, 20 Oct 2025 12:32:39 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1477010E293;
 Mon, 20 Oct 2025 12:32:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1954804776495682041=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_AuxCCS_handling_and_render_?=
 =?utf-8?q?compression_modifiers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 20 Oct 2025 12:32:38 -0000
Message-ID: <176096355807.32745.8834208691386005307@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251020075831.32818-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20251020075831.32818-1-tvrtko.ursulin@igalia.com>
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

--===============1954804776495682041==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: AuxCCS handling and render compression modifiers
URL   : https://patchwork.freedesktop.org/series/156189/
State : success

== Summary ==

CI Bug Log - changes from xe-3948-40486e8e3e6a7c4e624d36e69cd0d023c90aab90_BAT -> xe-pw-156189v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 12)
------------------------------

  Additional (1): bat-ptl-vm 

Known issues
------------

  Here are the changes found in xe-pw-156189v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_module_load@load:
    - bat-ptl-vm:         NOTRUN -> [ABORT][1] ([Intel XE#6349])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156189v1/bat-ptl-vm/igt@xe_module_load@load.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@c-edp1:
    - bat-adlp-7:         [DMESG-WARN][2] ([Intel XE#4543]) -> [PASS][3] +1 other test pass
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3948-40486e8e3e6a7c4e624d36e69cd0d023c90aab90/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156189v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#6349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6349


Build changes
-------------

  * Linux: xe-3948-40486e8e3e6a7c4e624d36e69cd0d023c90aab90 -> xe-pw-156189v1

  IGT_8592: b3d809d537febc23792ab8d0eb6d13cf80d626c8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3948-40486e8e3e6a7c4e624d36e69cd0d023c90aab90: 40486e8e3e6a7c4e624d36e69cd0d023c90aab90
  xe-pw-156189v1: 156189v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156189v1/index.html

--===============1954804776495682041==
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
<tr><td><b>Series:</b></td><td>AuxCCS handling and render compression modifiers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156189/">https://patchwork.freedesktop.org/series/156189/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156189v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156189v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3948-40486e8e3e6a7c4e624d36e69cd0d023c90aab90_BAT -&gt; xe-pw-156189v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 12)</h2>
<p>Additional (1): bat-ptl-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156189v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156189v1/bat-ptl-vm/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6349">Intel XE#6349</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3948-40486e8e3e6a7c4e624d36e69cd0d023c90aab90/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156189v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3948-40486e8e3e6a7c4e624d36e69cd0d023c90aab90 -&gt; xe-pw-156189v1</li>
</ul>
<p>IGT_8592: b3d809d537febc23792ab8d0eb6d13cf80d626c8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3948-40486e8e3e6a7c4e624d36e69cd0d023c90aab90: 40486e8e3e6a7c4e624d36e69cd0d023c90aab90<br />
  xe-pw-156189v1: 156189v1</p>

</body>
</html>

--===============1954804776495682041==--

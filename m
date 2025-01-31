Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889B4C0218D
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 08:44:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530F110EA3B;
	Fri, 31 Jan 2025 08:44:25 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5267710EA3B;
 Fri, 31 Jan 2025 08:44:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3253590750860281855=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Skip_survivabilit?=
 =?utf-8?q?y_mode_for_VF?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 Jan 2025 08:44:24 -0000
Message-ID: <173831306432.3146289.4779368933518374384@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250131080527.2256475-1-riana.tauro@intel.com>
In-Reply-To: <20250131080527.2256475-1-riana.tauro@intel.com>
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

--===============3253590750860281855==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Skip survivability mode for VF
URL   : https://patchwork.freedesktop.org/series/144169/
State : success

== Summary ==

CI Bug Log - changes from xe-2578-0c2a60e7f1e779d87754254d9e3443beedbb684e_BAT -> xe-pw-144169v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 6)
------------------------------

  Missing    (1): bat-bmg-1 

Known issues
------------

  Here are the changes found in xe-pw-144169v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_basic@twice-bindexecqueue-rebind:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3970] / [Intel XE#4078])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2578-0c2a60e7f1e779d87754254d9e3443beedbb684e/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144169v1/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html

  
#### Possible fixes ####

  * igt@xe_exec_balancer@twice-virtual-rebind:
    - bat-adlp-vf:        [DMESG-WARN][3] ([Intel XE#4078]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2578-0c2a60e7f1e779d87754254d9e3443beedbb684e/bat-adlp-vf/igt@xe_exec_balancer@twice-virtual-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144169v1/bat-adlp-vf/igt@xe_exec_balancer@twice-virtual-rebind.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078


Build changes
-------------

  * Linux: xe-2578-0c2a60e7f1e779d87754254d9e3443beedbb684e -> xe-pw-144169v1

  IGT_8218: fafef52e0a83fec5f8c4f8df851d27319467762b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2578-0c2a60e7f1e779d87754254d9e3443beedbb684e: 0c2a60e7f1e779d87754254d9e3443beedbb684e
  xe-pw-144169v1: 144169v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144169v1/index.html

--===============3253590750860281855==
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
<tr><td><b>Series:</b></td><td>drm/xe: Skip survivability mode for VF</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144169/">https://patchwork.freedesktop.org/series/144169/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144169v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144169v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2578-0c2a60e7f1e779d87754254d9e3443beedbb684e_BAT -&gt; xe-pw-144169v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 6)</h2>
<p>Missing    (1): bat-bmg-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144169v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_basic@twice-bindexecqueue-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2578-0c2a60e7f1e779d87754254d9e3443beedbb684e/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144169v1/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078">Intel XE#4078</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_balancer@twice-virtual-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2578-0c2a60e7f1e779d87754254d9e3443beedbb684e/bat-adlp-vf/igt@xe_exec_balancer@twice-virtual-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078">Intel XE#4078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144169v1/bat-adlp-vf/igt@xe_exec_balancer@twice-virtual-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2578-0c2a60e7f1e779d87754254d9e3443beedbb684e -&gt; xe-pw-144169v1</li>
</ul>
<p>IGT_8218: fafef52e0a83fec5f8c4f8df851d27319467762b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2578-0c2a60e7f1e779d87754254d9e3443beedbb684e: 0c2a60e7f1e779d87754254d9e3443beedbb684e<br />
  xe-pw-144169v1: 144169v1</p>

</body>
</html>

--===============3253590750860281855==--

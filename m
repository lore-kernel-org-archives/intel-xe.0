Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFA5D6EC05
	for <intel-xe@archiver.kernel.org>; Fri, 29 Nov 2024 12:11:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B02A10E025;
	Fri, 29 Nov 2024 12:11:22 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5563910E025;
 Fri, 29 Nov 2024 12:11:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5818635948503689309=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/2?=
 =?utf-8?q?=5D_drm/i915/display=3A_add_hdcp_sub-struct_to_struct_intel=5Fdig?=
 =?utf-8?q?ital=5Fport?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 29 Nov 2024 12:11:21 -0000
Message-ID: <173288228134.275289.18339730037296077647@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241129112012.474228-1-jani.nikula@intel.com>
In-Reply-To: <20241129112012.474228-1-jani.nikula@intel.com>
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

--===============5818635948503689309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/i915/display: add hdcp sub-struct to struct intel_digital_port
URL   : https://patchwork.freedesktop.org/series/141922/
State : success

== Summary ==

CI Bug Log - changes from xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7_BAT -> xe-pw-141922v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-lnl-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8130 -> IGT_8131
  * Linux: xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7 -> xe-pw-141922v1

  IGT_8130: 52c84deb5f45bcbd3c2b22d1fcff01d4c522cb62 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8131: f846ef8f7ddf051c88504c607136a9b5392bdef7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7: 4f5b3a832a6480c82639b5500d731d7222b7eee7
  xe-pw-141922v1: 141922v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/index.html

--===============5818635948503689309==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/i915/display: add hdcp sub-struct to struct intel_digital_port</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141922/">https://patchwork.freedesktop.org/series/141922/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7_BAT -&gt; xe-pw-141922v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-lnl-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8130 -&gt; IGT_8131</li>
<li>Linux: xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7 -&gt; xe-pw-141922v1</li>
</ul>
<p>IGT_8130: 52c84deb5f45bcbd3c2b22d1fcff01d4c522cb62 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8131: f846ef8f7ddf051c88504c607136a9b5392bdef7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7: 4f5b3a832a6480c82639b5500d731d7222b7eee7<br />
  xe-pw-141922v1: 141922v1</p>

</body>
</html>

--===============5818635948503689309==--

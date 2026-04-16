Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2425BF8D777
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 20:13:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E3510E231;
	Thu, 16 Apr 2026 20:13:06 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B3110E231;
 Thu, 16 Apr 2026 20:13:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0711423375721017985=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/hdcp=3A_Add_NULL_che?=
 =?utf-8?q?ck_for_media=5Fgt_in_intel=5Fhdcp=5Fgsc=5Fcheck=5Fstatus=28=29_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 Apr 2026 20:13:05 -0000
Message-ID: <177637038539.470241.5871430181520926440@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260416-check-for-null-media_gt-in-intel_hdcp_gsc_check_status-v2-1-9adb9fd3b621@intel.com>
In-Reply-To: <20260416-check-for-null-media_gt-in-intel_hdcp_gsc_check_status-v2-1-9adb9fd3b621@intel.com>
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

--===============0711423375721017985==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/hdcp: Add NULL check for media_gt in intel_hdcp_gsc_check_status() (rev2)
URL   : https://patchwork.freedesktop.org/series/162450/
State : success

== Summary ==

CI Bug Log - changes from xe-4914-0898052c06eacd13f9fcbc2728072017274d7af3_BAT -> xe-pw-162450v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4914-0898052c06eacd13f9fcbc2728072017274d7af3 -> xe-pw-162450v2

  IGT_8862: 9b95600c4ae2cb683a8a19ad2a7c006263811a8f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4914-0898052c06eacd13f9fcbc2728072017274d7af3: 0898052c06eacd13f9fcbc2728072017274d7af3
  xe-pw-162450v2: 162450v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162450v2/index.html

--===============0711423375721017985==
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
<tr><td><b>Series:</b></td><td>drm/xe/hdcp: Add NULL check for media_gt in intel_hdcp_gsc_check_status() (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162450/">https://patchwork.freedesktop.org/series/162450/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162450v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162450v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4914-0898052c06eacd13f9fcbc2728072017274d7af3_BAT -&gt; xe-pw-162450v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4914-0898052c06eacd13f9fcbc2728072017274d7af3 -&gt; xe-pw-162450v2</li>
</ul>
<p>IGT_8862: 9b95600c4ae2cb683a8a19ad2a7c006263811a8f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4914-0898052c06eacd13f9fcbc2728072017274d7af3: 0898052c06eacd13f9fcbc2728072017274d7af3<br />
  xe-pw-162450v2: 162450v2</p>

</body>
</html>

--===============0711423375721017985==--

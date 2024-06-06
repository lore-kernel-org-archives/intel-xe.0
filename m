Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66ADC25B75
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 06:14:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F02210E545;
	Thu,  6 Jun 2024 06:14:58 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3423C10E545;
 Thu,  6 Jun 2024 06:14:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0836317321034546179=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyTIENJLkJBVDogc3VjY2VzcyBmb3IgeGVfZ3RfaWRsZSBmaXhlcyAocmV2Mik=?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Jun 2024 06:14:57 -0000
Message-ID: <171765449720.3618.2735003856017398531@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240606055401.934750-1-riana.tauro@intel.com>
In-Reply-To: <20240606055401.934750-1-riana.tauro@intel.com>
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

--===============0836317321034546179==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe_gt_idle fixes (rev2)
URL   : https://patchwork.freedesktop.org/series/133519/
State : success

== Summary ==

CI Bug Log - changes from xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9_BAT -> xe-pw-133519v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-adlp-7 

Known issues
------------

  Here are the changes found in xe-pw-133519v2_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069


Build changes
-------------

  * Linux: xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9 -> xe-pw-133519v2

  IGT_7879: 08560f766a505e729dfee2846c1c11d28dd0e3d0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9: ec3e566521b91eb773769fa1df899a28063a10e9
  xe-pw-133519v2: 133519v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133519v2/index.html

--===============0836317321034546179==
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
<tr><td><b>Series:</b></td><td>xe_gt_idle fixes (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133519/">https://patchwork.freedesktop.org/series/133519/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133519v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133519v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9_BAT -&gt; xe-pw-133519v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-adlp-7 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133519v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9 -&gt; xe-pw-133519v2</li>
</ul>
<p>IGT_7879: 08560f766a505e729dfee2846c1c11d28dd0e3d0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1407-ec3e566521b91eb773769fa1df899a28063a10e9: ec3e566521b91eb773769fa1df899a28063a10e9<br />
  xe-pw-133519v2: 133519v2</p>

</body>
</html>

--===============0836317321034546179==--

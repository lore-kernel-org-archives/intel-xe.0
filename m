Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61896F5A8A3
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 17:24:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8A110E244;
	Mon, 20 Apr 2026 17:24:10 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CCC210E244;
 Mon, 20 Apr 2026 17:24:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4292495946057791591=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_=3A_drm/i915/display=3A_Fix?=
 =?utf-8?q?_vblank_timestamps_for_fixed_RR_on_VRR-TG-always_platforms?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vidya Srinivas" <vidya.srinivas@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 20 Apr 2026 17:24:09 -0000
Message-ID: <177670584963.477004.8544056751657617868@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260417124439.206962-1-vidya.srinivas@intel.com>
In-Reply-To: <20260417124439.206962-1-vidya.srinivas@intel.com>
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

--===============4292495946057791591==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: : drm/i915/display: Fix vblank timestamps for fixed RR on VRR-TG-always platforms
URL   : https://patchwork.freedesktop.org/series/165069/
State : success

== Summary ==

CI Bug Log - changes from xe-4919-3b9ca4c40814c96c38986ae2ba6651e43757ca5f_BAT -> xe-pw-165069v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-ptl-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4919-3b9ca4c40814c96c38986ae2ba6651e43757ca5f -> xe-pw-165069v1

  IGT_8863: 5b279a8b71dc1672099205a1a9e8135c7c7fadb5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4919-3b9ca4c40814c96c38986ae2ba6651e43757ca5f: 3b9ca4c40814c96c38986ae2ba6651e43757ca5f
  xe-pw-165069v1: 165069v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165069v1/index.html

--===============4292495946057791591==
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
<tr><td><b>Series:</b></td><td>: drm/i915/display: Fix vblank timestamps for fixed RR on VRR-TG-always platforms</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165069/">https://patchwork.freedesktop.org/series/165069/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165069v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165069v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4919-3b9ca4c40814c96c38986ae2ba6651e43757ca5f_BAT -&gt; xe-pw-165069v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-ptl-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4919-3b9ca4c40814c96c38986ae2ba6651e43757ca5f -&gt; xe-pw-165069v1</li>
</ul>
<p>IGT_8863: 5b279a8b71dc1672099205a1a9e8135c7c7fadb5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4919-3b9ca4c40814c96c38986ae2ba6651e43757ca5f: 3b9ca4c40814c96c38986ae2ba6651e43757ca5f<br />
  xe-pw-165069v1: 165069v1</p>

</body>
</html>

--===============4292495946057791591==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139D7C54798
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 20:08:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B864210E67A;
	Tue, 27 Feb 2024 20:08:14 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D0E10E67A;
 Tue, 27 Feb 2024 20:08:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9201568200975591645=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Stop_checking_for_powe?=
 =?utf-8?q?r=5Flost_on_D3Cold?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 Feb 2024 20:08:13 -0000
Message-ID: <170906449327.351698.14343649359185010848@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240227184330.506881-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240227184330.506881-1-rodrigo.vivi@intel.com>
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

--===============9201568200975591645==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Stop checking for power_lost on D3Cold
URL   : https://patchwork.freedesktop.org/series/130451/
State : success

== Summary ==

CI Bug Log - changes from xe-862-0d7a78693be62a8d1cd311376815b89b18de8204_BAT -> xe-pw-130451v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-862-0d7a78693be62a8d1cd311376815b89b18de8204 -> xe-pw-130451v1

  IGT_7731: 17f897a81868fb35c6a7033a8b07256659742248 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-862-0d7a78693be62a8d1cd311376815b89b18de8204: 0d7a78693be62a8d1cd311376815b89b18de8204
  xe-pw-130451v1: 130451v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130451v1/index.html

--===============9201568200975591645==
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
<tr><td><b>Series:</b></td><td>drm/xe: Stop checking for power_lost on D3Cold</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130451/">https://patchwork.freedesktop.org/series/130451/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130451v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130451v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-862-0d7a78693be62a8d1cd311376815b89b18de8204_BAT -&gt; xe-pw-130451v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-862-0d7a78693be62a8d1cd311376815b89b18de8204 -&gt; xe-pw-130451v1</li>
</ul>
<p>IGT_7731: 17f897a81868fb35c6a7033a8b07256659742248 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-862-0d7a78693be62a8d1cd311376815b89b18de8204: 0d7a78693be62a8d1cd311376815b89b18de8204<br />
  xe-pw-130451v1: 130451v1</p>

</body>
</html>

--===============9201568200975591645==--

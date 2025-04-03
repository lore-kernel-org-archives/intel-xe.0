Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED36C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 08:18:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B46D10E066;
	Thu,  3 Apr 2025 08:18:40 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522D710E066;
 Thu,  3 Apr 2025 08:18:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8048111807492960809=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Introduce_drm_sharpness_pro?=
 =?utf-8?q?perty_=28rev12=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Apr 2025 08:18:39 -0000
Message-ID: <174366831932.31291.11589241161944410338@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250402125647.361295-1-nemesa.garg@intel.com>
In-Reply-To: <20250402125647.361295-1-nemesa.garg@intel.com>
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

--===============8048111807492960809==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce drm sharpness property (rev12)
URL   : https://patchwork.freedesktop.org/series/139954/
State : success

== Summary ==

CI Bug Log - changes from xe-2899-8f917568adaeea8b649e337e7d0e03bd03332253_BAT -> xe-pw-139954v12_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8301 -> IGT_8302
  * Linux: xe-2899-8f917568adaeea8b649e337e7d0e03bd03332253 -> xe-pw-139954v12

  IGT_8301: 8301
  IGT_8302: e2f972e6e21cd7bae732a649889325d2175bd1a5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2899-8f917568adaeea8b649e337e7d0e03bd03332253: 8f917568adaeea8b649e337e7d0e03bd03332253
  xe-pw-139954v12: 139954v12

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v12/index.html

--===============8048111807492960809==
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
<tr><td><b>Series:</b></td><td>Introduce drm sharpness property (rev12)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139954/">https://patchwork.freedesktop.org/series/139954/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v12/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v12/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2899-8f917568adaeea8b649e337e7d0e03bd03332253_BAT -&gt; xe-pw-139954v12_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8301 -&gt; IGT_8302</li>
<li>Linux: xe-2899-8f917568adaeea8b649e337e7d0e03bd03332253 -&gt; xe-pw-139954v12</li>
</ul>
<p>IGT_8301: 8301<br />
  IGT_8302: e2f972e6e21cd7bae732a649889325d2175bd1a5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2899-8f917568adaeea8b649e337e7d0e03bd03332253: 8f917568adaeea8b649e337e7d0e03bd03332253<br />
  xe-pw-139954v12: 139954v12</p>

</body>
</html>

--===============8048111807492960809==--

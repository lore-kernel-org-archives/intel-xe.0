Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF02C3ABD8
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 21:33:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C974610EB9B;
	Fri, 16 May 2025 21:33:04 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9490A10EB9B;
 Fri, 16 May 2025 21:33:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0612963752183951016=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/oa=3A_Expose_media_O?=
 =?utf-8?q?A_units_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 May 2025 21:33:03 -0000
Message-ID: <174743118359.90138.4370963561806116207@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250516204750.2135983-2-ashutosh.dixit@intel.com>
In-Reply-To: <20250516204750.2135983-2-ashutosh.dixit@intel.com>
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

--===============0612963752183951016==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/oa: Expose media OA units (rev2)
URL   : https://patchwork.freedesktop.org/series/149133/
State : success

== Summary ==

CI Bug Log - changes from xe-3103-9c0f4c692985eaa0b88ed12a16ec197e83707501_BAT -> xe-pw-149133v2_BAT
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

  * Linux: xe-3103-9c0f4c692985eaa0b88ed12a16ec197e83707501 -> xe-pw-149133v2

  IGT_8366: 8366
  xe-3103-9c0f4c692985eaa0b88ed12a16ec197e83707501: 9c0f4c692985eaa0b88ed12a16ec197e83707501
  xe-pw-149133v2: 149133v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149133v2/index.html

--===============0612963752183951016==
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
<tr><td><b>Series:</b></td><td>drm/xe/oa: Expose media OA units (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149133/">https://patchwork.freedesktop.org/series/149133/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149133v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149133v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3103-9c0f4c692985eaa0b88ed12a16ec197e83707501_BAT -&gt; xe-pw-149133v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3103-9c0f4c692985eaa0b88ed12a16ec197e83707501 -&gt; xe-pw-149133v2</li>
</ul>
<p>IGT_8366: 8366<br />
  xe-3103-9c0f4c692985eaa0b88ed12a16ec197e83707501: 9c0f4c692985eaa0b88ed12a16ec197e83707501<br />
  xe-pw-149133v2: 149133v2</p>

</body>
</html>

--===============0612963752183951016==--

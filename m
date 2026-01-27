Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14122D2FEF8
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 22:33:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D088310E210;
	Tue, 27 Jan 2026 22:33:20 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B359A10E210;
 Tue, 27 Jan 2026 22:33:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0848502694919070069=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/configfs=3A_Add_srio?=
 =?utf-8?q?v=2Eadmin=5Fonly=5Fpf_attribute_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 Jan 2026 22:33:19 -0000
Message-ID: <176955319973.197481.12803535633837663784@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260121214218.2817-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260121214218.2817-1-michal.wajdeczko@intel.com>
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

--===============0848502694919070069==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/configfs: Add sriov.admin_only_pf attribute (rev2)
URL   : https://patchwork.freedesktop.org/series/160448/
State : success

== Summary ==

CI Bug Log - changes from xe-4458-786060d864f2e568a6ff216c63b927f80da2c043_BAT -> xe-pw-160448v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): bat-bmg-3 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4458-786060d864f2e568a6ff216c63b927f80da2c043 -> xe-pw-160448v2

  IGT_8720: b37a4d70080afd7426cb249787545df75f762dc0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4458-786060d864f2e568a6ff216c63b927f80da2c043: 786060d864f2e568a6ff216c63b927f80da2c043
  xe-pw-160448v2: 160448v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160448v2/index.html

--===============0848502694919070069==
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
<tr><td><b>Series:</b></td><td>drm/xe/configfs: Add sriov.admin_only_pf attribute (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160448/">https://patchwork.freedesktop.org/series/160448/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160448v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160448v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4458-786060d864f2e568a6ff216c63b927f80da2c043_BAT -&gt; xe-pw-160448v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): bat-bmg-3 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4458-786060d864f2e568a6ff216c63b927f80da2c043 -&gt; xe-pw-160448v2</li>
</ul>
<p>IGT_8720: b37a4d70080afd7426cb249787545df75f762dc0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4458-786060d864f2e568a6ff216c63b927f80da2c043: 786060d864f2e568a6ff216c63b927f80da2c043<br />
  xe-pw-160448v2: 160448v2</p>

</body>
</html>

--===============0848502694919070069==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA3FFC54ED1
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 15:15:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E1610E4D6;
	Tue, 27 May 2025 15:15:19 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34ED10E49E;
 Tue, 27 May 2025 15:15:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3414580795955093500=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Rework_eviction_r?=
 =?utf-8?q?ejection_of_bound_external_bos_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 May 2025 15:15:17 -0000
Message-ID: <174835891766.24728.13180422430559550769@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250526161632.20694-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250526161632.20694-1-thomas.hellstrom@linux.intel.com>
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

--===============3414580795955093500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Rework eviction rejection of bound external bos (rev2)
URL   : https://patchwork.freedesktop.org/series/149505/
State : success

== Summary ==

CI Bug Log - changes from xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5_BAT -> xe-pw-149505v2_BAT
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

  * Linux: xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5 -> xe-pw-149505v2

  IGT_8380: 8380
  xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5: 994b4d24e5526a8b1efca4ca25a3a3be47a886e5
  xe-pw-149505v2: 149505v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149505v2/index.html

--===============3414580795955093500==
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
<tr><td><b>Series:</b></td><td>drm/xe: Rework eviction rejection of bound external bos (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149505/">https://patchwork.freedesktop.org/series/149505/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149505v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149505v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5_BAT -&gt; xe-pw-149505v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5 -&gt; xe-pw-149505v2</li>
</ul>
<p>IGT_8380: 8380<br />
  xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5: 994b4d24e5526a8b1efca4ca25a3a3be47a886e5<br />
  xe-pw-149505v2: 149505v2</p>

</body>
</html>

--===============3414580795955093500==--

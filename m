Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3096C0218F
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 12:39:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE88D10EA93;
	Fri, 31 Jan 2025 12:39:33 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2DCE10E086;
 Fri, 31 Jan 2025 12:39:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7791534808817920194=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/display=3A_Add_missi?=
 =?utf-8?q?ng_watermark_ipc_update_at_runtime_resume?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 Jan 2025 12:39:31 -0000
Message-ID: <173832717185.3206920.9996111842731008638@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250131115014.29625-1-rodrigo.vivi@intel.com>
In-Reply-To: <20250131115014.29625-1-rodrigo.vivi@intel.com>
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

--===============7791534808817920194==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: Add missing watermark ipc update at runtime resume
URL   : https://patchwork.freedesktop.org/series/144177/
State : success

== Summary ==

CI Bug Log - changes from xe-2580-7998f28da73c50ffddff38ac74f5aa48a76a0b0a_BAT -> xe-pw-144177v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-2580-7998f28da73c50ffddff38ac74f5aa48a76a0b0a -> xe-pw-144177v1

  IGT_8218: fafef52e0a83fec5f8c4f8df851d27319467762b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2580-7998f28da73c50ffddff38ac74f5aa48a76a0b0a: 7998f28da73c50ffddff38ac74f5aa48a76a0b0a
  xe-pw-144177v1: 144177v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144177v1/index.html

--===============7791534808817920194==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: Add missing watermark ipc update at runtime resume</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144177/">https://patchwork.freedesktop.org/series/144177/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144177v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144177v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2580-7998f28da73c50ffddff38ac74f5aa48a76a0b0a_BAT -&gt; xe-pw-144177v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2580-7998f28da73c50ffddff38ac74f5aa48a76a0b0a -&gt; xe-pw-144177v1</li>
</ul>
<p>IGT_8218: fafef52e0a83fec5f8c4f8df851d27319467762b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2580-7998f28da73c50ffddff38ac74f5aa48a76a0b0a: 7998f28da73c50ffddff38ac74f5aa48a76a0b0a<br />
  xe-pw-144177v1: 144177v1</p>

</body>
</html>

--===============7791534808817920194==--

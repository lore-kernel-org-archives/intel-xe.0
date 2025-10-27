Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A177ACCF9EB
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 20:11:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661F410E17D;
	Mon, 27 Oct 2025 20:11:44 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722BE10E17D;
 Mon, 27 Oct 2025 20:11:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6560661916439273544=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Fix_uninitialize?=
 =?utf-8?q?d_return_value_from_xe=5Fvalidation=5Fguard=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 27 Oct 2025 20:11:43 -0000
Message-ID: <176159590345.60242.4529759517471947937@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251027131228.12098-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20251027131228.12098-1-thomas.hellstrom@linux.intel.com>
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

--===============6560661916439273544==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix uninitialized return value from xe_validation_guard()
URL   : https://patchwork.freedesktop.org/series/156581/
State : failure

== Summary ==

ERROR: The runconfig 'xe-3990-984f5117d7dc1d7596c375bbc18b82f3ec9b4c0e_FULL' does not exist in the database

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156581v1/index.html

--===============6560661916439273544==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix uninitialized return value from xe_validation_guard()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156581/">https://patchwork.freedesktop.org/series/156581/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156581v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156581v1/index.html</a></td></tr>

</table>


    <p>ERROR: The runconfig 'xe-3990-984f5117d7dc1d7596c375bbc18b82f3ec9b4c0e_FULL' does not exist in the database</p>

</body>
</html>

--===============6560661916439273544==--

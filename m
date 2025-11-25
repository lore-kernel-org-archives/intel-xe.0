Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC68D0EE1C
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 19:57:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0253010E453;
	Tue, 25 Nov 2025 19:57:34 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00AFB10E453;
 Tue, 25 Nov 2025 19:57:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8632319111497706969=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Due_to_SLA_agreement_betwe?=
 =?utf-8?q?en_PF_and_VFs=2C_multi_CCS_mode_can=27t_be_enabled_when_VFs_are_a?=
 =?utf-8?q?lready_enabled=2E_Similarly=2C_enabling_VFs_must_be_blocked_when_?=
 =?utf-8?q?multi_CCS_mode_enabled=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kumar G, Naresh" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Nov 2025 19:57:32 -0000
Message-ID: <176410065299.27009.18290789615871830371@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251015142820.2519054-2>
In-Reply-To: <20251015142820.2519054-2>
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

--===============8632319111497706969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Due to SLA agreement between PF and VFs, multi CCS mode can't be enabled when VFs are already enabled. Similarly, enabling VFs must be blocked when multi CCS mode enabled.
URL   : https://patchwork.freedesktop.org/series/158023/
State : failure

== Summary ==

ERROR: The runconfig 'xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362_FULL' does not exist in the database

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158023v1/index.html

--===============8632319111497706969==
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
<tr><td><b>Series:</b></td><td>Due to SLA agreement between PF and VFs, multi CCS mode can&#x27;t be enabled when VFs are already enabled. Similarly, enabling VFs must be blocked when multi CCS mode enabled.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158023/">https://patchwork.freedesktop.org/series/158023/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158023v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158023v1/index.html</a></td></tr>

</table>


    <p>ERROR: The runconfig 'xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362_FULL' does not exist in the database</p>

</body>
</html>

--===============8632319111497706969==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD26C77B7E
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 08:54:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 886EF10E83D;
	Thu, 25 May 2023 08:54:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0CA7E10E82B;
 Thu, 25 May 2023 08:54:35 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id EA1E8A02F0;
 Thu, 25 May 2023 08:54:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4099570274314568517=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Thu, 25 May 2023 08:54:34 -0000
Message-ID: <168500487492.5913.4455264545555900810@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230525081615.179819-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230525081615.179819-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=97=8B_CI=2EBAT=3A_info_for_drm/xe=3A_Fi?=
 =?utf-8?q?x_engine_lookup_refcount_race?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============4099570274314568517==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix engine lookup refcount race
URL   : https://patchwork.freedesktop.org/series/118355/
State : info

== Summary ==

Participating hosts:
bat-atsm-2
bat-dg2-oem2
bat-adlp-7
Missing hosts results[0]:
Results: [xe-pw-118355v1](https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-118355v1/index.html)



--===============4099570274314568517==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix engine lookup refcount race</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/118355/">https://patchwork.freedesktop.org/series/118355/</a></td></tr>
<tr><td><b>State:</b></td><td>info</td></tr>

</table>


    <p>Participating hosts:<br />
bat-atsm-2<br />
bat-dg2-oem2<br />
bat-adlp-7<br />
Missing hosts results[0]:<br />
Results: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-118355v1/index.html">xe-pw-118355v1</a></p>

</body>
</html>

--===============4099570274314568517==--

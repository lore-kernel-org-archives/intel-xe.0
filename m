Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F9DAC77B73
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 09:44:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26FF710E90D;
	Wed, 19 Apr 2023 09:44:29 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 05ACC10E90D;
 Wed, 19 Apr 2023 09:44:24 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E7C63AADF8;
 Wed, 19 Apr 2023 09:44:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4023730622201136653=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Date: Wed, 19 Apr 2023 09:44:23 -0000
Message-ID: <168189746394.10532.4324624833705796742@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230419090933.289818-1-riana.tauro@intel.com>
In-Reply-To: <20230419090933.289818-1-riana.tauro@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=97=8B_CI=2EBAT=3A_info_for_drm/xe/guc?=
 =?utf-8?q?=5Fpc=3A_Reorder_forcewake_and_xe=5Fpm=5Fruntime_calls?=
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

--===============4023730622201136653==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc_pc: Reorder forcewake and xe_pm_runtime calls
URL   : https://patchwork.freedesktop.org/series/116681/
State : info

== Summary ==

Participating hosts:
bat-atsm-2
bat-dg2-oem2
bat-adlp-7
Missing hosts results[1]:
bat-adlp-7
Results: [xe-pw-116681v1](https://intel-gfx-ci.01.org/tree/xe/xe-pw-116681v1/index.html)



--===============4023730622201136653==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc_pc: Reorder forcewake and xe_pm_runtime calls</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/116681/">https://patchwork.freedesktop.org/series/116681/</a></td></tr>
<tr><td><b>State:</b></td><td>info</td></tr>

</table>


    <p>Participating hosts:<br />
bat-atsm-2<br />
bat-dg2-oem2<br />
bat-adlp-7<br />
Missing hosts results[1]:<br />
bat-adlp-7<br />
Results: <a href="https://intel-gfx-ci.01.org/tree/xe/xe-pw-116681v1/index.html">xe-pw-116681v1</a></p>

</body>
</html>

--===============4023730622201136653==--

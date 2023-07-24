Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7786C001B0
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jul 2023 11:45:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37AAB10E2D7;
	Mon, 24 Jul 2023 11:45:06 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 062AF10E02E;
 Mon, 24 Jul 2023 11:45:05 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AFF46AADD6;
 Mon, 24 Jul 2023 11:45:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7936100842998365069=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Mon, 24 Jul 2023 11:45:04 -0000
Message-ID: <169019910469.30100.16802785201988058934@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230724104743.27471-2-matthew.auld@intel.com>
In-Reply-To: <20230724104743.27471-2-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=97=8B_CI=2EBAT=3A_info_for_drm/xe=3A_ad?=
 =?utf-8?q?d_lockdep_annotation_for_xe=5Fdevice=5Fmem=5Faccess=5Fput=28=29?=
 =?utf-8?q?_=28rev2=29?=
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

--===============7936100842998365069==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: add lockdep annotation for xe_device_mem_access_put() (rev2)
URL   : https://patchwork.freedesktop.org/series/121119/
State : info

== Summary ==

Participating hosts:
bat-pvc-2
bat-atsm-2
bat-dg2-oem2
bat-adlp-7
Missing hosts results[1]:
bat-pvc-2
Results: [xe-pw-121119v2](https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121119v2/index.html)



--===============7936100842998365069==
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
<tr><td><b>Series:</b></td><td>drm/xe: add lockdep annotation for xe_device_mem_access_put() (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/121119/">https://patchwork.freedesktop.org/series/121119/</a></td></tr>
<tr><td><b>State:</b></td><td>info</td></tr>

</table>


    <p>Participating hosts:<br />
bat-pvc-2<br />
bat-atsm-2<br />
bat-dg2-oem2<br />
bat-adlp-7<br />
Missing hosts results[1]:<br />
bat-pvc-2<br />
Results: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121119v2/index.html">xe-pw-121119v2</a></p>

</body>
</html>

--===============7936100842998365069==--

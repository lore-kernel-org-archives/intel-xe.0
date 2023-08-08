Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560C6EB64DD
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 03:38:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A5310E22E;
	Tue,  8 Aug 2023 03:38:49 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5BA5B10E22E;
 Tue,  8 Aug 2023 03:38:47 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 400B9A0078;
 Tue,  8 Aug 2023 03:38:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6822169690125488804=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Date: Tue, 08 Aug 2023 03:38:47 -0000
Message-ID: <169146592723.13862.3855759247286740273@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230808024334.11619-1-oak.zeng@intel.com>
In-Reply-To: <20230808024334.11619-1-oak.zeng@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_series_st?=
 =?utf-8?q?arting_with_=5B1/2=5D_drm/xe=3A_Move_the_memory_region_struct_o?=
 =?utf-8?q?ut_xe=5Ftile?=
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

--===============6822169690125488804==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe: Move the memory region struct out xe_tile
URL   : https://patchwork.freedesktop.org/series/122132/
State : failure

== Summary ==

Participating hosts:
bat-pvc-2
bat-atsm-2
bat-dg2-oem2
bat-adlp-7
Missing hosts results[1]:
bat-pvc-2
Results: [xe-pw-122132v1](https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122132v1/index.html)



--===============6822169690125488804==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe: Move the memory region struct out xe_tile</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122132/">https://patchwork.freedesktop.org/series/122132/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

</table>


    <p>Participating hosts:<br />
bat-pvc-2<br />
bat-atsm-2<br />
bat-dg2-oem2<br />
bat-adlp-7<br />
Missing hosts results[1]:<br />
bat-pvc-2<br />
Results: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122132v1/index.html">xe-pw-122132v1</a></p>

</body>
</html>

--===============6822169690125488804==--

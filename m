Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E115CC67861
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 20:48:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61FA9112F09;
	Tue,  9 Apr 2024 20:48:18 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24C8112F09;
 Tue,  9 Apr 2024 20:48:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0961706228378442272=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5Bv4=2C1/2?=
 =?utf-8?q?=5D_devcoredump=3A_Add_dev=5Fcoredump=5Fput=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Apr 2024 20:48:16 -0000
Message-ID: <171269569666.1303388.10154332339057117354@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240409200206.108452-1-jose.souza@intel.com>
In-Reply-To: <20240409200206.108452-1-jose.souza@intel.com>
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

--===============0961706228378442272==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v4,1/2] devcoredump: Add dev_coredump_put()
URL   : https://patchwork.freedesktop.org/series/132228/
State : success

== Summary ==

CI Bug Log - changes from xe-1063-7be27f645de2f00384b862d2812a90675e8392fa_BAT -> xe-pw-132228v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7802 -> IGT_7803
  * Linux: xe-1063-7be27f645de2f00384b862d2812a90675e8392fa -> xe-pw-132228v1

  IGT_7802: 7802
  IGT_7803: 9669a17ae56f1dcd22ba4c5cb39b3cd334a46862 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1063-7be27f645de2f00384b862d2812a90675e8392fa: 7be27f645de2f00384b862d2812a90675e8392fa
  xe-pw-132228v1: 132228v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132228v1/index.html

--===============0961706228378442272==
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
<tr><td><b>Series:</b></td><td>series starting with [v4,1/2] devcoredump: Add dev_coredump_put()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132228/">https://patchwork.freedesktop.org/series/132228/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132228v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132228v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1063-7be27f645de2f00384b862d2812a90675e8392fa_BAT -&gt; xe-pw-132228v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7802 -&gt; IGT_7803</li>
<li>Linux: xe-1063-7be27f645de2f00384b862d2812a90675e8392fa -&gt; xe-pw-132228v1</li>
</ul>
<p>IGT_7802: 7802<br />
  IGT_7803: 9669a17ae56f1dcd22ba4c5cb39b3cd334a46862 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1063-7be27f645de2f00384b862d2812a90675e8392fa: 7be27f645de2f00384b862d2812a90675e8392fa<br />
  xe-pw-132228v1: 132228v1</p>

</body>
</html>

--===============0961706228378442272==--

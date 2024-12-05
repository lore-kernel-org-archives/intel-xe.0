Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164E4E7716C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 05:25:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA2A310ED9E;
	Thu,  5 Dec 2024 05:25:08 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C62C210ED9E;
 Thu,  5 Dec 2024 05:25:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7097287789165209605=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Make_OA_buffer_size_configu?=
 =?utf-8?q?rable_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sai Teja Pottumuttu" <sai.teja.pottumuttu@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Dec 2024 05:25:07 -0000
Message-ID: <173337630780.2836343.4145547714682552660@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241205041913.883767-1-sai.teja.pottumuttu@intel.com>
In-Reply-To: <20241205041913.883767-1-sai.teja.pottumuttu@intel.com>
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

--===============7097287789165209605==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Make OA buffer size configurable (rev3)
URL   : https://patchwork.freedesktop.org/series/141795/
State : success

== Summary ==

CI Bug Log - changes from xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e_BAT -> xe-pw-141795v3_BAT
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

  * Linux: xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e -> xe-pw-141795v3

  IGT_8138: 8138
  xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e: bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e
  xe-pw-141795v3: 141795v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/index.html

--===============7097287789165209605==
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
<tr><td><b>Series:</b></td><td>Make OA buffer size configurable (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141795/">https://patchwork.freedesktop.org/series/141795/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e_BAT -&gt; xe-pw-141795v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e -&gt; xe-pw-141795v3</li>
</ul>
<p>IGT_8138: 8138<br />
  xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e: bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e<br />
  xe-pw-141795v3: 141795v3</p>

</body>
</html>

--===============7097287789165209605==--

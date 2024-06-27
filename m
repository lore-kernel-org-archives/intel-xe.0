Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5605DC3064D
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 13:26:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40E710E1D5;
	Thu, 27 Jun 2024 13:26:03 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC2210E097;
 Thu, 27 Jun 2024 13:26:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0430577601066708444=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Add_MSIX_functionality_to_XE_=28?=
 =?utf-8?q?rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dani Liberman" <dliberman@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Jun 2024 13:26:03 -0000
Message-ID: <171949476317.164536.14298187884947072884@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240627124043.2923586-1-dliberman@habana.ai>
In-Reply-To: <20240627124043.2923586-1-dliberman@habana.ai>
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

--===============0430577601066708444==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add MSIX functionality to XE (rev2)
URL   : https://patchwork.freedesktop.org/series/135422/
State : success

== Summary ==

CI Bug Log - changes from xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c_BAT -> xe-pw-135422v2_BAT
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

  * IGT: IGT_7905 -> IGT_7906
  * Linux: xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c -> xe-pw-135422v2

  IGT_7905: 7905
  IGT_7906: ae91ba26f657bf11264f64bd2dc21f471a5d18f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c: 42f35e623e6590cf8ec493373e4664ae4e32123c
  xe-pw-135422v2: 135422v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135422v2/index.html

--===============0430577601066708444==
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
<tr><td><b>Series:</b></td><td>Add MSIX functionality to XE (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135422/">https://patchwork.freedesktop.org/series/135422/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135422v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135422v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c_BAT -&gt; xe-pw-135422v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7905 -&gt; IGT_7906</li>
<li>Linux: xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c -&gt; xe-pw-135422v2</li>
</ul>
<p>IGT_7905: 7905<br />
  IGT_7906: ae91ba26f657bf11264f64bd2dc21f471a5d18f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c: 42f35e623e6590cf8ec493373e4664ae4e32123c<br />
  xe-pw-135422v2: 135422v2</p>

</body>
</html>

--===============0430577601066708444==--

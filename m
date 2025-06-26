Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22134C7EE30
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 22:18:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E226D10E913;
	Thu, 26 Jun 2025 22:18:43 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1522810E913;
 Thu, 26 Jun 2025 22:18:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7144689698793274332=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_xe_with/without_k?=
 =?utf-8?q?unit?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Jun 2025 22:18:42 -0000
Message-ID: <175097632208.113638.6163203840510552564@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250626-xe-kunit-v1-0-2440e6d9a4b5@intel.com>
In-Reply-To: <20250626-xe-kunit-v1-0-2440e6d9a4b5@intel.com>
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

--===============7144689698793274332==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: xe with/without kunit
URL   : https://patchwork.freedesktop.org/series/150844/
State : success

== Summary ==

CI Bug Log - changes from xe-3315-091a3795055d69f7bad527cb661f7447a005deb5_BAT -> xe-pw-150844v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3315-091a3795055d69f7bad527cb661f7447a005deb5 -> xe-pw-150844v1

  IGT_8429: 8429
  xe-3315-091a3795055d69f7bad527cb661f7447a005deb5: 091a3795055d69f7bad527cb661f7447a005deb5
  xe-pw-150844v1: 150844v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150844v1/index.html

--===============7144689698793274332==
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
<tr><td><b>Series:</b></td><td>drm/xe: xe with/without kunit</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150844/">https://patchwork.freedesktop.org/series/150844/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150844v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150844v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3315-091a3795055d69f7bad527cb661f7447a005deb5_BAT -&gt; xe-pw-150844v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3315-091a3795055d69f7bad527cb661f7447a005deb5 -&gt; xe-pw-150844v1</li>
</ul>
<p>IGT_8429: 8429<br />
  xe-3315-091a3795055d69f7bad527cb661f7447a005deb5: 091a3795055d69f7bad527cb661f7447a005deb5<br />
  xe-pw-150844v1: 150844v1</p>

</body>
</html>

--===============7144689698793274332==--

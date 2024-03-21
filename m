Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF586C54E68
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 11:14:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F00310E6FD;
	Thu, 21 Mar 2024 11:14:15 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9CDB10E6F6;
 Thu, 21 Mar 2024 11:14:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6849697128085971603=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5B1/1=5D_d?=
 =?utf-8?q?rm/xe=3A_Use_enum_instead_of_hard_coding?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Mar 2024 11:14:14 -0000
Message-ID: <171101965482.939783.9718954668975869176@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240321103928.3310349-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240321103928.3310349-1-himal.prasad.ghimiray@intel.com>
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

--===============6849697128085971603==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/1] drm/xe: Use enum instead of hard coding
URL   : https://patchwork.freedesktop.org/series/131416/
State : success

== Summary ==

CI Bug Log - changes from xe-970-971a18d8ed1d2022dcd268b5bb27b54bf450baa2_BAT -> xe-pw-131416v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-970-971a18d8ed1d2022dcd268b5bb27b54bf450baa2 -> xe-pw-131416v1

  IGT_7773: 7773
  xe-970-971a18d8ed1d2022dcd268b5bb27b54bf450baa2: 971a18d8ed1d2022dcd268b5bb27b54bf450baa2
  xe-pw-131416v1: 131416v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131416v1/index.html

--===============6849697128085971603==
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
<tr><td><b>Series:</b></td><td>series starting with [1/1] drm/xe: Use enum instead of hard coding</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131416/">https://patchwork.freedesktop.org/series/131416/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131416v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131416v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-970-971a18d8ed1d2022dcd268b5bb27b54bf450baa2_BAT -&gt; xe-pw-131416v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-970-971a18d8ed1d2022dcd268b5bb27b54bf450baa2 -&gt; xe-pw-131416v1</li>
</ul>
<p>IGT_7773: 7773<br />
  xe-970-971a18d8ed1d2022dcd268b5bb27b54bf450baa2: 971a18d8ed1d2022dcd268b5bb27b54bf450baa2<br />
  xe-pw-131416v1: 131416v1</p>

</body>
</html>

--===============6849697128085971603==--

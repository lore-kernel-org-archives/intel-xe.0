Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701B4C54FC6
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 05:12:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7BBA10E00C;
	Fri,  6 Sep 2024 05:12:25 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951B110E00C;
 Fri,  6 Sep 2024 05:12:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1643037774810105461=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Fix_arg_to_pci=5Fiomap?=
 =?utf-8?q?=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Sep 2024 05:12:24 -0000
Message-ID: <172559954460.952859.6795848392422268402@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240906032507.2952859-1-lucas.demarchi@intel.com>
In-Reply-To: <20240906032507.2952859-1-lucas.demarchi@intel.com>
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

--===============1643037774810105461==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix arg to pci_iomap()
URL   : https://patchwork.freedesktop.org/series/138290/
State : success

== Summary ==

CI Bug Log - changes from xe-1901-7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d_BAT -> xe-pw-138290v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-pvc-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8006 -> IGT_8007
  * Linux: xe-1901-7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d -> xe-pw-138290v1

  IGT_8006: ae7f2bc0b99801a7ae369d4b5fda5c6b1c386eb1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8007: 8f9900c288f4cf1244d66baa71bc6d9355747cbd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1901-7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d: 7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d
  xe-pw-138290v1: 138290v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138290v1/index.html

--===============1643037774810105461==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix arg to pci_iomap()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138290/">https://patchwork.freedesktop.org/series/138290/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138290v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138290v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1901-7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d_BAT -&gt; xe-pw-138290v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-pvc-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8006 -&gt; IGT_8007</li>
<li>Linux: xe-1901-7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d -&gt; xe-pw-138290v1</li>
</ul>
<p>IGT_8006: ae7f2bc0b99801a7ae369d4b5fda5c6b1c386eb1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8007: 8f9900c288f4cf1244d66baa71bc6d9355747cbd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1901-7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d: 7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d<br />
  xe-pw-138290v1: 138290v1</p>

</body>
</html>

--===============1643037774810105461==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56580C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 21:35:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E2E113DFE;
	Wed, 24 Apr 2024 21:35:36 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595BD113DFE;
 Wed, 24 Apr 2024 21:35:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7952214155747136890=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/guc=3A_Pre-release_GuC_fi?=
 =?utf-8?q?rmware_v70=2E24=2E0_for_LNL/BMG/PVC?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Apr 2024 21:35:35 -0000
Message-ID: <171399453536.1632086.6044298821708067634@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240424203254.1616238-1-John.C.Harrison@Intel.com>
In-Reply-To: <20240424203254.1616238-1-John.C.Harrison@Intel.com>
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

--===============7952214155747136890==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Pre-release GuC firmware v70.24.0 for LNL/BMG/PVC
URL   : https://patchwork.freedesktop.org/series/132867/
State : success

== Summary ==

CI Bug Log - changes from xe-1171-ad654139fd5a7773f0310b5f745c105cdba520e8_BAT -> xe-pw-132867v1_BAT
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

  * Linux: xe-1171-ad654139fd5a7773f0310b5f745c105cdba520e8 -> xe-pw-132867v1

  IGT_7823: 61121a2eac4d191ad9f3077948c8ba19686fbb16 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1171-ad654139fd5a7773f0310b5f745c105cdba520e8: ad654139fd5a7773f0310b5f745c105cdba520e8
  xe-pw-132867v1: 132867v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132867v1/index.html

--===============7952214155747136890==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Pre-release GuC firmware v70.24.0 for LNL/BMG/PVC</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132867/">https://patchwork.freedesktop.org/series/132867/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132867v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132867v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1171-ad654139fd5a7773f0310b5f745c105cdba520e8_BAT -&gt; xe-pw-132867v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1171-ad654139fd5a7773f0310b5f745c105cdba520e8 -&gt; xe-pw-132867v1</li>
</ul>
<p>IGT_7823: 61121a2eac4d191ad9f3077948c8ba19686fbb16 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1171-ad654139fd5a7773f0310b5f745c105cdba520e8: ad654139fd5a7773f0310b5f745c105cdba520e8<br />
  xe-pw-132867v1: 132867v1</p>

</body>
</html>

--===============7952214155747136890==--

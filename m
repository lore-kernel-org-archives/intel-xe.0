Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7B7D5B87E
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 01:53:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0D210E07D;
	Tue, 16 Dec 2025 01:53:13 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8314C10E07D;
 Tue, 16 Dec 2025 01:53:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7829837794289337699=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_PF=3A_Add_handling_for_new_?=
 =?utf-8?q?adverse_event_thresholds_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Dec 2025 01:53:11 -0000
Message-ID: <176584999140.91565.3424649534181881696@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251215201806.196514-1-michal.wajdeczko@intel.com>
In-Reply-To: <20251215201806.196514-1-michal.wajdeczko@intel.com>
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

--===============7829837794289337699==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: PF: Add handling for new adverse event thresholds (rev3)
URL   : https://patchwork.freedesktop.org/series/158874/
State : success

== Summary ==

CI Bug Log - changes from xe-4249-dddddff8562cb71232676f4c1b1f22671c0524f8_BAT -> xe-pw-158874v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): bat-dg2-oem2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4249-dddddff8562cb71232676f4c1b1f22671c0524f8 -> xe-pw-158874v3

  IGT_8666: 8666
  xe-4249-dddddff8562cb71232676f4c1b1f22671c0524f8: dddddff8562cb71232676f4c1b1f22671c0524f8
  xe-pw-158874v3: 158874v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v3/index.html

--===============7829837794289337699==
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
<tr><td><b>Series:</b></td><td>PF: Add handling for new adverse event thresholds (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158874/">https://patchwork.freedesktop.org/series/158874/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4249-dddddff8562cb71232676f4c1b1f22671c0524f8_BAT -&gt; xe-pw-158874v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): bat-dg2-oem2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4249-dddddff8562cb71232676f4c1b1f22671c0524f8 -&gt; xe-pw-158874v3</li>
</ul>
<p>IGT_8666: 8666<br />
  xe-4249-dddddff8562cb71232676f4c1b1f22671c0524f8: dddddff8562cb71232676f4c1b1f22671c0524f8<br />
  xe-pw-158874v3: 158874v3</p>

</body>
</html>

--===============7829837794289337699==--

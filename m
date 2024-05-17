Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C63EC04FFE
	for <intel-xe@archiver.kernel.org>; Fri, 17 May 2024 21:31:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A7210E00E;
	Fri, 17 May 2024 21:31:02 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2ACF10E00E;
 Fri, 17 May 2024 21:31:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5929704991573813749=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Per_client_usage_=28re?=
 =?utf-8?q?v5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 May 2024 21:31:01 -0000
Message-ID: <171598146166.2143812.14611393548492271256@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240517204310.88854-1-lucas.demarchi@intel.com>
In-Reply-To: <20240517204310.88854-1-lucas.demarchi@intel.com>
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

--===============5929704991573813749==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Per client usage (rev5)
URL   : https://patchwork.freedesktop.org/series/132477/
State : success

== Summary ==

CI Bug Log - changes from xe-1309-5e9e7440f7d7efd64079148c738fc83600fb477b_BAT -> xe-pw-132477v5_BAT
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

  * Linux: xe-1309-5e9e7440f7d7efd64079148c738fc83600fb477b -> xe-pw-132477v5

  IGT_7861: 7861
  xe-1309-5e9e7440f7d7efd64079148c738fc83600fb477b: 5e9e7440f7d7efd64079148c738fc83600fb477b
  xe-pw-132477v5: 132477v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v5/index.html

--===============5929704991573813749==
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
<tr><td><b>Series:</b></td><td>drm/xe: Per client usage (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132477/">https://patchwork.freedesktop.org/series/132477/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1309-5e9e7440f7d7efd64079148c738fc83600fb477b_BAT -&gt; xe-pw-132477v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1309-5e9e7440f7d7efd64079148c738fc83600fb477b -&gt; xe-pw-132477v5</li>
</ul>
<p>IGT_7861: 7861<br />
  xe-1309-5e9e7440f7d7efd64079148c738fc83600fb477b: 5e9e7440f7d7efd64079148c738fc83600fb477b<br />
  xe-pw-132477v5: 132477v5</p>

</body>
</html>

--===============5929704991573813749==--

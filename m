Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210D9C04FFE
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 23:47:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39F210ED1F;
	Wed,  8 May 2024 23:47:02 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5656A10ED1F;
 Wed,  8 May 2024 23:47:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3860561003842961681=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Imrpove_GuC_debug_log/status_out?=
 =?utf-8?q?put?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 May 2024 23:47:01 -0000
Message-ID: <171521202134.2023341.15004346035953887518@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240508224927.11341-1-John.C.Harrison@Intel.com>
In-Reply-To: <20240508224927.11341-1-John.C.Harrison@Intel.com>
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

--===============3860561003842961681==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Imrpove GuC debug log/status output
URL   : https://patchwork.freedesktop.org/series/133349/
State : success

== Summary ==

CI Bug Log - changes from xe-1261-c6956ea8134e150cf2f92585fb9e617182fac82b_BAT -> xe-pw-133349v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 4)
------------------------------

  Missing    (1): bat-lnl-1 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1261-c6956ea8134e150cf2f92585fb9e617182fac82b -> xe-pw-133349v1

  IGT_7843: 0df7b9b97f9da0e364f5ee30fe331004b8c86b56 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1261-c6956ea8134e150cf2f92585fb9e617182fac82b: c6956ea8134e150cf2f92585fb9e617182fac82b
  xe-pw-133349v1: 133349v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133349v1/index.html

--===============3860561003842961681==
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
<tr><td><b>Series:</b></td><td>Imrpove GuC debug log/status output</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133349/">https://patchwork.freedesktop.org/series/133349/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133349v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133349v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1261-c6956ea8134e150cf2f92585fb9e617182fac82b_BAT -&gt; xe-pw-133349v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 4)</h2>
<p>Missing    (1): bat-lnl-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1261-c6956ea8134e150cf2f92585fb9e617182fac82b -&gt; xe-pw-133349v1</li>
</ul>
<p>IGT_7843: 0df7b9b97f9da0e364f5ee30fe331004b8c86b56 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1261-c6956ea8134e150cf2f92585fb9e617182fac82b: c6956ea8134e150cf2f92585fb9e617182fac82b<br />
  xe-pw-133349v1: 133349v1</p>

</body>
</html>

--===============3860561003842961681==--

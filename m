Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF70EE6420
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 02:07:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFFD810E832;
	Thu, 12 Sep 2024 02:07:17 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE8310E832;
 Thu, 12 Sep 2024 02:07:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0093814348764553807=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Move_some_functions_out_of_runti?=
 =?utf-8?q?me_sus/resume_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Sep 2024 02:07:15 -0000
Message-ID: <172610683553.989379.13915494229820117653@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240912012545.702032-1-suraj.kandpal@intel.com>
In-Reply-To: <20240912012545.702032-1-suraj.kandpal@intel.com>
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

--===============0093814348764553807==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Move some functions out of runtime sus/resume (rev2)
URL   : https://patchwork.freedesktop.org/series/138532/
State : success

== Summary ==

CI Bug Log - changes from xe-1930-024375dea928f05b859b457ceaff8c2b33609121_BAT -> xe-pw-138532v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1930-024375dea928f05b859b457ceaff8c2b33609121 -> xe-pw-138532v2

  IGT_8013: 8013
  xe-1930-024375dea928f05b859b457ceaff8c2b33609121: 024375dea928f05b859b457ceaff8c2b33609121
  xe-pw-138532v2: 138532v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138532v2/index.html

--===============0093814348764553807==
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
<tr><td><b>Series:</b></td><td>Move some functions out of runtime sus/resume (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138532/">https://patchwork.freedesktop.org/series/138532/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138532v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138532v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1930-024375dea928f05b859b457ceaff8c2b33609121_BAT -&gt; xe-pw-138532v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1930-024375dea928f05b859b457ceaff8c2b33609121 -&gt; xe-pw-138532v2</li>
</ul>
<p>IGT_8013: 8013<br />
  xe-1930-024375dea928f05b859b457ceaff8c2b33609121: 024375dea928f05b859b457ceaff8c2b33609121<br />
  xe-pw-138532v2: 138532v2</p>

</body>
</html>

--===============0093814348764553807==--

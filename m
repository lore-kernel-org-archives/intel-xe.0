Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C111BCF854E
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 01:49:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831BC10E04E;
	Thu,  3 Oct 2024 01:49:33 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 004DD10E072;
 Thu,  3 Oct 2024 01:49:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4259396912266590026=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/guc=3A_Improve_GuC_log_du?=
 =?utf-8?q?mping_and_add_to_devcoredump_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Oct 2024 01:49:32 -0000
Message-ID: <172792017299.1166072.10944458478259426293@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241003004611.2323493-1-John.C.Harrison@Intel.com>
In-Reply-To: <20241003004611.2323493-1-John.C.Harrison@Intel.com>
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

--===============4259396912266590026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Improve GuC log dumping and add to devcoredump (rev6)
URL   : https://patchwork.freedesktop.org/series/137985/
State : success

== Summary ==

CI Bug Log - changes from xe-2007-789d5631453c3edad1988cd47db1643555e52ac9_BAT -> xe-pw-137985v6_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8049 -> IGT_8050
  * Linux: xe-2007-789d5631453c3edad1988cd47db1643555e52ac9 -> xe-pw-137985v6

  IGT_8049: 909157f3cc3c0676a4f896752276d438c3ec3959 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8050: 0000bc070385689633718cbab01ab02a524f2c61 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2007-789d5631453c3edad1988cd47db1643555e52ac9: 789d5631453c3edad1988cd47db1643555e52ac9
  xe-pw-137985v6: 137985v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137985v6/index.html

--===============4259396912266590026==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Improve GuC log dumping and add to devcoredump (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137985/">https://patchwork.freedesktop.org/series/137985/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137985v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137985v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2007-789d5631453c3edad1988cd47db1643555e52ac9_BAT -&gt; xe-pw-137985v6_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8049 -&gt; IGT_8050</li>
<li>Linux: xe-2007-789d5631453c3edad1988cd47db1643555e52ac9 -&gt; xe-pw-137985v6</li>
</ul>
<p>IGT_8049: 909157f3cc3c0676a4f896752276d438c3ec3959 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8050: 0000bc070385689633718cbab01ab02a524f2c61 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2007-789d5631453c3edad1988cd47db1643555e52ac9: 789d5631453c3edad1988cd47db1643555e52ac9<br />
  xe-pw-137985v6: 137985v6</p>

</body>
</html>

--===============4259396912266590026==--

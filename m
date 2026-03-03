Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C32EEC1430
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 12:42:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E8910E7C8;
	Tue,  3 Mar 2026 12:42:02 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E1E10E7C1;
 Tue,  3 Mar 2026 12:42:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2536525592675379757=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/migrate=3A_Refactor_?=
 =?utf-8?q?xe=5Fmigrate=5Fprepare=5Fvm=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Mar 2026 12:42:00 -0000
Message-ID: <177254172052.309599.3089934474903586052@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260303101913.3576481-1-raag.jadav@intel.com>
In-Reply-To: <20260303101913.3576481-1-raag.jadav@intel.com>
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

--===============2536525592675379757==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/migrate: Refactor xe_migrate_prepare_vm()
URL   : https://patchwork.freedesktop.org/series/162485/
State : success

== Summary ==

CI Bug Log - changes from xe-4650-7cc5603b0096f346e64753d0a599252e6177c5db_BAT -> xe-pw-162485v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 13)
------------------------------

  Missing    (1): bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4650-7cc5603b0096f346e64753d0a599252e6177c5db -> xe-pw-162485v1

  IGT_8777: a50285a68dbef0fe11140adef4016a756f57b324 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4650-7cc5603b0096f346e64753d0a599252e6177c5db: 7cc5603b0096f346e64753d0a599252e6177c5db
  xe-pw-162485v1: 162485v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162485v1/index.html

--===============2536525592675379757==
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
<tr><td><b>Series:</b></td><td>drm/xe/migrate: Refactor xe_migrate_prepare_vm()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162485/">https://patchwork.freedesktop.org/series/162485/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162485v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162485v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4650-7cc5603b0096f346e64753d0a599252e6177c5db_BAT -&gt; xe-pw-162485v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 13)</h2>
<p>Missing    (1): bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4650-7cc5603b0096f346e64753d0a599252e6177c5db -&gt; xe-pw-162485v1</li>
</ul>
<p>IGT_8777: a50285a68dbef0fe11140adef4016a756f57b324 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4650-7cc5603b0096f346e64753d0a599252e6177c5db: 7cc5603b0096f346e64753d0a599252e6177c5db<br />
  xe-pw-162485v1: 162485v1</p>

</body>
</html>

--===============2536525592675379757==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F91C79F99
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 14:47:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5655F10E029;
	Mon,  7 Sep 2026 14:47:16 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCFC310E029;
 Mon,  7 Sep 2026 14:47:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6489084663559987912=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Add_multi=5Fqueue?=
 =?utf-8?q?=5Factive=5Flrca_debugfs_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Varun Gupta" <varun.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 07 Sep 2026 14:47:14 -0000
Message-ID: <178879243489.130175.7829704415698420750@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260907134719.999549-2-varun.gupta@intel.com>
In-Reply-To: <20260907134719.999549-2-varun.gupta@intel.com>
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

--===============6489084663559987912==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add multi_queue_active_lrca debugfs (rev3)
URL   : https://patchwork.freedesktop.org/series/173220/
State : success

== Summary ==

CI Bug Log - changes from xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db_BAT -> xe-pw-173220v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db -> xe-pw-173220v3

  IGT_9084: 9084
  xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db: c60540b13d7bacc21848ed94fd368a968454d5db
  xe-pw-173220v3: 173220v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v3/index.html

--===============6489084663559987912==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add multi_queue_active_lrca debugfs (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173220/">https://patchwork.freedesktop.org/series/173220/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db_BAT -&gt; xe-pw-173220v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db -&gt; xe-pw-173220v3</li>
</ul>
<p>IGT_9084: 9084<br />
  xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db: c60540b13d7bacc21848ed94fd368a968454d5db<br />
  xe-pw-173220v3: 173220v3</p>

</body>
</html>

--===============6489084663559987912==--

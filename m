Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC840C79F80
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 08:30:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4211E10F95B;
	Fri,  4 Sep 2026 08:30:34 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14EB510F95B;
 Fri,  4 Sep 2026 08:30:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0103201032260696357=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/vm=3A_Handle_purged_?=
 =?utf-8?q?BOs_in_VM_snapshots_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 04 Sep 2026 08:30:33 -0000
Message-ID: <178851063307.122453.3306535632723600704@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260904072252.4009491-1-arvind.yadav@intel.com>
In-Reply-To: <20260904072252.4009491-1-arvind.yadav@intel.com>
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

--===============0103201032260696357==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vm: Handle purged BOs in VM snapshots (rev2)
URL   : https://patchwork.freedesktop.org/series/173292/
State : success

== Summary ==

CI Bug Log - changes from xe-5691-a422952692964060037c8044702b2da87f45faea_BAT -> xe-pw-173292v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 13)
------------------------------

  Missing    (2): bat-bmg-2 bat-nvls-1 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5691-a422952692964060037c8044702b2da87f45faea -> xe-pw-173292v2

  IGT_9084: 9084
  xe-5691-a422952692964060037c8044702b2da87f45faea: a422952692964060037c8044702b2da87f45faea
  xe-pw-173292v2: 173292v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173292v2/index.html

--===============0103201032260696357==
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
<tr><td><b>Series:</b></td><td>drm/xe/vm: Handle purged BOs in VM snapshots (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173292/">https://patchwork.freedesktop.org/series/173292/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173292v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173292v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5691-a422952692964060037c8044702b2da87f45faea_BAT -&gt; xe-pw-173292v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 13)</h2>
<p>Missing    (2): bat-bmg-2 bat-nvls-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5691-a422952692964060037c8044702b2da87f45faea -&gt; xe-pw-173292v2</li>
</ul>
<p>IGT_9084: 9084<br />
  xe-5691-a422952692964060037c8044702b2da87f45faea: a422952692964060037c8044702b2da87f45faea<br />
  xe-pw-173292v2: 173292v2</p>

</body>
</html>

--===============0103201032260696357==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A80CD5BB1
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 15:00:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2FF89EF7;
	Tue, 26 May 2026 15:00:48 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A7F89EF7;
 Tue, 26 May 2026 15:00:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0459430335668736442=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/madvise=3A_Skip_inva?=
 =?utf-8?q?lidation_for_purgeable_state_updates_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 26 May 2026 15:00:47 -0000
Message-ID: <177980764755.10749.4182993121043453384@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260526135447.2973029-1-arvind.yadav@intel.com>
In-Reply-To: <20260526135447.2973029-1-arvind.yadav@intel.com>
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

--===============0459430335668736442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/madvise: Skip invalidation for purgeable state updates (rev2)
URL   : https://patchwork.freedesktop.org/series/166291/
State : success

== Summary ==

CI Bug Log - changes from xe-5131-ba2b29e3db52fcd75c2dc6d76d81f26eb59b7e33_BAT -> xe-pw-166291v2_BAT
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

  * Linux: xe-5131-ba2b29e3db52fcd75c2dc6d76d81f26eb59b7e33 -> xe-pw-166291v2

  IGT_8937: 8937
  xe-5131-ba2b29e3db52fcd75c2dc6d76d81f26eb59b7e33: ba2b29e3db52fcd75c2dc6d76d81f26eb59b7e33
  xe-pw-166291v2: 166291v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v2/index.html

--===============0459430335668736442==
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
<tr><td><b>Series:</b></td><td>drm/xe/madvise: Skip invalidation for purgeable state updates (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166291/">https://patchwork.freedesktop.org/series/166291/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166291v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5131-ba2b29e3db52fcd75c2dc6d76d81f26eb59b7e33_BAT -&gt; xe-pw-166291v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5131-ba2b29e3db52fcd75c2dc6d76d81f26eb59b7e33 -&gt; xe-pw-166291v2</li>
</ul>
<p>IGT_8937: 8937<br />
  xe-5131-ba2b29e3db52fcd75c2dc6d76d81f26eb59b7e33: ba2b29e3db52fcd75c2dc6d76d81f26eb59b7e33<br />
  xe-pw-166291v2: 166291v2</p>

</body>
</html>

--===============0459430335668736442==--

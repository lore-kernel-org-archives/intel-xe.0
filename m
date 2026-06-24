Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38535CDB479
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 04:59:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38AE10E02E;
	Wed, 24 Jun 2026 04:59:46 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0651510E029;
 Wed, 24 Jun 2026 04:59:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7339598230974243364=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/guc=3A_Hold_device_r?=
 =?utf-8?q?ef_until_queue_teardown_completes_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Jun 2026 04:59:46 -0000
Message-ID: <178227718601.109338.3518915199103265200@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260624041029.2357470-1-arvind.yadav@intel.com>
In-Reply-To: <20260624041029.2357470-1-arvind.yadav@intel.com>
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

--===============7339598230974243364==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Hold device ref until queue teardown completes (rev5)
URL   : https://patchwork.freedesktop.org/series/168424/
State : success

== Summary ==

CI Bug Log - changes from xe-5292-e7cd62086ec5a70cefb8b8b00964096692bfab36_BAT -> xe-pw-168424v5_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8981 -> IGT_8982
  * Linux: xe-5292-e7cd62086ec5a70cefb8b8b00964096692bfab36 -> xe-pw-168424v5

  IGT_8981: 28416da6681a1afa167bdd73cdc934cb36d13133 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8982: 48befce9e6b0c0d371c4812bfff34a61319f68f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5292-e7cd62086ec5a70cefb8b8b00964096692bfab36: e7cd62086ec5a70cefb8b8b00964096692bfab36
  xe-pw-168424v5: 168424v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v5/index.html

--===============7339598230974243364==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Hold device ref until queue teardown completes (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168424/">https://patchwork.freedesktop.org/series/168424/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5292-e7cd62086ec5a70cefb8b8b00964096692bfab36_BAT -&gt; xe-pw-168424v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8981 -&gt; IGT_8982</li>
<li>Linux: xe-5292-e7cd62086ec5a70cefb8b8b00964096692bfab36 -&gt; xe-pw-168424v5</li>
</ul>
<p>IGT_8981: 28416da6681a1afa167bdd73cdc934cb36d13133 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8982: 48befce9e6b0c0d371c4812bfff34a61319f68f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5292-e7cd62086ec5a70cefb8b8b00964096692bfab36: e7cd62086ec5a70cefb8b8b00964096692bfab36<br />
  xe-pw-168424v5: 168424v5</p>

</body>
</html>

--===============7339598230974243364==--

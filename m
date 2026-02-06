Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FA9EB28F1
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 08:55:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B9ED10E5D3;
	Fri,  6 Feb 2026 08:55:12 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4438210E5D3;
 Fri,  6 Feb 2026 08:55:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4772470470753848554=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/hwmon=3A_Prevent_uni?=
 =?utf-8?q?ntended_VRAM_channel_creation_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Feb 2026 08:55:10 -0000
Message-ID: <177036811025.231835.4470763914179225051@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260206081655.2115439-1-karthik.poosa@intel.com>
In-Reply-To: <20260206081655.2115439-1-karthik.poosa@intel.com>
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

--===============4772470470753848554==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/hwmon: Prevent unintended VRAM channel creation (rev2)
URL   : https://patchwork.freedesktop.org/series/160302/
State : success

== Summary ==

CI Bug Log - changes from xe-4517-75ff5c3e0838e9fb77677fd1446ffe7b1cf75bdb_BAT -> xe-pw-160302v2_BAT
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

  * IGT: IGT_8739 -> IGT_8740
  * Linux: xe-4517-75ff5c3e0838e9fb77677fd1446ffe7b1cf75bdb -> xe-pw-160302v2

  IGT_8739: 8739
  IGT_8740: 36ebdc56b434bf330c44e96205f1fcefcf598651 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4517-75ff5c3e0838e9fb77677fd1446ffe7b1cf75bdb: 75ff5c3e0838e9fb77677fd1446ffe7b1cf75bdb
  xe-pw-160302v2: 160302v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160302v2/index.html

--===============4772470470753848554==
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
<tr><td><b>Series:</b></td><td>drm/xe/hwmon: Prevent unintended VRAM channel creation (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160302/">https://patchwork.freedesktop.org/series/160302/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160302v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160302v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4517-75ff5c3e0838e9fb77677fd1446ffe7b1cf75bdb_BAT -&gt; xe-pw-160302v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8739 -&gt; IGT_8740</li>
<li>Linux: xe-4517-75ff5c3e0838e9fb77677fd1446ffe7b1cf75bdb -&gt; xe-pw-160302v2</li>
</ul>
<p>IGT_8739: 8739<br />
  IGT_8740: 36ebdc56b434bf330c44e96205f1fcefcf598651 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4517-75ff5c3e0838e9fb77677fd1446ffe7b1cf75bdb: 75ff5c3e0838e9fb77677fd1446ffe7b1cf75bdb<br />
  xe-pw-160302v2: 160302v2</p>

</body>
</html>

--===============4772470470753848554==--

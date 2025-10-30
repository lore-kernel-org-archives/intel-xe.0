Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED3ACCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 19:09:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F38010EA13;
	Thu, 30 Oct 2025 19:09:08 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1FB10EA12;
 Thu, 30 Oct 2025 19:09:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7819179196265882032=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Dump_PAT_entries_?=
 =?utf-8?q?with_reserved_mark_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xin Wang" <x.wang@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Oct 2025 19:09:08 -0000
Message-ID: <176185134823.190.18367028562392361452@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251022215504.5559-1-x.wang@intel.com>
In-Reply-To: <20251022215504.5559-1-x.wang@intel.com>
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

--===============7819179196265882032==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Dump PAT entries with reserved mark (rev2)
URL   : https://patchwork.freedesktop.org/series/156380/
State : success

== Summary ==

CI Bug Log - changes from xe-4013-05dafb7f913af8cf6b33e482649d28ee7912a209_BAT -> xe-pw-156380v2_BAT
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

  * Linux: xe-4013-05dafb7f913af8cf6b33e482649d28ee7912a209 -> xe-pw-156380v2

  IGT_8603: e6eb3c0fe0f28f3d6e530ae202fbb9f29bde9147 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4013-05dafb7f913af8cf6b33e482649d28ee7912a209: 05dafb7f913af8cf6b33e482649d28ee7912a209
  xe-pw-156380v2: 156380v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v2/index.html

--===============7819179196265882032==
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
<tr><td><b>Series:</b></td><td>drm/xe: Dump PAT entries with reserved mark (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156380/">https://patchwork.freedesktop.org/series/156380/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4013-05dafb7f913af8cf6b33e482649d28ee7912a209_BAT -&gt; xe-pw-156380v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4013-05dafb7f913af8cf6b33e482649d28ee7912a209 -&gt; xe-pw-156380v2</li>
</ul>
<p>IGT_8603: e6eb3c0fe0f28f3d6e530ae202fbb9f29bde9147 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4013-05dafb7f913af8cf6b33e482649d28ee7912a209: 05dafb7f913af8cf6b33e482649d28ee7912a209<br />
  xe-pw-156380v2: 156380v2</p>

</body>
</html>

--===============7819179196265882032==--

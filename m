Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D825CCF9F8
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 22:29:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68A510EB84;
	Fri,  7 Nov 2025 22:29:11 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFABA10EB84;
 Fri,  7 Nov 2025 22:29:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7613198657888623354=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Tile_address_chan?=
 =?utf-8?q?ge?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Nov 2025 22:29:10 -0000
Message-ID: <176255455090.31057.17165368503968490955@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251107-tile-addr-v1-0-a3014aadc2e7@intel.com>
In-Reply-To: <20251107-tile-addr-v1-0-a3014aadc2e7@intel.com>
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

--===============7613198657888623354==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Tile address change
URL   : https://patchwork.freedesktop.org/series/157254/
State : success

== Summary ==

CI Bug Log - changes from xe-4073-4dff427fe8bbfd0bdbf7935d23a2aba0c350ab2d_BAT -> xe-pw-157254v1_BAT
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

  * IGT: IGT_8613 -> IGT_8614
  * Linux: xe-4073-4dff427fe8bbfd0bdbf7935d23a2aba0c350ab2d -> xe-pw-157254v1

  IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8614: 8614
  xe-4073-4dff427fe8bbfd0bdbf7935d23a2aba0c350ab2d: 4dff427fe8bbfd0bdbf7935d23a2aba0c350ab2d
  xe-pw-157254v1: 157254v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157254v1/index.html

--===============7613198657888623354==
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
<tr><td><b>Series:</b></td><td>drm/xe: Tile address change</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157254/">https://patchwork.freedesktop.org/series/157254/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157254v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157254v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4073-4dff427fe8bbfd0bdbf7935d23a2aba0c350ab2d_BAT -&gt; xe-pw-157254v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8613 -&gt; IGT_8614</li>
<li>Linux: xe-4073-4dff427fe8bbfd0bdbf7935d23a2aba0c350ab2d -&gt; xe-pw-157254v1</li>
</ul>
<p>IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8614: 8614<br />
  xe-4073-4dff427fe8bbfd0bdbf7935d23a2aba0c350ab2d: 4dff427fe8bbfd0bdbf7935d23a2aba0c350ab2d<br />
  xe-pw-157254v1: 157254v1</p>

</body>
</html>

--===============7613198657888623354==--

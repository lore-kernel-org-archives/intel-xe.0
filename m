Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1F9C5DF74
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 14:23:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9BB810E056;
	Tue, 18 Aug 2026 14:23:19 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EEF510E056;
 Tue, 18 Aug 2026 14:23:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0768673996374652964=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/xe3p=5Fhpm=3A_Remove?=
 =?utf-8?q?_WA_14025883347_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Aug 2026 14:23:18 -0000
Message-ID: <178706299818.63648.10118308781387858835@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260818095748.1512800-2-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20260818095748.1512800-2-balasubramani.vivekanandan@intel.com>
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

--===============0768673996374652964==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe3p_hpm: Remove WA 14025883347 (rev2)
URL   : https://patchwork.freedesktop.org/series/172379/
State : success

== Summary ==

CI Bug Log - changes from xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef_BAT -> xe-pw-172379v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): bat-nvls-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef -> xe-pw-172379v2

  IGT_9059: f5a4ff79434df36db1d6b13deb37c90a6602565e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef: 275df33dcf4c5d018717867a0b29ed1d3b62c1ef
  xe-pw-172379v2: 172379v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172379v2/index.html

--===============0768673996374652964==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe3p_hpm: Remove WA 14025883347 (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172379/">https://patchwork.freedesktop.org/series/172379/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172379v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172379v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef_BAT -&gt; xe-pw-172379v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): bat-nvls-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef -&gt; xe-pw-172379v2</li>
</ul>
<p>IGT_9059: f5a4ff79434df36db1d6b13deb37c90a6602565e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef: 275df33dcf4c5d018717867a0b29ed1d3b62c1ef<br />
  xe-pw-172379v2: 172379v2</p>

</body>
</html>

--===============0768673996374652964==--

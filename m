Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A575ECA5FD2
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 21:33:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526E410E1B4;
	Thu,  1 Oct 2026 21:33:05 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB0F10E1B4;
 Thu,  1 Oct 2026 21:33:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8466929197052542686=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/gpuvm=3A_two_pass_locki?=
 =?utf-8?q?ng_for_exec_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 01 Oct 2026 21:33:04 -0000
Message-ID: <179089038417.231058.9686888766137839790@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261001162001.3123877-1-matthew.brost@intel.com>
In-Reply-To: <20261001162001.3123877-1-matthew.brost@intel.com>
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

--===============8466929197052542686==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/gpuvm: two pass locking for exec (rev2)
URL   : https://patchwork.freedesktop.org/series/172205/
State : success

== Summary ==

CI Bug Log - changes from xe-5867-988128f784b17d333605eac298689e26f58f851d_BAT -> xe-pw-172205v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5867-988128f784b17d333605eac298689e26f58f851d -> xe-pw-172205v2

  IGT_9122: e135ddea9ef0e2d36c831e99db99d634efe3eb26 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5867-988128f784b17d333605eac298689e26f58f851d: 988128f784b17d333605eac298689e26f58f851d
  xe-pw-172205v2: 172205v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172205v2/index.html

--===============8466929197052542686==
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
<tr><td><b>Series:</b></td><td>drm/gpuvm: two pass locking for exec (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172205/">https://patchwork.freedesktop.org/series/172205/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172205v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172205v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5867-988128f784b17d333605eac298689e26f58f851d_BAT -&gt; xe-pw-172205v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5867-988128f784b17d333605eac298689e26f58f851d -&gt; xe-pw-172205v2</li>
</ul>
<p>IGT_9122: e135ddea9ef0e2d36c831e99db99d634efe3eb26 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5867-988128f784b17d333605eac298689e26f58f851d: 988128f784b17d333605eac298689e26f58f851d<br />
  xe-pw-172205v2: 172205v2</p>

</body>
</html>

--===============8466929197052542686==--

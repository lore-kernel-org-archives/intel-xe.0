Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C96CD4F21
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 19:35:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C5C10E2CB;
	Tue, 12 May 2026 19:35:31 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A5710E2BA;
 Tue, 12 May 2026 19:35:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6780565291944107949=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/atomic=3A_Rework_initia?=
 =?utf-8?q?l_state_allocation_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maxime Ripard" <mripard@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 12 May 2026 19:35:30 -0000
Message-ID: <177861453099.61708.6006768350175780568@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260512-drm-mode-config-init-v4-0-591dfdcc1bf9@kernel.org>
In-Reply-To: <20260512-drm-mode-config-init-v4-0-591dfdcc1bf9@kernel.org>
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

--===============6780565291944107949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/atomic: Rework initial state allocation (rev3)
URL   : https://patchwork.freedesktop.org/series/163606/
State : success

== Summary ==

CI Bug Log - changes from xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472_BAT -> xe-pw-163606v3_BAT
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

  * IGT: IGT_8905 -> IGT_8906
  * Linux: xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472 -> xe-pw-163606v3

  IGT_8905: b04ca530eb2959c8edbf9d90f6bb98a9fdee2296 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8906: 6c27cc975b64ea72a6f46aa53cb3201fb73ce7cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472: 82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472
  xe-pw-163606v3: 163606v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163606v3/index.html

--===============6780565291944107949==
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
<tr><td><b>Series:</b></td><td>drm/atomic: Rework initial state allocation (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163606/">https://patchwork.freedesktop.org/series/163606/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163606v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163606v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472_BAT -&gt; xe-pw-163606v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8905 -&gt; IGT_8906</li>
<li>Linux: xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472 -&gt; xe-pw-163606v3</li>
</ul>
<p>IGT_8905: b04ca530eb2959c8edbf9d90f6bb98a9fdee2296 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8906: 6c27cc975b64ea72a6f46aa53cb3201fb73ce7cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472: 82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472<br />
  xe-pw-163606v3: 163606v3</p>

</body>
</html>

--===============6780565291944107949==--

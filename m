Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4A3C3ABBF
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 21:24:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 829A410E1ED;
	Wed,  7 May 2025 21:24:59 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1322510E1CE;
 Wed,  7 May 2025 21:24:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5280447719568551946=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/vsec=3A_Allow_for_ke?=
 =?utf-8?q?rnel_context_access_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 May 2025 21:24:59 -0000
Message-ID: <174665309907.57598.17619250829810093288@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250507193811.268719-1-michael.j.ruhl@intel.com>
In-Reply-To: <20250507193811.268719-1-michael.j.ruhl@intel.com>
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

--===============5280447719568551946==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vsec: Allow for kernel context access (rev2)
URL   : https://patchwork.freedesktop.org/series/148726/
State : success

== Summary ==

CI Bug Log - changes from xe-3048-12ed58de6491fc48168f29de1c0fa9e9917b858d_BAT -> xe-pw-148726v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3048-12ed58de6491fc48168f29de1c0fa9e9917b858d -> xe-pw-148726v2

  IGT_8356: 4db4ba9b619fefa181cf0fc73cf8c35d282c61ae @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3048-12ed58de6491fc48168f29de1c0fa9e9917b858d: 12ed58de6491fc48168f29de1c0fa9e9917b858d
  xe-pw-148726v2: 148726v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v2/index.html

--===============5280447719568551946==
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
<tr><td><b>Series:</b></td><td>drm/xe/vsec: Allow for kernel context access (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148726/">https://patchwork.freedesktop.org/series/148726/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3048-12ed58de6491fc48168f29de1c0fa9e9917b858d_BAT -&gt; xe-pw-148726v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3048-12ed58de6491fc48168f29de1c0fa9e9917b858d -&gt; xe-pw-148726v2</li>
</ul>
<p>IGT_8356: 4db4ba9b619fefa181cf0fc73cf8c35d282c61ae @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3048-12ed58de6491fc48168f29de1c0fa9e9917b858d: 12ed58de6491fc48168f29de1c0fa9e9917b858d<br />
  xe-pw-148726v2: 148726v2</p>

</body>
</html>

--===============5280447719568551946==--

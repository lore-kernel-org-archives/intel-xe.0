Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5B8CA0EED
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 10:01:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4F410E58A;
	Tue, 19 Aug 2025 10:01:19 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D181710E58F;
 Tue, 19 Aug 2025 10:01:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7655013461880102710=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/psr=3A_Underrun_on?=
 =?utf-8?q?_idle_PSR_wa_only_when_pkgc_latency_=3E_delayed_vblank_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Aug 2025 10:01:18 -0000
Message-ID: <175559767884.246999.10402197068039447183@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250519075223.443266-1-jouni.hogander@intel.com>
In-Reply-To: <20250519075223.443266-1-jouni.hogander@intel.com>
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

--===============7655013461880102710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/psr: Underrun on idle PSR wa only when pkgc latency > delayed vblank (rev2)
URL   : https://patchwork.freedesktop.org/series/149170/
State : success

== Summary ==

CI Bug Log - changes from xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee_BAT -> xe-pw-149170v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 9)
------------------------------

  Missing    (2): bat-adlp-vm bat-ptl-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee -> xe-pw-149170v2

  IGT_8496: acea60af09e5f4b3cb0cd6838c23ef1e92c17323 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee: 25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee
  xe-pw-149170v2: 149170v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v2/index.html

--===============7655013461880102710==
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
<tr><td><b>Series:</b></td><td>drm/i915/psr: Underrun on idle PSR wa only when pkgc latency &gt; delayed vblank (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149170/">https://patchwork.freedesktop.org/series/149170/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee_BAT -&gt; xe-pw-149170v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 9)</h2>
<p>Missing    (2): bat-adlp-vm bat-ptl-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee -&gt; xe-pw-149170v2</li>
</ul>
<p>IGT_8496: acea60af09e5f4b3cb0cd6838c23ef1e92c17323 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3574-25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee: 25c75d2d7cac2a2e7dc32df5a7a0f949dfafe9ee<br />
  xe-pw-149170v2: 149170v2</p>

</body>
</html>

--===============7655013461880102710==--

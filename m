Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99987C072A2
	for <intel-xe@archiver.kernel.org>; Sat, 18 Nov 2023 02:20:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3658410E0AE;
	Sat, 18 Nov 2023 02:20:19 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 80F3B10E0AE;
 Sat, 18 Nov 2023 02:20:17 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 512B7AADD8;
 Sat, 18 Nov 2023 02:20:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0355774166203068401=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Sat, 18 Nov 2023 02:20:17 -0000
Message-ID: <170027401730.12898.11206683172313769606@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231116130321.3388111-1-tejas.upadhyay@intel.com>
In-Reply-To: <20231116130321.3388111-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/xe?=
 =?utf-8?q?2=3A_Add_workaround_14019449301_=28rev2=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============0355774166203068401==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe2: Add workaround 14019449301 (rev2)
URL   : https://patchwork.freedesktop.org/series/126262/
State : failure

== Summary ==

CI Bug Log - changes from xe-504-cb9b702d436952ddec33b020d549c7998cace9e2_BAT -> xe-pw-126262v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-126262v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-126262v2_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 1)
------------------------------

  ERROR: It appears as if the changes made in xe-pw-126262v2_BAT prevented too many machines from booting.

  Missing    (3): bat-pvc-2 bat-dg2-oem2 bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-504-cb9b702d436952ddec33b020d549c7998cace9e2 -> xe-pw-126262v2

  IGT_7594: 8478eefdaa3eef02b4370339ef0d1970d44a67a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-504-cb9b702d436952ddec33b020d549c7998cace9e2: cb9b702d436952ddec33b020d549c7998cace9e2
  xe-pw-126262v2: 126262v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126262v2/index.html

--===============0355774166203068401==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe2: Add workaround 14019449301 (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126262/">https://patchwork.freedesktop.org/series/126262/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126262v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126262v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-504-cb9b702d436952ddec33b020d549c7998cace9e2_BAT -&gt; xe-pw-126262v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-126262v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-126262v2_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 1)</h2>
<p>ERROR: It appears as if the changes made in xe-pw-126262v2_BAT prevented too many machines from booting.</p>
<p>Missing    (3): bat-pvc-2 bat-dg2-oem2 bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-504-cb9b702d436952ddec33b020d549c7998cace9e2 -&gt; xe-pw-126262v2</li>
</ul>
<p>IGT_7594: 8478eefdaa3eef02b4370339ef0d1970d44a67a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-504-cb9b702d436952ddec33b020d549c7998cace9e2: cb9b702d436952ddec33b020d549c7998cace9e2<br />
  xe-pw-126262v2: 126262v2</p>

</body>
</html>

--===============0355774166203068401==--

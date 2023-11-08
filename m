Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEB7C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 08:28:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0CF210E3A7;
	Wed,  8 Nov 2023 08:28:00 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id DA92910E3A7;
 Wed,  8 Nov 2023 08:27:59 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D412BAA916;
 Wed,  8 Nov 2023 08:27:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8461373770005539047=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Wed, 08 Nov 2023 08:27:59 -0000
Message-ID: <169943207983.24274.2422163976183237126@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231102143127.2692-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231102143127.2692-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A?=
 =?utf-8?q?_Disable_panic=5Fon=5Fwarn_for_testing_purposes_=28rev2=29?=
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

--===============8461373770005539047==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Disable panic_on_warn for testing purposes (rev2)
URL   : https://patchwork.freedesktop.org/series/125858/
State : failure

== Summary ==

CI Bug Log - changes from xe-466-c49faefeafbfb2b6f06778563886a930d1a36a8b_BAT -> xe-pw-125858v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-125858v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-125858v2_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 0)
------------------------------

  ERROR: It appears as if the changes made in xe-pw-125858v2_BAT prevented too many machines from booting.

  Missing    (4): bat-pvc-2 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7568 -> IGT_7569
  * Linux: xe-466-c49faefeafbfb2b6f06778563886a930d1a36a8b -> xe-pw-125858v2

  IGT_7568: 9e3c3791e7e0297f277211b19a3388a1ee87f3d0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7569: ed71e4cba0274ced64de64a15a5f7e0032d955a4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-466-c49faefeafbfb2b6f06778563886a930d1a36a8b: c49faefeafbfb2b6f06778563886a930d1a36a8b
  xe-pw-125858v2: 125858v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125858v2/index.html

--===============8461373770005539047==
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
<tr><td><b>Series:</b></td><td>drm/xe: Disable panic_on_warn for testing purposes (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125858/">https://patchwork.freedesktop.org/series/125858/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125858v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125858v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-466-c49faefeafbfb2b6f06778563886a930d1a36a8b_BAT -&gt; xe-pw-125858v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-125858v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-125858v2_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in xe-pw-125858v2_BAT prevented too many machines from booting.</p>
<p>Missing    (4): bat-pvc-2 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7568 -&gt; IGT_7569</li>
<li>Linux: xe-466-c49faefeafbfb2b6f06778563886a930d1a36a8b -&gt; xe-pw-125858v2</li>
</ul>
<p>IGT_7568: 9e3c3791e7e0297f277211b19a3388a1ee87f3d0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7569: ed71e4cba0274ced64de64a15a5f7e0032d955a4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-466-c49faefeafbfb2b6f06778563886a930d1a36a8b: c49faefeafbfb2b6f06778563886a930d1a36a8b<br />
  xe-pw-125858v2: 125858v2</p>

</body>
</html>

--===============8461373770005539047==--

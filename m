Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA3DEC54E67
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 05:46:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F1010EB27;
	Wed, 20 Mar 2024 05:46:49 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E6510EB27;
 Wed, 20 Mar 2024 05:46:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4928702420183847611=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_gpu/drm/xe/xe=5Fdevcoredump=3A_C?=
 =?utf-8?q?heck_NULL_before_dereferencing_coredump=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 20 Mar 2024 05:46:47 -0000
Message-ID: <171091360761.920302.9129467917076852073@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240320051719.3248723-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240320051719.3248723-1-himal.prasad.ghimiray@intel.com>
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

--===============4928702420183847611==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gpu/drm/xe/xe_devcoredump: Check NULL before dereferencing coredump.
URL   : https://patchwork.freedesktop.org/series/131352/
State : success

== Summary ==

CI Bug Log - changes from xe-961-457166e37af9b2618a6600ac79cb359f0247b71c_BAT -> xe-pw-131352v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-961-457166e37af9b2618a6600ac79cb359f0247b71c -> xe-pw-131352v1

  IGT_7770: fef0422fd296f7c65724315f2a455ffb6959fb0d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-961-457166e37af9b2618a6600ac79cb359f0247b71c: 457166e37af9b2618a6600ac79cb359f0247b71c
  xe-pw-131352v1: 131352v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131352v1/index.html

--===============4928702420183847611==
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
<tr><td><b>Series:</b></td><td>gpu/drm/xe/xe_devcoredump: Check NULL before dereferencing coredump.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131352/">https://patchwork.freedesktop.org/series/131352/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131352v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131352v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-961-457166e37af9b2618a6600ac79cb359f0247b71c_BAT -&gt; xe-pw-131352v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-961-457166e37af9b2618a6600ac79cb359f0247b71c -&gt; xe-pw-131352v1</li>
</ul>
<p>IGT_7770: fef0422fd296f7c65724315f2a455ffb6959fb0d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-961-457166e37af9b2618a6600ac79cb359f0247b71c: 457166e37af9b2618a6600ac79cb359f0247b71c<br />
  xe-pw-131352v1: 131352v1</p>

</body>
</html>

--===============4928702420183847611==--

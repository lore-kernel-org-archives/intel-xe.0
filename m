Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8798C47258
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 22:06:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 611FC10E8B1;
	Tue, 23 Jan 2024 22:06:31 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7AB10E3A9;
 Tue, 23 Jan 2024 22:06:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1503329568880776779=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Prefer_BIT/GENMASK_mac?=
 =?utf-8?q?ros_over_shifts_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Tue, 23 Jan 2024 22:06:29 -0000
Message-ID: <170604758997.684313.6098912714330315226@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240123212317.1600836-1-matthew.brost@intel.com>
In-Reply-To: <20240123212317.1600836-1-matthew.brost@intel.com>
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

--===============1503329568880776779==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Prefer BIT/GENMASK macros over shifts (rev2)
URL   : https://patchwork.freedesktop.org/series/129099/
State : success

== Summary ==

CI Bug Log - changes from xe-672-fc6b7c6ee7d786e6ed48425a2ce0e674906e4e5c_BAT -> xe-pw-129099v2_BAT
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

  * Linux: xe-672-fc6b7c6ee7d786e6ed48425a2ce0e674906e4e5c -> xe-pw-129099v2

  IGT_7690: aa45298ff675abbe6bf8f04ae186e2388c35f03a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-672-fc6b7c6ee7d786e6ed48425a2ce0e674906e4e5c: fc6b7c6ee7d786e6ed48425a2ce0e674906e4e5c
  xe-pw-129099v2: 129099v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129099v2/index.html

--===============1503329568880776779==
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
<tr><td><b>Series:</b></td><td>drm/xe: Prefer BIT/GENMASK macros over shifts (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129099/">https://patchwork.freedesktop.org/series/129099/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129099v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129099v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-672-fc6b7c6ee7d786e6ed48425a2ce0e674906e4e5c_BAT -&gt; xe-pw-129099v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-672-fc6b7c6ee7d786e6ed48425a2ce0e674906e4e5c -&gt; xe-pw-129099v2</li>
</ul>
<p>IGT_7690: aa45298ff675abbe6bf8f04ae186e2388c35f03a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-672-fc6b7c6ee7d786e6ed48425a2ce0e674906e4e5c: fc6b7c6ee7d786e6ed48425a2ce0e674906e4e5c<br />
  xe-pw-129099v2: 129099v2</p>

</body>
</html>

--===============1503329568880776779==--

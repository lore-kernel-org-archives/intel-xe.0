Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97299C47258
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 17:48:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4410510E865;
	Tue, 23 Jan 2024 17:48:37 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C1510E837;
 Tue, 23 Jan 2024 17:48:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9212539462734996191=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Only_allow_1_ufence_pe?=
 =?utf-8?q?r_exec_/_bind_IOCTL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Tue, 23 Jan 2024 17:48:35 -0000
Message-ID: <170603211509.683882.14144383285730492386@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240123163422.1570227-1-matthew.brost@intel.com>
In-Reply-To: <20240123163422.1570227-1-matthew.brost@intel.com>
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

--===============9212539462734996191==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Only allow 1 ufence per exec / bind IOCTL
URL   : https://patchwork.freedesktop.org/series/129095/
State : success

== Summary ==

CI Bug Log - changes from xe-672-fc6b7c6ee7d786e6ed48425a2ce0e674906e4e5c_BAT -> xe-pw-129095v1_BAT
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

  * Linux: xe-672-fc6b7c6ee7d786e6ed48425a2ce0e674906e4e5c -> xe-pw-129095v1

  IGT_7690: aa45298ff675abbe6bf8f04ae186e2388c35f03a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-672-fc6b7c6ee7d786e6ed48425a2ce0e674906e4e5c: fc6b7c6ee7d786e6ed48425a2ce0e674906e4e5c
  xe-pw-129095v1: 129095v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129095v1/index.html

--===============9212539462734996191==
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
<tr><td><b>Series:</b></td><td>drm/xe: Only allow 1 ufence per exec / bind IOCTL</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129095/">https://patchwork.freedesktop.org/series/129095/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129095v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129095v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-672-fc6b7c6ee7d786e6ed48425a2ce0e674906e4e5c_BAT -&gt; xe-pw-129095v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-672-fc6b7c6ee7d786e6ed48425a2ce0e674906e4e5c -&gt; xe-pw-129095v1</li>
</ul>
<p>IGT_7690: aa45298ff675abbe6bf8f04ae186e2388c35f03a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-672-fc6b7c6ee7d786e6ed48425a2ce0e674906e4e5c: fc6b7c6ee7d786e6ed48425a2ce0e674906e4e5c<br />
  xe-pw-129095v1: 129095v1</p>

</body>
</html>

--===============9212539462734996191==--

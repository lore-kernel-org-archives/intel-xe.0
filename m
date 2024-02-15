Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5BDC48BC3
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 01:31:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B2610E046;
	Thu, 15 Feb 2024 01:31:44 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFD910E044;
 Thu, 15 Feb 2024 01:31:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6075351784837398224=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_get_rid_of_MAX=5FBINDS?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Paulo Zanoni" <paulo.r.zanoni@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Feb 2024 01:31:44 -0000
Message-ID: <170796070458.1238464.6416972747915843528@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240215005353.1295420-1-paulo.r.zanoni@intel.com>
In-Reply-To: <20240215005353.1295420-1-paulo.r.zanoni@intel.com>
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

--===============6075351784837398224==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: get rid of MAX_BINDS
URL   : https://patchwork.freedesktop.org/series/129923/
State : success

== Summary ==

CI Bug Log - changes from xe-782-e6a76a4d223eb7b8bcec5d0ae6b1da474823b24a_BAT -> xe-pw-129923v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-129923v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - bat-dg2-oem2:       [PASS][1] -> [TIMEOUT][2] ([Intel XE#1167])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-782-e6a76a4d223eb7b8bcec5d0ae6b1da474823b24a/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129923v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html

  
  [Intel XE#1167]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1167


Build changes
-------------

  * Linux: xe-782-e6a76a4d223eb7b8bcec5d0ae6b1da474823b24a -> xe-pw-129923v1

  IGT_7713: 7713
  xe-782-e6a76a4d223eb7b8bcec5d0ae6b1da474823b24a: e6a76a4d223eb7b8bcec5d0ae6b1da474823b24a
  xe-pw-129923v1: 129923v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129923v1/index.html

--===============6075351784837398224==
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
<tr><td><b>Series:</b></td><td>drm/xe: get rid of MAX_BINDS</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129923/">https://patchwork.freedesktop.org/series/129923/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129923v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129923v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-782-e6a76a4d223eb7b8bcec5d0ae6b1da474823b24a_BAT -&gt; xe-pw-129923v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-129923v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-fd-basic:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-782-e6a76a4d223eb7b8bcec5d0ae6b1da474823b24a/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129923v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1167">Intel XE#1167</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-782-e6a76a4d223eb7b8bcec5d0ae6b1da474823b24a -&gt; xe-pw-129923v1</li>
</ul>
<p>IGT_7713: 7713<br />
  xe-782-e6a76a4d223eb7b8bcec5d0ae6b1da474823b24a: e6a76a4d223eb7b8bcec5d0ae6b1da474823b24a<br />
  xe-pw-129923v1: 129923v1</p>

</body>
</html>

--===============6075351784837398224==--

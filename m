Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBF4C47258
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 19:17:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A887F10E7E5;
	Wed, 17 Jan 2024 19:17:48 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6F010E7E5;
 Wed, 17 Jan 2024 19:17:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4882669581123211953=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/doc/rfc=3A_Removing_missing_?=
 =?utf-8?q?reference_to_xe=2Erst?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Wed, 17 Jan 2024 19:17:47 -0000
Message-ID: <170551906731.537692.12790769452375109360@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240116220331.145607-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240116220331.145607-1-rodrigo.vivi@intel.com>
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

--===============4882669581123211953==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/doc/rfc: Removing missing reference to xe.rst
URL   : https://patchwork.freedesktop.org/series/128850/
State : success

== Summary ==

CI Bug Log - changes from xe-639-b42f47ca5fff1d04fb8eb02d64520b3f338a495d_BAT -> xe-pw-128850v1_BAT
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

  * IGT: IGT_7677 -> IGT_7675
  * Linux: xe-639-b42f47ca5fff1d04fb8eb02d64520b3f338a495d -> xe-pw-128850v1

  IGT_7675: ffde49e0583ee5053f25a065356bce6bce91047a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7677: 57ed393a5b5d04e985f9950a7f1546fc95f4001e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-639-b42f47ca5fff1d04fb8eb02d64520b3f338a495d: b42f47ca5fff1d04fb8eb02d64520b3f338a495d
  xe-pw-128850v1: 128850v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128850v1/index.html

--===============4882669581123211953==
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
<tr><td><b>Series:</b></td><td>drm/doc/rfc: Removing missing reference to xe.rst</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128850/">https://patchwork.freedesktop.org/series/128850/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128850v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128850v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-639-b42f47ca5fff1d04fb8eb02d64520b3f338a495d_BAT -&gt; xe-pw-128850v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7677 -&gt; IGT_7675</li>
<li>Linux: xe-639-b42f47ca5fff1d04fb8eb02d64520b3f338a495d -&gt; xe-pw-128850v1</li>
</ul>
<p>IGT_7675: ffde49e0583ee5053f25a065356bce6bce91047a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7677: 57ed393a5b5d04e985f9950a7f1546fc95f4001e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-639-b42f47ca5fff1d04fb8eb02d64520b3f338a495d: b42f47ca5fff1d04fb8eb02d64520b3f338a495d<br />
  xe-pw-128850v1: 128850v1</p>

</body>
</html>

--===============4882669581123211953==--

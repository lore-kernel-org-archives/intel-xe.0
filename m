Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C7CCD54A9
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 10:04:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB65210E363;
	Tue, 19 Sep 2023 10:04:15 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id B6C8F10E363;
 Tue, 19 Sep 2023 10:04:14 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AE493AADD8;
 Tue, 19 Sep 2023 10:04:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6962643122018611648=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Tue, 19 Sep 2023 10:04:14 -0000
Message-ID: <169511785467.3667.16054711558675944282@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230919084609.15768-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230919084609.15768-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A?=
 =?utf-8?q?_Disallow_pinning_dma-bufs_in_VRAM?=
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

--===============6962643122018611648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Disallow pinning dma-bufs in VRAM
URL   : https://patchwork.freedesktop.org/series/123897/
State : success

== Summary ==

CI Bug Log - changes from xe-380-3d7e02fb9c40263a989c4c19d2dc5a07659965ed_BAT -> xe-pw-123897v1_BAT
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

  Here are the changes found in xe-pw-123897v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-atsm-2:         [FAIL][1] ([Intel XE#524]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-380-3d7e02fb9c40263a989c4c19d2dc5a07659965ed/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123897v1/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524


Build changes
-------------

  * Linux: xe-380-3d7e02fb9c40263a989c4c19d2dc5a07659965ed -> xe-pw-123897v1

  IGT_7493: 2517e42d612e0c1ca096acf8b5f6177f7ef4bce7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-380-3d7e02fb9c40263a989c4c19d2dc5a07659965ed: 3d7e02fb9c40263a989c4c19d2dc5a07659965ed
  xe-pw-123897v1: 123897v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123897v1/index.html

--===============6962643122018611648==
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
<tr><td><b>Series:</b></td><td>drm/xe: Disallow pinning dma-bufs in VRAM</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123897/">https://patchwork.freedesktop.org/series/123897/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123897v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123897v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-380-3d7e02fb9c40263a989c4c19d2dc5a07659965ed_BAT -&gt; xe-pw-123897v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-123897v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>{igt@xe_create@create-execqueues-noleak}:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-380-3d7e02fb9c40263a989c4c19d2dc5a07659965ed/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123897v1/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-380-3d7e02fb9c40263a989c4c19d2dc5a07659965ed -&gt; xe-pw-123897v1</li>
</ul>
<p>IGT_7493: 2517e42d612e0c1ca096acf8b5f6177f7ef4bce7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-380-3d7e02fb9c40263a989c4c19d2dc5a07659965ed: 3d7e02fb9c40263a989c4c19d2dc5a07659965ed<br />
  xe-pw-123897v1: 123897v1</p>

</body>
</html>

--===============6962643122018611648==--

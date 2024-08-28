Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0BBC5474A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 07:50:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E887710E4C5;
	Wed, 28 Aug 2024 07:50:58 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 569E610E4C5;
 Wed, 28 Aug 2024 07:50:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1628727851058106552=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_move_the_kernel_lrc_fr?=
 =?utf-8?q?om_hwe_to_execlist_port_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ilia Levi" <ilia.levi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Aug 2024 07:50:57 -0000
Message-ID: <172483145734.809363.7323264823403965276@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240826100655.1719060-1-ilia.levi@intel.com>
In-Reply-To: <20240826100655.1719060-1-ilia.levi@intel.com>
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

--===============1628727851058106552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: move the kernel lrc from hwe to execlist port (rev3)
URL   : https://patchwork.freedesktop.org/series/137638/
State : failure

== Summary ==

CI Bug Log - changes from xe-1842-2940d1fa7abe0d2a9acc95fd1c704a8d8cbc68f4_BAT -> xe-pw-137638v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-137638v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-137638v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-137638v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_compute_mode@twice-bindexecqueue:
    - bat-lnl-1:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1842-2940d1fa7abe0d2a9acc95fd1c704a8d8cbc68f4/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137638v3/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue.html

  


Build changes
-------------

  * Linux: xe-1842-2940d1fa7abe0d2a9acc95fd1c704a8d8cbc68f4 -> xe-pw-137638v3

  IGT_7993: 3b6b2d238e864ff1af9e33159d3bbf4b7f01d86d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1842-2940d1fa7abe0d2a9acc95fd1c704a8d8cbc68f4: 2940d1fa7abe0d2a9acc95fd1c704a8d8cbc68f4
  xe-pw-137638v3: 137638v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137638v3/index.html

--===============1628727851058106552==
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
<tr><td><b>Series:</b></td><td>drm/xe: move the kernel lrc from hwe to execlist port (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137638/">https://patchwork.freedesktop.org/series/137638/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137638v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137638v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1842-2940d1fa7abe0d2a9acc95fd1c704a8d8cbc68f4_BAT -&gt; xe-pw-137638v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-137638v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-137638v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-137638v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-bindexecqueue:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1842-2940d1fa7abe0d2a9acc95fd1c704a8d8cbc68f4/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137638v3/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1842-2940d1fa7abe0d2a9acc95fd1c704a8d8cbc68f4 -&gt; xe-pw-137638v3</li>
</ul>
<p>IGT_7993: 3b6b2d238e864ff1af9e33159d3bbf4b7f01d86d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1842-2940d1fa7abe0d2a9acc95fd1c704a8d8cbc68f4: 2940d1fa7abe0d2a9acc95fd1c704a8d8cbc68f4<br />
  xe-pw-137638v3: 137638v3</p>

</body>
</html>

--===============1628727851058106552==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D4CD609A1
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 15:21:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6FB10E96F;
	Tue, 16 Dec 2025 15:21:19 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C26410E96F;
 Tue, 16 Dec 2025 15:21:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6666874652215519845=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/gpusvm=3A_Assign_mainta?=
 =?utf-8?q?iners_to_the_DRM_GPUSVM_helpers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Dec 2025 15:21:18 -0000
Message-ID: <176589847804.93876.4723186338227274578@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251216092800.199824-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20251216092800.199824-1-thomas.hellstrom@linux.intel.com>
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

--===============6666874652215519845==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/gpusvm: Assign maintainers to the DRM GPUSVM helpers
URL   : https://patchwork.freedesktop.org/series/159094/
State : success

== Summary ==

CI Bug Log - changes from xe-4252-4bae139bb961fd9df698b3bf15bf39f9bf9800a1_BAT -> xe-pw-159094v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-159094v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#6519])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4252-4bae139bb961fd9df698b3bf15bf39f9bf9800a1/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159094v1/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * IGT: IGT_8666 -> IGT_8667
  * Linux: xe-4252-4bae139bb961fd9df698b3bf15bf39f9bf9800a1 -> xe-pw-159094v1

  IGT_8666: 8666
  IGT_8667: 2d7ec9a36c550c48af4bdd6e748f6753369ab8ff @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4252-4bae139bb961fd9df698b3bf15bf39f9bf9800a1: 4bae139bb961fd9df698b3bf15bf39f9bf9800a1
  xe-pw-159094v1: 159094v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159094v1/index.html

--===============6666874652215519845==
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
<tr><td><b>Series:</b></td><td>drm/gpusvm: Assign maintainers to the DRM GPUSVM helpers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159094/">https://patchwork.freedesktop.org/series/159094/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159094v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159094v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4252-4bae139bb961fd9df698b3bf15bf39f9bf9800a1_BAT -&gt; xe-pw-159094v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159094v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4252-4bae139bb961fd9df698b3bf15bf39f9bf9800a1/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159094v1/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8666 -&gt; IGT_8667</li>
<li>Linux: xe-4252-4bae139bb961fd9df698b3bf15bf39f9bf9800a1 -&gt; xe-pw-159094v1</li>
</ul>
<p>IGT_8666: 8666<br />
  IGT_8667: 2d7ec9a36c550c48af4bdd6e748f6753369ab8ff @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4252-4bae139bb961fd9df698b3bf15bf39f9bf9800a1: 4bae139bb961fd9df698b3bf15bf39f9bf9800a1<br />
  xe-pw-159094v1: 159094v1</p>

</body>
</html>

--===============6666874652215519845==--

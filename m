Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97AEC36002
	for <intel-xe@archiver.kernel.org>; Mon, 24 Mar 2025 14:14:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7FF310E3D9;
	Mon, 24 Mar 2025 14:14:22 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F06A10E368;
 Mon, 24 Mar 2025 14:14:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2154346613472371683=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/svm=3A_fix_dereferen?=
 =?utf-8?q?cing_error_pointer_in_drm=5Fgpusvm=5Frange=5Falloc=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harshit Mogalapalli" <harshit.m.mogalapalli@oracle.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Mar 2025 14:14:21 -0000
Message-ID: <174282566145.73022.13525603506369813491@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250323124907.3946370-1-harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20250323124907.3946370-1-harshit.m.mogalapalli@oracle.com>
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

--===============2154346613472371683==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/svm: fix dereferencing error pointer in drm_gpusvm_range_alloc()
URL   : https://patchwork.freedesktop.org/series/146665/
State : success

== Summary ==

CI Bug Log - changes from xe-2839-f8c17a63ca147e008f36d1efd80206d4ce4e8ce1_BAT -> xe-pw-146665v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-146665v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_vm@shared-pte-page:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#4491])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2839-f8c17a63ca147e008f36d1efd80206d4ce4e8ce1/bat-adlp-vf/igt@xe_vm@shared-pte-page.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146665v1/bat-adlp-vf/igt@xe_vm@shared-pte-page.html

  
  [Intel XE#4491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491


Build changes
-------------

  * IGT: IGT_8278 -> IGT_8279
  * Linux: xe-2839-f8c17a63ca147e008f36d1efd80206d4ce4e8ce1 -> xe-pw-146665v1

  IGT_8278: b6673db372bd8987f65948d3a97f8dcd2ef42b01 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8279: 8279
  xe-2839-f8c17a63ca147e008f36d1efd80206d4ce4e8ce1: f8c17a63ca147e008f36d1efd80206d4ce4e8ce1
  xe-pw-146665v1: 146665v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146665v1/index.html

--===============2154346613472371683==
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
<tr><td><b>Series:</b></td><td>drm/xe/svm: fix dereferencing error pointer in drm_gpusvm_range_alloc()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146665/">https://patchwork.freedesktop.org/series/146665/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146665v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146665v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2839-f8c17a63ca147e008f36d1efd80206d4ce4e8ce1_BAT -&gt; xe-pw-146665v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-146665v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_vm@shared-pte-page:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2839-f8c17a63ca147e008f36d1efd80206d4ce4e8ce1/bat-adlp-vf/igt@xe_vm@shared-pte-page.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146665v1/bat-adlp-vf/igt@xe_vm@shared-pte-page.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491">Intel XE#4491</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8278 -&gt; IGT_8279</li>
<li>Linux: xe-2839-f8c17a63ca147e008f36d1efd80206d4ce4e8ce1 -&gt; xe-pw-146665v1</li>
</ul>
<p>IGT_8278: b6673db372bd8987f65948d3a97f8dcd2ef42b01 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8279: 8279<br />
  xe-2839-f8c17a63ca147e008f36d1efd80206d4ce4e8ce1: f8c17a63ca147e008f36d1efd80206d4ce4e8ce1<br />
  xe-pw-146665v1: 146665v1</p>

</body>
</html>

--===============2154346613472371683==--

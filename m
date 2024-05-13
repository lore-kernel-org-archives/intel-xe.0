Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFF3C25B74
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 07:58:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD26D10E4CA;
	Mon, 13 May 2024 07:58:44 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5EC10E4AD;
 Mon, 13 May 2024 07:58:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0974376795790834836=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_add_mmio_debugfs_file_?=
 =?utf-8?q?=26_restore_xe=5Fmmio=5Fioctl_as_its_ioctl_handler?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Koby Elbaz" <kelbaz@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 13 May 2024 07:58:43 -0000
Message-ID: <171558712370.2094224.7382848628128208546@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240512125318.427303-1-kelbaz@habana.ai>
In-Reply-To: <20240512125318.427303-1-kelbaz@habana.ai>
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

--===============0974376795790834836==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: add mmio debugfs file & restore xe_mmio_ioctl as its ioctl handler
URL   : https://patchwork.freedesktop.org/series/133505/
State : success

== Summary ==

CI Bug Log - changes from xe-1276-7aa7a8842f00c5749e1a21cd2cf6dfc0e3e3a18e_BAT -> xe-pw-133505v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 3)
------------------------------

  Missing    (2): bat-dg2-oem2 bat-adlp-7 

Known issues
------------

  Here are the changes found in xe-pw-133505v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - bat-pvc-2:          [DMESG-WARN][1] ([Intel XE#1238]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1276-7aa7a8842f00c5749e1a21cd2cf6dfc0e3e3a18e/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133505v1/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  
  [Intel XE#1238]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1238


Build changes
-------------

  * IGT: IGT_7846 -> IGT_7847
  * Linux: xe-1276-7aa7a8842f00c5749e1a21cd2cf6dfc0e3e3a18e -> xe-pw-133505v1

  IGT_7846: 4a5fd4e7cb2798636f6464e2bd61399f3242b322 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7847: 86712f2effc8ba6690c7e165ad63904416763b75 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1276-7aa7a8842f00c5749e1a21cd2cf6dfc0e3e3a18e: 7aa7a8842f00c5749e1a21cd2cf6dfc0e3e3a18e
  xe-pw-133505v1: 133505v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133505v1/index.html

--===============0974376795790834836==
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
<tr><td><b>Series:</b></td><td>drm/xe: add mmio debugfs file &amp; restore xe_mmio_ioctl as its ioctl handler</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133505/">https://patchwork.freedesktop.org/series/133505/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133505v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133505v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1276-7aa7a8842f00c5749e1a21cd2cf6dfc0e3e3a18e_BAT -&gt; xe-pw-133505v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 3)</h2>
<p>Missing    (2): bat-dg2-oem2 bat-adlp-7 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133505v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-shared-vm-basic:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1276-7aa7a8842f00c5749e1a21cd2cf6dfc0e3e3a18e/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1238">Intel XE#1238</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133505v1/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7846 -&gt; IGT_7847</li>
<li>Linux: xe-1276-7aa7a8842f00c5749e1a21cd2cf6dfc0e3e3a18e -&gt; xe-pw-133505v1</li>
</ul>
<p>IGT_7846: 4a5fd4e7cb2798636f6464e2bd61399f3242b322 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7847: 86712f2effc8ba6690c7e165ad63904416763b75 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1276-7aa7a8842f00c5749e1a21cd2cf6dfc0e3e3a18e: 7aa7a8842f00c5749e1a21cd2cf6dfc0e3e3a18e<br />
  xe-pw-133505v1: 133505v1</p>

</body>
</html>

--===============0974376795790834836==--

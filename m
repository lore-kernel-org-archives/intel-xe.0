Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EBAE743F7
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 08:31:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A12510E6CC;
	Fri, 29 Sep 2023 08:31:16 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id BCE8710E6CC;
 Fri, 29 Sep 2023 08:31:13 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B2B25AADD6;
 Fri, 29 Sep 2023 08:31:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1241749537908517304=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Fri, 29 Sep 2023 08:31:13 -0000
Message-ID: <169597627369.19497.8987479051682799695@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230929051539.3157441-1-lucas.demarchi@intel.com>
In-Reply-To: <20230929051539.3157441-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A?=
 =?utf-8?q?_Leverage_ComputeCS_read_L3_caching?=
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

--===============1241749537908517304==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Leverage ComputeCS read L3 caching
URL   : https://patchwork.freedesktop.org/series/124431/
State : success

== Summary ==

CI Bug Log - changes from xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64_BAT -> xe-pw-124431v1_BAT
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

  Here are the changes found in xe-pw-124431v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_reset@virtual-close-fd-no-exec:
    - bat-pvc-2:          [PASS][1] -> [DMESG-WARN][2] ([Intel XE#696])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-pvc-2/igt@xe_exec_reset@virtual-close-fd-no-exec.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124431v1/bat-pvc-2/igt@xe_exec_reset@virtual-close-fd-no-exec.html

  
#### Possible fixes ####

  * igt@xe_live_ktest@bo:
    - bat-dg2-oem2:       [DMESG-WARN][3] ([Intel XE#747]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-dg2-oem2/igt@xe_live_ktest@bo.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124431v1/bat-dg2-oem2/igt@xe_live_ktest@bo.html

  
  [Intel XE#696]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/696
  [Intel XE#747]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/747


Build changes
-------------

  * Linux: xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64 -> xe-pw-124431v1

  IGT_7506: 4fdf544bd0a38c5a100ef43c30171827e1c8c442 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64: 9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64
  xe-pw-124431v1: 124431v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124431v1/index.html

--===============1241749537908517304==
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
<tr><td><b>Series:</b></td><td>drm/xe: Leverage ComputeCS read L3 caching</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124431/">https://patchwork.freedesktop.org/series/124431/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124431v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124431v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64_BAT -&gt; xe-pw-124431v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-124431v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_reset@virtual-close-fd-no-exec:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-pvc-2/igt@xe_exec_reset@virtual-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124431v1/bat-pvc-2/igt@xe_exec_reset@virtual-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/696">Intel XE#696</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_live_ktest@bo:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-dg2-oem2/igt@xe_live_ktest@bo.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/747">Intel XE#747</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124431v1/bat-dg2-oem2/igt@xe_live_ktest@bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64 -&gt; xe-pw-124431v1</li>
</ul>
<p>IGT_7506: 4fdf544bd0a38c5a100ef43c30171827e1c8c442 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64: 9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64<br />
  xe-pw-124431v1: 124431v1</p>

</body>
</html>

--===============1241749537908517304==--

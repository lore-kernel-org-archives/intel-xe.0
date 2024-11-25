Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B519CD59D72
	for <intel-xe@archiver.kernel.org>; Mon, 25 Nov 2024 21:10:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF8A10E065;
	Mon, 25 Nov 2024 21:10:10 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 858F010E065;
 Mon, 25 Nov 2024 21:10:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8388988591154509706=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Update_xe2=5Fgrap?=
 =?utf-8?q?hics_name_string?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 Nov 2024 21:10:09 -0000
Message-ID: <173256900956.2985363.9455906455664154953@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241125194838.1190599-2-matthew.d.roper@intel.com>
In-Reply-To: <20241125194838.1190599-2-matthew.d.roper@intel.com>
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

--===============8388988591154509706==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Update xe2_graphics name string
URL   : https://patchwork.freedesktop.org/series/141769/
State : success

== Summary ==

CI Bug Log - changes from xe-2274-2b9104b225382ff5ecb9cba445ac145eaa3f00b2_BAT -> xe-pw-141769v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-141769v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
    - bat-dg2-oem2:       [DMESG-FAIL][1] ([Intel XE#3371]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2274-2b9104b225382ff5ecb9cba445ac145eaa3f00b2/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141769v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html

  
  [Intel XE#3371]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371


Build changes
-------------

  * IGT: IGT_8124 -> IGT_8125
  * Linux: xe-2274-2b9104b225382ff5ecb9cba445ac145eaa3f00b2 -> xe-pw-141769v1

  IGT_8124: 8124
  IGT_8125: fbfda23ba003aab3454436d95c233dcf5e3bee54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2274-2b9104b225382ff5ecb9cba445ac145eaa3f00b2: 2b9104b225382ff5ecb9cba445ac145eaa3f00b2
  xe-pw-141769v1: 141769v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141769v1/index.html

--===============8388988591154509706==
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
<tr><td><b>Series:</b></td><td>drm/xe: Update xe2_graphics name string</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141769/">https://patchwork.freedesktop.org/series/141769/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141769v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141769v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2274-2b9104b225382ff5ecb9cba445ac145eaa3f00b2_BAT -&gt; xe-pw-141769v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141769v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2274-2b9104b225382ff5ecb9cba445ac145eaa3f00b2/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371">Intel XE#3371</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141769v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8124 -&gt; IGT_8125</li>
<li>Linux: xe-2274-2b9104b225382ff5ecb9cba445ac145eaa3f00b2 -&gt; xe-pw-141769v1</li>
</ul>
<p>IGT_8124: 8124<br />
  IGT_8125: fbfda23ba003aab3454436d95c233dcf5e3bee54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2274-2b9104b225382ff5ecb9cba445ac145eaa3f00b2: 2b9104b225382ff5ecb9cba445ac145eaa3f00b2<br />
  xe-pw-141769v1: 141769v1</p>

</body>
</html>

--===============8388988591154509706==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB0DC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 22:01:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C0B110EBB8;
	Thu, 11 Jul 2024 22:01:01 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA3010EBB8;
 Thu, 11 Jul 2024 22:01:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3475717395056688519=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/exec=3A_Fix_minor_bug_rel?=
 =?utf-8?q?ated_to_xe=5Fsync=5Fentry=5Fcleanup_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Jul 2024 22:01:00 -0000
Message-ID: <172073526003.165243.11995553074461924289@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240711204832.3724771-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240711204832.3724771-1-ashutosh.dixit@intel.com>
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

--===============3475717395056688519==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/exec: Fix minor bug related to xe_sync_entry_cleanup (rev2)
URL   : https://patchwork.freedesktop.org/series/136013/
State : success

== Summary ==

CI Bug Log - changes from xe-1598-3ec725ffa5a11587ef9a6a3b8a9f9b3bad05aae1_BAT -> xe-pw-136013v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-136013v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - bat-dg2-oem2:       [PASS][1] -> [INCOMPLETE][2] ([Intel XE#1169] / [Intel XE#1356])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1598-3ec725ffa5a11587ef9a6a3b8a9f9b3bad05aae1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136013v2/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356


Build changes
-------------

  * Linux: xe-1598-3ec725ffa5a11587ef9a6a3b8a9f9b3bad05aae1 -> xe-pw-136013v2

  IGT_7925: def41c762723c9ba046a3ffe722d046cd12e993d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1598-3ec725ffa5a11587ef9a6a3b8a9f9b3bad05aae1: 3ec725ffa5a11587ef9a6a3b8a9f9b3bad05aae1
  xe-pw-136013v2: 136013v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136013v2/index.html

--===============3475717395056688519==
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
<tr><td><b>Series:</b></td><td>drm/xe/exec: Fix minor bug related to xe_sync_entry_cleanup (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136013/">https://patchwork.freedesktop.org/series/136013/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136013v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136013v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1598-3ec725ffa5a11587ef9a6a3b8a9f9b3bad05aae1_BAT -&gt; xe-pw-136013v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136013v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-shared-vm-basic:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1598-3ec725ffa5a11587ef9a6a3b8a9f9b3bad05aae1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136013v2/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1598-3ec725ffa5a11587ef9a6a3b8a9f9b3bad05aae1 -&gt; xe-pw-136013v2</li>
</ul>
<p>IGT_7925: def41c762723c9ba046a3ffe722d046cd12e993d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1598-3ec725ffa5a11587ef9a6a3b8a9f9b3bad05aae1: 3ec725ffa5a11587ef9a6a3b8a9f9b3bad05aae1<br />
  xe-pw-136013v2: 136013v2</p>

</body>
</html>

--===============3475717395056688519==--

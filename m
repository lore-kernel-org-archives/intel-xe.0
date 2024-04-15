Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9E0C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 15:28:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1A5112689;
	Mon, 15 Apr 2024 15:28:36 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B48112689;
 Mon, 15 Apr 2024 15:28:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3765851563143642810=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Cleanup_and_fixes_in_drmm=5Fadd?=
 =?utf-8?q?=5Faction=5For=5Freset_usage_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Apr 2024 15:28:34 -0000
Message-ID: <171319491462.1406028.13270719962448438589@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240412181211.1155732-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240412181211.1155732-1-himal.prasad.ghimiray@intel.com>
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

--===============3765851563143642810==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Cleanup and fixes in drmm_add_action_or_reset usage (rev4)
URL   : https://patchwork.freedesktop.org/series/132150/
State : success

== Summary ==

CI Bug Log - changes from xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5_BAT -> xe-pw-132150v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-132150v4_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-threads-small:
    - bat-dg2-oem2:       [PASS][1] -> [TIMEOUT][2] ([Intel XE#1259] / [Intel XE#1473])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/bat-dg2-oem2/igt@xe_evict@evict-threads-small.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/bat-dg2-oem2/igt@xe_evict@evict-threads-small.html

  
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473


Build changes
-------------

  * Linux: xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5 -> xe-pw-132150v4

  IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5: a503d0d68ea39792b2740a7af033bd42fb84f4a5
  xe-pw-132150v4: 132150v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/index.html

--===============3765851563143642810==
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
<tr><td><b>Series:</b></td><td>Cleanup and fixes in drmm_add_action_or_reset usage (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132150/">https://patchwork.freedesktop.org/series/132150/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5_BAT -&gt; xe-pw-132150v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132150v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_evict@evict-threads-small:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/bat-dg2-oem2/igt@xe_evict@evict-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/bat-dg2-oem2/igt@xe_evict@evict-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5 -&gt; xe-pw-132150v4</li>
</ul>
<p>IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5: a503d0d68ea39792b2740a7af033bd42fb84f4a5<br />
  xe-pw-132150v4: 132150v4</p>

</body>
</html>

--===============3765851563143642810==--

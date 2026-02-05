Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0543DEA7945
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 03:24:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882AE10E192;
	Thu,  5 Feb 2026 03:24:07 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B646B10E1C4;
 Thu,  5 Feb 2026 03:24:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1980799124886504423=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Fix_fs=5Freclaim_deadlock_c?=
 =?utf-8?q?aused_by_CCS_save/restore_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Feb 2026 03:24:06 -0000
Message-ID: <177026184670.225549.13361203969712909653@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260204164642.3509298-5-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260204164642.3509298-5-satyanarayana.k.v.p@intel.com>
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

--===============1980799124886504423==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix fs_reclaim deadlock caused by CCS save/restore (rev2)
URL   : https://patchwork.freedesktop.org/series/160841/
State : success

== Summary ==

CI Bug Log - changes from xe-4500-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3_BAT -> xe-pw-160841v2_BAT
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

  Here are the changes found in xe-pw-160841v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_pat@pat-index-xe2@render:
    - bat-ptl-vm:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#7110]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4500-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v2/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html

  
  [Intel XE#7110]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7110


Build changes
-------------

  * Linux: xe-4500-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3 -> xe-pw-160841v2

  IGT_8737: 8737
  xe-4500-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3: 55e3e3aeecf80d9fd2536acd8ed785282be5a7b3
  xe-pw-160841v2: 160841v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v2/index.html

--===============1980799124886504423==
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
<tr><td><b>Series:</b></td><td>Fix fs_reclaim deadlock caused by CCS save/restore (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160841/">https://patchwork.freedesktop.org/series/160841/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4500-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3_BAT -&gt; xe-pw-160841v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-160841v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_pat@pat-index-xe2@render:<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4500-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v2/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7110">Intel XE#7110</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4500-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3 -&gt; xe-pw-160841v2</li>
</ul>
<p>IGT_8737: 8737<br />
  xe-4500-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3: 55e3e3aeecf80d9fd2536acd8ed785282be5a7b3<br />
  xe-pw-160841v2: 160841v2</p>

</body>
</html>

--===============1980799124886504423==--

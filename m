Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B67EA8104
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 11:59:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB01D10E568;
	Tue, 10 Feb 2026 11:59:25 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B0B10E568;
 Tue, 10 Feb 2026 11:59:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1310131849955029950=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Fix_fs=5Freclaim_deadlock_c?=
 =?utf-8?q?aused_by_CCS_save/restore_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Feb 2026 11:59:23 -0000
Message-ID: <177072476398.241779.14458221474702066835@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260210105929.4089794-5-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260210105929.4089794-5-satyanarayana.k.v.p@intel.com>
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

--===============1310131849955029950==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix fs_reclaim deadlock caused by CCS save/restore (rev3)
URL   : https://patchwork.freedesktop.org/series/160841/
State : success

== Summary ==

CI Bug Log - changes from xe-4534-4963fa04cc7c2c68030bef5889b6210052f59061_BAT -> xe-pw-160841v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4534-4963fa04cc7c2c68030bef5889b6210052f59061 -> xe-pw-160841v3

  IGT_8746: 8746
  xe-4534-4963fa04cc7c2c68030bef5889b6210052f59061: 4963fa04cc7c2c68030bef5889b6210052f59061
  xe-pw-160841v3: 160841v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v3/index.html

--===============1310131849955029950==
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
<tr><td><b>Series:</b></td><td>Fix fs_reclaim deadlock caused by CCS save/restore (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160841/">https://patchwork.freedesktop.org/series/160841/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160841v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4534-4963fa04cc7c2c68030bef5889b6210052f59061_BAT -&gt; xe-pw-160841v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4534-4963fa04cc7c2c68030bef5889b6210052f59061 -&gt; xe-pw-160841v3</li>
</ul>
<p>IGT_8746: 8746<br />
  xe-4534-4963fa04cc7c2c68030bef5889b6210052f59061: 4963fa04cc7c2c68030bef5889b6210052f59061<br />
  xe-pw-160841v3: 160841v3</p>

</body>
</html>

--===============1310131849955029950==--

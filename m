Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B3AC43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 04:23:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F7110E549;
	Fri,  3 Jul 2026 04:23:07 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505F710E549;
 Fri,  3 Jul 2026 04:23:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5741524787111728779=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_Skip_TR?=
 =?utf-8?q?ANS=5FVTOTAL=2EVtotal_write_on_NVL_pre-C0?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 03 Jul 2026 04:23:05 -0000
Message-ID: <178305258532.146722.294677095764461401@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260703032653.2122784-1-suraj.kandpal@intel.com>
In-Reply-To: <20260703032653.2122784-1-suraj.kandpal@intel.com>
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

--===============5741524787111728779==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Skip TRANS_VTOTAL.Vtotal write on NVL pre-C0
URL   : https://patchwork.freedesktop.org/series/169726/
State : success

== Summary ==

CI Bug Log - changes from xe-5335-2bdb7ee737dfd4d699e9994ef8aec5c92ec2d4e5_BAT -> xe-pw-169726v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5335-2bdb7ee737dfd4d699e9994ef8aec5c92ec2d4e5 -> xe-pw-169726v1

  IGT_8990: 8990
  xe-5335-2bdb7ee737dfd4d699e9994ef8aec5c92ec2d4e5: 2bdb7ee737dfd4d699e9994ef8aec5c92ec2d4e5
  xe-pw-169726v1: 169726v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169726v1/index.html

--===============5741524787111728779==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Skip TRANS_VTOTAL.Vtotal write on NVL pre-C0</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169726/">https://patchwork.freedesktop.org/series/169726/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169726v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169726v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5335-2bdb7ee737dfd4d699e9994ef8aec5c92ec2d4e5_BAT -&gt; xe-pw-169726v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5335-2bdb7ee737dfd4d699e9994ef8aec5c92ec2d4e5 -&gt; xe-pw-169726v1</li>
</ul>
<p>IGT_8990: 8990<br />
  xe-5335-2bdb7ee737dfd4d699e9994ef8aec5c92ec2d4e5: 2bdb7ee737dfd4d699e9994ef8aec5c92ec2d4e5<br />
  xe-pw-169726v1: 169726v1</p>

</body>
</html>

--===============5741524787111728779==--

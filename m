Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387A0CD6E56
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 12:18:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA631132A2;
	Mon,  1 Jun 2026 12:18:44 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B79D1132A2;
 Mon,  1 Jun 2026 12:18:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2304842658594384938=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_Mask_RO?=
 =?utf-8?q?_bits_in_gen9=5Fwrite=5Fdc=5Fstate=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dibin Moolakadan Subrahmanian" <dibin.moolakadan.subrahmanian@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Jun 2026 12:18:43 -0000
Message-ID: <178031632343.30505.14187056680927790129@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <<20260506130321.487414-1-dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <<20260506130321.487414-1-dibin.moolakadan.subrahmanian@intel.com>
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

--===============2304842658594384938==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Mask RO bits in gen9_write_dc_state()
URL   : https://patchwork.freedesktop.org/series/167642/
State : success

== Summary ==

CI Bug Log - changes from xe-5171-8133a9f4c4fd407e81df71530490836a1170bb2f_BAT -> xe-pw-167642v1_BAT
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

  * Linux: xe-5171-8133a9f4c4fd407e81df71530490836a1170bb2f -> xe-pw-167642v1

  IGT_8943: 8943
  xe-5171-8133a9f4c4fd407e81df71530490836a1170bb2f: 8133a9f4c4fd407e81df71530490836a1170bb2f
  xe-pw-167642v1: 167642v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167642v1/index.html

--===============2304842658594384938==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Mask RO bits in gen9_write_dc_state()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167642/">https://patchwork.freedesktop.org/series/167642/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167642v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167642v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5171-8133a9f4c4fd407e81df71530490836a1170bb2f_BAT -&gt; xe-pw-167642v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5171-8133a9f4c4fd407e81df71530490836a1170bb2f -&gt; xe-pw-167642v1</li>
</ul>
<p>IGT_8943: 8943<br />
  xe-5171-8133a9f4c4fd407e81df71530490836a1170bb2f: 8133a9f4c4fd407e81df71530490836a1170bb2f<br />
  xe-pw-167642v1: 167642v1</p>

</body>
</html>

--===============2304842658594384938==--

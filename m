Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA92CCD1A2
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 00:00:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F377D10E546;
	Tue, 21 Oct 2025 00:00:57 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3498310E545;
 Tue, 21 Oct 2025 00:00:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3811142965015319625=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyTIFhlLkNJLkJBVDogc3VjY2VzcyBmb3IgZHJtL2k5MTUvZHA6IFNpbXBsaWZ5?=
 =?utf-8?b?IGludGVsX2RwX25lZWRzXzhiMTBiX2ZlYygp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 Oct 2025 00:00:57 -0000
Message-ID: <176100485717.35266.2376344388687288783@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251020154438.416761-1-imre.deak@intel.com>
In-Reply-To: <20251020154438.416761-1-imre.deak@intel.com>
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

--===============3811142965015319625==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: Simplify intel_dp_needs_8b10b_fec()
URL   : https://patchwork.freedesktop.org/series/156212/
State : success

== Summary ==

CI Bug Log - changes from xe-3950-76e60b5ce41fc1bcabf7941a57303d541bffd6ad_BAT -> xe-pw-156212v1_BAT
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

  * IGT: IGT_8593 -> IGT_8594
  * Linux: xe-3950-76e60b5ce41fc1bcabf7941a57303d541bffd6ad -> xe-pw-156212v1

  IGT_8593: 8593
  IGT_8594: 8594
  xe-3950-76e60b5ce41fc1bcabf7941a57303d541bffd6ad: 76e60b5ce41fc1bcabf7941a57303d541bffd6ad
  xe-pw-156212v1: 156212v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156212v1/index.html

--===============3811142965015319625==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: Simplify intel_dp_needs_8b10b_fec()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156212/">https://patchwork.freedesktop.org/series/156212/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156212v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156212v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3950-76e60b5ce41fc1bcabf7941a57303d541bffd6ad_BAT -&gt; xe-pw-156212v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8593 -&gt; IGT_8594</li>
<li>Linux: xe-3950-76e60b5ce41fc1bcabf7941a57303d541bffd6ad -&gt; xe-pw-156212v1</li>
</ul>
<p>IGT_8593: 8593<br />
  IGT_8594: 8594<br />
  xe-3950-76e60b5ce41fc1bcabf7941a57303d541bffd6ad: 76e60b5ce41fc1bcabf7941a57303d541bffd6ad<br />
  xe-pw-156212v1: 156212v1</p>

</body>
</html>

--===============3811142965015319625==--

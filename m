Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33791C77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 19:14:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A7210E61F;
	Tue, 24 Jun 2025 19:14:42 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C49F10E61F;
 Tue, 24 Jun 2025 19:14:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7677052519316269038=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/flipq=3A_Rough_fli?=
 =?utf-8?q?p_queue_implementation_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Jun 2025 19:14:42 -0000
Message-ID: <175079248224.105982.15026261825131961883@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250624170049.27284-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250624170049.27284-1-ville.syrjala@linux.intel.com>
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

--===============7677052519316269038==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/flipq: Rough flip queue implementation (rev7)
URL   : https://patchwork.freedesktop.org/series/149109/
State : success

== Summary ==

CI Bug Log - changes from xe-3298-0976369b344a468a1325d871f1fb8866c877e8cf_BAT -> xe-pw-149109v7_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3298-0976369b344a468a1325d871f1fb8866c877e8cf -> xe-pw-149109v7

  IGT_8424: 68588b3c89a1bbe08c54d21c4d3d2e509957c795 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3298-0976369b344a468a1325d871f1fb8866c877e8cf: 0976369b344a468a1325d871f1fb8866c877e8cf
  xe-pw-149109v7: 149109v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149109v7/index.html

--===============7677052519316269038==
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
<tr><td><b>Series:</b></td><td>drm/i915/flipq: Rough flip queue implementation (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149109/">https://patchwork.freedesktop.org/series/149109/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149109v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149109v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3298-0976369b344a468a1325d871f1fb8866c877e8cf_BAT -&gt; xe-pw-149109v7_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3298-0976369b344a468a1325d871f1fb8866c877e8cf -&gt; xe-pw-149109v7</li>
</ul>
<p>IGT_8424: 68588b3c89a1bbe08c54d21c4d3d2e509957c795 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3298-0976369b344a468a1325d871f1fb8866c877e8cf: 0976369b344a468a1325d871f1fb8866c877e8cf<br />
  xe-pw-149109v7: 149109v7</p>

</body>
</html>

--===============7677052519316269038==--

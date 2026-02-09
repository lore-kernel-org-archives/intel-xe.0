Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D15E81BD3
	for <intel-xe@archiver.kernel.org>; Mon,  9 Feb 2026 14:59:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70AA510E40E;
	Mon,  9 Feb 2026 14:59:01 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B39110E40E;
 Mon,  9 Feb 2026 14:59:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5678259751119323521=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_change_?=
 =?utf-8?q?pipe_allocation_order_for_discrete_platforms_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Feb 2026 14:59:00 -0000
Message-ID: <177064914041.238102.9613767849492532937@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260209141657.629872-1-jani.nikula@intel.com>
In-Reply-To: <20260209141657.629872-1-jani.nikula@intel.com>
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

--===============5678259751119323521==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: change pipe allocation order for discrete platforms (rev3)
URL   : https://patchwork.freedesktop.org/series/157782/
State : success

== Summary ==

CI Bug Log - changes from xe-4528-134c7ad1c5adea6821cf89fd18d7e2c40da6f769_BAT -> xe-pw-157782v3_BAT
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

  * Linux: xe-4528-134c7ad1c5adea6821cf89fd18d7e2c40da6f769 -> xe-pw-157782v3

  IGT_8745: 8745
  xe-4528-134c7ad1c5adea6821cf89fd18d7e2c40da6f769: 134c7ad1c5adea6821cf89fd18d7e2c40da6f769
  xe-pw-157782v3: 157782v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v3/index.html

--===============5678259751119323521==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: change pipe allocation order for discrete platforms (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157782/">https://patchwork.freedesktop.org/series/157782/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4528-134c7ad1c5adea6821cf89fd18d7e2c40da6f769_BAT -&gt; xe-pw-157782v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4528-134c7ad1c5adea6821cf89fd18d7e2c40da6f769 -&gt; xe-pw-157782v3</li>
</ul>
<p>IGT_8745: 8745<br />
  xe-4528-134c7ad1c5adea6821cf89fd18d7e2c40da6f769: 134c7ad1c5adea6821cf89fd18d7e2c40da6f769<br />
  xe-pw-157782v3: 157782v3</p>

</body>
</html>

--===============5678259751119323521==--

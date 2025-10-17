Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA9ECCD195
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 18:29:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C1110ECD1;
	Fri, 17 Oct 2025 18:29:44 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E6310ECD1;
 Fri, 17 Oct 2025 18:29:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9005141872104716142=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/2?=
 =?utf-8?q?=5D_drm/atomic=3A_WARN_about_missing_acquire=5Fctx_in_drm=5Fatomi?=
 =?utf-8?q?c=5Fget=5Fprivate=5Fobj=5Fstate=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Oct 2025 18:29:43 -0000
Message-ID: <176072578368.28223.14492158877790719419@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251017163327.9074-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20251017163327.9074-1-ville.syrjala@linux.intel.com>
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

--===============9005141872104716142==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/atomic: WARN about missing acquire_ctx in drm_atomic_get_private_obj_state()
URL   : https://patchwork.freedesktop.org/series/156142/
State : success

== Summary ==

CI Bug Log - changes from xe-3941-b5e5976a35cb0e8e45aea836b42ecccf22df803f_BAT -> xe-pw-156142v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3941-b5e5976a35cb0e8e45aea836b42ecccf22df803f -> xe-pw-156142v1

  IGT_8592: b3d809d537febc23792ab8d0eb6d13cf80d626c8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3941-b5e5976a35cb0e8e45aea836b42ecccf22df803f: b5e5976a35cb0e8e45aea836b42ecccf22df803f
  xe-pw-156142v1: 156142v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156142v1/index.html

--===============9005141872104716142==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/atomic: WARN about missing acquire_ctx in drm_atomic_get_private_obj_state()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156142/">https://patchwork.freedesktop.org/series/156142/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156142v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156142v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3941-b5e5976a35cb0e8e45aea836b42ecccf22df803f_BAT -&gt; xe-pw-156142v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3941-b5e5976a35cb0e8e45aea836b42ecccf22df803f -&gt; xe-pw-156142v1</li>
</ul>
<p>IGT_8592: b3d809d537febc23792ab8d0eb6d13cf80d626c8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3941-b5e5976a35cb0e8e45aea836b42ecccf22df803f: b5e5976a35cb0e8e45aea836b42ecccf22df803f<br />
  xe-pw-156142v1: 156142v1</p>

</body>
</html>

--===============9005141872104716142==--

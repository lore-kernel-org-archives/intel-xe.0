Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42FA4D5B862
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 18:20:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C754710E4B0;
	Mon, 15 Dec 2025 18:20:07 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C2410E25D;
 Mon, 15 Dec 2025 18:20:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0839140077264524804=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/=7Bi915=2C_xe=7D=3A_cle?=
 =?utf-8?q?an_up_and_deduplicate_initial_plane_handling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Dec 2025 18:20:07 -0000
Message-ID: <176582280728.90193.8355904636916896940@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1765812266.git.jani.nikula@intel.com>
In-Reply-To: <cover.1765812266.git.jani.nikula@intel.com>
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

--===============0839140077264524804==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/{i915, xe}: clean up and deduplicate initial plane handling
URL   : https://patchwork.freedesktop.org/series/159031/
State : success

== Summary ==

CI Bug Log - changes from xe-4245-53c678ed7aabc9f56529f8f15dde305ba7ac36ba_BAT -> xe-pw-159031v1_BAT
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

  * Linux: xe-4245-53c678ed7aabc9f56529f8f15dde305ba7ac36ba -> xe-pw-159031v1

  IGT_8666: 8666
  xe-4245-53c678ed7aabc9f56529f8f15dde305ba7ac36ba: 53c678ed7aabc9f56529f8f15dde305ba7ac36ba
  xe-pw-159031v1: 159031v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159031v1/index.html

--===============0839140077264524804==
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
<tr><td><b>Series:</b></td><td>drm/{i915, xe}: clean up and deduplicate initial plane handling</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159031/">https://patchwork.freedesktop.org/series/159031/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159031v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159031v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4245-53c678ed7aabc9f56529f8f15dde305ba7ac36ba_BAT -&gt; xe-pw-159031v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4245-53c678ed7aabc9f56529f8f15dde305ba7ac36ba -&gt; xe-pw-159031v1</li>
</ul>
<p>IGT_8666: 8666<br />
  xe-4245-53c678ed7aabc9f56529f8f15dde305ba7ac36ba: 53c678ed7aabc9f56529f8f15dde305ba7ac36ba<br />
  xe-pw-159031v1: 159031v1</p>

</body>
</html>

--===============0839140077264524804==--

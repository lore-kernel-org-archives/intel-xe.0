Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBD4E77197
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jan 2025 11:57:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2602910E4C1;
	Tue,  7 Jan 2025 11:57:02 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C1B10EABB;
 Tue,  7 Jan 2025 11:57:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5941367174737994641=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/dp=3A_128b/132b_un?=
 =?utf-8?q?compressed_SST_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 07 Jan 2025 11:57:00 -0000
Message-ID: <173625102039.828293.15542282739530776683@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1735912293.git.jani.nikula@intel.com>
In-Reply-To: <cover.1735912293.git.jani.nikula@intel.com>
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

--===============5941367174737994641==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: 128b/132b uncompressed SST (rev5)
URL   : https://patchwork.freedesktop.org/series/142548/
State : success

== Summary ==

CI Bug Log - changes from xe-2446-a39a4fbf8a995eaff7494102f992bec5284fae84_BAT -> xe-pw-142548v5_BAT
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

  * Linux: xe-2446-a39a4fbf8a995eaff7494102f992bec5284fae84 -> xe-pw-142548v5

  IGT_8178: 1b3fe31e392c9b5b0a4aeaa1a3c92fb340c0ed9a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2446-a39a4fbf8a995eaff7494102f992bec5284fae84: a39a4fbf8a995eaff7494102f992bec5284fae84
  xe-pw-142548v5: 142548v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142548v5/index.html

--===============5941367174737994641==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: 128b/132b uncompressed SST (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142548/">https://patchwork.freedesktop.org/series/142548/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142548v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142548v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2446-a39a4fbf8a995eaff7494102f992bec5284fae84_BAT -&gt; xe-pw-142548v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2446-a39a4fbf8a995eaff7494102f992bec5284fae84 -&gt; xe-pw-142548v5</li>
</ul>
<p>IGT_8178: 1b3fe31e392c9b5b0a4aeaa1a3c92fb340c0ed9a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2446-a39a4fbf8a995eaff7494102f992bec5284fae84: a39a4fbf8a995eaff7494102f992bec5284fae84<br />
  xe-pw-142548v5: 142548v5</p>

</body>
</html>

--===============5941367174737994641==--

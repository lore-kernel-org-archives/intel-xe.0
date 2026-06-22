Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E993ECDB46F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 14:22:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9758010E263;
	Mon, 22 Jun 2026 14:22:29 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB8810E263;
 Mon, 22 Jun 2026 14:22:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4547410548915146593=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/vm=3A_Fix_BO_prefetc?=
 =?utf-8?q?h_with_CONSULT=5FMEM=5FADVISE=5FPREF=5FLOC?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 22 Jun 2026 14:22:28 -0000
Message-ID: <178213814823.101529.8326782555010191334@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260622082445.1720007-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260622082445.1720007-2-himal.prasad.ghimiray@intel.com>
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

--===============4547410548915146593==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vm: Fix BO prefetch with CONSULT_MEM_ADVISE_PREF_LOC
URL   : https://patchwork.freedesktop.org/series/168913/
State : success

== Summary ==

CI Bug Log - changes from xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294_BAT -> xe-pw-168913v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 11)
------------------------------

  Missing    (2): bat-bmg-vm bat-ptl-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294 -> xe-pw-168913v1

  IGT_8976: 8976
  xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294: 55ba13f332ab983d0c3ce0c448d46af3da717294
  xe-pw-168913v1: 168913v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/index.html

--===============4547410548915146593==
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
<tr><td><b>Series:</b></td><td>drm/xe/vm: Fix BO prefetch with CONSULT_MEM_ADVISE_PREF_LOC</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168913/">https://patchwork.freedesktop.org/series/168913/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294_BAT -&gt; xe-pw-168913v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 11)</h2>
<p>Missing    (2): bat-bmg-vm bat-ptl-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294 -&gt; xe-pw-168913v1</li>
</ul>
<p>IGT_8976: 8976<br />
  xe-5285-55ba13f332ab983d0c3ce0c448d46af3da717294: 55ba13f332ab983d0c3ce0c448d46af3da717294<br />
  xe-pw-168913v1: 168913v1</p>

</body>
</html>

--===============4547410548915146593==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCBACA9ED0
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 00:40:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E531110E6D4;
	Tue, 13 Oct 2026 00:40:17 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4F110E6D4;
 Tue, 13 Oct 2026 00:40:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7745786925152596721=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm=3A_add_a_self-import_PR?=
 =?utf-8?q?IME_dma-buf_helper_and_use_it_in_Xe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Oct 2026 00:40:16 -0000
Message-ID: <179185201668.14697.708082995026191304@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261012180543.1488703-4-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20261012180543.1488703-4-niranjana.vishwanathapura@intel.com>
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

--===============7745786925152596721==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm: add a self-import PRIME dma-buf helper and use it in Xe
URL   : https://patchwork.freedesktop.org/series/175977/
State : success

== Summary ==

CI Bug Log - changes from xe-5934-dcbee9cfcd4097656a88dbaf196fbc5403764a58_BAT -> xe-pw-175977v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 14)
------------------------------

  Missing    (1): bat-bmg-3 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5934-dcbee9cfcd4097656a88dbaf196fbc5403764a58 -> xe-pw-175977v1

  IGT_9140: 3b0daa274edb520204660fa1e15424b66ce0aea0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5934-dcbee9cfcd4097656a88dbaf196fbc5403764a58: dcbee9cfcd4097656a88dbaf196fbc5403764a58
  xe-pw-175977v1: 175977v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175977v1/index.html

--===============7745786925152596721==
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
<tr><td><b>Series:</b></td><td>drm: add a self-import PRIME dma-buf helper and use it in Xe</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175977/">https://patchwork.freedesktop.org/series/175977/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175977v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175977v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5934-dcbee9cfcd4097656a88dbaf196fbc5403764a58_BAT -&gt; xe-pw-175977v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 14)</h2>
<p>Missing    (1): bat-bmg-3 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5934-dcbee9cfcd4097656a88dbaf196fbc5403764a58 -&gt; xe-pw-175977v1</li>
</ul>
<p>IGT_9140: 3b0daa274edb520204660fa1e15424b66ce0aea0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5934-dcbee9cfcd4097656a88dbaf196fbc5403764a58: dcbee9cfcd4097656a88dbaf196fbc5403764a58<br />
  xe-pw-175977v1: 175977v1</p>

</body>
</html>

--===============7745786925152596721==--

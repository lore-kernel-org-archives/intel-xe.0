Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE994CD98D2
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 18:23:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8034910EAFD;
	Fri, 12 Jun 2026 18:23:07 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34AF10EAFD;
 Fri, 12 Jun 2026 18:23:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8562026571291488733=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/display=3A_skip_FORC?=
 =?utf-8?q?E=5FWC_and_vm=5Fbound_check_for_external_dma-bufs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Jun 2026 18:23:05 -0000
Message-ID: <178128858579.75133.1008185583952384165@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260612170501.550816-2-matthew.auld@intel.com>
In-Reply-To: <20260612170501.550816-2-matthew.auld@intel.com>
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

--===============8562026571291488733==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: skip FORCE_WC and vm_bound check for external dma-bufs
URL   : https://patchwork.freedesktop.org/series/168451/
State : success

== Summary ==

CI Bug Log - changes from xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d_BAT -> xe-pw-168451v1_BAT
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

  * IGT: IGT_8961 -> IGT_8962
  * Linux: xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d -> xe-pw-168451v1

  IGT_8961: 8961
  IGT_8962: 8962
  xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d: 536f4e1338749a805ec4a7b82b1444dae2c6fe4d
  xe-pw-168451v1: 168451v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/index.html

--===============8562026571291488733==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: skip FORCE_WC and vm_bound check for external dma-bufs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168451/">https://patchwork.freedesktop.org/series/168451/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d_BAT -&gt; xe-pw-168451v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8961 -&gt; IGT_8962</li>
<li>Linux: xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d -&gt; xe-pw-168451v1</li>
</ul>
<p>IGT_8961: 8961<br />
  IGT_8962: 8962<br />
  xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d: 536f4e1338749a805ec4a7b82b1444dae2c6fe4d<br />
  xe-pw-168451v1: 168451v1</p>

</body>
</html>

--===============8562026571291488733==--

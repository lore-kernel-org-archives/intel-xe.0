Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9365CCCD184
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 13:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5840610E5EC;
	Tue, 21 Oct 2025 13:44:07 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0BF010E5EC;
 Tue, 21 Oct 2025 13:44:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6679762626514815846=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Add_kunit_checks_?=
 =?utf-8?q?for_dma=5Fmask=5Fsize=2C_va=5Fbits_and_vm=5Fmax=5Flevel_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 Oct 2025 13:44:05 -0000
Message-ID: <176105424571.36825.10462774171907543943@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251020-xe-kunit-dma_mask_size-va_bits-vm_max_level-v2-0-27b03971bc7e@intel.com>
In-Reply-To: <20251020-xe-kunit-dma_mask_size-va_bits-vm_max_level-v2-0-27b03971bc7e@intel.com>
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

--===============6679762626514815846==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add kunit checks for dma_mask_size, va_bits and vm_max_level (rev2)
URL   : https://patchwork.freedesktop.org/series/156076/
State : success

== Summary ==

CI Bug Log - changes from xe-3953-e62416a96d242b227b300fac5950144ee13b0d2e_BAT -> xe-pw-156076v2_BAT
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

  * Linux: xe-3953-e62416a96d242b227b300fac5950144ee13b0d2e -> xe-pw-156076v2

  IGT_8594: 8594
  xe-3953-e62416a96d242b227b300fac5950144ee13b0d2e: e62416a96d242b227b300fac5950144ee13b0d2e
  xe-pw-156076v2: 156076v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156076v2/index.html

--===============6679762626514815846==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add kunit checks for dma_mask_size, va_bits and vm_max_level (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156076/">https://patchwork.freedesktop.org/series/156076/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156076v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156076v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3953-e62416a96d242b227b300fac5950144ee13b0d2e_BAT -&gt; xe-pw-156076v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3953-e62416a96d242b227b300fac5950144ee13b0d2e -&gt; xe-pw-156076v2</li>
</ul>
<p>IGT_8594: 8594<br />
  xe-3953-e62416a96d242b227b300fac5950144ee13b0d2e: e62416a96d242b227b300fac5950144ee13b0d2e<br />
  xe-pw-156076v2: 156076v2</p>

</body>
</html>

--===============6679762626514815846==--

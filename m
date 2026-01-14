Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D287D31A09
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 03:45:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36DEB10E002;
	Wed, 14 Jan 2026 03:45:45 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E4910E002;
 Wed, 14 Jan 2026 03:45:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4240003702956438092=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/bios=3A_Use_get=5F?=
 =?utf-8?q?unaligned=5F*_for_VBT_block_size_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kaushlendra Kumar" <kaushlendra.kumar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 Jan 2026 03:45:44 -0000
Message-ID: <176836234408.152799.218208325068819234@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260114030145.3039094-1-kaushlendra.kumar@intel.com>
In-Reply-To: <20260114030145.3039094-1-kaushlendra.kumar@intel.com>
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

--===============4240003702956438092==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/bios: Use get_unaligned_* for VBT block size (rev3)
URL   : https://patchwork.freedesktop.org/series/159994/
State : success

== Summary ==

CI Bug Log - changes from xe-4380-1580579412915ac76344699e53124b580060302d_BAT -> xe-pw-159994v3_BAT
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

  * Linux: xe-4380-1580579412915ac76344699e53124b580060302d -> xe-pw-159994v3

  IGT_8699: 0b67ab25f2eb58b296872c8c34474b79353727d5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4380-1580579412915ac76344699e53124b580060302d: 1580579412915ac76344699e53124b580060302d
  xe-pw-159994v3: 159994v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159994v3/index.html

--===============4240003702956438092==
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
<tr><td><b>Series:</b></td><td>drm/i915/bios: Use get_unaligned_* for VBT block size (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159994/">https://patchwork.freedesktop.org/series/159994/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159994v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159994v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4380-1580579412915ac76344699e53124b580060302d_BAT -&gt; xe-pw-159994v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4380-1580579412915ac76344699e53124b580060302d -&gt; xe-pw-159994v3</li>
</ul>
<p>IGT_8699: 0b67ab25f2eb58b296872c8c34474b79353727d5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4380-1580579412915ac76344699e53124b580060302d: 1580579412915ac76344699e53124b580060302d<br />
  xe-pw-159994v3: 159994v3</p>

</body>
</html>

--===============4240003702956438092==--

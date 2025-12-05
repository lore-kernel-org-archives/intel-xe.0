Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C187CD339B2
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 18:29:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C1610EB9C;
	Fri,  5 Dec 2025 18:29:30 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8A710EB9C;
 Fri,  5 Dec 2025 18:29:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6845685270354519738=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/cx0=3A_Convert_C10?=
 =?utf-8?q?_PHY_PLL_SSC_state_mismatch_WARN_to_a_debug_message?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Dec 2025 18:29:28 -0000
Message-ID: <176495936875.62145.16298266759802665089@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251205122902.1724498-1-imre.deak@intel.com>
In-Reply-To: <20251205122902.1724498-1-imre.deak@intel.com>
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

--===============6845685270354519738==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/cx0: Convert C10 PHY PLL SSC state mismatch WARN to a debug message
URL   : https://patchwork.freedesktop.org/series/158574/
State : success

== Summary ==

CI Bug Log - changes from xe-4201-a36e2c7fed2132052900236e8c7aa563d339baaf_BAT -> xe-pw-158574v1_BAT
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

  * Linux: xe-4201-a36e2c7fed2132052900236e8c7aa563d339baaf -> xe-pw-158574v1

  IGT_8656: 1fa8aeb0848614e6204602c5fe2949e049f087c9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4201-a36e2c7fed2132052900236e8c7aa563d339baaf: a36e2c7fed2132052900236e8c7aa563d339baaf
  xe-pw-158574v1: 158574v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158574v1/index.html

--===============6845685270354519738==
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
<tr><td><b>Series:</b></td><td>drm/i915/cx0: Convert C10 PHY PLL SSC state mismatch WARN to a debug message</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158574/">https://patchwork.freedesktop.org/series/158574/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158574v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158574v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4201-a36e2c7fed2132052900236e8c7aa563d339baaf_BAT -&gt; xe-pw-158574v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4201-a36e2c7fed2132052900236e8c7aa563d339baaf -&gt; xe-pw-158574v1</li>
</ul>
<p>IGT_8656: 1fa8aeb0848614e6204602c5fe2949e049f087c9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4201-a36e2c7fed2132052900236e8c7aa563d339baaf: a36e2c7fed2132052900236e8c7aa563d339baaf<br />
  xe-pw-158574v1: 158574v1</p>

</body>
</html>

--===============6845685270354519738==--

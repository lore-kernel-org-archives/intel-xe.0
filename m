Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742FFD111A8
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 21:47:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3227D10E853;
	Thu, 27 Nov 2025 21:47:51 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B3410E853;
 Thu, 27 Nov 2025 21:47:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3861252000891922071=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/dp=3A_Clean_up_lin?=
 =?utf-8?q?k_BW/DSC_slice_config_computation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Nov 2025 21:47:49 -0000
Message-ID: <176428006945.36752.17188324463559604771@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251127175023.1522538-1-imre.deak@intel.com>
In-Reply-To: <20251127175023.1522538-1-imre.deak@intel.com>
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

--===============3861252000891922071==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: Clean up link BW/DSC slice config computation
URL   : https://patchwork.freedesktop.org/series/158181/
State : success

== Summary ==

CI Bug Log - changes from xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916_BAT -> xe-pw-158181v1_BAT
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

  * Linux: xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916 -> xe-pw-158181v1

  IGT_8642: fa854cbfe25f3d64ad02bfd3f7804b5d7ccda71d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916: d858d76d3596e85f00b062a894e38e7fda3d9916
  xe-pw-158181v1: 158181v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158181v1/index.html

--===============3861252000891922071==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: Clean up link BW/DSC slice config computation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158181/">https://patchwork.freedesktop.org/series/158181/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158181v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158181v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916_BAT -&gt; xe-pw-158181v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916 -&gt; xe-pw-158181v1</li>
</ul>
<p>IGT_8642: fa854cbfe25f3d64ad02bfd3f7804b5d7ccda71d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4158-d858d76d3596e85f00b062a894e38e7fda3d9916: d858d76d3596e85f00b062a894e38e7fda3d9916<br />
  xe-pw-158181v1: 158181v1</p>

</body>
</html>

--===============3861252000891922071==--

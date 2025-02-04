Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D63C02194
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 21:00:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F7E10E03B;
	Tue,  4 Feb 2025 21:00:04 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E93510E03B;
 Tue,  4 Feb 2025 21:00:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4573460234758045644=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/mst=3A_fix_INT=5FM?=
 =?utf-8?q?AX_to_=2E4_fixed_point_conversion_mistake?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Feb 2025 21:00:03 -0000
Message-ID: <173870280337.1063955.3538558341566036099@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250204153717.2996923-1-jani.nikula@intel.com>
In-Reply-To: <20250204153717.2996923-1-jani.nikula@intel.com>
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

--===============4573460234758045644==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/mst: fix INT_MAX to .4 fixed point conversion mistake
URL   : https://patchwork.freedesktop.org/series/144325/
State : success

== Summary ==

CI Bug Log - changes from xe-2595-ac87843456aa558a665df43aa62c03eaf7701bcb_BAT -> xe-pw-144325v1_BAT
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

  * Linux: xe-2595-ac87843456aa558a665df43aa62c03eaf7701bcb -> xe-pw-144325v1

  IGT_8223: ccfe042787b082c06402ff9af257f8338b8edd5e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2595-ac87843456aa558a665df43aa62c03eaf7701bcb: ac87843456aa558a665df43aa62c03eaf7701bcb
  xe-pw-144325v1: 144325v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144325v1/index.html

--===============4573460234758045644==
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
<tr><td><b>Series:</b></td><td>drm/i915/mst: fix INT_MAX to .4 fixed point conversion mistake</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144325/">https://patchwork.freedesktop.org/series/144325/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144325v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144325v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2595-ac87843456aa558a665df43aa62c03eaf7701bcb_BAT -&gt; xe-pw-144325v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2595-ac87843456aa558a665df43aa62c03eaf7701bcb -&gt; xe-pw-144325v1</li>
</ul>
<p>IGT_8223: ccfe042787b082c06402ff9af257f8338b8edd5e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2595-ac87843456aa558a665df43aa62c03eaf7701bcb: ac87843456aa558a665df43aa62c03eaf7701bcb<br />
  xe-pw-144325v1: 144325v1</p>

</body>
</html>

--===============4573460234758045644==--

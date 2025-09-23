Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBD8CAC5AA
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 01:57:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06FB410E51D;
	Tue, 23 Sep 2025 01:57:56 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0403110E51D;
 Tue, 23 Sep 2025 01:57:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7530360286340331480=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/xe/configfs=3A_Correct?=
 =?utf-8?q?_mask_and_pattern_check_in_lookup=5Fengine=5Finfo_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Sep 2025 01:57:55 -0000
Message-ID: <175859267500.355661.1589438718201895086@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250922185728.73828-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250922185728.73828-1-jonathan.cavitt@intel.com>
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

--===============7530360286340331480==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/configfs: Correct mask and pattern check in lookup_engine_info (rev2)
URL   : https://patchwork.freedesktop.org/series/154852/
State : success

== Summary ==

CI Bug Log - changes from xe-3813-3ff214d6c6a86025aa3feadcb5bba4abfc2dd8f1_FULL -> xe-pw-154852v2_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8547 -> IGT_8548
  * Linux: xe-3813-3ff214d6c6a86025aa3feadcb5bba4abfc2dd8f1 -> xe-pw-154852v2

  IGT_8547: 8547
  IGT_8548: 8548
  xe-3813-3ff214d6c6a86025aa3feadcb5bba4abfc2dd8f1: 3ff214d6c6a86025aa3feadcb5bba4abfc2dd8f1
  xe-pw-154852v2: 154852v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154852v2/index.html

--===============7530360286340331480==
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
<tr><td><b>Series:</b></td><td>drm/xe/configfs: Correct mask and pattern check in lookup_engine_info (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154852/">https://patchwork.freedesktop.org/series/154852/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154852v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154852v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3813-3ff214d6c6a86025aa3feadcb5bba4abfc2dd8f1_FULL -&gt; xe-pw-154852v2_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8547 -&gt; IGT_8548</li>
<li>Linux: xe-3813-3ff214d6c6a86025aa3feadcb5bba4abfc2dd8f1 -&gt; xe-pw-154852v2</li>
</ul>
<p>IGT_8547: 8547<br />
  IGT_8548: 8548<br />
  xe-3813-3ff214d6c6a86025aa3feadcb5bba4abfc2dd8f1: 3ff214d6c6a86025aa3feadcb5bba4abfc2dd8f1<br />
  xe-pw-154852v2: 154852v2</p>

</body>
</html>

--===============7530360286340331480==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C78C3ABAC
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 08:37:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99FD310E1E1;
	Tue,  6 May 2025 08:37:10 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D5910E1E1;
 Tue,  6 May 2025 08:37:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6044734236240549377=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/dp=5Fmst=3A_Add_su?=
 =?utf-8?q?pport_for_fractional_link_bpps_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 May 2025 08:37:09 -0000
Message-ID: <174652062919.50407.6503649469639660245@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250428133135.3396080-1-imre.deak@intel.com>
In-Reply-To: <20250428133135.3396080-1-imre.deak@intel.com>
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

--===============6044734236240549377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp_mst: Add support for fractional link bpps (rev2)
URL   : https://patchwork.freedesktop.org/series/147434/
State : success

== Summary ==

CI Bug Log - changes from xe-3001-4dfede9f7f69716060d29d84a1267f893da9dbee_BAT -> xe-pw-147434v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-147434v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:
    - bat-lnl-2:          [PASS][1] -> [ABORT][2] ([Intel XE#4830] / [Intel XE#4899])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3001-4dfede9f7f69716060d29d84a1267f893da9dbee/bat-lnl-2/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147434v2/bat-lnl-2/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html

  
  [Intel XE#4830]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4830
  [Intel XE#4899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4899


Build changes
-------------

  * IGT: IGT_8340 -> IGT_8341
  * Linux: xe-3001-4dfede9f7f69716060d29d84a1267f893da9dbee -> xe-pw-147434v2

  IGT_8340: 9eda33fedff747e846671328a19fa516b5bd7015 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8341: 0e76d82675226a942f4811514c040c07d87d156b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3001-4dfede9f7f69716060d29d84a1267f893da9dbee: 4dfede9f7f69716060d29d84a1267f893da9dbee
  xe-pw-147434v2: 147434v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147434v2/index.html

--===============6044734236240549377==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp_mst: Add support for fractional link bpps (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147434/">https://patchwork.freedesktop.org/series/147434/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147434v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147434v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3001-4dfede9f7f69716060d29d84a1267f893da9dbee_BAT -&gt; xe-pw-147434v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-147434v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3001-4dfede9f7f69716060d29d84a1267f893da9dbee/bat-lnl-2/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147434v2/bat-lnl-2/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4830">Intel XE#4830</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4899">Intel XE#4899</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8340 -&gt; IGT_8341</li>
<li>Linux: xe-3001-4dfede9f7f69716060d29d84a1267f893da9dbee -&gt; xe-pw-147434v2</li>
</ul>
<p>IGT_8340: 9eda33fedff747e846671328a19fa516b5bd7015 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8341: 0e76d82675226a942f4811514c040c07d87d156b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3001-4dfede9f7f69716060d29d84a1267f893da9dbee: 4dfede9f7f69716060d29d84a1267f893da9dbee<br />
  xe-pw-147434v2: 147434v2</p>

</body>
</html>

--===============6044734236240549377==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8216C7EE30
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 11:11:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C5E10E287;
	Tue,  1 Jul 2025 11:11:06 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6B510E287;
 Tue,  1 Jul 2025 11:11:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8086006884480791067=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm=3A_Eliminate_redundant_?=
 =?utf-8?q?drm=5Fformat=5Finfo_lookups_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Jul 2025 11:11:05 -0000
Message-ID: <175136826510.123583.14756767474077252538@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
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

--===============8086006884480791067==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm: Eliminate redundant drm_format_info lookups (rev7)
URL   : https://patchwork.freedesktop.org/series/147542/
State : success

== Summary ==

CI Bug Log - changes from xe-3328-9f3690735949ad5f24ece89cf2e91c2750ea580f_BAT -> xe-pw-147542v7_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-147542v7_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:
    - bat-lnl-2:          [PASS][1] -> [ABORT][2] ([Intel XE#4624] / [Intel XE#4966])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3328-9f3690735949ad5f24ece89cf2e91c2750ea580f/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147542v7/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html

  
  [Intel XE#4624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624
  [Intel XE#4966]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4966


Build changes
-------------

  * Linux: xe-3328-9f3690735949ad5f24ece89cf2e91c2750ea580f -> xe-pw-147542v7

  IGT_8432: 4871829d8b7117553eb2dc1bdb9a0d18de428a98 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3328-9f3690735949ad5f24ece89cf2e91c2750ea580f: 9f3690735949ad5f24ece89cf2e91c2750ea580f
  xe-pw-147542v7: 147542v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147542v7/index.html

--===============8086006884480791067==
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
<tr><td><b>Series:</b></td><td>drm: Eliminate redundant drm_format_info lookups (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147542/">https://patchwork.freedesktop.org/series/147542/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147542v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147542v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3328-9f3690735949ad5f24ece89cf2e91c2750ea580f_BAT -&gt; xe-pw-147542v7_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-147542v7_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3328-9f3690735949ad5f24ece89cf2e91c2750ea580f/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147542v7/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624">Intel XE#4624</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4966">Intel XE#4966</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3328-9f3690735949ad5f24ece89cf2e91c2750ea580f -&gt; xe-pw-147542v7</li>
</ul>
<p>IGT_8432: 4871829d8b7117553eb2dc1bdb9a0d18de428a98 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3328-9f3690735949ad5f24ece89cf2e91c2750ea580f: 9f3690735949ad5f24ece89cf2e91c2750ea580f<br />
  xe-pw-147542v7: 147542v7</p>

</body>
</html>

--===============8086006884480791067==--

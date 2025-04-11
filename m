Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A075C36010
	for <intel-xe@archiver.kernel.org>; Fri, 11 Apr 2025 05:35:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1252010EACE;
	Fri, 11 Apr 2025 05:35:06 +0000 (UTC)
Received: from 32c37dd7f93d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A259C10E221;
 Fri, 11 Apr 2025 05:35:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3971804825768716667=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Modify_drm_helpers_to_use_l?=
 =?utf-8?q?uminance?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 11 Apr 2025 05:35:05 -0000
Message-ID: <174434970565.2979.786119170015968890@32c37dd7f93d>
X-Patchwork-Hint: ignore
References: <20250411042909.2626807-1-suraj.kandpal@intel.com>
In-Reply-To: <20250411042909.2626807-1-suraj.kandpal@intel.com>
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

--===============3971804825768716667==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Modify drm helpers to use luminance
URL   : https://patchwork.freedesktop.org/series/147565/
State : success

== Summary ==

CI Bug Log - changes from xe-2935-9337ad48531f5eff1b8eff235f667db490ac8c91_BAT -> xe-pw-147565v1_BAT
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

  Here are the changes found in xe-pw-147565v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][1] -> [ABORT][2] ([Intel XE#4610])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2935-9337ad48531f5eff1b8eff235f667db490ac8c91/bat-dg2-oem2/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v1/bat-dg2-oem2/igt@xe_module_load@load.html

  
  [Intel XE#4610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4610


Build changes
-------------

  * Linux: xe-2935-9337ad48531f5eff1b8eff235f667db490ac8c91 -> xe-pw-147565v1

  IGT_8315: c85ef0df47b498f999b43dad6a5cc509228f953a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2935-9337ad48531f5eff1b8eff235f667db490ac8c91: 9337ad48531f5eff1b8eff235f667db490ac8c91
  xe-pw-147565v1: 147565v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v1/index.html

--===============3971804825768716667==
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
<tr><td><b>Series:</b></td><td>Modify drm helpers to use luminance</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147565/">https://patchwork.freedesktop.org/series/147565/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2935-9337ad48531f5eff1b8eff235f667db490ac8c91_BAT -&gt; xe-pw-147565v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-147565v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2935-9337ad48531f5eff1b8eff235f667db490ac8c91/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v1/bat-dg2-oem2/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4610">Intel XE#4610</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2935-9337ad48531f5eff1b8eff235f667db490ac8c91 -&gt; xe-pw-147565v1</li>
</ul>
<p>IGT_8315: c85ef0df47b498f999b43dad6a5cc509228f953a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2935-9337ad48531f5eff1b8eff235f667db490ac8c91: 9337ad48531f5eff1b8eff235f667db490ac8c91<br />
  xe-pw-147565v1: 147565v1</p>

</body>
</html>

--===============3971804825768716667==--

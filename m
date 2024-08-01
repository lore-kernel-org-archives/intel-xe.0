Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF7CC3DA64
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 10:21:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 410C410E8EC;
	Thu,  1 Aug 2024 10:21:16 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F9310E8EC;
 Thu,  1 Aug 2024 10:21:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5106275863258896939=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/xe=5Fgt=5Fidle=3A_add_deb?=
 =?utf-8?q?ugfs_entry_for_powergating_info_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 01 Aug 2024 10:21:14 -0000
Message-ID: <172250767498.487126.2568642664439843430@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240801095305.1209046-1-riana.tauro@intel.com>
In-Reply-To: <20240801095305.1209046-1-riana.tauro@intel.com>
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

--===============5106275863258896939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_gt_idle: add debugfs entry for powergating info (rev3)
URL   : https://patchwork.freedesktop.org/series/136477/
State : success

== Summary ==

CI Bug Log - changes from xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d_BAT -> xe-pw-136477v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (6 -> 6)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-136477v3_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_compute_mode@twice-basic:
    - bat-bmg-1:          [DMESG-WARN][1] -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/bat-bmg-1/igt@xe_exec_compute_mode@twice-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/bat-bmg-1/igt@xe_exec_compute_mode@twice-basic.html

  


Build changes
-------------

  * Linux: xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d -> xe-pw-136477v3

  IGT_7950: 7950
  xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d: 8019170840644b0c5a5e64fc6d81792dd2105a2d
  xe-pw-136477v3: 136477v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/index.html

--===============5106275863258896939==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_gt_idle: add debugfs entry for powergating info (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136477/">https://patchwork.freedesktop.org/series/136477/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d_BAT -&gt; xe-pw-136477v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (6 -&gt; 6)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136477v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-basic:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/bat-bmg-1/igt@xe_exec_compute_mode@twice-basic.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136477v3/bat-bmg-1/igt@xe_exec_compute_mode@twice-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d -&gt; xe-pw-136477v3</li>
</ul>
<p>IGT_7950: 7950<br />
  xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d: 8019170840644b0c5a5e64fc6d81792dd2105a2d<br />
  xe-pw-136477v3: 136477v3</p>

</body>
</html>

--===============5106275863258896939==--

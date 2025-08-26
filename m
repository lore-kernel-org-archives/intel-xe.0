Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F5CCA0EFA
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 07:25:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B45110E5D7;
	Tue, 26 Aug 2025 07:25:54 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CDD410E5D3;
 Tue, 26 Aug 2025 07:25:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6579239699741611680=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Handle_Firmware_reported_Ha?=
 =?utf-8?q?rdware_Errors_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 26 Aug 2025 07:25:52 -0000
Message-ID: <175619315230.269761.4430185892265703235@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250826063419.3022216-1-riana.tauro@intel.com>
In-Reply-To: <20250826063419.3022216-1-riana.tauro@intel.com>
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

--===============6579239699741611680==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Handle Firmware reported Hardware Errors (rev9)
URL   : https://patchwork.freedesktop.org/series/149756/
State : success

== Summary ==

CI Bug Log - changes from xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577_BAT -> xe-pw-149756v9_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-149756v9_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_vm@bind-execqueues-independent:
    - {bat-ptl-2}:        [FAIL][1] ([Intel XE#5783]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * IGT: IGT_8507 -> IGT_8508
  * Linux: xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577 -> xe-pw-149756v9

  IGT_8507: 8507
  IGT_8508: 939fac7f7b11a8902ebcf9a4bc9c26c14e87e8a6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577: 74c8b78443fb1a201ee11160087f9e71ce959577
  xe-pw-149756v9: 149756v9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/index.html

--===============6579239699741611680==
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
<tr><td><b>Series:</b></td><td>Handle Firmware reported Hardware Errors (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149756/">https://patchwork.freedesktop.org/series/149756/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577_BAT -&gt; xe-pw-149756v9_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-149756v9_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_vm@bind-execqueues-independent:<ul>
<li>{bat-ptl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783">Intel XE#5783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8507 -&gt; IGT_8508</li>
<li>Linux: xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577 -&gt; xe-pw-149756v9</li>
</ul>
<p>IGT_8507: 8507<br />
  IGT_8508: 939fac7f7b11a8902ebcf9a4bc9c26c14e87e8a6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577: 74c8b78443fb1a201ee11160087f9e71ce959577<br />
  xe-pw-149756v9: 149756v9</p>

</body>
</html>

--===============6579239699741611680==--

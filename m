Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21D8CA5FD4
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 16:26:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6400410E3C5;
	Thu,  1 Oct 2026 16:26:04 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1DA10E3C5;
 Thu,  1 Oct 2026 16:26:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6447759386724871605=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/i2c=3A_Expose_AMC_Al?=
 =?utf-8?q?ert_reason_sysfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 01 Oct 2026 16:26:03 -0000
Message-ID: <179087196322.230117.3314290534253788142@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261001121302.4102629-2-badal.nilawar@intel.com>
In-Reply-To: <20261001121302.4102629-2-badal.nilawar@intel.com>
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

--===============6447759386724871605==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/i2c: Expose AMC Alert reason sysfs
URL   : https://patchwork.freedesktop.org/series/175359/
State : success

== Summary ==

CI Bug Log - changes from xe-5864-51138a2c4ef84875e3d265c02cf7ebc28de216fc_BAT -> xe-pw-175359v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-175359v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] ([Intel XE#9463])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5864-51138a2c4ef84875e3d265c02cf7ebc28de216fc/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175359v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463


Build changes
-------------

  * IGT: IGT_9120 -> IGT_9121
  * Linux: xe-5864-51138a2c4ef84875e3d265c02cf7ebc28de216fc -> xe-pw-175359v1

  IGT_9120: c6b08ed60430a3081e5173fbdfbea22d19f22aa4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9121: 5b6d384b7771ca7719178cd70ba4acec28712dbf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5864-51138a2c4ef84875e3d265c02cf7ebc28de216fc: 51138a2c4ef84875e3d265c02cf7ebc28de216fc
  xe-pw-175359v1: 175359v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175359v1/index.html

--===============6447759386724871605==
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
<tr><td><b>Series:</b></td><td>drm/xe/i2c: Expose AMC Alert reason sysfs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175359/">https://patchwork.freedesktop.org/series/175359/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175359v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175359v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5864-51138a2c4ef84875e3d265c02cf7ebc28de216fc_BAT -&gt; xe-pw-175359v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-175359v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5864-51138a2c4ef84875e3d265c02cf7ebc28de216fc/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175359v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9120 -&gt; IGT_9121</li>
<li>Linux: xe-5864-51138a2c4ef84875e3d265c02cf7ebc28de216fc -&gt; xe-pw-175359v1</li>
</ul>
<p>IGT_9120: c6b08ed60430a3081e5173fbdfbea22d19f22aa4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9121: 5b6d384b7771ca7719178cd70ba4acec28712dbf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5864-51138a2c4ef84875e3d265c02cf7ebc28de216fc: 51138a2c4ef84875e3d265c02cf7ebc28de216fc<br />
  xe-pw-175359v1: 175359v1</p>

</body>
</html>

--===============6447759386724871605==--

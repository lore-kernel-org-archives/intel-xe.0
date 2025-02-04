Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DAEC02197
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 13:30:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA1F10E32F;
	Tue,  4 Feb 2025 13:30:22 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6F210E32F;
 Tue,  4 Feb 2025 13:30:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8095269252387448366=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/pf=3A_Use_an_explici?=
 =?utf-8?q?t_check_to_see_if_the_device_has_LMTT_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Feb 2025 13:30:21 -0000
Message-ID: <173867582164.876953.17263207082533522125@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250204122658.813847-1-piotr.piorkowski@intel.com>
In-Reply-To: <20250204122658.813847-1-piotr.piorkowski@intel.com>
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

--===============8095269252387448366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pf: Use an explicit check to see if the device has LMTT (rev3)
URL   : https://patchwork.freedesktop.org/series/142212/
State : success

== Summary ==

CI Bug Log - changes from xe-2591-d3f7add53c15ed866828937f140ac252c19f2411_BAT -> xe-pw-142212v3_BAT
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

  Here are the changes found in xe-pw-142212v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_vm@large-split-binds-268435456:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3970] / [Intel XE#4078])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2591-d3f7add53c15ed866828937f140ac252c19f2411/bat-adlp-vf/igt@xe_vm@large-split-binds-268435456.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v3/bat-adlp-vf/igt@xe_vm@large-split-binds-268435456.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078


Build changes
-------------

  * IGT: IGT_8222 -> IGT_8223
  * Linux: xe-2591-d3f7add53c15ed866828937f140ac252c19f2411 -> xe-pw-142212v3

  IGT_8222: 1cb35b0ba29858e1fe0f61c0c70164fe858bb271 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8223: ccfe042787b082c06402ff9af257f8338b8edd5e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2591-d3f7add53c15ed866828937f140ac252c19f2411: d3f7add53c15ed866828937f140ac252c19f2411
  xe-pw-142212v3: 142212v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v3/index.html

--===============8095269252387448366==
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
<tr><td><b>Series:</b></td><td>drm/xe/pf: Use an explicit check to see if the device has LMTT (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142212/">https://patchwork.freedesktop.org/series/142212/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2591-d3f7add53c15ed866828937f140ac252c19f2411_BAT -&gt; xe-pw-142212v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142212v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_vm@large-split-binds-268435456:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2591-d3f7add53c15ed866828937f140ac252c19f2411/bat-adlp-vf/igt@xe_vm@large-split-binds-268435456.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142212v3/bat-adlp-vf/igt@xe_vm@large-split-binds-268435456.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078">Intel XE#4078</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8222 -&gt; IGT_8223</li>
<li>Linux: xe-2591-d3f7add53c15ed866828937f140ac252c19f2411 -&gt; xe-pw-142212v3</li>
</ul>
<p>IGT_8222: 1cb35b0ba29858e1fe0f61c0c70164fe858bb271 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8223: ccfe042787b082c06402ff9af257f8338b8edd5e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2591-d3f7add53c15ed866828937f140ac252c19f2411: d3f7add53c15ed866828937f140ac252c19f2411<br />
  xe-pw-142212v3: 142212v3</p>

</body>
</html>

--===============8095269252387448366==--

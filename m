Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552C4C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 15:09:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C3010E94C;
	Fri,  9 Aug 2024 15:09:49 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63FE310E94B;
 Fri,  9 Aug 2024 15:09:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3089581177500128000=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/i915=3A_struct_intel=5Fdispl?=
 =?utf-8?q?ay_conversions_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 09 Aug 2024 15:09:48 -0000
Message-ID: <172321618840.552626.13310871332878148276@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1723213547.git.jani.nikula@intel.com>
In-Reply-To: <cover.1723213547.git.jani.nikula@intel.com>
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

--===============3089581177500128000==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: struct intel_display conversions (rev2)
URL   : https://patchwork.freedesktop.org/series/136757/
State : success

== Summary ==

CI Bug Log - changes from xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1_BAT -> xe-pw-136757v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-136757v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [FAIL][1] ([Intel XE#886]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136757v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * IGT: IGT_7963 -> IGT_7964
  * Linux: xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1 -> xe-pw-136757v2

  IGT_7963: 3f8b9bc4d3f292f788935243bf0a26a4284d8f18 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7964: 0dabf88262c0349d261248638064b97da35369f8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1: 8d0f83b389ec64b9f7f9b2ee241fc352346868f1
  xe-pw-136757v2: 136757v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136757v2/index.html

--===============3089581177500128000==
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
<tr><td><b>Series:</b></td><td>drm/i915: struct intel_display conversions (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136757/">https://patchwork.freedesktop.org/series/136757/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136757v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136757v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1_BAT -&gt; xe-pw-136757v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136757v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136757v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7963 -&gt; IGT_7964</li>
<li>Linux: xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1 -&gt; xe-pw-136757v2</li>
</ul>
<p>IGT_7963: 3f8b9bc4d3f292f788935243bf0a26a4284d8f18 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7964: 0dabf88262c0349d261248638064b97da35369f8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1740-8d0f83b389ec64b9f7f9b2ee241fc352346868f1: 8d0f83b389ec64b9f7f9b2ee241fc352346868f1<br />
  xe-pw-136757v2: 136757v2</p>

</body>
</html>

--===============3089581177500128000==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8703C3DA7F
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 17:32:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907FC10E67B;
	Wed, 31 Jul 2024 17:32:57 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31ABF10E267;
 Wed, 31 Jul 2024 17:32:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0321715337811849526=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/hwmon=3A_Fix_PL1_disable_?=
 =?utf-8?q?flow_in_xe=5Fhwmon=5Fpower=5Fmax=5Fwrite?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 31 Jul 2024 17:32:56 -0000
Message-ID: <172244717619.468827.1262459060931055944@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240731165636.1401533-1-karthik.poosa@intel.com>
In-Reply-To: <20240731165636.1401533-1-karthik.poosa@intel.com>
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

--===============0321715337811849526==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/hwmon: Fix PL1 disable flow in xe_hwmon_power_max_write
URL   : https://patchwork.freedesktop.org/series/136756/
State : success

== Summary ==

CI Bug Log - changes from xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338_BAT -> xe-pw-136756v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7944 -> IGT_7947
  * Linux: xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338 -> xe-pw-136756v1

  IGT_7944: 7944
  IGT_7947: 6b46cef93ce2c2f821bfcaa3c3a111e1cf5c76fc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338: 2a74e6714291a2c9cf26c08f729d5feb203e8338
  xe-pw-136756v1: 136756v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v1/index.html

--===============0321715337811849526==
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
<tr><td><b>Series:</b></td><td>drm/xe/hwmon: Fix PL1 disable flow in xe_hwmon_power_max_write</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136756/">https://patchwork.freedesktop.org/series/136756/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338_BAT -&gt; xe-pw-136756v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7944 -&gt; IGT_7947</li>
<li>Linux: xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338 -&gt; xe-pw-136756v1</li>
</ul>
<p>IGT_7944: 7944<br />
  IGT_7947: 6b46cef93ce2c2f821bfcaa3c3a111e1cf5c76fc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338: 2a74e6714291a2c9cf26c08f729d5feb203e8338<br />
  xe-pw-136756v1: 136756v1</p>

</body>
</html>

--===============0321715337811849526==--

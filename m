Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBE7C52D7C
	for <intel-xe@archiver.kernel.org>; Tue, 13 Aug 2024 04:03:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D3910E216;
	Tue, 13 Aug 2024 04:03:29 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDE110E216;
 Tue, 13 Aug 2024 04:03:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7185876184845249772=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Add_HDMI_PLL_Algorithm_for_SNPS/?=
 =?utf-8?q?C10PHY_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Aug 2024 04:03:27 -0000
Message-ID: <172352180788.596985.8055421321972338458@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240813031941.3553574-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20240813031941.3553574-1-ankit.k.nautiyal@intel.com>
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

--===============7185876184845249772==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add HDMI PLL Algorithm for SNPS/C10PHY (rev3)
URL   : https://patchwork.freedesktop.org/series/135396/
State : success

== Summary ==

CI Bug Log - changes from xe-1756-bb06cec392c188bc980be5cee9a85240ce866b78_BAT -> xe-pw-135396v3_BAT
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

  Here are the changes found in xe-pw-135396v3_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       [SKIP][1] ([i915#5274]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1756-bb06cec392c188bc980be5cee9a85240ce866b78/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v3/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_7966 -> IGT_7967
  * Linux: xe-1756-bb06cec392c188bc980be5cee9a85240ce866b78 -> xe-pw-135396v3

  IGT_7966: f16c5f500adc5fa41bd52a3ef2a84165da4fb596 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7967: 290bdef9033c8b185922f02cd05d62fcc0091c15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1756-bb06cec392c188bc980be5cee9a85240ce866b78: bb06cec392c188bc980be5cee9a85240ce866b78
  xe-pw-135396v3: 135396v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v3/index.html

--===============7185876184845249772==
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
<tr><td><b>Series:</b></td><td>Add HDMI PLL Algorithm for SNPS/C10PHY (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135396/">https://patchwork.freedesktop.org/series/135396/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1756-bb06cec392c188bc980be5cee9a85240ce866b78_BAT -&gt; xe-pw-135396v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135396v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_force_connector_basic@prune-stale-modes:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1756-bb06cec392c188bc980be5cee9a85240ce866b78/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v3/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7966 -&gt; IGT_7967</li>
<li>Linux: xe-1756-bb06cec392c188bc980be5cee9a85240ce866b78 -&gt; xe-pw-135396v3</li>
</ul>
<p>IGT_7966: f16c5f500adc5fa41bd52a3ef2a84165da4fb596 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7967: 290bdef9033c8b185922f02cd05d62fcc0091c15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1756-bb06cec392c188bc980be5cee9a85240ce866b78: bb06cec392c188bc980be5cee9a85240ce866b78<br />
  xe-pw-135396v3: 135396v3</p>

</body>
</html>

--===============7185876184845249772==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC83CD6E7B
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 21:42:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76EA11AB4E;
	Fri,  5 Jun 2026 21:42:53 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D542211AB4E;
 Fri,  5 Jun 2026 21:42:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7125334971542742075=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/nvls=3A_Update_PCI_I?=
 =?utf-8?q?Ds_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Jun 2026 21:42:52 -0000
Message-ID: <178069577286.49962.9456403922319004437@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260521-nvl-s-update-pci-ids-v1-1-ec59e5d6bf12@intel.com>
In-Reply-To: <20260521-nvl-s-update-pci-ids-v1-1-ec59e5d6bf12@intel.com>
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

--===============7125334971542742075==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/nvls: Update PCI IDs (rev3)
URL   : https://patchwork.freedesktop.org/series/167043/
State : success

== Summary ==

CI Bug Log - changes from xe-5213-0ecb0a41cb32dfc7620a903629a6951ef1aaea52_BAT -> xe-pw-167043v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-167043v3_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-ptl-2:          [SKIP][1] -> [PASS][2] +3 other tests pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5213-0ecb0a41cb32dfc7620a903629a6951ef1aaea52/bat-ptl-2/igt@kms_force_connector_basic@prune-stale-modes.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167043v3/bat-ptl-2/igt@kms_force_connector_basic@prune-stale-modes.html

  


Build changes
-------------

  * Linux: xe-5213-0ecb0a41cb32dfc7620a903629a6951ef1aaea52 -> xe-pw-167043v3

  IGT_8950: 8950
  xe-5213-0ecb0a41cb32dfc7620a903629a6951ef1aaea52: 0ecb0a41cb32dfc7620a903629a6951ef1aaea52
  xe-pw-167043v3: 167043v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167043v3/index.html

--===============7125334971542742075==
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
<tr><td><b>Series:</b></td><td>drm/xe/nvls: Update PCI IDs (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167043/">https://patchwork.freedesktop.org/series/167043/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167043v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167043v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5213-0ecb0a41cb32dfc7620a903629a6951ef1aaea52_BAT -&gt; xe-pw-167043v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-167043v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_force_connector_basic@prune-stale-modes:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5213-0ecb0a41cb32dfc7620a903629a6951ef1aaea52/bat-ptl-2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167043v3/bat-ptl-2/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5213-0ecb0a41cb32dfc7620a903629a6951ef1aaea52 -&gt; xe-pw-167043v3</li>
</ul>
<p>IGT_8950: 8950<br />
  xe-5213-0ecb0a41cb32dfc7620a903629a6951ef1aaea52: 0ecb0a41cb32dfc7620a903629a6951ef1aaea52<br />
  xe-pw-167043v3: 167043v3</p>

</body>
</html>

--===============7125334971542742075==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 094D3CE8D6B
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 12:09:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973B710E1C4;
	Mon, 17 Nov 2025 12:09:08 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165F310E1C4;
 Mon, 17 Nov 2025 12:09:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4258016963106680561=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/cx0=3A_Add_MTL+_pl?=
 =?utf-8?q?atforms_to_support_dpll_framework?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 17 Nov 2025 12:09:07 -0000
Message-ID: <176338134708.356.17975846707200633795@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251117104602.2363671-1-mika.kahola@intel.com>
In-Reply-To: <20251117104602.2363671-1-mika.kahola@intel.com>
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

--===============4258016963106680561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/cx0: Add MTL+ platforms to support dpll framework
URL   : https://patchwork.freedesktop.org/series/157658/
State : success

== Summary ==

CI Bug Log - changes from xe-4116-b2e41c70a5eeddce427dc6df02508b6856eb4a11_BAT -> xe-pw-157658v1_BAT
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

  Here are the changes found in xe-pw-157658v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] ([Intel XE#1727] / [Intel XE#4760])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4116-b2e41c70a5eeddce427dc6df02508b6856eb4a11/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157658v1/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@xe_module_load@load:
    - bat-bmg-1:          [PASS][3] -> [ABORT][4] ([Intel XE#4760])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4116-b2e41c70a5eeddce427dc6df02508b6856eb4a11/bat-bmg-1/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157658v1/bat-bmg-1/igt@xe_module_load@load.html

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][5] -> [TIMEOUT][6] ([Intel XE#6506])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4116-b2e41c70a5eeddce427dc6df02508b6856eb4a11/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157658v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506


Build changes
-------------

  * IGT: IGT_8626 -> IGT_8628
  * Linux: xe-4116-b2e41c70a5eeddce427dc6df02508b6856eb4a11 -> xe-pw-157658v1

  IGT_8626: 8626
  IGT_8628: 8628
  xe-4116-b2e41c70a5eeddce427dc6df02508b6856eb4a11: b2e41c70a5eeddce427dc6df02508b6856eb4a11
  xe-pw-157658v1: 157658v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157658v1/index.html

--===============4258016963106680561==
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
<tr><td><b>Series:</b></td><td>drm/i915/cx0: Add MTL+ platforms to support dpll framework</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157658/">https://patchwork.freedesktop.org/series/157658/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157658v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157658v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4116-b2e41c70a5eeddce427dc6df02508b6856eb4a11_BAT -&gt; xe-pw-157658v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-157658v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4116-b2e41c70a5eeddce427dc6df02508b6856eb4a11/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157658v1/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4116-b2e41c70a5eeddce427dc6df02508b6856eb4a11/bat-bmg-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157658v1/bat-bmg-1/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4116-b2e41c70a5eeddce427dc6df02508b6856eb4a11/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157658v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8626 -&gt; IGT_8628</li>
<li>Linux: xe-4116-b2e41c70a5eeddce427dc6df02508b6856eb4a11 -&gt; xe-pw-157658v1</li>
</ul>
<p>IGT_8626: 8626<br />
  IGT_8628: 8628<br />
  xe-4116-b2e41c70a5eeddce427dc6df02508b6856eb4a11: b2e41c70a5eeddce427dc6df02508b6856eb4a11<br />
  xe-pw-157658v1: 157658v1</p>

</body>
</html>

--===============4258016963106680561==--

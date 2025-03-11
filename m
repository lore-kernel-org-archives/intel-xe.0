Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62507C28B2E
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 21:06:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A23810E282;
	Tue, 11 Mar 2025 21:06:21 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9ED310E282;
 Tue, 11 Mar 2025 21:06:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8737660542482708658=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_convers?=
 =?utf-8?q?ions_to_struct_intel=5Fdisplay_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Mar 2025 21:06:19 -0000
Message-ID: <174172717981.21951.18217507562549446471@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <cover.1741715981.git.jani.nikula@intel.com>
In-Reply-To: <cover.1741715981.git.jani.nikula@intel.com>
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

--===============8737660542482708658==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: conversions to struct intel_display (rev2)
URL   : https://patchwork.freedesktop.org/series/144749/
State : success

== Summary ==

CI Bug Log - changes from xe-2795-f8df428b3850ed87a1e2f3b12b6025328d8a6373_BAT -> xe-pw-144749v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-144749v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#4520]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2795-f8df428b3850ed87a1e2f3b12b6025328d8a6373/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144749v2/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][3] -> [ABORT][4] ([Intel XE#4507])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2795-f8df428b3850ed87a1e2f3b12b6025328d8a6373/bat-dg2-oem2/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144749v2/bat-dg2-oem2/igt@xe_module_load@load.html

  
  [Intel XE#4507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4507
  [Intel XE#4520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4520


Build changes
-------------

  * Linux: xe-2795-f8df428b3850ed87a1e2f3b12b6025328d8a6373 -> xe-pw-144749v2

  IGT_8270: 49751c5c11723262ec66e564c76503f74a9fa831 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2795-f8df428b3850ed87a1e2f3b12b6025328d8a6373: f8df428b3850ed87a1e2f3b12b6025328d8a6373
  xe-pw-144749v2: 144749v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144749v2/index.html

--===============8737660542482708658==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: conversions to struct intel_display (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144749/">https://patchwork.freedesktop.org/series/144749/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144749v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144749v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2795-f8df428b3850ed87a1e2f3b12b6025328d8a6373_BAT -&gt; xe-pw-144749v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144749v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2795-f8df428b3850ed87a1e2f3b12b6025328d8a6373/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144749v2/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4520">Intel XE#4520</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2795-f8df428b3850ed87a1e2f3b12b6025328d8a6373/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144749v2/bat-dg2-oem2/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4507">Intel XE#4507</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2795-f8df428b3850ed87a1e2f3b12b6025328d8a6373 -&gt; xe-pw-144749v2</li>
</ul>
<p>IGT_8270: 49751c5c11723262ec66e564c76503f74a9fa831 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2795-f8df428b3850ed87a1e2f3b12b6025328d8a6373: f8df428b3850ed87a1e2f3b12b6025328d8a6373<br />
  xe-pw-144749v2: 144749v2</p>

</body>
</html>

--===============8737660542482708658==--

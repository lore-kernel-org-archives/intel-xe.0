Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC064CAC5B5
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 21:23:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82DB010E9C6;
	Thu, 25 Sep 2025 21:23:52 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B41A10E9C8;
 Thu, 25 Sep 2025 21:23:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2732143553389665171=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Guard_against_NUL?=
 =?utf-8?q?L_return_for_xe=5Fdevice=5Fget=5Fgt?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Sep 2025 21:23:51 -0000
Message-ID: <175883543143.367773.17658024615748937214@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250925204106.67332-2-jonathan.cavitt@intel.com>
In-Reply-To: <20250925204106.67332-2-jonathan.cavitt@intel.com>
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

--===============2732143553389665171==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Guard against NULL return for xe_device_get_gt
URL   : https://patchwork.freedesktop.org/series/155062/
State : success

== Summary ==

CI Bug Log - changes from xe-3830-927b4d44359a2e2b1782f80bb5302950d8a7cb6d_BAT -> xe-pw-155062v1_BAT
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

  Here are the changes found in xe-pw-155062v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-bmg-2:          NOTRUN -> [SKIP][1] ([Intel XE#2229])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155062v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_pat@pat-index-xe2@render:
    - bat-bmg-1:          [PASS][2] -> [FAIL][3] ([Intel XE#5507]) +1 other test fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3830-927b4d44359a2e2b1782f80bb5302950d8a7cb6d/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155062v1/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html

  
#### Warnings ####

  * igt@xe_pat@pat-index-xe2@render:
    - bat-bmg-2:          [ABORT][4] ([Intel XE#3970]) -> [FAIL][5] ([Intel XE#5507]) +1 other test fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3830-927b4d44359a2e2b1782f80bb5302950d8a7cb6d/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155062v1/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html

  
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#5507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507


Build changes
-------------

  * IGT: IGT_8552 -> IGT_8553
  * Linux: xe-3830-927b4d44359a2e2b1782f80bb5302950d8a7cb6d -> xe-pw-155062v1

  IGT_8552: 8552
  IGT_8553: 8553
  xe-3830-927b4d44359a2e2b1782f80bb5302950d8a7cb6d: 927b4d44359a2e2b1782f80bb5302950d8a7cb6d
  xe-pw-155062v1: 155062v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155062v1/index.html

--===============2732143553389665171==
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
<tr><td><b>Series:</b></td><td>drm/xe: Guard against NULL return for xe_device_get_gt</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155062/">https://patchwork.freedesktop.org/series/155062/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155062v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155062v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3830-927b4d44359a2e2b1782f80bb5302950d8a7cb6d_BAT -&gt; xe-pw-155062v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-155062v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155062v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2@render:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3830-927b4d44359a2e2b1782f80bb5302950d8a7cb6d/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155062v1/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507">Intel XE#5507</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_pat@pat-index-xe2@render:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3830-927b4d44359a2e2b1782f80bb5302950d8a7cb6d/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155062v1/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507">Intel XE#5507</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8552 -&gt; IGT_8553</li>
<li>Linux: xe-3830-927b4d44359a2e2b1782f80bb5302950d8a7cb6d -&gt; xe-pw-155062v1</li>
</ul>
<p>IGT_8552: 8552<br />
  IGT_8553: 8553<br />
  xe-3830-927b4d44359a2e2b1782f80bb5302950d8a7cb6d: 927b4d44359a2e2b1782f80bb5302950d8a7cb6d<br />
  xe-pw-155062v1: 155062v1</p>

</body>
</html>

--===============2732143553389665171==--

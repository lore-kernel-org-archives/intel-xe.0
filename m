Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E06D68BCC
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 02:37:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3428F10E0EF;
	Thu, 18 Dec 2025 02:37:45 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93C910E0EF;
 Thu, 18 Dec 2025 02:37:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8868537892167975766=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_drm/xe=3A_Separat?=
 =?utf-8?q?e_out_GuC_RC_code_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Dec 2025 02:37:43 -0000
Message-ID: <176602546395.97606.9365397524798857282@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251218015340.3800280-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20251218015340.3800280-1-vinay.belgaumkar@intel.com>
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

--===============8868537892167975766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: drm/xe: Separate out GuC RC code (rev2)
URL   : https://patchwork.freedesktop.org/series/159128/
State : success

== Summary ==

CI Bug Log - changes from xe-4261-c5b056356f247370c2eba0a9180ea2f8b87061a7_BAT -> xe-pw-159128v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-4261-c5b056356f247370c2eba0a9180ea2f8b87061a7_BAT and xe-pw-159128v2_BAT:

### New IGT tests (1) ###

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - Statuses : 3 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.90] s

  

Known issues
------------

  Here are the changes found in xe-pw-159128v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_module_load@load:
    - bat-bmg-1:          [PASS][1] -> [ABORT][2] ([Intel XE#6887])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4261-c5b056356f247370c2eba0a9180ea2f8b87061a7/bat-bmg-1/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159128v2/bat-bmg-1/igt@xe_module_load@load.html

  
#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [FAIL][3] ([Intel XE#6519]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4261-c5b056356f247370c2eba0a9180ea2f8b87061a7/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159128v2/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519
  [Intel XE#6887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6887


Build changes
-------------

  * Linux: xe-4261-c5b056356f247370c2eba0a9180ea2f8b87061a7 -> xe-pw-159128v2

  IGT_8670: 8670
  xe-4261-c5b056356f247370c2eba0a9180ea2f8b87061a7: c5b056356f247370c2eba0a9180ea2f8b87061a7
  xe-pw-159128v2: 159128v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159128v2/index.html

--===============8868537892167975766==
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
<tr><td><b>Series:</b></td><td>drm/xe: drm/xe: Separate out GuC RC code (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159128/">https://patchwork.freedesktop.org/series/159128/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159128v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159128v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4261-c5b056356f247370c2eba0a9180ea2f8b87061a7_BAT -&gt; xe-pw-159128v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-4261-c5b056356f247370c2eba0a9180ea2f8b87061a7_BAT and xe-pw-159128v2_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@sriov_basic@enable-vfs-autoprobe-on:<ul>
<li>Statuses : 3 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.90] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159128v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4261-c5b056356f247370c2eba0a9180ea2f8b87061a7/bat-bmg-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159128v2/bat-bmg-1/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6887">Intel XE#6887</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4261-c5b056356f247370c2eba0a9180ea2f8b87061a7/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159128v2/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4261-c5b056356f247370c2eba0a9180ea2f8b87061a7 -&gt; xe-pw-159128v2</li>
</ul>
<p>IGT_8670: 8670<br />
  xe-4261-c5b056356f247370c2eba0a9180ea2f8b87061a7: c5b056356f247370c2eba0a9180ea2f8b87061a7<br />
  xe-pw-159128v2: 159128v2</p>

</body>
</html>

--===============8868537892167975766==--

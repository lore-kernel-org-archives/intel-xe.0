Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10998C67861
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 21:36:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA1810E9F2;
	Fri,  5 Apr 2024 21:36:35 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0AE110E9F2;
 Fri,  5 Apr 2024 21:36:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2733958616046174349=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Use_hmm=5Frange=5Ffault_to_popul?=
 =?utf-8?q?ate_user_page?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Apr 2024 21:36:33 -0000
Message-ID: <171235299398.1239316.6339754358387792214@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240405190508.244177-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240405190508.244177-1-himal.prasad.ghimiray@intel.com>
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

--===============2733958616046174349==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Use hmm_range_fault to populate user page
URL   : https://patchwork.freedesktop.org/series/132096/
State : success

== Summary ==

CI Bug Log - changes from xe-1049-11155f150a41d028c6ac7a141924fd4c8798721d_BAT -> xe-pw-132096v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-132096v1_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_exec_threads@threads-basic:
    - {bat-lnl-1}:        [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1049-11155f150a41d028c6ac7a141924fd4c8798721d/bat-lnl-1/igt@xe_exec_threads@threads-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132096v1/bat-lnl-1/igt@xe_exec_threads@threads-basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-132096v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - bat-dg2-oem2:       [PASS][3] -> [INCOMPLETE][4] ([Intel XE#1169] / [Intel XE#1356])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1049-11155f150a41d028c6ac7a141924fd4c8798721d/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132096v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  
#### Possible fixes ####

  * igt@xe_live_ktest@xe_bo:
    - bat-dg2-oem2:       [FAIL][5] -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1049-11155f150a41d028c6ac7a141924fd4c8798721d/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132096v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356


Build changes
-------------

  * Linux: xe-1049-11155f150a41d028c6ac7a141924fd4c8798721d -> xe-pw-132096v1

  IGT_7801: 7801
  xe-1049-11155f150a41d028c6ac7a141924fd4c8798721d: 11155f150a41d028c6ac7a141924fd4c8798721d
  xe-pw-132096v1: 132096v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132096v1/index.html

--===============2733958616046174349==
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
<tr><td><b>Series:</b></td><td>Use hmm_range_fault to populate user page</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132096/">https://patchwork.freedesktop.org/series/132096/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132096v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132096v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1049-11155f150a41d028c6ac7a141924fd4c8798721d_BAT -&gt; xe-pw-132096v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-132096v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_exec_threads@threads-basic:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1049-11155f150a41d028c6ac7a141924fd4c8798721d/bat-lnl-1/igt@xe_exec_threads@threads-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132096v1/bat-lnl-1/igt@xe_exec_threads@threads-basic.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132096v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-shared-vm-basic:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1049-11155f150a41d028c6ac7a141924fd4c8798721d/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132096v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1049-11155f150a41d028c6ac7a141924fd4c8798721d/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132096v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1049-11155f150a41d028c6ac7a141924fd4c8798721d -&gt; xe-pw-132096v1</li>
</ul>
<p>IGT_7801: 7801<br />
  xe-1049-11155f150a41d028c6ac7a141924fd4c8798721d: 11155f150a41d028c6ac7a141924fd4c8798721d<br />
  xe-pw-132096v1: 132096v1</p>

</body>
</html>

--===============2733958616046174349==--

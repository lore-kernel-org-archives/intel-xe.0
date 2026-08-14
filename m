Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B85EC5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 16:14:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED51110E188;
	Fri, 14 Aug 2026 16:14:11 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA67D10E188;
 Fri, 14 Aug 2026 16:14:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0964965371633814411=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Adjust_the_bo_shr?=
 =?utf-8?q?inker_batch_size_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Aug 2026 16:14:10 -0000
Message-ID: <178672405082.53533.17136441586350631397@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260814143737.49684-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260814143737.49684-1-thomas.hellstrom@linux.intel.com>
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

--===============0964965371633814411==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Adjust the bo shrinker batch size (rev2)
URL   : https://patchwork.freedesktop.org/series/166426/
State : failure

== Summary ==

CI Bug Log - changes from xe-5598-7e32cf3d0659b7cd8dae18ce40e418e0cb525079_BAT -> xe-pw-166426v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-166426v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-166426v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-166426v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@fbdev@eof:
    - bat-wcl-1:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5598-7e32cf3d0659b7cd8dae18ce40e418e0cb525079/bat-wcl-1/igt@fbdev@eof.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v2/bat-wcl-1/igt@fbdev@eof.html

  * igt@xe_module_load@load:
    - bat-wcl-1:          [PASS][3] -> [TIMEOUT][4] +1 other test timeout
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5598-7e32cf3d0659b7cd8dae18ce40e418e0cb525079/bat-wcl-1/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v2/bat-wcl-1/igt@xe_module_load@load.html

  
New tests
---------

  New tests have been introduced between xe-5598-7e32cf3d0659b7cd8dae18ce40e418e0cb525079_BAT and xe-pw-166426v2_BAT:

### New IGT tests (1) ###

  * igt@fbdev:
    - Statuses :
    - Exec time: [None] s

  



Build changes
-------------

  * Linux: xe-5598-7e32cf3d0659b7cd8dae18ce40e418e0cb525079 -> xe-pw-166426v2

  IGT_9056: 9056
  xe-5598-7e32cf3d0659b7cd8dae18ce40e418e0cb525079: 7e32cf3d0659b7cd8dae18ce40e418e0cb525079
  xe-pw-166426v2: 166426v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v2/index.html

--===============0964965371633814411==
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
<tr><td><b>Series:</b></td><td>drm/xe: Adjust the bo shrinker batch size (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166426/">https://patchwork.freedesktop.org/series/166426/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5598-7e32cf3d0659b7cd8dae18ce40e418e0cb525079_BAT -&gt; xe-pw-166426v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-166426v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-166426v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-166426v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5598-7e32cf3d0659b7cd8dae18ce40e418e0cb525079/bat-wcl-1/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v2/bat-wcl-1/igt@fbdev@eof.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5598-7e32cf3d0659b7cd8dae18ce40e418e0cb525079/bat-wcl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v2/bat-wcl-1/igt@xe_module_load@load.html">TIMEOUT</a> +1 other test timeout</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5598-7e32cf3d0659b7cd8dae18ce40e418e0cb525079_BAT and xe-pw-166426v2_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@fbdev:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5598-7e32cf3d0659b7cd8dae18ce40e418e0cb525079 -&gt; xe-pw-166426v2</li>
</ul>
<p>IGT_9056: 9056<br />
  xe-5598-7e32cf3d0659b7cd8dae18ce40e418e0cb525079: 7e32cf3d0659b7cd8dae18ce40e418e0cb525079<br />
  xe-pw-166426v2: 166426v2</p>

</body>
</html>

--===============0964965371633814411==--

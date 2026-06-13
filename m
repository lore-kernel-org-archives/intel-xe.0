Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7049FCD98D2
	for <intel-xe@archiver.kernel.org>; Sat, 13 Jun 2026 03:01:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB4610EBD9;
	Sat, 13 Jun 2026 03:01:04 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236A810EBD9;
 Sat, 13 Jun 2026 03:01:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4927708478574460686=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Disable_schedulin?=
 =?utf-8?q?g_early_on_FD_close_to_avoid_CAT_error_cascade_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 13 Jun 2026 03:01:03 -0000
Message-ID: <178131966313.75927.9685035375919356092@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260613013859.3886196-1-matthew.brost@intel.com>
In-Reply-To: <20260613013859.3886196-1-matthew.brost@intel.com>
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

--===============4927708478574460686==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Disable scheduling early on FD close to avoid CAT error cascade (rev3)
URL   : https://patchwork.freedesktop.org/series/168398/
State : failure

== Summary ==

CI Bug Log - changes from xe-5253-5fc0f82c971ea3b4e1c58602c0be573a802a8670_BAT -> xe-pw-168398v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-168398v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-168398v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-168398v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_waitfence@reltime:
    - bat-wcl-2:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5253-5fc0f82c971ea3b4e1c58602c0be573a802a8670/bat-wcl-2/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168398v3/bat-wcl-2/igt@xe_waitfence@reltime.html

  


Build changes
-------------

  * Linux: xe-5253-5fc0f82c971ea3b4e1c58602c0be573a802a8670 -> xe-pw-168398v3

  IGT_8962: 8962
  xe-5253-5fc0f82c971ea3b4e1c58602c0be573a802a8670: 5fc0f82c971ea3b4e1c58602c0be573a802a8670
  xe-pw-168398v3: 168398v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168398v3/index.html

--===============4927708478574460686==
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
<tr><td><b>Series:</b></td><td>drm/xe: Disable scheduling early on FD close to avoid CAT error cascade (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168398/">https://patchwork.freedesktop.org/series/168398/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168398v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168398v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5253-5fc0f82c971ea3b4e1c58602c0be573a802a8670_BAT -&gt; xe-pw-168398v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-168398v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-168398v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-168398v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5253-5fc0f82c971ea3b4e1c58602c0be573a802a8670/bat-wcl-2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168398v3/bat-wcl-2/igt@xe_waitfence@reltime.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5253-5fc0f82c971ea3b4e1c58602c0be573a802a8670 -&gt; xe-pw-168398v3</li>
</ul>
<p>IGT_8962: 8962<br />
  xe-5253-5fc0f82c971ea3b4e1c58602c0be573a802a8670: 5fc0f82c971ea3b4e1c58602c0be573a802a8670<br />
  xe-pw-168398v3: 168398v3</p>

</body>
</html>

--===============4927708478574460686==--

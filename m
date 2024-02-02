Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BE5C48286
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 01:07:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B6910E0DA;
	Fri,  2 Feb 2024 01:07:44 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4F010E0DA;
 Fri,  2 Feb 2024 01:07:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2377139308272349699=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_Group_live_kunit_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 02 Feb 2024 01:07:43 -0000
Message-ID: <170683606391.935547.9478195254616849037@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240202003047.552529-1-lucas.demarchi@intel.com>
In-Reply-To: <20240202003047.552529-1-lucas.demarchi@intel.com>
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

--===============2377139308272349699==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Group live kunit tests
URL   : https://patchwork.freedesktop.org/series/129448/
State : failure

== Summary ==

CI Bug Log - changes from xe-716-18a9fefd9e05291cbe792d358bbdc04dc6d21adb_BAT -> xe-pw-129448v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-129448v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-129448v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-129448v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@bo:
    - bat-adlp-7:         [PASS][1] -> [SKIP][2] +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-716-18a9fefd9e05291cbe792d358bbdc04dc6d21adb/bat-adlp-7/igt@xe_live_ktest@bo.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129448v1/bat-adlp-7/igt@xe_live_ktest@bo.html

  * igt@xe_live_ktest@migrate:
    - bat-pvc-2:          [PASS][3] -> [SKIP][4] +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-716-18a9fefd9e05291cbe792d358bbdc04dc6d21adb/bat-pvc-2/igt@xe_live_ktest@migrate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129448v1/bat-pvc-2/igt@xe_live_ktest@migrate.html
    - bat-dg2-oem2:       [PASS][5] -> [SKIP][6] +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-716-18a9fefd9e05291cbe792d358bbdc04dc6d21adb/bat-dg2-oem2/igt@xe_live_ktest@migrate.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129448v1/bat-dg2-oem2/igt@xe_live_ktest@migrate.html
    - bat-atsm-2:         [PASS][7] -> [SKIP][8] +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-716-18a9fefd9e05291cbe792d358bbdc04dc6d21adb/bat-atsm-2/igt@xe_live_ktest@migrate.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129448v1/bat-atsm-2/igt@xe_live_ktest@migrate.html

  


Build changes
-------------

  * Linux: xe-716-18a9fefd9e05291cbe792d358bbdc04dc6d21adb -> xe-pw-129448v1

  IGT_7701: 7701
  xe-716-18a9fefd9e05291cbe792d358bbdc04dc6d21adb: 18a9fefd9e05291cbe792d358bbdc04dc6d21adb
  xe-pw-129448v1: 129448v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129448v1/index.html

--===============2377139308272349699==
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
<tr><td><b>Series:</b></td><td>drm/xe: Group live kunit tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129448/">https://patchwork.freedesktop.org/series/129448/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129448v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129448v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-716-18a9fefd9e05291cbe792d358bbdc04dc6d21adb_BAT -&gt; xe-pw-129448v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-129448v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-129448v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-129448v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_live_ktest@bo:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-716-18a9fefd9e05291cbe792d358bbdc04dc6d21adb/bat-adlp-7/igt@xe_live_ktest@bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129448v1/bat-adlp-7/igt@xe_live_ktest@bo.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@migrate:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-716-18a9fefd9e05291cbe792d358bbdc04dc6d21adb/bat-pvc-2/igt@xe_live_ktest@migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129448v1/bat-pvc-2/igt@xe_live_ktest@migrate.html">SKIP</a> +2 other tests skip</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-716-18a9fefd9e05291cbe792d358bbdc04dc6d21adb/bat-dg2-oem2/igt@xe_live_ktest@migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129448v1/bat-dg2-oem2/igt@xe_live_ktest@migrate.html">SKIP</a> +2 other tests skip</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-716-18a9fefd9e05291cbe792d358bbdc04dc6d21adb/bat-atsm-2/igt@xe_live_ktest@migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129448v1/bat-atsm-2/igt@xe_live_ktest@migrate.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-716-18a9fefd9e05291cbe792d358bbdc04dc6d21adb -&gt; xe-pw-129448v1</li>
</ul>
<p>IGT_7701: 7701<br />
  xe-716-18a9fefd9e05291cbe792d358bbdc04dc6d21adb: 18a9fefd9e05291cbe792d358bbdc04dc6d21adb<br />
  xe-pw-129448v1: 129448v1</p>

</body>
</html>

--===============2377139308272349699==--

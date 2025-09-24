Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF046CAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 02:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728A910E692;
	Wed, 24 Sep 2025 02:14:49 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B74D10E213;
 Wed, 24 Sep 2025 02:14:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4503915110273139428=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_VF_migration_redesign_=28re?=
 =?utf-8?q?v2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Sep 2025 02:14:49 -0000
Message-ID: <175868008923.360510.17296034279719067732@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250924011601.888293-1-matthew.brost@intel.com>
In-Reply-To: <20250924011601.888293-1-matthew.brost@intel.com>
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

--===============4503915110273139428==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: VF migration redesign (rev2)
URL   : https://patchwork.freedesktop.org/series/154627/
State : failure

== Summary ==

CI Bug Log - changes from xe-3822-af3cdefd0a1ad2dad29fcde0854ccbce494cc28a_BAT -> xe-pw-154627v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-154627v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-154627v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (11 -> 9)
------------------------------

  Missing    (2): bat-adlp-vm bat-ptl-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-154627v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - bat-adlp-7:         [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3822-af3cdefd0a1ad2dad29fcde0854ccbce494cc28a/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v2/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html

  
Known issues
------------

  Here are the changes found in xe-pw-154627v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-adlp-7:         [DMESG-WARN][3] ([Intel XE#4543]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3822-af3cdefd0a1ad2dad29fcde0854ccbce494cc28a/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * Linux: xe-3822-af3cdefd0a1ad2dad29fcde0854ccbce494cc28a -> xe-pw-154627v2

  IGT_8550: 4f8c7886ad02e116804ec08714f17bce1755c6e4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3822-af3cdefd0a1ad2dad29fcde0854ccbce494cc28a: af3cdefd0a1ad2dad29fcde0854ccbce494cc28a
  xe-pw-154627v2: 154627v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v2/index.html

--===============4503915110273139428==
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
<tr><td><b>Series:</b></td><td>VF migration redesign (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154627/">https://patchwork.freedesktop.org/series/154627/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3822-af3cdefd0a1ad2dad29fcde0854ccbce494cc28a_BAT -&gt; xe-pw-154627v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-154627v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-154627v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (11 -&gt; 9)</h2>
<p>Missing    (2): bat-adlp-vm bat-ptl-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-154627v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@sriov_basic@enable-vfs-autoprobe-on:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3822-af3cdefd0a1ad2dad29fcde0854ccbce494cc28a/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v2/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-154627v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-dpms:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3822-af3cdefd0a1ad2dad29fcde0854ccbce494cc28a/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3822-af3cdefd0a1ad2dad29fcde0854ccbce494cc28a -&gt; xe-pw-154627v2</li>
</ul>
<p>IGT_8550: 4f8c7886ad02e116804ec08714f17bce1755c6e4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3822-af3cdefd0a1ad2dad29fcde0854ccbce494cc28a: af3cdefd0a1ad2dad29fcde0854ccbce494cc28a<br />
  xe-pw-154627v2: 154627v2</p>

</body>
</html>

--===============4503915110273139428==--

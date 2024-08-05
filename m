Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D679CC3DA7F
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 06:21:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56EE10E117;
	Mon,  5 Aug 2024 06:21:24 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE11210E122;
 Mon,  5 Aug 2024 06:21:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8343211806897367616=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/xe2=3A_Add_performance_tu?=
 =?utf-8?q?rning_changes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shekhar Chauhan" <shekhar.chauhan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 Aug 2024 06:21:22 -0000
Message-ID: <172283888290.539585.18293770757677970832@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240805053710.877119-1-shekhar.chauhan@intel.com>
In-Reply-To: <20240805053710.877119-1-shekhar.chauhan@intel.com>
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

--===============8343211806897367616==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe2: Add performance turning changes
URL   : https://patchwork.freedesktop.org/series/136873/
State : failure

== Summary ==

CI Bug Log - changes from xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71_BAT -> xe-pw-136873v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-136873v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136873v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136873v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_sysfs_scheduler@timeslice_duration_us-invalid@vecs:
    - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/bat-bmg-1/igt@xe_sysfs_scheduler@timeslice_duration_us-invalid@vecs.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/bat-bmg-1/igt@xe_sysfs_scheduler@timeslice_duration_us-invalid@vecs.html

  


Build changes
-------------

  * Linux: xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71 -> xe-pw-136873v1

  IGT_7954: a22f1dab2c2604f9678e4b27ba40bee7dcce9dfd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71: 0b8d955bfdcf0864a764a125ab13bc0fd81f3b71
  xe-pw-136873v1: 136873v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/index.html

--===============8343211806897367616==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe2: Add performance turning changes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136873/">https://patchwork.freedesktop.org/series/136873/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71_BAT -&gt; xe-pw-136873v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-136873v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-136873v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-136873v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_sysfs_scheduler@timeslice_duration_us-invalid@vecs:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/bat-bmg-1/igt@xe_sysfs_scheduler@timeslice_duration_us-invalid@vecs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/bat-bmg-1/igt@xe_sysfs_scheduler@timeslice_duration_us-invalid@vecs.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71 -&gt; xe-pw-136873v1</li>
</ul>
<p>IGT_7954: a22f1dab2c2604f9678e4b27ba40bee7dcce9dfd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71: 0b8d955bfdcf0864a764a125ab13bc0fd81f3b71<br />
  xe-pw-136873v1: 136873v1</p>

</body>
</html>

--===============8343211806897367616==--

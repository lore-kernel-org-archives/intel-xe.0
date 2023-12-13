Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA6FC4332F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 22:32:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92FC910E865;
	Wed, 13 Dec 2023 22:32:49 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4F57210E84C;
 Wed, 13 Dec 2023 22:32:48 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4525EAA917;
 Wed, 13 Dec 2023 22:32:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3433743511949956983=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Add_support_for_XeLink_device_?=
 =?utf-8?q?=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "David Kershner" <david.kershner@intel.com>
Date: Wed, 13 Dec 2023 22:32:48 -0000
Message-ID: <170250676825.10263.6968467956076147829@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231213214525.2584729-1-david.kershner@intel.com>
In-Reply-To: <20231213214525.2584729-1-david.kershner@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============3433743511949956983==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add support for XeLink device (rev5)
URL   : https://patchwork.freedesktop.org/series/122168/
State : success

== Summary ==

CI Bug Log - changes from xe-577-5cd1893366708380854f4694ae57417192458a6b_BAT -> xe-pw-122168v5_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-122168v5_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][1] -> [DMESG-FAIL][2] ([Intel XE#1033])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v5/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
#### Possible fixes ####

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-atsm-2:         [FAIL][3] ([Intel XE#999]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v5/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/999


Build changes
-------------

  * IGT: IGT_7636 -> IGT_7639
  * Linux: xe-577-5cd1893366708380854f4694ae57417192458a6b -> xe-pw-122168v5

  IGT_7636: 7636
  IGT_7639: 18afc09e362b605a3c88c000331708f105d2c23a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-577-5cd1893366708380854f4694ae57417192458a6b: 5cd1893366708380854f4694ae57417192458a6b
  xe-pw-122168v5: 122168v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v5/index.html

--===============3433743511949956983==
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
<tr><td><b>Series:</b></td><td>Add support for XeLink device (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122168/">https://patchwork.freedesktop.org/series/122168/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-577-5cd1893366708380854f4694ae57417192458a6b_BAT -&gt; xe-pw-122168v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-122168v5_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v5/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_prime_self_import@basic-with_fd_dup:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/999">Intel XE#999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v5/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7636 -&gt; IGT_7639</li>
<li>Linux: xe-577-5cd1893366708380854f4694ae57417192458a6b -&gt; xe-pw-122168v5</li>
</ul>
<p>IGT_7636: 7636<br />
  IGT_7639: 18afc09e362b605a3c88c000331708f105d2c23a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-577-5cd1893366708380854f4694ae57417192458a6b: 5cd1893366708380854f4694ae57417192458a6b<br />
  xe-pw-122168v5: 122168v5</p>

</body>
</html>

--===============3433743511949956983==--

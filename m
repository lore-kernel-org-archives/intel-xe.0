Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF1FC3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 02:54:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53CD410E903;
	Fri, 26 Jul 2024 02:54:47 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0218C10E84B;
 Fri, 26 Jul 2024 02:54:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6282436644327476955=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Faster_devcoredump?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 26 Jul 2024 02:54:46 -0000
Message-ID: <172196248698.384591.2293444922132124624@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240726021334.2020428-1-matthew.brost@intel.com>
In-Reply-To: <20240726021334.2020428-1-matthew.brost@intel.com>
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

--===============6282436644327476955==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Faster devcoredump
URL   : https://patchwork.freedesktop.org/series/136545/
State : success

== Summary ==

CI Bug Log - changes from xe-1670-e4d74e86acba1cf96e4513a63046b793ae43ece7_BAT -> xe-pw-136545v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136545v1_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_mmap@vram:
    - {bat-bmg-1}:        [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1670-e4d74e86acba1cf96e4513a63046b793ae43ece7/bat-bmg-1/igt@xe_mmap@vram.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136545v1/bat-bmg-1/igt@xe_mmap@vram.html

  
Known issues
------------

  Here are the changes found in xe-pw-136545v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][3] ([Intel XE#324]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1670-e4d74e86acba1cf96e4513a63046b793ae43ece7/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136545v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#2200]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2200
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324


Build changes
-------------

  * Linux: xe-1670-e4d74e86acba1cf96e4513a63046b793ae43ece7 -> xe-pw-136545v1

  IGT_7938: 0471a1097444389a901d78b260c24eaf4fc2d7df @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1670-e4d74e86acba1cf96e4513a63046b793ae43ece7: e4d74e86acba1cf96e4513a63046b793ae43ece7
  xe-pw-136545v1: 136545v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136545v1/index.html

--===============6282436644327476955==
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
<tr><td><b>Series:</b></td><td>drm/xe: Faster devcoredump</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136545/">https://patchwork.freedesktop.org/series/136545/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136545v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136545v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1670-e4d74e86acba1cf96e4513a63046b793ae43ece7_BAT -&gt; xe-pw-136545v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-136545v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_mmap@vram:<ul>
<li>{bat-bmg-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1670-e4d74e86acba1cf96e4513a63046b793ae43ece7/bat-bmg-1/igt@xe_mmap@vram.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136545v1/bat-bmg-1/igt@xe_mmap@vram.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136545v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1670-e4d74e86acba1cf96e4513a63046b793ae43ece7/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136545v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1670-e4d74e86acba1cf96e4513a63046b793ae43ece7 -&gt; xe-pw-136545v1</li>
</ul>
<p>IGT_7938: 0471a1097444389a901d78b260c24eaf4fc2d7df @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1670-e4d74e86acba1cf96e4513a63046b793ae43ece7: e4d74e86acba1cf96e4513a63046b793ae43ece7<br />
  xe-pw-136545v1: 136545v1</p>

</body>
</html>

--===============6282436644327476955==--

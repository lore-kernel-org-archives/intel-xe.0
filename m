Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041DDD6A223
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 01:10:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A037410E100;
	Fri, 15 Nov 2024 01:10:31 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED0110E0D7;
 Fri, 15 Nov 2024 01:10:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3539331318803839150=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/ptl=3A_Add_another_PTL_PC?=
 =?utf-8?q?I_ID?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 15 Nov 2024 01:10:30 -0000
Message-ID: <173163303016.4193766.4993914840142817166@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241114234410.145863-1-matthew.s.atwood@intel.com>
In-Reply-To: <20241114234410.145863-1-matthew.s.atwood@intel.com>
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

--===============3539331318803839150==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/ptl: Add another PTL PCI ID
URL   : https://patchwork.freedesktop.org/series/141372/
State : success

== Summary ==

CI Bug Log - changes from xe-2234-4dadc0610ce1112fb2f5079c5af75070feb43d65_BAT -> xe-pw-141372v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-141372v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#1861])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2234-4dadc0610ce1112fb2f5079c5af75070feb43d65/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141372v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-adlp-7:         [PASS][3] -> [INCOMPLETE][4] ([Intel XE#2874]) +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2234-4dadc0610ce1112fb2f5079c5af75070feb43d65/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141372v1/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
#### Possible fixes ####

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-bmg-2:          [INCOMPLETE][5] ([Intel XE#2874] / [Intel XE#2998]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2234-4dadc0610ce1112fb2f5079c5af75070feb43d65/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141372v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998


Build changes
-------------

  * Linux: xe-2234-4dadc0610ce1112fb2f5079c5af75070feb43d65 -> xe-pw-141372v1

  IGT_8111: 67422a7b55b0278cf0d1bfdc0899ee637ed7d588 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2234-4dadc0610ce1112fb2f5079c5af75070feb43d65: 4dadc0610ce1112fb2f5079c5af75070feb43d65
  xe-pw-141372v1: 141372v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141372v1/index.html

--===============3539331318803839150==
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
<tr><td><b>Series:</b></td><td>drm/xe/ptl: Add another PTL PCI ID</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141372/">https://patchwork.freedesktop.org/series/141372/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141372v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141372v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2234-4dadc0610ce1112fb2f5079c5af75070feb43d65_BAT -&gt; xe-pw-141372v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141372v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2234-4dadc0610ce1112fb2f5079c5af75070feb43d65/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141372v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2234-4dadc0610ce1112fb2f5079c5af75070feb43d65/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141372v1/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2234-4dadc0610ce1112fb2f5079c5af75070feb43d65/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998">Intel XE#2998</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141372v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2234-4dadc0610ce1112fb2f5079c5af75070feb43d65 -&gt; xe-pw-141372v1</li>
</ul>
<p>IGT_8111: 67422a7b55b0278cf0d1bfdc0899ee637ed7d588 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2234-4dadc0610ce1112fb2f5079c5af75070feb43d65: 4dadc0610ce1112fb2f5079c5af75070feb43d65<br />
  xe-pw-141372v1: 141372v1</p>

</body>
</html>

--===============3539331318803839150==--

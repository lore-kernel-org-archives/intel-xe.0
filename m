Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10816C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 21:45:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF90F1137FE;
	Wed, 17 Apr 2024 21:45:36 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0478B10F8D0;
 Wed, 17 Apr 2024 21:45:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3157783949209585810=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_Add_outer_runtime=5Fpm?=
 =?utf-8?q?_protection_to_xe=5Flive=5Fktest=40xe=5Fdma=5Fbuf?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Apr 2024 21:45:36 -0000
Message-ID: <171339033601.1483580.716484459614409874@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <171271725279.1318876.10825510039289922734@8e613ede5ea5>
In-Reply-To: <171271725279.1318876.10825510039289922734@8e613ede5ea5>
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

--===============3157783949209585810==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add outer runtime_pm protection to xe_live_ktest@xe_dma_buf
URL   : https://patchwork.freedesktop.org/series/132574/
State : failure

== Summary ==

CI Bug Log - changes from xe-1109-64a20aacb61e4ce6d8a0b3dc6e4bff72e316ffa3_BAT -> xe-pw-132574v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-132574v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-132574v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-132574v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - bat-pvc-2:          [PASS][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1109-64a20aacb61e4ce6d8a0b3dc6e4bff72e316ffa3/bat-pvc-2/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132574v1/bat-pvc-2/igt@xe_exec_threads@threads-mixed-fd-basic.html

  


Build changes
-------------

  * IGT: IGT_7810 -> IGT_7811
  * Linux: xe-1109-64a20aacb61e4ce6d8a0b3dc6e4bff72e316ffa3 -> xe-pw-132574v1

  IGT_7810: 189483744e9ff56ea573e07a049c5365404c7ecb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7811: 2d95df5757eb99a42ea9ac30fd74001dee804d03 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1109-64a20aacb61e4ce6d8a0b3dc6e4bff72e316ffa3: 64a20aacb61e4ce6d8a0b3dc6e4bff72e316ffa3
  xe-pw-132574v1: 132574v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132574v1/index.html

--===============3157783949209585810==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add outer runtime_pm protection to xe_live_ktest@xe_dma_buf</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132574/">https://patchwork.freedesktop.org/series/132574/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132574v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132574v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1109-64a20aacb61e4ce6d8a0b3dc6e4bff72e316ffa3_BAT -&gt; xe-pw-132574v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-132574v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-132574v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-132574v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-fd-basic:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1109-64a20aacb61e4ce6d8a0b3dc6e4bff72e316ffa3/bat-pvc-2/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132574v1/bat-pvc-2/igt@xe_exec_threads@threads-mixed-fd-basic.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7810 -&gt; IGT_7811</li>
<li>Linux: xe-1109-64a20aacb61e4ce6d8a0b3dc6e4bff72e316ffa3 -&gt; xe-pw-132574v1</li>
</ul>
<p>IGT_7810: 189483744e9ff56ea573e07a049c5365404c7ecb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7811: 2d95df5757eb99a42ea9ac30fd74001dee804d03 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1109-64a20aacb61e4ce6d8a0b3dc6e4bff72e316ffa3: 64a20aacb61e4ce6d8a0b3dc6e4bff72e316ffa3<br />
  xe-pw-132574v1: 132574v1</p>

</body>
</html>

--===============3157783949209585810==--

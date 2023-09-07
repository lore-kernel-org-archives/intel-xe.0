Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DF7EC875A
	for <intel-xe@archiver.kernel.org>; Thu,  7 Sep 2023 20:03:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75DA210E09E;
	Thu,  7 Sep 2023 20:03:09 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 397ED10E08F;
 Thu,  7 Sep 2023 20:03:07 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 31841A00E6;
 Thu,  7 Sep 2023 20:03:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7320156022261993698=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Thu, 07 Sep 2023 20:03:07 -0000
Message-ID: <169411698717.17903.17792754769564741882@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230907073953.7-1-francois.dugast@intel.com>
In-Reply-To: <20230907073953.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/ua?=
 =?utf-8?q?pi=3A_Separate_VM=5FBIND=27s_operation_and_flag_=28rev3=29?=
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

--===============7320156022261993698==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/uapi: Separate VM_BIND's operation and flag (rev3)
URL   : https://patchwork.freedesktop.org/series/123333/
State : failure

== Summary ==

CI Bug Log - changes from xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1_BAT -> xe-pw-123333v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-123333v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-123333v3_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-123333v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_compute@compute-square:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1/bat-adlp-7/igt@xe_compute@compute-square.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123333v3/bat-adlp-7/igt@xe_compute@compute-square.html

  * igt@xe_dma_buf_sync@export-dma-buf-once:
    - bat-dg2-oem2:       [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123333v3/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once.html
    - bat-atsm-2:         [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1/bat-atsm-2/igt@xe_dma_buf_sync@export-dma-buf-once.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123333v3/bat-atsm-2/igt@xe_dma_buf_sync@export-dma-buf-once.html
    - bat-adlp-7:         [PASS][7] -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1/bat-adlp-7/igt@xe_dma_buf_sync@export-dma-buf-once.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123333v3/bat-adlp-7/igt@xe_dma_buf_sync@export-dma-buf-once.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_dma_buf_sync@export-dma-buf-once:
    - {bat-pvc-2}:        [PASS][9] -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1/bat-pvc-2/igt@xe_dma_buf_sync@export-dma-buf-once.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123333v3/bat-pvc-2/igt@xe_dma_buf_sync@export-dma-buf-once.html

  
Known issues
------------

  Here are the changes found in xe-pw-123333v3_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-atsm-2:         [FAIL][11] ([Intel XE#524]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123333v3/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524


Build changes
-------------

  * IGT: IGT_7472 -> IGT_7474
  * Linux: xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1 -> xe-pw-123333v3

  IGT_7472: b9d6f8dd0f69d0091e349ddc9d9f1425b2f36ec9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7474: 9d91cf2c6e7bb64d60c2030d1535e40ca0ad53ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1: bae46e59a7f667734376ddb0d2451967dfb264f1
  xe-pw-123333v3: 123333v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123333v3/index.html

--===============7320156022261993698==
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
<tr><td><b>Series:</b></td><td>drm/xe/uapi: Separate VM_BIND&#39;s operation and flag (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123333/">https://patchwork.freedesktop.org/series/123333/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123333v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123333v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1_BAT -&gt; xe-pw-123333v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-123333v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-123333v3_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-123333v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1/bat-adlp-7/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123333v3/bat-adlp-7/igt@xe_compute@compute-square.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-once:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123333v3/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once.html">INCOMPLETE</a></p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1/bat-atsm-2/igt@xe_dma_buf_sync@export-dma-buf-once.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123333v3/bat-atsm-2/igt@xe_dma_buf_sync@export-dma-buf-once.html">INCOMPLETE</a></p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1/bat-adlp-7/igt@xe_dma_buf_sync@export-dma-buf-once.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123333v3/bat-adlp-7/igt@xe_dma_buf_sync@export-dma-buf-once.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_dma_buf_sync@export-dma-buf-once:<ul>
<li>{bat-pvc-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1/bat-pvc-2/igt@xe_dma_buf_sync@export-dma-buf-once.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123333v3/bat-pvc-2/igt@xe_dma_buf_sync@export-dma-buf-once.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-123333v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>{igt@xe_create@create-execqueues-noleak}:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123333v3/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7472 -&gt; IGT_7474</li>
<li>Linux: xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1 -&gt; xe-pw-123333v3</li>
</ul>
<p>IGT_7472: b9d6f8dd0f69d0091e349ddc9d9f1425b2f36ec9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7474: 9d91cf2c6e7bb64d60c2030d1535e40ca0ad53ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-357-bae46e59a7f667734376ddb0d2451967dfb264f1: bae46e59a7f667734376ddb0d2451967dfb264f1<br />
  xe-pw-123333v3: 123333v3</p>

</body>
</html>

--===============7320156022261993698==--

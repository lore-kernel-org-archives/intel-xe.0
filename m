Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6B5CCF9E3
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 21:38:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97EA10EA3F;
	Thu, 30 Oct 2025 21:38:17 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5335410EA3F;
 Thu, 30 Oct 2025 21:38:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6665002961547221249=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Inline_gt=5Freset?=
 =?utf-8?q?_in_the_worker?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Oct 2025 21:38:17 -0000
Message-ID: <176186029733.2567.15924452850761137891@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251030200503.3667381-2-lucas.demarchi@intel.com>
In-Reply-To: <20251030200503.3667381-2-lucas.demarchi@intel.com>
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

--===============6665002961547221249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Inline gt_reset in the worker
URL   : https://patchwork.freedesktop.org/series/156785/
State : failure

== Summary ==

CI Bug Log - changes from xe-4014-c228329c56db24dda529f2499987b3a179d1f032_BAT -> xe-pw-156785v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-156785v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-156785v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): bat-atsm-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-156785v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-bmg-1:          [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4014-c228329c56db24dda529f2499987b3a179d1f032/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156785v1/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc.html
    - bat-dg2-oem2:       [PASS][3] -> [ABORT][4] +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4014-c228329c56db24dda529f2499987b3a179d1f032/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156785v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:
    - bat-adlp-7:         [PASS][5] -> [ABORT][6] +1 other test abort
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4014-c228329c56db24dda529f2499987b3a179d1f032/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156785v1/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html
    - bat-ptl-2:          [PASS][7] -> [ABORT][8] +1 other test abort
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4014-c228329c56db24dda529f2499987b3a179d1f032/bat-ptl-2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156785v1/bat-ptl-2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html
    - bat-lnl-1:          [PASS][9] -> [ABORT][10] +1 other test abort
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4014-c228329c56db24dda529f2499987b3a179d1f032/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156785v1/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html

  
Known issues
------------

  Here are the changes found in xe-pw-156785v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-bmg-2:          [PASS][11] -> [ABORT][12] ([Intel XE#3970]) +1 other test abort
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4014-c228329c56db24dda529f2499987b3a179d1f032/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156785v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@d-edp1:
    - bat-adlp-7:         [DMESG-WARN][13] ([Intel XE#4543]) -> [PASS][14] +1 other test pass
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4014-c228329c56db24dda529f2499987b3a179d1f032/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156785v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * Linux: xe-4014-c228329c56db24dda529f2499987b3a179d1f032 -> xe-pw-156785v1

  IGT_8603: e6eb3c0fe0f28f3d6e530ae202fbb9f29bde9147 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4014-c228329c56db24dda529f2499987b3a179d1f032: c228329c56db24dda529f2499987b3a179d1f032
  xe-pw-156785v1: 156785v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156785v1/index.html

--===============6665002961547221249==
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
<tr><td><b>Series:</b></td><td>drm/xe: Inline gt_reset in the worker</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156785/">https://patchwork.freedesktop.org/series/156785/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156785v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156785v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4014-c228329c56db24dda529f2499987b3a179d1f032_BAT -&gt; xe-pw-156785v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-156785v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-156785v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): bat-atsm-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-156785v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4014-c228329c56db24dda529f2499987b3a179d1f032/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156785v1/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc.html">ABORT</a> +1 other test abort</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4014-c228329c56db24dda529f2499987b3a179d1f032/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156785v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4014-c228329c56db24dda529f2499987b3a179d1f032/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156785v1/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html">ABORT</a> +1 other test abort</li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4014-c228329c56db24dda529f2499987b3a179d1f032/bat-ptl-2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156785v1/bat-ptl-2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html">ABORT</a> +1 other test abort</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4014-c228329c56db24dda529f2499987b3a179d1f032/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156785v1/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156785v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4014-c228329c56db24dda529f2499987b3a179d1f032/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156785v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@d-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4014-c228329c56db24dda529f2499987b3a179d1f032/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156785v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4014-c228329c56db24dda529f2499987b3a179d1f032 -&gt; xe-pw-156785v1</li>
</ul>
<p>IGT_8603: e6eb3c0fe0f28f3d6e530ae202fbb9f29bde9147 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4014-c228329c56db24dda529f2499987b3a179d1f032: c228329c56db24dda529f2499987b3a179d1f032<br />
  xe-pw-156785v1: 156785v1</p>

</body>
</html>

--===============6665002961547221249==--

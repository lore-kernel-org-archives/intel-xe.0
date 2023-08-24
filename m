Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08D8C3DA6F
	for <intel-xe@archiver.kernel.org>; Thu, 24 Aug 2023 17:25:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6131C10E11F;
	Thu, 24 Aug 2023 17:25:00 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id F202410E11F;
 Thu, 24 Aug 2023 17:24:58 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id EA533AADD8;
 Thu, 24 Aug 2023 17:24:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0792996606689858886=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Thu, 24 Aug 2023 17:24:58 -0000
Message-ID: <169289789893.13344.7993908250222023708@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230824160444.494648-2-matthew.auld@intel.com>
In-Reply-To: <20230824160444.494648-2-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A?=
 =?utf-8?q?_nuke_GuC_on_unload?=
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

--===============0792996606689858886==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: nuke GuC on unload
URL   : https://patchwork.freedesktop.org/series/122851/
State : failure

== Summary ==

CI Bug Log - changes from xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5_BAT -> xe-pw-122851v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-122851v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-122851v1_BAT, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-122851v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-dg2-oem2:       [PASS][1] -> [TIMEOUT][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122851v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3:
    - bat-dg2-oem2:       [PASS][3] -> [INCOMPLETE][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122851v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3.html

  
#### Warnings ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][5] ([Intel XE#400]) -> [DMESG-FAIL][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122851v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  
Known issues
------------

  Here are the changes found in xe-pw-122851v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [FAIL][7] ([Intel XE#480]) -> [PASS][8] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122851v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480


Build changes
-------------

  * Linux: xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5 -> xe-pw-122851v1

  IGT_7451: 5d48d1fb231f449fe2f80cda14ea7a1ecfda59fa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5: c77796cf84361b4716839141f2e48de2bf7f4bd5
  xe-pw-122851v1: 122851v1



--===============0792996606689858886==
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
<tr><td><b>Series:</b></td><td>drm/xe: nuke GuC on unload</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122851/">https://patchwork.freedesktop.org/series/122851/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

</table>


    <h1>CI Bug Log - changes from xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5_BAT -&gt; xe-pw-122851v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-122851v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-122851v1_BAT, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-122851v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122851v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html">TIMEOUT</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122851v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3.html">INCOMPLETE</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122851v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">DMESG-FAIL</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-122851v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122851v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5 -&gt; xe-pw-122851v1</li>
</ul>
<p>IGT_7451: 5d48d1fb231f449fe2f80cda14ea7a1ecfda59fa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5: c77796cf84361b4716839141f2e48de2bf7f4bd5<br />
  xe-pw-122851v1: 122851v1</p>

</body>
</html>

--===============0792996606689858886==--

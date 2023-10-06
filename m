Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B388E92FDE
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 10:07:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5816610E06B;
	Fri,  6 Oct 2023 10:07:06 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8B5CC10E06B;
 Fri,  6 Oct 2023 10:07:03 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 85A25AADEF;
 Fri,  6 Oct 2023 10:07:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3614344685892256221=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Fri, 06 Oct 2023 10:07:03 -0000
Message-ID: <169658682351.6467.3198555712053439690@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231006083935.3924-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231006083935.3924-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Documenta?=
 =?utf-8?q?tion/gpu=3A_Add_a_VM=5FBIND_async_document_=28rev3=29?=
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

--===============3614344685892256221==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Documentation/gpu: Add a VM_BIND async document (rev3)
URL   : https://patchwork.freedesktop.org/series/122457/
State : success

== Summary ==

CI Bug Log - changes from xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e_BAT -> xe-pw-122457v3_BAT
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

  Here are the changes found in xe-pw-122457v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#480]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122457v3/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_psr@primary_page_flip:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][3] ([i915#1072]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122457v3/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html

  * igt@xe_exec_store@basic-store:
    - bat-adlp-7:         [PASS][4] -> [FAIL][5] ([Intel XE#761])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-adlp-7/igt@xe_exec_store@basic-store.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122457v3/bat-adlp-7/igt@xe_exec_store@basic-store.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-dg2-oem2:       [INCOMPLETE][6] ([Intel XE#282] / [Intel XE#749]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122457v3/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3:
    - bat-dg2-oem2:       [INCOMPLETE][8] ([Intel XE#282]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122457v3/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [INCOMPLETE][10] ([Intel XE#606] / [Intel XE#632]) -> [INCOMPLETE][11] ([Intel XE#632])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122457v3/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [TIMEOUT][12] ([Intel XE#430] / [Intel XE#530]) -> [FAIL][13] ([Intel XE#400])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122457v3/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3:
    - bat-dg2-oem2:       [TIMEOUT][14] ([Intel XE#530]) -> [FAIL][15] ([Intel XE#400])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122457v3/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/430
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/530
  [Intel XE#606]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/606
  [Intel XE#632]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/632
  [Intel XE#749]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/749
  [Intel XE#761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/761
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072


Build changes
-------------

  * IGT: IGT_7517 -> IGT_7518
  * Linux: xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e -> xe-pw-122457v3

  IGT_7517: 8368e3ad3f9459a8f5cdd24f813ae802c1211029 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7518: 2d4a57e28db0c2ccbf8b2e763074c9aa74a1ae52 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e: b3daf7f07d6accbe43feafcadeb0b0498063761e
  xe-pw-122457v3: 122457v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122457v3/index.html

--===============3614344685892256221==
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
<tr><td><b>Series:</b></td><td>Documentation/gpu: Add a VM_BIND async document (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122457/">https://patchwork.freedesktop.org/series/122457/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122457v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122457v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e_BAT -&gt; xe-pw-122457v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-122457v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122457v3/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122457v3/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_store@basic-store:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-adlp-7/igt@xe_exec_store@basic-store.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122457v3/bat-adlp-7/igt@xe_exec_store@basic-store.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/761">Intel XE#761</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/749">Intel XE#749</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122457v3/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122457v3/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/606">Intel XE#606</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/632">Intel XE#632</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122457v3/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/632">Intel XE#632</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/430">Intel XE#430</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/530">Intel XE#530</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122457v3/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/530">Intel XE#530</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122457v3/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7517 -&gt; IGT_7518</li>
<li>Linux: xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e -&gt; xe-pw-122457v3</li>
</ul>
<p>IGT_7517: 8368e3ad3f9459a8f5cdd24f813ae802c1211029 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7518: 2d4a57e28db0c2ccbf8b2e763074c9aa74a1ae52 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e: b3daf7f07d6accbe43feafcadeb0b0498063761e<br />
  xe-pw-122457v3: 122457v3</p>

</body>
</html>

--===============3614344685892256221==--

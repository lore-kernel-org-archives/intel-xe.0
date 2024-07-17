Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63D5C3DA60
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 21:53:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E9A10E464;
	Wed, 17 Jul 2024 21:53:54 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07DA10E464;
 Wed, 17 Jul 2024 21:53:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1820356743700939936=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Implement_Compression_Support_on?=
 =?utf-8?q?_BMG?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Akshata Jahagirdar" <akshata.jahagirdar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Jul 2024 21:53:52 -0000
Message-ID: <172125323271.271339.17574838137791685504@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1721250309.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1721250309.git.akshata.jahagirdar@intel.com>
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

--===============1820356743700939936==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Implement Compression Support on BMG
URL   : https://patchwork.freedesktop.org/series/136211/
State : success

== Summary ==

CI Bug Log - changes from xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f_BAT -> xe-pw-136211v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f_BAT and xe-pw-136211v1_BAT:

### New IGT tests (1) ###

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - Statuses : 7 pass(s)
    - Exec time: [0.01, 0.02] s

  

Known issues
------------

  Here are the changes found in xe-pw-136211v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][1] -> [DMESG-FAIL][2] ([Intel XE#324])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136211v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-hdmi-a-3:
    - {bat-bmg-1}:        [DMESG-WARN][3] ([Intel XE#2232]) -> [PASS][4] +63 other tests pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-hdmi-a-3.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136211v1/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-hdmi-a-3.html

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - {bat-bmg-1}:        [INCOMPLETE][5] ([Intel XE#2232]) -> [PASS][6] +16 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/bat-bmg-1/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136211v1/bat-bmg-1/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_live_ktest@xe_migrate:
    - {bat-bmg-1}:        [SKIP][7] ([Intel XE#2109]) -> [PASS][8] +2 other tests pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136211v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#2109]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2109
  [Intel XE#2232]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2232
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324


Build changes
-------------

  * Linux: xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f -> xe-pw-136211v1

  IGT_7928: 294a7a487aab103c54b0deeb1559fcba371232d9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f: bd2a84d801982bd4a899a29916b458a8f82cb01f
  xe-pw-136211v1: 136211v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136211v1/index.html

--===============1820356743700939936==
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
<tr><td><b>Series:</b></td><td>Implement Compression Support on BMG</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136211/">https://patchwork.freedesktop.org/series/136211/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136211v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136211v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f_BAT -&gt; xe-pw-136211v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f_BAT and xe-pw-136211v1_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136211v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136211v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-hdmi-a-3:</p>
<ul>
<li>{bat-bmg-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2232">Intel XE#2232</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136211v1/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-hdmi-a-3.html">PASS</a> +63 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>{bat-bmg-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/bat-bmg-1/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2232">Intel XE#2232</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136211v1/bat-bmg-1/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> +16 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>{bat-bmg-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2109">Intel XE#2109</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136211v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f -&gt; xe-pw-136211v1</li>
</ul>
<p>IGT_7928: 294a7a487aab103c54b0deeb1559fcba371232d9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f: bd2a84d801982bd4a899a29916b458a8f82cb01f<br />
  xe-pw-136211v1: 136211v1</p>

</body>
</html>

--===============1820356743700939936==--

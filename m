Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA03BC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 15:07:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EEB310E1C4;
	Tue, 12 Dec 2023 15:07:35 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8C39110E1C4;
 Tue, 12 Dec 2023 15:07:33 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 84AE7AADD5;
 Tue, 12 Dec 2023 15:07:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2353273051412482560=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5B1/2=5D_f?=
 =?utf-8?q?ixup!_drm/xe/uc=3A_Store_firmware_binary_in_system-memory_backed_?=
 =?utf-8?q?BO?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Date: Tue, 12 Dec 2023 15:07:33 -0000
Message-ID: <170239365350.31291.9929193007173618811@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231212142045.22182-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20231212142045.22182-1-maarten.lankhorst@linux.intel.com>
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

--===============2353273051412482560==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] fixup! drm/xe/uc: Store firmware binary in system-memory backed BO
URL   : https://patchwork.freedesktop.org/series/127688/
State : success

== Summary ==

CI Bug Log - changes from xe-570-0c30a1b58ce6096e5d6a6c9ba32961c345fab7c8_BAT -> xe-pw-127688v1_BAT
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

  Here are the changes found in xe-pw-127688v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-dg2-oem2:       [FAIL][1] ([Intel XE#480]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-570-0c30a1b58ce6096e5d6a6c9ba32961c345fab7c8/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127688v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][3] ([Intel XE#282] / [i915#2017]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-570-0c30a1b58ce6096e5d6a6c9ba32961c345fab7c8/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127688v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-atsm-2:         [FAIL][5] ([Intel XE#999]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-570-0c30a1b58ce6096e5d6a6c9ba32961c345fab7c8/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127688v1/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html

  
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/999
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017


Build changes
-------------

  * IGT: IGT_7635 -> IGT_7636
  * Linux: xe-570-0c30a1b58ce6096e5d6a6c9ba32961c345fab7c8 -> xe-pw-127688v1

  IGT_7635: 0b796be8ce05cb2070ce5136d248f438c962d11e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7636: 7636
  xe-570-0c30a1b58ce6096e5d6a6c9ba32961c345fab7c8: 0c30a1b58ce6096e5d6a6c9ba32961c345fab7c8
  xe-pw-127688v1: 127688v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127688v1/index.html

--===============2353273051412482560==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] fixup! drm/xe/uc: Store firmware binary in system-memory backed BO</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127688/">https://patchwork.freedesktop.org/series/127688/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127688v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127688v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-570-0c30a1b58ce6096e5d6a6c9ba32961c345fab7c8_BAT -&gt; xe-pw-127688v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-127688v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-570-0c30a1b58ce6096e5d6a6c9ba32961c345fab7c8/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127688v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-570-0c30a1b58ce6096e5d6a6c9ba32961c345fab7c8/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127688v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-570-0c30a1b58ce6096e5d6a6c9ba32961c345fab7c8/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/999">Intel XE#999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127688v1/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7635 -&gt; IGT_7636</li>
<li>Linux: xe-570-0c30a1b58ce6096e5d6a6c9ba32961c345fab7c8 -&gt; xe-pw-127688v1</li>
</ul>
<p>IGT_7635: 0b796be8ce05cb2070ce5136d248f438c962d11e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7636: 7636<br />
  xe-570-0c30a1b58ce6096e5d6a6c9ba32961c345fab7c8: 0c30a1b58ce6096e5d6a6c9ba32961c345fab7c8<br />
  xe-pw-127688v1: 127688v1</p>

</body>
</html>

--===============2353273051412482560==--

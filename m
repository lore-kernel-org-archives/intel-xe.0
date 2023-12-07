Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2416AC4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 23:57:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2CDA10E22F;
	Thu,  7 Dec 2023 23:57:52 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id AD6EE10E22C;
 Thu,  7 Dec 2023 23:57:51 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9705DAADE1;
 Thu,  7 Dec 2023 23:57:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6132243484991306255=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Add_memory_sysfs_directory_and_a?=
 =?utf-8?q?ttributes_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sujaritha Sundaresan" <sujaritha.sundaresan@intel.com>
Date: Thu, 07 Dec 2023 23:57:51 -0000
Message-ID: <170199347158.28722.3072950725497888340@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231207151739.1241374-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20231207151739.1241374-1-sujaritha.sundaresan@intel.com>
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

--===============6132243484991306255==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add memory sysfs directory and attributes (rev3)
URL   : https://patchwork.freedesktop.org/series/126871/
State : success

== Summary ==

CI Bug Log - changes from xe-560-ca0510637dca8ce9658a2797626a2a558025ec3c_BAT -> xe-pw-126871v3_BAT
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

  Here are the changes found in xe-pw-126871v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#480]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-560-ca0510637dca8ce9658a2797626a2a558025ec3c/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126871v3/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@xe_create@create-execqueues-leak:
    - bat-atsm-2:         [PASS][3] -> [FAIL][4] ([Intel XE#524])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-560-ca0510637dca8ce9658a2797626a2a558025ec3c/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126871v3/bat-atsm-2/igt@xe_create@create-execqueues-leak.html

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-atsm-2:         [PASS][5] -> [FAIL][6] ([Intel XE#999])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-560-ca0510637dca8ce9658a2797626a2a558025ec3c/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126871v3/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-dg2-oem2:       [DMESG-WARN][7] ([Intel XE#282] / [i915#2017]) -> [PASS][8] +5 other tests pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-560-ca0510637dca8ce9658a2797626a2a558025ec3c/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126871v3/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@xe_create@create-execqueues-noleak:
    - bat-adlp-7:         [FAIL][9] ([Intel XE#524]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-560-ca0510637dca8ce9658a2797626a2a558025ec3c/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126871v3/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html

  
#### Warnings ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [DMESG-FAIL][11] ([Intel XE#282] / [i915#2017]) -> [FAIL][12] ([Intel XE#400] / [Intel XE#616]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-560-ca0510637dca8ce9658a2797626a2a558025ec3c/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126871v3/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/999
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017


Build changes
-------------

  * Linux: xe-560-ca0510637dca8ce9658a2797626a2a558025ec3c -> xe-pw-126871v3

  IGT_7628: 431c2d2dd5828b25fcbe1c82afbac865f4771aee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-560-ca0510637dca8ce9658a2797626a2a558025ec3c: ca0510637dca8ce9658a2797626a2a558025ec3c
  xe-pw-126871v3: 126871v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126871v3/index.html

--===============6132243484991306255==
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
<tr><td><b>Series:</b></td><td>Add memory sysfs directory and attributes (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126871/">https://patchwork.freedesktop.org/series/126871/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126871v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126871v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-560-ca0510637dca8ce9658a2797626a2a558025ec3c_BAT -&gt; xe-pw-126871v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-126871v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-560-ca0510637dca8ce9658a2797626a2a558025ec3c/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126871v3/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-execqueues-leak:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-560-ca0510637dca8ce9658a2797626a2a558025ec3c/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126871v3/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-560-ca0510637dca8ce9658a2797626a2a558025ec3c/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126871v3/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/999">Intel XE#999</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-560-ca0510637dca8ce9658a2797626a2a558025ec3c/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126871v3/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-execqueues-noleak:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-560-ca0510637dca8ce9658a2797626a2a558025ec3c/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126871v3/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-560-ca0510637dca8ce9658a2797626a2a558025ec3c/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126871v3/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-560-ca0510637dca8ce9658a2797626a2a558025ec3c -&gt; xe-pw-126871v3</li>
</ul>
<p>IGT_7628: 431c2d2dd5828b25fcbe1c82afbac865f4771aee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-560-ca0510637dca8ce9658a2797626a2a558025ec3c: ca0510637dca8ce9658a2797626a2a558025ec3c<br />
  xe-pw-126871v3: 126871v3</p>

</body>
</html>

--===============6132243484991306255==--

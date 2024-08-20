Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F09C3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 22:21:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40BC610E1BD;
	Tue, 20 Aug 2024 22:21:31 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D25010E1BD;
 Tue, 20 Aug 2024 22:21:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3920855290754979990=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_series_starting_with_=5B01/12=5D?=
 =?utf-8?q?_drm/xe=3A_Removed_unused_xe=5Fggtt=5Fprintk?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Aug 2024 22:21:29 -0000
Message-ID: <172419248956.716831.8130863826101769778@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240820202547.300257-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240820202547.300257-1-rodrigo.vivi@intel.com>
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

--===============3920855290754979990==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [01/12] drm/xe: Removed unused xe_ggtt_printk
URL   : https://patchwork.freedesktop.org/series/137537/
State : failure

== Summary ==

CI Bug Log - changes from xe-1801-50db4c0a8d28ec0d03ea120d17a914265fa47d5c_BAT -> xe-pw-137537v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-137537v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-137537v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-137537v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1801-50db4c0a8d28ec0d03ea120d17a914265fa47d5c/bat-adlp-vf/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137537v1/bat-adlp-vf/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - bat-adlp-7:         [PASS][3] -> [DMESG-WARN][4] +3 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1801-50db4c0a8d28ec0d03ea120d17a914265fa47d5c/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137537v1/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - bat-atsm-2:         [PASS][5] -> [DMESG-WARN][6] +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1801-50db4c0a8d28ec0d03ea120d17a914265fa47d5c/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137537v1/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  
Known issues
------------

  Here are the changes found in xe-pw-137537v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_hdmi_inject@inject-audio:
    - bat-adlp-7:         [PASS][7] -> [DMESG-WARN][8] ([Intel XE#324])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1801-50db4c0a8d28ec0d03ea120d17a914265fa47d5c/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137537v1/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-7:         [PASS][9] -> [SKIP][10] ([Intel XE#1192]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1801-50db4c0a8d28ec0d03ea120d17a914265fa47d5c/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137537v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
    - bat-atsm-2:         [PASS][11] -> [SKIP][12] ([Intel XE#1192]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1801-50db4c0a8d28ec0d03ea120d17a914265fa47d5c/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137537v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
    - bat-adlp-vf:        [PASS][13] -> [SKIP][14] ([Intel XE#1192]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1801-50db4c0a8d28ec0d03ea120d17a914265fa47d5c/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137537v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [FAIL][15] ([Intel XE#886]) -> [PASS][16] +1 other test pass
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1801-50db4c0a8d28ec0d03ea120d17a914265fa47d5c/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137537v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [SKIP][17] ([Intel XE#2229] / [Intel XE#455]) -> [SKIP][18] ([Intel XE#1192])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1801-50db4c0a8d28ec0d03ea120d17a914265fa47d5c/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137537v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
    - bat-adlp-7:         [SKIP][19] ([Intel XE#2229] / [Intel XE#455]) -> [SKIP][20] ([Intel XE#1192])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1801-50db4c0a8d28ec0d03ea120d17a914265fa47d5c/bat-adlp-7/igt@xe_live_ktest@xe_bo.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137537v1/bat-adlp-7/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * IGT: IGT_7980 -> IGT_7981
  * Linux: xe-1801-50db4c0a8d28ec0d03ea120d17a914265fa47d5c -> xe-pw-137537v1

  IGT_7980: 76c81cac2f5108ebc2e7a82ea627aeffb907cf35 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7981: f4e2ada1adec484cf506b5ec7e9acb3ae62228f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1801-50db4c0a8d28ec0d03ea120d17a914265fa47d5c: 50db4c0a8d28ec0d03ea120d17a914265fa47d5c
  xe-pw-137537v1: 137537v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137537v1/index.html

--===============3920855290754979990==
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
<tr><td><b>Series:</b></td><td>series starting with [01/12] drm/xe: Removed unused xe_ggtt_printk</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137537/">https://patchwork.freedesktop.org/series/137537/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137537v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137537v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1801-50db4c0a8d28ec0d03ea120d17a914265fa47d5c_BAT -&gt; xe-pw-137537v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-137537v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-137537v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-137537v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1801-50db4c0a8d28ec0d03ea120d17a914265fa47d5c/bat-adlp-vf/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137537v1/bat-adlp-vf/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1801-50db4c0a8d28ec0d03ea120d17a914265fa47d5c/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137537v1/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1801-50db4c0a8d28ec0d03ea120d17a914265fa47d5c/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137537v1/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137537v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1801-50db4c0a8d28ec0d03ea120d17a914265fa47d5c/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137537v1/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1801-50db4c0a8d28ec0d03ea120d17a914265fa47d5c/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137537v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test skip</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1801-50db4c0a8d28ec0d03ea120d17a914265fa47d5c/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137537v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1801-50db4c0a8d28ec0d03ea120d17a914265fa47d5c/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137537v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1801-50db4c0a8d28ec0d03ea120d17a914265fa47d5c/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137537v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1801-50db4c0a8d28ec0d03ea120d17a914265fa47d5c/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137537v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1801-50db4c0a8d28ec0d03ea120d17a914265fa47d5c/bat-adlp-7/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137537v1/bat-adlp-7/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7980 -&gt; IGT_7981</li>
<li>Linux: xe-1801-50db4c0a8d28ec0d03ea120d17a914265fa47d5c -&gt; xe-pw-137537v1</li>
</ul>
<p>IGT_7980: 76c81cac2f5108ebc2e7a82ea627aeffb907cf35 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7981: f4e2ada1adec484cf506b5ec7e9acb3ae62228f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1801-50db4c0a8d28ec0d03ea120d17a914265fa47d5c: 50db4c0a8d28ec0d03ea120d17a914265fa47d5c<br />
  xe-pw-137537v1: 137537v1</p>

</body>
</html>

--===============3920855290754979990==--

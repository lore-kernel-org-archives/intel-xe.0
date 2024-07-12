Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED426C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 12:24:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE6DA10ECE4;
	Fri, 12 Jul 2024 12:24:01 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A91710ECE4;
 Fri, 12 Jul 2024 12:24:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3279044911884357619=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/display=3A_Re-use_display?=
 =?utf-8?q?_vmas_when_possible?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Jul 2024 12:24:00 -0000
Message-ID: <172078704036.166659.10401591485068338919@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240712113542.153478-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240712113542.153478-1-maarten.lankhorst@linux.intel.com>
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

--===============3279044911884357619==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: Re-use display vmas when possible
URL   : https://patchwork.freedesktop.org/series/136033/
State : success

== Summary ==

CI Bug Log - changes from xe-1603-12d7fd45f021d2077e3381a79dc8bbdff419e4ea_BAT -> xe-pw-136033v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-136033v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - bat-adlp-7:         NOTRUN -> [SKIP][1] ([Intel XE#1932])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136033v1/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - bat-lnl-1:          NOTRUN -> [SKIP][2] ([Intel XE#1091])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136033v1/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - bat-pvc-2:          NOTRUN -> [SKIP][3] ([Intel XE#1932])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136033v1/bat-pvc-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][4] ([Intel XE#1091])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136033v1/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - bat-atsm-2:         NOTRUN -> [SKIP][5] ([Intel XE#1932])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136033v1/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@xe_gt_freq@freq_basic_api:
    - bat-adlp-7:         [PASS][6] -> [FAIL][7] ([Intel XE#2196])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1603-12d7fd45f021d2077e3381a79dc8bbdff419e4ea/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136033v1/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html

  
#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][8] ([Intel XE#324]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1603-12d7fd45f021d2077e3381a79dc8bbdff419e4ea/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136033v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932
  [Intel XE#2196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2196
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324


Build changes
-------------

  * IGT: IGT_7925 -> IGT_7926
  * Linux: xe-1603-12d7fd45f021d2077e3381a79dc8bbdff419e4ea -> xe-pw-136033v1

  IGT_7925: def41c762723c9ba046a3ffe722d046cd12e993d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7926: 9c28c27d4d48cecf8b7692a2975bde1cc1632096 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1603-12d7fd45f021d2077e3381a79dc8bbdff419e4ea: 12d7fd45f021d2077e3381a79dc8bbdff419e4ea
  xe-pw-136033v1: 136033v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136033v1/index.html

--===============3279044911884357619==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: Re-use display vmas when possible</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136033/">https://patchwork.freedesktop.org/series/136033/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136033v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136033v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1603-12d7fd45f021d2077e3381a79dc8bbdff419e4ea_BAT -&gt; xe-pw-136033v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136033v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136033v1/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932">Intel XE#1932</a>)</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136033v1/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>)</li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136033v1/bat-pvc-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932">Intel XE#1932</a>)</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136033v1/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136033v1/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932">Intel XE#1932</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_basic_api:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1603-12d7fd45f021d2077e3381a79dc8bbdff419e4ea/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136033v1/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2196">Intel XE#2196</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1603-12d7fd45f021d2077e3381a79dc8bbdff419e4ea/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136033v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7925 -&gt; IGT_7926</li>
<li>Linux: xe-1603-12d7fd45f021d2077e3381a79dc8bbdff419e4ea -&gt; xe-pw-136033v1</li>
</ul>
<p>IGT_7925: def41c762723c9ba046a3ffe722d046cd12e993d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7926: 9c28c27d4d48cecf8b7692a2975bde1cc1632096 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1603-12d7fd45f021d2077e3381a79dc8bbdff419e4ea: 12d7fd45f021d2077e3381a79dc8bbdff419e4ea<br />
  xe-pw-136033v1: 136033v1</p>

</body>
</html>

--===============3279044911884357619==--

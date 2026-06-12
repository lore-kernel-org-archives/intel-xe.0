Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B26CD98CE
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 06:57:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1895E10F2A9;
	Fri, 12 Jun 2026 06:57:37 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F4710F2A9;
 Fri, 12 Jun 2026 06:57:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2004447466233131946=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_series_starting_with_=5Bv2?=
 =?utf-8?q?=2C1/2=5D_drm/xe=3A_Handle_unprocessed_messages_in_guc=5Fexec=5Fq?=
 =?utf-8?q?ueue=5Ffini?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Jun 2026 06:57:36 -0000
Message-ID: <178124745600.72090.440747617610231248@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260612060120.3795183-1-matthew.brost@intel.com>
In-Reply-To: <20260612060120.3795183-1-matthew.brost@intel.com>
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

--===============2004447466233131946==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v2,1/2] drm/xe: Handle unprocessed messages in guc_exec_queue_fini
URL   : https://patchwork.freedesktop.org/series/168404/
State : failure

== Summary ==

CI Bug Log - changes from xe-5246-9ce63e3d9903982c053b125686abcb7a84357ed4_BAT -> xe-pw-168404v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-168404v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-168404v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-lnl-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-168404v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-atsm-2:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5246-9ce63e3d9903982c053b125686abcb7a84357ed4/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168404v1/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_waitfence@abstime:
    - bat-ptl-2:          [PASS][3] -> [TIMEOUT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5246-9ce63e3d9903982c053b125686abcb7a84357ed4/bat-ptl-2/igt@xe_waitfence@abstime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168404v1/bat-ptl-2/igt@xe_waitfence@abstime.html

  
Known issues
------------

  Here are the changes found in xe-pw-168404v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-1:          [PASS][5] -> [ABORT][6] ([Intel XE#8007])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5246-9ce63e3d9903982c053b125686abcb7a84357ed4/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168404v1/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
    - bat-wcl-1:          [PASS][7] -> [ABORT][8] ([Intel XE#8007])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5246-9ce63e3d9903982c053b125686abcb7a84357ed4/bat-wcl-1/igt@core_hotunplug@unbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168404v1/bat-wcl-1/igt@core_hotunplug@unbind-rebind.html
    - bat-wcl-2:          [PASS][9] -> [ABORT][10] ([Intel XE#8007])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5246-9ce63e3d9903982c053b125686abcb7a84357ed4/bat-wcl-2/igt@core_hotunplug@unbind-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168404v1/bat-wcl-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007


Build changes
-------------

  * Linux: xe-5246-9ce63e3d9903982c053b125686abcb7a84357ed4 -> xe-pw-168404v1

  IGT_8960: 88bd725754990332efcd158b0429f6ac7fb63862 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5246-9ce63e3d9903982c053b125686abcb7a84357ed4: 9ce63e3d9903982c053b125686abcb7a84357ed4
  xe-pw-168404v1: 168404v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168404v1/index.html

--===============2004447466233131946==
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
<tr><td><b>Series:</b></td><td>series starting with [v2,1/2] drm/xe: Handle unprocessed messages in guc_exec_queue_fini</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168404/">https://patchwork.freedesktop.org/series/168404/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168404v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168404v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5246-9ce63e3d9903982c053b125686abcb7a84357ed4_BAT -&gt; xe-pw-168404v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-168404v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-168404v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-lnl-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-168404v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5246-9ce63e3d9903982c053b125686abcb7a84357ed4/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168404v1/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5246-9ce63e3d9903982c053b125686abcb7a84357ed4/bat-ptl-2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168404v1/bat-ptl-2/igt@xe_waitfence@abstime.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-168404v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5246-9ce63e3d9903982c053b125686abcb7a84357ed4/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168404v1/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5246-9ce63e3d9903982c053b125686abcb7a84357ed4/bat-wcl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168404v1/bat-wcl-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5246-9ce63e3d9903982c053b125686abcb7a84357ed4/bat-wcl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168404v1/bat-wcl-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5246-9ce63e3d9903982c053b125686abcb7a84357ed4 -&gt; xe-pw-168404v1</li>
</ul>
<p>IGT_8960: 88bd725754990332efcd158b0429f6ac7fb63862 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5246-9ce63e3d9903982c053b125686abcb7a84357ed4: 9ce63e3d9903982c053b125686abcb7a84357ed4<br />
  xe-pw-168404v1: 168404v1</p>

</body>
</html>

--===============2004447466233131946==--

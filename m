Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C07AC28B20
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 21:48:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC1288697;
	Fri, 28 Mar 2025 21:48:20 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 550D988697;
 Fri, 28 Mar 2025 21:48:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8115345164052957309=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Restore_EIO_errno?=
 =?utf-8?q?_return_when_GuC_PC_start_fails?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Mar 2025 21:48:19 -0000
Message-ID: <174319849933.17146.10662046737628146420@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250328181752.26677-1-rodrigo.vivi@intel.com>
In-Reply-To: <20250328181752.26677-1-rodrigo.vivi@intel.com>
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

--===============8115345164052957309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Restore EIO errno return when GuC PC start fails
URL   : https://patchwork.freedesktop.org/series/146978/
State : success

== Summary ==

CI Bug Log - changes from xe-2873-2e2d39cb4f3dd3465c7bca7b8f2290570e85aa1b_BAT -> xe-pw-146978v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-146978v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_gt_freq@freq_fixed_idle:
    - bat-adlp-vf:        NOTRUN -> [SKIP][1] ([Intel XE#2464]) +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146978v1/bat-adlp-vf/igt@xe_gt_freq@freq_fixed_idle.html

  * igt@xe_intel_bb@intel-bb-blit-x:
    - bat-adlp-vf:        NOTRUN -> [ABORT][2] ([Intel XE#3970])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146978v1/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html

  
#### Possible fixes ####

  * igt@xe_exec_basic@twice-bindexecqueue-rebind:
    - bat-adlp-vf:        [ABORT][3] ([Intel XE#3970]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2873-2e2d39cb4f3dd3465c7bca7b8f2290570e85aa1b/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146978v1/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html

  
  [Intel XE#2464]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2464
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * Linux: xe-2873-2e2d39cb4f3dd3465c7bca7b8f2290570e85aa1b -> xe-pw-146978v1

  IGT_8292: 8292
  xe-2873-2e2d39cb4f3dd3465c7bca7b8f2290570e85aa1b: 2e2d39cb4f3dd3465c7bca7b8f2290570e85aa1b
  xe-pw-146978v1: 146978v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146978v1/index.html

--===============8115345164052957309==
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
<tr><td><b>Series:</b></td><td>drm/xe: Restore EIO errno return when GuC PC start fails</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146978/">https://patchwork.freedesktop.org/series/146978/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146978v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146978v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2873-2e2d39cb4f3dd3465c7bca7b8f2290570e85aa1b_BAT -&gt; xe-pw-146978v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-146978v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146978v1/bat-adlp-vf/igt@xe_gt_freq@freq_fixed_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2464">Intel XE#2464</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-x:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146978v1/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_basic@twice-bindexecqueue-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2873-2e2d39cb4f3dd3465c7bca7b8f2290570e85aa1b/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146978v1/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2873-2e2d39cb4f3dd3465c7bca7b8f2290570e85aa1b -&gt; xe-pw-146978v1</li>
</ul>
<p>IGT_8292: 8292<br />
  xe-2873-2e2d39cb4f3dd3465c7bca7b8f2290570e85aa1b: 2e2d39cb4f3dd3465c7bca7b8f2290570e85aa1b<br />
  xe-pw-146978v1: 146978v1</p>

</body>
</html>

--===============8115345164052957309==--

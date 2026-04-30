Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FE2FF8873
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 15:34:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD5C510E428;
	Thu, 30 Apr 2026 15:34:31 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 197C610E44B;
 Thu, 30 Apr 2026 15:34:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5026497325843267398=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/i915/psr=3A_DC_entry_pr?=
 =?utf-8?q?evention_during_active_vblank_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dibin Moolakadan Subrahmanian" <dibin.moolakadan.subrahmanian@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Apr 2026 15:34:30 -0000
Message-ID: <177756327009.28203.26936809036869886@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260430134505.1728443-1-dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20260430134505.1728443-1-dibin.moolakadan.subrahmanian@intel.com>
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

--===============5026497325843267398==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/psr: DC entry prevention during active vblank (rev2)
URL   : https://patchwork.freedesktop.org/series/165718/
State : failure

== Summary ==

CI Bug Log - changes from xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d_BAT -> xe-pw-165718v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-165718v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-165718v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-165718v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-lnl-1:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165718v2/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html

  


Build changes
-------------

  * IGT: IGT_8879 -> IGT_8880
  * Linux: xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d -> xe-pw-165718v2

  IGT_8879: 02b0e01dd9a5a3ab1efe976bb8c4f13cfcdbab1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8880: 9165f7427801ef00a80fa20f78b05210accfb750 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d: 3ac514cf64f272cc4d5143f4cc28fb18a8aba76d
  xe-pw-165718v2: 165718v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165718v2/index.html

--===============5026497325843267398==
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
<tr><td><b>Series:</b></td><td>drm/i915/psr: DC entry prevention during active vblank (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165718/">https://patchwork.freedesktop.org/series/165718/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165718v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165718v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d_BAT -&gt; xe-pw-165718v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-165718v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-165718v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-165718v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165718v2/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8879 -&gt; IGT_8880</li>
<li>Linux: xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d -&gt; xe-pw-165718v2</li>
</ul>
<p>IGT_8879: 02b0e01dd9a5a3ab1efe976bb8c4f13cfcdbab1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8880: 9165f7427801ef00a80fa20f78b05210accfb750 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d: 3ac514cf64f272cc4d5143f4cc28fb18a8aba76d<br />
  xe-pw-165718v2: 165718v2</p>

</body>
</html>

--===============5026497325843267398==--

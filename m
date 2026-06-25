Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B080CDE001
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 18:00:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA6110E236;
	Thu, 25 Jun 2026 18:00:04 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD9910E236;
 Thu, 25 Jun 2026 18:00:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4087442186965593636=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/hdcp=3A_check_stre?=
 =?utf-8?q?ams=5B=5D_bounds_before_overflow?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Jun 2026 18:00:03 -0000
Message-ID: <178241040363.118243.5856498513952530487@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260625170304.1104723-1-jani.nikula@intel.com>
In-Reply-To: <20260625170304.1104723-1-jani.nikula@intel.com>
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

--===============4087442186965593636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/hdcp: check streams[] bounds before overflow
URL   : https://patchwork.freedesktop.org/series/169210/
State : success

== Summary ==

CI Bug Log - changes from xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e_BAT -> xe-pw-169210v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-lnl-2 

Known issues
------------

  Here are the changes found in xe-pw-169210v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - bat-bmg-3:          [PASS][1] -> [INCOMPLETE][2] ([Intel XE#8439] / [Intel XE#8479]) +4 other tests incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - bat-bmg-3:          [PASS][3] -> [CRASH][4] ([Intel XE#8482])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/bat-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/bat-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  
#### Possible fixes ####

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - bat-bmg-3:          [INCOMPLETE][5] ([Intel XE#8439] / [Intel XE#8479]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/bat-bmg-3/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/bat-bmg-3/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - bat-bmg-3:          [FAIL][7] ([Intel XE#8479]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/bat-bmg-3/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/bat-bmg-3/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  
#### Warnings ####

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - bat-bmg-3:          [CRASH][9] ([Intel XE#8482]) -> [INCOMPLETE][10] ([Intel XE#8439] / [Intel XE#8479])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - bat-bmg-3:          [INCOMPLETE][11] ([Intel XE#8439] / [Intel XE#8479]) -> [CRASH][12] ([Intel XE#8482])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - bat-bmg-3:          [CRASH][13] ([Intel XE#8482]) -> [INCOMPLETE][14] ([Intel XE#8479])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/bat-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/bat-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  
  [Intel XE#8439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439
  [Intel XE#8479]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479
  [Intel XE#8482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8482


Build changes
-------------

  * Linux: xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e -> xe-pw-169210v1

  IGT_8986: 8986
  xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e: e6102c1e8d8afa97ddf3c4b73e36545b518e075e
  xe-pw-169210v1: 169210v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/index.html

--===============4087442186965593636==
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
<tr><td><b>Series:</b></td><td>drm/i915/hdcp: check streams[] bounds before overflow</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169210/">https://patchwork.freedesktop.org/series/169210/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e_BAT -&gt; xe-pw-169210v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-lnl-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-169210v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439">Intel XE#8439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +4 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/bat-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/bat-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8482">Intel XE#8482</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/bat-bmg-3/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439">Intel XE#8439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/bat-bmg-3/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/bat-bmg-3/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/bat-bmg-3/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8482">Intel XE#8482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439">Intel XE#8439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439">Intel XE#8439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8482">Intel XE#8482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/bat-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8482">Intel XE#8482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/bat-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e -&gt; xe-pw-169210v1</li>
</ul>
<p>IGT_8986: 8986<br />
  xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e: e6102c1e8d8afa97ddf3c4b73e36545b518e075e<br />
  xe-pw-169210v1: 169210v1</p>

</body>
</html>

--===============4087442186965593636==--

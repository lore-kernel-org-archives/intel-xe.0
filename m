Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C9FC48BC4
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 19:24:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BDBE10E68B;
	Thu, 15 Feb 2024 19:24:08 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 365B510E68B;
 Thu, 15 Feb 2024 19:24:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2511388164532780584=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Deny_unbinds_if_user_fence_pendi?=
 =?utf-8?q?ng_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Feb 2024 19:24:07 -0000
Message-ID: <170802504722.925.1477371672584319802@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240215181152.450082-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20240215181152.450082-1-mika.kuoppala@linux.intel.com>
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

--===============2511388164532780584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Deny unbinds if user fence pending (rev2)
URL   : https://patchwork.freedesktop.org/series/129957/
State : success

== Summary ==

CI Bug Log - changes from xe-787-6d3abf8f7f55420cf53e9ed344872c459ecfd0ed_BAT -> xe-pw-129957v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-129957v2_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_live_ktest@xe_migrate}:
    - bat-dg2-oem2:       [PASS][1] -> [SKIP][2] +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-787-6d3abf8f7f55420cf53e9ed344872c459ecfd0ed/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129957v2/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html

  
Known issues
------------

  Here are the changes found in xe-pw-129957v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-mixed-threads-small:
    - bat-dg2-oem2:       [PASS][3] -> [DMESG-WARN][4] ([Intel XE#1009])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-787-6d3abf8f7f55420cf53e9ed344872c459ecfd0ed/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129957v2/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small.html

  * igt@xe_exec_threads@threads-basic:
    - bat-dg2-oem2:       [PASS][5] -> [DMESG-WARN][6] ([Intel XE#1232])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-787-6d3abf8f7f55420cf53e9ed344872c459ecfd0ed/bat-dg2-oem2/igt@xe_exec_threads@threads-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129957v2/bat-dg2-oem2/igt@xe_exec_threads@threads-basic.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - bat-pvc-2:          [PASS][7] -> [DMESG-WARN][8] ([Intel XE#1238])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-787-6d3abf8f7f55420cf53e9ed344872c459ecfd0ed/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129957v2/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1009
  [Intel XE#1232]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1232
  [Intel XE#1238]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1238


Build changes
-------------

  * Linux: xe-787-6d3abf8f7f55420cf53e9ed344872c459ecfd0ed -> xe-pw-129957v2

  IGT_7714: 7714
  xe-787-6d3abf8f7f55420cf53e9ed344872c459ecfd0ed: 6d3abf8f7f55420cf53e9ed344872c459ecfd0ed
  xe-pw-129957v2: 129957v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129957v2/index.html

--===============2511388164532780584==
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
<tr><td><b>Series:</b></td><td>Deny unbinds if user fence pending (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129957/">https://patchwork.freedesktop.org/series/129957/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129957v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129957v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-787-6d3abf8f7f55420cf53e9ed344872c459ecfd0ed_BAT -&gt; xe-pw-129957v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-129957v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_live_ktest@xe_migrate}:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-787-6d3abf8f7f55420cf53e9ed344872c459ecfd0ed/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129957v2/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-129957v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-787-6d3abf8f7f55420cf53e9ed344872c459ecfd0ed/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129957v2/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1009">Intel XE#1009</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-787-6d3abf8f7f55420cf53e9ed344872c459ecfd0ed/bat-dg2-oem2/igt@xe_exec_threads@threads-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129957v2/bat-dg2-oem2/igt@xe_exec_threads@threads-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1232">Intel XE#1232</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-basic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-787-6d3abf8f7f55420cf53e9ed344872c459ecfd0ed/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129957v2/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1238">Intel XE#1238</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-787-6d3abf8f7f55420cf53e9ed344872c459ecfd0ed -&gt; xe-pw-129957v2</li>
</ul>
<p>IGT_7714: 7714<br />
  xe-787-6d3abf8f7f55420cf53e9ed344872c459ecfd0ed: 6d3abf8f7f55420cf53e9ed344872c459ecfd0ed<br />
  xe-pw-129957v2: 129957v2</p>

</body>
</html>

--===============2511388164532780584==--

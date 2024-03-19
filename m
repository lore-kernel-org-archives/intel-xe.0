Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D45EC6FD1F
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 18:22:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA2E810E4D3;
	Tue, 19 Mar 2024 18:22:33 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDED710E2AE;
 Tue, 19 Mar 2024 18:22:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7950218405061386239=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5B1/2=5D_d?=
 =?utf-8?q?rm/xe/display=3A_Unify_DPT_mappings?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Mar 2024 18:22:31 -0000
Message-ID: <171087255177.906748.14772118638198459345@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240319170734.156407-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20240319170734.156407-1-juhapekka.heikkila@gmail.com>
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

--===============7950218405061386239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe/display: Unify DPT mappings
URL   : https://patchwork.freedesktop.org/series/131338/
State : success

== Summary ==

CI Bug Log - changes from xe-957-56cad40cf059b2210ef2c7489dc2d69da3864450_BAT -> xe-pw-131338v1_BAT
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

  Here are the changes found in xe-pw-131338v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_threads@threads-basic:
    - bat-dg2-oem2:       [DMESG-WARN][1] ([Intel XE#1232]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-957-56cad40cf059b2210ef2c7489dc2d69da3864450/bat-dg2-oem2/igt@xe_exec_threads@threads-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131338v1/bat-dg2-oem2/igt@xe_exec_threads@threads-basic.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-dg2-oem2:       [SKIP][3] ([Intel XE#1192]) -> [PASS][4] +2 other tests pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-957-56cad40cf059b2210ef2c7489dc2d69da3864450/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131338v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html

  
#### Warnings ####

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-dg2-oem2:       [DMESG-WARN][5] ([Intel XE#1009]) -> [FAIL][6] ([Intel XE#1259])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-957-56cad40cf059b2210ef2c7489dc2d69da3864450/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131338v1/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  
  [Intel XE#1009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1009
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1232]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1232
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259


Build changes
-------------

  * Linux: xe-957-56cad40cf059b2210ef2c7489dc2d69da3864450 -> xe-pw-131338v1

  IGT_7770: fef0422fd296f7c65724315f2a455ffb6959fb0d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-957-56cad40cf059b2210ef2c7489dc2d69da3864450: 56cad40cf059b2210ef2c7489dc2d69da3864450
  xe-pw-131338v1: 131338v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131338v1/index.html

--===============7950218405061386239==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe/display: Unify DPT mappings</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131338/">https://patchwork.freedesktop.org/series/131338/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131338v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131338v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-957-56cad40cf059b2210ef2c7489dc2d69da3864450_BAT -&gt; xe-pw-131338v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-131338v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_threads@threads-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-957-56cad40cf059b2210ef2c7489dc2d69da3864450/bat-dg2-oem2/igt@xe_exec_threads@threads-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1232">Intel XE#1232</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131338v1/bat-dg2-oem2/igt@xe_exec_threads@threads-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-957-56cad40cf059b2210ef2c7489dc2d69da3864450/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131338v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-957-56cad40cf059b2210ef2c7489dc2d69da3864450/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1009">Intel XE#1009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131338v1/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-957-56cad40cf059b2210ef2c7489dc2d69da3864450 -&gt; xe-pw-131338v1</li>
</ul>
<p>IGT_7770: fef0422fd296f7c65724315f2a455ffb6959fb0d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-957-56cad40cf059b2210ef2c7489dc2d69da3864450: 56cad40cf059b2210ef2c7489dc2d69da3864450<br />
  xe-pw-131338v1: 131338v1</p>

</body>
</html>

--===============7950218405061386239==--

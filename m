Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A169F433CD
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 22:50:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0319610E76C;
	Wed, 15 Apr 2026 22:50:03 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF1B10E761;
 Wed, 15 Apr 2026 22:50:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7150381032315907494=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bv11?=
 =?utf-8?q?=2C01/20=5D_gpu=3A_nova-core=3A_gsp=3A_Return_GspStaticInfo_from_?=
 =?utf-8?q?boot=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Apr 2026 22:50:02 -0000
Message-ID: <177629340238.466117.17422548051126746795@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260415210548.3776595-1-joelagnelf@nvidia.com>
In-Reply-To: <20260415210548.3776595-1-joelagnelf@nvidia.com>
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

--===============7150381032315907494==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v11,01/20] gpu: nova-core: gsp: Return GspStaticInfo from boot()
URL   : https://patchwork.freedesktop.org/series/164944/
State : success

== Summary ==

CI Bug Log - changes from xe-4906-45975e225ecbf4cdb6f1283f37f3589101f0a7ac_BAT -> xe-pw-164944v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-164944v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-bmg-2:          NOTRUN -> [SKIP][1] ([Intel XE#2229])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164944v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [ABORT][2] ([Intel XE#7249] / [Intel XE#7578]) -> [PASS][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4906-45975e225ecbf4cdb6f1283f37f3589101f0a7ac/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164944v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#7249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7249
  [Intel XE#7578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578


Build changes
-------------

  * Linux: xe-4906-45975e225ecbf4cdb6f1283f37f3589101f0a7ac -> xe-pw-164944v1

  IGT_8861: 63a08403d58b652dcab80da02d6078386da78c17 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4906-45975e225ecbf4cdb6f1283f37f3589101f0a7ac: 45975e225ecbf4cdb6f1283f37f3589101f0a7ac
  xe-pw-164944v1: 164944v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164944v1/index.html

--===============7150381032315907494==
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
<tr><td><b>Series:</b></td><td>series starting with [v11,01/20] gpu: nova-core: gsp: Return GspStaticInfo from boot()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164944/">https://patchwork.freedesktop.org/series/164944/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164944v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164944v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4906-45975e225ecbf4cdb6f1283f37f3589101f0a7ac_BAT -&gt; xe-pw-164944v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-164944v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164944v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4906-45975e225ecbf4cdb6f1283f37f3589101f0a7ac/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7249">Intel XE#7249</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578">Intel XE#7578</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164944v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4906-45975e225ecbf4cdb6f1283f37f3589101f0a7ac -&gt; xe-pw-164944v1</li>
</ul>
<p>IGT_8861: 63a08403d58b652dcab80da02d6078386da78c17 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4906-45975e225ecbf4cdb6f1283f37f3589101f0a7ac: 45975e225ecbf4cdb6f1283f37f3589101f0a7ac<br />
  xe-pw-164944v1: 164944v1</p>

</body>
</html>

--===============7150381032315907494==--

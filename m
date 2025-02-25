Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5414C021B8
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 16:08:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8BF10E73E;
	Tue, 25 Feb 2025 16:08:30 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFEB510E73D;
 Tue, 25 Feb 2025 16:08:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7628516229312330046=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Fix_fault_mode_in?=
 =?utf-8?q?validation_with_unbind?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Feb 2025 16:08:29 -0000
Message-ID: <174049970978.2015047.9964664284079921470@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250225134426.315876-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250225134426.315876-1-thomas.hellstrom@linux.intel.com>
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

--===============7628516229312330046==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix fault mode invalidation with unbind
URL   : https://patchwork.freedesktop.org/series/145409/
State : success

== Summary ==

CI Bug Log - changes from xe-2710-f4e2e14001a88b8ccb9ac80f06c03dbfeb6fe9db_BAT -> xe-pw-145409v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-145409v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-adlp-vf:        NOTRUN -> [SKIP][1] ([Intel XE#2229] / [Intel XE#455]) +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145409v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-adlp-vf:        NOTRUN -> [SKIP][2] ([Intel XE#2229])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145409v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Possible fixes ####

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [SKIP][3] ([Intel XE#4322]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2710-f4e2e14001a88b8ccb9ac80f06c03dbfeb6fe9db/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145409v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_vm@munmap-style-unbind-end:
    - bat-adlp-vf:        [DMESG-WARN][5] ([Intel XE#3970]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2710-f4e2e14001a88b8ccb9ac80f06c03dbfeb6fe9db/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-end.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145409v1/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-end.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [SKIP][7] ([Intel XE#4322]) -> [SKIP][8] ([Intel XE#2229] / [Intel XE#455])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2710-f4e2e14001a88b8ccb9ac80f06c03dbfeb6fe9db/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145409v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4322
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * Linux: xe-2710-f4e2e14001a88b8ccb9ac80f06c03dbfeb6fe9db -> xe-pw-145409v1

  IGT_8247: 8247
  xe-2710-f4e2e14001a88b8ccb9ac80f06c03dbfeb6fe9db: f4e2e14001a88b8ccb9ac80f06c03dbfeb6fe9db
  xe-pw-145409v1: 145409v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145409v1/index.html

--===============7628516229312330046==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix fault mode invalidation with unbind</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145409/">https://patchwork.freedesktop.org/series/145409/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145409v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145409v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2710-f4e2e14001a88b8ccb9ac80f06c03dbfeb6fe9db_BAT -&gt; xe-pw-145409v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-145409v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145409v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145409v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2710-f4e2e14001a88b8ccb9ac80f06c03dbfeb6fe9db/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4322">Intel XE#4322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145409v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-end:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2710-f4e2e14001a88b8ccb9ac80f06c03dbfeb6fe9db/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-end.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145409v1/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-end.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2710-f4e2e14001a88b8ccb9ac80f06c03dbfeb6fe9db/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4322">Intel XE#4322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145409v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2710-f4e2e14001a88b8ccb9ac80f06c03dbfeb6fe9db -&gt; xe-pw-145409v1</li>
</ul>
<p>IGT_8247: 8247<br />
  xe-2710-f4e2e14001a88b8ccb9ac80f06c03dbfeb6fe9db: f4e2e14001a88b8ccb9ac80f06c03dbfeb6fe9db<br />
  xe-pw-145409v1: 145409v1</p>

</body>
</html>

--===============7628516229312330046==--

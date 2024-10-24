Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A17D2E03E
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 11:15:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D0B10E277;
	Thu, 24 Oct 2024 11:15:51 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6206410E277;
 Thu, 24 Oct 2024 11:15:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0237021114420406388=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EFULL=3A_success_for_drm/i915/xe2lpd=3A_Update_C20_H?=
 =?utf-8?q?DMI_TMDS_algorithm_to_include_tx=5Fmisc_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Oct 2024 11:15:50 -0000
Message-ID: <172976855039.1325996.13907626978322705721@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241023153352.144146-1-gustavo.sousa@intel.com>
In-Reply-To: <20241023153352.144146-1-gustavo.sousa@intel.com>
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

--===============0237021114420406388==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/xe2lpd: Update C20 HDMI TMDS algorithm to include tx_misc (rev2)
URL   : https://patchwork.freedesktop.org/series/140135/
State : success

== Summary ==

CI Bug Log - changes from xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52_full -> xe-pw-140135v2_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52_full and xe-pw-140135v2_full:

### New IGT tests (44) ###

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@many-cm-parallel-basic:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@many-cm-parallel-rebind:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@many-cm-parallel-userptr:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate-race:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@many-cm-parallel-userptr-rebind:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@many-execqueues-cm-parallel-basic:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate-race:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@no-exec-cm-parallel-basic:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@no-exec-cm-parallel-rebind:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@no-exec-cm-parallel-userptr:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@once-cm-parallel-basic:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@once-cm-parallel-rebind:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@once-cm-parallel-userptr:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate-race:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@once-cm-parallel-userptr-rebind:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@twice-cm-parallel-basic:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@twice-cm-parallel-rebind:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@twice-cm-parallel-userptr:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate-race:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_threads@threads-hang-rebind-err:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_threads@threads-hang-userptr-rebind-err:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_threads@threads-rebind-err:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_threads@threads-userptr-rebind-err:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_query@query-cs-cycles:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_query@query-invalid-cs-cycles:
    - Statuses :
    - Exec time: [None] s

  


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8081 -> IGT_8082
  * Linux: xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52 -> xe-pw-140135v2

  IGT_8081: 9b8c0f6da8898f760bfaa2113455eb84b68a69f4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52: beaeaccd284ba3b69b6dbfdc18bb89441fc99a52
  xe-pw-140135v2: 140135v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v2/index.html

--===============0237021114420406388==
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
<tr><td><b>Series:</b></td><td>drm/i915/xe2lpd: Update C20 HDMI TMDS algorithm to include tx_misc (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140135/">https://patchwork.freedesktop.org/series/140135/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52_full -&gt; xe-pw-140135v2_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52_full and xe-pw-140135v2_full:</p>
<h3>New IGT tests (44)</h3>
<ul>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-parallel-basic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-parallel-rebind:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-parallel-userptr:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate-race:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-parallel-userptr-rebind:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-parallel-basic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate-race:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-basic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-rebind:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-userptr:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-parallel-basic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-parallel-rebind:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-parallel-userptr:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate-race:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-parallel-userptr-rebind:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-parallel-basic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-parallel-rebind:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-parallel-userptr:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate-race:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind-err:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-rebind-err:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-rebind-err:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-userptr-rebind-err:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-cs-cycles:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-invalid-cs-cycles:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8081 -&gt; IGT_8082</li>
<li>Linux: xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52 -&gt; xe-pw-140135v2</li>
</ul>
<p>IGT_8081: 9b8c0f6da8898f760bfaa2113455eb84b68a69f4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52: beaeaccd284ba3b69b6dbfdc18bb89441fc99a52<br />
  xe-pw-140135v2: 140135v2</p>

</body>
</html>

--===============0237021114420406388==--

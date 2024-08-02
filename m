Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2905C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  2 Aug 2024 02:42:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A25AD10E06C;
	Fri,  2 Aug 2024 02:42:49 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B93210E07D;
 Fri,  2 Aug 2024 02:42:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3778672443731255790=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/xe2=3A_Introduce_performa?=
 =?utf-8?q?nce_changes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Akshata Jahagirdar" <akshata.jahagirdar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 02 Aug 2024 02:42:48 -0000
Message-ID: <172256656817.490070.9446972493608627032@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1722607628.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1722607628.git.akshata.jahagirdar@intel.com>
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

--===============3778672443731255790==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe2: Introduce performance changes
URL   : https://patchwork.freedesktop.org/series/136821/
State : success

== Summary ==

CI Bug Log - changes from xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5_BAT -> xe-pw-136821v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (6 -> 6)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5_BAT and xe-pw-136821v1_BAT:

### New IGT tests (29) ###

  * igt@xe_create@create-execqueues-leak:
    - Statuses : 3 pass(s)
    - Exec time: [0.12, 0.27] s

  * igt@xe_create@create-execqueues-noleak:
    - Statuses : 3 pass(s)
    - Exec time: [0.14, 0.40] s

  * igt@xe_exec_basic@no-exec-bindexecqueue:
    - Statuses : 3 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@xe_exec_basic@twice-bindexecqueue:
    - Statuses : 3 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@xe_exec_basic@twice-bindexecqueue-rebind:
    - Statuses : 3 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr:
    - Statuses : 3 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate:
    - Statuses : 3 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind:
    - Statuses : 3 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@xe_exec_compute_mode@twice-bindexecqueue:
    - Statuses : 3 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@xe_exec_compute_mode@twice-bindexecqueue-rebind:
    - Statuses : 3 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr:
    - Statuses : 3 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - Statuses : 3 pass(s)
    - Exec time: [1.11, 2.00] s

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind:
    - Statuses : 3 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@xe_exec_fault_mode@twice-bindexecqueue:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_fault_mode@twice-bindexecqueue-imm:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_fault_mode@twice-bindexecqueue-prefetch:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-imm:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-prefetch:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_vm@bind-execqueues-independent:
    - Statuses : 3 pass(s)
    - Exec time: [0.01, 0.07] s

  


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7951 -> IGT_7952
  * Linux: xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5 -> xe-pw-136821v1

  IGT_7951: 7951
  IGT_7952: 7952
  xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5: d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5
  xe-pw-136821v1: 136821v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/index.html

--===============3778672443731255790==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe2: Introduce performance changes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136821/">https://patchwork.freedesktop.org/series/136821/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136821v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5_BAT -&gt; xe-pw-136821v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (6 -&gt; 6)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5_BAT and xe-pw-136821v1_BAT:</p>
<h3>New IGT tests (29)</h3>
<ul>
<li>
<p>igt@xe_create@create-execqueues-leak:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.12, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-execqueues-noleak:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.14, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-rebind:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-rebind:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.11, 2.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-imm:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-prefetch:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-rebind:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-imm:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-prefetch:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-execqueues-independent:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.01, 0.07] s</li>
</ul>
</li>
</ul>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7951 -&gt; IGT_7952</li>
<li>Linux: xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5 -&gt; xe-pw-136821v1</li>
</ul>
<p>IGT_7951: 7951<br />
  IGT_7952: 7952<br />
  xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5: d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5<br />
  xe-pw-136821v1: 136821v1</p>

</body>
</html>

--===============3778672443731255790==--

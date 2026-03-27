Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DD810A62E8
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 02:28:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6185E10EC46;
	Fri, 27 Mar 2026 02:28:32 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1462510E388;
 Fri, 27 Mar 2026 02:28:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0607519923489143573=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_Make_casf_updates_atomic_a?=
 =?utf-8?q?nd_dsb_ready_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Mar 2026 02:28:31 -0000
Message-ID: <177457851105.404029.3440339733723271212@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260326120029.3409676-1-nemesa.garg@intel.com>
In-Reply-To: <20260326120029.3409676-1-nemesa.garg@intel.com>
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

--===============0607519923489143573==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Make casf updates atomic and dsb ready (rev3)
URL   : https://patchwork.freedesktop.org/series/158668/
State : success

== Summary ==

CI Bug Log - changes from xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf_FULL -> xe-pw-158668v3_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf_FULL and xe-pw-158668v3_FULL:

### New IGT tests (62) ###

  * igt@kms_plane_multiple@2x-tiling-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_multiple@2x-tiling-none:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_multiple@2x-tiling-x:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_multiple@2x-tiling-y:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_multiple@2x-tiling-yf:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-no-exec-basic:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-no-exec-null:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - Statuses : 1 skip(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-once-basic:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-once-null:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-once-rebind:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_exec_basic@multigpu-once-userptr:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@xe_exec_basic@multigpu-once-userptr-rebind:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  

Known issues
------------

  Here are the changes found in xe-pw-158668v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][1] -> [FAIL][2] ([Intel XE#7340] / [Intel XE#7504])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158668v3/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#5625])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158668v3/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][5] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158668v3/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7504


Build changes
-------------

  * IGT: IGT_8833 -> IGT_8834
  * Linux: xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf -> xe-pw-158668v3

  IGT_8833: 8833
  IGT_8834: 8834
  xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf: 2ccc868c40a9048ecf287b7bb002d73b5d25c7bf
  xe-pw-158668v3: 158668v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158668v3/index.html

--===============0607519923489143573==
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
<tr><td><b>Series:</b></td><td>Make casf updates atomic and dsb ready (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158668/">https://patchwork.freedesktop.org/series/158668/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158668v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158668v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf_FULL -&gt; xe-pw-158668v3_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf_FULL and xe-pw-158668v3_FULL:</p>
<h3>New IGT tests (62)</h3>
<ul>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-158668v3_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158668v3/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7504">Intel XE#7504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158668v3/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@flip-vs-expired-vblank-interruptible:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158668v3/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8833 -&gt; IGT_8834</li>
<li>Linux: xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf -&gt; xe-pw-158668v3</li>
</ul>
<p>IGT_8833: 8833<br />
  IGT_8834: 8834<br />
  xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf: 2ccc868c40a9048ecf287b7bb002d73b5d25c7bf<br />
  xe-pw-158668v3: 158668v3</p>

</body>
</html>

--===============0607519923489143573==--

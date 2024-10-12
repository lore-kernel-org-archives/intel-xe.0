Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05836D1A45A
	for <intel-xe@archiver.kernel.org>; Sat, 12 Oct 2024 09:27:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A786910E19E;
	Sat, 12 Oct 2024 09:27:59 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACEB310E19E;
 Sat, 12 Oct 2024 09:27:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5452342721023315440=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/sriov=3A_Don=27t_migrate?=
 =?utf-8?q?_dmabuf_BO_to_System_RAM_while_running_in_VM?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vivek Kasireddy" <vivek.kasireddy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 12 Oct 2024 09:27:58 -0000
Message-ID: <172872527870.1243628.10367938313638086580@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241012024524.1377836-1-vivek.kasireddy@intel.com>
In-Reply-To: <20241012024524.1377836-1-vivek.kasireddy@intel.com>
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

--===============5452342721023315440==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/sriov: Don't migrate dmabuf BO to System RAM while running in VM
URL   : https://patchwork.freedesktop.org/series/139920/
State : failure

== Summary ==

CI Bug Log - changes from xe-2054-827aa4badcee32361dc48abbb730de313b50e141_full -> xe-pw-139920v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139920v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139920v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139920v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@many-userptr-imm:
    - shard-lnl:          [PASS][1] -> [ABORT][2] +24 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2054-827aa4badcee32361dc48abbb730de313b50e141/shard-lnl-7/igt@xe_exec_fault_mode@many-userptr-imm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139920v1/shard-lnl-5/igt@xe_exec_fault_mode@many-userptr-imm.html

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate-race:
    - shard-adlp:         [PASS][3] -> [ABORT][4] +24 other tests abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2054-827aa4badcee32361dc48abbb730de313b50e141/shard-adlp-6/igt@xe_exec_threads@threads-mixed-userptr-invalidate-race.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139920v1/shard-adlp-4/igt@xe_exec_threads@threads-mixed-userptr-invalidate-race.html

  * igt@xe_vm@mmap-style-bind-userptr-one-partial:
    - shard-dg2-set2:     [PASS][5] -> [ABORT][6] +24 other tests abort
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2054-827aa4badcee32361dc48abbb730de313b50e141/shard-dg2-435/igt@xe_vm@mmap-style-bind-userptr-one-partial.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139920v1/shard-dg2-433/igt@xe_vm@mmap-style-bind-userptr-one-partial.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind:
    - {shard-bmg}:        [PASS][7] -> [ABORT][8] +24 other tests abort
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2054-827aa4badcee32361dc48abbb730de313b50e141/shard-bmg-8/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139920v1/shard-bmg-7/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html

  
Known issues
------------

  Here are the changes found in xe-pw-139920v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][9] -> [DMESG-WARN][10] ([Intel XE#2953]) +1 other test dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2054-827aa4badcee32361dc48abbb730de313b50e141/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139920v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html

  
#### Possible fixes ####

  * igt@kms_flip@plain-flip-fb-recreate@c-edp1:
    - shard-lnl:          [FAIL][11] ([Intel XE#886]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2054-827aa4badcee32361dc48abbb730de313b50e141/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139920v1/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * Linux: xe-2054-827aa4badcee32361dc48abbb730de313b50e141 -> xe-pw-139920v1

  IGT_8068: 8068
  xe-2054-827aa4badcee32361dc48abbb730de313b50e141: 827aa4badcee32361dc48abbb730de313b50e141
  xe-pw-139920v1: 139920v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139920v1/index.html

--===============5452342721023315440==
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
<tr><td><b>Series:</b></td><td>drm/xe/sriov: Don&#x27;t migrate dmabuf BO to System RAM while running in VM</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139920/">https://patchwork.freedesktop.org/series/139920/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139920v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139920v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2054-827aa4badcee32361dc48abbb730de313b50e141_full -&gt; xe-pw-139920v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139920v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139920v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139920v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2054-827aa4badcee32361dc48abbb730de313b50e141/shard-lnl-7/igt@xe_exec_fault_mode@many-userptr-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139920v1/shard-lnl-5/igt@xe_exec_fault_mode@many-userptr-imm.html">ABORT</a> +24 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2054-827aa4badcee32361dc48abbb730de313b50e141/shard-adlp-6/igt@xe_exec_threads@threads-mixed-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139920v1/shard-adlp-4/igt@xe_exec_threads@threads-mixed-userptr-invalidate-race.html">ABORT</a> +24 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mmap-style-bind-userptr-one-partial:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2054-827aa4badcee32361dc48abbb730de313b50e141/shard-dg2-435/igt@xe_vm@mmap-style-bind-userptr-one-partial.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139920v1/shard-dg2-433/igt@xe_vm@mmap-style-bind-userptr-one-partial.html">ABORT</a> +24 other tests abort</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind:<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2054-827aa4badcee32361dc48abbb730de313b50e141/shard-bmg-8/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139920v1/shard-bmg-7/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html">ABORT</a> +24 other tests abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139920v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@flip-vs-suspend-interruptible:<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2054-827aa4badcee32361dc48abbb730de313b50e141/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139920v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@plain-flip-fb-recreate@c-edp1:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2054-827aa4badcee32361dc48abbb730de313b50e141/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139920v1/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2054-827aa4badcee32361dc48abbb730de313b50e141 -&gt; xe-pw-139920v1</li>
</ul>
<p>IGT_8068: 8068<br />
  xe-2054-827aa4badcee32361dc48abbb730de313b50e141: 827aa4badcee32361dc48abbb730de313b50e141<br />
  xe-pw-139920v1: 139920v1</p>

</body>
</html>

--===============5452342721023315440==--

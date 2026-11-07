Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EFA606A32C
	for <intel-xe@archiver.kernel.org>; Sat,  7 Nov 2026 11:04:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F0710E06A;
	Sat,  7 Nov 2026 11:04:03 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6D610E06A;
 Sat,  7 Nov 2026 11:04:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4963443453102590855=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/i915/display=3A_Limit_?=
 =?utf-8?q?the_eDP_joiner_to_the_pipe_A_and_B_pair?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kahola, Mika" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 07 Nov 2026 11:04:02 -0000
Message-ID: <179404944237.135737.2625588432882219099@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261106094113.2917630-1-mika.kahola@intel.com>
In-Reply-To: <20261106094113.2917630-1-mika.kahola@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4963443453102590855==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Limit the eDP joiner to the pipe A and B pair
URL   : https://patchwork.freedesktop.org/series/177960/
State : failure

== Summary ==

CI Bug Log - changes from xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea_FULL -> xe-pw-177960v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-177960v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-177960v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-177960v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-race:
    - shard-ptl:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-ptl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-race.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-ptl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-race.html
    - shard-lnl:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-race.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-race.html

  
#### Warnings ####

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-ptl:          [DMESG-WARN][5] ([Intel XE#9686]) -> [DMESG-FAIL][6] +1 other test dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-ptl-6/igt@kms_joiner@basic-force-big-joiner.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-ptl-6/igt@kms_joiner@basic-force-big-joiner.html
    - shard-lnl:          [DMESG-WARN][7] ([Intel XE#9686]) -> [DMESG-FAIL][8] +1 other test dmesg-fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-lnl-6/igt@kms_joiner@basic-force-big-joiner.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-lnl-2/igt@kms_joiner@basic-force-big-joiner.html

  
Known issues
------------

  Here are the changes found in xe-pw-177960v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-edp-1:
    - shard-ptl:          [PASS][9] -> [FAIL][10] ([Intel XE#6078]) +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-ptl-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-edp-1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-ptl-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-edp-1.html

  * igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:
    - shard-bmg:          [PASS][11] -> [SKIP][12] ([Intel XE#367])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-bmg-9/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][13] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-bmg-9/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][14] -> [FAIL][15] ([Intel XE#301] / [Intel XE#3149])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][16] -> [SKIP][17] ([Intel XE#1503])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@xe_pm@s4-mocs:
    - shard-ptl:          [PASS][18] -> [ABORT][19] ([Intel XE#9362])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-ptl-1/igt@xe_pm@s4-mocs.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-ptl-6/igt@xe_pm@s4-mocs.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-bmg:          [PASS][20] -> [FAIL][21] ([Intel XE#9254]) +1 other test fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-bmg-3/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  
#### Possible fixes ####

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:
    - shard-bmg:          [SKIP][22] ([Intel XE#8589]) -> [PASS][23] +1 other test pass
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-bmg-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-bmg-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_flip@flip-vs-dpms-on-nop@a-hdmi-a3:
    - shard-bmg:          [FAIL][24] ([Intel XE#3098]) -> [PASS][25] +1 other test pass
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-bmg-8/igt@kms_flip@flip-vs-dpms-on-nop@a-hdmi-a3.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-bmg-3/igt@kms_flip@flip-vs-dpms-on-nop@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [FAIL][26] ([Intel XE#301]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:
    - shard-ptl:          [FAIL][28] ([Intel XE#6293] / [Intel XE#7397]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-ptl-5/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-ptl-1/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - shard-ptl:          [FAIL][30] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][31] +2 other tests pass
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-ptl-2/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-ptl-2/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  * igt@xe_exec_system_allocator@many-malloc-bo-unmap:
    - shard-bmg:          [DMESG-FAIL][32] ([Intel XE#6652]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-bmg-5/igt@xe_exec_system_allocator@many-malloc-bo-unmap.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-bmg-2/igt@xe_exec_system_allocator@many-malloc-bo-unmap.html

  * igt@xe_oa@non-zero-reason-all:
    - shard-ptl:          [FAIL][34] ([Intel XE#7334]) -> [PASS][35] +1 other test pass
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-ptl-6/igt@xe_oa@non-zero-reason-all.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-ptl-6/igt@xe_oa@non-zero-reason-all.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [DMESG-WARN][36] ([Intel XE#7727]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-lnl-5/igt@xe_pm@s4-basic.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-lnl-4/igt@xe_pm@s4-basic.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][38] ([Intel XE#301]) -> [FAIL][39] ([Intel XE#301] / [Intel XE#3149])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#7334]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7334
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#8589]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589
  [Intel XE#9254]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9686]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9686


Build changes
-------------

  * Linux: xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea -> xe-pw-177960v1

  IGT_9180: 9180
  xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea: 7797f00bc4da28646c612b8130ccd5192548ceea
  xe-pw-177960v1: 177960v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/index.html

--===============4963443453102590855==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Limit the eDP joiner to the pipe A and B pair</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177960/">https://patchwork.freedesktop.org/series/177960/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea_FULL -&gt; xe-pw-177960v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-177960v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-177960v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-177960v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-race:<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-ptl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-ptl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-race.html">DMESG-WARN</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-race.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_joiner@basic-force-big-joiner:<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-ptl-6/igt@kms_joiner@basic-force-big-joiner.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9686">Intel XE#9686</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-ptl-6/igt@kms_joiner@basic-force-big-joiner.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-lnl-6/igt@kms_joiner@basic-force-big-joiner.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9686">Intel XE#9686</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-lnl-2/igt@kms_joiner@basic-force-big-joiner.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-177960v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-ptl-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-ptl-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-bmg-9/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-bmg-9/igt@kms_content_protection@atomic@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-ptl-1/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-ptl-6/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-bmg-3/igt@xe_pm_residency@gt-c6-freeze@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254">Intel XE#9254</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-bmg-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-bmg-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-bmg-8/igt@kms_flip@flip-vs-dpms-on-nop@a-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-bmg-3/igt@kms_flip@flip-vs-dpms-on-nop@a-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-ptl-5/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293">Intel XE#6293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-ptl-1/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-ptl-2/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-ptl-2/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-bo-unmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-bmg-5/igt@xe_exec_system_allocator@many-malloc-bo-unmap.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-bmg-2/igt@xe_exec_system_allocator@many-malloc-bo-unmap.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason-all:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-ptl-6/igt@xe_oa@non-zero-reason-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7334">Intel XE#7334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-ptl-6/igt@xe_oa@non-zero-reason-all.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-lnl-5/igt@xe_pm@s4-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-lnl-4/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_flip@flip-vs-expired-vblank-interruptible:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177960v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea -&gt; xe-pw-177960v1</li>
</ul>
<p>IGT_9180: 9180<br />
  xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea: 7797f00bc4da28646c612b8130ccd5192548ceea<br />
  xe-pw-177960v1: 177960v1</p>

</body>
</html>

--===============4963443453102590855==--

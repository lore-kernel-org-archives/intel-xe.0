Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2B4D60D03
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 00:39:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C7D10E588;
	Tue, 19 Nov 2024 00:39:15 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511DA10E588;
 Tue, 19 Nov 2024 00:39:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8467584449501613241=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_UMD_direct_submission_in_Xe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Nov 2024 00:39:14 -0000
Message-ID: <173197675435.107654.13216651601751923491@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241118233757.2374041-1-matthew.brost@intel.com>
In-Reply-To: <20241118233757.2374041-1-matthew.brost@intel.com>
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

--===============8467584449501613241==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: UMD direct submission in Xe
URL   : https://patchwork.freedesktop.org/series/141524/
State : failure

== Summary ==

CI Bug Log - changes from xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6_BAT -> xe-pw-141524v1_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-141524v1_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141524v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141524v1_BAT:

### IGT changes ###

#### Warnings ####

  * igt@xe_exec_fault_mode@many-basic:
    - bat-lnl-2:          [DMESG-FAIL][1] ([Intel XE#3466]) -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/bat-lnl-2/igt@xe_exec_fault_mode@many-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/bat-lnl-2/igt@xe_exec_fault_mode@many-basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-141524v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-adlp-vf:        NOTRUN -> [SKIP][3] ([Intel XE#2229])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][4] ([Intel XE#1033]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [DMESG-FAIL][6] ([Intel XE#358]) -> [PASS][7] +1 other test pass
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#3466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358


Build changes
-------------

  * Linux: xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6 -> xe-pw-141524v1

  IGT_8115: 4942fc57c20f9cb2195e70991c4e4df03dd3db21 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6: 1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6
  xe-pw-141524v1: 141524v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/index.html

--===============8467584449501613241==
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
<tr><td><b>Series:</b></td><td>UMD direct submission in Xe</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141524/">https://patchwork.freedesktop.org/series/141524/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6_BAT -&gt; xe-pw-141524v1_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-141524v1_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-141524v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-141524v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_fault_mode@many-basic:<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/bat-lnl-2/igt@xe_exec_fault_mode@many-basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/bat-lnl-2/igt@xe_exec_fault_mode@many-basic.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141524v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6 -&gt; xe-pw-141524v1</li>
</ul>
<p>IGT_8115: 4942fc57c20f9cb2195e70991c4e4df03dd3db21 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6: 1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6<br />
  xe-pw-141524v1: 141524v1</p>

</body>
</html>

--===============8467584449501613241==--

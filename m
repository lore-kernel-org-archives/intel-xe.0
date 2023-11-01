Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AC2C41535
	for <intel-xe@archiver.kernel.org>; Wed,  1 Nov 2023 17:43:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F133110E75E;
	Wed,  1 Nov 2023 17:43:33 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2C71010E75F;
 Wed,  1 Nov 2023 17:43:32 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 26ADEA0169;
 Wed,  1 Nov 2023 17:43:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8736640843376524462=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Wed, 01 Nov 2023 17:43:32 -0000
Message-ID: <169886061212.29321.17346285207292020274@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231101161157.2102-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231101161157.2102-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A?=
 =?utf-8?q?_Disable_panic=5Fon=5Fwarn_for_testing_purposes?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============8736640843376524462==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Disable panic_on_warn for testing purposes
URL   : https://patchwork.freedesktop.org/series/125858/
State : failure

== Summary ==

CI Bug Log - changes from xe-461-49b8b946bd15ce7c4d19b2c0fde51fed7b7c7db0_BAT -> xe-pw-125858v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-125858v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-125858v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-125858v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_balancer@no-exec-parallel-basic:
    - bat-pvc-2:          NOTRUN -> [DMESG-WARN][1] +2 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125858v1/bat-pvc-2/igt@xe_exec_balancer@no-exec-parallel-basic.html

  * igt@xe_exec_balancer@twice-cm-virtual-rebind:
    - bat-pvc-2:          NOTRUN -> [DMESG-FAIL][2] +1 other test dmesg-fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125858v1/bat-pvc-2/igt@xe_exec_balancer@twice-cm-virtual-rebind.html

  * igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind:
    - bat-pvc-2:          NOTRUN -> [FAIL][3] +2 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125858v1/bat-pvc-2/igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind.html

  * igt@xe_exec_basic@no-exec-basic:
    - bat-pvc-2:          NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125858v1/bat-pvc-2/igt@xe_exec_basic@no-exec-basic.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_exec_basic@no-exec-bindexecqueue}:
    - bat-pvc-2:          NOTRUN -> [INCOMPLETE][5] +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125858v1/bat-pvc-2/igt@xe_exec_basic@no-exec-bindexecqueue.html

  
Known issues
------------

  Here are the changes found in xe-pw-125858v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_balancer@twice-virtual-rebind:
    - bat-pvc-2:          NOTRUN -> [DMESG-FAIL][6] ([Intel XE#696]) +16 other tests dmesg-fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125858v1/bat-pvc-2/igt@xe_exec_balancer@twice-virtual-rebind.html

  
#### Warnings ####

  * igt@xe_live_ktest@migrate:
    - bat-adlp-7:         [INCOMPLETE][7] ([Intel XE#753]) -> [ABORT][8] ([Intel XE#861])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-461-49b8b946bd15ce7c4d19b2c0fde51fed7b7c7db0/bat-adlp-7/igt@xe_live_ktest@migrate.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125858v1/bat-adlp-7/igt@xe_live_ktest@migrate.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#696]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/696
  [Intel XE#753]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/753
  [Intel XE#854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/854
  [Intel XE#855]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/855
  [Intel XE#861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/861


Build changes
-------------

  * Linux: xe-461-49b8b946bd15ce7c4d19b2c0fde51fed7b7c7db0 -> xe-pw-125858v1

  IGT_7568: 9e3c3791e7e0297f277211b19a3388a1ee87f3d0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-461-49b8b946bd15ce7c4d19b2c0fde51fed7b7c7db0: 49b8b946bd15ce7c4d19b2c0fde51fed7b7c7db0
  xe-pw-125858v1: 125858v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125858v1/index.html

--===============8736640843376524462==
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
<tr><td><b>Series:</b></td><td>drm/xe: Disable panic_on_warn for testing purposes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125858/">https://patchwork.freedesktop.org/series/125858/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125858v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125858v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-461-49b8b946bd15ce7c4d19b2c0fde51fed7b7c7db0_BAT -&gt; xe-pw-125858v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-125858v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-125858v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-125858v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_balancer@no-exec-parallel-basic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125858v1/bat-pvc-2/igt@xe_exec_balancer@no-exec-parallel-basic.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-rebind:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125858v1/bat-pvc-2/igt@xe_exec_balancer@twice-cm-virtual-rebind.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125858v1/bat-pvc-2/igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125858v1/bat-pvc-2/igt@xe_exec_basic@no-exec-basic.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_exec_basic@no-exec-bindexecqueue}:<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125858v1/bat-pvc-2/igt@xe_exec_basic@no-exec-bindexecqueue.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-125858v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_balancer@twice-virtual-rebind:<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125858v1/bat-pvc-2/igt@xe_exec_balancer@twice-virtual-rebind.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/696">Intel XE#696</a>) +16 other tests dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@migrate:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-461-49b8b946bd15ce7c4d19b2c0fde51fed7b7c7db0/bat-adlp-7/igt@xe_live_ktest@migrate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/753">Intel XE#753</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125858v1/bat-adlp-7/igt@xe_live_ktest@migrate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/861">Intel XE#861</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-461-49b8b946bd15ce7c4d19b2c0fde51fed7b7c7db0 -&gt; xe-pw-125858v1</li>
</ul>
<p>IGT_7568: 9e3c3791e7e0297f277211b19a3388a1ee87f3d0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-461-49b8b946bd15ce7c4d19b2c0fde51fed7b7c7db0: 49b8b946bd15ce7c4d19b2c0fde51fed7b7c7db0<br />
  xe-pw-125858v1: 125858v1</p>

</body>
</html>

--===============8736640843376524462==--

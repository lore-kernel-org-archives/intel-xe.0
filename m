Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF063C982ED
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 19:28:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637FB10E123;
	Mon, 21 Sep 2026 19:28:22 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908CD10E0A2;
 Mon, 21 Sep 2026 19:28:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8169935414921144224=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_fix_GuC_TLB_inval?=
 =?utf-8?q?idation_ack_stalls_on_ARL_=28Wa=5F22016122933=29_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Tales_A=2E_Mendon=C3=A7a?= <talesam@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Sep 2026 19:28:20 -0000
Message-ID: <179001890058.188435.7456099878037702326@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260921182121.308217-1-talesam@gmail.com>
In-Reply-To: <20260921182121.308217-1-talesam@gmail.com>
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

--===============8169935414921144224==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: fix GuC TLB invalidation ack stalls on ARL (Wa_22016122933) (rev4)
URL   : https://patchwork.freedesktop.org/series/172110/
State : failure

== Summary ==

CI Bug Log - changes from xe-5798-09eeb54bfd2f75118a26ff0226867b0850cd727c_BAT -> xe-pw-172110v4_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-172110v4_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-172110v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-172110v4_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_system_allocator@eu-fault-2m-range-device-host:
    - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5798-09eeb54bfd2f75118a26ff0226867b0850cd727c/bat-bmg-1/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172110v4/bat-bmg-1/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html

  
Known issues
------------

  Here are the changes found in xe-pw-172110v4_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@engine:
    - bat-wcl-1:          [PASS][3] -> [FAIL][4] ([Intel XE#9103])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5798-09eeb54bfd2f75118a26ff0226867b0850cd727c/bat-wcl-1/igt@xe_waitfence@engine.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172110v4/bat-wcl-1/igt@xe_waitfence@engine.html

  
#### Possible fixes ####

  * igt@xe_exec_system_allocator@fault:
    - bat-bmg-1:          [DMESG-WARN][5] -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5798-09eeb54bfd2f75118a26ff0226867b0850cd727c/bat-bmg-1/igt@xe_exec_system_allocator@fault.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172110v4/bat-bmg-1/igt@xe_exec_system_allocator@fault.html

  * igt@xe_exec_system_allocator@many-execqueues-malloc:
    - bat-bmg-vm:         [DMESG-WARN][7] -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5798-09eeb54bfd2f75118a26ff0226867b0850cd727c/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172110v4/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html

  
  [Intel XE#9103]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9103


Build changes
-------------

  * Linux: xe-5798-09eeb54bfd2f75118a26ff0226867b0850cd727c -> xe-pw-172110v4

  IGT_9104: a89d58dad0dd62228269a6049b39fc39ae6cf698 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5798-09eeb54bfd2f75118a26ff0226867b0850cd727c: 09eeb54bfd2f75118a26ff0226867b0850cd727c
  xe-pw-172110v4: 172110v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172110v4/index.html

--===============8169935414921144224==
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
<tr><td><b>Series:</b></td><td>drm/xe: fix GuC TLB invalidation ack stalls on ARL (Wa_22016122933) (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172110/">https://patchwork.freedesktop.org/series/172110/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172110v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172110v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5798-09eeb54bfd2f75118a26ff0226867b0850cd727c_BAT -&gt; xe-pw-172110v4_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-172110v4_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-172110v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-172110v4_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_system_allocator@eu-fault-2m-range-device-host:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5798-09eeb54bfd2f75118a26ff0226867b0850cd727c/bat-bmg-1/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172110v4/bat-bmg-1/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-172110v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5798-09eeb54bfd2f75118a26ff0226867b0850cd727c/bat-wcl-1/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172110v4/bat-wcl-1/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9103">Intel XE#9103</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@fault:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5798-09eeb54bfd2f75118a26ff0226867b0850cd727c/bat-bmg-1/igt@xe_exec_system_allocator@fault.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172110v4/bat-bmg-1/igt@xe_exec_system_allocator@fault.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc:</p>
<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5798-09eeb54bfd2f75118a26ff0226867b0850cd727c/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172110v4/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5798-09eeb54bfd2f75118a26ff0226867b0850cd727c -&gt; xe-pw-172110v4</li>
</ul>
<p>IGT_9104: a89d58dad0dd62228269a6049b39fc39ae6cf698 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5798-09eeb54bfd2f75118a26ff0226867b0850cd727c: 09eeb54bfd2f75118a26ff0226867b0850cd727c<br />
  xe-pw-172110v4: 172110v4</p>

</body>
</html>

--===============8169935414921144224==--

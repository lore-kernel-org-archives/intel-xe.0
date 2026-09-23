Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22EAC98302
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 01:25:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3CA10E7AC;
	Wed, 23 Sep 2026 01:25:37 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7A210E7AC;
 Wed, 23 Sep 2026 01:25:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4207169373753104788=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Use_SIG=5FID_logs_for_GuC_c?=
 =?utf-8?q?omponent_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 23 Sep 2026 01:25:36 -0000
Message-ID: <179012673623.195309.15114751507869182829@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260922231758.2695562-9-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20260922231758.2695562-9-umesh.nerlige.ramappa@intel.com>
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

--===============4207169373753104788==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Use SIG_ID logs for GuC component (rev5)
URL   : https://patchwork.freedesktop.org/series/173177/
State : success

== Summary ==

CI Bug Log - changes from xe-5809-3413ca5893855693d3cc12697713842547261439_BAT -> xe-pw-173177v5_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-173177v5_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_system_allocator@many-execqueues-free:
    - bat-bmg-vm:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#9331])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5809-3413ca5893855693d3cc12697713842547261439/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v5/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc:
    - bat-bmg-1:          [PASS][3] -> [DMESG-WARN][4] ([Intel XE#9331]) +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5809-3413ca5893855693d3cc12697713842547261439/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v5/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html

  
#### Possible fixes ####

  * igt@xe_exec_fault_mode@twice-basic:
    - bat-bmg-1:          [DMESG-WARN][5] ([Intel XE#9331]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5809-3413ca5893855693d3cc12697713842547261439/bat-bmg-1/igt@xe_exec_fault_mode@twice-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v5/bat-bmg-1/igt@xe_exec_fault_mode@twice-basic.html

  * igt@xe_exec_system_allocator@madvise-atomic-inc:
    - bat-bmg-vm:         [DMESG-WARN][7] ([Intel XE#9331]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5809-3413ca5893855693d3cc12697713842547261439/bat-bmg-vm/igt@xe_exec_system_allocator@madvise-atomic-inc.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v5/bat-bmg-vm/igt@xe_exec_system_allocator@madvise-atomic-inc.html

  
  [Intel XE#9331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331


Build changes
-------------

  * Linux: xe-5809-3413ca5893855693d3cc12697713842547261439 -> xe-pw-173177v5

  IGT_9109: 65f84b280be2caf8ce376295d97987a808affdee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5809-3413ca5893855693d3cc12697713842547261439: 3413ca5893855693d3cc12697713842547261439
  xe-pw-173177v5: 173177v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v5/index.html

--===============4207169373753104788==
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
<tr><td><b>Series:</b></td><td>Use SIG_ID logs for GuC component (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173177/">https://patchwork.freedesktop.org/series/173177/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5809-3413ca5893855693d3cc12697713842547261439_BAT -&gt; xe-pw-173177v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-173177v5_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-free:</p>
<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5809-3413ca5893855693d3cc12697713842547261439/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v5/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5809-3413ca5893855693d3cc12697713842547261439/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v5/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-basic:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5809-3413ca5893855693d3cc12697713842547261439/bat-bmg-1/igt@xe_exec_fault_mode@twice-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v5/bat-bmg-1/igt@xe_exec_fault_mode@twice-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@madvise-atomic-inc:</p>
<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5809-3413ca5893855693d3cc12697713842547261439/bat-bmg-vm/igt@xe_exec_system_allocator@madvise-atomic-inc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173177v5/bat-bmg-vm/igt@xe_exec_system_allocator@madvise-atomic-inc.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5809-3413ca5893855693d3cc12697713842547261439 -&gt; xe-pw-173177v5</li>
</ul>
<p>IGT_9109: 65f84b280be2caf8ce376295d97987a808affdee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5809-3413ca5893855693d3cc12697713842547261439: 3413ca5893855693d3cc12697713842547261439<br />
  xe-pw-173177v5: 173177v5</p>

</body>
</html>

--===============4207169373753104788==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF5EC02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 07:57:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C56F510E788;
	Thu, 23 Jan 2025 07:57:15 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7500310E788;
 Thu, 23 Jan 2025 07:57:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4650947586742273207=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_Add_WA?=
 =?utf-8?q?=5F14018221282_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 Jan 2025 07:57:14 -0000
Message-ID: <173761903446.3420134.5220174573951899501@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241226060632.213790-1-nemesa.garg@intel.com>
In-Reply-To: <20241226060632.213790-1-nemesa.garg@intel.com>
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

--===============4650947586742273207==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Add WA_14018221282 (rev4)
URL   : https://patchwork.freedesktop.org/series/142469/
State : success

== Summary ==

CI Bug Log - changes from xe-2535-cb1c4020e51585b89363590a56869836e1466b75_BAT -> xe-pw-142469v4_BAT
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

  Here are the changes found in xe-pw-142469v4_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_balancer@twice-virtual-rebind:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4078]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2535-cb1c4020e51585b89363590a56869836e1466b75/bat-adlp-vf/igt@xe_exec_balancer@twice-virtual-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142469v4/bat-adlp-vf/igt@xe_exec_balancer@twice-virtual-rebind.html

  
#### Possible fixes ####

  * igt@xe_vm@munmap-style-unbind-end:
    - bat-adlp-vf:        [DMESG-WARN][3] ([Intel XE#4078]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2535-cb1c4020e51585b89363590a56869836e1466b75/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-end.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142469v4/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-end.html

  
  [Intel XE#4078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078


Build changes
-------------

  * Linux: xe-2535-cb1c4020e51585b89363590a56869836e1466b75 -> xe-pw-142469v4

  IGT_8207: 9f36f9f9e8825a67b762630c2b31628ddcda5c10 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2535-cb1c4020e51585b89363590a56869836e1466b75: cb1c4020e51585b89363590a56869836e1466b75
  xe-pw-142469v4: 142469v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142469v4/index.html

--===============4650947586742273207==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Add WA_14018221282 (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142469/">https://patchwork.freedesktop.org/series/142469/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142469v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142469v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2535-cb1c4020e51585b89363590a56869836e1466b75_BAT -&gt; xe-pw-142469v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142469v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_balancer@twice-virtual-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2535-cb1c4020e51585b89363590a56869836e1466b75/bat-adlp-vf/igt@xe_exec_balancer@twice-virtual-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142469v4/bat-adlp-vf/igt@xe_exec_balancer@twice-virtual-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078">Intel XE#4078</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_vm@munmap-style-unbind-end:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2535-cb1c4020e51585b89363590a56869836e1466b75/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-end.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078">Intel XE#4078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142469v4/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-end.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2535-cb1c4020e51585b89363590a56869836e1466b75 -&gt; xe-pw-142469v4</li>
</ul>
<p>IGT_8207: 9f36f9f9e8825a67b762630c2b31628ddcda5c10 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2535-cb1c4020e51585b89363590a56869836e1466b75: cb1c4020e51585b89363590a56869836e1466b75<br />
  xe-pw-142469v4: 142469v4</p>

</body>
</html>

--===============4650947586742273207==--

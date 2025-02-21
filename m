Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EC2C021B6
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 22:18:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7379710EB43;
	Fri, 21 Feb 2025 22:18:18 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB54D10EB40;
 Fri, 21 Feb 2025 22:18:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8914533496811965576=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/oa=3A_Allow_oa=5Fexp?=
 =?utf-8?q?onent_value_of_0_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Feb 2025 22:18:17 -0000
Message-ID: <174017629795.585683.11847410054833438578@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250221212321.1712156-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20250221212321.1712156-1-umesh.nerlige.ramappa@intel.com>
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

--===============8914533496811965576==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/oa: Allow oa_exponent value of 0 (rev3)
URL   : https://patchwork.freedesktop.org/series/144685/
State : success

== Summary ==

CI Bug Log - changes from xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88_BAT -> xe-pw-144685v3_BAT
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

  Here are the changes found in xe-pw-144685v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_basic@twice-rebind:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3970])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88/bat-adlp-vf/igt@xe_exec_basic@twice-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144685v3/bat-adlp-vf/igt@xe_exec_basic@twice-rebind.html

  
#### Possible fixes ####

  * igt@xe_intel_bb@intel-bb-blit-x:
    - bat-adlp-vf:        [DMESG-WARN][3] ([Intel XE#3970]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144685v3/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * Linux: xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88 -> xe-pw-144685v3

  IGT_8246: 2670886863d5821273146d7f94cdd3c8e3a4fe0b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88: f2a2bd676bde0942c9dfe5c55d54eec298260f88
  xe-pw-144685v3: 144685v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144685v3/index.html

--===============8914533496811965576==
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
<tr><td><b>Series:</b></td><td>drm/xe/oa: Allow oa_exponent value of 0 (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144685/">https://patchwork.freedesktop.org/series/144685/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144685v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144685v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88_BAT -&gt; xe-pw-144685v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144685v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_basic@twice-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88/bat-adlp-vf/igt@xe_exec_basic@twice-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144685v3/bat-adlp-vf/igt@xe_exec_basic@twice-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_intel_bb@intel-bb-blit-x:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144685v3/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88 -&gt; xe-pw-144685v3</li>
</ul>
<p>IGT_8246: 2670886863d5821273146d7f94cdd3c8e3a4fe0b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88: f2a2bd676bde0942c9dfe5c55d54eec298260f88<br />
  xe-pw-144685v3: 144685v3</p>

</body>
</html>

--===============8914533496811965576==--

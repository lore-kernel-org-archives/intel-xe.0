Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B601C02192
	for <intel-xe@archiver.kernel.org>; Wed,  5 Feb 2025 20:35:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB7010E3E5;
	Wed,  5 Feb 2025 20:35:03 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A94C10E3E5;
 Wed,  5 Feb 2025 20:35:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6168166026760030635=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_VF=3A_Avoid_reading_inacces?=
 =?utf-8?q?sible_RING=5FTIMESTAMP_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marcin Bernatowicz" <marcin.bernatowicz@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Feb 2025 20:35:02 -0000
Message-ID: <173878770236.1602135.1781264436444830903@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250205191644.2550879-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250205191644.2550879-1-marcin.bernatowicz@linux.intel.com>
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

--===============6168166026760030635==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: VF: Avoid reading inaccessible RING_TIMESTAMP (rev2)
URL   : https://patchwork.freedesktop.org/series/144335/
State : success

== Summary ==

CI Bug Log - changes from xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe_BAT -> xe-pw-144335v2_BAT
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

  Here are the changes found in xe-pw-144335v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_basic@twice-bindexecqueue-rebind:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-FAIL][2] ([Intel XE#3868])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html

  * igt@xe_pat@pat-index-xelp@render:
    - bat-adlp-vf:        [PASS][3] -> [DMESG-WARN][4] ([Intel XE#3970]) +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html

  
#### Possible fixes ####

  * igt@xe_exec_balancer@twice-virtual-rebind:
    - bat-adlp-vf:        [DMESG-WARN][5] ([Intel XE#3970]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/bat-adlp-vf/igt@xe_exec_balancer@twice-virtual-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/bat-adlp-vf/igt@xe_exec_balancer@twice-virtual-rebind.html

  
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * Linux: xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe -> xe-pw-144335v2

  IGT_8224: c659b986ba648584d36b3cfece897bc84a33dcbb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe: 5592bc56322b20198056d88dd12fc86ebb0dfcbe
  xe-pw-144335v2: 144335v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/index.html

--===============6168166026760030635==
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
<tr><td><b>Series:</b></td><td>VF: Avoid reading inaccessible RING_TIMESTAMP (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144335/">https://patchwork.freedesktop.org/series/144335/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe_BAT -&gt; xe-pw-144335v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144335v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-rebind:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@render:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_balancer@twice-virtual-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/bat-adlp-vf/igt@xe_exec_balancer@twice-virtual-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/bat-adlp-vf/igt@xe_exec_balancer@twice-virtual-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe -&gt; xe-pw-144335v2</li>
</ul>
<p>IGT_8224: c659b986ba648584d36b3cfece897bc84a33dcbb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe: 5592bc56322b20198056d88dd12fc86ebb0dfcbe<br />
  xe-pw-144335v2: 144335v2</p>

</body>
</html>

--===============6168166026760030635==--

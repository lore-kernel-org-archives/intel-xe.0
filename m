Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4E5E77188
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 13:15:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E031110E021;
	Tue, 14 Jan 2025 13:15:01 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE3A10E021;
 Tue, 14 Jan 2025 13:15:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5553626855774173212=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/xe3=3A_FBC_Dirty_r?=
 =?utf-8?q?ect_feature_support_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 14 Jan 2025 13:15:00 -0000
Message-ID: <173686050089.3601352.10656453181081450440@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250114120719.191372-1-vinod.govindapillai@intel.com>
In-Reply-To: <20250114120719.191372-1-vinod.govindapillai@intel.com>
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

--===============5553626855774173212==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/xe3: FBC Dirty rect feature support (rev3)
URL   : https://patchwork.freedesktop.org/series/141526/
State : success

== Summary ==

CI Bug Log - changes from xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab_BAT -> xe-pw-141526v3_BAT
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

  Here are the changes found in xe-pw-141526v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_intel_bb@render@render-linear-256:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3958]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/bat-adlp-vf/igt@xe_intel_bb@render@render-linear-256.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/bat-adlp-vf/igt@xe_intel_bb@render@render-linear-256.html

  * igt@xe_pat@pat-index-xelp@render:
    - bat-adlp-vf:        [PASS][3] -> [DMESG-WARN][4] ([Intel XE#3970]) +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html

  
#### Possible fixes ####

  * igt@xe_exec_balancer@twice-parallel-userptr-rebind:
    - bat-adlp-vf:        [DMESG-WARN][5] ([Intel XE#3958]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/bat-adlp-vf/igt@xe_exec_balancer@twice-parallel-userptr-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/bat-adlp-vf/igt@xe_exec_balancer@twice-parallel-userptr-rebind.html

  * igt@xe_exec_basic@twice-bindexecqueue-rebind:
    - bat-adlp-vf:        [DMESG-WARN][7] -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html

  * igt@xe_module_load@load:
    - bat-bmg-1:          [DMESG-WARN][9] ([Intel XE#877]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/bat-bmg-1/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/bat-bmg-1/igt@xe_module_load@load.html

  
  [Intel XE#3958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3958
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * Linux: xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab -> xe-pw-141526v3

  IGT_8189: e036190dc1730ecb94cb393f88378e734db4b1d6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab: 637fb849e35fb66d1acdface4708b8a54a093eab
  xe-pw-141526v3: 141526v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/index.html

--===============5553626855774173212==
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
<tr><td><b>Series:</b></td><td>drm/i915/xe3: FBC Dirty rect feature support (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141526/">https://patchwork.freedesktop.org/series/141526/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab_BAT -&gt; xe-pw-141526v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141526v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_intel_bb@render@render-linear-256:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/bat-adlp-vf/igt@xe_intel_bb@render@render-linear-256.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/bat-adlp-vf/igt@xe_intel_bb@render@render-linear-256.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3958">Intel XE#3958</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@render:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_balancer@twice-parallel-userptr-rebind:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/bat-adlp-vf/igt@xe_exec_balancer@twice-parallel-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3958">Intel XE#3958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/bat-adlp-vf/igt@xe_exec_balancer@twice-parallel-userptr-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-rebind:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab/bat-bmg-1/igt@xe_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v3/bat-bmg-1/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab -&gt; xe-pw-141526v3</li>
</ul>
<p>IGT_8189: e036190dc1730ecb94cb393f88378e734db4b1d6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2481-637fb849e35fb66d1acdface4708b8a54a093eab: 637fb849e35fb66d1acdface4708b8a54a093eab<br />
  xe-pw-141526v3: 141526v3</p>

</body>
</html>

--===============5553626855774173212==--

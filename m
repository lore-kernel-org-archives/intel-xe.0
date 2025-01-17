Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BCBC02183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 23:06:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA96410E0BD;
	Fri, 17 Jan 2025 23:06:44 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C4910E0BD;
 Fri, 17 Jan 2025 23:06:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6015470688972393482=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/dmc=5Fwl=3A_Introd?=
 =?utf-8?q?uce_debugfs_interface?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Jan 2025 23:06:44 -0000
Message-ID: <173715520439.909766.18039467234613533957@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250117220747.87927-1-gustavo.sousa@intel.com>
In-Reply-To: <20250117220747.87927-1-gustavo.sousa@intel.com>
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

--===============6015470688972393482==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dmc_wl: Introduce debugfs interface
URL   : https://patchwork.freedesktop.org/series/143695/
State : success

== Summary ==

CI Bug Log - changes from xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4_BAT -> xe-pw-143695v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-143695v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_intel_bb@render@render-ymajor-256:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4078]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/bat-adlp-vf/igt@xe_intel_bb@render@render-ymajor-256.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/bat-adlp-vf/igt@xe_intel_bb@render@render-ymajor-256.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [PASS][3] -> [SKIP][4] ([Intel XE#1192]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_pat@pat-index-xelp@render:
    - bat-adlp-vf:        [PASS][5] -> [DMESG-WARN][6] ([Intel XE#3970] / [Intel XE#4078]) +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [SKIP][7] ([Intel XE#2229] / [Intel XE#455]) -> [SKIP][8] ([Intel XE#1192])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * Linux: xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4 -> xe-pw-143695v1

  IGT_8198: 1d1ae626601119d249b530547b9e226c6a684144 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4: 4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4
  xe-pw-143695v1: 143695v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/index.html

--===============6015470688972393482==
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
<tr><td><b>Series:</b></td><td>drm/i915/dmc_wl: Introduce debugfs interface</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143695/">https://patchwork.freedesktop.org/series/143695/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4_BAT -&gt; xe-pw-143695v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-143695v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_intel_bb@render@render-ymajor-256:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/bat-adlp-vf/igt@xe_intel_bb@render@render-ymajor-256.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/bat-adlp-vf/igt@xe_intel_bb@render@render-ymajor-256.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078">Intel XE#4078</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@render:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078">Intel XE#4078</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143695v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4 -&gt; xe-pw-143695v1</li>
</ul>
<p>IGT_8198: 1d1ae626601119d249b530547b9e226c6a684144 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2510-4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4: 4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4<br />
  xe-pw-143695v1: 143695v1</p>

</body>
</html>

--===============6015470688972393482==--

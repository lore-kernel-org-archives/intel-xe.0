Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEF9C282C1
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 16:18:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B24310ECEB;
	Fri, 28 Feb 2025 16:18:42 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287CD10ECEB;
 Fri, 28 Feb 2025 16:18:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9037061282505671510=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/2?=
 =?utf-8?q?=5D_drm/xe/compat=3A_refactor_compat_i915=5Fdrv=2Eh?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Feb 2025 16:18:40 -0000
Message-ID: <174075952013.3255082.7732028813073809461@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250228142539.3216960-1-jani.nikula@intel.com>
In-Reply-To: <20250228142539.3216960-1-jani.nikula@intel.com>
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

--===============9037061282505671510==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe/compat: refactor compat i915_drv.h
URL   : https://patchwork.freedesktop.org/series/145647/
State : success

== Summary ==

CI Bug Log - changes from xe-2733-4e4a83bc30b77bb710641f0b43e6098bd04c5044_BAT -> xe-pw-145647v1_BAT
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

  Here are the changes found in xe-pw-145647v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-FAIL][2] ([Intel XE#3890] / [Intel XE#3970]) +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2733-4e4a83bc30b77bb710641f0b43e6098bd04c5044/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145647v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  
  [Intel XE#3890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3890
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * IGT: IGT_8253 -> IGT_8254
  * Linux: xe-2733-4e4a83bc30b77bb710641f0b43e6098bd04c5044 -> xe-pw-145647v1

  IGT_8253: b747eebcc6f4b6729ae171490e52725e9fb13b89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8254: bd401847a539540b59959c959888770778139cce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2733-4e4a83bc30b77bb710641f0b43e6098bd04c5044: 4e4a83bc30b77bb710641f0b43e6098bd04c5044
  xe-pw-145647v1: 145647v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145647v1/index.html

--===============9037061282505671510==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe/compat: refactor compat i915_drv.h</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145647/">https://patchwork.freedesktop.org/series/145647/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145647v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145647v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2733-4e4a83bc30b77bb710641f0b43e6098bd04c5044_BAT -&gt; xe-pw-145647v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-145647v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_migrate:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2733-4e4a83bc30b77bb710641f0b43e6098bd04c5044/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145647v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3890">Intel XE#3890</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8253 -&gt; IGT_8254</li>
<li>Linux: xe-2733-4e4a83bc30b77bb710641f0b43e6098bd04c5044 -&gt; xe-pw-145647v1</li>
</ul>
<p>IGT_8253: b747eebcc6f4b6729ae171490e52725e9fb13b89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8254: bd401847a539540b59959c959888770778139cce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2733-4e4a83bc30b77bb710641f0b43e6098bd04c5044: 4e4a83bc30b77bb710641f0b43e6098bd04c5044<br />
  xe-pw-145647v1: 145647v1</p>

</body>
</html>

--===============9037061282505671510==--

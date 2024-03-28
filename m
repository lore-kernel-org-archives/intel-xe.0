Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9A5C54E67
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 11:31:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39DB810F562;
	Thu, 28 Mar 2024 11:31:25 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19B010F562;
 Thu, 28 Mar 2024 11:31:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5862982517901482038=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/i915=3A_use_fine_grained_-Wo?=
 =?utf-8?q?verride-init_disable?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 28 Mar 2024 11:31:23 -0000
Message-ID: <171162548372.1061727.1868605729566970337@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240328102455.944131-1-jani.nikula@intel.com>
In-Reply-To: <20240328102455.944131-1-jani.nikula@intel.com>
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

--===============5862982517901482038==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: use fine grained -Woverride-init disable
URL   : https://patchwork.freedesktop.org/series/131752/
State : success

== Summary ==

CI Bug Log - changes from xe-1005-8d398ffc40ac37d1589214c28b69c651c1a20792_BAT -> xe-pw-131752v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-131752v1_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@xe_evict@evict-cm-threads-small:
    - bat-dg2-oem2:       [INCOMPLETE][1] ([Intel XE#1027] / [Intel XE#804]) -> [INCOMPLETE][2] ([Intel XE#804])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1005-8d398ffc40ac37d1589214c28b69c651c1a20792/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131752v1/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate:
    - bat-adlp-7:         [INCOMPLETE][3] ([Intel XE#1044] / [Intel XE#1376]) -> [INCOMPLETE][4] ([Intel XE#1044] / [Intel XE#1169])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1005-8d398ffc40ac37d1589214c28b69c651c1a20792/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131752v1/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html

  
  [Intel XE#1027]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1027
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376
  [Intel XE#804]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/804


Build changes
-------------

  * IGT: IGT_7786 -> IGT_7787
  * Linux: xe-1005-8d398ffc40ac37d1589214c28b69c651c1a20792 -> xe-pw-131752v1

  IGT_7786: 1e4a3cd0a4bb3419fb70ed3e01259485b056dcfd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7787: 7787
  xe-1005-8d398ffc40ac37d1589214c28b69c651c1a20792: 8d398ffc40ac37d1589214c28b69c651c1a20792
  xe-pw-131752v1: 131752v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131752v1/index.html

--===============5862982517901482038==
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
<tr><td><b>Series:</b></td><td>drm/i915: use fine grained -Woverride-init disable</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131752/">https://patchwork.freedesktop.org/series/131752/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131752v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131752v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1005-8d398ffc40ac37d1589214c28b69c651c1a20792_BAT -&gt; xe-pw-131752v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-131752v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_evict@evict-cm-threads-small:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1005-8d398ffc40ac37d1589214c28b69c651c1a20792/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1027">Intel XE#1027</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/804">Intel XE#804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131752v1/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/804">Intel XE#804</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-invalidate:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1005-8d398ffc40ac37d1589214c28b69c651c1a20792/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376">Intel XE#1376</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131752v1/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7786 -&gt; IGT_7787</li>
<li>Linux: xe-1005-8d398ffc40ac37d1589214c28b69c651c1a20792 -&gt; xe-pw-131752v1</li>
</ul>
<p>IGT_7786: 1e4a3cd0a4bb3419fb70ed3e01259485b056dcfd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7787: 7787<br />
  xe-1005-8d398ffc40ac37d1589214c28b69c651c1a20792: 8d398ffc40ac37d1589214c28b69c651c1a20792<br />
  xe-pw-131752v1: 131752v1</p>

</body>
</html>

--===============5862982517901482038==--

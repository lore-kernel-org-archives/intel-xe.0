Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7A6C5CFCF
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 14:20:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D88F10E560;
	Fri, 14 Aug 2026 14:20:29 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E009E10E560;
 Fri, 14 Aug 2026 14:20:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6030148825368965765=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/ttm=3A_Represent_LRU_bu?=
 =?utf-8?q?lk_moves_as_nested_sublists_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Aug 2026 14:20:27 -0000
Message-ID: <178671722791.52535.11931067450771809688@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260814133231.3193-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260814133231.3193-1-thomas.hellstrom@linux.intel.com>
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

--===============6030148825368965765==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/ttm: Represent LRU bulk moves as nested sublists (rev3)
URL   : https://patchwork.freedesktop.org/series/170311/
State : failure

== Summary ==

CI Bug Log - changes from xe-5597-146f84b5515392408954060b5b684844c23256e9_BAT -> xe-pw-170311v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-170311v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-170311v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-170311v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@fbdev@write:
    - bat-wcl-1:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5597-146f84b5515392408954060b5b684844c23256e9/bat-wcl-1/igt@fbdev@write.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170311v3/bat-wcl-1/igt@fbdev@write.html

  
Known issues
------------

  Here are the changes found in xe-pw-170311v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-nvls-1:         [PASS][3] -> [DMESG-WARN][4] ([Intel XE#8762])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5597-146f84b5515392408954060b5b684844c23256e9/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170311v3/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_module_load@load:
    - bat-wcl-1:          [PASS][5] -> [DMESG-WARN][6] ([Intel XE#8551])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5597-146f84b5515392408954060b5b684844c23256e9/bat-wcl-1/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170311v3/bat-wcl-1/igt@xe_module_load@load.html

  
  [Intel XE#8551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8551
  [Intel XE#8762]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762


Build changes
-------------

  * Linux: xe-5597-146f84b5515392408954060b5b684844c23256e9 -> xe-pw-170311v3

  IGT_9056: 9056
  xe-5597-146f84b5515392408954060b5b684844c23256e9: 146f84b5515392408954060b5b684844c23256e9
  xe-pw-170311v3: 170311v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170311v3/index.html

--===============6030148825368965765==
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
<tr><td><b>Series:</b></td><td>drm/ttm: Represent LRU bulk moves as nested sublists (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170311/">https://patchwork.freedesktop.org/series/170311/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170311v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170311v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5597-146f84b5515392408954060b5b684844c23256e9_BAT -&gt; xe-pw-170311v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-170311v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-170311v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-170311v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@fbdev@write:<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5597-146f84b5515392408954060b5b684844c23256e9/bat-wcl-1/igt@fbdev@write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170311v3/bat-wcl-1/igt@fbdev@write.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-170311v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5597-146f84b5515392408954060b5b684844c23256e9/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170311v3/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762">Intel XE#8762</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5597-146f84b5515392408954060b5b684844c23256e9/bat-wcl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170311v3/bat-wcl-1/igt@xe_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8551">Intel XE#8551</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5597-146f84b5515392408954060b5b684844c23256e9 -&gt; xe-pw-170311v3</li>
</ul>
<p>IGT_9056: 9056<br />
  xe-5597-146f84b5515392408954060b5b684844c23256e9: 146f84b5515392408954060b5b684844c23256e9<br />
  xe-pw-170311v3: 170311v3</p>

</body>
</html>

--===============6030148825368965765==--

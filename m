Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64ADDFB5171
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 22:14:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D5210E2E2;
	Mon,  6 Apr 2026 22:14:12 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E2610E2E2;
 Mon,  6 Apr 2026 22:14:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1696906025794272711=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/guc=3A_Recommend_GuC?=
 =?utf-8?q?_v70=2E60=2E0_for_LNL=2C_BMG=2C_PTL_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 Apr 2026 22:14:11 -0000
Message-ID: <177551365100.435226.9268395225847103930@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260406211759.817577-9-julia.filipchuk@intel.com>
In-Reply-To: <20260406211759.817577-9-julia.filipchuk@intel.com>
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

--===============1696906025794272711==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Recommend GuC v70.60.0 for LNL, BMG, PTL (rev2)
URL   : https://patchwork.freedesktop.org/series/164323/
State : success

== Summary ==

CI Bug Log - changes from xe-4853-7b7217a9e27a82ef10be22ab3a55ad5bbc849688_BAT -> xe-pw-164323v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-164323v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] ([Intel XE#7249] / [Intel XE#7578])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4853-7b7217a9e27a82ef10be22ab3a55ad5bbc849688/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164323v2/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#7249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7249
  [Intel XE#7578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578


Build changes
-------------

  * Linux: xe-4853-7b7217a9e27a82ef10be22ab3a55ad5bbc849688 -> xe-pw-164323v2

  IGT_8849: 8849
  xe-4853-7b7217a9e27a82ef10be22ab3a55ad5bbc849688: 7b7217a9e27a82ef10be22ab3a55ad5bbc849688
  xe-pw-164323v2: 164323v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164323v2/index.html

--===============1696906025794272711==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Recommend GuC v70.60.0 for LNL, BMG, PTL (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164323/">https://patchwork.freedesktop.org/series/164323/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164323v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164323v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4853-7b7217a9e27a82ef10be22ab3a55ad5bbc849688_BAT -&gt; xe-pw-164323v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-164323v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4853-7b7217a9e27a82ef10be22ab3a55ad5bbc849688/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164323v2/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7249">Intel XE#7249</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578">Intel XE#7578</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4853-7b7217a9e27a82ef10be22ab3a55ad5bbc849688 -&gt; xe-pw-164323v2</li>
</ul>
<p>IGT_8849: 8849<br />
  xe-4853-7b7217a9e27a82ef10be22ab3a55ad5bbc849688: 7b7217a9e27a82ef10be22ab3a55ad5bbc849688<br />
  xe-pw-164323v2: 164323v2</p>

</body>
</html>

--===============1696906025794272711==--

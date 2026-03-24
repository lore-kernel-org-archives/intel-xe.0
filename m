Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA98EF54AC6
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 14:40:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 986D910E6FD;
	Tue, 24 Mar 2026 14:40:56 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7E310E6FD;
 Tue, 24 Mar 2026 14:40:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8480996000699659229=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/wm=3A_Watermark/SA?=
 =?utf-8?q?GV_fixes/cleanups/etc?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Mar 2026 14:40:55 -0000
Message-ID: <177436325568.391866.2080020730683359030@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260324134843.2364-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260324134843.2364-1-ville.syrjala@linux.intel.com>
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

--===============8480996000699659229==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/wm: Watermark/SAGV fixes/cleanups/etc
URL   : https://patchwork.freedesktop.org/series/163783/
State : success

== Summary ==

CI Bug Log - changes from xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f_BAT -> xe-pw-163783v1_BAT
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

  Here are the changes found in xe-pw-163783v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - bat-bmg-2:          [PASS][1] -> [DMESG-WARN][2] ([Intel XE#7433]) +3 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - bat-bmg-1:          [PASS][3] -> [DMESG-WARN][4] ([Intel XE#7433]) +3 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@xe_module_load@load:
    - bat-bmg-3:          [PASS][5] -> [DMESG-WARN][6] ([Intel XE#7433])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/bat-bmg-3/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/bat-bmg-3/igt@xe_module_load@load.html

  
  [Intel XE#7433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433


Build changes
-------------

  * Linux: xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f -> xe-pw-163783v1

  IGT_8822: 8822
  xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f: cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f
  xe-pw-163783v1: 163783v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/index.html

--===============8480996000699659229==
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
<tr><td><b>Series:</b></td><td>drm/i915/wm: Watermark/SAGV fixes/cleanups/etc</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163783/">https://patchwork.freedesktop.org/series/163783/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f_BAT -&gt; xe-pw-163783v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-163783v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433">Intel XE#7433</a>) +3 other tests dmesg-warn</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433">Intel XE#7433</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/bat-bmg-3/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/bat-bmg-3/igt@xe_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433">Intel XE#7433</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f -&gt; xe-pw-163783v1</li>
</ul>
<p>IGT_8822: 8822<br />
  xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f: cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f<br />
  xe-pw-163783v1: 163783v1</p>

</body>
</html>

--===============8480996000699659229==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A4BC88E75
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 23:39:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED8710EC9B;
	Mon, 14 Sep 2026 23:39:56 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A02310EC9B;
 Mon, 14 Sep 2026 23:39:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8764938669001846949=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/mmio=3A_Fix_xe=5Fmmi?=
 =?utf-8?q?o=5Fwait32=28=29_to_honor_delay/sleep_maximums_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 14 Sep 2026 23:39:55 -0000
Message-ID: <178942919549.161596.8023361778979299562@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260914215746.272721-2-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20260914215746.272721-2-alan.previn.teres.alexis@intel.com>
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

--===============8764938669001846949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/mmio: Fix xe_mmio_wait32() to honor delay/sleep maximums (rev4)
URL   : https://patchwork.freedesktop.org/series/173538/
State : success

== Summary ==

CI Bug Log - changes from xe-5746-19d79b860b8d526661d2697b4abc21e262f614d0_BAT -> xe-pw-173538v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-173538v4_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [ABORT][1] ([Intel XE#8007]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5746-19d79b860b8d526661d2697b4abc21e262f614d0/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v4/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007


Build changes
-------------

  * Linux: xe-5746-19d79b860b8d526661d2697b4abc21e262f614d0 -> xe-pw-173538v4

  IGT_9094: b72ca59712e9021e1a1a0a5a89ff5eb74982ad99 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5746-19d79b860b8d526661d2697b4abc21e262f614d0: 19d79b860b8d526661d2697b4abc21e262f614d0
  xe-pw-173538v4: 173538v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v4/index.html

--===============8764938669001846949==
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
<tr><td><b>Series:</b></td><td>drm/xe/mmio: Fix xe_mmio_wait32() to honor delay/sleep maximums (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173538/">https://patchwork.freedesktop.org/series/173538/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5746-19d79b860b8d526661d2697b4abc21e262f614d0_BAT -&gt; xe-pw-173538v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-173538v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5746-19d79b860b8d526661d2697b4abc21e262f614d0/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v4/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5746-19d79b860b8d526661d2697b4abc21e262f614d0 -&gt; xe-pw-173538v4</li>
</ul>
<p>IGT_9094: b72ca59712e9021e1a1a0a5a89ff5eb74982ad99 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5746-19d79b860b8d526661d2697b4abc21e262f614d0: 19d79b860b8d526661d2697b4abc21e262f614d0<br />
  xe-pw-173538v4: 173538v4</p>

</body>
</html>

--===============8764938669001846949==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD558C88E73
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 21:27:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C3C810EC69;
	Mon, 14 Sep 2026 21:27:10 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1E410EC69;
 Mon, 14 Sep 2026 21:27:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1445685329963419097=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_pm=5Fpme_support_on_display?=
 =?utf-8?q?_hotplug_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 14 Sep 2026 21:27:09 -0000
Message-ID: <178942122923.161596.6535540258258010161@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260914204034.309566-1-vinod.govindapillai@intel.com>
In-Reply-To: <20260914204034.309566-1-vinod.govindapillai@intel.com>
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

--===============1445685329963419097==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: pm_pme support on display hotplug (rev7)
URL   : https://patchwork.freedesktop.org/series/172305/
State : success

== Summary ==

CI Bug Log - changes from xe-5746-19d79b860b8d526661d2697b4abc21e262f614d0_BAT -> xe-pw-172305v7_BAT
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

  Here are the changes found in xe-pw-172305v7_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [ABORT][1] ([Intel XE#8007]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5746-19d79b860b8d526661d2697b4abc21e262f614d0/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v7/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007


Build changes
-------------

  * Linux: xe-5746-19d79b860b8d526661d2697b4abc21e262f614d0 -> xe-pw-172305v7

  IGT_9094: b72ca59712e9021e1a1a0a5a89ff5eb74982ad99 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5746-19d79b860b8d526661d2697b4abc21e262f614d0: 19d79b860b8d526661d2697b4abc21e262f614d0
  xe-pw-172305v7: 172305v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v7/index.html

--===============1445685329963419097==
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
<tr><td><b>Series:</b></td><td>pm_pme support on display hotplug (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172305/">https://patchwork.freedesktop.org/series/172305/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5746-19d79b860b8d526661d2697b4abc21e262f614d0_BAT -&gt; xe-pw-172305v7_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-172305v7_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5746-19d79b860b8d526661d2697b4abc21e262f614d0/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172305v7/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5746-19d79b860b8d526661d2697b4abc21e262f614d0 -&gt; xe-pw-172305v7</li>
</ul>
<p>IGT_9094: b72ca59712e9021e1a1a0a5a89ff5eb74982ad99 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5746-19d79b860b8d526661d2697b4abc21e262f614d0: 19d79b860b8d526661d2697b4abc21e262f614d0<br />
  xe-pw-172305v7: 172305v7</p>

</body>
</html>

--===============1445685329963419097==--

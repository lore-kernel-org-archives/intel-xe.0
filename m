Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF6CCA5FCE
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 13:23:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C22F10ECDF;
	Mon,  5 Oct 2026 13:23:43 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D8410EA1D;
 Mon,  5 Oct 2026 13:23:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8528240920212787173=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/dp=3A_don=27t_touc?=
 =?utf-8?q?h_the_AUX_engine_while_it=27s_still_busy?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 Oct 2026 13:23:41 -0000
Message-ID: <179120662197.240239.1535465068562676561@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261005122302.110968-1-luciano.coelho@intel.com>
In-Reply-To: <20261005122302.110968-1-luciano.coelho@intel.com>
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

--===============8528240920212787173==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: don't touch the AUX engine while it's still busy
URL   : https://patchwork.freedesktop.org/series/175554/
State : success

== Summary ==

CI Bug Log - changes from xe-5887-b0bd9fb9e92aae2a653efa1d0407daa2aabe99d0_BAT -> xe-pw-175554v1_BAT
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

  Here are the changes found in xe-pw-175554v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-nvls-1:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#8762] / [Intel XE#9069])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5887-b0bd9fb9e92aae2a653efa1d0407daa2aabe99d0/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v1/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#8762]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762
  [Intel XE#9069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069


Build changes
-------------

  * IGT: IGT_9126 -> IGT_9128
  * Linux: xe-5887-b0bd9fb9e92aae2a653efa1d0407daa2aabe99d0 -> xe-pw-175554v1

  IGT_9126: 4b27241425f55826ff2df54686e8e709f5baf9dc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9128: 9128
  xe-5887-b0bd9fb9e92aae2a653efa1d0407daa2aabe99d0: b0bd9fb9e92aae2a653efa1d0407daa2aabe99d0
  xe-pw-175554v1: 175554v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v1/index.html

--===============8528240920212787173==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: don&#x27;t touch the AUX engine while it&#x27;s still busy</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175554/">https://patchwork.freedesktop.org/series/175554/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5887-b0bd9fb9e92aae2a653efa1d0407daa2aabe99d0_BAT -&gt; xe-pw-175554v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-175554v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5887-b0bd9fb9e92aae2a653efa1d0407daa2aabe99d0/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v1/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762">Intel XE#8762</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069">Intel XE#9069</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9126 -&gt; IGT_9128</li>
<li>Linux: xe-5887-b0bd9fb9e92aae2a653efa1d0407daa2aabe99d0 -&gt; xe-pw-175554v1</li>
</ul>
<p>IGT_9126: 4b27241425f55826ff2df54686e8e709f5baf9dc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9128: 9128<br />
  xe-5887-b0bd9fb9e92aae2a653efa1d0407daa2aabe99d0: b0bd9fb9e92aae2a653efa1d0407daa2aabe99d0<br />
  xe-pw-175554v1: 175554v1</p>

</body>
</html>

--===============8528240920212787173==--

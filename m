Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C681CA6007
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 12:37:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA28B10E826;
	Thu,  8 Oct 2026 12:37:14 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F47610E826;
 Thu,  8 Oct 2026 12:37:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6788917140267733199=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyTIFhlLkNJLkJBVDogc3VjY2VzcyBmb3IgZHJtL3tpOTE1LCB4ZX06IG1vdmUg?=
 =?utf-8?b?aW50ZWxfb3ByZWdpb25fc3VzcGVuZCgpIHRvIGludGVsX2Rpc3BsYXlfZHJpdmVy?=
 =?utf-8?b?X3BtX3N1c3BlbmRfbGF0ZSgp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 Oct 2026 12:37:13 -0000
Message-ID: <179146303325.251892.14055083775920163392@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261008114735.2662427-1-jani.nikula@intel.com>
In-Reply-To: <20261008114735.2662427-1-jani.nikula@intel.com>
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

--===============6788917140267733199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/{i915, xe}: move intel_opregion_suspend() to intel_display_driver_pm_suspend_late()
URL   : https://patchwork.freedesktop.org/series/175763/
State : success

== Summary ==

CI Bug Log - changes from xe-5905-facc562ab96d7b9fa3dec0528022e0009a5bf875_BAT -> xe-pw-175763v1_BAT
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

  Here are the changes found in xe-pw-175763v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-1:          [ABORT][1] ([Intel XE#9463]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5905-facc562ab96d7b9fa3dec0528022e0009a5bf875/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175763v1/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463


Build changes
-------------

  * IGT: IGT_9134 -> IGT_9135
  * Linux: xe-5905-facc562ab96d7b9fa3dec0528022e0009a5bf875 -> xe-pw-175763v1

  IGT_9134: 23f88758399c4e526aab1db26f35208faea9816a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9135: 9135
  xe-5905-facc562ab96d7b9fa3dec0528022e0009a5bf875: facc562ab96d7b9fa3dec0528022e0009a5bf875
  xe-pw-175763v1: 175763v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175763v1/index.html

--===============6788917140267733199==
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
<tr><td><b>Series:</b></td><td>drm/{i915, xe}: move intel_opregion_suspend() to intel_display_driver_pm_suspend_late()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175763/">https://patchwork.freedesktop.org/series/175763/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175763v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175763v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5905-facc562ab96d7b9fa3dec0528022e0009a5bf875_BAT -&gt; xe-pw-175763v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-175763v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5905-facc562ab96d7b9fa3dec0528022e0009a5bf875/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175763v1/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9134 -&gt; IGT_9135</li>
<li>Linux: xe-5905-facc562ab96d7b9fa3dec0528022e0009a5bf875 -&gt; xe-pw-175763v1</li>
</ul>
<p>IGT_9134: 23f88758399c4e526aab1db26f35208faea9816a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9135: 9135<br />
  xe-5905-facc562ab96d7b9fa3dec0528022e0009a5bf875: facc562ab96d7b9fa3dec0528022e0009a5bf875<br />
  xe-pw-175763v1: 175763v1</p>

</body>
</html>

--===============6788917140267733199==--

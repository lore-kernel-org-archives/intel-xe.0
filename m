Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111DDCA6019
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 12:58:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CAAA112143;
	Fri,  9 Oct 2026 12:58:30 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DFD411211B;
 Fri,  9 Oct 2026 12:58:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5098858097577269391=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Move_the_PLL_power_save_W/A?=
 =?utf-8?q?_to_the_display_W/A_framework?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 09 Oct 2026 12:58:29 -0000
Message-ID: <179155070948.3449.13883086681511660849@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261009103552.1864818-1-mika.kahola@intel.com>
In-Reply-To: <20261009103552.1864818-1-mika.kahola@intel.com>
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

--===============5098858097577269391==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Move the PLL power save W/A to the display W/A framework
URL   : https://patchwork.freedesktop.org/series/175834/
State : success

== Summary ==

CI Bug Log - changes from xe-5915-3bd4f625aafdf70814dbf075de96e224355c9f1e_BAT -> xe-pw-175834v1_BAT
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

  Here are the changes found in xe-pw-175834v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] ([Intel XE#9463])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5915-3bd4f625aafdf70814dbf075de96e224355c9f1e/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175834v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463


Build changes
-------------

  * Linux: xe-5915-3bd4f625aafdf70814dbf075de96e224355c9f1e -> xe-pw-175834v1

  IGT_9138: 9138
  xe-5915-3bd4f625aafdf70814dbf075de96e224355c9f1e: 3bd4f625aafdf70814dbf075de96e224355c9f1e
  xe-pw-175834v1: 175834v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175834v1/index.html

--===============5098858097577269391==
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
<tr><td><b>Series:</b></td><td>Move the PLL power save W/A to the display W/A framework</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175834/">https://patchwork.freedesktop.org/series/175834/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175834v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175834v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5915-3bd4f625aafdf70814dbf075de96e224355c9f1e_BAT -&gt; xe-pw-175834v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-175834v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5915-3bd4f625aafdf70814dbf075de96e224355c9f1e/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175834v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5915-3bd4f625aafdf70814dbf075de96e224355c9f1e -&gt; xe-pw-175834v1</li>
</ul>
<p>IGT_9138: 9138<br />
  xe-5915-3bd4f625aafdf70814dbf075de96e224355c9f1e: 3bd4f625aafdf70814dbf075de96e224355c9f1e<br />
  xe-pw-175834v1: 175834v1</p>

</body>
</html>

--===============5098858097577269391==--

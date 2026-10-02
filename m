Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13BBCA5FCE
	for <intel-xe@archiver.kernel.org>; Fri,  2 Oct 2026 00:34:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905D110E110;
	Fri,  2 Oct 2026 00:34:48 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E489110E09F;
 Fri,  2 Oct 2026 00:34:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3161849921742928499=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/hwmon=3A_Update_hwmo?=
 =?utf-8?q?n_thermal_mailbox_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 02 Oct 2026 00:34:47 -0000
Message-ID: <179090128792.231466.17168416431412341094@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261001195033.3466205-1-karthik.poosa@intel.com>
In-Reply-To: <20261001195033.3466205-1-karthik.poosa@intel.com>
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

--===============3161849921742928499==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/hwmon: Update hwmon thermal mailbox (rev4)
URL   : https://patchwork.freedesktop.org/series/174898/
State : success

== Summary ==

CI Bug Log - changes from xe-5868-a064e93fc25c7d4600c0ff802918395291087517_BAT -> xe-pw-174898v4_BAT
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

  Here are the changes found in xe-pw-174898v4_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-nvls-1:         [DMESG-WARN][1] ([Intel XE#8762] / [Intel XE#9069]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5868-a064e93fc25c7d4600c0ff802918395291087517/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174898v4/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#8762]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762
  [Intel XE#9069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069


Build changes
-------------

  * IGT: IGT_9122 -> IGT_9123
  * Linux: xe-5868-a064e93fc25c7d4600c0ff802918395291087517 -> xe-pw-174898v4

  IGT_9122: e135ddea9ef0e2d36c831e99db99d634efe3eb26 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9123: afd8cfb7aa15906974dd979b6dc739ed17ab9e33 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5868-a064e93fc25c7d4600c0ff802918395291087517: a064e93fc25c7d4600c0ff802918395291087517
  xe-pw-174898v4: 174898v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174898v4/index.html

--===============3161849921742928499==
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
<tr><td><b>Series:</b></td><td>drm/xe/hwmon: Update hwmon thermal mailbox (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174898/">https://patchwork.freedesktop.org/series/174898/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174898v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174898v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5868-a064e93fc25c7d4600c0ff802918395291087517_BAT -&gt; xe-pw-174898v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-174898v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5868-a064e93fc25c7d4600c0ff802918395291087517/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762">Intel XE#8762</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069">Intel XE#9069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174898v4/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9122 -&gt; IGT_9123</li>
<li>Linux: xe-5868-a064e93fc25c7d4600c0ff802918395291087517 -&gt; xe-pw-174898v4</li>
</ul>
<p>IGT_9122: e135ddea9ef0e2d36c831e99db99d634efe3eb26 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9123: afd8cfb7aa15906974dd979b6dc739ed17ab9e33 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5868-a064e93fc25c7d4600c0ff802918395291087517: a064e93fc25c7d4600c0ff802918395291087517<br />
  xe-pw-174898v4: 174898v4</p>

</body>
</html>

--===============3161849921742928499==--

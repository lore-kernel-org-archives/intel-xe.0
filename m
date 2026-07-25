Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABE5C531FA
	for <intel-xe@archiver.kernel.org>; Sat, 25 Jul 2026 00:17:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F163B10E2DD;
	Sat, 25 Jul 2026 00:17:55 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4664C10E2DD;
 Sat, 25 Jul 2026 00:17:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3935877365955708113=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Fine_grained_fault_locking?=
 =?utf-8?q?=2C_threaded_prefetch=2C_storm_cache_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 25 Jul 2026 00:17:55 -0000
Message-ID: <178493867528.225757.541983369096544697@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260724232601.1753977-1-matthew.brost@intel.com>
In-Reply-To: <20260724232601.1753977-1-matthew.brost@intel.com>
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

--===============3935877365955708113==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fine grained fault locking, threaded prefetch, storm cache (rev8)
URL   : https://patchwork.freedesktop.org/series/162167/
State : success

== Summary ==

CI Bug Log - changes from xe-5481-03696c1dc9eabc0658baefcff8787dab48c89d93_BAT -> xe-pw-162167v8_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5481-03696c1dc9eabc0658baefcff8787dab48c89d93 -> xe-pw-162167v8

  IGT_9025: 852c13ddd448fd668c43584ca3ad1aec49c4633c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5481-03696c1dc9eabc0658baefcff8787dab48c89d93: 03696c1dc9eabc0658baefcff8787dab48c89d93
  xe-pw-162167v8: 162167v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v8/index.html

--===============3935877365955708113==
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
<tr><td><b>Series:</b></td><td>Fine grained fault locking, threaded prefetch, storm cache (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162167/">https://patchwork.freedesktop.org/series/162167/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v8/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5481-03696c1dc9eabc0658baefcff8787dab48c89d93_BAT -&gt; xe-pw-162167v8_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5481-03696c1dc9eabc0658baefcff8787dab48c89d93 -&gt; xe-pw-162167v8</li>
</ul>
<p>IGT_9025: 852c13ddd448fd668c43584ca3ad1aec49c4633c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5481-03696c1dc9eabc0658baefcff8787dab48c89d93: 03696c1dc9eabc0658baefcff8787dab48c89d93<br />
  xe-pw-162167v8: 162167v8</p>

</body>
</html>

--===============3935877365955708113==--

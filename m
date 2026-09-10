Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA52AC79FB9
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 13:42:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 600F310F492;
	Thu, 10 Sep 2026 13:42:46 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EB410F494;
 Thu, 10 Sep 2026 13:42:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5830192062720160461=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bv3?=
 =?utf-8?q?=2C1/1=5D_drm/xe/guc=3A_Fix_wake=5Fup_race_in_handle=5Fsched=5Fdo?=
 =?utf-8?q?ne?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jakub Legowski" <jakub.legowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Sep 2026 13:42:45 -0000
Message-ID: <178904776555.147469.14355089849885062899@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260910121759.1835037-1-jakub.legowski@intel.com>
In-Reply-To: <20260910121759.1835037-1-jakub.legowski@intel.com>
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

--===============5830192062720160461==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v3,1/1] drm/xe/guc: Fix wake_up race in handle_sched_done
URL   : https://patchwork.freedesktop.org/series/173789/
State : success

== Summary ==

CI Bug Log - changes from xe-5719-5adc9763607d7b5dd14ff99e6dcab3cd2dc2d225_BAT -> xe-pw-173789v1_BAT
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

  Here are the changes found in xe-pw-173789v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@engine:
    - bat-ptl-2:          [PASS][1] -> [FAIL][2] ([Intel XE#9109])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5719-5adc9763607d7b5dd14ff99e6dcab3cd2dc2d225/bat-ptl-2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173789v1/bat-ptl-2/igt@xe_waitfence@engine.html

  
#### Possible fixes ####

  * igt@xe_waitfence@abstime:
    - bat-wcl-1:          [TIMEOUT][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5719-5adc9763607d7b5dd14ff99e6dcab3cd2dc2d225/bat-wcl-1/igt@xe_waitfence@abstime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173789v1/bat-wcl-1/igt@xe_waitfence@abstime.html

  
  [Intel XE#9109]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109


Build changes
-------------

  * Linux: xe-5719-5adc9763607d7b5dd14ff99e6dcab3cd2dc2d225 -> xe-pw-173789v1

  IGT_9088: 55a88d20e327d5c440cd3f3d661684fb83f29027 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5719-5adc9763607d7b5dd14ff99e6dcab3cd2dc2d225: 5adc9763607d7b5dd14ff99e6dcab3cd2dc2d225
  xe-pw-173789v1: 173789v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173789v1/index.html

--===============5830192062720160461==
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
<tr><td><b>Series:</b></td><td>series starting with [v3,1/1] drm/xe/guc: Fix wake_up race in handle_sched_done</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173789/">https://patchwork.freedesktop.org/series/173789/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173789v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173789v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5719-5adc9763607d7b5dd14ff99e6dcab3cd2dc2d225_BAT -&gt; xe-pw-173789v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-173789v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5719-5adc9763607d7b5dd14ff99e6dcab3cd2dc2d225/bat-ptl-2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173789v1/bat-ptl-2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109">Intel XE#9109</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5719-5adc9763607d7b5dd14ff99e6dcab3cd2dc2d225/bat-wcl-1/igt@xe_waitfence@abstime.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173789v1/bat-wcl-1/igt@xe_waitfence@abstime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5719-5adc9763607d7b5dd14ff99e6dcab3cd2dc2d225 -&gt; xe-pw-173789v1</li>
</ul>
<p>IGT_9088: 55a88d20e327d5c440cd3f3d661684fb83f29027 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5719-5adc9763607d7b5dd14ff99e6dcab3cd2dc2d225: 5adc9763607d7b5dd14ff99e6dcab3cd2dc2d225<br />
  xe-pw-173789v1: 173789v1</p>

</body>
</html>

--===============5830192062720160461==--

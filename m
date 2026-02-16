Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209EEE81A3A
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 16:03:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80BB10E3B0;
	Mon, 16 Feb 2026 16:03:12 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7DA10E0C1;
 Mon, 16 Feb 2026 16:03:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5514862893988693354=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Set_GT_rp_min_fre?=
 =?utf-8?q?quency_as_1=2E2GHz_default_for_BMG/CRI?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Feb 2026 16:03:12 -0000
Message-ID: <177125779228.256994.555749488475082450@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260216135107.3148167-3-naresh.kumar.g@intel.com>
In-Reply-To: <20260216135107.3148167-3-naresh.kumar.g@intel.com>
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

--===============5514862893988693354==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Set GT rp min frequency as 1.2GHz default for BMG/CRI
URL   : https://patchwork.freedesktop.org/series/161656/
State : success

== Summary ==

CI Bug Log - changes from xe-4563-483cf2d774a08fdf83f0e4c7a6ab671a53656d3c_BAT -> xe-pw-161656v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-bmg-3 

Known issues
------------

  Here are the changes found in xe-pw-161656v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [FAIL][1] ([Intel XE#6520]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4563-483cf2d774a08fdf83f0e4c7a6ab671a53656d3c/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161656v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * Linux: xe-4563-483cf2d774a08fdf83f0e4c7a6ab671a53656d3c -> xe-pw-161656v1

  IGT_8754: 8754
  xe-4563-483cf2d774a08fdf83f0e4c7a6ab671a53656d3c: 483cf2d774a08fdf83f0e4c7a6ab671a53656d3c
  xe-pw-161656v1: 161656v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161656v1/index.html

--===============5514862893988693354==
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
<tr><td><b>Series:</b></td><td>drm/xe: Set GT rp min frequency as 1.2GHz default for BMG/CRI</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161656/">https://patchwork.freedesktop.org/series/161656/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161656v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161656v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4563-483cf2d774a08fdf83f0e4c7a6ab671a53656d3c_BAT -&gt; xe-pw-161656v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-bmg-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161656v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4563-483cf2d774a08fdf83f0e4c7a6ab671a53656d3c/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161656v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4563-483cf2d774a08fdf83f0e4c7a6ab671a53656d3c -&gt; xe-pw-161656v1</li>
</ul>
<p>IGT_8754: 8754<br />
  xe-4563-483cf2d774a08fdf83f0e4c7a6ab671a53656d3c: 483cf2d774a08fdf83f0e4c7a6ab671a53656d3c<br />
  xe-pw-161656v1: 161656v1</p>

</body>
</html>

--===============5514862893988693354==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B487FC79FBB
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 23:13:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C7210E337;
	Thu, 10 Sep 2026 23:13:34 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A03F10E327;
 Thu, 10 Sep 2026 23:13:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3533348537569936695=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bv3?=
 =?utf-8?q?=2C1/2=5D_drm/xe=3A_Inspect_all_forcewake_bits_for_runtime_idlene?=
 =?utf-8?q?ss?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Sep 2026 23:13:34 -0000
Message-ID: <178908201409.148519.5873115618503467294@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260910215756.2393137-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20260910215756.2393137-1-vinay.belgaumkar@intel.com>
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

--===============3533348537569936695==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v3,1/2] drm/xe: Inspect all forcewake bits for runtime idleness
URL   : https://patchwork.freedesktop.org/series/173817/
State : success

== Summary ==

CI Bug Log - changes from xe-5725-da9c5bc444c1057d8d59ca6fe1de87e39dbad974_BAT -> xe-pw-173817v1_BAT
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

  Here are the changes found in xe-pw-173817v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@reltime:
    - bat-ptl-2:          [PASS][1] -> [FAIL][2] ([Intel XE#9115])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5725-da9c5bc444c1057d8d59ca6fe1de87e39dbad974/bat-ptl-2/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173817v1/bat-ptl-2/igt@xe_waitfence@reltime.html

  
  [Intel XE#9115]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115


Build changes
-------------

  * Linux: xe-5725-da9c5bc444c1057d8d59ca6fe1de87e39dbad974 -> xe-pw-173817v1

  IGT_9090: 9090
  xe-5725-da9c5bc444c1057d8d59ca6fe1de87e39dbad974: da9c5bc444c1057d8d59ca6fe1de87e39dbad974
  xe-pw-173817v1: 173817v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173817v1/index.html

--===============3533348537569936695==
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
<tr><td><b>Series:</b></td><td>series starting with [v3,1/2] drm/xe: Inspect all forcewake bits for runtime idleness</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173817/">https://patchwork.freedesktop.org/series/173817/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173817v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173817v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5725-da9c5bc444c1057d8d59ca6fe1de87e39dbad974_BAT -&gt; xe-pw-173817v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-173817v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5725-da9c5bc444c1057d8d59ca6fe1de87e39dbad974/bat-ptl-2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173817v1/bat-ptl-2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115">Intel XE#9115</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5725-da9c5bc444c1057d8d59ca6fe1de87e39dbad974 -&gt; xe-pw-173817v1</li>
</ul>
<p>IGT_9090: 9090<br />
  xe-5725-da9c5bc444c1057d8d59ca6fe1de87e39dbad974: da9c5bc444c1057d8d59ca6fe1de87e39dbad974<br />
  xe-pw-173817v1: 173817v1</p>

</body>
</html>

--===============3533348537569936695==--

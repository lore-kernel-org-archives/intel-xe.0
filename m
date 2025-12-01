Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA273D116F3
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 17:45:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD4C10E439;
	Mon,  1 Dec 2025 17:45:51 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747D610E439;
 Mon,  1 Dec 2025 17:45:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5990793261594144104=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Redesign_survivability_mode?=
 =?utf-8?q?_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Dec 2025 17:45:50 -0000
Message-ID: <176461115046.44343.16312033699236910232@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251201143420.3158372-4-riana.tauro@intel.com>
In-Reply-To: <20251201143420.3158372-4-riana.tauro@intel.com>
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

--===============5990793261594144104==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Redesign survivability mode (rev2)
URL   : https://patchwork.freedesktop.org/series/157425/
State : success

== Summary ==

CI Bug Log - changes from xe-4174-4ee45005b5548f7cf1ab059413eaaa41dbd2ecf6_BAT -> xe-pw-157425v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-157425v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][1] -> [TIMEOUT][2] ([Intel XE#6506])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4174-4ee45005b5548f7cf1ab059413eaaa41dbd2ecf6/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157425v2/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506


Build changes
-------------

  * IGT: IGT_8646 -> IGT_8647
  * Linux: xe-4174-4ee45005b5548f7cf1ab059413eaaa41dbd2ecf6 -> xe-pw-157425v2

  IGT_8646: 8646
  IGT_8647: 8647
  xe-4174-4ee45005b5548f7cf1ab059413eaaa41dbd2ecf6: 4ee45005b5548f7cf1ab059413eaaa41dbd2ecf6
  xe-pw-157425v2: 157425v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157425v2/index.html

--===============5990793261594144104==
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
<tr><td><b>Series:</b></td><td>Redesign survivability mode (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157425/">https://patchwork.freedesktop.org/series/157425/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157425v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157425v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4174-4ee45005b5548f7cf1ab059413eaaa41dbd2ecf6_BAT -&gt; xe-pw-157425v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-157425v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4174-4ee45005b5548f7cf1ab059413eaaa41dbd2ecf6/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157425v2/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8646 -&gt; IGT_8647</li>
<li>Linux: xe-4174-4ee45005b5548f7cf1ab059413eaaa41dbd2ecf6 -&gt; xe-pw-157425v2</li>
</ul>
<p>IGT_8646: 8646<br />
  IGT_8647: 8647<br />
  xe-4174-4ee45005b5548f7cf1ab059413eaaa41dbd2ecf6: 4ee45005b5548f7cf1ab059413eaaa41dbd2ecf6<br />
  xe-pw-157425v2: 157425v2</p>

</body>
</html>

--===============5990793261594144104==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8A3CD37AC
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 21:11:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5EE10E009;
	Thu, 14 May 2026 21:11:14 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E8110E009;
 Thu, 14 May 2026 21:11:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4045777015449337839=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/bw=3A_Split_bandwi?=
 =?utf-8?q?dth_params_into_platform-_and_display-IP-specific_structs_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 14 May 2026 21:11:12 -0000
Message-ID: <177879307266.72886.15277887863284735770@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260514-separate-platform-from-diplay-ip-specific-bw-params-v3-0-68727d6fe3ec@intel.com>
In-Reply-To: <20260514-separate-platform-from-diplay-ip-specific-bw-params-v3-0-68727d6fe3ec@intel.com>
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

--===============4045777015449337839==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/bw: Split bandwidth params into platform- and display-IP-specific structs (rev2)
URL   : https://patchwork.freedesktop.org/series/166340/
State : success

== Summary ==

CI Bug Log - changes from xe-5065-66af2225d31aa8315b0b9f3c735dba4a53e8d3bf_BAT -> xe-pw-166340v2_BAT
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

  * Linux: xe-5065-66af2225d31aa8315b0b9f3c735dba4a53e8d3bf -> xe-pw-166340v2

  IGT_8912: 22222b7d987067331459c2a866e6387a669b7f70 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5065-66af2225d31aa8315b0b9f3c735dba4a53e8d3bf: 66af2225d31aa8315b0b9f3c735dba4a53e8d3bf
  xe-pw-166340v2: 166340v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166340v2/index.html

--===============4045777015449337839==
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
<tr><td><b>Series:</b></td><td>drm/i915/bw: Split bandwidth params into platform- and display-IP-specific structs (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166340/">https://patchwork.freedesktop.org/series/166340/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166340v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166340v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5065-66af2225d31aa8315b0b9f3c735dba4a53e8d3bf_BAT -&gt; xe-pw-166340v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5065-66af2225d31aa8315b0b9f3c735dba4a53e8d3bf -&gt; xe-pw-166340v2</li>
</ul>
<p>IGT_8912: 22222b7d987067331459c2a866e6387a669b7f70 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5065-66af2225d31aa8315b0b9f3c735dba4a53e8d3bf: 66af2225d31aa8315b0b9f3c735dba4a53e8d3bf<br />
  xe-pw-166340v2: 166340v2</p>

</body>
</html>

--===============4045777015449337839==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC43EC52D71
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 16:52:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AAF710E3BB;
	Tue,  6 Aug 2024 16:52:46 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4CE10E01F;
 Tue,  6 Aug 2024 16:52:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5666577525574763342=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5B1/2=5D_d?=
 =?utf-8?q?rm/xe=3A_Export_xe=5Fhw=5Fengine=27s_mmio_accessors?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Aug 2024 16:52:45 -0000
Message-ID: <172296316505.543866.18434353576871284350@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240806153009.1081382-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20240806153009.1081382-1-mika.kuoppala@linux.intel.com>
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

--===============5666577525574763342==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe: Export xe_hw_engine's mmio accessors
URL   : https://patchwork.freedesktop.org/series/136937/
State : success

== Summary ==

CI Bug Log - changes from xe-1722-83eea64f81edb86ed3aa368039520810c154fd94_BAT -> xe-pw-136937v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1722-83eea64f81edb86ed3aa368039520810c154fd94 -> xe-pw-136937v1

  IGT_7958: 5e93c0e266d7ebd74ea12b3b03cb50253a2ab760 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1722-83eea64f81edb86ed3aa368039520810c154fd94: 83eea64f81edb86ed3aa368039520810c154fd94
  xe-pw-136937v1: 136937v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136937v1/index.html

--===============5666577525574763342==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe: Export xe_hw_engine&#x27;s mmio accessors</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136937/">https://patchwork.freedesktop.org/series/136937/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136937v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136937v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1722-83eea64f81edb86ed3aa368039520810c154fd94_BAT -&gt; xe-pw-136937v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1722-83eea64f81edb86ed3aa368039520810c154fd94 -&gt; xe-pw-136937v1</li>
</ul>
<p>IGT_7958: 5e93c0e266d7ebd74ea12b3b03cb50253a2ab760 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1722-83eea64f81edb86ed3aa368039520810c154fd94: 83eea64f81edb86ed3aa368039520810c154fd94<br />
  xe-pw-136937v1: 136937v1</p>

</body>
</html>

--===============5666577525574763342==--

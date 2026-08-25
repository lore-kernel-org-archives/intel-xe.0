Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA16C61DB4
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 10:36:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D04A10E9DF;
	Tue, 25 Aug 2026 10:36:12 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2257E10E9E4;
 Tue, 25 Aug 2026 10:36:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0449322669574463148=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/dp=3A_Gate_UHBR_SS?=
 =?utf-8?q?T_SDP_splitting_on_sink_capability_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Aug 2026 10:36:11 -0000
Message-ID: <178765417113.82680.2999245832998799410@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260825073204.872441-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20260825073204.872441-1-mitulkumar.ajitkumar.golani@intel.com>
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

--===============0449322669574463148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: Gate UHBR SST SDP splitting on sink capability (rev3)
URL   : https://patchwork.freedesktop.org/series/170143/
State : success

== Summary ==

CI Bug Log - changes from xe-5642-15e2ba2fb6d25c03d89519aec46f8d5be3e118ad_BAT -> xe-pw-170143v3_BAT
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

  * IGT: IGT_9071 -> IGT_9072
  * Linux: xe-5642-15e2ba2fb6d25c03d89519aec46f8d5be3e118ad -> xe-pw-170143v3

  IGT_9071: 9071
  IGT_9072: 9072
  xe-5642-15e2ba2fb6d25c03d89519aec46f8d5be3e118ad: 15e2ba2fb6d25c03d89519aec46f8d5be3e118ad
  xe-pw-170143v3: 170143v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170143v3/index.html

--===============0449322669574463148==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: Gate UHBR SST SDP splitting on sink capability (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170143/">https://patchwork.freedesktop.org/series/170143/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170143v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170143v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5642-15e2ba2fb6d25c03d89519aec46f8d5be3e118ad_BAT -&gt; xe-pw-170143v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9071 -&gt; IGT_9072</li>
<li>Linux: xe-5642-15e2ba2fb6d25c03d89519aec46f8d5be3e118ad -&gt; xe-pw-170143v3</li>
</ul>
<p>IGT_9071: 9071<br />
  IGT_9072: 9072<br />
  xe-5642-15e2ba2fb6d25c03d89519aec46f8d5be3e118ad: 15e2ba2fb6d25c03d89519aec46f8d5be3e118ad<br />
  xe-pw-170143v3: 170143v3</p>

</body>
</html>

--===============0449322669574463148==--

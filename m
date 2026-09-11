Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD641C88E41
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 05:40:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A8F810E361;
	Fri, 11 Sep 2026 05:40:31 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF11010E361;
 Fri, 11 Sep 2026 05:40:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8927161133958346101=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/i2c=3A_Disable_IRQ_o?=
 =?utf-8?q?n_unbind?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 11 Sep 2026 05:40:29 -0000
Message-ID: <178910522975.149373.8973562794697772031@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260911044021.2393342-1-raag.jadav@intel.com>
In-Reply-To: <20260911044021.2393342-1-raag.jadav@intel.com>
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

--===============8927161133958346101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/i2c: Disable IRQ on unbind
URL   : https://patchwork.freedesktop.org/series/173827/
State : success

== Summary ==

CI Bug Log - changes from xe-5726-cf3f6830cd1a44f792534b4f5695c5ca7a69943d_BAT -> xe-pw-173827v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9090 -> IGT_9091
  * Linux: xe-5726-cf3f6830cd1a44f792534b4f5695c5ca7a69943d -> xe-pw-173827v1

  IGT_9090: 9090
  IGT_9091: 9091
  xe-5726-cf3f6830cd1a44f792534b4f5695c5ca7a69943d: cf3f6830cd1a44f792534b4f5695c5ca7a69943d
  xe-pw-173827v1: 173827v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v1/index.html

--===============8927161133958346101==
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
<tr><td><b>Series:</b></td><td>drm/xe/i2c: Disable IRQ on unbind</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173827/">https://patchwork.freedesktop.org/series/173827/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5726-cf3f6830cd1a44f792534b4f5695c5ca7a69943d_BAT -&gt; xe-pw-173827v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9090 -&gt; IGT_9091</li>
<li>Linux: xe-5726-cf3f6830cd1a44f792534b4f5695c5ca7a69943d -&gt; xe-pw-173827v1</li>
</ul>
<p>IGT_9090: 9090<br />
  IGT_9091: 9091<br />
  xe-5726-cf3f6830cd1a44f792534b4f5695c5ca7a69943d: cf3f6830cd1a44f792534b4f5695c5ca7a69943d<br />
  xe-pw-173827v1: 173827v1</p>

</body>
</html>

--===============8927161133958346101==--

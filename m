Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E32C5B572
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 08:04:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B042010F40C;
	Fri, 14 Aug 2026 08:04:43 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7FC10F40C;
 Fri, 14 Aug 2026 08:04:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0726254076042146533=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_don=27t_WARN_on_k?=
 =?utf-8?q?ernel_job_timeout_when_device_already_wedged?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nitin Gote" <nitin.r.gote@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Aug 2026 08:04:42 -0000
Message-ID: <178669468262.51282.17214422603797073258@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260814074106.92670-2-nitin.r.gote@intel.com>
In-Reply-To: <20260814074106.92670-2-nitin.r.gote@intel.com>
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

--===============0726254076042146533==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: don't WARN on kernel job timeout when device already wedged
URL   : https://patchwork.freedesktop.org/series/172191/
State : success

== Summary ==

CI Bug Log - changes from xe-5595-ba85a54e3c7ed4f730b198fcf2743579261c0eaf_BAT -> xe-pw-172191v1_BAT
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

  * Linux: xe-5595-ba85a54e3c7ed4f730b198fcf2743579261c0eaf -> xe-pw-172191v1

  IGT_9056: 9056
  xe-5595-ba85a54e3c7ed4f730b198fcf2743579261c0eaf: ba85a54e3c7ed4f730b198fcf2743579261c0eaf
  xe-pw-172191v1: 172191v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172191v1/index.html

--===============0726254076042146533==
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
<tr><td><b>Series:</b></td><td>drm/xe: don&#x27;t WARN on kernel job timeout when device already wedged</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172191/">https://patchwork.freedesktop.org/series/172191/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172191v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172191v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5595-ba85a54e3c7ed4f730b198fcf2743579261c0eaf_BAT -&gt; xe-pw-172191v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5595-ba85a54e3c7ed4f730b198fcf2743579261c0eaf -&gt; xe-pw-172191v1</li>
</ul>
<p>IGT_9056: 9056<br />
  xe-5595-ba85a54e3c7ed4f730b198fcf2743579261c0eaf: ba85a54e3c7ed4f730b198fcf2743579261c0eaf<br />
  xe-pw-172191v1: 172191v1</p>

</body>
</html>

--===============0726254076042146533==--

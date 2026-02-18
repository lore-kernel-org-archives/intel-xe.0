Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894D1E9A03B
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 07:01:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26AFE10E569;
	Wed, 18 Feb 2026 07:01:30 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA7F10E569;
 Wed, 18 Feb 2026 07:01:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2933184733494772046=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_gpu=3A_Fix_uninitialized_bu?=
 =?utf-8?q?ddy_for_built-in_drivers_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Koen Koning" <koen.koning@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Feb 2026 07:01:29 -0000
Message-ID: <177139808915.261562.17186569743600673527@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260213152047.179628-1-koen.koning@linux.intel.com>
In-Reply-To: <20260213152047.179628-1-koen.koning@linux.intel.com>
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

--===============2933184733494772046==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gpu: Fix uninitialized buddy for built-in drivers (rev3)
URL   : https://patchwork.freedesktop.org/series/161596/
State : success

== Summary ==

CI Bug Log - changes from xe-4572-fc9512d31fa2c190f58c85dbdf7313d2d0ad4b0d_BAT -> xe-pw-161596v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (0 -> 0)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4572-fc9512d31fa2c190f58c85dbdf7313d2d0ad4b0d -> xe-pw-161596v3

  IGT_8758: 8758
  xe-4572-fc9512d31fa2c190f58c85dbdf7313d2d0ad4b0d: fc9512d31fa2c190f58c85dbdf7313d2d0ad4b0d
  xe-pw-161596v3: 161596v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161596v3/index.html

--===============2933184733494772046==
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
<tr><td><b>Series:</b></td><td>gpu: Fix uninitialized buddy for built-in drivers (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161596/">https://patchwork.freedesktop.org/series/161596/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161596v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161596v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4572-fc9512d31fa2c190f58c85dbdf7313d2d0ad4b0d_BAT -&gt; xe-pw-161596v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (0 -&gt; 0)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4572-fc9512d31fa2c190f58c85dbdf7313d2d0ad4b0d -&gt; xe-pw-161596v3</li>
</ul>
<p>IGT_8758: 8758<br />
  xe-4572-fc9512d31fa2c190f58c85dbdf7313d2d0ad4b0d: fc9512d31fa2c190f58c85dbdf7313d2d0ad4b0d<br />
  xe-pw-161596v3: 161596v3</p>

</body>
</html>

--===============2933184733494772046==--

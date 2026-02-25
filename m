Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E463FCEE81
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 11:09:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90D010E737;
	Wed, 25 Feb 2026 11:09:31 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FEB010E221;
 Wed, 25 Feb 2026 11:09:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0594234147890609883=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Fix_use-after-free_on_frame?=
 =?utf-8?q?buffers_and_property_blobs_when_calling_drm=5Fdev=5Funplug?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Feb 2026 11:09:31 -0000
Message-ID: <177201777162.284987.15862898376399783527@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260225101532.13260-3-dev@lankhorst.se>
In-Reply-To: <20260225101532.13260-3-dev@lankhorst.se>
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

--===============0594234147890609883==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix use-after-free on framebuffers and property blobs when calling drm_dev_unplug
URL   : https://patchwork.freedesktop.org/series/162134/
State : success

== Summary ==

CI Bug Log - changes from xe-4614-66aa2312c3791992ee39c775c8842800bfe14470_BAT -> xe-pw-162134v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8770 -> IGT_8771
  * Linux: xe-4614-66aa2312c3791992ee39c775c8842800bfe14470 -> xe-pw-162134v1

  IGT_8770: 8770
  IGT_8771: 8771
  xe-4614-66aa2312c3791992ee39c775c8842800bfe14470: 66aa2312c3791992ee39c775c8842800bfe14470
  xe-pw-162134v1: 162134v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162134v1/index.html

--===============0594234147890609883==
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
<tr><td><b>Series:</b></td><td>Fix use-after-free on framebuffers and property blobs when calling drm_dev_unplug</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162134/">https://patchwork.freedesktop.org/series/162134/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162134v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162134v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4614-66aa2312c3791992ee39c775c8842800bfe14470_BAT -&gt; xe-pw-162134v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8770 -&gt; IGT_8771</li>
<li>Linux: xe-4614-66aa2312c3791992ee39c775c8842800bfe14470 -&gt; xe-pw-162134v1</li>
</ul>
<p>IGT_8770: 8770<br />
  IGT_8771: 8771<br />
  xe-4614-66aa2312c3791992ee39c775c8842800bfe14470: 66aa2312c3791992ee39c775c8842800bfe14470<br />
  xe-pw-162134v1: 162134v1</p>

</body>
</html>

--===============0594234147890609883==--

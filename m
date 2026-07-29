Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19898C53200
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 10:06:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAEF710E552;
	Wed, 29 Jul 2026 10:06:36 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B573510E552;
 Wed, 29 Jul 2026 10:06:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4083516483020302077=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_GPU_buddy_allocator_test_fi?=
 =?utf-8?q?xes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Krzysztof Niemiec" <krzysztof.niemiec@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 Jul 2026 10:06:35 -0000
Message-ID: <178531959572.686.4869882465885555247@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260729091816.27860-2-krzysztof.niemiec@intel.com>
In-Reply-To: <20260729091816.27860-2-krzysztof.niemiec@intel.com>
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

--===============4083516483020302077==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: GPU buddy allocator test fixes
URL   : https://patchwork.freedesktop.org/series/171240/
State : success

== Summary ==

CI Bug Log - changes from xe-5494-f57436380d5de1c1ded898e21378b0b4159c8790_BAT -> xe-pw-171240v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-bmg-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5494-f57436380d5de1c1ded898e21378b0b4159c8790 -> xe-pw-171240v1

  IGT_9030: 9030
  xe-5494-f57436380d5de1c1ded898e21378b0b4159c8790: f57436380d5de1c1ded898e21378b0b4159c8790
  xe-pw-171240v1: 171240v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171240v1/index.html

--===============4083516483020302077==
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
<tr><td><b>Series:</b></td><td>GPU buddy allocator test fixes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171240/">https://patchwork.freedesktop.org/series/171240/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171240v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171240v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5494-f57436380d5de1c1ded898e21378b0b4159c8790_BAT -&gt; xe-pw-171240v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5494-f57436380d5de1c1ded898e21378b0b4159c8790 -&gt; xe-pw-171240v1</li>
</ul>
<p>IGT_9030: 9030<br />
  xe-5494-f57436380d5de1c1ded898e21378b0b4159c8790: f57436380d5de1c1ded898e21378b0b4159c8790<br />
  xe-pw-171240v1: 171240v1</p>

</body>
</html>

--===============4083516483020302077==--

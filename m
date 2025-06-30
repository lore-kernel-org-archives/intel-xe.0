Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE808C83029
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 14:48:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B4610E478;
	Mon, 30 Jun 2025 14:48:23 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7374910E240;
 Mon, 30 Jun 2025 14:48:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5535775390149628677=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyTIFhlLkNJLkJBVDogc3VjY2VzcyBmb3IgU21hbGwgZW1pdF93YV9qb2IoKSB0?=
 =?utf-8?b?aWR5?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 30 Jun 2025 14:48:21 -0000
Message-ID: <175129490146.120494.6985055209424582870@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250627131438.54398-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250627131438.54398-1-tvrtko.ursulin@igalia.com>
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

--===============5535775390149628677==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Small emit_wa_job() tidy
URL   : https://patchwork.freedesktop.org/series/150878/
State : success

== Summary ==

CI Bug Log - changes from xe-3321-078be02b4585b9a9703401d89a3ac93e2d15a6bd_BAT -> xe-pw-150878v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3321-078be02b4585b9a9703401d89a3ac93e2d15a6bd -> xe-pw-150878v1

  IGT_8431: 8431
  xe-3321-078be02b4585b9a9703401d89a3ac93e2d15a6bd: 078be02b4585b9a9703401d89a3ac93e2d15a6bd
  xe-pw-150878v1: 150878v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150878v1/index.html

--===============5535775390149628677==
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
<tr><td><b>Series:</b></td><td>Small emit_wa_job() tidy</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150878/">https://patchwork.freedesktop.org/series/150878/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150878v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150878v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3321-078be02b4585b9a9703401d89a3ac93e2d15a6bd_BAT -&gt; xe-pw-150878v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3321-078be02b4585b9a9703401d89a3ac93e2d15a6bd -&gt; xe-pw-150878v1</li>
</ul>
<p>IGT_8431: 8431<br />
  xe-3321-078be02b4585b9a9703401d89a3ac93e2d15a6bd: 078be02b4585b9a9703401d89a3ac93e2d15a6bd<br />
  xe-pw-150878v1: 150878v1</p>

</body>
</html>

--===============5535775390149628677==--

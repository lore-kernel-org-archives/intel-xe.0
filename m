Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BC5C61CE8
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 16:04:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0AC10E3E8;
	Mon,  9 Jun 2025 16:04:48 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546CD10E3D2;
 Mon,  9 Jun 2025 16:04:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6230360844887851626=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_A_few_drm=5Fsyncobj_optimis?=
 =?utf-8?q?ations?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Jun 2025 16:04:46 -0000
Message-ID: <174948508633.61194.6789699924833411165@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250609113313.75395-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250609113313.75395-1-tvrtko.ursulin@igalia.com>
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

--===============6230360844887851626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: A few drm_syncobj optimisations
URL   : https://patchwork.freedesktop.org/series/149983/
State : success

== Summary ==

CI Bug Log - changes from xe-3221-36e403828da1c008ec882e90d76d706ceff20fde_BAT -> xe-pw-149983v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3221-36e403828da1c008ec882e90d76d706ceff20fde -> xe-pw-149983v1

  IGT_8401: 8401
  xe-3221-36e403828da1c008ec882e90d76d706ceff20fde: 36e403828da1c008ec882e90d76d706ceff20fde
  xe-pw-149983v1: 149983v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149983v1/index.html

--===============6230360844887851626==
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
<tr><td><b>Series:</b></td><td>A few drm_syncobj optimisations</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149983/">https://patchwork.freedesktop.org/series/149983/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149983v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149983v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3221-36e403828da1c008ec882e90d76d706ceff20fde_BAT -&gt; xe-pw-149983v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3221-36e403828da1c008ec882e90d76d706ceff20fde -&gt; xe-pw-149983v1</li>
</ul>
<p>IGT_8401: 8401<br />
  xe-3221-36e403828da1c008ec882e90d76d706ceff20fde: 36e403828da1c008ec882e90d76d706ceff20fde<br />
  xe-pw-149983v1: 149983v1</p>

</body>
</html>

--===============6230360844887851626==--

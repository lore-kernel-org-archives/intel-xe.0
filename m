Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCE9EE57DF
	for <intel-xe@archiver.kernel.org>; Mon, 11 Sep 2023 13:48:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 860DE10E2FF;
	Mon, 11 Sep 2023 13:48:34 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 31CE010E2FF;
 Mon, 11 Sep 2023 13:48:32 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 32077AADE0;
 Mon, 11 Sep 2023 13:48:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2449237479477939873=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Mon, 11 Sep 2023 13:48:32 -0000
Message-ID: <169444011217.31366.4502135799911395678@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230911124746.39149-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230911124746.39149-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Documenta?=
 =?utf-8?q?tion/gpu=3A_Add_a_VM=5FBIND_async_document_=28rev2=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============2449237479477939873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Documentation/gpu: Add a VM_BIND async document (rev2)
URL   : https://patchwork.freedesktop.org/series/122457/
State : success

== Summary ==

CI Bug Log - changes from xe-365-0533b5d42b2f8ec916646c10715ac45215e87689_BAT -> xe-pw-122457v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7478 -> IGT_7479
  * Linux: xe-365-0533b5d42b2f8ec916646c10715ac45215e87689 -> xe-pw-122457v2

  IGT_7478: 605d1288086602b23d0d73fee5022dcd329d9d3e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7479: 84ec7fe5b86ca4c7449d63ca833ca8cbe350f1f2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-365-0533b5d42b2f8ec916646c10715ac45215e87689: 0533b5d42b2f8ec916646c10715ac45215e87689
  xe-pw-122457v2: 122457v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122457v2/index.html

--===============2449237479477939873==
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
<tr><td><b>Series:</b></td><td>Documentation/gpu: Add a VM_BIND async document (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122457/">https://patchwork.freedesktop.org/series/122457/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122457v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122457v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-365-0533b5d42b2f8ec916646c10715ac45215e87689_BAT -&gt; xe-pw-122457v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7478 -&gt; IGT_7479</li>
<li>Linux: xe-365-0533b5d42b2f8ec916646c10715ac45215e87689 -&gt; xe-pw-122457v2</li>
</ul>
<p>IGT_7478: 605d1288086602b23d0d73fee5022dcd329d9d3e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7479: 84ec7fe5b86ca4c7449d63ca833ca8cbe350f1f2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-365-0533b5d42b2f8ec916646c10715ac45215e87689: 0533b5d42b2f8ec916646c10715ac45215e87689<br />
  xe-pw-122457v2: 122457v2</p>

</body>
</html>

--===============2449237479477939873==--

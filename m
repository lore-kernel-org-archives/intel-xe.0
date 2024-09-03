Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082D4CD342E
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 13:04:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C631510E599;
	Tue,  3 Sep 2024 13:04:34 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D3D10E599;
 Tue,  3 Sep 2024 13:04:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0155387687947527795=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/ttm=3A_Really_use_a_separate?=
 =?utf-8?q?_LRU_list_for_swapped-_and_pinned_objects_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Sep 2024 13:04:34 -0000
Message-ID: <172536867419.912939.8423493141493039935@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240903121958.11078-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240903121958.11078-1-thomas.hellstrom@linux.intel.com>
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

--===============0155387687947527795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/ttm: Really use a separate LRU list for swapped- and pinned objects (rev3)
URL   : https://patchwork.freedesktop.org/series/138103/
State : success

== Summary ==

CI Bug Log - changes from xe-1885-707f9d05c039aa43d5cbfc29573b642d3c43b618_BAT -> xe-pw-138103v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-138103v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_balancer@twice-virtual-userptr-rebind:
    - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2] ([Intel XE#877])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1885-707f9d05c039aa43d5cbfc29573b642d3c43b618/bat-bmg-1/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v3/bat-bmg-1/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html

  
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * Linux: xe-1885-707f9d05c039aa43d5cbfc29573b642d3c43b618 -> xe-pw-138103v3

  IGT_8001: d3a77fc98e89cc94b03be2b0903d44f83480b8a0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1885-707f9d05c039aa43d5cbfc29573b642d3c43b618: 707f9d05c039aa43d5cbfc29573b642d3c43b618
  xe-pw-138103v3: 138103v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v3/index.html

--===============0155387687947527795==
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
<tr><td><b>Series:</b></td><td>drm/ttm: Really use a separate LRU list for swapped- and pinned objects (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138103/">https://patchwork.freedesktop.org/series/138103/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1885-707f9d05c039aa43d5cbfc29573b642d3c43b618_BAT -&gt; xe-pw-138103v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-138103v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_balancer@twice-virtual-userptr-rebind:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1885-707f9d05c039aa43d5cbfc29573b642d3c43b618/bat-bmg-1/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138103v3/bat-bmg-1/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1885-707f9d05c039aa43d5cbfc29573b642d3c43b618 -&gt; xe-pw-138103v3</li>
</ul>
<p>IGT_8001: d3a77fc98e89cc94b03be2b0903d44f83480b8a0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1885-707f9d05c039aa43d5cbfc29573b642d3c43b618: 707f9d05c039aa43d5cbfc29573b642d3c43b618<br />
  xe-pw-138103v3: 138103v3</p>

</body>
</html>

--===============0155387687947527795==--

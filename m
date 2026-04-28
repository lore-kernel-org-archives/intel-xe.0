Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43ECCFF885D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 08:28:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50D810E03C;
	Tue, 28 Apr 2026 08:28:44 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50EC510E03C;
 Tue, 28 Apr 2026 08:28:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0982565278766161926=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_reclaim_to_the_dmem_cgr?=
 =?utf-8?q?oup_controller_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 Apr 2026 08:28:43 -0000
Message-ID: <177736492331.17650.13682168525596443744@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260428073116.15687-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260428073116.15687-1-thomas.hellstrom@linux.intel.com>
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

--===============0982565278766161926==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add reclaim to the dmem cgroup controller (rev2)
URL   : https://patchwork.freedesktop.org/series/163970/
State : success

== Summary ==

CI Bug Log - changes from xe-4944-aea2c496abcf55b647c14fe720bfc4ea555aac6a_BAT -> xe-pw-163970v2_BAT
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

  * Linux: xe-4944-aea2c496abcf55b647c14fe720bfc4ea555aac6a -> xe-pw-163970v2

  IGT_8874: 4568b2c141ab630c34f8eb2b9afab8cbf8f3ce9e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4944-aea2c496abcf55b647c14fe720bfc4ea555aac6a: aea2c496abcf55b647c14fe720bfc4ea555aac6a
  xe-pw-163970v2: 163970v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163970v2/index.html

--===============0982565278766161926==
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
<tr><td><b>Series:</b></td><td>Add reclaim to the dmem cgroup controller (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163970/">https://patchwork.freedesktop.org/series/163970/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163970v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163970v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4944-aea2c496abcf55b647c14fe720bfc4ea555aac6a_BAT -&gt; xe-pw-163970v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4944-aea2c496abcf55b647c14fe720bfc4ea555aac6a -&gt; xe-pw-163970v2</li>
</ul>
<p>IGT_8874: 4568b2c141ab630c34f8eb2b9afab8cbf8f3ce9e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4944-aea2c496abcf55b647c14fe720bfc4ea555aac6a: aea2c496abcf55b647c14fe720bfc4ea555aac6a<br />
  xe-pw-163970v2: 163970v2</p>

</body>
</html>

--===============0982565278766161926==--

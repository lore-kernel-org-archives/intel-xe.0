Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAEFCD98C7
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 20:49:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A62B10E865;
	Thu, 11 Jun 2026 20:49:29 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060E010E865;
 Thu, 11 Jun 2026 20:49:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8167999631024273629=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_reclaim_to_the_dmem_cgr?=
 =?utf-8?q?oup_controller_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Jun 2026 20:49:28 -0000
Message-ID: <178121096801.69949.3702839913139638554@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260611173301.17473-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260611173301.17473-1-thomas.hellstrom@linux.intel.com>
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

--===============8167999631024273629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add reclaim to the dmem cgroup controller (rev6)
URL   : https://patchwork.freedesktop.org/series/163970/
State : success

== Summary ==

CI Bug Log - changes from xe-5243-eebb2a1700eaa412ee8e0843bafce7bc5025638b_BAT -> xe-pw-163970v6_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-163970v6_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@engine:
    - bat-ptl-1:          [PASS][1] -> [FAIL][2] ([Intel XE#6519])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5243-eebb2a1700eaa412ee8e0843bafce7bc5025638b/bat-ptl-1/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163970v6/bat-ptl-1/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * Linux: xe-5243-eebb2a1700eaa412ee8e0843bafce7bc5025638b -> xe-pw-163970v6

  IGT_8959: 77337ca2d2dd470f3b32f1cf4760b0e79a52e2b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5243-eebb2a1700eaa412ee8e0843bafce7bc5025638b: eebb2a1700eaa412ee8e0843bafce7bc5025638b
  xe-pw-163970v6: 163970v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163970v6/index.html

--===============8167999631024273629==
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
<tr><td><b>Series:</b></td><td>Add reclaim to the dmem cgroup controller (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163970/">https://patchwork.freedesktop.org/series/163970/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163970v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163970v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5243-eebb2a1700eaa412ee8e0843bafce7bc5025638b_BAT -&gt; xe-pw-163970v6_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-163970v6_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5243-eebb2a1700eaa412ee8e0843bafce7bc5025638b/bat-ptl-1/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163970v6/bat-ptl-1/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5243-eebb2a1700eaa412ee8e0843bafce7bc5025638b -&gt; xe-pw-163970v6</li>
</ul>
<p>IGT_8959: 77337ca2d2dd470f3b32f1cf4760b0e79a52e2b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5243-eebb2a1700eaa412ee8e0843bafce7bc5025638b: eebb2a1700eaa412ee8e0843bafce7bc5025638b<br />
  xe-pw-163970v6: 163970v6</p>

</body>
</html>

--===============8167999631024273629==--

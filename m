Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6098BC021A0
	for <intel-xe@archiver.kernel.org>; Mon, 17 Feb 2025 08:27:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CD710E399;
	Mon, 17 Feb 2025 08:27:24 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9C610E399;
 Mon, 17 Feb 2025 08:27:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4982747906206460443=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bv2?=
 =?utf-8?q?=2C1/3=5D_drm/xe/userptr=3A_restore_invalidation_list_on_error_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 17 Feb 2025 08:27:23 -0000
Message-ID: <173978084317.3201128.8176244397761181106@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250214170527.272182-4-matthew.auld@intel.com>
In-Reply-To: <20250214170527.272182-4-matthew.auld@intel.com>
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

--===============4982747906206460443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v2,1/3] drm/xe/userptr: restore invalidation list on error (rev2)
URL   : https://patchwork.freedesktop.org/series/144896/
State : success

== Summary ==

CI Bug Log - changes from xe-2673-6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934_BAT -> xe-pw-144896v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-144896v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-FAIL][2] ([Intel XE#3890]) +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2673-6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144896v2/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  
  [Intel XE#3890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3890


Build changes
-------------

  * Linux: xe-2673-6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934 -> xe-pw-144896v2

  IGT_8231: 8231
  xe-2673-6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934: 6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934
  xe-pw-144896v2: 144896v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144896v2/index.html

--===============4982747906206460443==
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
<tr><td><b>Series:</b></td><td>series starting with [v2,1/3] drm/xe/userptr: restore invalidation list on error (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144896/">https://patchwork.freedesktop.org/series/144896/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144896v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144896v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2673-6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934_BAT -&gt; xe-pw-144896v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144896v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_migrate:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2673-6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144896v2/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3890">Intel XE#3890</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2673-6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934 -&gt; xe-pw-144896v2</li>
</ul>
<p>IGT_8231: 8231<br />
  xe-2673-6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934: 6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934<br />
  xe-pw-144896v2: 144896v2</p>

</body>
</html>

--===============4982747906206460443==--

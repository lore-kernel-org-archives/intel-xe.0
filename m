Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302FAC28B2E
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 06:02:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF46E10E011;
	Tue, 11 Mar 2025 06:02:05 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C82510E011;
 Tue, 11 Mar 2025 06:02:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4282879133642945789=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/xe3lpd=3A_Update_b?=
 =?utf-8?q?andwidth_parameters_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Mar 2025 06:02:05 -0000
Message-ID: <174167292557.16838.11943391787691181139@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250310-xe3lpd-bandwidth-update-v4-0-4191964b034d@intel.com>
In-Reply-To: <20250310-xe3lpd-bandwidth-update-v4-0-4191964b034d@intel.com>
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

--===============4282879133642945789==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/xe3lpd: Update bandwidth parameters (rev4)
URL   : https://patchwork.freedesktop.org/series/144440/
State : success

== Summary ==

CI Bug Log - changes from xe-2789-714f93e4c086c6e07187597bd446752f5f65b544_BAT -> xe-pw-144440v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-144440v4_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_basic@twice-rebind:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#4491])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2789-714f93e4c086c6e07187597bd446752f5f65b544/bat-adlp-vf/igt@xe_exec_basic@twice-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144440v4/bat-adlp-vf/igt@xe_exec_basic@twice-rebind.html

  
  [Intel XE#4491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491


Build changes
-------------

  * Linux: xe-2789-714f93e4c086c6e07187597bd446752f5f65b544 -> xe-pw-144440v4

  IGT_8269: 8269
  xe-2789-714f93e4c086c6e07187597bd446752f5f65b544: 714f93e4c086c6e07187597bd446752f5f65b544
  xe-pw-144440v4: 144440v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144440v4/index.html

--===============4282879133642945789==
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
<tr><td><b>Series:</b></td><td>drm/i915/xe3lpd: Update bandwidth parameters (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144440/">https://patchwork.freedesktop.org/series/144440/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144440v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144440v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2789-714f93e4c086c6e07187597bd446752f5f65b544_BAT -&gt; xe-pw-144440v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144440v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_basic@twice-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2789-714f93e4c086c6e07187597bd446752f5f65b544/bat-adlp-vf/igt@xe_exec_basic@twice-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144440v4/bat-adlp-vf/igt@xe_exec_basic@twice-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491">Intel XE#4491</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2789-714f93e4c086c6e07187597bd446752f5f65b544 -&gt; xe-pw-144440v4</li>
</ul>
<p>IGT_8269: 8269<br />
  xe-2789-714f93e4c086c6e07187597bd446752f5f65b544: 714f93e4c086c6e07187597bd446752f5f65b544<br />
  xe-pw-144440v4: 144440v4</p>

</body>
</html>

--===============4282879133642945789==--

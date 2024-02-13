Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3CEC4829A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 23:37:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB5810E971;
	Tue, 13 Feb 2024 23:37:31 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3B110E971;
 Tue, 13 Feb 2024 23:37:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2620553515333016832=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/guc=3A_Promote_GUC=5FGGTT?=
 =?utf-8?q?=5FTOP_definition_to_regs/xe=5Fguc=5Fregs=2Eh?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Feb 2024 23:37:30 -0000
Message-ID: <170786745016.1218995.13158430192379242586@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240213213634.1437-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240213213634.1437-1-michal.wajdeczko@intel.com>
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

--===============2620553515333016832==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Promote GUC_GGTT_TOP definition to regs/xe_guc_regs.h
URL   : https://patchwork.freedesktop.org/series/129856/
State : success

== Summary ==

CI Bug Log - changes from xe-775-e3e6421a490e14b441f0ace4fe3cf45f70aa5c11_BAT -> xe-pw-129856v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-129856v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - bat-dg2-oem2:       [INCOMPLETE][1] ([Intel XE#1169]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-775-e3e6421a490e14b441f0ace4fe3cf45f70aa5c11/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129856v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html

  
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169


Build changes
-------------

  * Linux: xe-775-e3e6421a490e14b441f0ace4fe3cf45f70aa5c11 -> xe-pw-129856v1

  IGT_7711: 7711
  xe-775-e3e6421a490e14b441f0ace4fe3cf45f70aa5c11: e3e6421a490e14b441f0ace4fe3cf45f70aa5c11
  xe-pw-129856v1: 129856v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129856v1/index.html

--===============2620553515333016832==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Promote GUC_GGTT_TOP definition to regs/xe_guc_regs.h</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129856/">https://patchwork.freedesktop.org/series/129856/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129856v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129856v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-775-e3e6421a490e14b441f0ace4fe3cf45f70aa5c11_BAT -&gt; xe-pw-129856v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-129856v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-fd-basic:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-775-e3e6421a490e14b441f0ace4fe3cf45f70aa5c11/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129856v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-775-e3e6421a490e14b441f0ace4fe3cf45f70aa5c11 -&gt; xe-pw-129856v1</li>
</ul>
<p>IGT_7711: 7711<br />
  xe-775-e3e6421a490e14b441f0ace4fe3cf45f70aa5c11: e3e6421a490e14b441f0ace4fe3cf45f70aa5c11<br />
  xe-pw-129856v1: 129856v1</p>

</body>
</html>

--===============2620553515333016832==--

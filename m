Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C86C87FD2
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 16:06:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F4010E969;
	Fri,  8 Aug 2025 16:06:30 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE45310E969;
 Fri,  8 Aug 2025 16:06:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5837943477758505016=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/migrate=3A_make_MI?=
 =?utf-8?q?=5FTLB=5FINVALIDATE_conditional_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 Aug 2025 16:06:29 -0000
Message-ID: <175466918990.222611.11285465565476090620@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250808110452.467513-2-matthew.auld@intel.com>
In-Reply-To: <20250808110452.467513-2-matthew.auld@intel.com>
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

--===============5837943477758505016==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/migrate: make MI_TLB_INVALIDATE conditional (rev4)
URL   : https://patchwork.freedesktop.org/series/150574/
State : success

== Summary ==

CI Bug Log - changes from xe-3518-2632d3c5d7f7c1b80996fc74d27bed6612a0ff9b_BAT -> xe-pw-150574v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 9)
------------------------------

  Missing    (2): bat-adlp-vm bat-ptl-vm 

Known issues
------------

  Here are the changes found in xe-pw-150574v4_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_vm@bind-execqueues-independent:
    - {bat-ptl-1}:        [FAIL][1] ([Intel XE#5783]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3518-2632d3c5d7f7c1b80996fc74d27bed6612a0ff9b/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150574v4/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * Linux: xe-3518-2632d3c5d7f7c1b80996fc74d27bed6612a0ff9b -> xe-pw-150574v4

  IGT_8489: 4972020ea0f3d0ac8a0d7dd4f5419119b1b30995 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3518-2632d3c5d7f7c1b80996fc74d27bed6612a0ff9b: 2632d3c5d7f7c1b80996fc74d27bed6612a0ff9b
  xe-pw-150574v4: 150574v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150574v4/index.html

--===============5837943477758505016==
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
<tr><td><b>Series:</b></td><td>drm/xe/migrate: make MI_TLB_INVALIDATE conditional (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150574/">https://patchwork.freedesktop.org/series/150574/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150574v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150574v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3518-2632d3c5d7f7c1b80996fc74d27bed6612a0ff9b_BAT -&gt; xe-pw-150574v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 9)</h2>
<p>Missing    (2): bat-adlp-vm bat-ptl-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-150574v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_vm@bind-execqueues-independent:<ul>
<li>{bat-ptl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3518-2632d3c5d7f7c1b80996fc74d27bed6612a0ff9b/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783">Intel XE#5783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150574v4/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3518-2632d3c5d7f7c1b80996fc74d27bed6612a0ff9b -&gt; xe-pw-150574v4</li>
</ul>
<p>IGT_8489: 4972020ea0f3d0ac8a0d7dd4f5419119b1b30995 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3518-2632d3c5d7f7c1b80996fc74d27bed6612a0ff9b: 2632d3c5d7f7c1b80996fc74d27bed6612a0ff9b<br />
  xe-pw-150574v4: 150574v4</p>

</body>
</html>

--===============5837943477758505016==--

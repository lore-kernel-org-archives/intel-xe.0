Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D175FC36000
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 14:40:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9483010E7E2;
	Fri, 21 Mar 2025 14:40:44 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42E110E7E2;
 Fri, 21 Mar 2025 14:40:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4207638599466496877=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Simplify_pinned_b?=
 =?utf-8?q?o_iteration_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Mar 2025 14:40:43 -0000
Message-ID: <174256804392.64941.4216587206357617827@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250321133709.75327-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250321133709.75327-1-thomas.hellstrom@linux.intel.com>
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

--===============4207638599466496877==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Simplify pinned bo iteration (rev2)
URL   : https://patchwork.freedesktop.org/series/146586/
State : success

== Summary ==

CI Bug Log - changes from xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396_BAT -> xe-pw-146586v2_BAT
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

  Here are the changes found in xe-pw-146586v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_vm@munmap-style-unbind-one-partial:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#4491])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-one-partial.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-one-partial.html

  
  [Intel XE#4491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491


Build changes
-------------

  * Linux: xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396 -> xe-pw-146586v2

  IGT_8277: 8277
  xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396: b15a87713d14b1c2986f47a622c5a8c5458e2396
  xe-pw-146586v2: 146586v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/index.html

--===============4207638599466496877==
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
<tr><td><b>Series:</b></td><td>drm/xe: Simplify pinned bo iteration (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146586/">https://patchwork.freedesktop.org/series/146586/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396_BAT -&gt; xe-pw-146586v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-146586v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_vm@munmap-style-unbind-one-partial:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-one-partial.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146586v2/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-one-partial.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491">Intel XE#4491</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396 -&gt; xe-pw-146586v2</li>
</ul>
<p>IGT_8277: 8277<br />
  xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396: b15a87713d14b1c2986f47a622c5a8c5458e2396<br />
  xe-pw-146586v2: 146586v2</p>

</body>
</html>

--===============4207638599466496877==--

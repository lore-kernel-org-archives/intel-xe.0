Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14039C54791
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 11:19:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F2810F316;
	Wed, 13 Mar 2024 11:19:17 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0489310F316;
 Wed, 13 Mar 2024 11:19:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6934506695760780814=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_series_starting_with_=5BCI=2C1/7?=
 =?utf-8?q?=5D_drm/xe=3A_Make_TLB_invalidation_fences_unordered_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Mar 2024 11:19:16 -0000
Message-ID: <171032875601.730296.6873432994187885170@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240312153459.10185-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240312153459.10185-1-thomas.hellstrom@linux.intel.com>
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

--===============6934506695760780814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [CI,1/7] drm/xe: Make TLB invalidation fences unordered (rev2)
URL   : https://patchwork.freedesktop.org/series/131036/
State : failure

== Summary ==

CI Bug Log - changes from xe-932-8762453258673794e13e4d59cb9df1042b97ba01_BAT -> xe-pw-131036v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-131036v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-131036v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-pvc-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-131036v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_evict@evict-cm-threads-small:
    - bat-dg2-oem2:       [PASS][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-932-8762453258673794e13e4d59cb9df1042b97ba01/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v2/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html

  


Build changes
-------------

  * IGT: IGT_7757 -> IGT_7759
  * Linux: xe-932-8762453258673794e13e4d59cb9df1042b97ba01 -> xe-pw-131036v2

  IGT_7757: 7757
  IGT_7759: 7759
  xe-932-8762453258673794e13e4d59cb9df1042b97ba01: 8762453258673794e13e4d59cb9df1042b97ba01
  xe-pw-131036v2: 131036v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v2/index.html

--===============6934506695760780814==
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
<tr><td><b>Series:</b></td><td>series starting with [CI,1/7] drm/xe: Make TLB invalidation fences unordered (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131036/">https://patchwork.freedesktop.org/series/131036/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-932-8762453258673794e13e4d59cb9df1042b97ba01_BAT -&gt; xe-pw-131036v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-131036v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-131036v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-pvc-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-131036v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_evict@evict-cm-threads-small:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-932-8762453258673794e13e4d59cb9df1042b97ba01/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v2/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7757 -&gt; IGT_7759</li>
<li>Linux: xe-932-8762453258673794e13e4d59cb9df1042b97ba01 -&gt; xe-pw-131036v2</li>
</ul>
<p>IGT_7757: 7757<br />
  IGT_7759: 7759<br />
  xe-932-8762453258673794e13e4d59cb9df1042b97ba01: 8762453258673794e13e4d59cb9df1042b97ba01<br />
  xe-pw-131036v2: 131036v2</p>

</body>
</html>

--===============6934506695760780814==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4219AC25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 10:40:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D70F710E853;
	Tue, 21 May 2024 10:40:42 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADFD10E853;
 Tue, 21 May 2024 10:40:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1192593984995992677=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Custom_GuC_initialization_if_VF_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 May 2024 10:40:40 -0000
Message-ID: <171628804069.2162685.11725903664389294165@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240521092518.624-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240521092518.624-1-michal.wajdeczko@intel.com>
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

--===============1192593984995992677==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Custom GuC initialization if VF (rev2)
URL   : https://patchwork.freedesktop.org/series/133832/
State : success

== Summary ==

CI Bug Log - changes from xe-1313-362550fd170e1450157834793cf333b521d96133_BAT -> xe-pw-133832v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-133832v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr:
    - bat-pvc-2:          [PASS][1] -> [INCOMPLETE][2] ([Intel XE#1044])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1313-362550fd170e1450157834793cf333b521d96133/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133832v2/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html

  
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044


Build changes
-------------

  * Linux: xe-1313-362550fd170e1450157834793cf333b521d96133 -> xe-pw-133832v2

  IGT_7864: 8eff53c9664fa0abaa55b403c9f10f96260e44b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1313-362550fd170e1450157834793cf333b521d96133: 362550fd170e1450157834793cf333b521d96133
  xe-pw-133832v2: 133832v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133832v2/index.html

--===============1192593984995992677==
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
<tr><td><b>Series:</b></td><td>Custom GuC initialization if VF (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133832/">https://patchwork.freedesktop.org/series/133832/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133832v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133832v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1313-362550fd170e1450157834793cf333b521d96133_BAT -&gt; xe-pw-133832v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133832v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1313-362550fd170e1450157834793cf333b521d96133/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133832v2/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1313-362550fd170e1450157834793cf333b521d96133 -&gt; xe-pw-133832v2</li>
</ul>
<p>IGT_7864: 8eff53c9664fa0abaa55b403c9f10f96260e44b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1313-362550fd170e1450157834793cf333b521d96133: 362550fd170e1450157834793cf333b521d96133<br />
  xe-pw-133832v2: 133832v2</p>

</body>
</html>

--===============1192593984995992677==--

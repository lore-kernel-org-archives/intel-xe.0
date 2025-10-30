Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFBDCCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 15:16:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C8E10E9DA;
	Thu, 30 Oct 2025 15:16:30 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C3810E9DA;
 Thu, 30 Oct 2025 15:16:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5536008204628907724=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Improve_VMA_merging_for_CPU?=
 =?utf-8?q?-address-mirrored_mappings_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Oct 2025 15:16:29 -0000
Message-ID: <176183738914.189.13301881341427126962@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251030145253.867189-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20251030145253.867189-1-himal.prasad.ghimiray@intel.com>
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

--===============5536008204628907724==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Improve VMA merging for CPU-address-mirrored mappings (rev3)
URL   : https://patchwork.freedesktop.org/series/154832/
State : failure

== Summary ==

CI Bug Log - changes from xe-4010-4620927448abb5be2d197b0254b042728205c258_BAT -> xe-pw-154832v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-154832v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-154832v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-154832v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_basic@twice-userptr:
    - bat-bmg-2:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4010-4620927448abb5be2d197b0254b042728205c258/bat-bmg-2/igt@xe_exec_basic@twice-userptr.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v3/bat-bmg-2/igt@xe_exec_basic@twice-userptr.html

  


Build changes
-------------

  * Linux: xe-4010-4620927448abb5be2d197b0254b042728205c258 -> xe-pw-154832v3

  IGT_8601: cd39f1cab2d1e96a73fb742253f692e796f8feda @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4010-4620927448abb5be2d197b0254b042728205c258: 4620927448abb5be2d197b0254b042728205c258
  xe-pw-154832v3: 154832v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v3/index.html

--===============5536008204628907724==
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
<tr><td><b>Series:</b></td><td>Improve VMA merging for CPU-address-mirrored mappings (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154832/">https://patchwork.freedesktop.org/series/154832/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4010-4620927448abb5be2d197b0254b042728205c258_BAT -&gt; xe-pw-154832v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-154832v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-154832v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-154832v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_basic@twice-userptr:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4010-4620927448abb5be2d197b0254b042728205c258/bat-bmg-2/igt@xe_exec_basic@twice-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154832v3/bat-bmg-2/igt@xe_exec_basic@twice-userptr.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4010-4620927448abb5be2d197b0254b042728205c258 -&gt; xe-pw-154832v3</li>
</ul>
<p>IGT_8601: cd39f1cab2d1e96a73fb742253f692e796f8feda @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4010-4620927448abb5be2d197b0254b042728205c258: 4620927448abb5be2d197b0254b042728205c258<br />
  xe-pw-154832v3: 154832v3</p>

</body>
</html>

--===============5536008204628907724==--

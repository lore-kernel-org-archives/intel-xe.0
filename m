Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 875FEC3DA6E
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 03:26:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2298F10E0F8;
	Wed, 10 Jan 2024 03:26:42 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F8410E0F8;
 Wed, 10 Jan 2024 03:26:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0445278261802324050=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_GSC_proxy_support_=28r?=
 =?utf-8?q?ev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Wed, 10 Jan 2024 03:26:40 -0000
Message-ID: <170485720027.240792.2189214503742896527@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240110004416.1127942-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240110004416.1127942-1-daniele.ceraolospurio@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============0445278261802324050==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: GSC proxy support (rev2)
URL   : https://patchwork.freedesktop.org/series/127657/
State : failure

== Summary ==

CI Bug Log - changes from xe-613-c170f452b2634a920b2251f825648abaca53e5cb_BAT -> xe-pw-127657v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-127657v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-127657v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-127657v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr:
    - bat-atsm-2:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-613-c170f452b2634a920b2251f825648abaca53e5cb/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127657v2/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html

  
Known issues
------------

  Here are the changes found in xe-pw-127657v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [PASS][3] -> [FAIL][4] ([Intel XE#480])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-613-c170f452b2634a920b2251f825648abaca53e5cb/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127657v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         [FAIL][5] ([Intel XE#480]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-613-c170f452b2634a920b2251f825648abaca53e5cb/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127657v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480


Build changes
-------------

  * Linux: xe-613-c170f452b2634a920b2251f825648abaca53e5cb -> xe-pw-127657v2

  IGT_7664: 5b8a8dcca7711c73f9cfeb66b5deb27751290fb4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-613-c170f452b2634a920b2251f825648abaca53e5cb: c170f452b2634a920b2251f825648abaca53e5cb
  xe-pw-127657v2: 127657v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127657v2/index.html

--===============0445278261802324050==
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
<tr><td><b>Series:</b></td><td>drm/xe: GSC proxy support (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127657/">https://patchwork.freedesktop.org/series/127657/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127657v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127657v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-613-c170f452b2634a920b2251f825648abaca53e5cb_BAT -&gt; xe-pw-127657v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-127657v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-127657v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-127657v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-613-c170f452b2634a920b2251f825648abaca53e5cb/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127657v2/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-127657v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-613-c170f452b2634a920b2251f825648abaca53e5cb/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127657v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-613-c170f452b2634a920b2251f825648abaca53e5cb/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127657v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-613-c170f452b2634a920b2251f825648abaca53e5cb -&gt; xe-pw-127657v2</li>
</ul>
<p>IGT_7664: 5b8a8dcca7711c73f9cfeb66b5deb27751290fb4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-613-c170f452b2634a920b2251f825648abaca53e5cb: c170f452b2634a920b2251f825648abaca53e5cb<br />
  xe-pw-127657v2: 127657v2</p>

</body>
</html>

--===============0445278261802324050==--

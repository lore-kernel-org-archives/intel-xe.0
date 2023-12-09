Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB609C4167B
	for <intel-xe@archiver.kernel.org>; Sat,  9 Dec 2023 16:28:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFFF10E1C6;
	Sat,  9 Dec 2023 16:28:53 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id EC31010E1C6;
 Sat,  9 Dec 2023 16:28:50 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E326EA47DF;
 Sat,  9 Dec 2023 16:28:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1823645658133556188=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Huge_PTE_and_scratch_page_update?=
 =?utf-8?q?s_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Sat, 09 Dec 2023 16:28:50 -0000
Message-ID: <170213933089.20046.2015750860441748879@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231209151843.7903-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231209151843.7903-1-thomas.hellstrom@linux.intel.com>
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

--===============1823645658133556188==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Huge PTE and scratch page updates (rev2)
URL   : https://patchwork.freedesktop.org/series/127565/
State : success

== Summary ==

CI Bug Log - changes from xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9_BAT -> xe-pw-127565v2_BAT
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

  Here are the changes found in xe-pw-127565v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3:
    - bat-dg2-oem2:       [FAIL][1] ([Intel XE#480]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127565v2/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html

  
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480


Build changes
-------------

  * IGT: IGT_7629 -> IGT_7631
  * Linux: xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9 -> xe-pw-127565v2

  IGT_7629: 1dd73105a01e092da7954f9552ec0c67ed8a9f4e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7631: 0e10197156be74f7b43254e59da32185e0f9b229 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9: 1fc141d1f445b8e5ab4ff14645b0482dd98460b9
  xe-pw-127565v2: 127565v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127565v2/index.html

--===============1823645658133556188==
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
<tr><td><b>Series:</b></td><td>Huge PTE and scratch page updates (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127565/">https://patchwork.freedesktop.org/series/127565/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127565v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127565v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9_BAT -&gt; xe-pw-127565v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-127565v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127565v2/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7629 -&gt; IGT_7631</li>
<li>Linux: xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9 -&gt; xe-pw-127565v2</li>
</ul>
<p>IGT_7629: 1dd73105a01e092da7954f9552ec0c67ed8a9f4e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7631: 0e10197156be74f7b43254e59da32185e0f9b229 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-565-1fc141d1f445b8e5ab4ff14645b0482dd98460b9: 1fc141d1f445b8e5ab4ff14645b0482dd98460b9<br />
  xe-pw-127565v2: 127565v2</p>

</body>
</html>

--===============1823645658133556188==--

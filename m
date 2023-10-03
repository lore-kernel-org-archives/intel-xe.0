Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9FAE7AD58
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 14:33:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1482E10E191;
	Tue,  3 Oct 2023 14:33:45 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id ABD5710E191;
 Tue,  3 Oct 2023 14:33:43 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A559AAADE8;
 Tue,  3 Oct 2023 14:33:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3078481400159380752=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Tue, 03 Oct 2023 14:33:43 -0000
Message-ID: <169634362364.4381.2021382016405794474@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231003125217.3350838-1-lucas.demarchi@intel.com>
In-Reply-To: <20231003125217.3350838-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_xe2=3A_Ad?=
 =?utf-8?q?d_PAT_programming_=28rev2=29?=
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

--===============3078481400159380752==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe2: Add PAT programming (rev2)
URL   : https://patchwork.freedesktop.org/series/124430/
State : success

== Summary ==

CI Bug Log - changes from xe-410-02ab43e36623665d8644d46162bd4ec5eeb68489_BAT -> xe-pw-124430v2_BAT
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

  Here are the changes found in xe-pw-124430v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#480]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-410-02ab43e36623665d8644d46162bd4ec5eeb68489/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124430v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480


Build changes
-------------

  * IGT: IGT_7508 -> IGT_7510
  * Linux: xe-410-02ab43e36623665d8644d46162bd4ec5eeb68489 -> xe-pw-124430v2

  IGT_7508: f366406b05ca6b3d16eaa734a91e0833bd159f54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7510: a4b4a33d8312e4e30ca23d26bbd1758e56540e1d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-410-02ab43e36623665d8644d46162bd4ec5eeb68489: 02ab43e36623665d8644d46162bd4ec5eeb68489
  xe-pw-124430v2: 124430v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124430v2/index.html

--===============3078481400159380752==
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
<tr><td><b>Series:</b></td><td>xe2: Add PAT programming (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124430/">https://patchwork.freedesktop.org/series/124430/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124430v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124430v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-410-02ab43e36623665d8644d46162bd4ec5eeb68489_BAT -&gt; xe-pw-124430v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-124430v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-410-02ab43e36623665d8644d46162bd4ec5eeb68489/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124430v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7508 -&gt; IGT_7510</li>
<li>Linux: xe-410-02ab43e36623665d8644d46162bd4ec5eeb68489 -&gt; xe-pw-124430v2</li>
</ul>
<p>IGT_7508: f366406b05ca6b3d16eaa734a91e0833bd159f54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7510: a4b4a33d8312e4e30ca23d26bbd1758e56540e1d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-410-02ab43e36623665d8644d46162bd4ec5eeb68489: 02ab43e36623665d8644d46162bd4ec5eeb68489<br />
  xe-pw-124430v2: 124430v2</p>

</body>
</html>

--===============3078481400159380752==--

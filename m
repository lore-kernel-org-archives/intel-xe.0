Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2818C87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 14:15:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAAB310E370;
	Wed, 30 Jul 2025 14:15:26 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09BDA10E370;
 Wed, 30 Jul 2025 14:15:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4653713512993969920=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_MADVISE_SQUASH_fo?=
 =?utf-8?q?r_CI-v5=5Faddressed=5F=5Fwith=5Fgpuvm=5Fchanges_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 30 Jul 2025 14:15:25 -0000
Message-ID: <175388492503.199285.12027324011049815849@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250730124728.1001126-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250730124728.1001126-1-himal.prasad.ghimiray@intel.com>
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

--===============4653713512993969920==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: MADVISE SQUASH for CI-v5_addressed__with_gpuvm_changes (rev2)
URL   : https://patchwork.freedesktop.org/series/152280/
State : success

== Summary ==

CI Bug Log - changes from xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796_BAT -> xe-pw-152280v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-152280v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#4543]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152280v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * IGT: IGT_8478 -> IGT_8479
  * Linux: xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796 -> xe-pw-152280v2

  IGT_8478: 3e7c2bd685397f852853878aef4d9c1e4889a28b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8479: 5fea7ca6493415ce108231b0ff29f02d293f9aa6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796: e1805ad9a7175457902ae453ea67b76194e7d796
  xe-pw-152280v2: 152280v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152280v2/index.html

--===============4653713512993969920==
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
<tr><td><b>Series:</b></td><td>drm/xe: MADVISE SQUASH for CI-v5_addressed__with_gpuvm_changes (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152280/">https://patchwork.freedesktop.org/series/152280/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152280v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152280v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796_BAT -&gt; xe-pw-152280v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152280v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152280v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8478 -&gt; IGT_8479</li>
<li>Linux: xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796 -&gt; xe-pw-152280v2</li>
</ul>
<p>IGT_8478: 3e7c2bd685397f852853878aef4d9c1e4889a28b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8479: 5fea7ca6493415ce108231b0ff29f02d293f9aa6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796: e1805ad9a7175457902ae453ea67b76194e7d796<br />
  xe-pw-152280v2: 152280v2</p>

</body>
</html>

--===============4653713512993969920==--

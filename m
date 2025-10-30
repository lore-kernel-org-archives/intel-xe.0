Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696ADCCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 18:21:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 146F410E8BC;
	Thu, 30 Oct 2025 18:21:59 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F6610E8BC;
 Thu, 30 Oct 2025 18:21:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0448021029805590367=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/xe3=3A_Extend_wa=5F1?=
 =?utf-8?q?4023061436?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: tilak.tirumalesh.tangudu@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Oct 2025 18:21:58 -0000
Message-ID: <176184851807.1110.17120998143929064795@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251030154626.3124565-1-tilak.tirumalesh.tangudu@intel.com>
In-Reply-To: <20251030154626.3124565-1-tilak.tirumalesh.tangudu@intel.com>
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

--===============0448021029805590367==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe3: Extend wa_14023061436
URL   : https://patchwork.freedesktop.org/series/156768/
State : failure

== Summary ==

CI Bug Log - changes from xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63_BAT -> xe-pw-156768v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-156768v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-156768v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-156768v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_balancer@twice-parallel-rebind:
    - bat-pvc-2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/bat-pvc-2/igt@xe_exec_balancer@twice-parallel-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/bat-pvc-2/igt@xe_exec_balancer@twice-parallel-rebind.html

  
Known issues
------------

  Here are the changes found in xe-pw-156768v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-adlp-7:         [DMESG-WARN][3] ([Intel XE#4543]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * IGT: IGT_8602 -> IGT_8603
  * Linux: xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63 -> xe-pw-156768v1

  IGT_8602: dd1fe429664020db97237b4e77d594dd763a7eae @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8603: e6eb3c0fe0f28f3d6e530ae202fbb9f29bde9147 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63: 7fc84082559afd3f2019c4af5b1490548d58db63
  xe-pw-156768v1: 156768v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/index.html

--===============0448021029805590367==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe3: Extend wa_14023061436</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156768/">https://patchwork.freedesktop.org/series/156768/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63_BAT -&gt; xe-pw-156768v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-156768v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-156768v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-156768v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_balancer@twice-parallel-rebind:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/bat-pvc-2/igt@xe_exec_balancer@twice-parallel-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/bat-pvc-2/igt@xe_exec_balancer@twice-parallel-rebind.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156768v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-modeset:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8602 -&gt; IGT_8603</li>
<li>Linux: xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63 -&gt; xe-pw-156768v1</li>
</ul>
<p>IGT_8602: dd1fe429664020db97237b4e77d594dd763a7eae @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8603: e6eb3c0fe0f28f3d6e530ae202fbb9f29bde9147 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63: 7fc84082559afd3f2019c4af5b1490548d58db63<br />
  xe-pw-156768v1: 156768v1</p>

</body>
</html>

--===============0448021029805590367==--

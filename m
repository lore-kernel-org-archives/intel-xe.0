Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF0ECA0FE4
	for <intel-xe@archiver.kernel.org>; Fri,  1 Sep 2023 15:14:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 948DB10E80C;
	Fri,  1 Sep 2023 15:14:30 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5DF9D10E80C;
 Fri,  1 Sep 2023 15:14:29 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 54AC9AADD8;
 Fri,  1 Sep 2023 15:14:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8567035830310228187=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Fri, 01 Sep 2023 15:14:29 -0000
Message-ID: <169358126930.9814.14450837639691878078@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230901142629.4125-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230901142629.4125-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A?=
 =?utf-8?q?_Convert_to_drm=5Fexec_=28rev3=29?=
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

--===============8567035830310228187==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Convert to drm_exec (rev3)
URL   : https://patchwork.freedesktop.org/series/123100/
State : failure

== Summary ==

CI Bug Log - changes from xe-353-e4a0387635ffa6ccbc6207c9195896bcc4e59de2_BAT -> xe-pw-123100v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-123100v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-123100v3_BAT, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-123100v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-dg2-oem2:       [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-353-e4a0387635ffa6ccbc6207c9195896bcc4e59de2/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123100v3/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
    - bat-atsm-2:         [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-353-e4a0387635ffa6ccbc6207c9195896bcc4e59de2/bat-atsm-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123100v3/bat-atsm-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  
Known issues
------------

  Here are the changes found in xe-pw-123100v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [PASS][5] -> [FAIL][6] ([Intel XE#480])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-353-e4a0387635ffa6ccbc6207c9195896bcc4e59de2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123100v3/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         [FAIL][7] ([Intel XE#480]) -> [PASS][8] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-353-e4a0387635ffa6ccbc6207c9195896bcc4e59de2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123100v3/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480


Build changes
-------------

  * IGT: IGT_7463 -> IGT_7464
  * Linux: xe-353-e4a0387635ffa6ccbc6207c9195896bcc4e59de2 -> xe-pw-123100v3

  IGT_7463: 7463
  IGT_7464: 7464
  xe-353-e4a0387635ffa6ccbc6207c9195896bcc4e59de2: e4a0387635ffa6ccbc6207c9195896bcc4e59de2
  xe-pw-123100v3: 123100v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe//index.html

--===============8567035830310228187==
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
<tr><td><b>Series:</b></td><td>drm/xe: Convert to drm_exec (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123100/">https://patchwork.freedesktop.org/series/123100/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe//index.html">https://intel-gfx-ci.01.org/tree/intel-xe//index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-353-e4a0387635ffa6ccbc6207c9195896bcc4e59de2_BAT -&gt; xe-pw-123100v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-123100v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-123100v3_BAT, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-123100v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-353-e4a0387635ffa6ccbc6207c9195896bcc4e59de2/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123100v3/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">ABORT</a></p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-353-e4a0387635ffa6ccbc6207c9195896bcc4e59de2/bat-atsm-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123100v3/bat-atsm-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">ABORT</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-123100v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-353-e4a0387635ffa6ccbc6207c9195896bcc4e59de2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123100v3/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-353-e4a0387635ffa6ccbc6207c9195896bcc4e59de2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123100v3/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7463 -&gt; IGT_7464</li>
<li>Linux: xe-353-e4a0387635ffa6ccbc6207c9195896bcc4e59de2 -&gt; xe-pw-123100v3</li>
</ul>
<p>IGT_7463: 7463<br />
  IGT_7464: 7464<br />
  xe-353-e4a0387635ffa6ccbc6207c9195896bcc4e59de2: e4a0387635ffa6ccbc6207c9195896bcc4e59de2<br />
  xe-pw-123100v3: 123100v3</p>

</body>
</html>

--===============8567035830310228187==--

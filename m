Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCF7C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 07:32:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBBC10E697;
	Wed,  6 Dec 2023 07:32:19 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7944310E696;
 Wed,  6 Dec 2023 07:32:17 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 69A22AADD5;
 Wed,  6 Dec 2023 07:32:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8819632877645830559=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Wed, 06 Dec 2023 07:32:17 -0000
Message-ID: <170184793742.26425.6263443833135974862@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231206000030.3061046-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20231206000030.3061046-1-daniele.ceraolospurio@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Don=27t_t?=
 =?utf-8?q?ake_a_PM_ref_for_vm-less_permanent_queues?=
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

--===============8819632877645830559==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Don't take a PM ref for vm-less permanent queues
URL   : https://patchwork.freedesktop.org/series/127400/
State : success

== Summary ==

CI Bug Log - changes from xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a_BAT -> xe-pw-127400v1_BAT
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

  Here are the changes found in xe-pw-127400v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#480]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127400v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-7:         [FAIL][3] ([Intel XE#480]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127400v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-atsm-2:         [FAIL][5] ([Intel XE#999]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127400v1/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html

  
#### Warnings ####

  * igt@xe_prime_self_import@basic-with_one_bo:
    - bat-atsm-2:         [FAIL][7] -> [FAIL][8] ([Intel XE#999])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127400v1/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html
    - bat-pvc-2:          [FAIL][9] -> [FAIL][10] ([Intel XE#999]) +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-pvc-2/igt@xe_prime_self_import@basic-with_one_bo.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127400v1/bat-pvc-2/igt@xe_prime_self_import@basic-with_one_bo.html

  
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/999


Build changes
-------------

  * Linux: xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a -> xe-pw-127400v1

  IGT_7622: 48a47d91b7727215b965690c69d84159c8fb1aa2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a: 9d76164e08c68a3d5d081ff7b07c15a2cadf741a
  xe-pw-127400v1: 127400v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127400v1/index.html

--===============8819632877645830559==
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
<tr><td><b>Series:</b></td><td>Don&#39;t take a PM ref for vm-less permanent queues</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127400/">https://patchwork.freedesktop.org/series/127400/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127400v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127400v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a_BAT -&gt; xe-pw-127400v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-127400v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127400v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127400v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/999">Intel XE#999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127400v1/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_prime_self_import@basic-with_one_bo:</p>
<ul>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127400v1/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/999">Intel XE#999</a>)</p>
</li>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-pvc-2/igt@xe_prime_self_import@basic-with_one_bo.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127400v1/bat-pvc-2/igt@xe_prime_self_import@basic-with_one_bo.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/999">Intel XE#999</a>) +1 other test fail</p>
</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a -&gt; xe-pw-127400v1</li>
</ul>
<p>IGT_7622: 48a47d91b7727215b965690c69d84159c8fb1aa2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a: 9d76164e08c68a3d5d081ff7b07c15a2cadf741a<br />
  xe-pw-127400v1: 127400v1</p>

</body>
</html>

--===============8819632877645830559==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8BDC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 22:22:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F6310EA02;
	Mon, 15 Apr 2024 22:22:55 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F62F10EA02;
 Mon, 15 Apr 2024 22:22:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3951331199750165544=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Enable_device_atomics_with_a_VM_?=
 =?utf-8?q?bind_flag_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Apr 2024 22:22:54 -0000
Message-ID: <171321977458.1424052.747985465734865299@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240415145214.25641-1-nirmoy.das@intel.com>
In-Reply-To: <20240415145214.25641-1-nirmoy.das@intel.com>
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

--===============3951331199750165544==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable device atomics with a VM bind flag (rev3)
URL   : https://patchwork.freedesktop.org/series/132290/
State : failure

== Summary ==

CI Bug Log - changes from xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889_BAT -> xe-pw-132290v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-132290v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-132290v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-132290v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-1-tile-0-vram0-memory:
    - bat-pvc-2:          [PASS][1] -> [FAIL][2] +15 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/bat-pvc-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-1-tile-0-vram0-memory.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132290v3/bat-pvc-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-1-tile-0-vram0-memory.html

  


Build changes
-------------

  * Linux: xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889 -> xe-pw-132290v3

  IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889: 1bfe3965a846936d93b6e69385e53f1bd1c3b889
  xe-pw-132290v3: 132290v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132290v3/index.html

--===============3951331199750165544==
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
<tr><td><b>Series:</b></td><td>Enable device atomics with a VM bind flag (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132290/">https://patchwork.freedesktop.org/series/132290/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132290v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132290v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889_BAT -&gt; xe-pw-132290v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-132290v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-132290v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-132290v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-1-tile-0-vram0-memory:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889/bat-pvc-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-1-tile-0-vram0-memory.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132290v3/bat-pvc-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-1-tile-0-vram0-memory.html">FAIL</a> +15 other tests fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889 -&gt; xe-pw-132290v3</li>
</ul>
<p>IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1093-1bfe3965a846936d93b6e69385e53f1bd1c3b889: 1bfe3965a846936d93b6e69385e53f1bd1c3b889<br />
  xe-pw-132290v3: 132290v3</p>

</body>
</html>

--===============3951331199750165544==--

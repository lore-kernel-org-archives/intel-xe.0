Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91470606A326
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 17:34:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563F610E3EB;
	Fri,  6 Nov 2026 17:34:53 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2328010E3EB;
 Fri,  6 Nov 2026 17:34:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0617890624502031050=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/vf=3A_New_approach_f?=
 =?utf-8?q?or_post-migration_LRC_fixups_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomasz Lis" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Nov 2026 17:34:52 -0000
Message-ID: <179398649213.134038.14216278752678363728@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261106155615.977330-1-tomasz.lis@intel.com>
In-Reply-To: <20261106155615.977330-1-tomasz.lis@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0617890624502031050==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vf: New approach for post-migration LRC fixups (rev2)
URL   : https://patchwork.freedesktop.org/series/165741/
State : failure

== Summary ==

CI Bug Log - changes from xe-6081-ecd0e93e7ee855e1b0e3b51ade3d18333fc21ed4_BAT -> xe-pw-165741v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-165741v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-165741v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 11)
------------------------------

  Missing    (4): bat-bmg-1 bat-wcl-1 bat-wcl-2 bat-bmg-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-165741v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - bat-ptl-1:          [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6081-ecd0e93e7ee855e1b0e3b51ade3d18333fc21ed4/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165741v2/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - bat-nvls-2:         [PASS][3] -> [ABORT][4] +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6081-ecd0e93e7ee855e1b0e3b51ade3d18333fc21ed4/bat-nvls-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165741v2/bat-nvls-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - bat-atsm-2:         [PASS][5] -> [ABORT][6] +1 other test abort
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6081-ecd0e93e7ee855e1b0e3b51ade3d18333fc21ed4/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165741v2/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - bat-nvls-1:         [PASS][7] -> [ABORT][8] +1 other test abort
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6081-ecd0e93e7ee855e1b0e3b51ade3d18333fc21ed4/bat-nvls-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165741v2/bat-nvls-1/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - bat-ptl-2:          [PASS][9] -> [ABORT][10] +1 other test abort
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6081-ecd0e93e7ee855e1b0e3b51ade3d18333fc21ed4/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165741v2/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  * igt@xe_module_load@load:
    - bat-ptl-vm:         [PASS][11] -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6081-ecd0e93e7ee855e1b0e3b51ade3d18333fc21ed4/bat-ptl-vm/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165741v2/bat-ptl-vm/igt@xe_module_load@load.html
    - bat-bmg-vm:         [PASS][13] -> [ABORT][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6081-ecd0e93e7ee855e1b0e3b51ade3d18333fc21ed4/bat-bmg-vm/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165741v2/bat-bmg-vm/igt@xe_module_load@load.html

  


Build changes
-------------

  * Linux: xe-6081-ecd0e93e7ee855e1b0e3b51ade3d18333fc21ed4 -> xe-pw-165741v2

  IGT_9181: 9181
  xe-6081-ecd0e93e7ee855e1b0e3b51ade3d18333fc21ed4: ecd0e93e7ee855e1b0e3b51ade3d18333fc21ed4
  xe-pw-165741v2: 165741v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165741v2/index.html

--===============0617890624502031050==
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
<tr><td><b>Series:</b></td><td>drm/xe/vf: New approach for post-migration LRC fixups (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165741/">https://patchwork.freedesktop.org/series/165741/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165741v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165741v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6081-ecd0e93e7ee855e1b0e3b51ade3d18333fc21ed4_BAT -&gt; xe-pw-165741v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-165741v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-165741v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 11)</h2>
<p>Missing    (4): bat-bmg-1 bat-wcl-1 bat-wcl-2 bat-bmg-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-165741v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6081-ecd0e93e7ee855e1b0e3b51ade3d18333fc21ed4/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165741v2/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">ABORT</a> +1 other test abort</li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6081-ecd0e93e7ee855e1b0e3b51ade3d18333fc21ed4/bat-nvls-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165741v2/bat-nvls-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">ABORT</a> +1 other test abort</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6081-ecd0e93e7ee855e1b0e3b51ade3d18333fc21ed4/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165741v2/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">ABORT</a> +1 other test abort</li>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6081-ecd0e93e7ee855e1b0e3b51ade3d18333fc21ed4/bat-nvls-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165741v2/bat-nvls-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6081-ecd0e93e7ee855e1b0e3b51ade3d18333fc21ed4/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165741v2/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6081-ecd0e93e7ee855e1b0e3b51ade3d18333fc21ed4/bat-ptl-vm/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165741v2/bat-ptl-vm/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6081-ecd0e93e7ee855e1b0e3b51ade3d18333fc21ed4/bat-bmg-vm/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165741v2/bat-bmg-vm/igt@xe_module_load@load.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6081-ecd0e93e7ee855e1b0e3b51ade3d18333fc21ed4 -&gt; xe-pw-165741v2</li>
</ul>
<p>IGT_9181: 9181<br />
  xe-6081-ecd0e93e7ee855e1b0e3b51ade3d18333fc21ed4: ecd0e93e7ee855e1b0e3b51ade3d18333fc21ed4<br />
  xe-pw-165741v2: 165741v2</p>

</body>
</html>

--===============0617890624502031050==--

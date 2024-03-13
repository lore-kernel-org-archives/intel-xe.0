Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B577FC54E66
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 15:26:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB7910E82B;
	Wed, 13 Mar 2024 15:26:07 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B32110E82B;
 Wed, 13 Mar 2024 15:26:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7423904485681952506=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/vm_=3A_Remove_duplicate_a?=
 =?utf-8?q?ssignment_of_XE=5FVM=5FFLAG=5FLR=5FMODE_flag=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Mar 2024 15:26:06 -0000
Message-ID: <171034356624.732599.8880140325995441260@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240307065213.1968688-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240307065213.1968688-1-himal.prasad.ghimiray@intel.com>
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

--===============7423904485681952506==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vm : Remove duplicate assignment of XE_VM_FLAG_LR_MODE flag. (rev2)
URL   : https://patchwork.freedesktop.org/series/130853/
State : success

== Summary ==

CI Bug Log - changes from xe-935-72f447f984cf5526e6ad32a6e2770124c67d59d3_BAT -> xe-pw-130853v2_BAT
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

  Here are the changes found in xe-pw-130853v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-dg2-oem2:       [FAIL][1] ([Intel XE#1259]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-935-72f447f984cf5526e6ad32a6e2770124c67d59d3/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130853v2/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259


Build changes
-------------

  * Linux: xe-935-72f447f984cf5526e6ad32a6e2770124c67d59d3 -> xe-pw-130853v2

  IGT_7759: 7759
  xe-935-72f447f984cf5526e6ad32a6e2770124c67d59d3: 72f447f984cf5526e6ad32a6e2770124c67d59d3
  xe-pw-130853v2: 130853v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130853v2/index.html

--===============7423904485681952506==
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
<tr><td><b>Series:</b></td><td>drm/xe/vm : Remove duplicate assignment of XE_VM_FLAG_LR_MODE flag. (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130853/">https://patchwork.freedesktop.org/series/130853/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130853v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130853v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-935-72f447f984cf5526e6ad32a6e2770124c67d59d3_BAT -&gt; xe-pw-130853v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-130853v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-935-72f447f984cf5526e6ad32a6e2770124c67d59d3/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130853v2/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-935-72f447f984cf5526e6ad32a6e2770124c67d59d3 -&gt; xe-pw-130853v2</li>
</ul>
<p>IGT_7759: 7759<br />
  xe-935-72f447f984cf5526e6ad32a6e2770124c67d59d3: 72f447f984cf5526e6ad32a6e2770124c67d59d3<br />
  xe-pw-130853v2: 130853v2</p>

</body>
</html>

--===============7423904485681952506==--

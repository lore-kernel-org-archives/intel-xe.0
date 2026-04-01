Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B831076386
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 16:56:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809BA10EE38;
	Wed,  1 Apr 2026 16:56:40 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800A810EE0F;
 Wed,  1 Apr 2026 16:56:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4888007352208831725=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_USE_drm_mm_instead_of_drm_S?=
 =?utf-8?q?A_for_CCS_read/write_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 01 Apr 2026 16:56:39 -0000
Message-ID: <177506259949.424361.10425369253662776745@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260401161528.1990499-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260401161528.1990499-1-satyanarayana.k.v.p@intel.com>
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

--===============4888007352208831725==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: USE drm mm instead of drm SA for CCS read/write (rev3)
URL   : https://patchwork.freedesktop.org/series/163588/
State : failure

== Summary ==

CI Bug Log - changes from xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2_BAT -> xe-pw-163588v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-163588v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-163588v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-163588v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-ptl-vm:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2/bat-ptl-vm/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v3/bat-ptl-vm/igt@core_hotunplug@unbind-rebind.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - bat-ptl-1:          [PASS][3] -> [ABORT][4] +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v3/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - bat-wcl-1:          [PASS][5] -> [ABORT][6] +1 other test abort
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2/bat-wcl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v3/bat-wcl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - bat-wcl-2:          [PASS][7] -> [ABORT][8] +1 other test abort
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2/bat-wcl-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v3/bat-wcl-2/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - bat-ptl-2:          [PASS][9] -> [ABORT][10] +1 other test abort
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v3/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  


Build changes
-------------

  * IGT: IGT_8839 -> IGT_8840
  * Linux: xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2 -> xe-pw-163588v3

  IGT_8839: 8839
  IGT_8840: 8840
  xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2: 5d36e6d54e963f0c1137aaf2249d2baa781f08c2
  xe-pw-163588v3: 163588v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v3/index.html

--===============4888007352208831725==
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
<tr><td><b>Series:</b></td><td>USE drm mm instead of drm SA for CCS read/write (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163588/">https://patchwork.freedesktop.org/series/163588/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2_BAT -&gt; xe-pw-163588v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-163588v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-163588v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-163588v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2/bat-ptl-vm/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v3/bat-ptl-vm/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v3/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">ABORT</a> +1 other test abort</li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2/bat-wcl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v3/bat-wcl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">ABORT</a> +1 other test abort</li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2/bat-wcl-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v3/bat-wcl-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v3/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8839 -&gt; IGT_8840</li>
<li>Linux: xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2 -&gt; xe-pw-163588v3</li>
</ul>
<p>IGT_8839: 8839<br />
  IGT_8840: 8840<br />
  xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2: 5d36e6d54e963f0c1137aaf2249d2baa781f08c2<br />
  xe-pw-163588v3: 163588v3</p>

</body>
</html>

--===============4888007352208831725==--

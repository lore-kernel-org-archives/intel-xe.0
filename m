Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FC8C5321E
	for <intel-xe@archiver.kernel.org>; Mon, 26 Aug 2024 09:28:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F2710E173;
	Mon, 26 Aug 2024 09:28:03 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722D810E173;
 Mon, 26 Aug 2024 09:28:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7891318109427530755=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_Use_separate_rpm_lockd?=
 =?utf-8?q?ep_map_for_non-d3cold-capable_devices_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Aug 2024 09:28:02 -0000
Message-ID: <172466448245.783606.11004587111057328644@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240826083759.98305-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240826083759.98305-1-thomas.hellstrom@linux.intel.com>
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

--===============7891318109427530755==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Use separate rpm lockdep map for non-d3cold-capable devices (rev3)
URL   : https://patchwork.freedesktop.org/series/137730/
State : failure

== Summary ==

CI Bug Log - changes from xe-1824-f83dc30335e989657706c73484b78dd755f909b4_BAT -> xe-pw-137730v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-137730v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-137730v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-137730v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all:
    - bat-atsm-2:         [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1824-f83dc30335e989657706c73484b78dd755f909b4/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v3/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html

  


Build changes
-------------

  * IGT: IGT_7990 -> IGT_7991
  * Linux: xe-1824-f83dc30335e989657706c73484b78dd755f909b4 -> xe-pw-137730v3

  IGT_7990: 9ca5ff0afa3636478b6ba5a97e5ba440cfb2e55e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7991: e5cbe548dbd6ee44200a83745a605643a1a4c714 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1824-f83dc30335e989657706c73484b78dd755f909b4: f83dc30335e989657706c73484b78dd755f909b4
  xe-pw-137730v3: 137730v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v3/index.html

--===============7891318109427530755==
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
<tr><td><b>Series:</b></td><td>drm/xe: Use separate rpm lockdep map for non-d3cold-capable devices (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137730/">https://patchwork.freedesktop.org/series/137730/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1824-f83dc30335e989657706c73484b78dd755f909b4_BAT -&gt; xe-pw-137730v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-137730v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-137730v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-137730v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1824-f83dc30335e989657706c73484b78dd755f909b4/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v3/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7990 -&gt; IGT_7991</li>
<li>Linux: xe-1824-f83dc30335e989657706c73484b78dd755f909b4 -&gt; xe-pw-137730v3</li>
</ul>
<p>IGT_7990: 9ca5ff0afa3636478b6ba5a97e5ba440cfb2e55e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7991: e5cbe548dbd6ee44200a83745a605643a1a4c714 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1824-f83dc30335e989657706c73484b78dd755f909b4: f83dc30335e989657706c73484b78dd755f909b4<br />
  xe-pw-137730v3: 137730v3</p>

</body>
</html>

--===============7891318109427530755==--

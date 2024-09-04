Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72C5CD4853
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 17:21:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8860510E770;
	Wed,  4 Sep 2024 17:21:35 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4272510E770;
 Wed,  4 Sep 2024 17:21:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5121329430421817802=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_series_starting_with_=5B1/2=5D_d?=
 =?utf-8?q?rm/xe=3A_Cleanup_has=5Fflat=5Fccs_handling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Sep 2024 17:21:34 -0000
Message-ID: <172547049426.934385.10057022183305975967@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240904162238.2831202-1-lucas.demarchi@intel.com>
In-Reply-To: <20240904162238.2831202-1-lucas.demarchi@intel.com>
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

--===============5121329430421817802==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe: Cleanup has_flat_ccs handling
URL   : https://patchwork.freedesktop.org/series/138219/
State : failure

== Summary ==

CI Bug Log - changes from xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea_BAT -> xe-pw-138219v1_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-138219v1_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-138219v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-138219v1_BAT:

### IGT changes ###

#### Warnings ####

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-pvc-2:          [SKIP][1] ([Intel XE#1932]) -> [SKIP][2] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/bat-pvc-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138219v1/bat-pvc-2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  
  [Intel XE#1932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932


Build changes
-------------

  * IGT: IGT_8004 -> IGT_8005
  * Linux: xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea -> xe-pw-138219v1

  IGT_8004: 0e443bec0ccfb56c2754437b465fc197ee4fd481 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8005: fc3113c8c1e99797b2d4769aaf02265be64a7589 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea: c72d3ffc0308b71024de6f80c3596668991c67ea
  xe-pw-138219v1: 138219v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138219v1/index.html

--===============5121329430421817802==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe: Cleanup has_flat_ccs handling</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138219/">https://patchwork.freedesktop.org/series/138219/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138219v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138219v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea_BAT -&gt; xe-pw-138219v1_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-138219v1_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-138219v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-138219v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@sriov_basic@enable-vfs-autoprobe-off:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/bat-pvc-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932">Intel XE#1932</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138219v1/bat-pvc-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8004 -&gt; IGT_8005</li>
<li>Linux: xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea -&gt; xe-pw-138219v1</li>
</ul>
<p>IGT_8004: 0e443bec0ccfb56c2754437b465fc197ee4fd481 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8005: fc3113c8c1e99797b2d4769aaf02265be64a7589 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea: c72d3ffc0308b71024de6f80c3596668991c67ea<br />
  xe-pw-138219v1: 138219v1</p>

</body>
</html>

--===============5121329430421817802==--

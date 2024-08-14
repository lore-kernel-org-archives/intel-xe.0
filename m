Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A291C52D7B
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 13:05:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB07410E46F;
	Wed, 14 Aug 2024 13:05:39 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E21810E46F;
 Wed, 14 Aug 2024 13:05:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4012887350200265367=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_prevent_UAF_around_pre?=
 =?utf-8?q?empt_fence?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 Aug 2024 13:05:39 -0000
Message-ID: <172364073911.632575.6324087171529967148@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240814110129.825847-2-matthew.auld@intel.com>
In-Reply-To: <20240814110129.825847-2-matthew.auld@intel.com>
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

--===============4012887350200265367==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: prevent UAF around preempt fence
URL   : https://patchwork.freedesktop.org/series/137297/
State : success

== Summary ==

CI Bug Log - changes from xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6_BAT -> xe-pw-137297v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-137297v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_huc_copy@huc_copy:
    - bat-adlp-vf:        [SKIP][1] ([Intel XE#2466]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/bat-adlp-vf/igt@xe_huc_copy@huc_copy.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137297v1/bat-adlp-vf/igt@xe_huc_copy@huc_copy.html

  
  [Intel XE#2466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2466


Build changes
-------------

  * IGT: IGT_7968 -> IGT_7969
  * Linux: xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6 -> xe-pw-137297v1

  IGT_7968: 5073187c568304daf01d71f6fed415d759c6e363 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7969: 4aa543467adf6e61ed57e2c0a84a0534923aacc6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6: 95179e2efd2e2f61d5453d323fdb6e136fc15df6
  xe-pw-137297v1: 137297v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137297v1/index.html

--===============4012887350200265367==
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
<tr><td><b>Series:</b></td><td>drm/xe: prevent UAF around preempt fence</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137297/">https://patchwork.freedesktop.org/series/137297/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137297v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137297v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6_BAT -&gt; xe-pw-137297v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137297v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_huc_copy@huc_copy:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/bat-adlp-vf/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2466">Intel XE#2466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137297v1/bat-adlp-vf/igt@xe_huc_copy@huc_copy.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7968 -&gt; IGT_7969</li>
<li>Linux: xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6 -&gt; xe-pw-137297v1</li>
</ul>
<p>IGT_7968: 5073187c568304daf01d71f6fed415d759c6e363 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7969: 4aa543467adf6e61ed57e2c0a84a0534923aacc6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6: 95179e2efd2e2f61d5453d323fdb6e136fc15df6<br />
  xe-pw-137297v1: 137297v1</p>

</body>
</html>

--===============4012887350200265367==--

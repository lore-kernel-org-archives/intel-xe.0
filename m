Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DD8C369A2
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 18:37:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024ED10E37E;
	Thu, 10 Apr 2025 18:37:52 +0000 (UTC)
Received: from 32c37dd7f93d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD9710E37E;
 Thu, 10 Apr 2025 18:37:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4547451069414531467=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/dma=5Fbuf=3A_stop_re?=
 =?utf-8?q?lying_on_placement_in_unmap_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Apr 2025 18:37:50 -0000
Message-ID: <174431027004.367.13267155585568614263@32c37dd7f93d>
X-Patchwork-Hint: ignore
References: <20250410162716.159403-2-matthew.auld@intel.com>
In-Reply-To: <20250410162716.159403-2-matthew.auld@intel.com>
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

--===============4547451069414531467==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/dma_buf: stop relying on placement in unmap (rev2)
URL   : https://patchwork.freedesktop.org/series/147218/
State : failure

== Summary ==

CI Bug Log - changes from xe-2931-457049ad31ee5b64dd86230518144d366c32bc04_BAT -> xe-pw-147218v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-147218v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-147218v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-147218v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:
    - bat-adlp-vf:        NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147218v2/bat-adlp-vf/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html
    - bat-lnl-2:          NOTRUN -> [ABORT][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147218v2/bat-lnl-2/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html

  


Build changes
-------------

  * IGT: IGT_8313 -> IGT_8314
  * Linux: xe-2931-457049ad31ee5b64dd86230518144d366c32bc04 -> xe-pw-147218v2

  IGT_8313: 8313
  IGT_8314: 337db6fa542d9c89500701f283a3cbeee4a61b50 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2931-457049ad31ee5b64dd86230518144d366c32bc04: 457049ad31ee5b64dd86230518144d366c32bc04
  xe-pw-147218v2: 147218v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147218v2/index.html

--===============4547451069414531467==
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
<tr><td><b>Series:</b></td><td>drm/xe/dma_buf: stop relying on placement in unmap (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147218/">https://patchwork.freedesktop.org/series/147218/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147218v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147218v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2931-457049ad31ee5b64dd86230518144d366c32bc04_BAT -&gt; xe-pw-147218v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-147218v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-147218v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-147218v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147218v2/bat-adlp-vf/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html">ABORT</a></li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147218v2/bat-lnl-2/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8313 -&gt; IGT_8314</li>
<li>Linux: xe-2931-457049ad31ee5b64dd86230518144d366c32bc04 -&gt; xe-pw-147218v2</li>
</ul>
<p>IGT_8313: 8313<br />
  IGT_8314: 337db6fa542d9c89500701f283a3cbeee4a61b50 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2931-457049ad31ee5b64dd86230518144d366c32bc04: 457049ad31ee5b64dd86230518144d366c32bc04<br />
  xe-pw-147218v2: 147218v2</p>

</body>
</html>

--===============4547451069414531467==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37EECCF9E3
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 14:30:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D4C10E99C;
	Thu, 30 Oct 2025 14:30:46 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F31110E99C;
 Thu, 30 Oct 2025 14:30:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4328145142796939916=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyXIFhlLkNJLkJBVDogZmFpbHVyZSBmb3IgdmVyYm9zZSBwMnAgKHJldjUp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Oct 2025 14:30:45 -0000
Message-ID: <176183464531.190.15552649116217495243@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251029144504.199716-2-matthew.auld@intel.com>
In-Reply-To: <20251029144504.199716-2-matthew.auld@intel.com>
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

--===============4328145142796939916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: verbose p2p (rev5)
URL   : https://patchwork.freedesktop.org/series/156480/
State : failure

== Summary ==

CI Bug Log - changes from xe-4010-4620927448abb5be2d197b0254b042728205c258_BAT -> xe-pw-156480v5_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-156480v5_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-156480v5_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 11)
------------------------------

  Missing    (2): bat-adlp-vm bat-ptl-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-156480v5_BAT:

### IGT changes ###

#### Warnings ####

  * igt@xe_peer2peer@read:
    - bat-bmg-3:          [FAIL][1] ([Intel XE#6433]) -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4010-4620927448abb5be2d197b0254b042728205c258/bat-bmg-3/igt@xe_peer2peer@read.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156480v5/bat-bmg-3/igt@xe_peer2peer@read.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p}:
    - bat-bmg-3:          [FAIL][3] ([Intel XE#6433]) -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4010-4620927448abb5be2d197b0254b042728205c258/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156480v5/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html

  
Known issues
------------

  Here are the changes found in xe-pw-156480v5_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_peer2peer@write:
    - bat-bmg-3:          [FAIL][5] ([Intel XE#6433]) -> [PASS][6] +2 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4010-4620927448abb5be2d197b0254b042728205c258/bat-bmg-3/igt@xe_peer2peer@write.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156480v5/bat-bmg-3/igt@xe_peer2peer@write.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#6433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6433


Build changes
-------------

  * Linux: xe-4010-4620927448abb5be2d197b0254b042728205c258 -> xe-pw-156480v5

  IGT_8601: cd39f1cab2d1e96a73fb742253f692e796f8feda @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4010-4620927448abb5be2d197b0254b042728205c258: 4620927448abb5be2d197b0254b042728205c258
  xe-pw-156480v5: 156480v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156480v5/index.html

--===============4328145142796939916==
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
<tr><td><b>Series:</b></td><td>verbose p2p (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156480/">https://patchwork.freedesktop.org/series/156480/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156480v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156480v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4010-4620927448abb5be2d197b0254b042728205c258_BAT -&gt; xe-pw-156480v5_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-156480v5_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-156480v5_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 11)</h2>
<p>Missing    (2): bat-adlp-vm bat-ptl-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-156480v5_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_peer2peer@read:<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4010-4620927448abb5be2d197b0254b042728205c258/bat-bmg-3/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6433">Intel XE#6433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156480v5/bat-bmg-3/igt@xe_peer2peer@read.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p}:<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4010-4620927448abb5be2d197b0254b042728205c258/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6433">Intel XE#6433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156480v5/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156480v5_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_peer2peer@write:<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4010-4620927448abb5be2d197b0254b042728205c258/bat-bmg-3/igt@xe_peer2peer@write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6433">Intel XE#6433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156480v5/bat-bmg-3/igt@xe_peer2peer@write.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4010-4620927448abb5be2d197b0254b042728205c258 -&gt; xe-pw-156480v5</li>
</ul>
<p>IGT_8601: cd39f1cab2d1e96a73fb742253f692e796f8feda @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4010-4620927448abb5be2d197b0254b042728205c258: 4620927448abb5be2d197b0254b042728205c258<br />
  xe-pw-156480v5: 156480v5</p>

</body>
</html>

--===============4328145142796939916==--

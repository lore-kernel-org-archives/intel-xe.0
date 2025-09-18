Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95694CAC59A
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 13:31:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC8310E8B2;
	Thu, 18 Sep 2025 13:31:00 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D506510E8B4;
 Thu, 18 Sep 2025 13:30:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4306979440474839537=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/i915/irq=3A_clarify_and?=
 =?utf-8?q?_refactor_-=3Eirq=5Fmask?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Sep 2025 13:30:59 -0000
Message-ID: <175820225986.344369.1294337262255512255@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1758198300.git.jani.nikula@intel.com>
In-Reply-To: <cover.1758198300.git.jani.nikula@intel.com>
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

--===============4306979440474839537==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/irq: clarify and refactor ->irq_mask
URL   : https://patchwork.freedesktop.org/series/154698/
State : failure

== Summary ==

CI Bug Log - changes from xe-3790-31f149f6d10616688087056856c29390e28d7e44_BAT -> xe-pw-154698v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-154698v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-154698v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-154698v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-rebind-imm:
    - bat-bmg-1:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3790-31f149f6d10616688087056856c29390e28d7e44/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-imm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154698v1/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-imm.html

  


Build changes
-------------

  * Linux: xe-3790-31f149f6d10616688087056856c29390e28d7e44 -> xe-pw-154698v1

  IGT_8543: 8543
  xe-3790-31f149f6d10616688087056856c29390e28d7e44: 31f149f6d10616688087056856c29390e28d7e44
  xe-pw-154698v1: 154698v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154698v1/index.html

--===============4306979440474839537==
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
<tr><td><b>Series:</b></td><td>drm/i915/irq: clarify and refactor -&gt;irq_mask</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154698/">https://patchwork.freedesktop.org/series/154698/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154698v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154698v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3790-31f149f6d10616688087056856c29390e28d7e44_BAT -&gt; xe-pw-154698v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-154698v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-154698v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-154698v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-rebind-imm:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3790-31f149f6d10616688087056856c29390e28d7e44/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154698v1/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-imm.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3790-31f149f6d10616688087056856c29390e28d7e44 -&gt; xe-pw-154698v1</li>
</ul>
<p>IGT_8543: 8543<br />
  xe-3790-31f149f6d10616688087056856c29390e28d7e44: 31f149f6d10616688087056856c29390e28d7e44<br />
  xe-pw-154698v1: 154698v1</p>

</body>
</html>

--===============4306979440474839537==--

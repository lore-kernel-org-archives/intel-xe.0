Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75602C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 13:15:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10187112BF6;
	Wed, 24 Apr 2024 13:15:06 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C48F10FECA;
 Wed, 24 Apr 2024 13:15:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8199458508536133375=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/guc=3A_Improve_GuC_doorbe?=
 =?utf-8?q?ll/context_ID_manager_intro_message?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Apr 2024 13:15:05 -0000
Message-ID: <171396450511.1628979.3659911408586695925@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240419153407.402-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240419153407.402-1-michal.wajdeczko@intel.com>
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

--===============8199458508536133375==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Improve GuC doorbell/context ID manager intro message
URL   : https://patchwork.freedesktop.org/series/132653/
State : failure

== Summary ==

CI Bug Log - changes from xe-1167-989973bc834b7b0eb0dd7a8e030def537dc1e935_BAT -> xe-pw-132653v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-132653v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-132653v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 0)
------------------------------

  ERROR: It appears as if the changes made in xe-pw-132653v1_BAT prevented too many machines from booting.

  Missing    (5): bat-pvc-2 bat-lnl-1 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7820 -> IGT_7814
  * Linux: xe-1167-989973bc834b7b0eb0dd7a8e030def537dc1e935 -> xe-pw-132653v1

  IGT_7814: 7814
  IGT_7820: 741ef547cbf5d8fcc144f1bb048844c33bca7509 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1167-989973bc834b7b0eb0dd7a8e030def537dc1e935: 989973bc834b7b0eb0dd7a8e030def537dc1e935
  xe-pw-132653v1: 132653v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132653v1/index.html

--===============8199458508536133375==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Improve GuC doorbell/context ID manager intro message</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132653/">https://patchwork.freedesktop.org/series/132653/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132653v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132653v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1167-989973bc834b7b0eb0dd7a8e030def537dc1e935_BAT -&gt; xe-pw-132653v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-132653v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-132653v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in xe-pw-132653v1_BAT prevented too many machines from booting.</p>
<p>Missing    (5): bat-pvc-2 bat-lnl-1 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7820 -&gt; IGT_7814</li>
<li>Linux: xe-1167-989973bc834b7b0eb0dd7a8e030def537dc1e935 -&gt; xe-pw-132653v1</li>
</ul>
<p>IGT_7814: 7814<br />
  IGT_7820: 741ef547cbf5d8fcc144f1bb048844c33bca7509 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1167-989973bc834b7b0eb0dd7a8e030def537dc1e935: 989973bc834b7b0eb0dd7a8e030def537dc1e935<br />
  xe-pw-132653v1: 132653v1</p>

</body>
</html>

--===============8199458508536133375==--

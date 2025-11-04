Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386FBCCF9E3
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 21:20:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA5E910E671;
	Tue,  4 Nov 2025 21:20:16 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9478D10E671;
 Tue,  4 Nov 2025 21:20:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4000140480087131710=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_add_VM=5FBIND_DEC?=
 =?utf-8?q?OMPRESS_support_and_on=E2=80=91demand_decompression_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nitin Gote" <nitin.r.gote@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Nov 2025 21:20:15 -0000
Message-ID: <176229121560.17802.3927619269340201154@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251104105305.2100460-1-nitin.r.gote@intel.com>
In-Reply-To: <20251104105305.2100460-1-nitin.r.gote@intel.com>
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

--===============4000140480087131710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

== Series Details ==

Series: drm/xe: add VM_BIND DECOMPRESS support and on‑demand decompression (rev4)
URL   : https://patchwork.freedesktop.org/series/154714/
State : failure

== Summary ==

CI Bug Log - changes from xe-4041-369a5e1069542c966de4af7e256531fc12ad0b43_BAT -> xe-pw-154714v4_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-154714v4_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-154714v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-154714v4_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_waitfence@engine:
    - bat-bmg-1:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4041-369a5e1069542c966de4af7e256531fc12ad0b43/bat-bmg-1/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v4/bat-bmg-1/igt@xe_waitfence@engine.html

  


Build changes
-------------

  * Linux: xe-4041-369a5e1069542c966de4af7e256531fc12ad0b43 -> xe-pw-154714v4

  IGT_8607: 8607
  xe-4041-369a5e1069542c966de4af7e256531fc12ad0b43: 369a5e1069542c966de4af7e256531fc12ad0b43
  xe-pw-154714v4: 154714v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v4/index.html

--===============4000140480087131710==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


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
<tr><td><b>Series:</b></td><td>drm/xe: add VM_BIND DECOMPRESS support and on‑demand decompression (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154714/">https://patchwork.freedesktop.org/series/154714/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4041-369a5e1069542c966de4af7e256531fc12ad0b43_BAT -&gt; xe-pw-154714v4_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-154714v4_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-154714v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-154714v4_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4041-369a5e1069542c966de4af7e256531fc12ad0b43/bat-bmg-1/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v4/bat-bmg-1/igt@xe_waitfence@engine.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4041-369a5e1069542c966de4af7e256531fc12ad0b43 -&gt; xe-pw-154714v4</li>
</ul>
<p>IGT_8607: 8607<br />
  xe-4041-369a5e1069542c966de4af7e256531fc12ad0b43: 369a5e1069542c966de4af7e256531fc12ad0b43<br />
  xe-pw-154714v4: 154714v4</p>

</body>
</html>

--===============4000140480087131710==--

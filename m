Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E2FC3DA45
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 23:35:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634F710E02D;
	Thu, 11 Jul 2024 23:35:22 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3267B10E02D;
 Thu, 11 Jul 2024 23:35:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0296560863086885167=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/xe2=3A_Enable_Priority_Me?=
 =?utf-8?q?m_Read_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pallavi Mishra" <pallavi.mishra@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Jul 2024 23:35:21 -0000
Message-ID: <172074092120.165318.5325992574464077956@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240711210042.3822494-1-jonathan.cavitt@intel.com>
In-Reply-To: <20240711210042.3822494-1-jonathan.cavitt@intel.com>
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

--===============0296560863086885167==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe2: Enable Priority Mem Read (rev4)
URL   : https://patchwork.freedesktop.org/series/134038/
State : failure

== Summary ==

CI Bug Log - changes from xe-1599-b8617992926ffce3569049c2eb3dffeef5eafe75_BAT -> xe-pw-134038v4_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-134038v4_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-134038v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-134038v4_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - bat-lnl-1:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1599-b8617992926ffce3569049c2eb3dffeef5eafe75/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v4/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  


Build changes
-------------

  * Linux: xe-1599-b8617992926ffce3569049c2eb3dffeef5eafe75 -> xe-pw-134038v4

  IGT_7925: def41c762723c9ba046a3ffe722d046cd12e993d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1599-b8617992926ffce3569049c2eb3dffeef5eafe75: b8617992926ffce3569049c2eb3dffeef5eafe75
  xe-pw-134038v4: 134038v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v4/index.html

--===============0296560863086885167==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe2: Enable Priority Mem Read (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134038/">https://patchwork.freedesktop.org/series/134038/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1599-b8617992926ffce3569049c2eb3dffeef5eafe75_BAT -&gt; xe-pw-134038v4_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-134038v4_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-134038v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-134038v4_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1599-b8617992926ffce3569049c2eb3dffeef5eafe75/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v4/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1599-b8617992926ffce3569049c2eb3dffeef5eafe75 -&gt; xe-pw-134038v4</li>
</ul>
<p>IGT_7925: def41c762723c9ba046a3ffe722d046cd12e993d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1599-b8617992926ffce3569049c2eb3dffeef5eafe75: b8617992926ffce3569049c2eb3dffeef5eafe75<br />
  xe-pw-134038v4: 134038v4</p>

</body>
</html>

--===============0296560863086885167==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B518CCA464
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 19:40:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA09D112464;
	Thu, 15 Oct 2026 19:40:21 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D68D10E290;
 Thu, 15 Oct 2026 19:40:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3524530863679763734=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/cx0=3A_TCSS_power_?=
 =?utf-8?q?for_the_non-TC_C20_PHY_on_PTL_port_B?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Burak_G=C3=B6nc=C3=BC_via_B4_Relay?=
 <devnull+burakgon12.gmail.com@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Oct 2026 19:40:21 -0000
Message-ID: <179209322104.32021.7326202562495934072@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261015-ptl-port-b-tcss-v2-0-e00ce882402d@gmail.com>
In-Reply-To: <20261015-ptl-port-b-tcss-v2-0-e00ce882402d@gmail.com>
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

--===============3524530863679763734==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/cx0: TCSS power for the non-TC C20 PHY on PTL port B
URL   : https://patchwork.freedesktop.org/series/176207/
State : success

== Summary ==

CI Bug Log - changes from xe-5951-d0f854d04f85e2bd88bce0b7bd153e5a67957a5b_BAT -> xe-pw-176207v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 14)
------------------------------

  Missing    (1): bat-wcl-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9146 -> IGT_9149
  * Linux: xe-5951-d0f854d04f85e2bd88bce0b7bd153e5a67957a5b -> xe-pw-176207v1

  IGT_9146: 9e6040664f13f0767bb4d1028b422b7ee00425dc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9149: 157f243d73fb8c010db8c884db81ca2e558b4ab2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5951-d0f854d04f85e2bd88bce0b7bd153e5a67957a5b: d0f854d04f85e2bd88bce0b7bd153e5a67957a5b
  xe-pw-176207v1: 176207v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176207v1/index.html

--===============3524530863679763734==
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
<tr><td><b>Series:</b></td><td>drm/i915/cx0: TCSS power for the non-TC C20 PHY on PTL port B</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176207/">https://patchwork.freedesktop.org/series/176207/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176207v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176207v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5951-d0f854d04f85e2bd88bce0b7bd153e5a67957a5b_BAT -&gt; xe-pw-176207v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 14)</h2>
<p>Missing    (1): bat-wcl-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9146 -&gt; IGT_9149</li>
<li>Linux: xe-5951-d0f854d04f85e2bd88bce0b7bd153e5a67957a5b -&gt; xe-pw-176207v1</li>
</ul>
<p>IGT_9146: 9e6040664f13f0767bb4d1028b422b7ee00425dc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9149: 157f243d73fb8c010db8c884db81ca2e558b4ab2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5951-d0f854d04f85e2bd88bce0b7bd153e5a67957a5b: d0f854d04f85e2bd88bce0b7bd153e5a67957a5b<br />
  xe-pw-176207v1: 176207v1</p>

</body>
</html>

--===============3524530863679763734==--

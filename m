Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A83BC36005
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 23:19:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F9710E61C;
	Tue, 25 Mar 2025 23:19:27 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A7D10E32C;
 Tue, 25 Mar 2025 23:19:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2215654353201709206=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/ptl=3A_Apply_Wa=5F14?=
 =?utf-8?q?022293748=2C_Wa=5F22019794406_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Mar 2025 23:19:27 -0000
Message-ID: <174294476705.3303.6393998388574522052@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250324223347.1433491-1-julia.filipchuk@intel.com>
In-Reply-To: <20250324223347.1433491-1-julia.filipchuk@intel.com>
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

--===============2215654353201709206==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/ptl: Apply Wa_14022293748, Wa_22019794406 (rev2)
URL   : https://patchwork.freedesktop.org/series/146695/
State : failure

== Summary ==

CI Bug Log - changes from xe-2853-afc2e1fea0a406eedbaf632e96cdb6832a45ebb7_BAT -> xe-pw-146695v2_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-146695v2_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-146695v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-146695v2_BAT:

### IGT changes ###

#### Warnings ####

  * igt@xe_pat@pat-index-xehpc@render:
    - bat-pvc-2:          [SKIP][1] ([Intel XE#976]) -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2853-afc2e1fea0a406eedbaf632e96cdb6832a45ebb7/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146695v2/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html

  
  [Intel XE#976]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/976


Build changes
-------------

  * IGT: IGT_8283 -> IGT_8284
  * Linux: xe-2853-afc2e1fea0a406eedbaf632e96cdb6832a45ebb7 -> xe-pw-146695v2

  IGT_8283: e4eb2265f06fc69e37e56cb6b609e019b6071435 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8284: 8284
  xe-2853-afc2e1fea0a406eedbaf632e96cdb6832a45ebb7: afc2e1fea0a406eedbaf632e96cdb6832a45ebb7
  xe-pw-146695v2: 146695v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146695v2/index.html

--===============2215654353201709206==
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
<tr><td><b>Series:</b></td><td>drm/xe/ptl: Apply Wa_14022293748, Wa_22019794406 (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146695/">https://patchwork.freedesktop.org/series/146695/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146695v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146695v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2853-afc2e1fea0a406eedbaf632e96cdb6832a45ebb7_BAT -&gt; xe-pw-146695v2_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-146695v2_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-146695v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-146695v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_pat@pat-index-xehpc@render:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2853-afc2e1fea0a406eedbaf632e96cdb6832a45ebb7/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/976">Intel XE#976</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146695v2/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8283 -&gt; IGT_8284</li>
<li>Linux: xe-2853-afc2e1fea0a406eedbaf632e96cdb6832a45ebb7 -&gt; xe-pw-146695v2</li>
</ul>
<p>IGT_8283: e4eb2265f06fc69e37e56cb6b609e019b6071435 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8284: 8284<br />
  xe-2853-afc2e1fea0a406eedbaf632e96cdb6832a45ebb7: afc2e1fea0a406eedbaf632e96cdb6832a45ebb7<br />
  xe-pw-146695v2: 146695v2</p>

</body>
</html>

--===============2215654353201709206==--

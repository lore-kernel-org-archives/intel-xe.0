Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBA0CCD1A4
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 13:24:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500E510EBEF;
	Fri, 17 Oct 2025 13:24:27 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C73CE10EBEF;
 Fri, 17 Oct 2025 13:24:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1246520545670523879=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_share_USM_BCS_eng?=
 =?utf-8?q?ine_via_root-tile_helper?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nitin Gote" <nitin.r.gote@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Oct 2025 13:24:25 -0000
Message-ID: <176070746580.27103.12434680656577524388@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251017122253.149187-1-nitin.r.gote@intel.com>
In-Reply-To: <20251017122253.149187-1-nitin.r.gote@intel.com>
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

--===============1246520545670523879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: share USM BCS engine via root-tile helper
URL   : https://patchwork.freedesktop.org/series/156117/
State : success

== Summary ==

CI Bug Log - changes from xe-3939-c061afbce5f67a014cf06a8aabe27a13c242fbd4_BAT -> xe-pw-156117v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-156117v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@d-edp1:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#4543]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3939-c061afbce5f67a014cf06a8aabe27a13c242fbd4/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156117v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * IGT: IGT_8589 -> IGT_8591
  * Linux: xe-3939-c061afbce5f67a014cf06a8aabe27a13c242fbd4 -> xe-pw-156117v1

  IGT_8589: 8589
  IGT_8591: 8591
  xe-3939-c061afbce5f67a014cf06a8aabe27a13c242fbd4: c061afbce5f67a014cf06a8aabe27a13c242fbd4
  xe-pw-156117v1: 156117v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156117v1/index.html

--===============1246520545670523879==
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
<tr><td><b>Series:</b></td><td>drm/xe: share USM BCS engine via root-tile helper</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156117/">https://patchwork.freedesktop.org/series/156117/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156117v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156117v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3939-c061afbce5f67a014cf06a8aabe27a13c242fbd4_BAT -&gt; xe-pw-156117v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156117v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@d-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3939-c061afbce5f67a014cf06a8aabe27a13c242fbd4/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156117v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8589 -&gt; IGT_8591</li>
<li>Linux: xe-3939-c061afbce5f67a014cf06a8aabe27a13c242fbd4 -&gt; xe-pw-156117v1</li>
</ul>
<p>IGT_8589: 8589<br />
  IGT_8591: 8591<br />
  xe-3939-c061afbce5f67a014cf06a8aabe27a13c242fbd4: c061afbce5f67a014cf06a8aabe27a13c242fbd4<br />
  xe-pw-156117v1: 156117v1</p>

</body>
</html>

--===============1246520545670523879==--

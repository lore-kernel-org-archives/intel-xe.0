Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E4EE74AFF
	for <intel-xe@archiver.kernel.org>; Tue,  3 Dec 2024 22:07:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E4A10EB59;
	Tue,  3 Dec 2024 22:07:16 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC52A10EB59;
 Tue,  3 Dec 2024 22:07:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1283260963768646711=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_usb=3A_typec=3A_ucsi=3A_Fix?=
 =?utf-8?q?_connector_status_writing_past_buffer_size?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Dec 2024 22:07:14 -0000
Message-ID: <173326363483.2159353.9474780492922541323@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241203200010.2821132-1-lucas.demarchi@intel.com>
In-Reply-To: <20241203200010.2821132-1-lucas.demarchi@intel.com>
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

--===============1283260963768646711==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: usb: typec: ucsi: Fix connector status writing past buffer size
URL   : https://patchwork.freedesktop.org/series/142075/
State : failure

== Summary ==

CI Bug Log - changes from xe-2312-fac293c5c775a53ccd44f64fae2d09fa66747ea1_BAT -> xe-pw-142075v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-142075v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-142075v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 0)
------------------------------

  ERROR: It appears as if the changes made in xe-pw-142075v1_BAT prevented too many machines from booting.

  Missing    (5): bat-pvc-2 bat-adlp-vf bat-dg2-oem2 bat-adlp-vm bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-2312-fac293c5c775a53ccd44f64fae2d09fa66747ea1 -> xe-pw-142075v1

  IGT_8136: 21076ee09438af484c58b308d8179277503922f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2312-fac293c5c775a53ccd44f64fae2d09fa66747ea1: fac293c5c775a53ccd44f64fae2d09fa66747ea1
  xe-pw-142075v1: 142075v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142075v1/index.html

--===============1283260963768646711==
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
<tr><td><b>Series:</b></td><td>usb: typec: ucsi: Fix connector status writing past buffer size</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142075/">https://patchwork.freedesktop.org/series/142075/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142075v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142075v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2312-fac293c5c775a53ccd44f64fae2d09fa66747ea1_BAT -&gt; xe-pw-142075v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-142075v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-142075v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in xe-pw-142075v1_BAT prevented too many machines from booting.</p>
<p>Missing    (5): bat-pvc-2 bat-adlp-vf bat-dg2-oem2 bat-adlp-vm bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2312-fac293c5c775a53ccd44f64fae2d09fa66747ea1 -&gt; xe-pw-142075v1</li>
</ul>
<p>IGT_8136: 21076ee09438af484c58b308d8179277503922f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2312-fac293c5c775a53ccd44f64fae2d09fa66747ea1: fac293c5c775a53ccd44f64fae2d09fa66747ea1<br />
  xe-pw-142075v1: 142075v1</p>

</body>
</html>

--===============1283260963768646711==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14945C5B549
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 03:18:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBEA10E217;
	Thu,  5 Jun 2025 03:18:16 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2297510E0C3;
 Thu,  5 Jun 2025 03:18:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8904261780936179577=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_xe=3A_Recommend_GUC_v70=2E4?=
 =?utf-8?q?5=2E2_for_BMG=2C_LNL=2C_DG2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Jun 2025 03:18:16 -0000
Message-ID: <174909349613.50511.958559647538736753@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250604212420.557712-2-julia.filipchuk@intel.com>
In-Reply-To: <20250604212420.557712-2-julia.filipchuk@intel.com>
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

--===============8904261780936179577==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe: Recommend GUC v70.45.2 for BMG, LNL, DG2
URL   : https://patchwork.freedesktop.org/series/149854/
State : success

== Summary ==

CI Bug Log - changes from xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11_BAT -> xe-pw-149854v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): bat-adlp-vm 

New tests
---------

  New tests have been introduced between xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11_BAT and xe-pw-149854v1_BAT:

### New IGT tests (4) ###

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.48] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.44] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.42] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.43] s

  


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11 -> xe-pw-149854v1

  IGT_8396: 8396
  xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11: 9becf23dcd5721a2ddb80f01d4964a1657117f11
  xe-pw-149854v1: 149854v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149854v1/index.html

--===============8904261780936179577==
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
<tr><td><b>Series:</b></td><td>xe: Recommend GUC v70.45.2 for BMG, LNL, DG2</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149854/">https://patchwork.freedesktop.org/series/149854/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149854v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149854v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11_BAT -&gt; xe-pw-149854v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11_BAT and xe-pw-149854v1_BAT:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.43] s</li>
</ul>
</li>
</ul>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11 -&gt; xe-pw-149854v1</li>
</ul>
<p>IGT_8396: 8396<br />
  xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11: 9becf23dcd5721a2ddb80f01d4964a1657117f11<br />
  xe-pw-149854v1: 149854v1</p>

</body>
</html>

--===============8904261780936179577==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7ADC282DE
	for <intel-xe@archiver.kernel.org>; Sat,  8 Mar 2025 00:24:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9E510E1D6;
	Sat,  8 Mar 2025 00:24:10 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134C810E1D6;
 Sat,  8 Mar 2025 00:24:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0936794737731251490=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/xe3lpd=3A_Update_b?=
 =?utf-8?q?andwidth_parameters_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 08 Mar 2025 00:24:09 -0000
Message-ID: <174139344906.4949.10418661532785433888@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250307-xe3lpd-bandwidth-update-v3-0-58bbe81f65bf@intel.com>
In-Reply-To: <20250307-xe3lpd-bandwidth-update-v3-0-58bbe81f65bf@intel.com>
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

--===============0936794737731251490==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/xe3lpd: Update bandwidth parameters (rev3)
URL   : https://patchwork.freedesktop.org/series/144440/
State : success

== Summary ==

CI Bug Log - changes from xe-2778-f811577f424491a57b1e8669bde62998227d6907_BAT -> xe-pw-144440v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8264 -> IGT_8265
  * Linux: xe-2778-f811577f424491a57b1e8669bde62998227d6907 -> xe-pw-144440v3

  IGT_8264: 8264
  IGT_8265: bfefe166535d69ca10d32e6ba0093260df21ee3d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2778-f811577f424491a57b1e8669bde62998227d6907: f811577f424491a57b1e8669bde62998227d6907
  xe-pw-144440v3: 144440v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144440v3/index.html

--===============0936794737731251490==
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
<tr><td><b>Series:</b></td><td>drm/i915/xe3lpd: Update bandwidth parameters (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144440/">https://patchwork.freedesktop.org/series/144440/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144440v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144440v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2778-f811577f424491a57b1e8669bde62998227d6907_BAT -&gt; xe-pw-144440v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8264 -&gt; IGT_8265</li>
<li>Linux: xe-2778-f811577f424491a57b1e8669bde62998227d6907 -&gt; xe-pw-144440v3</li>
</ul>
<p>IGT_8264: 8264<br />
  IGT_8265: bfefe166535d69ca10d32e6ba0093260df21ee3d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2778-f811577f424491a57b1e8669bde62998227d6907: f811577f424491a57b1e8669bde62998227d6907<br />
  xe-pw-144440v3: 144440v3</p>

</body>
</html>

--===============0936794737731251490==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6025EC54E58
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 08:11:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D91910E205;
	Thu, 21 Mar 2024 08:11:27 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75ABE10E201;
 Thu, 21 Mar 2024 08:11:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0647345204288924755=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_Use_FIELD=5FPREP_for_l?=
 =?utf-8?q?rc_descriptor_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Mar 2024 08:11:25 -0000
Message-ID: <171100868548.938898.1601139013638375438@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240321063453.13306-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20240321063453.13306-1-niranjana.vishwanathapura@intel.com>
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

--===============0647345204288924755==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Use FIELD_PREP for lrc descriptor (rev2)
URL   : https://patchwork.freedesktop.org/series/131404/
State : failure

== Summary ==

CI Bug Log - changes from xe-968-b8290992108644cb99d7d9db2921bb25369ead3c_BAT -> xe-pw-131404v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-131404v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-131404v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 0)
------------------------------

  ERROR: It appears as if the changes made in xe-pw-131404v2_BAT prevented too many machines from booting.

  Missing    (4): bat-pvc-2 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7772 -> IGT_7773
  * Linux: xe-968-b8290992108644cb99d7d9db2921bb25369ead3c -> xe-pw-131404v2

  IGT_7772: 7772
  IGT_7773: 7773
  xe-968-b8290992108644cb99d7d9db2921bb25369ead3c: b8290992108644cb99d7d9db2921bb25369ead3c
  xe-pw-131404v2: 131404v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131404v2/index.html

--===============0647345204288924755==
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
<tr><td><b>Series:</b></td><td>drm/xe: Use FIELD_PREP for lrc descriptor (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131404/">https://patchwork.freedesktop.org/series/131404/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131404v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131404v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-968-b8290992108644cb99d7d9db2921bb25369ead3c_BAT -&gt; xe-pw-131404v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-131404v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-131404v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in xe-pw-131404v2_BAT prevented too many machines from booting.</p>
<p>Missing    (4): bat-pvc-2 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7772 -&gt; IGT_7773</li>
<li>Linux: xe-968-b8290992108644cb99d7d9db2921bb25369ead3c -&gt; xe-pw-131404v2</li>
</ul>
<p>IGT_7772: 7772<br />
  IGT_7773: 7773<br />
  xe-968-b8290992108644cb99d7d9db2921bb25369ead3c: b8290992108644cb99d7d9db2921bb25369ead3c<br />
  xe-pw-131404v2: 131404v2</p>

</body>
</html>

--===============0647345204288924755==--

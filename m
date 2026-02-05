Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72002ECD9B0
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 23:29:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D66810E0C7;
	Thu,  5 Feb 2026 23:29:33 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567F810E0C7;
 Thu,  5 Feb 2026 23:29:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4757036963112828785=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/xe2=5Fhpg=3A_Fix_han?=
 =?utf-8?q?dling_of_Wa=5F14019988906_=26_Wa=5F14019877138?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Feb 2026 23:29:32 -0000
Message-ID: <177033417233.228376.7829428302775225681@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260205220508.51905-2-matthew.d.roper@intel.com>
In-Reply-To: <20260205220508.51905-2-matthew.d.roper@intel.com>
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

--===============4757036963112828785==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe2_hpg: Fix handling of Wa_14019988906 & Wa_14019877138
URL   : https://patchwork.freedesktop.org/series/161223/
State : success

== Summary ==

CI Bug Log - changes from xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4_BAT -> xe-pw-161223v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): bat-bmg-3 

Known issues
------------

  Here are the changes found in xe-pw-161223v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_pat@pat-index-xe2@render:
    - bat-ptl-vm:         [DMESG-WARN][1] ([Intel XE#7110]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html

  
  [Intel XE#7110]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7110


Build changes
-------------

  * Linux: xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4 -> xe-pw-161223v1

  IGT_8739: 8739
  xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4: 59c0fb08bf06aca1ca138f7486028adcd94db7c4
  xe-pw-161223v1: 161223v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/index.html

--===============4757036963112828785==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe2_hpg: Fix handling of Wa_14019988906 &amp; Wa_14019877138</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161223/">https://patchwork.freedesktop.org/series/161223/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4_BAT -&gt; xe-pw-161223v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): bat-bmg-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161223v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_pat@pat-index-xe2@render:<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7110">Intel XE#7110</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161223v1/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4 -&gt; xe-pw-161223v1</li>
</ul>
<p>IGT_8739: 8739<br />
  xe-4512-59c0fb08bf06aca1ca138f7486028adcd94db7c4: 59c0fb08bf06aca1ca138f7486028adcd94db7c4<br />
  xe-pw-161223v1: 161223v1</p>

</body>
</html>

--===============4757036963112828785==--

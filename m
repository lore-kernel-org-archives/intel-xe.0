Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6482DC5B559
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 09:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA8510E94E;
	Thu,  5 Jun 2025 09:03:50 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C8F10E919;
 Thu,  5 Jun 2025 09:03:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3413143382345712786=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Revert_=22drm/xe/display=3A?=
 =?utf-8?q?_use_xe-=3Edisplay_to_decide_whether_to_do_anything=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vivek Kasireddy" <vivek.kasireddy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Jun 2025 09:03:49 -0000
Message-ID: <174911422906.51388.12095381889814946410@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250605054247.386633-1-vivek.kasireddy@intel.com>
In-Reply-To: <20250605054247.386633-1-vivek.kasireddy@intel.com>
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

--===============3413143382345712786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Revert "drm/xe/display: use xe->display to decide whether to do anything"
URL   : https://patchwork.freedesktop.org/series/149863/
State : success

== Summary ==

CI Bug Log - changes from xe-3196-d527f1a12f1a9cb4fbc43288c4e41a6f3c7c08cd_BAT -> xe-pw-149863v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 6)
------------------------------

  Missing    (2): bat-adlp-vm bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3196-d527f1a12f1a9cb4fbc43288c4e41a6f3c7c08cd -> xe-pw-149863v1

  IGT_8396: 8396
  xe-3196-d527f1a12f1a9cb4fbc43288c4e41a6f3c7c08cd: d527f1a12f1a9cb4fbc43288c4e41a6f3c7c08cd
  xe-pw-149863v1: 149863v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149863v1/index.html

--===============3413143382345712786==
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
<tr><td><b>Series:</b></td><td>Revert &quot;drm/xe/display: use xe-&gt;display to decide whether to do anything&quot;</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149863/">https://patchwork.freedesktop.org/series/149863/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149863v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149863v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3196-d527f1a12f1a9cb4fbc43288c4e41a6f3c7c08cd_BAT -&gt; xe-pw-149863v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 6)</h2>
<p>Missing    (2): bat-adlp-vm bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3196-d527f1a12f1a9cb4fbc43288c4e41a6f3c7c08cd -&gt; xe-pw-149863v1</li>
</ul>
<p>IGT_8396: 8396<br />
  xe-3196-d527f1a12f1a9cb4fbc43288c4e41a6f3c7c08cd: d527f1a12f1a9cb4fbc43288c4e41a6f3c7c08cd<br />
  xe-pw-149863v1: 149863v1</p>

</body>
</html>

--===============3413143382345712786==--

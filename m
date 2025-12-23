Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5CBE748FC
	for <intel-xe@archiver.kernel.org>; Tue, 23 Dec 2025 23:52:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A07810E2DE;
	Tue, 23 Dec 2025 23:52:54 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31DA10E2DE;
 Tue, 23 Dec 2025 23:52:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2240631602504085997=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/xe=5Fguc=5Fct=3A_Exi?=
 =?utf-8?q?t_CT_submission_fence_wait_on_GT_reset_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Dec 2025 23:52:52 -0000
Message-ID: <176653397299.114809.3421150743115233007@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251223230248.59814-2-jonathan.cavitt@intel.com>
In-Reply-To: <20251223230248.59814-2-jonathan.cavitt@intel.com>
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

--===============2240631602504085997==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_guc_ct: Exit CT submission fence wait on GT reset (rev2)
URL   : https://patchwork.freedesktop.org/series/158719/
State : success

== Summary ==

CI Bug Log - changes from xe-4299-98edae719c01b9b6b662528549fe1887112f39d8_BAT -> xe-pw-158719v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4299-98edae719c01b9b6b662528549fe1887112f39d8 -> xe-pw-158719v2

  IGT_8677: 8677
  xe-4299-98edae719c01b9b6b662528549fe1887112f39d8: 98edae719c01b9b6b662528549fe1887112f39d8
  xe-pw-158719v2: 158719v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158719v2/index.html

--===============2240631602504085997==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_guc_ct: Exit CT submission fence wait on GT reset (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158719/">https://patchwork.freedesktop.org/series/158719/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158719v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158719v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4299-98edae719c01b9b6b662528549fe1887112f39d8_BAT -&gt; xe-pw-158719v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4299-98edae719c01b9b6b662528549fe1887112f39d8 -&gt; xe-pw-158719v2</li>
</ul>
<p>IGT_8677: 8677<br />
  xe-4299-98edae719c01b9b6b662528549fe1887112f39d8: 98edae719c01b9b6b662528549fe1887112f39d8<br />
  xe-pw-158719v2: 158719v2</p>

</body>
</html>

--===============2240631602504085997==--

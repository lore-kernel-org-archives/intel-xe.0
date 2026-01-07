Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6743DD0D15D
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 18:33:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFDF10E649;
	Wed,  7 Jan 2026 18:33:37 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E8510E649;
 Wed,  7 Jan 2026 18:33:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0700941168512528442=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Improve_wedged_mo?=
 =?utf-8?q?de_handling_=28rev12=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 Jan 2026 18:33:36 -0000
Message-ID: <176781081646.133573.11815277050601340085@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260107174741.29163-1-lukasz.laguna@intel.com>
In-Reply-To: <20260107174741.29163-1-lukasz.laguna@intel.com>
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

--===============0700941168512528442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Improve wedged mode handling (rev12)
URL   : https://patchwork.freedesktop.org/series/148214/
State : success

== Summary ==

CI Bug Log - changes from xe-4339-77ca0c5f244b2796408d20cf3c0741094304e09f_BAT -> xe-pw-148214v12_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8691 -> IGT_8692
  * Linux: xe-4339-77ca0c5f244b2796408d20cf3c0741094304e09f -> xe-pw-148214v12

  IGT_8691: 8691
  IGT_8692: 8692
  xe-4339-77ca0c5f244b2796408d20cf3c0741094304e09f: 77ca0c5f244b2796408d20cf3c0741094304e09f
  xe-pw-148214v12: 148214v12

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v12/index.html

--===============0700941168512528442==
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
<tr><td><b>Series:</b></td><td>drm/xe: Improve wedged mode handling (rev12)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148214/">https://patchwork.freedesktop.org/series/148214/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v12/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v12/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4339-77ca0c5f244b2796408d20cf3c0741094304e09f_BAT -&gt; xe-pw-148214v12_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8691 -&gt; IGT_8692</li>
<li>Linux: xe-4339-77ca0c5f244b2796408d20cf3c0741094304e09f -&gt; xe-pw-148214v12</li>
</ul>
<p>IGT_8691: 8691<br />
  IGT_8692: 8692<br />
  xe-4339-77ca0c5f244b2796408d20cf3c0741094304e09f: 77ca0c5f244b2796408d20cf3c0741094304e09f<br />
  xe-pw-148214v12: 148214v12</p>

</body>
</html>

--===============0700941168512528442==--

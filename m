Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8DBC36002
	for <intel-xe@archiver.kernel.org>; Mon, 24 Mar 2025 17:41:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2720310E17F;
	Mon, 24 Mar 2025 17:41:58 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF1B10E17F;
 Mon, 24 Mar 2025 17:41:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5287432678867208117=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_xe-only_patches_f?=
 =?utf-8?q?rom_the_multi-device_GPUSVM_series_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Mar 2025 17:41:57 -0000
Message-ID: <174283811725.74611.6986119821283329990@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250324165500.20680-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250324165500.20680-1-thomas.hellstrom@linux.intel.com>
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

--===============5287432678867208117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: xe-only patches from the multi-device GPUSVM series (rev5)
URL   : https://patchwork.freedesktop.org/series/146383/
State : success

== Summary ==

CI Bug Log - changes from xe-2841-22207465b01fddd050a84720407d4d14c227372c_BAT -> xe-pw-146383v5_BAT
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

  * IGT: IGT_8279 -> IGT_8280
  * Linux: xe-2841-22207465b01fddd050a84720407d4d14c227372c -> xe-pw-146383v5

  IGT_8279: 8279
  IGT_8280: 8280
  xe-2841-22207465b01fddd050a84720407d4d14c227372c: 22207465b01fddd050a84720407d4d14c227372c
  xe-pw-146383v5: 146383v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v5/index.html

--===============5287432678867208117==
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
<tr><td><b>Series:</b></td><td>drm/xe: xe-only patches from the multi-device GPUSVM series (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146383/">https://patchwork.freedesktop.org/series/146383/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2841-22207465b01fddd050a84720407d4d14c227372c_BAT -&gt; xe-pw-146383v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8279 -&gt; IGT_8280</li>
<li>Linux: xe-2841-22207465b01fddd050a84720407d4d14c227372c -&gt; xe-pw-146383v5</li>
</ul>
<p>IGT_8279: 8279<br />
  IGT_8280: 8280<br />
  xe-2841-22207465b01fddd050a84720407d4d14c227372c: 22207465b01fddd050a84720407d4d14c227372c<br />
  xe-pw-146383v5: 146383v5</p>

</body>
</html>

--===============5287432678867208117==--

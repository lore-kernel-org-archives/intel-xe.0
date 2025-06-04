Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022D4C5B552
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 10:08:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81F310E730;
	Wed,  4 Jun 2025 10:08:00 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E6B110E6B2;
 Wed,  4 Jun 2025 10:08:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0304501180651270209=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/guc=5Fsubmit=3A_add_?=
 =?utf-8?q?back_fix_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Jun 2025 10:08:00 -0000
Message-ID: <174903168049.47765.3596464499642599869@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250603174213.1543579-2-matthew.auld@intel.com>
In-Reply-To: <20250603174213.1543579-2-matthew.auld@intel.com>
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

--===============0304501180651270209==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc_submit: add back fix (rev2)
URL   : https://patchwork.freedesktop.org/series/149790/
State : success

== Summary ==

CI Bug Log - changes from xe-3186-1a8dc5c25521273300f881e23c7294453b015048_BAT -> xe-pw-149790v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8392 -> IGT_8393
  * Linux: xe-3186-1a8dc5c25521273300f881e23c7294453b015048 -> xe-pw-149790v2

  IGT_8392: 8392
  IGT_8393: 6a256bfe3025b94fcef3757e4edd6b2198cecf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3186-1a8dc5c25521273300f881e23c7294453b015048: 1a8dc5c25521273300f881e23c7294453b015048
  xe-pw-149790v2: 149790v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/index.html

--===============0304501180651270209==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc_submit: add back fix (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149790/">https://patchwork.freedesktop.org/series/149790/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3186-1a8dc5c25521273300f881e23c7294453b015048_BAT -&gt; xe-pw-149790v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8392 -&gt; IGT_8393</li>
<li>Linux: xe-3186-1a8dc5c25521273300f881e23c7294453b015048 -&gt; xe-pw-149790v2</li>
</ul>
<p>IGT_8392: 8392<br />
  IGT_8393: 6a256bfe3025b94fcef3757e4edd6b2198cecf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3186-1a8dc5c25521273300f881e23c7294453b015048: 1a8dc5c25521273300f881e23c7294453b015048<br />
  xe-pw-149790v2: 149790v2</p>

</body>
</html>

--===============0304501180651270209==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D404C3ABC9
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 17:00:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD03510EB3D;
	Fri, 16 May 2025 17:00:22 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C8010EB39;
 Fri, 16 May 2025 17:00:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7569001941640711130=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_Impleme?=
 =?utf-8?q?nt_wa=5F16011342517?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 May 2025 17:00:22 -0000
Message-ID: <174741482221.88035.14221791824093655698@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250516143101.3313286-1-nemesa.garg@intel.com>
In-Reply-To: <20250516143101.3313286-1-nemesa.garg@intel.com>
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

--===============7569001941640711130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Implement wa_16011342517
URL   : https://patchwork.freedesktop.org/series/149119/
State : success

== Summary ==

CI Bug Log - changes from xe-3101-2d7bab8a71b85ae9419f0657aba0e6ba331703bb_BAT -> xe-pw-149119v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 7)
------------------------------

  Missing    (2): bat-lnl-2 bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3101-2d7bab8a71b85ae9419f0657aba0e6ba331703bb -> xe-pw-149119v1

  IGT_8365: 8365
  xe-3101-2d7bab8a71b85ae9419f0657aba0e6ba331703bb: 2d7bab8a71b85ae9419f0657aba0e6ba331703bb
  xe-pw-149119v1: 149119v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149119v1/index.html

--===============7569001941640711130==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Implement wa_16011342517</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149119/">https://patchwork.freedesktop.org/series/149119/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149119v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149119v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3101-2d7bab8a71b85ae9419f0657aba0e6ba331703bb_BAT -&gt; xe-pw-149119v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 7)</h2>
<p>Missing    (2): bat-lnl-2 bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3101-2d7bab8a71b85ae9419f0657aba0e6ba331703bb -&gt; xe-pw-149119v1</li>
</ul>
<p>IGT_8365: 8365<br />
  xe-3101-2d7bab8a71b85ae9419f0657aba0e6ba331703bb: 2d7bab8a71b85ae9419f0657aba0e6ba331703bb<br />
  xe-pw-149119v1: 149119v1</p>

</body>
</html>

--===============7569001941640711130==--

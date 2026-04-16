Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8583F8D763
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 17:41:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D31910E92D;
	Thu, 16 Apr 2026 17:41:11 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD77610E920;
 Thu, 16 Apr 2026 17:41:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3080105295938025149=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/aux=3A_use_polling?=
 =?utf-8?q?_when_irqs_are_unavailable_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 Apr 2026 17:41:09 -0000
Message-ID: <177636126982.469427.14782627280734649816@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260416163744.288107-1-michal.grzelak@intel.com>
In-Reply-To: <20260416163744.288107-1-michal.grzelak@intel.com>
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

--===============3080105295938025149==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/aux: use polling when irqs are unavailable (rev3)
URL   : https://patchwork.freedesktop.org/series/161431/
State : success

== Summary ==

CI Bug Log - changes from xe-4914-0898052c06eacd13f9fcbc2728072017274d7af3_BAT -> xe-pw-161431v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4914-0898052c06eacd13f9fcbc2728072017274d7af3 -> xe-pw-161431v3

  IGT_8862: 9b95600c4ae2cb683a8a19ad2a7c006263811a8f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4914-0898052c06eacd13f9fcbc2728072017274d7af3: 0898052c06eacd13f9fcbc2728072017274d7af3
  xe-pw-161431v3: 161431v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161431v3/index.html

--===============3080105295938025149==
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
<tr><td><b>Series:</b></td><td>drm/i915/aux: use polling when irqs are unavailable (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161431/">https://patchwork.freedesktop.org/series/161431/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161431v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161431v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4914-0898052c06eacd13f9fcbc2728072017274d7af3_BAT -&gt; xe-pw-161431v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4914-0898052c06eacd13f9fcbc2728072017274d7af3 -&gt; xe-pw-161431v3</li>
</ul>
<p>IGT_8862: 9b95600c4ae2cb683a8a19ad2a7c006263811a8f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4914-0898052c06eacd13f9fcbc2728072017274d7af3: 0898052c06eacd13f9fcbc2728072017274d7af3<br />
  xe-pw-161431v3: 161431v3</p>

</body>
</html>

--===============3080105295938025149==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3EACA6015
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 14:34:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D04110E9DC;
	Fri,  9 Oct 2026 14:34:10 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6788010E9DC;
 Fri,  9 Oct 2026 14:34:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4982178744402633691=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Fix_kernel_crash_during_dri?=
 =?utf-8?q?ver_teardown_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 09 Oct 2026 14:34:09 -0000
Message-ID: <179155644941.4087.16874343897233449239@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261009121921.818671-5-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20261009121921.818671-5-satyanarayana.k.v.p@intel.com>
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

--===============4982178744402633691==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix kernel crash during driver teardown (rev3)
URL   : https://patchwork.freedesktop.org/series/175766/
State : success

== Summary ==

CI Bug Log - changes from xe-5916-80944cbfa4c6eb4819defaecd0f9acaf46b5c23c_BAT -> xe-pw-175766v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5916-80944cbfa4c6eb4819defaecd0f9acaf46b5c23c -> xe-pw-175766v3

  IGT_9138: 9138
  xe-5916-80944cbfa4c6eb4819defaecd0f9acaf46b5c23c: 80944cbfa4c6eb4819defaecd0f9acaf46b5c23c
  xe-pw-175766v3: 175766v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175766v3/index.html

--===============4982178744402633691==
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
<tr><td><b>Series:</b></td><td>Fix kernel crash during driver teardown (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175766/">https://patchwork.freedesktop.org/series/175766/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175766v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175766v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5916-80944cbfa4c6eb4819defaecd0f9acaf46b5c23c_BAT -&gt; xe-pw-175766v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5916-80944cbfa4c6eb4819defaecd0f9acaf46b5c23c -&gt; xe-pw-175766v3</li>
</ul>
<p>IGT_9138: 9138<br />
  xe-5916-80944cbfa4c6eb4819defaecd0f9acaf46b5c23c: 80944cbfa4c6eb4819defaecd0f9acaf46b5c23c<br />
  xe-pw-175766v3: 175766v3</p>

</body>
</html>

--===============4982178744402633691==--

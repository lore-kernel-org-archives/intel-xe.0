Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628C1D232E3
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 05:43:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004CA10E173;
	Fri,  9 Jan 2026 05:43:11 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05DE810E173;
 Fri,  9 Jan 2026 05:43:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4029181353045573338=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_use_por?=
 =?utf-8?q?t_not_transcoder_for_PORT=5FALPM=5FCTL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kaushlendra Kumar" <kaushlendra.kumar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 09 Jan 2026 05:43:11 -0000
Message-ID: <176793739100.139512.3955293042589403079@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260109050021.2017982-1-kaushlendra.kumar@intel.com>
In-Reply-To: <20260109050021.2017982-1-kaushlendra.kumar@intel.com>
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

--===============4029181353045573338==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: use port not transcoder for PORT_ALPM_CTL
URL   : https://patchwork.freedesktop.org/series/159849/
State : success

== Summary ==

CI Bug Log - changes from xe-4353-5760400bacff92a11593e5ae3e3e87cb11a0716a_BAT -> xe-pw-159849v1_BAT
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

  * Linux: xe-4353-5760400bacff92a11593e5ae3e3e87cb11a0716a -> xe-pw-159849v1

  IGT_8692: 8692
  xe-4353-5760400bacff92a11593e5ae3e3e87cb11a0716a: 5760400bacff92a11593e5ae3e3e87cb11a0716a
  xe-pw-159849v1: 159849v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159849v1/index.html

--===============4029181353045573338==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: use port not transcoder for PORT_ALPM_CTL</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159849/">https://patchwork.freedesktop.org/series/159849/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159849v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159849v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4353-5760400bacff92a11593e5ae3e3e87cb11a0716a_BAT -&gt; xe-pw-159849v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4353-5760400bacff92a11593e5ae3e3e87cb11a0716a -&gt; xe-pw-159849v1</li>
</ul>
<p>IGT_8692: 8692<br />
  xe-4353-5760400bacff92a11593e5ae3e3e87cb11a0716a: 5760400bacff92a11593e5ae3e3e87cb11a0716a<br />
  xe-pw-159849v1: 159849v1</p>

</body>
</html>

--===============4029181353045573338==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F610CD6E49
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 22:03:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3380811256D;
	Fri, 29 May 2026 22:03:46 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36C011256D;
 Fri, 29 May 2026 22:03:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2285051815896997725=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/pcode=3A_Don=27t_ign?=
 =?utf-8?q?ore_drmm=5Fmutex=5Finit_failure?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 29 May 2026 22:03:44 -0000
Message-ID: <178009222471.23779.11512698391039305931@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260529195956.25349-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260529195956.25349-1-michal.wajdeczko@intel.com>
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

--===============2285051815896997725==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pcode: Don't ignore drmm_mutex_init failure
URL   : https://patchwork.freedesktop.org/series/167573/
State : success

== Summary ==

CI Bug Log - changes from xe-5166-3e2c8f106571c584ffbde0b25bcc8000052aad17_BAT -> xe-pw-167573v1_BAT
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

  * Linux: xe-5166-3e2c8f106571c584ffbde0b25bcc8000052aad17 -> xe-pw-167573v1

  IGT_8943: 8943
  xe-5166-3e2c8f106571c584ffbde0b25bcc8000052aad17: 3e2c8f106571c584ffbde0b25bcc8000052aad17
  xe-pw-167573v1: 167573v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167573v1/index.html

--===============2285051815896997725==
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
<tr><td><b>Series:</b></td><td>drm/xe/pcode: Don&#x27;t ignore drmm_mutex_init failure</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167573/">https://patchwork.freedesktop.org/series/167573/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167573v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167573v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5166-3e2c8f106571c584ffbde0b25bcc8000052aad17_BAT -&gt; xe-pw-167573v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5166-3e2c8f106571c584ffbde0b25bcc8000052aad17 -&gt; xe-pw-167573v1</li>
</ul>
<p>IGT_8943: 8943<br />
  xe-5166-3e2c8f106571c584ffbde0b25bcc8000052aad17: 3e2c8f106571c584ffbde0b25bcc8000052aad17<br />
  xe-pw-167573v1: 167573v1</p>

</body>
</html>

--===============2285051815896997725==--

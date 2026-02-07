Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966F3EE0AF1
	for <intel-xe@archiver.kernel.org>; Sat,  7 Feb 2026 22:40:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE5010E2BC;
	Sat,  7 Feb 2026 22:40:17 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD9010E2BC;
 Sat,  7 Feb 2026 22:40:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6948195243534596298=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/vf=3A_Allow_VF_to_in?=
 =?utf-8?q?itialize_MCR_tables?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 07 Feb 2026 22:40:15 -0000
Message-ID: <177050401587.236221.3122271016398162377@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260207214428.5205-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260207214428.5205-1-michal.wajdeczko@intel.com>
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

--===============6948195243534596298==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vf: Allow VF to initialize MCR tables
URL   : https://patchwork.freedesktop.org/series/161319/
State : success

== Summary ==

CI Bug Log - changes from xe-4522-e294156cfd0b6db73e96c58789049e8b504bb165_BAT -> xe-pw-161319v1_BAT
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

  * Linux: xe-4522-e294156cfd0b6db73e96c58789049e8b504bb165 -> xe-pw-161319v1

  IGT_8742: 8742
  xe-4522-e294156cfd0b6db73e96c58789049e8b504bb165: e294156cfd0b6db73e96c58789049e8b504bb165
  xe-pw-161319v1: 161319v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161319v1/index.html

--===============6948195243534596298==
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
<tr><td><b>Series:</b></td><td>drm/xe/vf: Allow VF to initialize MCR tables</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161319/">https://patchwork.freedesktop.org/series/161319/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161319v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161319v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4522-e294156cfd0b6db73e96c58789049e8b504bb165_BAT -&gt; xe-pw-161319v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4522-e294156cfd0b6db73e96c58789049e8b504bb165 -&gt; xe-pw-161319v1</li>
</ul>
<p>IGT_8742: 8742<br />
  xe-4522-e294156cfd0b6db73e96c58789049e8b504bb165: e294156cfd0b6db73e96c58789049e8b504bb165<br />
  xe-pw-161319v1: 161319v1</p>

</body>
</html>

--===============6948195243534596298==--

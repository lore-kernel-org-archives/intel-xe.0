Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1800CF364CB
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 22:48:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE28110E873;
	Thu,  9 Apr 2026 22:48:10 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB26510E873;
 Thu,  9 Apr 2026 22:48:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0160533131536339322=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Apply_WA=5F140268?=
 =?utf-8?q?10691_to_engine?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Clint Taylor" <clinton.a.taylor@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Apr 2026 22:48:09 -0000
Message-ID: <177577488986.448205.10989484357093292995@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260409215705.1456888-1-clinton.a.taylor@intel.com>
In-Reply-To: <20260409215705.1456888-1-clinton.a.taylor@intel.com>
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

--===============0160533131536339322==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Apply WA_14026810691 to engine
URL   : https://patchwork.freedesktop.org/series/164657/
State : success

== Summary ==

CI Bug Log - changes from xe-4860-5ee75b2816df74bfe606d4dfc061547d5cda4ebf_BAT -> xe-pw-164657v1_BAT
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

  * IGT: IGT_8850 -> IGT_8852
  * Linux: xe-4860-5ee75b2816df74bfe606d4dfc061547d5cda4ebf -> xe-pw-164657v1

  IGT_8850: 8850
  IGT_8852: 8852
  xe-4860-5ee75b2816df74bfe606d4dfc061547d5cda4ebf: 5ee75b2816df74bfe606d4dfc061547d5cda4ebf
  xe-pw-164657v1: 164657v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v1/index.html

--===============0160533131536339322==
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
<tr><td><b>Series:</b></td><td>drm/xe: Apply WA_14026810691 to engine</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164657/">https://patchwork.freedesktop.org/series/164657/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4860-5ee75b2816df74bfe606d4dfc061547d5cda4ebf_BAT -&gt; xe-pw-164657v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8850 -&gt; IGT_8852</li>
<li>Linux: xe-4860-5ee75b2816df74bfe606d4dfc061547d5cda4ebf -&gt; xe-pw-164657v1</li>
</ul>
<p>IGT_8850: 8850<br />
  IGT_8852: 8852<br />
  xe-4860-5ee75b2816df74bfe606d4dfc061547d5cda4ebf: 5ee75b2816df74bfe606d4dfc061547d5cda4ebf<br />
  xe-pw-164657v1: 164657v1</p>

</body>
</html>

--===============0160533131536339322==--

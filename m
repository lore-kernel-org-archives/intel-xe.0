Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519FAC2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 10:42:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E869310E618;
	Tue, 25 Jun 2024 10:42:16 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A95E10E05A;
 Tue, 25 Jun 2024 10:42:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9106150914013818980=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/client=3A_Check_return_va?=
 =?utf-8?q?lue_of_xe=5Fforce=5Fwake=5Fget_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jun 2024 10:42:16 -0000
Message-ID: <171931213643.153309.1974197690374322551@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240625094228.5327-1-nirmoy.das@intel.com>
In-Reply-To: <20240625094228.5327-1-nirmoy.das@intel.com>
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

--===============9106150914013818980==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/client: Check return value of xe_force_wake_get (rev5)
URL   : https://patchwork.freedesktop.org/series/134121/
State : success

== Summary ==

CI Bug Log - changes from xe-1524-5e45785f315938951d86af616d35a5ba08bfeabc_BAT -> xe-pw-134121v5_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1524-5e45785f315938951d86af616d35a5ba08bfeabc -> xe-pw-134121v5

  IGT_7898: a2600953b16d6628855b89ac40f477b58933b37b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1524-5e45785f315938951d86af616d35a5ba08bfeabc: 5e45785f315938951d86af616d35a5ba08bfeabc
  xe-pw-134121v5: 134121v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134121v5/index.html

--===============9106150914013818980==
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
<tr><td><b>Series:</b></td><td>drm/xe/client: Check return value of xe_force_wake_get (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134121/">https://patchwork.freedesktop.org/series/134121/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134121v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134121v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1524-5e45785f315938951d86af616d35a5ba08bfeabc_BAT -&gt; xe-pw-134121v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1524-5e45785f315938951d86af616d35a5ba08bfeabc -&gt; xe-pw-134121v5</li>
</ul>
<p>IGT_7898: a2600953b16d6628855b89ac40f477b58933b37b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1524-5e45785f315938951d86af616d35a5ba08bfeabc: 5e45785f315938951d86af616d35a5ba08bfeabc<br />
  xe-pw-134121v5: 134121v5</p>

</body>
</html>

--===============9106150914013818980==--

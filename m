Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D42C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 20:18:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1C811200C;
	Tue,  2 Apr 2024 20:18:45 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5793C11200C;
 Tue,  2 Apr 2024 20:18:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1237363624116922448=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/hwmon=3A_Update_xe_hwmon_?=
 =?utf-8?q?with_couple_of_fixes_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 02 Apr 2024 20:18:45 -0000
Message-ID: <171208912535.1155664.6135413219751593684@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240402192724.673747-1-karthik.poosa@intel.com>
In-Reply-To: <20240402192724.673747-1-karthik.poosa@intel.com>
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

--===============1237363624116922448==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/hwmon: Update xe hwmon with couple of fixes (rev4)
URL   : https://patchwork.freedesktop.org/series/131765/
State : success

== Summary ==

CI Bug Log - changes from xe-1027-299f7a75705d11f73240362db38d67fa8d77f61d_BAT -> xe-pw-131765v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-131765v4_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1415]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1415


Build changes
-------------

  * Linux: xe-1027-299f7a75705d11f73240362db38d67fa8d77f61d -> xe-pw-131765v4

  IGT_7796: 2cfed18f6aa776c1593d7cc328d23225dd61bdf9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1027-299f7a75705d11f73240362db38d67fa8d77f61d: 299f7a75705d11f73240362db38d67fa8d77f61d
  xe-pw-131765v4: 131765v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131765v4/index.html

--===============1237363624116922448==
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
<tr><td><b>Series:</b></td><td>drm/xe/hwmon: Update xe hwmon with couple of fixes (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131765/">https://patchwork.freedesktop.org/series/131765/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131765v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131765v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1027-299f7a75705d11f73240362db38d67fa8d77f61d_BAT -&gt; xe-pw-131765v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-131765v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1027-299f7a75705d11f73240362db38d67fa8d77f61d -&gt; xe-pw-131765v4</li>
</ul>
<p>IGT_7796: 2cfed18f6aa776c1593d7cc328d23225dd61bdf9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1027-299f7a75705d11f73240362db38d67fa8d77f61d: 299f7a75705d11f73240362db38d67fa8d77f61d<br />
  xe-pw-131765v4: 131765v4</p>

</body>
</html>

--===============1237363624116922448==--

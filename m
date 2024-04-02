Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF38C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 18:54:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4339010FF86;
	Tue,  2 Apr 2024 18:54:54 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E31C10FF86;
 Tue,  2 Apr 2024 18:54:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3507771142239862182=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/hwmon=3A_Update_xe_hwmon_?=
 =?utf-8?q?with_couple_of_fixes_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 02 Apr 2024 18:54:52 -0000
Message-ID: <171208409257.1155664.17722214060217321770@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240402180956.508398-1-karthik.poosa@intel.com>
In-Reply-To: <20240402180956.508398-1-karthik.poosa@intel.com>
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

--===============3507771142239862182==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/hwmon: Update xe hwmon with couple of fixes (rev3)
URL   : https://patchwork.freedesktop.org/series/131765/
State : success

== Summary ==

CI Bug Log - changes from xe-1026-5100fcc57dc5d45b246a0aeb068f4f8062d29b09_BAT -> xe-pw-131765v3_BAT
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

  Here are the changes found in xe-pw-131765v3_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414
  [Intel XE#1415]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1415


Build changes
-------------

  * Linux: xe-1026-5100fcc57dc5d45b246a0aeb068f4f8062d29b09 -> xe-pw-131765v3

  IGT_7796: 2cfed18f6aa776c1593d7cc328d23225dd61bdf9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1026-5100fcc57dc5d45b246a0aeb068f4f8062d29b09: 5100fcc57dc5d45b246a0aeb068f4f8062d29b09
  xe-pw-131765v3: 131765v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131765v3/index.html

--===============3507771142239862182==
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
<tr><td><b>Series:</b></td><td>drm/xe/hwmon: Update xe hwmon with couple of fixes (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131765/">https://patchwork.freedesktop.org/series/131765/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131765v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131765v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1026-5100fcc57dc5d45b246a0aeb068f4f8062d29b09_BAT -&gt; xe-pw-131765v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-131765v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1026-5100fcc57dc5d45b246a0aeb068f4f8062d29b09 -&gt; xe-pw-131765v3</li>
</ul>
<p>IGT_7796: 2cfed18f6aa776c1593d7cc328d23225dd61bdf9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1026-5100fcc57dc5d45b246a0aeb068f4f8062d29b09: 5100fcc57dc5d45b246a0aeb068f4f8062d29b09<br />
  xe-pw-131765v3: 131765v3</p>

</body>
</html>

--===============3507771142239862182==--

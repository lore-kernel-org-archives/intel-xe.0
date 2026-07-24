Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9EBC531F9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 12:31:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7479C10E041;
	Fri, 24 Jul 2026 12:31:35 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAE210E041;
 Fri, 24 Jul 2026 12:31:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7335485685290862580=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_KUnit_test_for_VF_provision?=
 =?utf-8?q?ing_error_handling_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Jul 2026 12:31:34 -0000
Message-ID: <178489629477.225335.11832115025995182888@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260724114939.1560743-6-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260724114939.1560743-6-satyanarayana.k.v.p@intel.com>
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

--===============7335485685290862580==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: KUnit test for VF provisioning error handling (rev3)
URL   : https://patchwork.freedesktop.org/series/170198/
State : success

== Summary ==

CI Bug Log - changes from xe-5477-b747a63003130bef1a3d5d6ba97c94d0cee36f55_BAT -> xe-pw-170198v3_BAT
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

  * Linux: xe-5477-b747a63003130bef1a3d5d6ba97c94d0cee36f55 -> xe-pw-170198v3

  IGT_9025: 852c13ddd448fd668c43584ca3ad1aec49c4633c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5477-b747a63003130bef1a3d5d6ba97c94d0cee36f55: b747a63003130bef1a3d5d6ba97c94d0cee36f55
  xe-pw-170198v3: 170198v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v3/index.html

--===============7335485685290862580==
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
<tr><td><b>Series:</b></td><td>KUnit test for VF provisioning error handling (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170198/">https://patchwork.freedesktop.org/series/170198/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5477-b747a63003130bef1a3d5d6ba97c94d0cee36f55_BAT -&gt; xe-pw-170198v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5477-b747a63003130bef1a3d5d6ba97c94d0cee36f55 -&gt; xe-pw-170198v3</li>
</ul>
<p>IGT_9025: 852c13ddd448fd668c43584ca3ad1aec49c4633c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5477-b747a63003130bef1a3d5d6ba97c94d0cee36f55: b747a63003130bef1a3d5d6ba97c94d0cee36f55<br />
  xe-pw-170198v3: 170198v3</p>

</body>
</html>

--===============7335485685290862580==--

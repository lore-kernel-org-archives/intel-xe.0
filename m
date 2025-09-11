Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD915CA1016
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 05:38:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D02D10EA16;
	Thu, 11 Sep 2025 05:38:55 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A378A10EA16;
 Thu, 11 Sep 2025 05:38:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1047957335495621455=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_defer_free_of_NVM?=
 =?utf-8?q?_auxiliary_container_to_device_release_callback?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nitin Gote" <nitin.r.gote@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Sep 2025 05:38:53 -0000
Message-ID: <175756913366.323999.15579152129293823063@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250911052823.226696-1-nitin.r.gote@intel.com>
In-Reply-To: <20250911052823.226696-1-nitin.r.gote@intel.com>
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

--===============1047957335495621455==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: defer free of NVM auxiliary container to device release callback
URL   : https://patchwork.freedesktop.org/series/154354/
State : success

== Summary ==

CI Bug Log - changes from xe-3722-e74a5e2dc4306c0a79d5f8d5f3ca81a274760f8c_BAT -> xe-pw-154354v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3722-e74a5e2dc4306c0a79d5f8d5f3ca81a274760f8c -> xe-pw-154354v1

  IGT_8532: 3b9f234d6efe0529a233b81bb0d5ffee5adddb01 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3722-e74a5e2dc4306c0a79d5f8d5f3ca81a274760f8c: e74a5e2dc4306c0a79d5f8d5f3ca81a274760f8c
  xe-pw-154354v1: 154354v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154354v1/index.html

--===============1047957335495621455==
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
<tr><td><b>Series:</b></td><td>drm/xe: defer free of NVM auxiliary container to device release callback</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154354/">https://patchwork.freedesktop.org/series/154354/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154354v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154354v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3722-e74a5e2dc4306c0a79d5f8d5f3ca81a274760f8c_BAT -&gt; xe-pw-154354v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3722-e74a5e2dc4306c0a79d5f8d5f3ca81a274760f8c -&gt; xe-pw-154354v1</li>
</ul>
<p>IGT_8532: 3b9f234d6efe0529a233b81bb0d5ffee5adddb01 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3722-e74a5e2dc4306c0a79d5f8d5f3ca81a274760f8c: e74a5e2dc4306c0a79d5f8d5f3ca81a274760f8c<br />
  xe-pw-154354v1: 154354v1</p>

</body>
</html>

--===============1047957335495621455==--

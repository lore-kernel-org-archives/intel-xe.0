Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DC9606A326
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 22:41:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC66510E489;
	Fri,  6 Nov 2026 22:41:39 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D6D10E47F;
 Fri,  6 Nov 2026 22:41:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5247872880640089961=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/vf=3A_New_approach_f?=
 =?utf-8?q?or_post-migration_LRC_fixups_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomasz Lis" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Nov 2026 22:41:39 -0000
Message-ID: <179400489912.134852.11212099992370859925@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261106215700.1218318-1-tomasz.lis@intel.com>
In-Reply-To: <20261106215700.1218318-1-tomasz.lis@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5247872880640089961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vf: New approach for post-migration LRC fixups (rev3)
URL   : https://patchwork.freedesktop.org/series/165741/
State : success

== Summary ==

CI Bug Log - changes from xe-6083-0fc83549472103d79c061d44b72aa909cc8a1ef4_BAT -> xe-pw-165741v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-6083-0fc83549472103d79c061d44b72aa909cc8a1ef4 -> xe-pw-165741v3

  IGT_9181: 9181
  xe-6083-0fc83549472103d79c061d44b72aa909cc8a1ef4: 0fc83549472103d79c061d44b72aa909cc8a1ef4
  xe-pw-165741v3: 165741v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165741v3/index.html

--===============5247872880640089961==
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
<tr><td><b>Series:</b></td><td>drm/xe/vf: New approach for post-migration LRC fixups (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165741/">https://patchwork.freedesktop.org/series/165741/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165741v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165741v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6083-0fc83549472103d79c061d44b72aa909cc8a1ef4_BAT -&gt; xe-pw-165741v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6083-0fc83549472103d79c061d44b72aa909cc8a1ef4 -&gt; xe-pw-165741v3</li>
</ul>
<p>IGT_9181: 9181<br />
  xe-6083-0fc83549472103d79c061d44b72aa909cc8a1ef4: 0fc83549472103d79c061d44b72aa909cc8a1ef4<br />
  xe-pw-165741v3: 165741v3</p>

</body>
</html>

--===============5247872880640089961==--

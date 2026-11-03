Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF91606A324
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 00:18:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8B210E150;
	Tue,  3 Nov 2026 00:18:58 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C0610E054;
 Tue,  3 Nov 2026 00:18:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0734070352300961602=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe/guc=3A_Test_GuC_v70?=
 =?utf-8?q?=2E83=2E0_for_DG2=2C_MTL=2C_LNL=2C_BMG=2C_PTL=2C_NVL-S/U/H?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Nov 2026 00:18:58 -0000
Message-ID: <179366513813.107655.5063784559198515801@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261102220634.542988-2-julia.filipchuk@intel.com>
In-Reply-To: <20261102220634.542988-2-julia.filipchuk@intel.com>
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

--===============0734070352300961602==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Test GuC v70.83.0 for DG2, MTL, LNL, BMG, PTL, NVL-S/U/H
URL   : https://patchwork.freedesktop.org/series/177512/
State : success

== Summary ==

CI Bug Log - changes from xe-6047-2cd78713d917a02987f21b437561a5e1e13ddda2_FULL -> xe-pw-177512v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-6047-2cd78713d917a02987f21b437561a5e1e13ddda2 -> xe-pw-177512v1

  IGT_9175: 9175
  xe-6047-2cd78713d917a02987f21b437561a5e1e13ddda2: 2cd78713d917a02987f21b437561a5e1e13ddda2
  xe-pw-177512v1: 177512v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177512v1/index.html

--===============0734070352300961602==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Test GuC v70.83.0 for DG2, MTL, LNL, BMG, PTL, NVL-S/U/H</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177512/">https://patchwork.freedesktop.org/series/177512/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177512v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177512v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6047-2cd78713d917a02987f21b437561a5e1e13ddda2_FULL -&gt; xe-pw-177512v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6047-2cd78713d917a02987f21b437561a5e1e13ddda2 -&gt; xe-pw-177512v1</li>
</ul>
<p>IGT_9175: 9175<br />
  xe-6047-2cd78713d917a02987f21b437561a5e1e13ddda2: 2cd78713d917a02987f21b437561a5e1e13ddda2<br />
  xe-pw-177512v1: 177512v1</p>

</body>
</html>

--===============0734070352300961602==--

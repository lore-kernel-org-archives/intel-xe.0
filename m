Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF33606A326
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 22:46:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A0810E6E9;
	Mon,  2 Nov 2026 22:46:36 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1066810E6E9;
 Mon,  2 Nov 2026 22:46:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6102989933655234601=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/guc=3A_Test_GuC_v70?=
 =?utf-8?q?=2E83=2E0_for_DG2=2C_MTL=2C_LNL=2C_BMG=2C_PTL=2C_NVL-S/U/H?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Nov 2026 22:46:35 -0000
Message-ID: <179365959505.106923.17390727233962449949@221881a7231d>
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

--===============6102989933655234601==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Test GuC v70.83.0 for DG2, MTL, LNL, BMG, PTL, NVL-S/U/H
URL   : https://patchwork.freedesktop.org/series/177512/
State : success

== Summary ==

CI Bug Log - changes from xe-6047-2cd78713d917a02987f21b437561a5e1e13ddda2_BAT -> xe-pw-177512v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 13)
------------------------------

  Missing    (2): bat-bmg-vm bat-ptl-vm 

Known issues
------------

  Here are the changes found in xe-pw-177512v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@runner@aborted:
    - bat-atsm-2:         NOTRUN -> [FAIL][1] ([Intel XE#9717])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177512v1/bat-atsm-2/igt@runner@aborted.html

  
  [Intel XE#9717]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9717


Build changes
-------------

  * Linux: xe-6047-2cd78713d917a02987f21b437561a5e1e13ddda2 -> xe-pw-177512v1

  IGT_9175: 9175
  xe-6047-2cd78713d917a02987f21b437561a5e1e13ddda2: 2cd78713d917a02987f21b437561a5e1e13ddda2
  xe-pw-177512v1: 177512v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177512v1/index.html

--===============6102989933655234601==
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


    <h1>CI Bug Log - changes from xe-6047-2cd78713d917a02987f21b437561a5e1e13ddda2_BAT -&gt; xe-pw-177512v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 13)</h2>
<p>Missing    (2): bat-bmg-vm bat-ptl-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-177512v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177512v1/bat-atsm-2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9717">Intel XE#9717</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6047-2cd78713d917a02987f21b437561a5e1e13ddda2 -&gt; xe-pw-177512v1</li>
</ul>
<p>IGT_9175: 9175<br />
  xe-6047-2cd78713d917a02987f21b437561a5e1e13ddda2: 2cd78713d917a02987f21b437561a5e1e13ddda2<br />
  xe-pw-177512v1: 177512v1</p>

</body>
</html>

--===============6102989933655234601==--

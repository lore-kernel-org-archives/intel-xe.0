Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F440606A335
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 22:08:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F1A10E2A8;
	Mon,  2 Nov 2026 22:08:23 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D6F10E2A8;
 Mon,  2 Nov 2026 22:08:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2986308587572875309=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Add_mode-3_fault_?=
 =?utf-8?q?inspection_with_debugfs_release?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniel Charles" <daniel.charles@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Nov 2026 22:08:22 -0000
Message-ID: <179365730220.106923.15724799560874474443@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261102210242.635207-1-daniel.charles@intel.com>
In-Reply-To: <20261102210242.635207-1-daniel.charles@intel.com>
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

--===============2986308587572875309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add mode-3 fault inspection with debugfs release
URL   : https://patchwork.freedesktop.org/series/177508/
State : success

== Summary ==

CI Bug Log - changes from xe-6047-2cd78713d917a02987f21b437561a5e1e13ddda2_BAT -> xe-pw-177508v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-177508v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@runner@aborted:
    - bat-atsm-2:         NOTRUN -> [FAIL][1] ([Intel XE#9717])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177508v1/bat-atsm-2/igt@runner@aborted.html

  
  [Intel XE#9717]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9717


Build changes
-------------

  * Linux: xe-6047-2cd78713d917a02987f21b437561a5e1e13ddda2 -> xe-pw-177508v1

  IGT_9175: 9175
  xe-6047-2cd78713d917a02987f21b437561a5e1e13ddda2: 2cd78713d917a02987f21b437561a5e1e13ddda2
  xe-pw-177508v1: 177508v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177508v1/index.html

--===============2986308587572875309==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add mode-3 fault inspection with debugfs release</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177508/">https://patchwork.freedesktop.org/series/177508/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177508v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177508v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6047-2cd78713d917a02987f21b437561a5e1e13ddda2_BAT -&gt; xe-pw-177508v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-177508v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177508v1/bat-atsm-2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9717">Intel XE#9717</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6047-2cd78713d917a02987f21b437561a5e1e13ddda2 -&gt; xe-pw-177508v1</li>
</ul>
<p>IGT_9175: 9175<br />
  xe-6047-2cd78713d917a02987f21b437561a5e1e13ddda2: 2cd78713d917a02987f21b437561a5e1e13ddda2<br />
  xe-pw-177508v1: 177508v1</p>

</body>
</html>

--===============2986308587572875309==--

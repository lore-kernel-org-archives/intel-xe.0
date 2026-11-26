Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554B5606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 06:42:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E04A10FE15;
	Thu, 26 Nov 2026 06:42:59 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36ECD10FDE1;
 Thu, 26 Nov 2026 06:42:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8698430444362996077=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Expose_power1=5Fcap=5Fmax_?=
 =?utf-8?q?=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Nov 2026 06:42:57 -0000
Message-ID: <179567537721.89568.9759626997648339341@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261126055530.1629019-1-karthik.poosa@intel.com>
In-Reply-To: <20261126055530.1629019-1-karthik.poosa@intel.com>
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

--===============8698430444362996077==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Expose power1_cap_max (rev4)
URL   : https://patchwork.freedesktop.org/series/179377/
State : success

== Summary ==

CI Bug Log - changes from xe-6238-7936dff5abd09d0769344053d284fcf095ec5ec4_BAT -> xe-pw-179377v4_BAT
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

  * Linux: xe-6238-7936dff5abd09d0769344053d284fcf095ec5ec4 -> xe-pw-179377v4

  IGT_9204: 52e9317c945f97f29fbec75be29280fc7b00cf32 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-6238-7936dff5abd09d0769344053d284fcf095ec5ec4: 7936dff5abd09d0769344053d284fcf095ec5ec4
  xe-pw-179377v4: 179377v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179377v4/index.html

--===============8698430444362996077==
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
<tr><td><b>Series:</b></td><td>Expose power1_cap_max (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179377/">https://patchwork.freedesktop.org/series/179377/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179377v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179377v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6238-7936dff5abd09d0769344053d284fcf095ec5ec4_BAT -&gt; xe-pw-179377v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6238-7936dff5abd09d0769344053d284fcf095ec5ec4 -&gt; xe-pw-179377v4</li>
</ul>
<p>IGT_9204: 52e9317c945f97f29fbec75be29280fc7b00cf32 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-6238-7936dff5abd09d0769344053d284fcf095ec5ec4: 7936dff5abd09d0769344053d284fcf095ec5ec4<br />
  xe-pw-179377v4: 179377v4</p>

</body>
</html>

--===============8698430444362996077==--

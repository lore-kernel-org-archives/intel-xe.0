Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA1A606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 23:46:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0CD510E709;
	Wed, 28 Oct 2026 23:46:16 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8FD210E709;
 Wed, 28 Oct 2026 23:46:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0027971649818969496=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/1?=
 =?utf-8?q?=5D_drm/xe/mmio=3A_Update_xe=5Fmmio=5Fwait_to_use_kernel_polling_?=
 =?utf-8?q?helpers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Oct 2026 23:46:15 -0000
Message-ID: <179323117594.84378.16042745023117219495@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261028230254.496501-2-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20261028230254.496501-2-alan.previn.teres.alexis@intel.com>
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

--===============0027971649818969496==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/1] drm/xe/mmio: Update xe_mmio_wait to use kernel polling helpers
URL   : https://patchwork.freedesktop.org/series/177059/
State : success

== Summary ==

CI Bug Log - changes from xe-6025-c5e5c97abe824c32d4cbb5a1ae5625374f4bc5e1_BAT -> xe-pw-177059v1_BAT
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

  * Linux: xe-6025-c5e5c97abe824c32d4cbb5a1ae5625374f4bc5e1 -> xe-pw-177059v1

  IGT_9170: 9170
  xe-6025-c5e5c97abe824c32d4cbb5a1ae5625374f4bc5e1: c5e5c97abe824c32d4cbb5a1ae5625374f4bc5e1
  xe-pw-177059v1: 177059v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177059v1/index.html

--===============0027971649818969496==
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
<tr><td><b>Series:</b></td><td>series starting with [1/1] drm/xe/mmio: Update xe_mmio_wait to use kernel polling helpers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177059/">https://patchwork.freedesktop.org/series/177059/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177059v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177059v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6025-c5e5c97abe824c32d4cbb5a1ae5625374f4bc5e1_BAT -&gt; xe-pw-177059v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6025-c5e5c97abe824c32d4cbb5a1ae5625374f4bc5e1 -&gt; xe-pw-177059v1</li>
</ul>
<p>IGT_9170: 9170<br />
  xe-6025-c5e5c97abe824c32d4cbb5a1ae5625374f4bc5e1: c5e5c97abe824c32d4cbb5a1ae5625374f4bc5e1<br />
  xe-pw-177059v1: 177059v1</p>

</body>
</html>

--===============0027971649818969496==--

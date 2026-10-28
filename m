Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C589606A33A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 21:57:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87EDD10E599;
	Wed, 28 Oct 2026 21:57:00 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2590810E599;
 Wed, 28 Oct 2026 21:56:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0634308688022665666=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_topic/xe-for-CI=3A_update_G?=
 =?utf-8?q?uC_for_CRI_and_NVL-P_to_70=2E80=2E0_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Oct 2026 21:56:59 -0000
Message-ID: <179322461914.84378.18414573931167435900@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261027224448.1672411-6-daniele.ceraolospurio@intel.com>
In-Reply-To: <20261027224448.1672411-6-daniele.ceraolospurio@intel.com>
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

--===============0634308688022665666==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: topic/xe-for-CI: update GuC for CRI and NVL-P to 70.80.0 (rev2)
URL   : https://patchwork.freedesktop.org/series/176988/
State : success

== Summary ==

CI Bug Log - changes from xe-6023-fbed42265ffde9b162e21ed7ff0cfce070e19aaa_BAT -> xe-pw-176988v2_BAT
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

  * Linux: xe-6023-fbed42265ffde9b162e21ed7ff0cfce070e19aaa -> xe-pw-176988v2

  IGT_9170: 9170
  xe-6023-fbed42265ffde9b162e21ed7ff0cfce070e19aaa: fbed42265ffde9b162e21ed7ff0cfce070e19aaa
  xe-pw-176988v2: 176988v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176988v2/index.html

--===============0634308688022665666==
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
<tr><td><b>Series:</b></td><td>topic/xe-for-CI: update GuC for CRI and NVL-P to 70.80.0 (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176988/">https://patchwork.freedesktop.org/series/176988/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176988v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176988v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6023-fbed42265ffde9b162e21ed7ff0cfce070e19aaa_BAT -&gt; xe-pw-176988v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6023-fbed42265ffde9b162e21ed7ff0cfce070e19aaa -&gt; xe-pw-176988v2</li>
</ul>
<p>IGT_9170: 9170<br />
  xe-6023-fbed42265ffde9b162e21ed7ff0cfce070e19aaa: fbed42265ffde9b162e21ed7ff0cfce070e19aaa<br />
  xe-pw-176988v2: 176988v2</p>

</body>
</html>

--===============0634308688022665666==--

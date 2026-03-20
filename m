Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9CA1098787
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 14:09:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 340F110E20A;
	Fri, 20 Mar 2026 14:09:03 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 286E210E20A;
 Fri, 20 Mar 2026 14:09:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7011971024651436577=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/psr=3A_Fixes_for_D?=
 =?utf-8?q?ell_XPS_DA14260_quirk_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Mar 2026 14:09:02 -0000
Message-ID: <177401574214.379016.14110024665384922886@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260320080403.1396926-1-jouni.hogander@intel.com>
In-Reply-To: <20260320080403.1396926-1-jouni.hogander@intel.com>
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

--===============7011971024651436577==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/psr: Fixes for Dell XPS DA14260 quirk (rev2)
URL   : https://patchwork.freedesktop.org/series/163567/
State : success

== Summary ==

CI Bug Log - changes from xe-4752-7535044a2418d22b59be0eb64af0353971f16bd8_BAT -> xe-pw-163567v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8814 -> IGT_8815
  * Linux: xe-4752-7535044a2418d22b59be0eb64af0353971f16bd8 -> xe-pw-163567v2

  IGT_8814: 8814
  IGT_8815: 8815
  xe-4752-7535044a2418d22b59be0eb64af0353971f16bd8: 7535044a2418d22b59be0eb64af0353971f16bd8
  xe-pw-163567v2: 163567v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163567v2/index.html

--===============7011971024651436577==
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
<tr><td><b>Series:</b></td><td>drm/i915/psr: Fixes for Dell XPS DA14260 quirk (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163567/">https://patchwork.freedesktop.org/series/163567/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163567v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163567v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4752-7535044a2418d22b59be0eb64af0353971f16bd8_BAT -&gt; xe-pw-163567v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8814 -&gt; IGT_8815</li>
<li>Linux: xe-4752-7535044a2418d22b59be0eb64af0353971f16bd8 -&gt; xe-pw-163567v2</li>
</ul>
<p>IGT_8814: 8814<br />
  IGT_8815: 8815<br />
  xe-4752-7535044a2418d22b59be0eb64af0353971f16bd8: 7535044a2418d22b59be0eb64af0353971f16bd8<br />
  xe-pw-163567v2: 163567v2</p>

</body>
</html>

--===============7011971024651436577==--

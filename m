Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D8E606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 13:34:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C0B10E2E8;
	Mon, 26 Oct 2026 13:34:35 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F7710E2E8;
 Mon, 26 Oct 2026 13:34:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0438751486628646837=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_reduce_?=
 =?utf-8?q?clock=5Fgating_interface_between_core_and_display_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Oct 2026 13:34:33 -0000
Message-ID: <179302167388.71285.7853572013062649526@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261026094724.53374-1-luciano.coelho@intel.com>
In-Reply-To: <20261026094724.53374-1-luciano.coelho@intel.com>
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

--===============0438751486628646837==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: reduce clock_gating interface between core and display (rev5)
URL   : https://patchwork.freedesktop.org/series/172330/
State : success

== Summary ==

CI Bug Log - changes from xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a_BAT -> xe-pw-172330v5_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 13)
------------------------------

  Missing    (2): bat-bmg-vm bat-ptl-vm 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9163 -> IGT_9164
  * Linux: xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a -> xe-pw-172330v5

  IGT_9163: 9163
  IGT_9164: 9164
  xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a: d56ff005f0d16ec136ee31fe3238eb447fefdc1a
  xe-pw-172330v5: 172330v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/index.html

--===============0438751486628646837==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: reduce clock_gating interface between core and display (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172330/">https://patchwork.freedesktop.org/series/172330/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172330v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a_BAT -&gt; xe-pw-172330v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 13)</h2>
<p>Missing    (2): bat-bmg-vm bat-ptl-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9163 -&gt; IGT_9164</li>
<li>Linux: xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a -&gt; xe-pw-172330v5</li>
</ul>
<p>IGT_9163: 9163<br />
  IGT_9164: 9164<br />
  xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a: d56ff005f0d16ec136ee31fe3238eb447fefdc1a<br />
  xe-pw-172330v5: 172330v5</p>

</body>
</html>

--===============0438751486628646837==--

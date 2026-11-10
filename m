Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC33E606A321
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 11:53:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92EB310F4EB;
	Tue, 10 Nov 2026 11:53:46 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0175910E92E;
 Tue, 10 Nov 2026 11:53:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3615011137404862720=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bv4?=
 =?utf-8?q?=2C1/2=5D_drm/i915/fbc=3A_update_the_supported_FP16_formats?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Nov 2026 11:53:45 -0000
Message-ID: <179431162599.2780.2165048659059354911@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261110103513.176529-1-vinod.govindapillai@intel.com>
In-Reply-To: <20261110103513.176529-1-vinod.govindapillai@intel.com>
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

--===============3615011137404862720==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v4,1/2] drm/i915/fbc: update the supported FP16 formats
URL   : https://patchwork.freedesktop.org/series/178186/
State : success

== Summary ==

CI Bug Log - changes from xe-6100-f21553f45db4d2ed16b258ef7907cd5faefb8eb6_BAT -> xe-pw-178186v1_BAT
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

  * Linux: xe-6100-f21553f45db4d2ed16b258ef7907cd5faefb8eb6 -> xe-pw-178186v1

  IGT_9182: 9182
  xe-6100-f21553f45db4d2ed16b258ef7907cd5faefb8eb6: f21553f45db4d2ed16b258ef7907cd5faefb8eb6
  xe-pw-178186v1: 178186v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178186v1/index.html

--===============3615011137404862720==
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
<tr><td><b>Series:</b></td><td>series starting with [v4,1/2] drm/i915/fbc: update the supported FP16 formats</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178186/">https://patchwork.freedesktop.org/series/178186/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178186v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178186v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6100-f21553f45db4d2ed16b258ef7907cd5faefb8eb6_BAT -&gt; xe-pw-178186v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6100-f21553f45db4d2ed16b258ef7907cd5faefb8eb6 -&gt; xe-pw-178186v1</li>
</ul>
<p>IGT_9182: 9182<br />
  xe-6100-f21553f45db4d2ed16b258ef7907cd5faefb8eb6: f21553f45db4d2ed16b258ef7907cd5faefb8eb6<br />
  xe-pw-178186v1: 178186v1</p>

</body>
</html>

--===============3615011137404862720==--

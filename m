Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35910606A324
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 14:09:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E899D10EEA7;
	Mon,  2 Nov 2026 14:09:51 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE6410EEF2;
 Mon,  2 Nov 2026 14:09:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7427258058617999989=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/dp=5Ftunnel=3A_Allow_BW?=
 =?utf-8?q?A_when_the_DP_IN_adapter_does_not_advertise_it?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Diego_Nogu=C3=AAs_via_B4_Relay?=
 <devnull+diego.sure.gmail.com@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Nov 2026 14:09:51 -0000
Message-ID: <179362859119.103180.2163316858382946519@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261031-dp-tunnel-bwa-flag-v1-1-f94ed3179349@gmail.com>
In-Reply-To: <20261031-dp-tunnel-bwa-flag-v1-1-f94ed3179349@gmail.com>
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

--===============7427258058617999989==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/dp_tunnel: Allow BWA when the DP IN adapter does not advertise it
URL   : https://patchwork.freedesktop.org/series/177449/
State : success

== Summary ==

CI Bug Log - changes from xe-6044-2738102dee943bff3e5976aef7fc1937fc650f6e_BAT -> xe-pw-177449v1_BAT
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

  * IGT: IGT_9173 -> IGT_9174
  * Linux: xe-6044-2738102dee943bff3e5976aef7fc1937fc650f6e -> xe-pw-177449v1

  IGT_9173: 9173
  IGT_9174: bb222a83882fe443bd3285f34c475813865b301e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-6044-2738102dee943bff3e5976aef7fc1937fc650f6e: 2738102dee943bff3e5976aef7fc1937fc650f6e
  xe-pw-177449v1: 177449v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177449v1/index.html

--===============7427258058617999989==
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
<tr><td><b>Series:</b></td><td>drm/dp_tunnel: Allow BWA when the DP IN adapter does not advertise it</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177449/">https://patchwork.freedesktop.org/series/177449/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177449v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177449v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6044-2738102dee943bff3e5976aef7fc1937fc650f6e_BAT -&gt; xe-pw-177449v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9173 -&gt; IGT_9174</li>
<li>Linux: xe-6044-2738102dee943bff3e5976aef7fc1937fc650f6e -&gt; xe-pw-177449v1</li>
</ul>
<p>IGT_9173: 9173<br />
  IGT_9174: bb222a83882fe443bd3285f34c475813865b301e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-6044-2738102dee943bff3e5976aef7fc1937fc650f6e: 2738102dee943bff3e5976aef7fc1937fc650f6e<br />
  xe-pw-177449v1: 177449v1</p>

</body>
</html>

--===============7427258058617999989==--

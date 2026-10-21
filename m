Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2D7606A31B
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 08:11:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B331210E03D;
	Wed, 21 Oct 2026 08:11:50 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EB410E03D;
 Wed, 21 Oct 2026 08:11:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0436141422874914169=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Implement_Wa=5F14021768792_?=
 =?utf-8?q?to_bypass_m=5Fn_ratio_limit_=28rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Oct 2026 08:11:49 -0000
Message-ID: <179257030945.50897.4284416156456037649@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261021072438.1164249-1-suraj.kandpal@intel.com>
In-Reply-To: <20261021072438.1164249-1-suraj.kandpal@intel.com>
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

--===============0436141422874914169==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Implement Wa_14021768792 to bypass m_n ratio limit (rev10)
URL   : https://patchwork.freedesktop.org/series/138256/
State : success

== Summary ==

CI Bug Log - changes from xe-5986-f3bbda7128124e54c4881b56958249a18d79a110_BAT -> xe-pw-138256v10_BAT
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

  * Linux: xe-5986-f3bbda7128124e54c4881b56958249a18d79a110 -> xe-pw-138256v10

  IGT_9156: 9156
  xe-5986-f3bbda7128124e54c4881b56958249a18d79a110: f3bbda7128124e54c4881b56958249a18d79a110
  xe-pw-138256v10: 138256v10

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138256v10/index.html

--===============0436141422874914169==
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
<tr><td><b>Series:</b></td><td>Implement Wa_14021768792 to bypass m_n ratio limit (rev10)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138256/">https://patchwork.freedesktop.org/series/138256/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138256v10/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138256v10/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5986-f3bbda7128124e54c4881b56958249a18d79a110_BAT -&gt; xe-pw-138256v10_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5986-f3bbda7128124e54c4881b56958249a18d79a110 -&gt; xe-pw-138256v10</li>
</ul>
<p>IGT_9156: 9156<br />
  xe-5986-f3bbda7128124e54c4881b56958249a18d79a110: f3bbda7128124e54c4881b56958249a18d79a110<br />
  xe-pw-138256v10: 138256v10</p>

</body>
</html>

--===============0436141422874914169==--

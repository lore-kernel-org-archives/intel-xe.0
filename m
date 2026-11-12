Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0E1606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 02:50:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5A010E02B;
	Thu, 12 Nov 2026 02:50:53 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D1910E02B;
 Thu, 12 Nov 2026 02:50:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4279903199795327382=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_platform/x86/intel/pmt=3A_N?=
 =?utf-8?q?otify_userspace_when_crashlogs_complete_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "David E. Box" <david.e.box@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Nov 2026 02:50:52 -0000
Message-ID: <179445185259.12913.1388367999935663428@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <cover.1794444671.git.david.e.box@linux.intel.com>
In-Reply-To: <cover.1794444671.git.david.e.box@linux.intel.com>
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

--===============4279903199795327382==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: platform/x86/intel/pmt: Notify userspace when crashlogs complete (rev2)
URL   : https://patchwork.freedesktop.org/series/176683/
State : success

== Summary ==

CI Bug Log - changes from xe-6118-f40cc5e715fe9e7a5e61f7cd44f63f68c1625f2c_BAT -> xe-pw-176683v2_BAT
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

  * IGT: IGT_9186 -> IGT_9187
  * Linux: xe-6118-f40cc5e715fe9e7a5e61f7cd44f63f68c1625f2c -> xe-pw-176683v2

  IGT_9186: 9186
  IGT_9187: 9187
  xe-6118-f40cc5e715fe9e7a5e61f7cd44f63f68c1625f2c: f40cc5e715fe9e7a5e61f7cd44f63f68c1625f2c
  xe-pw-176683v2: 176683v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176683v2/index.html

--===============4279903199795327382==
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
<tr><td><b>Series:</b></td><td>platform/x86/intel/pmt: Notify userspace when crashlogs complete (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176683/">https://patchwork.freedesktop.org/series/176683/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176683v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176683v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6118-f40cc5e715fe9e7a5e61f7cd44f63f68c1625f2c_BAT -&gt; xe-pw-176683v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9186 -&gt; IGT_9187</li>
<li>Linux: xe-6118-f40cc5e715fe9e7a5e61f7cd44f63f68c1625f2c -&gt; xe-pw-176683v2</li>
</ul>
<p>IGT_9186: 9186<br />
  IGT_9187: 9187<br />
  xe-6118-f40cc5e715fe9e7a5e61f7cd44f63f68c1625f2c: f40cc5e715fe9e7a5e61f7cd44f63f68c1625f2c<br />
  xe-pw-176683v2: 176683v2</p>

</body>
</html>

--===============4279903199795327382==--

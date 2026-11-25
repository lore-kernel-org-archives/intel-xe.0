Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FBE606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 02:29:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0976D10E3E2;
	Wed, 25 Nov 2026 02:29:03 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F251B10E3E2;
 Wed, 25 Nov 2026 02:29:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7722948477576393738=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/vf=3A_New_approach_f?=
 =?utf-8?q?or_post-migration_LRC_fixups_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Nov 2026 02:29:01 -0000
Message-ID: <179557374198.81947.14755707637908046295@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261123141415.2304349-1-tomasz.lis@intel.com>
In-Reply-To: <20261123141415.2304349-1-tomasz.lis@intel.com>
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

--===============7722948477576393738==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vf: New approach for post-migration LRC fixups (rev2)
URL   : https://patchwork.freedesktop.org/series/179378/
State : success

== Summary ==

CI Bug Log - changes from xe-6229-59b46a8902d6416190f72ddc25ba74881639af3a_BAT -> xe-pw-179378v2_BAT
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

  * Linux: xe-6229-59b46a8902d6416190f72ddc25ba74881639af3a -> xe-pw-179378v2

  IGT_9203: 9203
  xe-6229-59b46a8902d6416190f72ddc25ba74881639af3a: 59b46a8902d6416190f72ddc25ba74881639af3a
  xe-pw-179378v2: 179378v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179378v2/index.html

--===============7722948477576393738==
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
<tr><td><b>Series:</b></td><td>drm/xe/vf: New approach for post-migration LRC fixups (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179378/">https://patchwork.freedesktop.org/series/179378/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179378v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179378v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6229-59b46a8902d6416190f72ddc25ba74881639af3a_BAT -&gt; xe-pw-179378v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6229-59b46a8902d6416190f72ddc25ba74881639af3a -&gt; xe-pw-179378v2</li>
</ul>
<p>IGT_9203: 9203<br />
  xe-6229-59b46a8902d6416190f72ddc25ba74881639af3a: 59b46a8902d6416190f72ddc25ba74881639af3a<br />
  xe-pw-179378v2: 179378v2</p>

</body>
</html>

--===============7722948477576393738==--

Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5F9606A332
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 01:36:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463B410E260;
	Wed, 25 Nov 2026 01:36:31 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86FC310E260;
 Wed, 25 Nov 2026 01:36:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9098956361599799107=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tty=3A_vblank_waiting_out_o?=
 =?utf-8?q?n_crtc_0_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Nov 2026 01:36:30 -0000
Message-ID: <179557059054.81598.7681939272922815977@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261115122441.3141883-1-michal.grzelak@linux.intel.com>
In-Reply-To: <20261115122441.3141883-1-michal.grzelak@linux.intel.com>
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

--===============9098956361599799107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tty: vblank waiting out on crtc 0 (rev7)
URL   : https://patchwork.freedesktop.org/series/178607/
State : success

== Summary ==

CI Bug Log - changes from xe-6229-59b46a8902d6416190f72ddc25ba74881639af3a_BAT -> xe-pw-178607v7_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 14)
------------------------------

  Missing    (1): bat-bmg-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-6229-59b46a8902d6416190f72ddc25ba74881639af3a -> xe-pw-178607v7

  IGT_9203: 9203
  xe-6229-59b46a8902d6416190f72ddc25ba74881639af3a: 59b46a8902d6416190f72ddc25ba74881639af3a
  xe-pw-178607v7: 178607v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178607v7/index.html

--===============9098956361599799107==
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
<tr><td><b>Series:</b></td><td>tty: vblank waiting out on crtc 0 (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178607/">https://patchwork.freedesktop.org/series/178607/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178607v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178607v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6229-59b46a8902d6416190f72ddc25ba74881639af3a_BAT -&gt; xe-pw-178607v7_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 14)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6229-59b46a8902d6416190f72ddc25ba74881639af3a -&gt; xe-pw-178607v7</li>
</ul>
<p>IGT_9203: 9203<br />
  xe-6229-59b46a8902d6416190f72ddc25ba74881639af3a: 59b46a8902d6416190f72ddc25ba74881639af3a<br />
  xe-pw-178607v7: 178607v7</p>

</body>
</html>

--===============9098956361599799107==--

Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E496606A321
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 06:59:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B1210E5E1;
	Tue, 10 Nov 2026 06:59:42 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F1C10E5E1;
 Tue, 10 Nov 2026 06:59:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5166446278338278249=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Refactor_drm=5Fwriteback=5F?=
 =?utf-8?q?connector_structure_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Nov 2026 06:59:40 -0000
Message-ID: <179429398047.1607.5817625753298281411@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261110061637.2500929-1-suraj.kandpal@intel.com>
In-Reply-To: <20261110061637.2500929-1-suraj.kandpal@intel.com>
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

--===============5166446278338278249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Refactor drm_writeback_connector structure (rev8)
URL   : https://patchwork.freedesktop.org/series/152758/
State : success

== Summary ==

CI Bug Log - changes from xe-6098-e708f00ac130e65bab7ce0b0265b402d5ff1436d_BAT -> xe-pw-152758v8_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 11)
------------------------------

  Missing    (2): bat-bmg-2 bat-bmg-3 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-6098-e708f00ac130e65bab7ce0b0265b402d5ff1436d -> xe-pw-152758v8

  IGT_9182: 9182
  xe-6098-e708f00ac130e65bab7ce0b0265b402d5ff1436d: e708f00ac130e65bab7ce0b0265b402d5ff1436d
  xe-pw-152758v8: 152758v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152758v8/index.html

--===============5166446278338278249==
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
<tr><td><b>Series:</b></td><td>Refactor drm_writeback_connector structure (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152758/">https://patchwork.freedesktop.org/series/152758/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152758v8/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152758v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6098-e708f00ac130e65bab7ce0b0265b402d5ff1436d_BAT -&gt; xe-pw-152758v8_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 11)</h2>
<p>Missing    (2): bat-bmg-2 bat-bmg-3 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6098-e708f00ac130e65bab7ce0b0265b402d5ff1436d -&gt; xe-pw-152758v8</li>
</ul>
<p>IGT_9182: 9182<br />
  xe-6098-e708f00ac130e65bab7ce0b0265b402d5ff1436d: e708f00ac130e65bab7ce0b0265b402d5ff1436d<br />
  xe-pw-152758v8: 152758v8</p>

</body>
</html>

--===============5166446278338278249==--

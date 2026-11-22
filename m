Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21452606A32A
	for <intel-xe@archiver.kernel.org>; Sun, 22 Nov 2026 15:37:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D646A10E20F;
	Sun, 22 Nov 2026 15:37:21 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D6310E20F;
 Sun, 22 Nov 2026 15:37:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3809908045792138858=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Extend_CPER_records_with_RA?=
 =?utf-8?q?S_info_queue_data_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 22 Nov 2026 15:37:20 -0000
Message-ID: <179536184040.66167.9467057470686574128@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261122144838.214706-5-badal.nilawar@intel.com>
In-Reply-To: <20261122144838.214706-5-badal.nilawar@intel.com>
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

--===============3809908045792138858==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Extend CPER records with RAS info queue data (rev6)
URL   : https://patchwork.freedesktop.org/series/178015/
State : success

== Summary ==

CI Bug Log - changes from xe-6208-579369fbe7227f6b00acc883ac90606a5266932a_BAT -> xe-pw-178015v6_BAT
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

  * Linux: xe-6208-579369fbe7227f6b00acc883ac90606a5266932a -> xe-pw-178015v6

  IGT_9201: 9201
  xe-6208-579369fbe7227f6b00acc883ac90606a5266932a: 579369fbe7227f6b00acc883ac90606a5266932a
  xe-pw-178015v6: 178015v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/index.html

--===============3809908045792138858==
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
<tr><td><b>Series:</b></td><td>Extend CPER records with RAS info queue data (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178015/">https://patchwork.freedesktop.org/series/178015/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6208-579369fbe7227f6b00acc883ac90606a5266932a_BAT -&gt; xe-pw-178015v6_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6208-579369fbe7227f6b00acc883ac90606a5266932a -&gt; xe-pw-178015v6</li>
</ul>
<p>IGT_9201: 9201<br />
  xe-6208-579369fbe7227f6b00acc883ac90606a5266932a: 579369fbe7227f6b00acc883ac90606a5266932a<br />
  xe-pw-178015v6: 178015v6</p>

</body>
</html>

--===============3809908045792138858==--

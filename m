Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9904606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 14:44:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982B710FD56;
	Wed, 18 Nov 2026 14:44:20 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED6C10E766;
 Wed, 18 Nov 2026 14:44:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7799025730926909653=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/gt=3A_Abort_GT_init_?=
 =?utf-8?q?on_LMTT_initialization_failure?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: yaolu@kylinos.cn
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Nov 2026 14:44:19 -0000
Message-ID: <179501305925.43730.14009834376325545781@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261118085453.198348-1-yaolu@kylinos.cn>
In-Reply-To: <20261118085453.198348-1-yaolu@kylinos.cn>
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

--===============7799025730926909653==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/gt: Abort GT init on LMTT initialization failure
URL   : https://patchwork.freedesktop.org/series/178903/
State : success

== Summary ==

CI Bug Log - changes from xe-6172-e97c4df5795036e92099261d470174cf1e600c05_BAT -> xe-pw-178903v1_BAT
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

  * Linux: xe-6172-e97c4df5795036e92099261d470174cf1e600c05 -> xe-pw-178903v1

  IGT_9196: 9196
  xe-6172-e97c4df5795036e92099261d470174cf1e600c05: e97c4df5795036e92099261d470174cf1e600c05
  xe-pw-178903v1: 178903v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178903v1/index.html

--===============7799025730926909653==
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
<tr><td><b>Series:</b></td><td>drm/xe/gt: Abort GT init on LMTT initialization failure</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178903/">https://patchwork.freedesktop.org/series/178903/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178903v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178903v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6172-e97c4df5795036e92099261d470174cf1e600c05_BAT -&gt; xe-pw-178903v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6172-e97c4df5795036e92099261d470174cf1e600c05 -&gt; xe-pw-178903v1</li>
</ul>
<p>IGT_9196: 9196<br />
  xe-6172-e97c4df5795036e92099261d470174cf1e600c05: e97c4df5795036e92099261d470174cf1e600c05<br />
  xe-pw-178903v1: 178903v1</p>

</body>
</html>

--===============7799025730926909653==--

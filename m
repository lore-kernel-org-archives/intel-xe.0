Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83819606A328
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 12:42:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4ED1123DB;
	Thu,  5 Nov 2026 12:42:05 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 654D01123DB;
 Thu,  5 Nov 2026 12:42:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1733851064999800707=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Fix_VF_probe_issue_due_to_m?=
 =?utf-8?q?issing_LMTT_dir_ptr_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Nov 2026 12:42:04 -0000
Message-ID: <179388252440.124775.17645023120349908392@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261105114923.880265-3-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20261105114923.880265-3-satyanarayana.k.v.p@intel.com>
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

--===============1733851064999800707==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix VF probe issue due to missing LMTT dir ptr (rev2)
URL   : https://patchwork.freedesktop.org/series/177598/
State : success

== Summary ==

CI Bug Log - changes from xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55_BAT -> xe-pw-177598v2_BAT
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

  * Linux: xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55 -> xe-pw-177598v2

  IGT_9177: 9177
  xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55: d076071d544fe6745f6fd7553e532c8a13a0cb55
  xe-pw-177598v2: 177598v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/index.html

--===============1733851064999800707==
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
<tr><td><b>Series:</b></td><td>Fix VF probe issue due to missing LMTT dir ptr (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177598/">https://patchwork.freedesktop.org/series/177598/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55_BAT -&gt; xe-pw-177598v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 14)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55 -&gt; xe-pw-177598v2</li>
</ul>
<p>IGT_9177: 9177<br />
  xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55: d076071d544fe6745f6fd7553e532c8a13a0cb55<br />
  xe-pw-177598v2: 177598v2</p>

</body>
</html>

--===============1733851064999800707==--

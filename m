Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2B3606A319
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 01:07:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08CF010F123;
	Tue, 20 Oct 2026 01:07:54 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09E110F123;
 Tue, 20 Oct 2026 01:07:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0540524422862888346=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/cri=3A_Set_downstrea?=
 =?utf-8?q?m_access_to_L3_class_3_and_write-back_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniel Charles" <daniel.charles@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Oct 2026 01:07:52 -0000
Message-ID: <179245847291.43614.9555580891142312626@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261020001513.1528267-1-daniel.charles@intel.com>
In-Reply-To: <20261020001513.1528267-1-daniel.charles@intel.com>
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

--===============0540524422862888346==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/cri: Set downstream access to L3 class 3 and write-back (rev2)
URL   : https://patchwork.freedesktop.org/series/175785/
State : success

== Summary ==

CI Bug Log - changes from xe-5978-5e3ce4f15807bf6c8a5bc43da6f0978634b2bbb3_BAT -> xe-pw-175785v2_BAT
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

  * Linux: xe-5978-5e3ce4f15807bf6c8a5bc43da6f0978634b2bbb3 -> xe-pw-175785v2

  IGT_9153: 9153
  xe-5978-5e3ce4f15807bf6c8a5bc43da6f0978634b2bbb3: 5e3ce4f15807bf6c8a5bc43da6f0978634b2bbb3
  xe-pw-175785v2: 175785v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175785v2/index.html

--===============0540524422862888346==
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
<tr><td><b>Series:</b></td><td>drm/xe/cri: Set downstream access to L3 class 3 and write-back (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175785/">https://patchwork.freedesktop.org/series/175785/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175785v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175785v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5978-5e3ce4f15807bf6c8a5bc43da6f0978634b2bbb3_BAT -&gt; xe-pw-175785v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5978-5e3ce4f15807bf6c8a5bc43da6f0978634b2bbb3 -&gt; xe-pw-175785v2</li>
</ul>
<p>IGT_9153: 9153<br />
  xe-5978-5e3ce4f15807bf6c8a5bc43da6f0978634b2bbb3: 5e3ce4f15807bf6c8a5bc43da6f0978634b2bbb3<br />
  xe-pw-175785v2: 175785v2</p>

</body>
</html>

--===============0540524422862888346==--

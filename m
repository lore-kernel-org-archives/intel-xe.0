Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46412C5DF9C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 23:16:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5A110E59D;
	Mon, 24 Aug 2026 23:16:57 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F5E910E034;
 Mon, 24 Aug 2026 23:16:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8802461358009255856=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/migrate=3A_Bound_pgt?=
 =?utf-8?q?able_update_loops_by_current=5Fop?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jagmeet Randhawa" <jagmeet.randhawa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Aug 2026 23:16:57 -0000
Message-ID: <178761341751.80933.2215627383301378495@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260824183816.299110-2-jagmeet.randhawa@intel.com>
In-Reply-To: <20260824183816.299110-2-jagmeet.randhawa@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============8802461358009255856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/migrate: Bound pgtable update loops by current_op
URL   : https://patchwork.freedesktop.org/series/172688/
State : success

== Summary ==

CI Bug Log - changes from xe-5641-7b7f3626ff417d591718d5ff7a22646025e0b260_BAT -> xe-pw-172688v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5641-7b7f3626ff417d591718d5ff7a22646025e0b260 -> xe-pw-172688v1

  IGT_9071: 9071
  xe-5641-7b7f3626ff417d591718d5ff7a22646025e0b260: 7b7f3626ff417d591718d5ff7a22646025e0b260
  xe-pw-172688v1: 172688v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172688v1/index.html

--===============8802461358009255856==
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
<tr><td><b>Series:</b></td><td>drm/xe/migrate: Bound pgtable update loops by current_op</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172688/">https://patchwork.freedesktop.org/series/172688/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172688v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172688v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5641-7b7f3626ff417d591718d5ff7a22646025e0b260_BAT -&gt; xe-pw-172688v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5641-7b7f3626ff417d591718d5ff7a22646025e0b260 -&gt; xe-pw-172688v1</li>
</ul>
<p>IGT_9071: 9071<br />
  xe-5641-7b7f3626ff417d591718d5ff7a22646025e0b260: 7b7f3626ff417d591718d5ff7a22646025e0b260<br />
  xe-pw-172688v1: 172688v1</p>

</body>
</html>

--===============8802461358009255856==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736C8C369C2
	for <intel-xe@archiver.kernel.org>; Thu, 24 Apr 2025 16:36:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E7B10E464;
	Thu, 24 Apr 2025 16:36:32 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9ED410E158;
 Thu, 24 Apr 2025 16:36:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7455297815913829359=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Add_POST=5FSYNC_p?=
 =?utf-8?q?refix_to_post_sync_instructions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ravi Kumar Vodapalli" <ravi.kumar.vodapalli@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Apr 2025 16:36:31 -0000
Message-ID: <174551259196.7481.3084875911065994042@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250424092941.2819640-1-ravi.kumar.vodapalli@intel.com>
In-Reply-To: <20250424092941.2819640-1-ravi.kumar.vodapalli@intel.com>
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

--===============7455297815913829359==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add POST_SYNC prefix to post sync instructions
URL   : https://patchwork.freedesktop.org/series/148194/
State : success

== Summary ==

CI Bug Log - changes from xe-2994-6176f71822602f52bc4327965090275c5570ed0d_BAT -> xe-pw-148194v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8335 -> IGT_8336
  * Linux: xe-2994-6176f71822602f52bc4327965090275c5570ed0d -> xe-pw-148194v1

  IGT_8335: 8335
  IGT_8336: 8336
  xe-2994-6176f71822602f52bc4327965090275c5570ed0d: 6176f71822602f52bc4327965090275c5570ed0d
  xe-pw-148194v1: 148194v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148194v1/index.html

--===============7455297815913829359==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add POST_SYNC prefix to post sync instructions</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148194/">https://patchwork.freedesktop.org/series/148194/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148194v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148194v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2994-6176f71822602f52bc4327965090275c5570ed0d_BAT -&gt; xe-pw-148194v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8335 -&gt; IGT_8336</li>
<li>Linux: xe-2994-6176f71822602f52bc4327965090275c5570ed0d -&gt; xe-pw-148194v1</li>
</ul>
<p>IGT_8335: 8335<br />
  IGT_8336: 8336<br />
  xe-2994-6176f71822602f52bc4327965090275c5570ed0d: 6176f71822602f52bc4327965090275c5570ed0d<br />
  xe-pw-148194v1: 148194v1</p>

</body>
</html>

--===============7455297815913829359==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07736C10F1A
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 21:02:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A168010F7B6;
	Tue,  7 May 2024 21:02:52 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A027810F7B6;
 Tue,  7 May 2024 21:02:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7953304406471127842=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/pf=3A_Don=27t_advertise_s?=
 =?utf-8?q?upport_to_enable_VFs_if_not_ready?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 07 May 2024 21:02:51 -0000
Message-ID: <171511577165.2015199.7029820147488223004@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240507165757.2835-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240507165757.2835-1-michal.wajdeczko@intel.com>
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

--===============7953304406471127842==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pf: Don't advertise support to enable VFs if not ready
URL   : https://patchwork.freedesktop.org/series/133289/
State : success

== Summary ==

CI Bug Log - changes from xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820_BAT -> xe-pw-133289v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 4)
------------------------------

  Missing    (1): bat-lnl-1 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820 -> xe-pw-133289v1

  IGT_7838: 155628bc9d0ee70c67c3612462a62f095609f152 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820: 9ba3c5b827bb4ad0418a182a5e0064edb6196820
  xe-pw-133289v1: 133289v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/index.html

--===============7953304406471127842==
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
<tr><td><b>Series:</b></td><td>drm/xe/pf: Don&#x27;t advertise support to enable VFs if not ready</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133289/">https://patchwork.freedesktop.org/series/133289/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820_BAT -&gt; xe-pw-133289v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 4)</h2>
<p>Missing    (1): bat-lnl-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820 -&gt; xe-pw-133289v1</li>
</ul>
<p>IGT_7838: 155628bc9d0ee70c67c3612462a62f095609f152 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820: 9ba3c5b827bb4ad0418a182a5e0064edb6196820<br />
  xe-pw-133289v1: 133289v1</p>

</body>
</html>

--===============7953304406471127842==--

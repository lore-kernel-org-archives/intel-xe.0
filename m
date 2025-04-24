Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330D8C369AB
	for <intel-xe@archiver.kernel.org>; Thu, 24 Apr 2025 21:34:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7AF210E872;
	Thu, 24 Apr 2025 21:34:10 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0FE510E86E;
 Thu, 24 Apr 2025 21:34:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5866188536563697881=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Rework/Correction_on_minimu?=
 =?utf-8?q?m_hblank_calculation_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Apr 2025 21:34:09 -0000
Message-ID: <174553044992.8666.4554409321569228413@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250424-hblank-v7-0-8b002f1506cc@intel.com>
In-Reply-To: <20250424-hblank-v7-0-8b002f1506cc@intel.com>
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

--===============5866188536563697881==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Rework/Correction on minimum hblank calculation (rev7)
URL   : https://patchwork.freedesktop.org/series/147360/
State : success

== Summary ==

CI Bug Log - changes from xe-2995-6f55ae2f38d94749192304df6ac565c1fd5b584b_BAT -> xe-pw-147360v7_BAT
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

  * Linux: xe-2995-6f55ae2f38d94749192304df6ac565c1fd5b584b -> xe-pw-147360v7

  IGT_8336: 8336
  xe-2995-6f55ae2f38d94749192304df6ac565c1fd5b584b: 6f55ae2f38d94749192304df6ac565c1fd5b584b
  xe-pw-147360v7: 147360v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v7/index.html

--===============5866188536563697881==
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
<tr><td><b>Series:</b></td><td>Rework/Correction on minimum hblank calculation (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147360/">https://patchwork.freedesktop.org/series/147360/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147360v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2995-6f55ae2f38d94749192304df6ac565c1fd5b584b_BAT -&gt; xe-pw-147360v7_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2995-6f55ae2f38d94749192304df6ac565c1fd5b584b -&gt; xe-pw-147360v7</li>
</ul>
<p>IGT_8336: 8336<br />
  xe-2995-6f55ae2f38d94749192304df6ac565c1fd5b584b: 6f55ae2f38d94749192304df6ac565c1fd5b584b<br />
  xe-pw-147360v7: 147360v7</p>

</body>
</html>

--===============5866188536563697881==--

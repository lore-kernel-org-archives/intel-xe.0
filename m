Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8894DC021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 21:02:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D21D10E096;
	Fri, 21 Feb 2025 21:02:33 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BB210E096;
 Fri, 21 Feb 2025 21:02:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6078684205211792967=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Prepare_RTP_to_define_SR-IO?=
 =?utf-8?q?V_specific_rules?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Feb 2025 21:02:31 -0000
Message-ID: <174017175153.572209.5595052220708207799@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250221190038.1734-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250221190038.1734-1-michal.wajdeczko@intel.com>
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

--===============6078684205211792967==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Prepare RTP to define SR-IOV specific rules
URL   : https://patchwork.freedesktop.org/series/145269/
State : success

== Summary ==

CI Bug Log - changes from xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706_BAT -> xe-pw-145269v1_BAT
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

  * IGT: IGT_8245 -> IGT_8246
  * Linux: xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706 -> xe-pw-145269v1

  IGT_8245: 822e95b2560133bc21aa3065f70d7148f23f87cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8246: 2670886863d5821273146d7f94cdd3c8e3a4fe0b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706: 3ef8736446933ce5e8ccbec2f85922ca1ed3b706
  xe-pw-145269v1: 145269v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145269v1/index.html

--===============6078684205211792967==
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
<tr><td><b>Series:</b></td><td>Prepare RTP to define SR-IOV specific rules</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145269/">https://patchwork.freedesktop.org/series/145269/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145269v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145269v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706_BAT -&gt; xe-pw-145269v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8245 -&gt; IGT_8246</li>
<li>Linux: xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706 -&gt; xe-pw-145269v1</li>
</ul>
<p>IGT_8245: 822e95b2560133bc21aa3065f70d7148f23f87cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8246: 2670886863d5821273146d7f94cdd3c8e3a4fe0b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2699-3ef8736446933ce5e8ccbec2f85922ca1ed3b706: 3ef8736446933ce5e8ccbec2f85922ca1ed3b706<br />
  xe-pw-145269v1: 145269v1</p>

</body>
</html>

--===============6078684205211792967==--

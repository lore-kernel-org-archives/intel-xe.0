Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963A0C3DA7F
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 00:16:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E80210E748;
	Thu,  1 Aug 2024 00:16:04 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A25110E749;
 Thu,  1 Aug 2024 00:16:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3174633176392181473=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/guc=3A_Pick_GuC_from_CI_f?=
 =?utf-8?q?older_for_LNL=2C_BMG=2C_PVC_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 01 Aug 2024 00:16:03 -0000
Message-ID: <172247136360.470473.1155258748667122072@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240730184309.2939144-1-julia.filipchuk@intel.com>
In-Reply-To: <20240730184309.2939144-1-julia.filipchuk@intel.com>
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

--===============3174633176392181473==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Pick GuC from CI folder for LNL, BMG, PVC (rev3)
URL   : https://patchwork.freedesktop.org/series/136692/
State : success

== Summary ==

CI Bug Log - changes from xe-1698-caaefe49619299337b0fdc73a2379043d8684825_BAT -> xe-pw-136692v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7948 -> IGT_7949
  * Linux: xe-1698-caaefe49619299337b0fdc73a2379043d8684825 -> xe-pw-136692v3

  IGT_7948: 7948
  IGT_7949: 7949
  xe-1698-caaefe49619299337b0fdc73a2379043d8684825: caaefe49619299337b0fdc73a2379043d8684825
  xe-pw-136692v3: 136692v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v3/index.html

--===============3174633176392181473==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Pick GuC from CI folder for LNL, BMG, PVC (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136692/">https://patchwork.freedesktop.org/series/136692/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1698-caaefe49619299337b0fdc73a2379043d8684825_BAT -&gt; xe-pw-136692v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7948 -&gt; IGT_7949</li>
<li>Linux: xe-1698-caaefe49619299337b0fdc73a2379043d8684825 -&gt; xe-pw-136692v3</li>
</ul>
<p>IGT_7948: 7948<br />
  IGT_7949: 7949<br />
  xe-1698-caaefe49619299337b0fdc73a2379043d8684825: caaefe49619299337b0fdc73a2379043d8684825<br />
  xe-pw-136692v3: 136692v3</p>

</body>
</html>

--===============3174633176392181473==--

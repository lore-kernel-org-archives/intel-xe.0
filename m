Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693C0C71153
	for <intel-xe@archiver.kernel.org>; Mon,  4 Sep 2023 12:48:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DE010E1D3;
	Mon,  4 Sep 2023 12:48:25 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 035B410E1D3;
 Mon,  4 Sep 2023 12:48:24 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 00092AADE4;
 Mon,  4 Sep 2023 12:48:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8807342973867300635=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Date: Mon, 04 Sep 2023 12:48:23 -0000
Message-ID: <169383170399.21387.2595303105343779570@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230904115517.458662-1-vinod.govindapillai@intel.com>
In-Reply-To: <20230904115517.458662-1-vinod.govindapillai@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_fbc_on_an?=
 =?utf-8?q?y_planes_=28rev2=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============8807342973867300635==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: fbc on any planes (rev2)
URL   : https://patchwork.freedesktop.org/series/123179/
State : success

== Summary ==

CI Bug Log - changes from xe-354-7ec520d3a63b6e95174329108cd44359a70907ba_BAT -> xe-pw-123179v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-123179v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_hdmi_inject@inject-audio:
    - bat-atsm-2:         NOTRUN -> [SKIP][1] ([Intel XE#540])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123179v2/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html

  
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540


Build changes
-------------

  * IGT: IGT_7465 -> IGT_7467
  * Linux: xe-354-7ec520d3a63b6e95174329108cd44359a70907ba -> xe-pw-123179v2

  IGT_7465: 7465
  IGT_7467: 7467
  xe-354-7ec520d3a63b6e95174329108cd44359a70907ba: 7ec520d3a63b6e95174329108cd44359a70907ba
  xe-pw-123179v2: 123179v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123179v2/index.html

--===============8807342973867300635==
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
<tr><td><b>Series:</b></td><td>fbc on any planes (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123179/">https://patchwork.freedesktop.org/series/123179/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123179v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123179v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-354-7ec520d3a63b6e95174329108cd44359a70907ba_BAT -&gt; xe-pw-123179v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-123179v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_hdmi_inject@inject-audio:<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123179v2/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7465 -&gt; IGT_7467</li>
<li>Linux: xe-354-7ec520d3a63b6e95174329108cd44359a70907ba -&gt; xe-pw-123179v2</li>
</ul>
<p>IGT_7465: 7465<br />
  IGT_7467: 7467<br />
  xe-354-7ec520d3a63b6e95174329108cd44359a70907ba: 7ec520d3a63b6e95174329108cd44359a70907ba<br />
  xe-pw-123179v2: 123179v2</p>

</body>
</html>

--===============8807342973867300635==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93ED5C02181
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 09:58:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF5610E3A6;
	Wed, 22 Jan 2025 09:58:39 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C5B10E3A6;
 Wed, 22 Jan 2025 09:58:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3259584381735322509=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/dp=3A_Guarantee_a_?=
 =?utf-8?q?minimum_HBlank_time_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Jan 2025 09:58:38 -0000
Message-ID: <173753991847.3008751.18188009488110688267@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250122-hblank-v9-1-90afda006685@intel.com>
In-Reply-To: <20250122-hblank-v9-1-90afda006685@intel.com>
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

--===============3259584381735322509==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: Guarantee a minimum HBlank time (rev9)
URL   : https://patchwork.freedesktop.org/series/139268/
State : success

== Summary ==

CI Bug Log - changes from xe-2529-a5efe95724accce6ccd3e0c840fdd3bf5d6f369b_BAT -> xe-pw-139268v9_BAT
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

  * Linux: xe-2529-a5efe95724accce6ccd3e0c840fdd3bf5d6f369b -> xe-pw-139268v9

  IGT_8205: f3225e64a7c52e515ab7ec14e6e3f63679718928 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2529-a5efe95724accce6ccd3e0c840fdd3bf5d6f369b: a5efe95724accce6ccd3e0c840fdd3bf5d6f369b
  xe-pw-139268v9: 139268v9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139268v9/index.html

--===============3259584381735322509==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: Guarantee a minimum HBlank time (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139268/">https://patchwork.freedesktop.org/series/139268/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139268v9/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139268v9/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2529-a5efe95724accce6ccd3e0c840fdd3bf5d6f369b_BAT -&gt; xe-pw-139268v9_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2529-a5efe95724accce6ccd3e0c840fdd3bf5d6f369b -&gt; xe-pw-139268v9</li>
</ul>
<p>IGT_8205: f3225e64a7c52e515ab7ec14e6e3f63679718928 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2529-a5efe95724accce6ccd3e0c840fdd3bf5d6f369b: a5efe95724accce6ccd3e0c840fdd3bf5d6f369b<br />
  xe-pw-139268v9: 139268v9</p>

</body>
</html>

--===============3259584381735322509==--

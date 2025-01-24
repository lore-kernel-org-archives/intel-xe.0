Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DEFC02181
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jan 2025 09:01:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD8910E923;
	Fri, 24 Jan 2025 09:01:40 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D3B10E920;
 Fri, 24 Jan 2025 09:01:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8974868341970832186=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Introduce_DRM_device_wedged?=
 =?utf-8?q?_event_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Jan 2025 09:01:39 -0000
Message-ID: <173770929929.3924039.11519496698043247734@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250124055300.1111274-1-raag.jadav@intel.com>
In-Reply-To: <20250124055300.1111274-1-raag.jadav@intel.com>
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

--===============8974868341970832186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce DRM device wedged event (rev9)
URL   : https://patchwork.freedesktop.org/series/138070/
State : success

== Summary ==

CI Bug Log - changes from xe-2545-c35325ae97e22ecd5a13cd04f71217e9676a4847_BAT -> xe-pw-138070v9_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 4)
------------------------------

  Missing    (4): bat-bmg-1 bat-adlp-vf bat-bmg-2 bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-2545-c35325ae97e22ecd5a13cd04f71217e9676a4847 -> xe-pw-138070v9

  IGT_8207: 9f36f9f9e8825a67b762630c2b31628ddcda5c10 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2545-c35325ae97e22ecd5a13cd04f71217e9676a4847: c35325ae97e22ecd5a13cd04f71217e9676a4847
  xe-pw-138070v9: 138070v9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v9/index.html

--===============8974868341970832186==
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
<tr><td><b>Series:</b></td><td>Introduce DRM device wedged event (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138070/">https://patchwork.freedesktop.org/series/138070/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v9/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v9/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2545-c35325ae97e22ecd5a13cd04f71217e9676a4847_BAT -&gt; xe-pw-138070v9_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 4)</h2>
<p>Missing    (4): bat-bmg-1 bat-adlp-vf bat-bmg-2 bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2545-c35325ae97e22ecd5a13cd04f71217e9676a4847 -&gt; xe-pw-138070v9</li>
</ul>
<p>IGT_8207: 9f36f9f9e8825a67b762630c2b31628ddcda5c10 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2545-c35325ae97e22ecd5a13cd04f71217e9676a4847: c35325ae97e22ecd5a13cd04f71217e9676a4847<br />
  xe-pw-138070v9: 138070v9</p>

</body>
</html>

--===============8974868341970832186==--

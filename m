Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1D9CCF9E5
	for <intel-xe@archiver.kernel.org>; Sun, 26 Oct 2025 12:01:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92CFF10E2C5;
	Sun, 26 Oct 2025 12:01:16 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0490010E2C5;
 Sun, 26 Oct 2025 12:01:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5723639388374319133=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/xe3=3A_Apply_wa=5F14?=
 =?utf-8?q?024997852_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Tapani_P=C3=A4lli?= <tapani.palli@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 26 Oct 2025 12:01:15 -0000
Message-ID: <176148007501.55541.13908806922986966801@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251023044041.13731-1-tapani.palli@intel.com>
In-Reply-To: <20251023044041.13731-1-tapani.palli@intel.com>
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

--===============5723639388374319133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe3: Apply wa_14024997852 (rev2)
URL   : https://patchwork.freedesktop.org/series/156392/
State : success

== Summary ==

CI Bug Log - changes from xe-3986-d827507f9c3c65785556819d50eb5131b2bf6a3a_BAT -> xe-pw-156392v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-156392v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@a-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4543]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3986-d827507f9c3c65785556819d50eb5131b2bf6a3a/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156392v2/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * Linux: xe-3986-d827507f9c3c65785556819d50eb5131b2bf6a3a -> xe-pw-156392v2

  IGT_8596: 8596
  xe-3986-d827507f9c3c65785556819d50eb5131b2bf6a3a: d827507f9c3c65785556819d50eb5131b2bf6a3a
  xe-pw-156392v2: 156392v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156392v2/index.html

--===============5723639388374319133==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe3: Apply wa_14024997852 (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156392/">https://patchwork.freedesktop.org/series/156392/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156392v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156392v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3986-d827507f9c3c65785556819d50eb5131b2bf6a3a_BAT -&gt; xe-pw-156392v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156392v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@a-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3986-d827507f9c3c65785556819d50eb5131b2bf6a3a/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156392v2/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3986-d827507f9c3c65785556819d50eb5131b2bf6a3a -&gt; xe-pw-156392v2</li>
</ul>
<p>IGT_8596: 8596<br />
  xe-3986-d827507f9c3c65785556819d50eb5131b2bf6a3a: d827507f9c3c65785556819d50eb5131b2bf6a3a<br />
  xe-pw-156392v2: 156392v2</p>

</body>
</html>

--===============5723639388374319133==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB2BD10F34
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 12:43:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5AA10E5BE;
	Wed, 26 Nov 2025 12:43:03 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFDB10E5BE;
 Wed, 26 Nov 2025 12:43:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9030872530539699167=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/=7Bi915=2Cxe=7D/dsb=3A_?=
 =?utf-8?q?refactor_DSB_buffer_allocation_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Nov 2025 12:43:01 -0000
Message-ID: <176416098112.30121.6373652486370990646@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1764155417.git.jani.nikula@intel.com>
In-Reply-To: <cover.1764155417.git.jani.nikula@intel.com>
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

--===============9030872530539699167==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/{i915,xe}/dsb: refactor DSB buffer allocation (rev3)
URL   : https://patchwork.freedesktop.org/series/154592/
State : success

== Summary ==

CI Bug Log - changes from xe-4150-a945aa869cd59483dfe3c15587758c9bc1e72b0d_BAT -> xe-pw-154592v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4150-a945aa869cd59483dfe3c15587758c9bc1e72b0d -> xe-pw-154592v3

  IGT_8638: 72d5c74eb3cf46af2f46daba8109d84c3dd19363 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4150-a945aa869cd59483dfe3c15587758c9bc1e72b0d: a945aa869cd59483dfe3c15587758c9bc1e72b0d
  xe-pw-154592v3: 154592v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154592v3/index.html

--===============9030872530539699167==
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
<tr><td><b>Series:</b></td><td>drm/{i915,xe}/dsb: refactor DSB buffer allocation (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154592/">https://patchwork.freedesktop.org/series/154592/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154592v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154592v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4150-a945aa869cd59483dfe3c15587758c9bc1e72b0d_BAT -&gt; xe-pw-154592v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4150-a945aa869cd59483dfe3c15587758c9bc1e72b0d -&gt; xe-pw-154592v3</li>
</ul>
<p>IGT_8638: 72d5c74eb3cf46af2f46daba8109d84c3dd19363 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4150-a945aa869cd59483dfe3c15587758c9bc1e72b0d: a945aa869cd59483dfe3c15587758c9bc1e72b0d<br />
  xe-pw-154592v3: 154592v3</p>

</body>
</html>

--===============9030872530539699167==--

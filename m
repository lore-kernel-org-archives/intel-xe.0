Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C892D6ACD9
	for <intel-xe@archiver.kernel.org>; Wed, 27 Nov 2024 14:07:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F5810EAE7;
	Wed, 27 Nov 2024 14:07:49 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA4E10EAE6;
 Wed, 27 Nov 2024 14:07:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5468927243453486950=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/dp=3A_use_seq_buf_?=
 =?utf-8?q?for_printing_rates?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 27 Nov 2024 14:07:49 -0000
Message-ID: <173271646925.3737589.7816498493062375818@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241127131838.3268735-1-jani.nikula@intel.com>
In-Reply-To: <20241127131838.3268735-1-jani.nikula@intel.com>
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

--===============5468927243453486950==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: use seq buf for printing rates
URL   : https://patchwork.freedesktop.org/series/141842/
State : success

== Summary ==

CI Bug Log - changes from xe-2285-4e5e3c93cf642f47374ed6e003f0a55b8af0f25b_BAT -> xe-pw-141842v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-2285-4e5e3c93cf642f47374ed6e003f0a55b8af0f25b -> xe-pw-141842v1

  IGT_8127: 433ecaf95ccaed2b5adcb40d27fa5b7a08a2e03d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2285-4e5e3c93cf642f47374ed6e003f0a55b8af0f25b: 4e5e3c93cf642f47374ed6e003f0a55b8af0f25b
  xe-pw-141842v1: 141842v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141842v1/index.html

--===============5468927243453486950==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: use seq buf for printing rates</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141842/">https://patchwork.freedesktop.org/series/141842/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141842v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141842v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2285-4e5e3c93cf642f47374ed6e003f0a55b8af0f25b_BAT -&gt; xe-pw-141842v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2285-4e5e3c93cf642f47374ed6e003f0a55b8af0f25b -&gt; xe-pw-141842v1</li>
</ul>
<p>IGT_8127: 433ecaf95ccaed2b5adcb40d27fa5b7a08a2e03d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2285-4e5e3c93cf642f47374ed6e003f0a55b8af0f25b: 4e5e3c93cf642f47374ed6e003f0a55b8af0f25b<br />
  xe-pw-141842v1: 141842v1</p>

</body>
</html>

--===============5468927243453486950==--

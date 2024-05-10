Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79F5C25B10
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 10:46:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992DF10E2AE;
	Fri, 10 May 2024 10:46:38 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D89E10E2AE;
 Fri, 10 May 2024 10:46:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4216343443560086492=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5B1/2=5D_d?=
 =?utf-8?q?rm/xe/display=3A_remove_unused_xe-=3Eenabled=5Firq=5Fmask?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 10 May 2024 10:46:38 -0000
Message-ID: <171533799818.2056296.9104373152377646600@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240510094313.3422982-1-jani.nikula@intel.com>
In-Reply-To: <20240510094313.3422982-1-jani.nikula@intel.com>
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

--===============4216343443560086492==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe/display: remove unused xe->enabled_irq_mask
URL   : https://patchwork.freedesktop.org/series/133440/
State : success

== Summary ==

CI Bug Log - changes from xe-1271-84511d5953a5702158f0e84b78313d32c557fe5c_BAT -> xe-pw-133440v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1271-84511d5953a5702158f0e84b78313d32c557fe5c -> xe-pw-133440v1

  IGT_7846: 4a5fd4e7cb2798636f6464e2bd61399f3242b322 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1271-84511d5953a5702158f0e84b78313d32c557fe5c: 84511d5953a5702158f0e84b78313d32c557fe5c
  xe-pw-133440v1: 133440v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133440v1/index.html

--===============4216343443560086492==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe/display: remove unused xe-&gt;enabled_irq_mask</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133440/">https://patchwork.freedesktop.org/series/133440/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133440v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133440v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1271-84511d5953a5702158f0e84b78313d32c557fe5c_BAT -&gt; xe-pw-133440v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1271-84511d5953a5702158f0e84b78313d32c557fe5c -&gt; xe-pw-133440v1</li>
</ul>
<p>IGT_7846: 4a5fd4e7cb2798636f6464e2bd61399f3242b322 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1271-84511d5953a5702158f0e84b78313d32c557fe5c: 84511d5953a5702158f0e84b78313d32c557fe5c<br />
  xe-pw-133440v1: 133440v1</p>

</body>
</html>

--===============4216343443560086492==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5718CCD184
	for <intel-xe@archiver.kernel.org>; Sat, 11 Oct 2025 13:53:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D72210E2ED;
	Sat, 11 Oct 2025 13:53:17 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A878B10E2ED;
 Sat, 11 Oct 2025 13:53:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5307947404506431149=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Wire_up_reset/postinstall_f?=
 =?utf-8?q?or_I2C_IRQ_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 11 Oct 2025 13:53:15 -0000
Message-ID: <176019079566.2067.38677834647421624@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251011123509.3233213-1-raag.jadav@intel.com>
In-Reply-To: <20251011123509.3233213-1-raag.jadav@intel.com>
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

--===============5307947404506431149==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Wire up reset/postinstall for I2C IRQ (rev3)
URL   : https://patchwork.freedesktop.org/series/154993/
State : success

== Summary ==

CI Bug Log - changes from xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c_BAT -> xe-pw-154993v3_BAT
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

  * Linux: xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c -> xe-pw-154993v3

  IGT_8582: 8582
  xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c: 06e3b25f52e5d52c975ad9a04f63ddc0be033e1c
  xe-pw-154993v3: 154993v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/index.html

--===============5307947404506431149==
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
<tr><td><b>Series:</b></td><td>Wire up reset/postinstall for I2C IRQ (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154993/">https://patchwork.freedesktop.org/series/154993/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c_BAT -&gt; xe-pw-154993v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c -&gt; xe-pw-154993v3</li>
</ul>
<p>IGT_8582: 8582<br />
  xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c: 06e3b25f52e5d52c975ad9a04f63ddc0be033e1c<br />
  xe-pw-154993v3: 154993v3</p>

</body>
</html>

--===============5307947404506431149==--

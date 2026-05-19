Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE91CD5BA4
	for <intel-xe@archiver.kernel.org>; Tue, 19 May 2026 12:48:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D3F10ECA5;
	Tue, 19 May 2026 12:48:34 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97CBF10ECA5;
 Tue, 19 May 2026 12:48:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3399128131555172907=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_harden_?=
 =?utf-8?q?some_bit-shifting_operations?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 May 2026 12:48:33 -0000
Message-ID: <177919491361.86973.14083674312124716709@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260519112243.1454375-1-luciano.coelho@intel.com>
In-Reply-To: <20260519112243.1454375-1-luciano.coelho@intel.com>
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

--===============3399128131555172907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: harden some bit-shifting operations
URL   : https://patchwork.freedesktop.org/series/166864/
State : success

== Summary ==

CI Bug Log - changes from xe-5093-2844416c4b83e0fbbc72a2687231178f8984b868_BAT -> xe-pw-166864v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5093-2844416c4b83e0fbbc72a2687231178f8984b868 -> xe-pw-166864v1

  IGT_8920: f850fd46bb65d821ca7e3a8895e685eff2128ef5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5093-2844416c4b83e0fbbc72a2687231178f8984b868: 2844416c4b83e0fbbc72a2687231178f8984b868
  xe-pw-166864v1: 166864v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v1/index.html

--===============3399128131555172907==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: harden some bit-shifting operations</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166864/">https://patchwork.freedesktop.org/series/166864/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5093-2844416c4b83e0fbbc72a2687231178f8984b868_BAT -&gt; xe-pw-166864v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5093-2844416c4b83e0fbbc72a2687231178f8984b868 -&gt; xe-pw-166864v1</li>
</ul>
<p>IGT_8920: f850fd46bb65d821ca7e3a8895e685eff2128ef5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5093-2844416c4b83e0fbbc72a2687231178f8984b868: 2844416c4b83e0fbbc72a2687231178f8984b868<br />
  xe-pw-166864v1: 166864v1</p>

</body>
</html>

--===============3399128131555172907==--

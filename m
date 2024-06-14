Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDBDC27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 15:11:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C9F10E0D4;
	Fri, 14 Jun 2024 15:11:36 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF6C10E0D4;
 Fri, 14 Jun 2024 15:11:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0454459002130724397=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/i915/mso=3A_using_joiner_is_?=
 =?utf-8?q?not_possible_with_eDP_MSO?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Jun 2024 15:11:34 -0000
Message-ID: <171837789497.77190.7957403304373423688@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240614142311.589089-1-jani.nikula@intel.com>
In-Reply-To: <20240614142311.589089-1-jani.nikula@intel.com>
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

--===============0454459002130724397==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/mso: using joiner is not possible with eDP MSO
URL   : https://patchwork.freedesktop.org/series/134894/
State : success

== Summary ==

CI Bug Log - changes from xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2_BAT -> xe-pw-134894v1_BAT
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

  * IGT: IGT_7888 -> IGT_7889
  * Linux: xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2 -> xe-pw-134894v1

  IGT_7888: 021538d059575eb9f93d36fea36015cd3f9fca7d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7889: 9dca15da37f2a385b04427eb39cd460224d09c25 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2: 00e9498b453447a5afe527bd0e174587b12f66d2
  xe-pw-134894v1: 134894v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134894v1/index.html

--===============0454459002130724397==
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
<tr><td><b>Series:</b></td><td>drm/i915/mso: using joiner is not possible with eDP MSO</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134894/">https://patchwork.freedesktop.org/series/134894/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134894v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134894v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2_BAT -&gt; xe-pw-134894v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7888 -&gt; IGT_7889</li>
<li>Linux: xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2 -&gt; xe-pw-134894v1</li>
</ul>
<p>IGT_7888: 021538d059575eb9f93d36fea36015cd3f9fca7d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7889: 9dca15da37f2a385b04427eb39cd460224d09c25 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2: 00e9498b453447a5afe527bd0e174587b12f66d2<br />
  xe-pw-134894v1: 134894v1</p>

</body>
</html>

--===============0454459002130724397==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284BCC36010
	for <intel-xe@archiver.kernel.org>; Fri, 11 Apr 2025 11:04:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B249A10EB6B;
	Fri, 11 Apr 2025 11:04:49 +0000 (UTC)
Received: from 32c37dd7f93d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D82310EB6B;
 Fri, 11 Apr 2025 11:04:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0857084754594828781=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/=7Bi915=2Cxe=7D=3A_Move?=
 =?utf-8?q?_PCH_stuff_under_display?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 11 Apr 2025 11:04:47 -0000
Message-ID: <174436948743.4028.2005756715280745282@32c37dd7f93d>
X-Patchwork-Hint: ignore
References: <cover.1744364975.git.jani.nikula@intel.com>
In-Reply-To: <cover.1744364975.git.jani.nikula@intel.com>
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

--===============0857084754594828781==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/{i915,xe}: Move PCH stuff under display
URL   : https://patchwork.freedesktop.org/series/147580/
State : success

== Summary ==

CI Bug Log - changes from xe-2936-07a246112fe9a02c137ac9ce2bf3647f793c889b_BAT -> xe-pw-147580v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-2936-07a246112fe9a02c137ac9ce2bf3647f793c889b -> xe-pw-147580v1

  IGT_8315: c85ef0df47b498f999b43dad6a5cc509228f953a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2936-07a246112fe9a02c137ac9ce2bf3647f793c889b: 07a246112fe9a02c137ac9ce2bf3647f793c889b
  xe-pw-147580v1: 147580v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147580v1/index.html

--===============0857084754594828781==
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
<tr><td><b>Series:</b></td><td>drm/{i915,xe}: Move PCH stuff under display</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147580/">https://patchwork.freedesktop.org/series/147580/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147580v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147580v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2936-07a246112fe9a02c137ac9ce2bf3647f793c889b_BAT -&gt; xe-pw-147580v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2936-07a246112fe9a02c137ac9ce2bf3647f793c889b -&gt; xe-pw-147580v1</li>
</ul>
<p>IGT_8315: c85ef0df47b498f999b43dad6a5cc509228f953a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2936-07a246112fe9a02c137ac9ce2bf3647f793c889b: 07a246112fe9a02c137ac9ce2bf3647f793c889b<br />
  xe-pw-147580v1: 147580v1</p>

</body>
</html>

--===============0857084754594828781==--

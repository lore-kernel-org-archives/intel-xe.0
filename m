Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F079C4451B
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 17:02:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F32F910E4E1;
	Fri, 17 Jul 2026 17:02:41 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D63DA10E4E1;
 Fri, 17 Jul 2026 17:02:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2914630889601104647=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/2?=
 =?utf-8?q?=5D_drm/i915/cdclk=3A_Avoid_spurious_cdclk_sanitization_on_PTL+?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Jul 2026 17:02:40 -0000
Message-ID: <178430776087.202555.10130784712190550210@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260717155107.17801-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260717155107.17801-1-ville.syrjala@linux.intel.com>
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

--===============2914630889601104647==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/i915/cdclk: Avoid spurious cdclk sanitization on PTL+
URL   : https://patchwork.freedesktop.org/series/170653/
State : success

== Summary ==

CI Bug Log - changes from xe-5425-9599a181c5885f816aa83fc18d3f6a4aec4adf7d_BAT -> xe-pw-170653v1_BAT
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

  * Linux: xe-5425-9599a181c5885f816aa83fc18d3f6a4aec4adf7d -> xe-pw-170653v1

  IGT_9013: 10626f13bd71fd21fcbc0421404252766fcfecaf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5425-9599a181c5885f816aa83fc18d3f6a4aec4adf7d: 9599a181c5885f816aa83fc18d3f6a4aec4adf7d
  xe-pw-170653v1: 170653v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170653v1/index.html

--===============2914630889601104647==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/i915/cdclk: Avoid spurious cdclk sanitization on PTL+</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170653/">https://patchwork.freedesktop.org/series/170653/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170653v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170653v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5425-9599a181c5885f816aa83fc18d3f6a4aec4adf7d_BAT -&gt; xe-pw-170653v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5425-9599a181c5885f816aa83fc18d3f6a4aec4adf7d -&gt; xe-pw-170653v1</li>
</ul>
<p>IGT_9013: 10626f13bd71fd21fcbc0421404252766fcfecaf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5425-9599a181c5885f816aa83fc18d3f6a4aec4adf7d: 9599a181c5885f816aa83fc18d3f6a4aec4adf7d<br />
  xe-pw-170653v1: 170653v1</p>

</body>
</html>

--===============2914630889601104647==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302B5CA0FE7
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 13:06:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D907B10E655;
	Tue, 26 Aug 2025 13:06:30 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E0D10E655;
 Tue, 26 Aug 2025 13:06:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1159102214346357541=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bv2?=
 =?utf-8?q?=2C1/3=5D_iopoll=3A_Generalize_read=5Fpoll=5Ftimeout=28=29_into_p?=
 =?utf-8?q?oll=5Ftimeout=5Fus=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 26 Aug 2025 13:06:29 -0000
Message-ID: <175621358934.270220.14433895615196891685@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250826121859.15497-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250826121859.15497-1-ville.syrjala@linux.intel.com>
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

--===============1159102214346357541==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v2,1/3] iopoll: Generalize read_poll_timeout() into poll_timeout_us()
URL   : https://patchwork.freedesktop.org/series/153514/
State : success

== Summary ==

CI Bug Log - changes from xe-3619-9a7b262940bab808a7f3470846922306f686bd84_BAT -> xe-pw-153514v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-153514v1_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * IGT: IGT_8509 -> IGT_8510
  * Linux: xe-3619-9a7b262940bab808a7f3470846922306f686bd84 -> xe-pw-153514v1

  IGT_8509: 9709b23ae933687339ed89c526df2677102e9153 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8510: 8510
  xe-3619-9a7b262940bab808a7f3470846922306f686bd84: 9a7b262940bab808a7f3470846922306f686bd84
  xe-pw-153514v1: 153514v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153514v1/index.html

--===============1159102214346357541==
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
<tr><td><b>Series:</b></td><td>series starting with [v2,1/3] iopoll: Generalize read_poll_timeout() into poll_timeout_us()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153514/">https://patchwork.freedesktop.org/series/153514/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153514v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153514v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3619-9a7b262940bab808a7f3470846922306f686bd84_BAT -&gt; xe-pw-153514v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-153514v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8509 -&gt; IGT_8510</li>
<li>Linux: xe-3619-9a7b262940bab808a7f3470846922306f686bd84 -&gt; xe-pw-153514v1</li>
</ul>
<p>IGT_8509: 9709b23ae933687339ed89c526df2677102e9153 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8510: 8510<br />
  xe-3619-9a7b262940bab808a7f3470846922306f686bd84: 9a7b262940bab808a7f3470846922306f686bd84<br />
  xe-pw-153514v1: 153514v1</p>

</body>
</html>

--===============1159102214346357541==--

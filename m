Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61B3FD374E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 12:13:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A1110E74C;
	Wed, 25 Feb 2026 12:13:14 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4BF10E74C;
 Wed, 25 Feb 2026 12:13:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8522695808909103448=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_series_starting_with_=5B1/?=
 =?utf-8?q?2=5D_drm/dp=3A_Add_definition_for_Panel_Replay_full-line_granular?=
 =?utf-8?q?ity?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Feb 2026 12:13:13 -0000
Message-ID: <177202159374.284987.1968233375283711416@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260225074221.1744330-1-jouni.hogander@intel.com>
In-Reply-To: <20260225074221.1744330-1-jouni.hogander@intel.com>
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

--===============8522695808909103448==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/dp: Add definition for Panel Replay full-line granularity
URL   : https://patchwork.freedesktop.org/series/162120/
State : success

== Summary ==

CI Bug Log - changes from xe-4610-4a8ef58307bfc096873745fbb27d0bbc5454676d_FULL -> xe-pw-162120v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-162120v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][1] ([Intel XE#1124])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162120v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-race-nomemset:
    - shard-lnl:          NOTRUN -> [ABORT][2] ([Intel XE#7414])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162120v1/shard-lnl-7/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-race-nomemset.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#7414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7414


Build changes
-------------

  * Linux: xe-4610-4a8ef58307bfc096873745fbb27d0bbc5454676d -> xe-pw-162120v1

  IGT_8770: 8770
  xe-4610-4a8ef58307bfc096873745fbb27d0bbc5454676d: 4a8ef58307bfc096873745fbb27d0bbc5454676d
  xe-pw-162120v1: 162120v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162120v1/index.html

--===============8522695808909103448==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/dp: Add definition for Panel Replay full-line granularity</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162120/">https://patchwork.freedesktop.org/series/162120/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162120v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162120v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4610-4a8ef58307bfc096873745fbb27d0bbc5454676d_FULL -&gt; xe-pw-162120v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-162120v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162120v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-race-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162120v1/shard-lnl-7/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-race-nomemset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7414">Intel XE#7414</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4610-4a8ef58307bfc096873745fbb27d0bbc5454676d -&gt; xe-pw-162120v1</li>
</ul>
<p>IGT_8770: 8770<br />
  xe-4610-4a8ef58307bfc096873745fbb27d0bbc5454676d: 4a8ef58307bfc096873745fbb27d0bbc5454676d<br />
  xe-pw-162120v1: 162120v1</p>

</body>
</html>

--===============8522695808909103448==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D63C531DC
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 09:48:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CB510E5A2;
	Fri, 16 Aug 2024 09:48:32 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3414410E5A2;
 Fri, 16 Aug 2024 09:48:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6238308288456177487=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Remove_a_redundant_NUL?=
 =?utf-8?q?L_lrc-=3Ebo_check_as_a_lrc_will_always_have_a_bo?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Singh, Apoorva" <apoorva.singh@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Aug 2024 09:48:31 -0000
Message-ID: <172380171120.652113.10530938767703801920@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240816082820.897326-1-apoorva.singh@intel.com>
In-Reply-To: <20240816082820.897326-1-apoorva.singh@intel.com>
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

--===============6238308288456177487==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Remove a redundant NULL lrc->bo check as a lrc will always have a bo
URL   : https://patchwork.freedesktop.org/series/137378/
State : success

== Summary ==

CI Bug Log - changes from xe-1780-458d8703f0ee799c7d067bcaeb36d5d525a180b3_BAT -> xe-pw-137378v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-137378v1_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-lnl-2:          [SKIP][1] ([Intel XE#2235]) -> [SKIP][2] ([Intel XE#2235] / [Intel XE#2482]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1780-458d8703f0ee799c7d067bcaeb36d5d525a180b3/bat-lnl-2/igt@kms_flip@basic-flip-vs-dpms.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137378v1/bat-lnl-2/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-lnl-2:          [SKIP][3] ([Intel XE#2235] / [Intel XE#2434]) -> [SKIP][4] ([Intel XE#2235] / [Intel XE#2548])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1780-458d8703f0ee799c7d067bcaeb36d5d525a180b3/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137378v1/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#2235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235
  [Intel XE#2434]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548


Build changes
-------------

  * Linux: xe-1780-458d8703f0ee799c7d067bcaeb36d5d525a180b3 -> xe-pw-137378v1

  IGT_7972: c34e13f766d0ed48c8b62ad9d8c29f11a8441b8b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1780-458d8703f0ee799c7d067bcaeb36d5d525a180b3: 458d8703f0ee799c7d067bcaeb36d5d525a180b3
  xe-pw-137378v1: 137378v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137378v1/index.html

--===============6238308288456177487==
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
<tr><td><b>Series:</b></td><td>drm/xe: Remove a redundant NULL lrc-&gt;bo check as a lrc will always have a bo</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137378/">https://patchwork.freedesktop.org/series/137378/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137378v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137378v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1780-458d8703f0ee799c7d067bcaeb36d5d525a180b3_BAT -&gt; xe-pw-137378v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137378v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1780-458d8703f0ee799c7d067bcaeb36d5d525a180b3/bat-lnl-2/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137378v1/bat-lnl-2/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1780-458d8703f0ee799c7d067bcaeb36d5d525a180b3/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137378v1/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1780-458d8703f0ee799c7d067bcaeb36d5d525a180b3 -&gt; xe-pw-137378v1</li>
</ul>
<p>IGT_7972: c34e13f766d0ed48c8b62ad9d8c29f11a8441b8b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1780-458d8703f0ee799c7d067bcaeb36d5d525a180b3: 458d8703f0ee799c7d067bcaeb36d5d525a180b3<br />
  xe-pw-137378v1: 137378v1</p>

</body>
</html>

--===============6238308288456177487==--

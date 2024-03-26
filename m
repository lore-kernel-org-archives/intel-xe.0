Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A613CD11DD
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 14:00:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C7F10EFBB;
	Tue, 26 Mar 2024 14:00:30 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821C210EFBB;
 Tue, 26 Mar 2024 14:00:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6054402945719887696=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Move_HW_GGTT_definitio?=
 =?utf-8?q?ns_to_dedicated_file?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 26 Mar 2024 14:00:28 -0000
Message-ID: <171146162853.1039951.11212143318149690115@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240326131042.319-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240326131042.319-1-michal.wajdeczko@intel.com>
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

--===============6054402945719887696==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Move HW GGTT definitions to dedicated file
URL   : https://patchwork.freedesktop.org/series/131631/
State : success

== Summary ==

CI Bug Log - changes from xe-993-5c9e5d1880d47d51de6d0b2def39c509bc18aaff_BAT -> xe-pw-131631v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-131631v1_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate:
    - bat-adlp-7:         [INCOMPLETE][1] ([Intel XE#1044]) -> [INCOMPLETE][2] ([Intel XE#1044] / [Intel XE#1376])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-993-5c9e5d1880d47d51de6d0b2def39c509bc18aaff/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131631v1/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html

  
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376


Build changes
-------------

  * IGT: IGT_7782 -> IGT_7784
  * Linux: xe-993-5c9e5d1880d47d51de6d0b2def39c509bc18aaff -> xe-pw-131631v1

  IGT_7782: a404f73182948e843640d00cc279883391cf6ef4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7784: 7784
  xe-993-5c9e5d1880d47d51de6d0b2def39c509bc18aaff: 5c9e5d1880d47d51de6d0b2def39c509bc18aaff
  xe-pw-131631v1: 131631v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131631v1/index.html

--===============6054402945719887696==
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
<tr><td><b>Series:</b></td><td>drm/xe: Move HW GGTT definitions to dedicated file</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131631/">https://patchwork.freedesktop.org/series/131631/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131631v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131631v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-993-5c9e5d1880d47d51de6d0b2def39c509bc18aaff_BAT -&gt; xe-pw-131631v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-131631v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-userptr-invalidate:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-993-5c9e5d1880d47d51de6d0b2def39c509bc18aaff/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131631v1/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376">Intel XE#1376</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7782 -&gt; IGT_7784</li>
<li>Linux: xe-993-5c9e5d1880d47d51de6d0b2def39c509bc18aaff -&gt; xe-pw-131631v1</li>
</ul>
<p>IGT_7782: a404f73182948e843640d00cc279883391cf6ef4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7784: 7784<br />
  xe-993-5c9e5d1880d47d51de6d0b2def39c509bc18aaff: 5c9e5d1880d47d51de6d0b2def39c509bc18aaff<br />
  xe-pw-131631v1: 131631v1</p>

</body>
</html>

--===============6054402945719887696==--

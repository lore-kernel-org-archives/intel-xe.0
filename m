Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FF7CFC611
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 08:07:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76AE10EA70;
	Fri, 11 Oct 2024 08:07:19 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD76610EA70;
 Fri, 11 Oct 2024 08:07:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0404722594339402297=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_add_system_memory_page?=
 =?utf-8?q?_iterator_support_to_xe=5Fres=5Fcursor_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 11 Oct 2024 08:07:18 -0000
Message-ID: <172863403889.1239470.5799007075335990533@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241011-xe_res_cursor_add_page_iterator-v3-1-0f8b8d3ab021@intel.com>
In-Reply-To: <20241011-xe_res_cursor_add_page_iterator-v3-1-0f8b8d3ab021@intel.com>
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

--===============0404722594339402297==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: add system memory page iterator support to xe_res_cursor (rev3)
URL   : https://patchwork.freedesktop.org/series/139780/
State : success

== Summary ==

CI Bug Log - changes from xe-2046-f3354eab2a45420cf38a67f6d7735d5dff53eb6f_BAT -> xe-pw-139780v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-139780v3_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-lnl-2:          [FAIL][1] ([Intel XE#2754]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2046-f3354eab2a45420cf38a67f6d7735d5dff53eb6f/bat-lnl-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v3/bat-lnl-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  
  [Intel XE#2754]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754


Build changes
-------------

  * Linux: xe-2046-f3354eab2a45420cf38a67f6d7735d5dff53eb6f -> xe-pw-139780v3

  IGT_8063: 8063
  xe-2046-f3354eab2a45420cf38a67f6d7735d5dff53eb6f: f3354eab2a45420cf38a67f6d7735d5dff53eb6f
  xe-pw-139780v3: 139780v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v3/index.html

--===============0404722594339402297==
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
<tr><td><b>Series:</b></td><td>drm/xe: add system memory page iterator support to xe_res_cursor (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139780/">https://patchwork.freedesktop.org/series/139780/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2046-f3354eab2a45420cf38a67f6d7735d5dff53eb6f_BAT -&gt; xe-pw-139780v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139780v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-userptr-invalidate:<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2046-f3354eab2a45420cf38a67f6d7735d5dff53eb6f/bat-lnl-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754">Intel XE#2754</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139780v3/bat-lnl-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2046-f3354eab2a45420cf38a67f6d7735d5dff53eb6f -&gt; xe-pw-139780v3</li>
</ul>
<p>IGT_8063: 8063<br />
  xe-2046-f3354eab2a45420cf38a67f6d7735d5dff53eb6f: f3354eab2a45420cf38a67f6d7735d5dff53eb6f<br />
  xe-pw-139780v3: 139780v3</p>

</body>
</html>

--===============0404722594339402297==--

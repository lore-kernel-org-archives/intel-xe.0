Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBB7C88E70
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 13:34:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0DFE10EE77;
	Mon, 14 Sep 2026 13:34:20 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC0910EE57;
 Mon, 14 Sep 2026 13:34:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4397558259457345750=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/audio=3A_Fix_names?=
 =?utf-8?q?_that_do_not_exist_in_kernel-doc_comments_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karl Mehltretter" <kmehltretter@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 14 Sep 2026 13:34:20 -0000
Message-ID: <178939286024.159168.7224084500073650099@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260911200053.78731-1-kmehltretter@gmail.com>
In-Reply-To: <20260911200053.78731-1-kmehltretter@gmail.com>
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

--===============4397558259457345750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/audio: Fix names that do not exist in kernel-doc comments (rev2)
URL   : https://patchwork.freedesktop.org/series/173897/
State : success

== Summary ==

CI Bug Log - changes from xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6_BAT -> xe-pw-173897v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 14)
------------------------------

  Missing    (1): bat-nvls-1 

Known issues
------------

  Here are the changes found in xe-pw-173897v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] ([Intel XE#8007])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_waitfence@engine:
    - bat-wcl-2:          [PASS][3] -> [FAIL][4] ([Intel XE#9103])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6/bat-wcl-2/igt@xe_waitfence@engine.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/bat-wcl-2/igt@xe_waitfence@engine.html

  
#### Possible fixes ####

  * igt@xe_waitfence@reltime:
    - bat-ptl-2:          [FAIL][5] ([Intel XE#9115]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6/bat-ptl-2/igt@xe_waitfence@reltime.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/bat-ptl-2/igt@xe_waitfence@reltime.html

  
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#9103]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9103
  [Intel XE#9115]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115


Build changes
-------------

  * Linux: xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6 -> xe-pw-173897v2

  IGT_9093: 932327f15c92ecb52266ced8c0fbe72931a75880 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6: a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6
  xe-pw-173897v2: 173897v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/index.html

--===============4397558259457345750==
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
<tr><td><b>Series:</b></td><td>drm/i915/audio: Fix names that do not exist in kernel-doc comments (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173897/">https://patchwork.freedesktop.org/series/173897/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6_BAT -&gt; xe-pw-173897v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 14)</h2>
<p>Missing    (1): bat-nvls-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-173897v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6/bat-wcl-2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/bat-wcl-2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9103">Intel XE#9103</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6/bat-ptl-2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115">Intel XE#9115</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173897v2/bat-ptl-2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6 -&gt; xe-pw-173897v2</li>
</ul>
<p>IGT_9093: 932327f15c92ecb52266ced8c0fbe72931a75880 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5740-a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6: a33b82feef10c34c61cbc7fbf1dbdff1ffff96c6<br />
  xe-pw-173897v2: 173897v2</p>

</body>
</html>

--===============4397558259457345750==--

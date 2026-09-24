Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FAFC9830D
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 01:14:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0E910E343;
	Thu, 24 Sep 2026 01:14:24 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4770D10E343;
 Thu, 24 Sep 2026 01:14:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3715437729642423892=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Drop_old_Xe_GT_ID?=
 =?utf-8?q?_macros?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Sep 2026 01:14:23 -0000
Message-ID: <179021246328.200817.8068011507191153816@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260923-drop_old_gt_defines-v1-1-8f0811238582@intel.com>
In-Reply-To: <20260923-drop_old_gt_defines-v1-1-8f0811238582@intel.com>
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

--===============3715437729642423892==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Drop old Xe GT ID macros
URL   : https://patchwork.freedesktop.org/series/174855/
State : success

== Summary ==

CI Bug Log - changes from xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04_BAT -> xe-pw-174855v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-174855v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] ([Intel XE#8007])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_waitfence@engine:
    - bat-ptl-2:          [PASS][3] -> [FAIL][4] ([Intel XE#9109])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/bat-ptl-2/igt@xe_waitfence@engine.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/bat-ptl-2/igt@xe_waitfence@engine.html

  
#### Possible fixes ####

  * igt@xe_waitfence@abstime:
    - bat-nvls-2:         [TIMEOUT][5] ([Intel XE#9382]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/bat-nvls-2/igt@xe_waitfence@abstime.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/bat-nvls-2/igt@xe_waitfence@abstime.html

  
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#9109]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109
  [Intel XE#9382]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9382


Build changes
-------------

  * IGT: IGT_9110 -> IGT_9111
  * Linux: xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04 -> xe-pw-174855v1

  IGT_9110: 9110
  IGT_9111: 4aeabf104b136437d0ccc57caf32a752587d595c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04: 703cd271db3a35088460ab3fec0a96bd48e7fe04
  xe-pw-174855v1: 174855v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/index.html

--===============3715437729642423892==
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
<tr><td><b>Series:</b></td><td>drm/xe: Drop old Xe GT ID macros</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174855/">https://patchwork.freedesktop.org/series/174855/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04_BAT -&gt; xe-pw-174855v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-174855v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/bat-ptl-2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/bat-ptl-2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109">Intel XE#9109</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04/bat-nvls-2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9382">Intel XE#9382</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174855v1/bat-nvls-2/igt@xe_waitfence@abstime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9110 -&gt; IGT_9111</li>
<li>Linux: xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04 -&gt; xe-pw-174855v1</li>
</ul>
<p>IGT_9110: 9110<br />
  IGT_9111: 4aeabf104b136437d0ccc57caf32a752587d595c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04: 703cd271db3a35088460ab3fec0a96bd48e7fe04<br />
  xe-pw-174855v1: 174855v1</p>

</body>
</html>

--===============3715437729642423892==--

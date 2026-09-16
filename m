Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5866EC982C9
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 16:15:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0285910E280;
	Wed, 16 Sep 2026 16:15:48 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E81ED10E280;
 Wed, 16 Sep 2026 16:15:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6288492337719226474=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/cx0=5Fphy=3A_Fix_A?=
 =?utf-8?q?RL-S_host_bridge_detection?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Sep 2026 16:15:45 -0000
Message-ID: <178957534594.173285.10543164911846614678@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260916152928.185110-1-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20260916152928.185110-1-dnyaneshwar.bhadane@intel.com>
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

--===============6288492337719226474==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/cx0_phy: Fix ARL-S host bridge detection
URL   : https://patchwork.freedesktop.org/series/174302/
State : success

== Summary ==

CI Bug Log - changes from xe-5758-3b18c5132fd3bbc7e74490b64d814df76edffd60_BAT -> xe-pw-174302v1_BAT
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

  Here are the changes found in xe-pw-174302v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] ([Intel XE#8007])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5758-3b18c5132fd3bbc7e74490b64d814df76edffd60/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174302v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  * igt@runner@aborted:
    - bat-wcl-2:          NOTRUN -> [FAIL][3] ([Intel XE#9062])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174302v1/bat-wcl-2/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@xe_waitfence@abstime:
    - bat-wcl-1:          [TIMEOUT][4] ([Intel XE#9226]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5758-3b18c5132fd3bbc7e74490b64d814df76edffd60/bat-wcl-1/igt@xe_waitfence@abstime.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174302v1/bat-wcl-1/igt@xe_waitfence@abstime.html

  
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#9062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9062
  [Intel XE#9226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9226


Build changes
-------------

  * Linux: xe-5758-3b18c5132fd3bbc7e74490b64d814df76edffd60 -> xe-pw-174302v1

  IGT_9099: 9099
  xe-5758-3b18c5132fd3bbc7e74490b64d814df76edffd60: 3b18c5132fd3bbc7e74490b64d814df76edffd60
  xe-pw-174302v1: 174302v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174302v1/index.html

--===============6288492337719226474==
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
<tr><td><b>Series:</b></td><td>drm/i915/cx0_phy: Fix ARL-S host bridge detection</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174302/">https://patchwork.freedesktop.org/series/174302/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174302v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174302v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5758-3b18c5132fd3bbc7e74490b64d814df76edffd60_BAT -&gt; xe-pw-174302v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-174302v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5758-3b18c5132fd3bbc7e74490b64d814df76edffd60/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174302v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>bat-wcl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174302v1/bat-wcl-2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9062">Intel XE#9062</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5758-3b18c5132fd3bbc7e74490b64d814df76edffd60/bat-wcl-1/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9226">Intel XE#9226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174302v1/bat-wcl-1/igt@xe_waitfence@abstime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5758-3b18c5132fd3bbc7e74490b64d814df76edffd60 -&gt; xe-pw-174302v1</li>
</ul>
<p>IGT_9099: 9099<br />
  xe-5758-3b18c5132fd3bbc7e74490b64d814df76edffd60: 3b18c5132fd3bbc7e74490b64d814df76edffd60<br />
  xe-pw-174302v1: 174302v1</p>

</body>
</html>

--===============6288492337719226474==--

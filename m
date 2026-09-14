Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1510C88E72
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 14:22:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E18710EF0E;
	Mon, 14 Sep 2026 14:22:20 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D84210EF0E;
 Mon, 14 Sep 2026 14:22:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0797240365281551896=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/fb=3A_replace_kmal?=
 =?utf-8?q?loc=5Farray_with_kmalloc=5Fobjs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lalit Shankar Chowdhury" <lalitshankarch@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 14 Sep 2026 14:22:18 -0000
Message-ID: <178939573863.159168.17911262834662599842@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260910155846.79513-1-lalitshankarch@gmail.com>
In-Reply-To: <20260910155846.79513-1-lalitshankarch@gmail.com>
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

--===============0797240365281551896==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/fb: replace kmalloc_array with kmalloc_objs (rev2)
URL   : https://patchwork.freedesktop.org/series/173896/
State : success

== Summary ==

CI Bug Log - changes from xe-5741-e92a6bc90048eedc474f7f73506852d9b26c8443_BAT -> xe-pw-173896v2_BAT
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

  Here are the changes found in xe-pw-173896v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [ABORT][1] ([Intel XE#8007]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5741-e92a6bc90048eedc474f7f73506852d9b26c8443/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173896v2/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007


Build changes
-------------

  * Linux: xe-5741-e92a6bc90048eedc474f7f73506852d9b26c8443 -> xe-pw-173896v2

  IGT_9093: 932327f15c92ecb52266ced8c0fbe72931a75880 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5741-e92a6bc90048eedc474f7f73506852d9b26c8443: e92a6bc90048eedc474f7f73506852d9b26c8443
  xe-pw-173896v2: 173896v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173896v2/index.html

--===============0797240365281551896==
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
<tr><td><b>Series:</b></td><td>drm/i915/fb: replace kmalloc_array with kmalloc_objs (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173896/">https://patchwork.freedesktop.org/series/173896/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173896v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173896v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5741-e92a6bc90048eedc474f7f73506852d9b26c8443_BAT -&gt; xe-pw-173896v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-173896v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5741-e92a6bc90048eedc474f7f73506852d9b26c8443/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173896v2/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5741-e92a6bc90048eedc474f7f73506852d9b26c8443 -&gt; xe-pw-173896v2</li>
</ul>
<p>IGT_9093: 932327f15c92ecb52266ced8c0fbe72931a75880 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5741-e92a6bc90048eedc474f7f73506852d9b26c8443: e92a6bc90048eedc474f7f73506852d9b26c8443<br />
  xe-pw-173896v2: 173896v2</p>

</body>
</html>

--===============0797240365281551896==--

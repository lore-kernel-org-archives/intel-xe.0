Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A238EC624D6
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 00:41:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA3D10F37E;
	Thu,  3 Sep 2026 00:41:43 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C4B10E06F;
 Thu,  3 Sep 2026 00:41:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0928152905557827272=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/guc=3A_Compress_GuC_?=
 =?utf-8?q?log_and_CTB_dump_with_zstd_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Sep 2026 00:41:42 -0000
Message-ID: <178839610261.115662.4726041828932116762@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260902234039.885267-4-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20260902234039.885267-4-alan.previn.teres.alexis@intel.com>
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

--===============0928152905557827272==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Compress GuC log and CTB dump with zstd (rev4)
URL   : https://patchwork.freedesktop.org/series/170589/
State : success

== Summary ==

CI Bug Log - changes from xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3_BAT -> xe-pw-170589v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-170589v4_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@reltime:
    - bat-wcl-1:          [PASS][1] -> [FAIL][2] ([Intel XE#9115])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-wcl-1/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/bat-wcl-1/igt@xe_waitfence@reltime.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-nvls-1:         [DMESG-WARN][3] ([Intel XE#8762] / [Intel XE#9069]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_waitfence@reltime:
    - bat-ptl-2:          [FAIL][5] ([Intel XE#9115]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-ptl-2/igt@xe_waitfence@reltime.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/bat-ptl-2/igt@xe_waitfence@reltime.html

  
  [Intel XE#8762]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762
  [Intel XE#9069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069
  [Intel XE#9115]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115


Build changes
-------------

  * IGT: IGT_9080 -> IGT_9081
  * Linux: xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3 -> xe-pw-170589v4

  IGT_9080: 65c1a091179475c3f0cd925799b49f58720bcf43 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9081: 9081
  xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3: bb742c97086d95b2a04b1b8fbc67822b4cf848c3
  xe-pw-170589v4: 170589v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/index.html

--===============0928152905557827272==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Compress GuC log and CTB dump with zstd (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170589/">https://patchwork.freedesktop.org/series/170589/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3_BAT -&gt; xe-pw-170589v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-170589v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-wcl-1/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/bat-wcl-1/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115">Intel XE#9115</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762">Intel XE#8762</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069">Intel XE#9069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-ptl-2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115">Intel XE#9115</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v4/bat-ptl-2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9080 -&gt; IGT_9081</li>
<li>Linux: xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3 -&gt; xe-pw-170589v4</li>
</ul>
<p>IGT_9080: 65c1a091179475c3f0cd925799b49f58720bcf43 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9081: 9081<br />
  xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3: bb742c97086d95b2a04b1b8fbc67822b4cf848c3<br />
  xe-pw-170589v4: 170589v4</p>

</body>
</html>

--===============0928152905557827272==--

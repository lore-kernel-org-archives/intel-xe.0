Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DF910BA43C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 08:27:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAEFC10E2DE;
	Fri, 27 Mar 2026 08:27:32 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F21010E2DE;
 Fri, 27 Mar 2026 08:27:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6067268248573325856=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Add_Wa=5F14026626?=
 =?utf-8?q?235?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nitin Gote" <nitin.r.gote@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Mar 2026 08:27:31 -0000
Message-ID: <177460005162.404950.13668358461805403991@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260327080719.2136248-2-nitin.r.gote@intel.com>
In-Reply-To: <20260327080719.2136248-2-nitin.r.gote@intel.com>
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

--===============6067268248573325856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add Wa_14026626235
URL   : https://patchwork.freedesktop.org/series/163967/
State : success

== Summary ==

CI Bug Log - changes from xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b_BAT -> xe-pw-163967v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-163967v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [FAIL][1] ([Intel XE#6519]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163967v1/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [DMESG-WARN][3] ([Intel XE#7433]) -> [ABORT][4] ([Intel XE#7249] / [Intel XE#7578])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163967v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519
  [Intel XE#7249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7249
  [Intel XE#7433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433
  [Intel XE#7578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578


Build changes
-------------

  * Linux: xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b -> xe-pw-163967v1

  IGT_8834: 8834
  xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b: 0a7844908d3616b88a7887704eb6dfa0d315be1b
  xe-pw-163967v1: 163967v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163967v1/index.html

--===============6067268248573325856==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add Wa_14026626235</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163967/">https://patchwork.freedesktop.org/series/163967/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163967v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163967v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b_BAT -&gt; xe-pw-163967v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-163967v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163967v1/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433">Intel XE#7433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163967v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7249">Intel XE#7249</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578">Intel XE#7578</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b -&gt; xe-pw-163967v1</li>
</ul>
<p>IGT_8834: 8834<br />
  xe-4803-0a7844908d3616b88a7887704eb6dfa0d315be1b: 0a7844908d3616b88a7887704eb6dfa0d315be1b<br />
  xe-pw-163967v1: 163967v1</p>

</body>
</html>

--===============6067268248573325856==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40053CA5FD4
	for <intel-xe@archiver.kernel.org>; Fri,  2 Oct 2026 14:49:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB6810E204;
	Fri,  2 Oct 2026 14:49:18 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D16610E204;
 Fri,  2 Oct 2026 14:49:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5587213998642471395=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bv2?=
 =?utf-8?q?=2C1/3=5D_drm/i915/gmbus=3A_Switch_GMBUS_fully_to_=5Ffw=28=29_reg?=
 =?utf-8?q?ister_accesses_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 02 Oct 2026 14:49:18 -0000
Message-ID: <179095255830.233216.1563133229922334475@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260930115303.24285-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260930115303.24285-1-ville.syrjala@linux.intel.com>
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

--===============5587213998642471395==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v2,1/3] drm/i915/gmbus: Switch GMBUS fully to _fw() register accesses (rev3)
URL   : https://patchwork.freedesktop.org/series/175282/
State : success

== Summary ==

CI Bug Log - changes from xe-5872-fc5f5579dbfab13003fd4d6c1c9214a558f58c9d_BAT -> xe-pw-175282v3_BAT
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

  Here are the changes found in xe-pw-175282v3_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-nvls-1:         [DMESG-WARN][1] ([Intel XE#8762] / [Intel XE#9069]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5872-fc5f5579dbfab13003fd4d6c1c9214a558f58c9d/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175282v3/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#8762]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762
  [Intel XE#9069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069


Build changes
-------------

  * IGT: IGT_9123 -> IGT_9125
  * Linux: xe-5872-fc5f5579dbfab13003fd4d6c1c9214a558f58c9d -> xe-pw-175282v3

  IGT_9123: afd8cfb7aa15906974dd979b6dc739ed17ab9e33 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9125: 9125
  xe-5872-fc5f5579dbfab13003fd4d6c1c9214a558f58c9d: fc5f5579dbfab13003fd4d6c1c9214a558f58c9d
  xe-pw-175282v3: 175282v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175282v3/index.html

--===============5587213998642471395==
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
<tr><td><b>Series:</b></td><td>series starting with [v2,1/3] drm/i915/gmbus: Switch GMBUS fully to _fw() register accesses (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175282/">https://patchwork.freedesktop.org/series/175282/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175282v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175282v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5872-fc5f5579dbfab13003fd4d6c1c9214a558f58c9d_BAT -&gt; xe-pw-175282v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-175282v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5872-fc5f5579dbfab13003fd4d6c1c9214a558f58c9d/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762">Intel XE#8762</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069">Intel XE#9069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175282v3/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9123 -&gt; IGT_9125</li>
<li>Linux: xe-5872-fc5f5579dbfab13003fd4d6c1c9214a558f58c9d -&gt; xe-pw-175282v3</li>
</ul>
<p>IGT_9123: afd8cfb7aa15906974dd979b6dc739ed17ab9e33 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9125: 9125<br />
  xe-5872-fc5f5579dbfab13003fd4d6c1c9214a558f58c9d: fc5f5579dbfab13003fd4d6c1c9214a558f58c9d<br />
  xe-pw-175282v3: 175282v3</p>

</body>
</html>

--===============5587213998642471395==--

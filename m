Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D01D5B16C
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 16:03:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8574C10E667;
	Mon, 15 Dec 2025 16:03:32 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2186110E808;
 Mon, 15 Dec 2025 16:03:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2677392923884783410=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_PF=3A_Add_handling_for_new_?=
 =?utf-8?q?adverse_event_thresholds_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Dec 2025 16:03:31 -0000
Message-ID: <176581461101.90193.302641506332993789@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251215143739.196336-1-michal.wajdeczko@intel.com>
In-Reply-To: <20251215143739.196336-1-michal.wajdeczko@intel.com>
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

--===============2677392923884783410==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: PF: Add handling for new adverse event thresholds (rev2)
URL   : https://patchwork.freedesktop.org/series/158874/
State : success

== Summary ==

CI Bug Log - changes from xe-4243-9ed47bca620f1ec976ca0e4a7f467e07c47c0061_BAT -> xe-pw-158874v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-158874v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#6519])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4243-9ed47bca620f1ec976ca0e4a7f467e07c47c0061/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v2/bat-dg2-oem2/igt@xe_waitfence@engine.html

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4] ([Intel XE#6520])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4243-9ed47bca620f1ec976ca0e4a7f467e07c47c0061/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v2/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * Linux: xe-4243-9ed47bca620f1ec976ca0e4a7f467e07c47c0061 -> xe-pw-158874v2

  IGT_8666: 8666
  xe-4243-9ed47bca620f1ec976ca0e4a7f467e07c47c0061: 9ed47bca620f1ec976ca0e4a7f467e07c47c0061
  xe-pw-158874v2: 158874v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v2/index.html

--===============2677392923884783410==
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
<tr><td><b>Series:</b></td><td>PF: Add handling for new adverse event thresholds (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158874/">https://patchwork.freedesktop.org/series/158874/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4243-9ed47bca620f1ec976ca0e4a7f467e07c47c0061_BAT -&gt; xe-pw-158874v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-158874v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4243-9ed47bca620f1ec976ca0e4a7f467e07c47c0061/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v2/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4243-9ed47bca620f1ec976ca0e4a7f467e07c47c0061/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v2/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4243-9ed47bca620f1ec976ca0e4a7f467e07c47c0061 -&gt; xe-pw-158874v2</li>
</ul>
<p>IGT_8666: 8666<br />
  xe-4243-9ed47bca620f1ec976ca0e4a7f467e07c47c0061: 9ed47bca620f1ec976ca0e4a7f467e07c47c0061<br />
  xe-pw-158874v2: 158874v2</p>

</body>
</html>

--===============2677392923884783410==--

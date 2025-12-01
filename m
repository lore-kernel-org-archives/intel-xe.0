Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D57D116F3
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 14:39:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E673F10E2B7;
	Mon,  1 Dec 2025 14:39:24 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC7710E2B7;
 Mon,  1 Dec 2025 14:39:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5954032414637313648=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Switch_to_use_kernel_standa?=
 =?utf-8?q?rd_fault_injection_in_i915_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Dec 2025 14:39:23 -0000
Message-ID: <176459996370.44391.10346028027175547084@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251201130559.731361-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20251201130559.731361-1-juhapekka.heikkila@gmail.com>
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

--===============5954032414637313648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Switch to use kernel standard fault injection in i915 (rev5)
URL   : https://patchwork.freedesktop.org/series/155986/
State : success

== Summary ==

CI Bug Log - changes from xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c_BAT -> xe-pw-155986v5_BAT
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

  Here are the changes found in xe-pw-155986v5_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#6519])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155986v5/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * Linux: xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c -> xe-pw-155986v5

  IGT_8646: 8646
  xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c: 7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c
  xe-pw-155986v5: 155986v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155986v5/index.html

--===============5954032414637313648==
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
<tr><td><b>Series:</b></td><td>Switch to use kernel standard fault injection in i915 (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155986/">https://patchwork.freedesktop.org/series/155986/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155986v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155986v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c_BAT -&gt; xe-pw-155986v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-155986v5_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155986v5/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c -&gt; xe-pw-155986v5</li>
</ul>
<p>IGT_8646: 8646<br />
  xe-4173-7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c: 7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c<br />
  xe-pw-155986v5: 155986v5</p>

</body>
</html>

--===============5954032414637313648==--

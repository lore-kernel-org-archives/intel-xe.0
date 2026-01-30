Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B572E6BF10
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 20:30:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69A010E383;
	Fri, 30 Jan 2026 20:30:43 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47EB810E958;
 Fri, 30 Jan 2026 20:30:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8290949875589672936=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Small_GPUSVM_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 Jan 2026 20:30:42 -0000
Message-ID: <176980504229.211739.3241209138780392335@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260130194928.3255613-1-matthew.brost@intel.com>
In-Reply-To: <20260130194928.3255613-1-matthew.brost@intel.com>
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

--===============8290949875589672936==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Small GPUSVM fixes
URL   : https://patchwork.freedesktop.org/series/160939/
State : success

== Summary ==

CI Bug Log - changes from xe-4476-feea7da320aa6950f02d3c4633ab678e6e61f7e9_BAT -> xe-pw-160939v1_BAT
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

  Here are the changes found in xe-pw-160939v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_pat@pat-index-xe2@render:
    - bat-ptl-vm:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#7110]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4476-feea7da320aa6950f02d3c4633ab678e6e61f7e9/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160939v1/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html

  
  [Intel XE#7110]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7110


Build changes
-------------

  * IGT: IGT_8726 -> IGT_8728
  * Linux: xe-4476-feea7da320aa6950f02d3c4633ab678e6e61f7e9 -> xe-pw-160939v1

  IGT_8726: 8726
  IGT_8728: 8728
  xe-4476-feea7da320aa6950f02d3c4633ab678e6e61f7e9: feea7da320aa6950f02d3c4633ab678e6e61f7e9
  xe-pw-160939v1: 160939v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160939v1/index.html

--===============8290949875589672936==
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
<tr><td><b>Series:</b></td><td>Small GPUSVM fixes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160939/">https://patchwork.freedesktop.org/series/160939/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160939v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160939v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4476-feea7da320aa6950f02d3c4633ab678e6e61f7e9_BAT -&gt; xe-pw-160939v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-160939v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_pat@pat-index-xe2@render:<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4476-feea7da320aa6950f02d3c4633ab678e6e61f7e9/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160939v1/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7110">Intel XE#7110</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8726 -&gt; IGT_8728</li>
<li>Linux: xe-4476-feea7da320aa6950f02d3c4633ab678e6e61f7e9 -&gt; xe-pw-160939v1</li>
</ul>
<p>IGT_8726: 8726<br />
  IGT_8728: 8728<br />
  xe-4476-feea7da320aa6950f02d3c4633ab678e6e61f7e9: feea7da320aa6950f02d3c4633ab678e6e61f7e9<br />
  xe-pw-160939v1: 160939v1</p>

</body>
</html>

--===============8290949875589672936==--

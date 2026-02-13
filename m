Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D08EEDF176
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 16:04:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2133610E82D;
	Fri, 13 Feb 2026 16:04:47 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99EAA10E81F;
 Fri, 13 Feb 2026 16:04:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3653695430867566177=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_gpu=3A_Fix_uninitialized_bu?=
 =?utf-8?q?ddy_for_built-in_drivers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Koen Koning" <koen.koning@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Feb 2026 16:04:45 -0000
Message-ID: <177099868560.253291.15480676430528185990@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260213152047.179628-1-koen.koning@linux.intel.com>
In-Reply-To: <20260213152047.179628-1-koen.koning@linux.intel.com>
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

--===============3653695430867566177==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gpu: Fix uninitialized buddy for built-in drivers
URL   : https://patchwork.freedesktop.org/series/161596/
State : success

== Summary ==

CI Bug Log - changes from xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b_BAT -> xe-pw-161596v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Additional (1): bat-bmg-3 
  Missing    (2): bat-adlp-vm bat-ptl-vm 

Known issues
------------

  Here are the changes found in xe-pw-161596v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - bat-bmg-3:          NOTRUN -> [SKIP][1] ([Intel XE#6566]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161596v1/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  
  [Intel XE#6566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566


Build changes
-------------

  * Linux: xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b -> xe-pw-161596v1

  IGT_8753: 8753
  xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b: f9b2cabe33794dfc69b0a547516d9e2f45718f0b
  xe-pw-161596v1: 161596v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161596v1/index.html

--===============3653695430867566177==
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
<tr><td><b>Series:</b></td><td>gpu: Fix uninitialized buddy for built-in drivers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161596/">https://patchwork.freedesktop.org/series/161596/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161596v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161596v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b_BAT -&gt; xe-pw-161596v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Additional (1): bat-bmg-3 <br />
  Missing    (2): bat-adlp-vm bat-ptl-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161596v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161596v1/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566">Intel XE#6566</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b -&gt; xe-pw-161596v1</li>
</ul>
<p>IGT_8753: 8753<br />
  xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b: f9b2cabe33794dfc69b0a547516d9e2f45718f0b<br />
  xe-pw-161596v1: 161596v1</p>

</body>
</html>

--===============3653695430867566177==--

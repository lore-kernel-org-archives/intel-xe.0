Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489A8C53200
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 08:56:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0269D10E7F5;
	Fri, 20 Feb 2026 08:56:38 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06BC10E7F5;
 Fri, 20 Feb 2026 08:56:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2473017781233753323=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/guc=3A_Fail_immediat?=
 =?utf-8?q?ely_on_GuC_load_error?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Feb 2026 08:56:36 -0000
Message-ID: <177157779689.269473.17852319449169005704@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260219214529.1235106-2-daniele.ceraolospurio@intel.com>
In-Reply-To: <20260219214529.1235106-2-daniele.ceraolospurio@intel.com>
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

--===============2473017781233753323==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Fail immediately on GuC load error
URL   : https://patchwork.freedesktop.org/series/161860/
State : success

== Summary ==

CI Bug Log - changes from xe-4576-cc2c646d39200973cc76d0fa0851d73c9636c27c_BAT -> xe-pw-161860v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 14)
------------------------------

  Additional (1): bat-bmg-3 

Known issues
------------

  Here are the changes found in xe-pw-161860v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - bat-bmg-3:          NOTRUN -> [SKIP][1] ([Intel XE#6566]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v1/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  
  [Intel XE#6566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566


Build changes
-------------

  * IGT: IGT_8762 -> IGT_8763
  * Linux: xe-4576-cc2c646d39200973cc76d0fa0851d73c9636c27c -> xe-pw-161860v1

  IGT_8762: d3c67e0f1fa76ac3d71095825bbc9df0d307e4fc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8763: 8763
  xe-4576-cc2c646d39200973cc76d0fa0851d73c9636c27c: cc2c646d39200973cc76d0fa0851d73c9636c27c
  xe-pw-161860v1: 161860v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v1/index.html

--===============2473017781233753323==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Fail immediately on GuC load error</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161860/">https://patchwork.freedesktop.org/series/161860/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4576-cc2c646d39200973cc76d0fa0851d73c9636c27c_BAT -&gt; xe-pw-161860v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 14)</h2>
<p>Additional (1): bat-bmg-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161860v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v1/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566">Intel XE#6566</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8762 -&gt; IGT_8763</li>
<li>Linux: xe-4576-cc2c646d39200973cc76d0fa0851d73c9636c27c -&gt; xe-pw-161860v1</li>
</ul>
<p>IGT_8762: d3c67e0f1fa76ac3d71095825bbc9df0d307e4fc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8763: 8763<br />
  xe-4576-cc2c646d39200973cc76d0fa0851d73c9636c27c: cc2c646d39200973cc76d0fa0851d73c9636c27c<br />
  xe-pw-161860v1: 161860v1</p>

</body>
</html>

--===============2473017781233753323==--

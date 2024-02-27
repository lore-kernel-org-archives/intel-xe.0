Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DBCC5478C
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 06:23:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC6A10E5AF;
	Tue, 27 Feb 2024 06:23:07 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF52210E59F;
 Tue, 27 Feb 2024 06:23:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7631694305654561217=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_XE_HDCP_Enablement_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 Feb 2024 06:23:06 -0000
Message-ID: <170901498684.336701.11913658060162815001@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240227053204.1748920-1-suraj.kandpal@intel.com>
In-Reply-To: <20240227053204.1748920-1-suraj.kandpal@intel.com>
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

--===============7631694305654561217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: XE HDCP Enablement (rev6)
URL   : https://patchwork.freedesktop.org/series/129457/
State : failure

== Summary ==

CI Bug Log - changes from xe-855-b3552bf1e79de200a6ca49c518ead46a1256618c_BAT -> xe-pw-129457v6_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-129457v6_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-129457v6_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-129457v6_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind:
    - bat-pvc-2:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-855-b3552bf1e79de200a6ca49c518ead46a1256618c/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129457v6/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html

  


Build changes
-------------

  * Linux: xe-855-b3552bf1e79de200a6ca49c518ead46a1256618c -> xe-pw-129457v6

  IGT_7731: 17f897a81868fb35c6a7033a8b07256659742248 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-855-b3552bf1e79de200a6ca49c518ead46a1256618c: b3552bf1e79de200a6ca49c518ead46a1256618c
  xe-pw-129457v6: 129457v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129457v6/index.html

--===============7631694305654561217==
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
<tr><td><b>Series:</b></td><td>XE HDCP Enablement (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129457/">https://patchwork.freedesktop.org/series/129457/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129457v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129457v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-855-b3552bf1e79de200a6ca49c518ead46a1256618c_BAT -&gt; xe-pw-129457v6_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-129457v6_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-129457v6_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-129457v6_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-855-b3552bf1e79de200a6ca49c518ead46a1256618c/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129457v6/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-855-b3552bf1e79de200a6ca49c518ead46a1256618c -&gt; xe-pw-129457v6</li>
</ul>
<p>IGT_7731: 17f897a81868fb35c6a7033a8b07256659742248 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-855-b3552bf1e79de200a6ca49c518ead46a1256618c: b3552bf1e79de200a6ca49c518ead46a1256618c<br />
  xe-pw-129457v6: 129457v6</p>

</body>
</html>

--===============7631694305654561217==--

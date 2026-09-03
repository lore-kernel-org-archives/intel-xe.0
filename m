Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF77C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 17:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D1E10E142;
	Thu,  3 Sep 2026 17:46:06 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABBFC10E142;
 Thu,  3 Sep 2026 17:46:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3619197573230815178=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Add_memory_page_offlining_s?=
 =?utf-8?q?upport_=28rev25=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Sep 2026 17:46:04 -0000
Message-ID: <178845756469.119019.4688937311081622769@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260903161553.528932-17-tejas.upadhyay@intel.com>
In-Reply-To: <20260903161553.528932-17-tejas.upadhyay@intel.com>
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

--===============3619197573230815178==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add memory page offlining support (rev25)
URL   : https://patchwork.freedesktop.org/series/161473/
State : failure

== Summary ==

CI Bug Log - changes from xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34_BAT -> xe-pw-161473v25_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-161473v25_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-161473v25_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-161473v25_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_waitfence@engine:
    - bat-nvls-2:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/bat-nvls-2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v25/bat-nvls-2/igt@xe_waitfence@engine.html

  


Build changes
-------------

  * IGT: IGT_9082 -> IGT_9083
  * Linux: xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34 -> xe-pw-161473v25

  IGT_9082: 2d61f578d998115259b87f9fa27f597ce11a0c89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9083: 9083
  xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34: 76a34199970d93cfb3ed5dbbd745c23b6f0cff34
  xe-pw-161473v25: 161473v25

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v25/index.html

--===============3619197573230815178==
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
<tr><td><b>Series:</b></td><td>Add memory page offlining support (rev25)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161473/">https://patchwork.freedesktop.org/series/161473/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v25/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v25/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34_BAT -&gt; xe-pw-161473v25_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-161473v25_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-161473v25_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-161473v25_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/bat-nvls-2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v25/bat-nvls-2/igt@xe_waitfence@engine.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9082 -&gt; IGT_9083</li>
<li>Linux: xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34 -&gt; xe-pw-161473v25</li>
</ul>
<p>IGT_9082: 2d61f578d998115259b87f9fa27f597ce11a0c89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9083: 9083<br />
  xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34: 76a34199970d93cfb3ed5dbbd745c23b6f0cff34<br />
  xe-pw-161473v25: 161473v25</p>

</body>
</html>

--===============3619197573230815178==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37E7CD98EC
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 00:07:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F70E10ED14;
	Wed, 17 Jun 2026 00:07:45 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CCA210E8C7;
 Wed, 17 Jun 2026 00:07:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7616484349275184746=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/1?=
 =?utf-8?q?=5D_drm/xe/eustall=3A_Add_WA_14027054324_support_for_graphics_IP_?=
 =?utf-8?q?35=2E11?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harish Chegondi" <harish.chegondi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Jun 2026 00:07:45 -0000
Message-ID: <178165486517.86684.9274614555645933855@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <0bcb2f8bd8380544971d3036a01f28aaa8e9ffa7.1781650756.git.harish.chegondi@intel.com>
In-Reply-To: <0bcb2f8bd8380544971d3036a01f28aaa8e9ffa7.1781650756.git.harish.chegondi@intel.com>
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

--===============7616484349275184746==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/1] drm/xe/eustall: Add WA 14027054324 support for graphics IP 35.11
URL   : https://patchwork.freedesktop.org/series/168640/
State : success

== Summary ==

CI Bug Log - changes from xe-5269-29ea43790111df065ed84e6cb076c64322c306f1_BAT -> xe-pw-168640v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-wcl-2 

Known issues
------------

  Here are the changes found in xe-pw-168640v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-bmg-2:          [FAIL][1] ([Intel XE#6519]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5269-29ea43790111df065ed84e6cb076c64322c306f1/bat-bmg-2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168640v1/bat-bmg-2/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * Linux: xe-5269-29ea43790111df065ed84e6cb076c64322c306f1 -> xe-pw-168640v1

  IGT_8966: 9b33225c761bfe8c8c266bc56558d75c700029fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5269-29ea43790111df065ed84e6cb076c64322c306f1: 29ea43790111df065ed84e6cb076c64322c306f1
  xe-pw-168640v1: 168640v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168640v1/index.html

--===============7616484349275184746==
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
<tr><td><b>Series:</b></td><td>series starting with [1/1] drm/xe/eustall: Add WA 14027054324 support for graphics IP 35.11</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168640/">https://patchwork.freedesktop.org/series/168640/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168640v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168640v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5269-29ea43790111df065ed84e6cb076c64322c306f1_BAT -&gt; xe-pw-168640v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-wcl-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-168640v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5269-29ea43790111df065ed84e6cb076c64322c306f1/bat-bmg-2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168640v1/bat-bmg-2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5269-29ea43790111df065ed84e6cb076c64322c306f1 -&gt; xe-pw-168640v1</li>
</ul>
<p>IGT_8966: 9b33225c761bfe8c8c266bc56558d75c700029fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5269-29ea43790111df065ed84e6cb076c64322c306f1: 29ea43790111df065ed84e6cb076c64322c306f1<br />
  xe-pw-168640v1: 168640v1</p>

</body>
</html>

--===============7616484349275184746==--

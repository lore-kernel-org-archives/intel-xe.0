Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58233C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 15:41:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047C910F299;
	Wed,  2 Sep 2026 15:41:38 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1AF210F296;
 Wed,  2 Sep 2026 15:41:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7616139871601673974=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_Reset_u?=
 =?utf-8?q?se=5Fflipq_when_duplicating_crtc_state?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Sep 2026 15:41:36 -0000
Message-ID: <178836369685.112573.1327606926103540272@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260902140848.915941-1-mika.kahola@intel.com>
In-Reply-To: <20260902140848.915941-1-mika.kahola@intel.com>
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

--===============7616139871601673974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Reset use_flipq when duplicating crtc state
URL   : https://patchwork.freedesktop.org/series/173216/
State : success

== Summary ==

CI Bug Log - changes from xe-5674-3cd9a8edf7ff9738720597bd26bdb4a94a568143_BAT -> xe-pw-173216v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-173216v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-ptl-2:          [FAIL][1] -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5674-3cd9a8edf7ff9738720597bd26bdb4a94a568143/bat-ptl-2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173216v1/bat-ptl-2/igt@xe_waitfence@engine.html

  


Build changes
-------------

  * Linux: xe-5674-3cd9a8edf7ff9738720597bd26bdb4a94a568143 -> xe-pw-173216v1

  IGT_9079: 9079
  xe-5674-3cd9a8edf7ff9738720597bd26bdb4a94a568143: 3cd9a8edf7ff9738720597bd26bdb4a94a568143
  xe-pw-173216v1: 173216v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173216v1/index.html

--===============7616139871601673974==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Reset use_flipq when duplicating crtc state</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173216/">https://patchwork.freedesktop.org/series/173216/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173216v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173216v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5674-3cd9a8edf7ff9738720597bd26bdb4a94a568143_BAT -&gt; xe-pw-173216v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-173216v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5674-3cd9a8edf7ff9738720597bd26bdb4a94a568143/bat-ptl-2/igt@xe_waitfence@engine.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173216v1/bat-ptl-2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5674-3cd9a8edf7ff9738720597bd26bdb4a94a568143 -&gt; xe-pw-173216v1</li>
</ul>
<p>IGT_9079: 9079<br />
  xe-5674-3cd9a8edf7ff9738720597bd26bdb4a94a568143: 3cd9a8edf7ff9738720597bd26bdb4a94a568143<br />
  xe-pw-173216v1: 173216v1</p>

</body>
</html>

--===============7616139871601673974==--

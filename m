Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70086C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 18:28:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207EC10E4FF;
	Wed,  2 Sep 2026 18:28:21 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF7F10E4FF;
 Wed,  2 Sep 2026 18:28:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3209967533413991255=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_perf=3A_Add_some_null_ptr_c?=
 =?utf-8?q?hecks_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Sep 2026 18:28:19 -0000
Message-ID: <178837369930.112572.13346868739315659278@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260902154852.742844-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20260902154852.742844-1-vinay.belgaumkar@intel.com>
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

--===============3209967533413991255==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: perf: Add some null ptr checks (rev3)
URL   : https://patchwork.freedesktop.org/series/173178/
State : success

== Summary ==

CI Bug Log - changes from xe-5676-9a6566667a8b712e9b28a1469c282187a6d043c7_BAT -> xe-pw-173178v3_BAT
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

  Here are the changes found in xe-pw-173178v3_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-ptl-2:          [FAIL][1] -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5676-9a6566667a8b712e9b28a1469c282187a6d043c7/bat-ptl-2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173178v3/bat-ptl-2/igt@xe_waitfence@engine.html
    - bat-wcl-1:          [FAIL][3] ([Intel XE#9103]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5676-9a6566667a8b712e9b28a1469c282187a6d043c7/bat-wcl-1/igt@xe_waitfence@engine.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173178v3/bat-wcl-1/igt@xe_waitfence@engine.html

  * igt@xe_waitfence@reltime:
    - bat-wcl-1:          [FAIL][5] -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5676-9a6566667a8b712e9b28a1469c282187a6d043c7/bat-wcl-1/igt@xe_waitfence@reltime.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173178v3/bat-wcl-1/igt@xe_waitfence@reltime.html

  
  [Intel XE#9103]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9103


Build changes
-------------

  * Linux: xe-5676-9a6566667a8b712e9b28a1469c282187a6d043c7 -> xe-pw-173178v3

  IGT_9080: 65c1a091179475c3f0cd925799b49f58720bcf43 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5676-9a6566667a8b712e9b28a1469c282187a6d043c7: 9a6566667a8b712e9b28a1469c282187a6d043c7
  xe-pw-173178v3: 173178v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173178v3/index.html

--===============3209967533413991255==
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
<tr><td><b>Series:</b></td><td>perf: Add some null ptr checks (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173178/">https://patchwork.freedesktop.org/series/173178/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173178v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173178v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5676-9a6566667a8b712e9b28a1469c282187a6d043c7_BAT -&gt; xe-pw-173178v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-173178v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5676-9a6566667a8b712e9b28a1469c282187a6d043c7/bat-ptl-2/igt@xe_waitfence@engine.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173178v3/bat-ptl-2/igt@xe_waitfence@engine.html">PASS</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5676-9a6566667a8b712e9b28a1469c282187a6d043c7/bat-wcl-1/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9103">Intel XE#9103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173178v3/bat-wcl-1/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5676-9a6566667a8b712e9b28a1469c282187a6d043c7/bat-wcl-1/igt@xe_waitfence@reltime.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173178v3/bat-wcl-1/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5676-9a6566667a8b712e9b28a1469c282187a6d043c7 -&gt; xe-pw-173178v3</li>
</ul>
<p>IGT_9080: 65c1a091179475c3f0cd925799b49f58720bcf43 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5676-9a6566667a8b712e9b28a1469c282187a6d043c7: 9a6566667a8b712e9b28a1469c282187a6d043c7<br />
  xe-pw-173178v3: 173178v3</p>

</body>
</html>

--===============3209967533413991255==--

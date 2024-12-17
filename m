Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D50E7717F
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 01:57:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E94710E834;
	Tue, 17 Dec 2024 01:57:31 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534BC10E834;
 Tue, 17 Dec 2024 01:57:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3119966174158687394=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/pf=3A_Use_correct_fu?=
 =?utf-8?q?nction_to_check_LMEM_provisioning?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Dec 2024 01:57:30 -0000
Message-ID: <173440065033.3550471.2453792640445371636@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241216223253.819-1-michal.wajdeczko@intel.com>
In-Reply-To: <20241216223253.819-1-michal.wajdeczko@intel.com>
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

--===============3119966174158687394==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pf: Use correct function to check LMEM provisioning
URL   : https://patchwork.freedesktop.org/series/142678/
State : success

== Summary ==

CI Bug Log - changes from xe-2386-49cc582754c205bbe43d4ef2b1fd3894bee1f3bd_BAT -> xe-pw-142678v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-142678v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-dpms@a-edp1:
    - bat-lnl-1:          [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3729]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2386-49cc582754c205bbe43d4ef2b1fd3894bee1f3bd/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142678v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - bat-lnl-1:          [DMESG-WARN][3] ([Intel XE#3729]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2386-49cc582754c205bbe43d4ef2b1fd3894bee1f3bd/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142678v1/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  
  [Intel XE#3729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3729


Build changes
-------------

  * Linux: xe-2386-49cc582754c205bbe43d4ef2b1fd3894bee1f3bd -> xe-pw-142678v1

  IGT_8157: 48a70f6795e6d68b9fae275261ae3b09d3401fe1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2386-49cc582754c205bbe43d4ef2b1fd3894bee1f3bd: 49cc582754c205bbe43d4ef2b1fd3894bee1f3bd
  xe-pw-142678v1: 142678v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142678v1/index.html

--===============3119966174158687394==
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
<tr><td><b>Series:</b></td><td>drm/xe/pf: Use correct function to check LMEM provisioning</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142678/">https://patchwork.freedesktop.org/series/142678/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142678v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142678v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2386-49cc582754c205bbe43d4ef2b1fd3894bee1f3bd_BAT -&gt; xe-pw-142678v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142678v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-dpms@a-edp1:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2386-49cc582754c205bbe43d4ef2b1fd3894bee1f3bd/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142678v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3729">Intel XE#3729</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2386-49cc582754c205bbe43d4ef2b1fd3894bee1f3bd/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3729">Intel XE#3729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142678v1/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2386-49cc582754c205bbe43d4ef2b1fd3894bee1f3bd -&gt; xe-pw-142678v1</li>
</ul>
<p>IGT_8157: 48a70f6795e6d68b9fae275261ae3b09d3401fe1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2386-49cc582754c205bbe43d4ef2b1fd3894bee1f3bd: 49cc582754c205bbe43d4ef2b1fd3894bee1f3bd<br />
  xe-pw-142678v1: 142678v1</p>

</body>
</html>

--===============3119966174158687394==--

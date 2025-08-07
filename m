Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC15FC87FCF
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 15:44:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B90E10E176;
	Thu,  7 Aug 2025 15:44:36 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277D210E176;
 Thu,  7 Aug 2025 15:44:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7031398447142750876=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/hwmon=3A_Add_SW_clam?=
 =?utf-8?q?p_for_power_limits_writes_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 Aug 2025 15:44:35 -0000
Message-ID: <175458147515.220109.12352704475426219213@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250807140602.3247853-1-karthik.poosa@intel.com>
In-Reply-To: <20250807140602.3247853-1-karthik.poosa@intel.com>
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

--===============7031398447142750876==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/hwmon: Add SW clamp for power limits writes (rev3)
URL   : https://patchwork.freedesktop.org/series/152376/
State : success

== Summary ==

CI Bug Log - changes from xe-3514-922b0dea064e07d9d19f9241723debd67572b611_BAT -> xe-pw-152376v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 9)
------------------------------

  Additional (2): bat-ptl-1 bat-ptl-2 
  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-152376v3_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5765]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765
  [Intel XE#5766]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5766
  [Intel XE#5769]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5769
  [Intel XE#5771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771
  [Intel XE#5772]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5772
  [Intel XE#5773]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5773
  [Intel XE#5774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5774
  [Intel XE#5775]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775
  [Intel XE#5776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776
  [Intel XE#5777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777
  [Intel XE#5778]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5778
  [Intel XE#5780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780
  [Intel XE#5781]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5781
  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * Linux: xe-3514-922b0dea064e07d9d19f9241723debd67572b611 -> xe-pw-152376v3

  IGT_8488: c4a9bee161f4bb74cbbf81c73b24c416ecf93976 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3514-922b0dea064e07d9d19f9241723debd67572b611: 922b0dea064e07d9d19f9241723debd67572b611
  xe-pw-152376v3: 152376v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152376v3/index.html

--===============7031398447142750876==
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
<tr><td><b>Series:</b></td><td>drm/xe/hwmon: Add SW clamp for power limits writes (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152376/">https://patchwork.freedesktop.org/series/152376/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152376v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152376v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3514-922b0dea064e07d9d19f9241723debd67572b611_BAT -&gt; xe-pw-152376v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 9)</h2>
<p>Additional (2): bat-ptl-1 bat-ptl-2 <br />
  Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152376v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3514-922b0dea064e07d9d19f9241723debd67572b611 -&gt; xe-pw-152376v3</li>
</ul>
<p>IGT_8488: c4a9bee161f4bb74cbbf81c73b24c416ecf93976 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3514-922b0dea064e07d9d19f9241723debd67572b611: 922b0dea064e07d9d19f9241723debd67572b611<br />
  xe-pw-152376v3: 152376v3</p>

</body>
</html>

--===============7031398447142750876==--

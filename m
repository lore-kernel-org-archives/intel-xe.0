Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE5AC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 12:54:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 980F410FC42;
	Tue, 23 Apr 2024 12:54:57 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707C5113385;
 Tue, 23 Apr 2024 12:54:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0292558933865553799=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_avoid_the_async=5Fflip?=
 =?utf-8?q?_update_in_the_initial_plane_config_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Apr 2024 12:54:55 -0000
Message-ID: <171387689545.1608578.13525699094857833750@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240419140925.157924-1-vinod.govindapillai@intel.com>
In-Reply-To: <20240419140925.157924-1-vinod.govindapillai@intel.com>
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

--===============0292558933865553799==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: avoid the async_flip update in the initial plane config (rev2)
URL   : https://patchwork.freedesktop.org/series/132648/
State : success

== Summary ==

CI Bug Log - changes from xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf_BAT -> xe-pw-132648v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 5)
------------------------------

  Additional (1): bat-lnl-1 

Known issues
------------

  Here are the changes found in xe-pw-132648v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][1] ([Intel XE#616]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132648v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1442
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1462]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_7816 -> IGT_7818
  * Linux: xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf -> xe-pw-132648v2

  IGT_7816: 2e8f3e06fbd7335cf65a93115c72f0e167a570a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7818: 8e68eb5f6393f1be25ff775c094b427243a6a403 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf: 861eed75446fe9dbac9d28d11f44caa47cebeebf
  xe-pw-132648v2: 132648v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132648v2/index.html

--===============0292558933865553799==
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
<tr><td><b>Series:</b></td><td>drm/xe: avoid the async_flip update in the initial plane config (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132648/">https://patchwork.freedesktop.org/series/132648/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132648v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132648v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf_BAT -&gt; xe-pw-132648v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 5)</h2>
<p>Additional (1): bat-lnl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132648v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132648v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7816 -&gt; IGT_7818</li>
<li>Linux: xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf -&gt; xe-pw-132648v2</li>
</ul>
<p>IGT_7816: 2e8f3e06fbd7335cf65a93115c72f0e167a570a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7818: 8e68eb5f6393f1be25ff775c094b427243a6a403 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf: 861eed75446fe9dbac9d28d11f44caa47cebeebf<br />
  xe-pw-132648v2: 132648v2</p>

</body>
</html>

--===============0292558933865553799==--

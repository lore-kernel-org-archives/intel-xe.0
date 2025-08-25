Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A583ECA0EFA
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 16:40:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB1310E502;
	Mon, 25 Aug 2025 16:40:15 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A0310E502;
 Mon, 25 Aug 2025 16:40:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1027303177447655639=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Don=27t_trigger_r?=
 =?utf-8?q?ebind_on_initial_dma-buf_validation_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 Aug 2025 16:40:14 -0000
Message-ID: <175614001492.267285.4244460829846604385@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250825152841.3837378-1-matthew.brost@intel.com>
In-Reply-To: <20250825152841.3837378-1-matthew.brost@intel.com>
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

--===============1027303177447655639==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Don't trigger rebind on initial dma-buf validation (rev2)
URL   : https://patchwork.freedesktop.org/series/153420/
State : success

== Summary ==

CI Bug Log - changes from xe-3612-f1bad25fa12671f09a9afaeba55789eb519c1eb2_BAT -> xe-pw-153420v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-153420v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_vm@bind-execqueues-independent:
    - {bat-ptl-vm}:       [FAIL][1] ([Intel XE#5783]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3612-f1bad25fa12671f09a9afaeba55789eb519c1eb2/bat-ptl-vm/igt@xe_vm@bind-execqueues-independent.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153420v2/bat-ptl-vm/igt@xe_vm@bind-execqueues-independent.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * Linux: xe-3612-f1bad25fa12671f09a9afaeba55789eb519c1eb2 -> xe-pw-153420v2

  IGT_8506: 7d64f83f6d40ca187e9f317007c03db9d8b34ffb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3612-f1bad25fa12671f09a9afaeba55789eb519c1eb2: f1bad25fa12671f09a9afaeba55789eb519c1eb2
  xe-pw-153420v2: 153420v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153420v2/index.html

--===============1027303177447655639==
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
<tr><td><b>Series:</b></td><td>drm/xe: Don&#x27;t trigger rebind on initial dma-buf validation (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153420/">https://patchwork.freedesktop.org/series/153420/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153420v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153420v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3612-f1bad25fa12671f09a9afaeba55789eb519c1eb2_BAT -&gt; xe-pw-153420v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-153420v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_vm@bind-execqueues-independent:<ul>
<li>{bat-ptl-vm}:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3612-f1bad25fa12671f09a9afaeba55789eb519c1eb2/bat-ptl-vm/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783">Intel XE#5783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153420v2/bat-ptl-vm/igt@xe_vm@bind-execqueues-independent.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3612-f1bad25fa12671f09a9afaeba55789eb519c1eb2 -&gt; xe-pw-153420v2</li>
</ul>
<p>IGT_8506: 7d64f83f6d40ca187e9f317007c03db9d8b34ffb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3612-f1bad25fa12671f09a9afaeba55789eb519c1eb2: f1bad25fa12671f09a9afaeba55789eb519c1eb2<br />
  xe-pw-153420v2: 153420v2</p>

</body>
</html>

--===============1027303177447655639==--

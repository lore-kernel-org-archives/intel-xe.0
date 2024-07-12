Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48297C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 17:35:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F7E10E14A;
	Fri, 12 Jul 2024 17:35:28 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C28210E14A;
 Fri, 12 Jul 2024 17:35:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7589420335300190701=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/guc=3A_Add_GuC_based_regi?=
 =?utf-8?q?ster_capture_for_error_capture_=28rev12=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Jul 2024 17:35:27 -0000
Message-ID: <172080572723.183312.14100467142448556148@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240712164724.677393-1-zhanjun.dong@intel.com>
In-Reply-To: <20240712164724.677393-1-zhanjun.dong@intel.com>
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

--===============7589420335300190701==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Add GuC based register capture for error capture (rev12)
URL   : https://patchwork.freedesktop.org/series/128077/
State : success

== Summary ==

CI Bug Log - changes from xe-1604-adcacf4767b4529027ee41b499ab3ea459cda07a_BAT -> xe-pw-128077v12_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-128077v12_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-lnl-1:          [FAIL][1] ([Intel XE#886]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1604-adcacf4767b4529027ee41b499ab3ea459cda07a/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v12/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * Linux: xe-1604-adcacf4767b4529027ee41b499ab3ea459cda07a -> xe-pw-128077v12

  IGT_7926: 9c28c27d4d48cecf8b7692a2975bde1cc1632096 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1604-adcacf4767b4529027ee41b499ab3ea459cda07a: adcacf4767b4529027ee41b499ab3ea459cda07a
  xe-pw-128077v12: 128077v12

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v12/index.html

--===============7589420335300190701==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Add GuC based register capture for error capture (rev12)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128077/">https://patchwork.freedesktop.org/series/128077/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v12/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v12/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1604-adcacf4767b4529027ee41b499ab3ea459cda07a_BAT -&gt; xe-pw-128077v12_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-128077v12_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1604-adcacf4767b4529027ee41b499ab3ea459cda07a/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v12/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1604-adcacf4767b4529027ee41b499ab3ea459cda07a -&gt; xe-pw-128077v12</li>
</ul>
<p>IGT_7926: 9c28c27d4d48cecf8b7692a2975bde1cc1632096 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1604-adcacf4767b4529027ee41b499ab3ea459cda07a: adcacf4767b4529027ee41b499ab3ea459cda07a<br />
  xe-pw-128077v12: 128077v12</p>

</body>
</html>

--===============7589420335300190701==--

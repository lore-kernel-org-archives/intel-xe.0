Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57AEBC3DA61
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 23:14:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CDC10EB40;
	Thu, 18 Jul 2024 23:14:01 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A3110EB40;
 Thu, 18 Jul 2024 23:13:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4071313088102930565=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/huc=3A_Test_newer_HuC_blo?=
 =?utf-8?q?bs_for_LNL_and_BMG?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Jul 2024 23:13:59 -0000
Message-ID: <172134443984.287893.299501616023730162@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240718205712.2862494-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240718205712.2862494-1-daniele.ceraolospurio@intel.com>
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

--===============4071313088102930565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/huc: Test newer HuC blobs for LNL and BMG
URL   : https://patchwork.freedesktop.org/series/136260/
State : success

== Summary ==

CI Bug Log - changes from xe-1628-850787566dc6476dc652cd3a823244d33ec1ce40_BAT -> xe-pw-136260v1_BAT
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

  Here are the changes found in xe-pw-136260v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_gt_freq@freq_fixed_idle:
    - {bat-lnl-2}:        [FAIL][1] ([Intel XE#2262]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1628-850787566dc6476dc652cd3a823244d33ec1ce40/bat-lnl-2/igt@xe_gt_freq@freq_fixed_idle.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136260v1/bat-lnl-2/igt@xe_gt_freq@freq_fixed_idle.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#2262]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2262


Build changes
-------------

  * Linux: xe-1628-850787566dc6476dc652cd3a823244d33ec1ce40 -> xe-pw-136260v1

  IGT_7930: 7930
  xe-1628-850787566dc6476dc652cd3a823244d33ec1ce40: 850787566dc6476dc652cd3a823244d33ec1ce40
  xe-pw-136260v1: 136260v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136260v1/index.html

--===============4071313088102930565==
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
<tr><td><b>Series:</b></td><td>drm/xe/huc: Test newer HuC blobs for LNL and BMG</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136260/">https://patchwork.freedesktop.org/series/136260/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136260v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136260v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1628-850787566dc6476dc652cd3a823244d33ec1ce40_BAT -&gt; xe-pw-136260v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136260v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_gt_freq@freq_fixed_idle:<ul>
<li>{bat-lnl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1628-850787566dc6476dc652cd3a823244d33ec1ce40/bat-lnl-2/igt@xe_gt_freq@freq_fixed_idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2262">Intel XE#2262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136260v1/bat-lnl-2/igt@xe_gt_freq@freq_fixed_idle.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1628-850787566dc6476dc652cd3a823244d33ec1ce40 -&gt; xe-pw-136260v1</li>
</ul>
<p>IGT_7930: 7930<br />
  xe-1628-850787566dc6476dc652cd3a823244d33ec1ce40: 850787566dc6476dc652cd3a823244d33ec1ce40<br />
  xe-pw-136260v1: 136260v1</p>

</body>
</html>

--===============4071313088102930565==--

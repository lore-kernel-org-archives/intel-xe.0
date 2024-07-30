Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192E5C3DA70
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jul 2024 19:28:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C8610E576;
	Tue, 30 Jul 2024 19:28:00 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601A710E576;
 Tue, 30 Jul 2024 19:28:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4540591092793761276=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/guc=3A_Pick_GuC_from_CI_f?=
 =?utf-8?q?older_for_LNL=2C_BMG=2C_PVC?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 30 Jul 2024 19:28:00 -0000
Message-ID: <172236768038.446353.3372498305828813875@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240730184309.2939144-1-julia.filipchuk@intel.com>
In-Reply-To: <20240730184309.2939144-1-julia.filipchuk@intel.com>
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

--===============4540591092793761276==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Pick GuC from CI folder for LNL, BMG, PVC
URL   : https://patchwork.freedesktop.org/series/136692/
State : success

== Summary ==

CI Bug Log - changes from xe-1691-acd846e309e206a4dbc83e4b857b6604aa0741af_BAT -> xe-pw-136692v1_BAT
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

  Here are the changes found in xe-pw-136692v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_gt_freq@freq_basic_api:
    - bat-adlp-7:         [FAIL][1] ([Intel XE#2196]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1691-acd846e309e206a4dbc83e4b857b6604aa0741af/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v1/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html

  
  [Intel XE#2196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2196


Build changes
-------------

  * Linux: xe-1691-acd846e309e206a4dbc83e4b857b6604aa0741af -> xe-pw-136692v1

  IGT_7942: 0f02dc176959e6296866b1bafd3982e277a5e44b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1691-acd846e309e206a4dbc83e4b857b6604aa0741af: acd846e309e206a4dbc83e4b857b6604aa0741af
  xe-pw-136692v1: 136692v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v1/index.html

--===============4540591092793761276==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Pick GuC from CI folder for LNL, BMG, PVC</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136692/">https://patchwork.freedesktop.org/series/136692/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1691-acd846e309e206a4dbc83e4b857b6604aa0741af_BAT -&gt; xe-pw-136692v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136692v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_gt_freq@freq_basic_api:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1691-acd846e309e206a4dbc83e4b857b6604aa0741af/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2196">Intel XE#2196</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136692v1/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1691-acd846e309e206a4dbc83e4b857b6604aa0741af -&gt; xe-pw-136692v1</li>
</ul>
<p>IGT_7942: 0f02dc176959e6296866b1bafd3982e277a5e44b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1691-acd846e309e206a4dbc83e4b857b6604aa0741af: acd846e309e206a4dbc83e4b857b6604aa0741af<br />
  xe-pw-136692v1: 136692v1</p>

</body>
</html>

--===============4540591092793761276==--

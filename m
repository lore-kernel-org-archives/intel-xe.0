Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24C410A88FC
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 18:25:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66DAA10EB9D;
	Thu, 26 Mar 2026 18:25:07 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC1C10E2A8;
 Thu, 26 Mar 2026 18:25:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3163933361198986376=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe=3A_Set_GT_rp_min_fr?=
 =?utf-8?q?equency_as_1=2E2GHz_default_for_BMG/CRI_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Mar 2026 18:25:06 -0000
Message-ID: <177454950610.403161.16980901391584418414@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260326063407.985568-3-naresh.kumar.g@intel.com>
In-Reply-To: <20260326063407.985568-3-naresh.kumar.g@intel.com>
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

--===============3163933361198986376==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Set GT rp min frequency as 1.2GHz default for BMG/CRI (rev4)
URL   : https://patchwork.freedesktop.org/series/161656/
State : success

== Summary ==

CI Bug Log - changes from xe-4788-817e894dd8588c9eee61b1fbd743859ddba35f78_FULL -> xe-pw-161656v4_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-161656v4_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][1] -> [FAIL][2] ([Intel XE#2142]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4788-817e894dd8588c9eee61b1fbd743859ddba35f78/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161656v4/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  
#### Possible fixes ####

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][3] ([Intel XE#4459]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4788-817e894dd8588c9eee61b1fbd743859ddba35f78/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161656v4/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459


Build changes
-------------

  * Linux: xe-4788-817e894dd8588c9eee61b1fbd743859ddba35f78 -> xe-pw-161656v4

  IGT_8831: 8831
  xe-4788-817e894dd8588c9eee61b1fbd743859ddba35f78: 817e894dd8588c9eee61b1fbd743859ddba35f78
  xe-pw-161656v4: 161656v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161656v4/index.html

--===============3163933361198986376==
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
<tr><td><b>Series:</b></td><td>drm/xe: Set GT rp min frequency as 1.2GHz default for BMG/CRI (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161656/">https://patchwork.freedesktop.org/series/161656/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161656v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161656v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4788-817e894dd8588c9eee61b1fbd743859ddba35f78_FULL -&gt; xe-pw-161656v4_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161656v4_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4788-817e894dd8588c9eee61b1fbd743859ddba35f78/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161656v4/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_vrr@cmrr@pipe-a-edp-1:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4788-817e894dd8588c9eee61b1fbd743859ddba35f78/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161656v4/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4788-817e894dd8588c9eee61b1fbd743859ddba35f78 -&gt; xe-pw-161656v4</li>
</ul>
<p>IGT_8831: 8831<br />
  xe-4788-817e894dd8588c9eee61b1fbd743859ddba35f78: 817e894dd8588c9eee61b1fbd743859ddba35f78<br />
  xe-pw-161656v4: 161656v4</p>

</body>
</html>

--===============3163933361198986376==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AE1C3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jul 2024 07:29:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8AE610E39E;
	Mon, 22 Jul 2024 07:29:22 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0736E10E39E;
 Mon, 22 Jul 2024 07:29:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0368362028048392148=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Fix_null_pointer_error_in_HDCP_c?=
 =?utf-8?q?apability_check_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 22 Jul 2024 07:29:19 -0000
Message-ID: <172163335902.326615.3069513301394617006@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240722064451.3610512-1-suraj.kandpal@intel.com>
In-Reply-To: <20240722064451.3610512-1-suraj.kandpal@intel.com>
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

--===============0368362028048392148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix null pointer error in HDCP capability check (rev3)
URL   : https://patchwork.freedesktop.org/series/136317/
State : success

== Summary ==

CI Bug Log - changes from xe-1640-db63d8686a4f33822041ab54c0c2c85b9cbefae4_BAT -> xe-pw-136317v3_BAT
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

  Here are the changes found in xe-pw-136317v3_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_gt_freq@freq_basic_api:
    - {bat-lnl-2}:        [FAIL][1] ([Intel XE#2196]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1640-db63d8686a4f33822041ab54c0c2c85b9cbefae4/bat-lnl-2/igt@xe_gt_freq@freq_basic_api.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136317v3/bat-lnl-2/igt@xe_gt_freq@freq_basic_api.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#2196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2196


Build changes
-------------

  * Linux: xe-1640-db63d8686a4f33822041ab54c0c2c85b9cbefae4 -> xe-pw-136317v3

  IGT_7933: 7933
  xe-1640-db63d8686a4f33822041ab54c0c2c85b9cbefae4: db63d8686a4f33822041ab54c0c2c85b9cbefae4
  xe-pw-136317v3: 136317v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136317v3/index.html

--===============0368362028048392148==
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
<tr><td><b>Series:</b></td><td>Fix null pointer error in HDCP capability check (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136317/">https://patchwork.freedesktop.org/series/136317/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136317v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136317v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1640-db63d8686a4f33822041ab54c0c2c85b9cbefae4_BAT -&gt; xe-pw-136317v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136317v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_gt_freq@freq_basic_api:<ul>
<li>{bat-lnl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1640-db63d8686a4f33822041ab54c0c2c85b9cbefae4/bat-lnl-2/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2196">Intel XE#2196</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136317v3/bat-lnl-2/igt@xe_gt_freq@freq_basic_api.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1640-db63d8686a4f33822041ab54c0c2c85b9cbefae4 -&gt; xe-pw-136317v3</li>
</ul>
<p>IGT_7933: 7933<br />
  xe-1640-db63d8686a4f33822041ab54c0c2c85b9cbefae4: db63d8686a4f33822041ab54c0c2c85b9cbefae4<br />
  xe-pw-136317v3: 136317v3</p>

</body>
</html>

--===============0368362028048392148==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3AA2C3DA63
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 00:26:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB94710E090;
	Wed, 24 Jul 2024 00:26:24 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547C010E090;
 Wed, 24 Jul 2024 00:26:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8137773296215767325=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/xe2=3A_Enable_Priority_Me?=
 =?utf-8?q?m_Read_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pallavi Mishra" <pallavi.mishra@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Jul 2024 00:26:23 -0000
Message-ID: <172178078333.360927.1539802524255903464@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240723233131.1122655-1-pallavi.mishra@intel.com>
In-Reply-To: <20240723233131.1122655-1-pallavi.mishra@intel.com>
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

--===============8137773296215767325==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe2: Enable Priority Mem Read (rev6)
URL   : https://patchwork.freedesktop.org/series/134038/
State : success

== Summary ==

CI Bug Log - changes from xe-1653-b4f66aefb5cd89dc39e187d6c622f1493630eb08_BAT -> xe-pw-134038v6_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (6 -> 6)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-134038v6_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_gt_freq@freq_basic_api:
    - bat-adlp-7:         [FAIL][1] ([Intel XE#2196]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1653-b4f66aefb5cd89dc39e187d6c622f1493630eb08/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v6/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html

  
  [Intel XE#2196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2196


Build changes
-------------

  * Linux: xe-1653-b4f66aefb5cd89dc39e187d6c622f1493630eb08 -> xe-pw-134038v6

  IGT_7936: 7936
  xe-1653-b4f66aefb5cd89dc39e187d6c622f1493630eb08: b4f66aefb5cd89dc39e187d6c622f1493630eb08
  xe-pw-134038v6: 134038v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v6/index.html

--===============8137773296215767325==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe2: Enable Priority Mem Read (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134038/">https://patchwork.freedesktop.org/series/134038/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1653-b4f66aefb5cd89dc39e187d6c622f1493630eb08_BAT -&gt; xe-pw-134038v6_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (6 -&gt; 6)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-134038v6_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_gt_freq@freq_basic_api:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1653-b4f66aefb5cd89dc39e187d6c622f1493630eb08/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2196">Intel XE#2196</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v6/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1653-b4f66aefb5cd89dc39e187d6c622f1493630eb08 -&gt; xe-pw-134038v6</li>
</ul>
<p>IGT_7936: 7936<br />
  xe-1653-b4f66aefb5cd89dc39e187d6c622f1493630eb08: b4f66aefb5cd89dc39e187d6c622f1493630eb08<br />
  xe-pw-134038v6: 134038v6</p>

</body>
</html>

--===============8137773296215767325==--

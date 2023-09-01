Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3C4CA0FE1
	for <intel-xe@archiver.kernel.org>; Fri,  1 Sep 2023 13:49:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E1B510E7D5;
	Fri,  1 Sep 2023 13:49:09 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9919210E7D5;
 Fri,  1 Sep 2023 13:49:07 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8E5D9AADD8;
 Fri,  1 Sep 2023 13:49:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1809661381751971847=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Date: Fri, 01 Sep 2023 13:49:07 -0000
Message-ID: <169357614754.9813.15052215035316423340@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230901125950.76088-1-vinod.govindapillai@intel.com>
In-Reply-To: <20230901125950.76088-1-vinod.govindapillai@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_fbc_on_an?=
 =?utf-8?q?y_plane_=28rev3=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============1809661381751971847==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: fbc on any plane (rev3)
URL   : https://patchwork.freedesktop.org/series/122957/
State : success

== Summary ==

CI Bug Log - changes from xe-353-e4a0387635ffa6ccbc6207c9195896bcc4e59de2_BAT -> xe-pw-122957v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-122957v3_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         [FAIL][1] ([Intel XE#480]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-353-e4a0387635ffa6ccbc6207c9195896bcc4e59de2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122957v3/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480


Build changes
-------------

  * IGT: IGT_7463 -> IGT_7464
  * Linux: xe-353-e4a0387635ffa6ccbc6207c9195896bcc4e59de2 -> xe-pw-122957v3

  IGT_7463: 7463
  IGT_7464: 7464
  xe-353-e4a0387635ffa6ccbc6207c9195896bcc4e59de2: e4a0387635ffa6ccbc6207c9195896bcc4e59de2
  xe-pw-122957v3: 122957v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe//index.html

--===============1809661381751971847==
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
<tr><td><b>Series:</b></td><td>fbc on any plane (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122957/">https://patchwork.freedesktop.org/series/122957/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe//index.html">https://intel-gfx-ci.01.org/tree/intel-xe//index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-353-e4a0387635ffa6ccbc6207c9195896bcc4e59de2_BAT -&gt; xe-pw-122957v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-122957v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-353-e4a0387635ffa6ccbc6207c9195896bcc4e59de2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122957v3/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7463 -&gt; IGT_7464</li>
<li>Linux: xe-353-e4a0387635ffa6ccbc6207c9195896bcc4e59de2 -&gt; xe-pw-122957v3</li>
</ul>
<p>IGT_7463: 7463<br />
  IGT_7464: 7464<br />
  xe-353-e4a0387635ffa6ccbc6207c9195896bcc4e59de2: e4a0387635ffa6ccbc6207c9195896bcc4e59de2<br />
  xe-pw-122957v3: 122957v3</p>

</body>
</html>

--===============1809661381751971847==--

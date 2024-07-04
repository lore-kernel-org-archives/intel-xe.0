Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB675C30653
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jul 2024 07:04:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93DD210E0CE;
	Thu,  4 Jul 2024 07:04:41 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFBF10E0CE;
 Thu,  4 Jul 2024 07:04:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1282664078279140424=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/xe2lpg=3A_Extend_workarou?=
 =?utf-8?q?nd_14021402888_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Jul 2024 07:04:40 -0000
Message-ID: <172007668063.27753.1658799028531191724@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240703090754.1323647-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20240703090754.1323647-1-krishnaiah.bommu@intel.com>
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

--===============1282664078279140424==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe2lpg: Extend workaround 14021402888 (rev2)
URL   : https://patchwork.freedesktop.org/series/135688/
State : success

== Summary ==

CI Bug Log - changes from xe-1558-73af7ac6d6ae23cd3f24b60e6ebaa3a81b2b1d5b_BAT -> xe-pw-135688v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-135688v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - {bat-lnl-1}:        [FAIL][1] ([Intel XE#886]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1558-73af7ac6d6ae23cd3f24b60e6ebaa3a81b2b1d5b/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135688v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * Linux: xe-1558-73af7ac6d6ae23cd3f24b60e6ebaa3a81b2b1d5b -> xe-pw-135688v2

  IGT_7911: d0d71f374c95a89a3bdcd104c7d8c2043f79e37a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1558-73af7ac6d6ae23cd3f24b60e6ebaa3a81b2b1d5b: 73af7ac6d6ae23cd3f24b60e6ebaa3a81b2b1d5b
  xe-pw-135688v2: 135688v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135688v2/index.html

--===============1282664078279140424==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe2lpg: Extend workaround 14021402888 (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135688/">https://patchwork.freedesktop.org/series/135688/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135688v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135688v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1558-73af7ac6d6ae23cd3f24b60e6ebaa3a81b2b1d5b_BAT -&gt; xe-pw-135688v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135688v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1558-73af7ac6d6ae23cd3f24b60e6ebaa3a81b2b1d5b/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135688v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1558-73af7ac6d6ae23cd3f24b60e6ebaa3a81b2b1d5b -&gt; xe-pw-135688v2</li>
</ul>
<p>IGT_7911: d0d71f374c95a89a3bdcd104c7d8c2043f79e37a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1558-73af7ac6d6ae23cd3f24b60e6ebaa3a81b2b1d5b: 73af7ac6d6ae23cd3f24b60e6ebaa3a81b2b1d5b<br />
  xe-pw-135688v2: 135688v2</p>

</body>
</html>

--===============1282664078279140424==--

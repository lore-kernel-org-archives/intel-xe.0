Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8BFCED624
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 12:23:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 954AC10E494;
	Tue, 18 Nov 2025 12:23:44 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F376710E494;
 Tue, 18 Nov 2025 12:23:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8872505054693330058=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/uapi=3A_Add_NO=5FCOM?=
 =?utf-8?q?PRESSION_BO_flag_and_query_capability_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sanjay Yadav" <sanjay.kumar.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Nov 2025 12:23:42 -0000
Message-ID: <176346862298.5548.2535090937407925868@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251118111342.3366359-2-sanjay.kumar.yadav@intel.com>
In-Reply-To: <20251118111342.3366359-2-sanjay.kumar.yadav@intel.com>
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

--===============8872505054693330058==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/uapi: Add NO_COMPRESSION BO flag and query capability (rev3)
URL   : https://patchwork.freedesktop.org/series/157499/
State : success

== Summary ==

CI Bug Log - changes from xe-4121-91fc6d984707c9bfd4a60550e6a85f1a991e7ec8_BAT -> xe-pw-157499v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-157499v3_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [TIMEOUT][1] ([Intel XE#6506]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4121-91fc6d984707c9bfd4a60550e6a85f1a991e7ec8/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157499v3/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506


Build changes
-------------

  * IGT: IGT_8629 -> IGT_8630
  * Linux: xe-4121-91fc6d984707c9bfd4a60550e6a85f1a991e7ec8 -> xe-pw-157499v3

  IGT_8629: 3813b62c3c6200f69d6cc8be1c5e621243ace24f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8630: 8630
  xe-4121-91fc6d984707c9bfd4a60550e6a85f1a991e7ec8: 91fc6d984707c9bfd4a60550e6a85f1a991e7ec8
  xe-pw-157499v3: 157499v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157499v3/index.html

--===============8872505054693330058==
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
<tr><td><b>Series:</b></td><td>drm/xe/uapi: Add NO_COMPRESSION BO flag and query capability (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157499/">https://patchwork.freedesktop.org/series/157499/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157499v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157499v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4121-91fc6d984707c9bfd4a60550e6a85f1a991e7ec8_BAT -&gt; xe-pw-157499v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-157499v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4121-91fc6d984707c9bfd4a60550e6a85f1a991e7ec8/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157499v3/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8629 -&gt; IGT_8630</li>
<li>Linux: xe-4121-91fc6d984707c9bfd4a60550e6a85f1a991e7ec8 -&gt; xe-pw-157499v3</li>
</ul>
<p>IGT_8629: 3813b62c3c6200f69d6cc8be1c5e621243ace24f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8630: 8630<br />
  xe-4121-91fc6d984707c9bfd4a60550e6a85f1a991e7ec8: 91fc6d984707c9bfd4a60550e6a85f1a991e7ec8<br />
  xe-pw-157499v3: 157499v3</p>

</body>
</html>

--===============8872505054693330058==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78406C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 01:26:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1178110E0CC;
	Tue, 14 Nov 2023 01:26:38 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6D4A610E0CC;
 Tue, 14 Nov 2023 01:26:36 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 66E30A882E;
 Tue, 14 Nov 2023 01:26:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3043215553100817896=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Tue, 14 Nov 2023 01:26:36 -0000
Message-ID: <169992519638.29254.16530137761602628180@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231114004604.4439-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20231114004604.4439-1-niranjana.vishwanathapura@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/pv?=
 =?utf-8?q?c=3A_Enable_fixed_CCS_mode?=
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

--===============3043215553100817896==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pvc: Enable fixed CCS mode
URL   : https://patchwork.freedesktop.org/series/126365/
State : success

== Summary ==

CI Bug Log - changes from xe-488-7dc3dda9b2df5a5c8949532f254a0689de70f093_BAT -> xe-pw-126365v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-126365v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-adlp-7:         [FAIL][1] ([Intel XE#524]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-488-7dc3dda9b2df5a5c8949532f254a0689de70f093/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126365v1/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524


Build changes
-------------

  * Linux: xe-488-7dc3dda9b2df5a5c8949532f254a0689de70f093 -> xe-pw-126365v1

  IGT_7584: 30e6ded90039edde8aa6c435001f8d63159356bb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-488-7dc3dda9b2df5a5c8949532f254a0689de70f093: 7dc3dda9b2df5a5c8949532f254a0689de70f093
  xe-pw-126365v1: 126365v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126365v1/index.html

--===============3043215553100817896==
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
<tr><td><b>Series:</b></td><td>drm/xe/pvc: Enable fixed CCS mode</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126365/">https://patchwork.freedesktop.org/series/126365/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126365v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126365v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-488-7dc3dda9b2df5a5c8949532f254a0689de70f093_BAT -&gt; xe-pw-126365v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-126365v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>{igt@xe_create@create-execqueues-noleak}:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-488-7dc3dda9b2df5a5c8949532f254a0689de70f093/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126365v1/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-488-7dc3dda9b2df5a5c8949532f254a0689de70f093 -&gt; xe-pw-126365v1</li>
</ul>
<p>IGT_7584: 30e6ded90039edde8aa6c435001f8d63159356bb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-488-7dc3dda9b2df5a5c8949532f254a0689de70f093: 7dc3dda9b2df5a5c8949532f254a0689de70f093<br />
  xe-pw-126365v1: 126365v1</p>

</body>
</html>

--===============3043215553100817896==--

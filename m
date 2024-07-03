Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3DCC2BD09
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jul 2024 15:48:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A530710E0AD;
	Wed,  3 Jul 2024 15:48:34 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F207310E0AD;
 Wed,  3 Jul 2024 15:48:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7693485391982150048=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/uapi=3A_Rename_xe_perf_la?=
 =?utf-8?q?yer_as_xe_observation_layer?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Jul 2024 15:48:32 -0000
Message-ID: <172002171298.25710.1239305972552713794@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240702214034.2507446-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240702214034.2507446-1-ashutosh.dixit@intel.com>
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

--===============7693485391982150048==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/uapi: Rename xe perf layer as xe observation layer
URL   : https://patchwork.freedesktop.org/series/135667/
State : success

== Summary ==

CI Bug Log - changes from xe-1555-dd25375963487e160d842a560cea88d5fc0f8721_BAT -> xe-pw-135667v1_BAT
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

  Here are the changes found in xe-pw-135667v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_live_ktest@xe_migrate:
    - bat-pvc-2:          [SKIP][1] -> [PASS][2] +2 other tests pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1555-dd25375963487e160d842a560cea88d5fc0f8721/bat-pvc-2/igt@xe_live_ktest@xe_migrate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135667v1/bat-pvc-2/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_vm@munmap-style-unbind-end:
    - bat-pvc-2:          [DMESG-WARN][3] ([Intel XE#1705]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1555-dd25375963487e160d842a560cea88d5fc0f8721/bat-pvc-2/igt@xe_vm@munmap-style-unbind-end.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135667v1/bat-pvc-2/igt@xe_vm@munmap-style-unbind-end.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * Linux: xe-1555-dd25375963487e160d842a560cea88d5fc0f8721 -> xe-pw-135667v1

  IGT_7911: d0d71f374c95a89a3bdcd104c7d8c2043f79e37a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1555-dd25375963487e160d842a560cea88d5fc0f8721: dd25375963487e160d842a560cea88d5fc0f8721
  xe-pw-135667v1: 135667v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135667v1/index.html

--===============7693485391982150048==
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
<tr><td><b>Series:</b></td><td>drm/xe/uapi: Rename xe perf layer as xe observation layer</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135667/">https://patchwork.freedesktop.org/series/135667/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135667v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135667v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1555-dd25375963487e160d842a560cea88d5fc0f8721_BAT -&gt; xe-pw-135667v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135667v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1555-dd25375963487e160d842a560cea88d5fc0f8721/bat-pvc-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135667v1/bat-pvc-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-end:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1555-dd25375963487e160d842a560cea88d5fc0f8721/bat-pvc-2/igt@xe_vm@munmap-style-unbind-end.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705">Intel XE#1705</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135667v1/bat-pvc-2/igt@xe_vm@munmap-style-unbind-end.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1555-dd25375963487e160d842a560cea88d5fc0f8721 -&gt; xe-pw-135667v1</li>
</ul>
<p>IGT_7911: d0d71f374c95a89a3bdcd104c7d8c2043f79e37a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1555-dd25375963487e160d842a560cea88d5fc0f8721: dd25375963487e160d842a560cea88d5fc0f8721<br />
  xe-pw-135667v1: 135667v1</p>

</body>
</html>

--===============7693485391982150048==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08202E7AD44
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 16:46:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6EA110E430;
	Thu,  5 Oct 2023 16:46:35 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6B08910E430;
 Thu,  5 Oct 2023 16:46:32 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 654E1A00E8;
 Thu,  5 Oct 2023 16:46:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2473858471507810411=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Thu, 05 Oct 2023 16:46:32 -0000
Message-ID: <169652439237.7512.10137480178047278557@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231005143922.23206-1-jose.souza@intel.com>
In-Reply-To: <20231005143922.23206-1-jose.souza@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A?=
 =?utf-8?q?_Set_PTE=5FAE_for_smem_alocation_as_well?=
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

--===============2473858471507810411==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Set PTE_AE for smem alocation as well
URL   : https://patchwork.freedesktop.org/series/124665/
State : success

== Summary ==

CI Bug Log - changes from xe-415-3d2b298aaf52e74d4e90470cd65de047362e4875_BAT -> xe-pw-124665v1_BAT
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

  Here are the changes found in xe-pw-124665v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_store@basic-store:
    - bat-adlp-7:         [FAIL][1] ([Intel XE#761]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-415-3d2b298aaf52e74d4e90470cd65de047362e4875/bat-adlp-7/igt@xe_exec_store@basic-store.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124665v1/bat-adlp-7/igt@xe_exec_store@basic-store.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/761


Build changes
-------------

  * IGT: IGT_7512 -> IGT_7516
  * Linux: xe-415-3d2b298aaf52e74d4e90470cd65de047362e4875 -> xe-pw-124665v1

  IGT_7512: 2eb58faf82d3cd5e2e74154a7319cff56eb40762 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7516: 40b5a184f6da0a3295ee429947696d254522bb22 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-415-3d2b298aaf52e74d4e90470cd65de047362e4875: 3d2b298aaf52e74d4e90470cd65de047362e4875
  xe-pw-124665v1: 124665v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124665v1/index.html

--===============2473858471507810411==
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
<tr><td><b>Series:</b></td><td>drm/xe: Set PTE_AE for smem alocation as well</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124665/">https://patchwork.freedesktop.org/series/124665/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124665v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124665v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-415-3d2b298aaf52e74d4e90470cd65de047362e4875_BAT -&gt; xe-pw-124665v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-124665v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_store@basic-store:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-415-3d2b298aaf52e74d4e90470cd65de047362e4875/bat-adlp-7/igt@xe_exec_store@basic-store.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/761">Intel XE#761</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124665v1/bat-adlp-7/igt@xe_exec_store@basic-store.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7512 -&gt; IGT_7516</li>
<li>Linux: xe-415-3d2b298aaf52e74d4e90470cd65de047362e4875 -&gt; xe-pw-124665v1</li>
</ul>
<p>IGT_7512: 2eb58faf82d3cd5e2e74154a7319cff56eb40762 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7516: 40b5a184f6da0a3295ee429947696d254522bb22 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-415-3d2b298aaf52e74d4e90470cd65de047362e4875: 3d2b298aaf52e74d4e90470cd65de047362e4875<br />
  xe-pw-124665v1: 124665v1</p>

</body>
</html>

--===============2473858471507810411==--

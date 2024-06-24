Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0681C2BD09
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jun 2024 14:47:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B95610E490;
	Mon, 24 Jun 2024 14:47:23 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE1110E485;
 Mon, 24 Jun 2024 14:47:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0768461001750776993=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_add_wopcm_device_info_?=
 =?utf-8?q?and_set_region_into_Guc_registers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Farah Kassabri" <fkassabri@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Jun 2024 14:47:20 -0000
Message-ID: <171924044090.153309.15162404679084994787@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240624135954.99565-1-fkassabri@habana.ai>
In-Reply-To: <20240624135954.99565-1-fkassabri@habana.ai>
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

--===============0768461001750776993==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: add wopcm device info and set region into Guc registers (rev2)
URL   : https://patchwork.freedesktop.org/series/133879/
State : success

== Summary ==

CI Bug Log - changes from xe-1521-c0c1c2d3681c4a653c6b2122a8e8ef9fbaaa4398_BAT -> xe-pw-133879v2_BAT
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

  Here are the changes found in xe-pw-133879v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_module_load@load:
    - bat-adlp-7:         [PASS][1] -> [ABORT][2] ([Intel XE#1760])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1521-c0c1c2d3681c4a653c6b2122a8e8ef9fbaaa4398/bat-adlp-7/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v2/bat-adlp-7/igt@xe_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * IGT: IGT_7896 -> IGT_7897
  * Linux: xe-1521-c0c1c2d3681c4a653c6b2122a8e8ef9fbaaa4398 -> xe-pw-133879v2

  IGT_7896: 4e6d29ee4672a172227a58ba614ce6b50223f073 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7897: 9119f9c5dbbb969438b3424dc2f3b30f3b442aab @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1521-c0c1c2d3681c4a653c6b2122a8e8ef9fbaaa4398: c0c1c2d3681c4a653c6b2122a8e8ef9fbaaa4398
  xe-pw-133879v2: 133879v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v2/index.html

--===============0768461001750776993==
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
<tr><td><b>Series:</b></td><td>drm/xe: add wopcm device info and set region into Guc registers (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133879/">https://patchwork.freedesktop.org/series/133879/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1521-c0c1c2d3681c4a653c6b2122a8e8ef9fbaaa4398_BAT -&gt; xe-pw-133879v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133879v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1521-c0c1c2d3681c4a653c6b2122a8e8ef9fbaaa4398/bat-adlp-7/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v2/bat-adlp-7/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7896 -&gt; IGT_7897</li>
<li>Linux: xe-1521-c0c1c2d3681c4a653c6b2122a8e8ef9fbaaa4398 -&gt; xe-pw-133879v2</li>
</ul>
<p>IGT_7896: 4e6d29ee4672a172227a58ba614ce6b50223f073 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7897: 9119f9c5dbbb969438b3424dc2f3b30f3b442aab @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1521-c0c1c2d3681c4a653c6b2122a8e8ef9fbaaa4398: c0c1c2d3681c4a653c6b2122a8e8ef9fbaaa4398<br />
  xe-pw-133879v2: 133879v2</p>

</body>
</html>

--===============0768461001750776993==--

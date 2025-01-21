Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D481DC02182
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 10:23:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE3710E53D;
	Tue, 21 Jan 2025 10:23:57 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC8910E539;
 Tue, 21 Jan 2025 10:23:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3625063310118614526=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Extended_Wake_Timeout_=28re?=
 =?utf-8?q?v3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 Jan 2025 10:23:56 -0000
Message-ID: <173745503671.2554974.12249424773786493510@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250121060522.1296166-1-suraj.kandpal@intel.com>
In-Reply-To: <20250121060522.1296166-1-suraj.kandpal@intel.com>
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

--===============3625063310118614526==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Extended Wake Timeout (rev3)
URL   : https://patchwork.freedesktop.org/series/142516/
State : success

== Summary ==

CI Bug Log - changes from xe-2517-e48abf2c0aa4813a4629aeebd0547eb86f0f1a91_BAT -> xe-pw-142516v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-142516v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4078])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2517-e48abf2c0aa4813a4629aeebd0547eb86f0f1a91/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142516v3/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind.html

  
#### Possible fixes ####

  * igt@xe_pat@pat-index-xelp@render:
    - bat-adlp-vf:        [DMESG-WARN][3] ([Intel XE#3970] / [Intel XE#4078]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2517-e48abf2c0aa4813a4629aeebd0547eb86f0f1a91/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142516v3/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078


Build changes
-------------

  * IGT: IGT_8200 -> IGT_8201
  * Linux: xe-2517-e48abf2c0aa4813a4629aeebd0547eb86f0f1a91 -> xe-pw-142516v3

  IGT_8200: 5352b187076e89a9ff146cc1ecbd809aa20e4f91 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8201: dcc73646ce05a91bb4537e50ee6fa7ac5e8ff4ed @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2517-e48abf2c0aa4813a4629aeebd0547eb86f0f1a91: e48abf2c0aa4813a4629aeebd0547eb86f0f1a91
  xe-pw-142516v3: 142516v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142516v3/index.html

--===============3625063310118614526==
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
<tr><td><b>Series:</b></td><td>Extended Wake Timeout (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142516/">https://patchwork.freedesktop.org/series/142516/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142516v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142516v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2517-e48abf2c0aa4813a4629aeebd0547eb86f0f1a91_BAT -&gt; xe-pw-142516v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142516v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2517-e48abf2c0aa4813a4629aeebd0547eb86f0f1a91/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142516v3/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078">Intel XE#4078</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_pat@pat-index-xelp@render:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2517-e48abf2c0aa4813a4629aeebd0547eb86f0f1a91/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078">Intel XE#4078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142516v3/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8200 -&gt; IGT_8201</li>
<li>Linux: xe-2517-e48abf2c0aa4813a4629aeebd0547eb86f0f1a91 -&gt; xe-pw-142516v3</li>
</ul>
<p>IGT_8200: 5352b187076e89a9ff146cc1ecbd809aa20e4f91 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8201: dcc73646ce05a91bb4537e50ee6fa7ac5e8ff4ed @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2517-e48abf2c0aa4813a4629aeebd0547eb86f0f1a91: e48abf2c0aa4813a4629aeebd0547eb86f0f1a91<br />
  xe-pw-142516v3: 142516v3</p>

</body>
</html>

--===============3625063310118614526==--

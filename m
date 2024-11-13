Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8532FD41C27
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 10:12:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4100110E1B7;
	Wed, 13 Nov 2024 10:12:49 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D68E10E1B7;
 Wed, 13 Nov 2024 10:12:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5358292370219084005=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/xe=5Flrc=3A_Rename_desc_t?=
 =?utf-8?q?o_addr?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Nov 2024 10:12:48 -0000
Message-ID: <173149276817.3508171.3702427366384906508@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241112185515.64060-1-jonathan.cavitt@intel.com>
In-Reply-To: <20241112185515.64060-1-jonathan.cavitt@intel.com>
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

--===============5358292370219084005==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_lrc: Rename desc to addr
URL   : https://patchwork.freedesktop.org/series/141235/
State : success

== Summary ==

CI Bug Log - changes from xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b_BAT -> xe-pw-141235v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-141235v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-bmg-1:          [DMESG-WARN][1] ([Intel XE#877]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141235v1/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc.html

  
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * IGT: IGT_8104 -> IGT_8105
  * Linux: xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b -> xe-pw-141235v1

  IGT_8104: 5da2928391abd9625dd87b4a3fb6c35a54a0d948 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8105: 8105
  xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b: 26f5fe99791def93b32e27e79e71dbd0666c117b
  xe-pw-141235v1: 141235v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141235v1/index.html

--===============5358292370219084005==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_lrc: Rename desc to addr</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141235/">https://patchwork.freedesktop.org/series/141235/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141235v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141235v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b_BAT -&gt; xe-pw-141235v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141235v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pipe_crc_basic@hang-read-crc:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141235v1/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8104 -&gt; IGT_8105</li>
<li>Linux: xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b -&gt; xe-pw-141235v1</li>
</ul>
<p>IGT_8104: 5da2928391abd9625dd87b4a3fb6c35a54a0d948 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8105: 8105<br />
  xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b: 26f5fe99791def93b32e27e79e71dbd0666c117b<br />
  xe-pw-141235v1: 141235v1</p>

</body>
</html>

--===============5358292370219084005==--

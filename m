Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACF9C47258
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 20:37:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880D810FCF4;
	Wed, 31 Jan 2024 20:37:32 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E9D10FCEF;
 Wed, 31 Jan 2024 20:37:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2496233667203485182=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5Bv6=2C1/2?=
 =?utf-8?q?=5D_drm/xe=3A_add_a_new_debugfs_file_-_mmio?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Koby Elbaz" <kelbaz@habana.ai>
Date: Wed, 31 Jan 2024 20:37:31 -0000
Message-ID: <170673345103.878359.858101252642643364@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240131195953.852641-1-kelbaz@habana.ai>
In-Reply-To: <20240131195953.852641-1-kelbaz@habana.ai>
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

--===============2496233667203485182==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v6,1/2] drm/xe: add a new debugfs file - mmio
URL   : https://patchwork.freedesktop.org/series/129383/
State : success

== Summary ==

CI Bug Log - changes from xe-711-8327dc2a5a26f82a8700035c6259f57e9299d6a2_BAT -> xe-pw-129383v1_BAT
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

  Here are the changes found in xe-pw-129383v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_module_load@load:
    - bat-pvc-2:          [SKIP][1] ([Intel XE#378]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-711-8327dc2a5a26f82a8700035c6259f57e9299d6a2/bat-pvc-2/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129383v1/bat-pvc-2/igt@xe_module_load@load.html

  
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378


Build changes
-------------

  * Linux: xe-711-8327dc2a5a26f82a8700035c6259f57e9299d6a2 -> xe-pw-129383v1

  IGT_7699: 7699
  xe-711-8327dc2a5a26f82a8700035c6259f57e9299d6a2: 8327dc2a5a26f82a8700035c6259f57e9299d6a2
  xe-pw-129383v1: 129383v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129383v1/index.html

--===============2496233667203485182==
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
<tr><td><b>Series:</b></td><td>series starting with [v6,1/2] drm/xe: add a new debugfs file - mmio</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129383/">https://patchwork.freedesktop.org/series/129383/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129383v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129383v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-711-8327dc2a5a26f82a8700035c6259f57e9299d6a2_BAT -&gt; xe-pw-129383v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-129383v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-711-8327dc2a5a26f82a8700035c6259f57e9299d6a2/bat-pvc-2/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129383v1/bat-pvc-2/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-711-8327dc2a5a26f82a8700035c6259f57e9299d6a2 -&gt; xe-pw-129383v1</li>
</ul>
<p>IGT_7699: 7699<br />
  xe-711-8327dc2a5a26f82a8700035c6259f57e9299d6a2: 8327dc2a5a26f82a8700035c6259f57e9299d6a2<br />
  xe-pw-129383v1: 129383v1</p>

</body>
</html>

--===============2496233667203485182==--

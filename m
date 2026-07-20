Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEEEEC44520
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 17:45:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F33D10E20D;
	Mon, 20 Jul 2026 17:45:07 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B2C10E1EE;
 Mon, 20 Jul 2026 17:45:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0149990628024154961=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/display=3A_Transpara?=
 =?utf-8?q?nt_fallback_from_stolen_to_sysmem=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 20 Jul 2026 17:45:06 -0000
Message-ID: <178456950616.207655.17425753106858821942@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260720161451.384968-13-dev@lankhorst.se>
In-Reply-To: <20260720161451.384968-13-dev@lankhorst.se>
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

--===============0149990628024154961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: Transparant fallback from stolen to sysmem.
URL   : https://patchwork.freedesktop.org/series/170759/
State : success

== Summary ==

CI Bug Log - changes from xe-5440-a51267f4154e42c8bb10b2c6503eed320cfa861e_BAT -> xe-pw-170759v1_BAT
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

  Here are the changes found in xe-pw-170759v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_migrate:
    - bat-bmg-2:          [PASS][1] -> [FAIL][2] ([Intel XE#8539]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5440-a51267f4154e42c8bb10b2c6503eed320cfa861e/bat-bmg-2/igt@xe_live_ktest@xe_migrate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170759v1/bat-bmg-2/igt@xe_live_ktest@xe_migrate.html
    - bat-bmg-1:          [PASS][3] -> [FAIL][4] ([Intel XE#8539]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5440-a51267f4154e42c8bb10b2c6503eed320cfa861e/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170759v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-bmg-vm:         [PASS][5] -> [FAIL][6] ([Intel XE#8539]) +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5440-a51267f4154e42c8bb10b2c6503eed320cfa861e/bat-bmg-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170759v1/bat-bmg-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
  [Intel XE#8539]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8539


Build changes
-------------

  * Linux: xe-5440-a51267f4154e42c8bb10b2c6503eed320cfa861e -> xe-pw-170759v1

  IGT_9014: 6d3784ab505ea6a7917b191c0e060d5b4b0c2be7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5440-a51267f4154e42c8bb10b2c6503eed320cfa861e: a51267f4154e42c8bb10b2c6503eed320cfa861e
  xe-pw-170759v1: 170759v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170759v1/index.html

--===============0149990628024154961==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: Transparant fallback from stolen to sysmem.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170759/">https://patchwork.freedesktop.org/series/170759/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170759v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170759v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5440-a51267f4154e42c8bb10b2c6503eed320cfa861e_BAT -&gt; xe-pw-170759v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-170759v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5440-a51267f4154e42c8bb10b2c6503eed320cfa861e/bat-bmg-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170759v1/bat-bmg-2/igt@xe_live_ktest@xe_migrate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8539">Intel XE#8539</a>) +1 other test fail</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5440-a51267f4154e42c8bb10b2c6503eed320cfa861e/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170759v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8539">Intel XE#8539</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5440-a51267f4154e42c8bb10b2c6503eed320cfa861e/bat-bmg-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170759v1/bat-bmg-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8539">Intel XE#8539</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5440-a51267f4154e42c8bb10b2c6503eed320cfa861e -&gt; xe-pw-170759v1</li>
</ul>
<p>IGT_9014: 6d3784ab505ea6a7917b191c0e060d5b4b0c2be7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5440-a51267f4154e42c8bb10b2c6503eed320cfa861e: a51267f4154e42c8bb10b2c6503eed320cfa861e<br />
  xe-pw-170759v1: 170759v1</p>

</body>
</html>

--===============0149990628024154961==--

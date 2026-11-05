Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE40606A31B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 18:48:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C785310E974;
	Thu,  5 Nov 2026 18:48:24 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F54C10E96F;
 Thu,  5 Nov 2026 18:48:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1872431185428118182=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/display=3A_Transpara?=
 =?utf-8?q?nt_fallback_from_stolen_to_sysmem=2E_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Nov 2026 18:48:24 -0000
Message-ID: <179390450418.128232.8690708415076225419@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261105161444.593259-7-dev@lankhorst.se>
In-Reply-To: <20261105161444.593259-7-dev@lankhorst.se>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1872431185428118182==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: Transparant fallback from stolen to sysmem. (rev4)
URL   : https://patchwork.freedesktop.org/series/170759/
State : failure

== Summary ==

CI Bug Log - changes from xe-6070-0e8b43b5a5ef2dd52c454158e7fd8a927d796eb4_BAT -> xe-pw-170759v4_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-170759v4_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-170759v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-170759v4_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@xe_migrate:
    - bat-bmg-2:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6070-0e8b43b5a5ef2dd52c454158e7fd8a927d796eb4/bat-bmg-2/igt@xe_live_ktest@xe_migrate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170759v4/bat-bmg-2/igt@xe_live_ktest@xe_migrate.html
    - bat-bmg-1:          [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6070-0e8b43b5a5ef2dd52c454158e7fd8a927d796eb4/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170759v4/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-bmg-vm:         [PASS][5] -> [FAIL][6] +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6070-0e8b43b5a5ef2dd52c454158e7fd8a927d796eb4/bat-bmg-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170759v4/bat-bmg-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  


Build changes
-------------

  * IGT: IGT_9177 -> IGT_9179
  * Linux: xe-6070-0e8b43b5a5ef2dd52c454158e7fd8a927d796eb4 -> xe-pw-170759v4

  IGT_9177: 9177
  IGT_9179: 9179
  xe-6070-0e8b43b5a5ef2dd52c454158e7fd8a927d796eb4: 0e8b43b5a5ef2dd52c454158e7fd8a927d796eb4
  xe-pw-170759v4: 170759v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170759v4/index.html

--===============1872431185428118182==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: Transparant fallback from stolen to sysmem. (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170759/">https://patchwork.freedesktop.org/series/170759/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170759v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170759v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6070-0e8b43b5a5ef2dd52c454158e7fd8a927d796eb4_BAT -&gt; xe-pw-170759v4_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-170759v4_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-170759v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-170759v4_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6070-0e8b43b5a5ef2dd52c454158e7fd8a927d796eb4/bat-bmg-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170759v4/bat-bmg-2/igt@xe_live_ktest@xe_migrate.html">FAIL</a> +1 other test fail</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6070-0e8b43b5a5ef2dd52c454158e7fd8a927d796eb4/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170759v4/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6070-0e8b43b5a5ef2dd52c454158e7fd8a927d796eb4/bat-bmg-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170759v4/bat-bmg-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9177 -&gt; IGT_9179</li>
<li>Linux: xe-6070-0e8b43b5a5ef2dd52c454158e7fd8a927d796eb4 -&gt; xe-pw-170759v4</li>
</ul>
<p>IGT_9177: 9177<br />
  IGT_9179: 9179<br />
  xe-6070-0e8b43b5a5ef2dd52c454158e7fd8a927d796eb4: 0e8b43b5a5ef2dd52c454158e7fd8a927d796eb4<br />
  xe-pw-170759v4: 170759v4</p>

</body>
</html>

--===============1872431185428118182==--

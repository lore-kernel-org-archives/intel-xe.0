Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A14E606A880
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 13:56:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED46110F2D1;
	Fri, 13 Nov 2026 13:56:25 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C4210E0DC;
 Fri, 13 Nov 2026 13:56:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7554547654252287064=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/display=3A_Transpara?=
 =?utf-8?q?nt_fallback_from_stolen_to_sysmem=2E_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Nov 2026 13:56:25 -0000
Message-ID: <179457818537.20413.7324239915072154103@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261113124453.144408-7-dev@lankhorst.se>
In-Reply-To: <20261113124453.144408-7-dev@lankhorst.se>
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

--===============7554547654252287064==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: Transparant fallback from stolen to sysmem. (rev5)
URL   : https://patchwork.freedesktop.org/series/170759/
State : failure

== Summary ==

CI Bug Log - changes from xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d_BAT -> xe-pw-170759v5_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-170759v5_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-170759v5_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-170759v5_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_module_load@load:
    - bat-adlp-7:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/bat-adlp-7/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170759v5/bat-adlp-7/igt@xe_module_load@load.html

  


Build changes
-------------

  * IGT: IGT_9190 -> IGT_9191
  * Linux: xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d -> xe-pw-170759v5

  IGT_9190: 9190
  IGT_9191: 9191
  xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d: d41695c479e8bb24eb941e5ba916e42784af6f4d
  xe-pw-170759v5: 170759v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170759v5/index.html

--===============7554547654252287064==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: Transparant fallback from stolen to sysmem. (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170759/">https://patchwork.freedesktop.org/series/170759/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170759v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170759v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d_BAT -&gt; xe-pw-170759v5_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-170759v5_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-170759v5_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-170759v5_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d/bat-adlp-7/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170759v5/bat-adlp-7/igt@xe_module_load@load.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9190 -&gt; IGT_9191</li>
<li>Linux: xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d -&gt; xe-pw-170759v5</li>
</ul>
<p>IGT_9190: 9190<br />
  IGT_9191: 9191<br />
  xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d: d41695c479e8bb24eb941e5ba916e42784af6f4d<br />
  xe-pw-170759v5: 170759v5</p>

</body>
</html>

--===============7554547654252287064==--

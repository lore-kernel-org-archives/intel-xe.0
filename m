Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62082FC616A
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 18:10:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A22810E29E;
	Fri, 13 Sep 2024 18:10:13 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C966710E29E;
 Fri, 13 Sep 2024 18:10:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4882506684152863053=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Shrinker_series_squash?=
 =?utf-8?q?ed?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Sep 2024 18:10:11 -0000
Message-ID: <172625101181.997763.3698341966630114646@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240913141519.3141-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240913141519.3141-1-thomas.hellstrom@linux.intel.com>
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

--===============4882506684152863053==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Shrinker series squashed
URL   : https://patchwork.freedesktop.org/series/138653/
State : success

== Summary ==

CI Bug Log - changes from xe-1948-df3eecb1fa97d6d35569c2fa39f0da78b9f13328_BAT -> xe-pw-138653v1_BAT
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

  Here are the changes found in xe-pw-138653v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [FAIL][1] ([Intel XE#886]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1948-df3eecb1fa97d6d35569c2fa39f0da78b9f13328/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138653v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * IGT: IGT_8016 -> IGT_8017
  * Linux: xe-1948-df3eecb1fa97d6d35569c2fa39f0da78b9f13328 -> xe-pw-138653v1

  IGT_8016: 786f0469afc0665a02dd82bf17544868188fbdeb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8017: 8017
  xe-1948-df3eecb1fa97d6d35569c2fa39f0da78b9f13328: df3eecb1fa97d6d35569c2fa39f0da78b9f13328
  xe-pw-138653v1: 138653v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138653v1/index.html

--===============4882506684152863053==
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
<tr><td><b>Series:</b></td><td>drm/xe: Shrinker series squashed</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138653/">https://patchwork.freedesktop.org/series/138653/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138653v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138653v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1948-df3eecb1fa97d6d35569c2fa39f0da78b9f13328_BAT -&gt; xe-pw-138653v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-138653v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1948-df3eecb1fa97d6d35569c2fa39f0da78b9f13328/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138653v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8016 -&gt; IGT_8017</li>
<li>Linux: xe-1948-df3eecb1fa97d6d35569c2fa39f0da78b9f13328 -&gt; xe-pw-138653v1</li>
</ul>
<p>IGT_8016: 786f0469afc0665a02dd82bf17544868188fbdeb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8017: 8017<br />
  xe-1948-df3eecb1fa97d6d35569c2fa39f0da78b9f13328: df3eecb1fa97d6d35569c2fa39f0da78b9f13328<br />
  xe-pw-138653v1: 138653v1</p>

</body>
</html>

--===============4882506684152863053==--

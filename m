Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65FF10F3DC1
	for <intel-xe@archiver.kernel.org>; Sat, 28 Mar 2026 01:46:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F72610EFD8;
	Sat, 28 Mar 2026 01:46:12 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DC110EFD7;
 Sat, 28 Mar 2026 01:46:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0749160156213261394=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/i915/lt=5Fphy=3A_Build?=
 =?utf-8?q?_HDMI_VDR_config_from_fields_and_use_VDR=5FNUM=5FREGISTERS?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 28 Mar 2026 01:46:11 -0000
Message-ID: <177466237143.409249.15848108859701570827@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260327093531.1203339-1-mika.kahola@intel.com>
In-Reply-To: <20260327093531.1203339-1-mika.kahola@intel.com>
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

--===============0749160156213261394==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/lt_phy: Build HDMI VDR config from fields and use VDR_NUM_REGISTERS
URL   : https://patchwork.freedesktop.org/series/163975/
State : failure

== Summary ==

CI Bug Log - changes from xe-4804-a748e8ef327c92c865410957509417b30f026304_FULL -> xe-pw-163975v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-163975v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-163975v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-163975v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-lnl:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4804-a748e8ef327c92c865410957509417b30f026304/shard-lnl-3/igt@kms_vblank@ts-continuation-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163975v1/shard-lnl-8/igt@kms_vblank@ts-continuation-suspend.html

  


Build changes
-------------

  * Linux: xe-4804-a748e8ef327c92c865410957509417b30f026304 -> xe-pw-163975v1

  IGT_8834: 8834
  xe-4804-a748e8ef327c92c865410957509417b30f026304: a748e8ef327c92c865410957509417b30f026304
  xe-pw-163975v1: 163975v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163975v1/index.html

--===============0749160156213261394==
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
<tr><td><b>Series:</b></td><td>drm/i915/lt_phy: Build HDMI VDR config from fields and use VDR_NUM_REGISTERS</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163975/">https://patchwork.freedesktop.org/series/163975/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163975v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163975v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4804-a748e8ef327c92c865410957509417b30f026304_FULL -&gt; xe-pw-163975v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-163975v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-163975v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-163975v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_vblank@ts-continuation-suspend:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4804-a748e8ef327c92c865410957509417b30f026304/shard-lnl-3/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163975v1/shard-lnl-8/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4804-a748e8ef327c92c865410957509417b30f026304 -&gt; xe-pw-163975v1</li>
</ul>
<p>IGT_8834: 8834<br />
  xe-4804-a748e8ef327c92c865410957509417b30f026304: a748e8ef327c92c865410957509417b30f026304<br />
  xe-pw-163975v1: 163975v1</p>

</body>
</html>

--===============0749160156213261394==--

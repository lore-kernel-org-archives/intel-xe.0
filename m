Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944EFD46638
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jan 2026 23:36:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28AD010E7D9;
	Thu, 15 Jan 2026 23:36:32 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC8B10E191;
 Thu, 15 Jan 2026 23:36:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7182754291041817319=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Add_more_info_to_?=
 =?utf-8?q?powergate=5Finfo_debugfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Jan 2026 23:36:30 -0000
Message-ID: <176852019096.159949.13014872803002116617@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260115224040.2668209-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20260115224040.2668209-1-vinay.belgaumkar@intel.com>
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

--===============7182754291041817319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add more info to powergate_info debugfs
URL   : https://patchwork.freedesktop.org/series/160164/
State : failure

== Summary ==

CI Bug Log - changes from xe-4388-7488f4d19288e0919c24ffc8b2c375e8b7c8a823_BAT -> xe-pw-160164v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-160164v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-160164v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-160164v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_waitfence@engine:
    - bat-bmg-2:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4388-7488f4d19288e0919c24ffc8b2c375e8b7c8a823/bat-bmg-2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160164v1/bat-bmg-2/igt@xe_waitfence@engine.html

  


Build changes
-------------

  * Linux: xe-4388-7488f4d19288e0919c24ffc8b2c375e8b7c8a823 -> xe-pw-160164v1

  IGT_8704: 8704
  xe-4388-7488f4d19288e0919c24ffc8b2c375e8b7c8a823: 7488f4d19288e0919c24ffc8b2c375e8b7c8a823
  xe-pw-160164v1: 160164v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160164v1/index.html

--===============7182754291041817319==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add more info to powergate_info debugfs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160164/">https://patchwork.freedesktop.org/series/160164/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160164v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160164v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4388-7488f4d19288e0919c24ffc8b2c375e8b7c8a823_BAT -&gt; xe-pw-160164v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-160164v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-160164v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-160164v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4388-7488f4d19288e0919c24ffc8b2c375e8b7c8a823/bat-bmg-2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160164v1/bat-bmg-2/igt@xe_waitfence@engine.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4388-7488f4d19288e0919c24ffc8b2c375e8b7c8a823 -&gt; xe-pw-160164v1</li>
</ul>
<p>IGT_8704: 8704<br />
  xe-4388-7488f4d19288e0919c24ffc8b2c375e8b7c8a823: 7488f4d19288e0919c24ffc8b2c375e8b7c8a823<br />
  xe-pw-160164v1: 160164v1</p>

</body>
</html>

--===============7182754291041817319==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D26CD6E7C
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 17:58:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E374211A656;
	Fri,  5 Jun 2026 17:58:43 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CE711A656;
 Fri,  5 Jun 2026 17:58:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7527052146727466198=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyXIFhlLkNJLkJBVDogZmFpbHVyZSBmb3IgZHJtL3tpOTE1LCB4ZX06IFJlZmFj?=
 =?utf-8?b?dG9yIGdlbmVyaWNfaGFuZGxlX2lycV9zYWZlKCkgZXJyb3IgbWVzc2FnZXMgKHJl?=
 =?utf-8?b?djMp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Jun 2026 17:58:42 -0000
Message-ID: <178068232260.49282.12646364078121034256@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260605160444.3833295-1-jonathan.cavitt@intel.com>
In-Reply-To: <20260605160444.3833295-1-jonathan.cavitt@intel.com>
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

--===============7527052146727466198==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/{i915, xe}: Refactor generic_handle_irq_safe() error messages (rev3)
URL   : https://patchwork.freedesktop.org/series/167909/
State : failure

== Summary ==

CI Bug Log - changes from xe-5211-979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b_BAT -> xe-pw-167909v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-167909v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-167909v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-167909v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-ptl-2:          [PASS][1] -> [SKIP][2] +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5211-979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b/bat-ptl-2/igt@kms_force_connector_basic@prune-stale-modes.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167909v3/bat-ptl-2/igt@kms_force_connector_basic@prune-stale-modes.html

  


Build changes
-------------

  * Linux: xe-5211-979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b -> xe-pw-167909v3

  IGT_8950: 8950
  xe-5211-979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b: 979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b
  xe-pw-167909v3: 167909v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167909v3/index.html

--===============7527052146727466198==
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
<tr><td><b>Series:</b></td><td>drm/{i915, xe}: Refactor generic_handle_irq_safe() error messages (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167909/">https://patchwork.freedesktop.org/series/167909/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167909v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167909v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5211-979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b_BAT -&gt; xe-pw-167909v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-167909v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-167909v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-167909v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_force_connector_basic@prune-stale-modes:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5211-979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b/bat-ptl-2/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167909v3/bat-ptl-2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5211-979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b -&gt; xe-pw-167909v3</li>
</ul>
<p>IGT_8950: 8950<br />
  xe-5211-979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b: 979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b<br />
  xe-pw-167909v3: 167909v3</p>

</body>
</html>

--===============7527052146727466198==--

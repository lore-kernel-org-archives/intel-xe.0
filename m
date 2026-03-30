Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFD61061B15
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 17:10:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2306310E6B2;
	Mon, 30 Mar 2026 17:10:07 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BCAD10E6B2;
 Mon, 30 Mar 2026 17:10:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1965865896929808485=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/=7Bi915=2Cxe=7D=3A_fin?=
 =?utf-8?q?ish_switching_to_common_step=2Eh_header?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 30 Mar 2026 17:10:05 -0000
Message-ID: <177489060535.413733.11890327748378077309@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1774875688.git.jani.nikula@intel.com>
In-Reply-To: <cover.1774875688.git.jani.nikula@intel.com>
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

--===============1965865896929808485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/{i915,xe}: finish switching to common step.h header
URL   : https://patchwork.freedesktop.org/series/164085/
State : success

== Summary ==

CI Bug Log - changes from xe-4819-8c24b61314434b46cbe4da73f10bce90b0ea45d6_FULL -> xe-pw-164085v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-164085v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][1] -> [FAIL][2] ([Intel XE#301]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4819-8c24b61314434b46cbe4da73f10bce90b0ea45d6/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164085v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][3] ([Intel XE#301]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4819-8c24b61314434b46cbe4da73f10bce90b0ea45d6/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164085v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301


Build changes
-------------

  * Linux: xe-4819-8c24b61314434b46cbe4da73f10bce90b0ea45d6 -> xe-pw-164085v1

  IGT_8835: 8835
  xe-4819-8c24b61314434b46cbe4da73f10bce90b0ea45d6: 8c24b61314434b46cbe4da73f10bce90b0ea45d6
  xe-pw-164085v1: 164085v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164085v1/index.html

--===============1965865896929808485==
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
<tr><td><b>Series:</b></td><td>drm/{i915,xe}: finish switching to common step.h header</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164085/">https://patchwork.freedesktop.org/series/164085/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164085v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164085v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4819-8c24b61314434b46cbe4da73f10bce90b0ea45d6_FULL -&gt; xe-pw-164085v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-164085v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@flip-vs-expired-vblank@a-edp1:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4819-8c24b61314434b46cbe4da73f10bce90b0ea45d6/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164085v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@flip-vs-expired-vblank-interruptible:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4819-8c24b61314434b46cbe4da73f10bce90b0ea45d6/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164085v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4819-8c24b61314434b46cbe4da73f10bce90b0ea45d6 -&gt; xe-pw-164085v1</li>
</ul>
<p>IGT_8835: 8835<br />
  xe-4819-8c24b61314434b46cbe4da73f10bce90b0ea45d6: 8c24b61314434b46cbe4da73f10bce90b0ea45d6<br />
  xe-pw-164085v1: 164085v1</p>

</body>
</html>

--===============1965865896929808485==--

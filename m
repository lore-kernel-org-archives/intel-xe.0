Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09404CF58CC
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 04:52:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D4C10E2D2;
	Fri, 20 Sep 2024 04:52:07 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FDF10E2D2;
 Fri, 20 Sep 2024 04:52:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3070390177770564497=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/guc=3A_Improve_GuC_log_du?=
 =?utf-8?q?mping_and_add_to_devcoredump_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Sep 2024 04:52:06 -0000
Message-ID: <172680792608.1049082.12561322663452726016@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240920032108.629796-1-John.C.Harrison@Intel.com>
In-Reply-To: <20240920032108.629796-1-John.C.Harrison@Intel.com>
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

--===============3070390177770564497==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Improve GuC log dumping and add to devcoredump (rev3)
URL   : https://patchwork.freedesktop.org/series/137985/
State : failure

== Summary ==

CI Bug Log - changes from xe-1972-d4340c1de6d417c7b3edac187c3af011b146701a_BAT -> xe-pw-137985v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-137985v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-137985v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 0)
------------------------------

  ERROR: It appears as if the changes made in xe-pw-137985v3_BAT prevented too many machines from booting.

  Missing    (9): bat-bmg-1 bat-lnl-2 bat-adlp-vf bat-lnl-1 bat-pvc-2 bat-dg2-oem2 bat-atsm-2 bat-bmg-2 bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1972-d4340c1de6d417c7b3edac187c3af011b146701a -> xe-pw-137985v3

  IGT_8028: 8028
  xe-1972-d4340c1de6d417c7b3edac187c3af011b146701a: d4340c1de6d417c7b3edac187c3af011b146701a
  xe-pw-137985v3: 137985v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137985v3/index.html

--===============3070390177770564497==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Improve GuC log dumping and add to devcoredump (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137985/">https://patchwork.freedesktop.org/series/137985/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137985v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137985v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1972-d4340c1de6d417c7b3edac187c3af011b146701a_BAT -&gt; xe-pw-137985v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-137985v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-137985v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in xe-pw-137985v3_BAT prevented too many machines from booting.</p>
<p>Missing    (9): bat-bmg-1 bat-lnl-2 bat-adlp-vf bat-lnl-1 bat-pvc-2 bat-dg2-oem2 bat-atsm-2 bat-bmg-2 bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1972-d4340c1de6d417c7b3edac187c3af011b146701a -&gt; xe-pw-137985v3</li>
</ul>
<p>IGT_8028: 8028<br />
  xe-1972-d4340c1de6d417c7b3edac187c3af011b146701a: d4340c1de6d417c7b3edac187c3af011b146701a<br />
  xe-pw-137985v3: 137985v3</p>

</body>
</html>

--===============3070390177770564497==--

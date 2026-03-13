Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E981105F7A1
	for <intel-xe@archiver.kernel.org>; Fri, 13 Mar 2026 12:11:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E875F10EBC9;
	Fri, 13 Mar 2026 12:11:25 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B9710EBC9;
 Fri, 13 Mar 2026 12:11:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7010718322127170964=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe/lrc=3A_Fix_uninitia?=
 =?utf-8?q?lized_new=5Fts_when_capturing_context_timestamp_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Mar 2026 12:11:24 -0000
Message-ID: <177340388492.355365.7200998839364795874@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260312125308.3126607-2-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20260312125308.3126607-2-umesh.nerlige.ramappa@intel.com>
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

--===============7010718322127170964==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/lrc: Fix uninitialized new_ts when capturing context timestamp (rev2)
URL   : https://patchwork.freedesktop.org/series/163021/
State : success

== Summary ==

CI Bug Log - changes from xe-4706-72190ebdd4c0e9a2b454b04ba382beeb6020e047_FULL -> xe-pw-163021v2_FULL
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

  Here are the changes found in xe-pw-163021v2_FULL that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][1] ([Intel XE#2142]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4706-72190ebdd4c0e9a2b454b04ba382beeb6020e047/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163021v2/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142


Build changes
-------------

  * Linux: xe-4706-72190ebdd4c0e9a2b454b04ba382beeb6020e047 -> xe-pw-163021v2

  IGT_8798: 8798
  xe-4706-72190ebdd4c0e9a2b454b04ba382beeb6020e047: 72190ebdd4c0e9a2b454b04ba382beeb6020e047
  xe-pw-163021v2: 163021v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163021v2/index.html

--===============7010718322127170964==
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
<tr><td><b>Series:</b></td><td>drm/xe/lrc: Fix uninitialized new_ts when capturing context timestamp (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163021/">https://patchwork.freedesktop.org/series/163021/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163021v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163021v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4706-72190ebdd4c0e9a2b454b04ba382beeb6020e047_FULL -&gt; xe-pw-163021v2_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-163021v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4706-72190ebdd4c0e9a2b454b04ba382beeb6020e047/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163021v2/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4706-72190ebdd4c0e9a2b454b04ba382beeb6020e047 -&gt; xe-pw-163021v2</li>
</ul>
<p>IGT_8798: 8798<br />
  xe-4706-72190ebdd4c0e9a2b454b04ba382beeb6020e047: 72190ebdd4c0e9a2b454b04ba382beeb6020e047<br />
  xe-pw-163021v2: 163021v2</p>

</body>
</html>

--===============7010718322127170964==--

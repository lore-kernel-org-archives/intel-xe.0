Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFC4C27C40
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 17:46:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F250810E0BF;
	Wed, 23 Aug 2023 17:46:45 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id B687510E09F;
 Wed, 23 Aug 2023 17:46:44 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AE134A7DFB;
 Wed, 23 Aug 2023 17:46:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7302247250126095164=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Wed, 23 Aug 2023 17:46:44 -0000
Message-ID: <169281280467.16626.11120379753212263484@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230823170740.1180212-1-lucas.demarchi@intel.com>
In-Reply-To: <20230823170740.1180212-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Enable_Lu?=
 =?utf-8?q?nar_Lake_display?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============7302247250126095164==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable Lunar Lake display
URL   : https://patchwork.freedesktop.org/series/122798/
State : success

== Summary ==

CI Bug Log - changes from xe-331-8ca78f69c23d5f68a24bdacc014f82eff9719980_BAT -> xe-pw-122798v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-122798v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#480]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-331-8ca78f69c23d5f68a24bdacc014f82eff9719980/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122798v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - bat-atsm-2:         [PASS][3] -> [TIMEOUT][4] ([Intel XE#280])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-331-8ca78f69c23d5f68a24bdacc014f82eff9719980/bat-atsm-2/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122798v1/bat-atsm-2/igt@xe_exec_threads@threads-mixed-fd-basic.html

  
  [Intel XE#280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/280
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480


Build changes
-------------

  * Linux: xe-331-8ca78f69c23d5f68a24bdacc014f82eff9719980 -> xe-pw-122798v1

  IGT_7451: 5d48d1fb231f449fe2f80cda14ea7a1ecfda59fa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-331-8ca78f69c23d5f68a24bdacc014f82eff9719980: 8ca78f69c23d5f68a24bdacc014f82eff9719980
  xe-pw-122798v1: 122798v1



--===============7302247250126095164==
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
<tr><td><b>Series:</b></td><td>Enable Lunar Lake display</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122798/">https://patchwork.freedesktop.org/series/122798/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

</table>


    <h1>CI Bug Log - changes from xe-331-8ca78f69c23d5f68a24bdacc014f82eff9719980_BAT -&gt; xe-pw-122798v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-122798v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-331-8ca78f69c23d5f68a24bdacc014f82eff9719980/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122798v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-331-8ca78f69c23d5f68a24bdacc014f82eff9719980/bat-atsm-2/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122798v1/bat-atsm-2/igt@xe_exec_threads@threads-mixed-fd-basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/280">Intel XE#280</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-331-8ca78f69c23d5f68a24bdacc014f82eff9719980 -&gt; xe-pw-122798v1</li>
</ul>
<p>IGT_7451: 5d48d1fb231f449fe2f80cda14ea7a1ecfda59fa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-331-8ca78f69c23d5f68a24bdacc014f82eff9719980: 8ca78f69c23d5f68a24bdacc014f82eff9719980<br />
  xe-pw-122798v1: 122798v1</p>

</body>
</html>

--===============7302247250126095164==--

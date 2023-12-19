Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387E2C46CA2
	for <intel-xe@archiver.kernel.org>; Tue, 19 Dec 2023 16:54:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0254D10E2B6;
	Tue, 19 Dec 2023 16:54:32 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8577110E2B6;
 Tue, 19 Dec 2023 16:54:30 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 7ECDAAADF8;
 Tue, 19 Dec 2023 16:54:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4969894529980040616=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_locking/ww=5Fmutex=3A_Adjust_to_?=
 =?utf-8?q?lockdep_nest=5Flock_requirements_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Tue, 19 Dec 2023 16:54:30 -0000
Message-ID: <170300487051.17581.4290585121297301294@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231219160524.3646-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231219160524.3646-1-thomas.hellstrom@linux.intel.com>
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

--===============4969894529980040616==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: locking/ww_mutex: Adjust to lockdep nest_lock requirements (rev2)
URL   : https://patchwork.freedesktop.org/series/123522/
State : success

== Summary ==

CI Bug Log - changes from xe-587-974cd401b8e534a6275fb4d2c0db6aea440508a6_BAT -> xe-pw-123522v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-adlp-7 

Known issues
------------

  Here are the changes found in xe-pw-123522v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:
    - bat-dg2-oem2:       [FAIL][1] ([Intel XE#906]) -> [PASS][2] +2 other tests pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-587-974cd401b8e534a6275fb4d2c0db6aea440508a6/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v2/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html

  
  [Intel XE#906]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/906


Build changes
-------------

  * Linux: xe-587-974cd401b8e534a6275fb4d2c0db6aea440508a6 -> xe-pw-123522v2

  IGT_7648: 5c7b44f13c9c5bc15af0cb2b6a5ea10a8a468ac0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-587-974cd401b8e534a6275fb4d2c0db6aea440508a6: 974cd401b8e534a6275fb4d2c0db6aea440508a6
  xe-pw-123522v2: 123522v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v2/index.html

--===============4969894529980040616==
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
<tr><td><b>Series:</b></td><td>locking/ww_mutex: Adjust to lockdep nest_lock requirements (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123522/">https://patchwork.freedesktop.org/series/123522/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-587-974cd401b8e534a6275fb4d2c0db6aea440508a6_BAT -&gt; xe-pw-123522v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-adlp-7 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-123522v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-587-974cd401b8e534a6275fb4d2c0db6aea440508a6/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/906">Intel XE#906</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v2/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-587-974cd401b8e534a6275fb4d2c0db6aea440508a6 -&gt; xe-pw-123522v2</li>
</ul>
<p>IGT_7648: 5c7b44f13c9c5bc15af0cb2b6a5ea10a8a468ac0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-587-974cd401b8e534a6275fb4d2c0db6aea440508a6: 974cd401b8e534a6275fb4d2c0db6aea440508a6<br />
  xe-pw-123522v2: 123522v2</p>

</body>
</html>

--===============4969894529980040616==--

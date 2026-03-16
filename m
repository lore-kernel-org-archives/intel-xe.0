Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEAFEFCBD4
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 07:27:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F3A10E303;
	Mon, 16 Mar 2026 07:27:49 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A906A10E303;
 Mon, 16 Mar 2026 07:27:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4867816269411964237=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Do_not_create_drm_device_fo?=
 =?utf-8?q?r_PF_only_admin_mode_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Mar 2026 07:27:48 -0000
Message-ID: <177364606866.359733.17019743266320043154@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260316064100.2542412-3-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260316064100.2542412-3-satyanarayana.k.v.p@intel.com>
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

--===============4867816269411964237==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Do not create drm device for PF only admin mode (rev5)
URL   : https://patchwork.freedesktop.org/series/160349/
State : success

== Summary ==

CI Bug Log - changes from xe-4725-f0700a5f37f7cb00aced6fb9a16f86fdf2f493aa_BAT -> xe-pw-160349v5_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-160349v5_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-bmg-2:          [FAIL][1] ([Intel XE#6519]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4725-f0700a5f37f7cb00aced6fb9a16f86fdf2f493aa/bat-bmg-2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v5/bat-bmg-2/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * Linux: xe-4725-f0700a5f37f7cb00aced6fb9a16f86fdf2f493aa -> xe-pw-160349v5

  IGT_8805: 8805
  xe-4725-f0700a5f37f7cb00aced6fb9a16f86fdf2f493aa: f0700a5f37f7cb00aced6fb9a16f86fdf2f493aa
  xe-pw-160349v5: 160349v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v5/index.html

--===============4867816269411964237==
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
<tr><td><b>Series:</b></td><td>Do not create drm device for PF only admin mode (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160349/">https://patchwork.freedesktop.org/series/160349/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4725-f0700a5f37f7cb00aced6fb9a16f86fdf2f493aa_BAT -&gt; xe-pw-160349v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-160349v5_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4725-f0700a5f37f7cb00aced6fb9a16f86fdf2f493aa/bat-bmg-2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160349v5/bat-bmg-2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4725-f0700a5f37f7cb00aced6fb9a16f86fdf2f493aa -&gt; xe-pw-160349v5</li>
</ul>
<p>IGT_8805: 8805<br />
  xe-4725-f0700a5f37f7cb00aced6fb9a16f86fdf2f493aa: f0700a5f37f7cb00aced6fb9a16f86fdf2f493aa<br />
  xe-pw-160349v5: 160349v5</p>

</body>
</html>

--===============4867816269411964237==--

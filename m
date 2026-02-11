Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72802EB596A
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 06:15:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2520B10E036;
	Wed, 11 Feb 2026 06:15:37 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9AD10E036;
 Wed, 11 Feb 2026 06:15:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7766869217835486627=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/buddy=3A_Documentation_?=
 =?utf-8?q?and_internal_helper_cleanup_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sanjay Yadav" <sanjay.kumar.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Feb 2026 06:15:35 -0000
Message-ID: <177079053594.244788.1090576238202846944@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260211053123.260037-4-sanjay.kumar.yadav@intel.com>
In-Reply-To: <20260211053123.260037-4-sanjay.kumar.yadav@intel.com>
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

--===============7766869217835486627==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/buddy: Documentation and internal helper cleanup (rev3)
URL   : https://patchwork.freedesktop.org/series/161140/
State : success

== Summary ==

CI Bug Log - changes from xe-4541-8ef710cfb81579fbf4107d77134e6e8d2c864ef0_BAT -> xe-pw-161140v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-161140v3_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [FAIL][1] ([Intel XE#6520]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4541-8ef710cfb81579fbf4107d77134e6e8d2c864ef0/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161140v3/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * IGT: IGT_8746 -> IGT_8747
  * Linux: xe-4541-8ef710cfb81579fbf4107d77134e6e8d2c864ef0 -> xe-pw-161140v3

  IGT_8746: 8746
  IGT_8747: 8747
  xe-4541-8ef710cfb81579fbf4107d77134e6e8d2c864ef0: 8ef710cfb81579fbf4107d77134e6e8d2c864ef0
  xe-pw-161140v3: 161140v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161140v3/index.html

--===============7766869217835486627==
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
<tr><td><b>Series:</b></td><td>drm/buddy: Documentation and internal helper cleanup (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161140/">https://patchwork.freedesktop.org/series/161140/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161140v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161140v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4541-8ef710cfb81579fbf4107d77134e6e8d2c864ef0_BAT -&gt; xe-pw-161140v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161140v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4541-8ef710cfb81579fbf4107d77134e6e8d2c864ef0/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161140v3/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8746 -&gt; IGT_8747</li>
<li>Linux: xe-4541-8ef710cfb81579fbf4107d77134e6e8d2c864ef0 -&gt; xe-pw-161140v3</li>
</ul>
<p>IGT_8746: 8746<br />
  IGT_8747: 8747<br />
  xe-4541-8ef710cfb81579fbf4107d77134e6e8d2c864ef0: 8ef710cfb81579fbf4107d77134e6e8d2c864ef0<br />
  xe-pw-161140v3: 161140v3</p>

</body>
</html>

--===============7766869217835486627==--

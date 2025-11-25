Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501A6CFD373
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 03:23:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99E510E106;
	Tue, 25 Nov 2025 03:23:33 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0401010E106;
 Tue, 25 Nov 2025 03:23:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8018596686466572124=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_Check_n?=
 =?utf-8?q?umber_of_scalers_for_casf?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Nov 2025 03:23:32 -0000
Message-ID: <176404101200.23084.4147771747870916300@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251124084629.3322714-1-nemesa.garg@intel.com>
In-Reply-To: <20251124084629.3322714-1-nemesa.garg@intel.com>
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

--===============8018596686466572124==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Check number of scalers for casf
URL   : https://patchwork.freedesktop.org/series/157956/
State : success

== Summary ==

CI Bug Log - changes from xe-4141-c701e79730169fab373fba7e759497d755fac592_BAT -> xe-pw-157956v1_BAT
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

  Here are the changes found in xe-pw-157956v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@engine:
    - bat-pvc-2:          [PASS][1] -> [FAIL][2] ([Intel XE#6519])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4141-c701e79730169fab373fba7e759497d755fac592/bat-pvc-2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157956v1/bat-pvc-2/igt@xe_waitfence@engine.html

  * igt@xe_waitfence@reltime:
    - bat-pvc-2:          [PASS][3] -> [FAIL][4] ([Intel XE#6520])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4141-c701e79730169fab373fba7e759497d755fac592/bat-pvc-2/igt@xe_waitfence@reltime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157956v1/bat-pvc-2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * IGT: IGT_8636 -> IGT_8637
  * Linux: xe-4141-c701e79730169fab373fba7e759497d755fac592 -> xe-pw-157956v1

  IGT_8636: 254cd102396ff95d61f2ebe49fc09128878bf483 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8637: 730ee3dfb26f8d7891fc240b0132a08c5bc7b949 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4141-c701e79730169fab373fba7e759497d755fac592: c701e79730169fab373fba7e759497d755fac592
  xe-pw-157956v1: 157956v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157956v1/index.html

--===============8018596686466572124==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Check number of scalers for casf</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157956/">https://patchwork.freedesktop.org/series/157956/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157956v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157956v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4141-c701e79730169fab373fba7e759497d755fac592_BAT -&gt; xe-pw-157956v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-157956v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4141-c701e79730169fab373fba7e759497d755fac592/bat-pvc-2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157956v1/bat-pvc-2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4141-c701e79730169fab373fba7e759497d755fac592/bat-pvc-2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157956v1/bat-pvc-2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8636 -&gt; IGT_8637</li>
<li>Linux: xe-4141-c701e79730169fab373fba7e759497d755fac592 -&gt; xe-pw-157956v1</li>
</ul>
<p>IGT_8636: 254cd102396ff95d61f2ebe49fc09128878bf483 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8637: 730ee3dfb26f8d7891fc240b0132a08c5bc7b949 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4141-c701e79730169fab373fba7e759497d755fac592: c701e79730169fab373fba7e759497d755fac592<br />
  xe-pw-157956v1: 157956v1</p>

</body>
</html>

--===============8018596686466572124==--

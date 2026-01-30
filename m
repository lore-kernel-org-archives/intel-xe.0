Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2163D73EB3
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 02:22:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822FE10E04F;
	Fri, 30 Jan 2026 02:22:32 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E32610E04F;
 Fri, 30 Jan 2026 02:22:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6577637972776586191=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_use_entry=5Fdump_?=
 =?utf-8?q?callbacks_for_xe2+_PAT_dumps_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xin Wang" <x.wang@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 Jan 2026 02:22:31 -0000
Message-ID: <176973975125.207735.1903266308851545251@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260130002147.2215241-1-x.wang@intel.com>
In-Reply-To: <20260130002147.2215241-1-x.wang@intel.com>
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

--===============6577637972776586191==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: use entry_dump callbacks for xe2+ PAT dumps (rev2)
URL   : https://patchwork.freedesktop.org/series/160868/
State : failure

== Summary ==

CI Bug Log - changes from xe-4473-d969f98227a64fa88e79933a72018d5d05e5c1b4_BAT -> xe-pw-160868v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-160868v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-160868v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-160868v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_pat@pat-sanity:
    - bat-dg2-oem2:       [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4473-d969f98227a64fa88e79933a72018d5d05e5c1b4/bat-dg2-oem2/igt@xe_pat@pat-sanity.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160868v2/bat-dg2-oem2/igt@xe_pat@pat-sanity.html
    - bat-atsm-2:         [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4473-d969f98227a64fa88e79933a72018d5d05e5c1b4/bat-atsm-2/igt@xe_pat@pat-sanity.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160868v2/bat-atsm-2/igt@xe_pat@pat-sanity.html
    - bat-adlp-7:         [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4473-d969f98227a64fa88e79933a72018d5d05e5c1b4/bat-adlp-7/igt@xe_pat@pat-sanity.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160868v2/bat-adlp-7/igt@xe_pat@pat-sanity.html

  


Build changes
-------------

  * Linux: xe-4473-d969f98227a64fa88e79933a72018d5d05e5c1b4 -> xe-pw-160868v2

  IGT_8725: 8725
  xe-4473-d969f98227a64fa88e79933a72018d5d05e5c1b4: d969f98227a64fa88e79933a72018d5d05e5c1b4
  xe-pw-160868v2: 160868v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160868v2/index.html

--===============6577637972776586191==
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
<tr><td><b>Series:</b></td><td>drm/xe: use entry_dump callbacks for xe2+ PAT dumps (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160868/">https://patchwork.freedesktop.org/series/160868/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160868v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160868v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4473-d969f98227a64fa88e79933a72018d5d05e5c1b4_BAT -&gt; xe-pw-160868v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-160868v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-160868v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-160868v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_pat@pat-sanity:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4473-d969f98227a64fa88e79933a72018d5d05e5c1b4/bat-dg2-oem2/igt@xe_pat@pat-sanity.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160868v2/bat-dg2-oem2/igt@xe_pat@pat-sanity.html">ABORT</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4473-d969f98227a64fa88e79933a72018d5d05e5c1b4/bat-atsm-2/igt@xe_pat@pat-sanity.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160868v2/bat-atsm-2/igt@xe_pat@pat-sanity.html">ABORT</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4473-d969f98227a64fa88e79933a72018d5d05e5c1b4/bat-adlp-7/igt@xe_pat@pat-sanity.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160868v2/bat-adlp-7/igt@xe_pat@pat-sanity.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4473-d969f98227a64fa88e79933a72018d5d05e5c1b4 -&gt; xe-pw-160868v2</li>
</ul>
<p>IGT_8725: 8725<br />
  xe-4473-d969f98227a64fa88e79933a72018d5d05e5c1b4: d969f98227a64fa88e79933a72018d5d05e5c1b4<br />
  xe-pw-160868v2: 160868v2</p>

</body>
</html>

--===============6577637972776586191==--

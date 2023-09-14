Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73EB6EDE99C
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 10:12:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 135DE10E0B7;
	Thu, 14 Sep 2023 10:12:21 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8102910E0B7;
 Thu, 14 Sep 2023 10:12:18 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 81E0EAADF3;
 Thu, 14 Sep 2023 10:12:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4828889697324263376=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alexander Usyskin" <alexander.usyskin@intel.com>
Date: Thu, 14 Sep 2023 10:12:18 -0000
Message-ID: <169468633850.29166.18395889242141912309@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230914080138.4178295-1-alexander.usyskin@intel.com>
In-Reply-To: <20230914080138.4178295-1-alexander.usyskin@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/gs?=
 =?utf-8?q?c=3A_add_initial_gsc_support_=28rev2=29?=
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

--===============4828889697324263376==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/gsc: add initial gsc support (rev2)
URL   : https://patchwork.freedesktop.org/series/123603/
State : success

== Summary ==

CI Bug Log - changes from xe-372-baea10eb27d49a2b8a526d87a70532ab201d140b_BAT -> xe-pw-123603v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-123603v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         [FAIL][1] ([Intel XE#480]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-372-baea10eb27d49a2b8a526d87a70532ab201d140b/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123603v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480


Build changes
-------------

  * IGT: IGT_7486 -> IGT_7487
  * Linux: xe-372-baea10eb27d49a2b8a526d87a70532ab201d140b -> xe-pw-123603v2

  IGT_7486: afd9a940c8247291baadd1977fe881d4f2edf0c7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7487: 77e606dea60110c869ad9f9cc88994a0048845c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-372-baea10eb27d49a2b8a526d87a70532ab201d140b: baea10eb27d49a2b8a526d87a70532ab201d140b
  xe-pw-123603v2: 123603v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123603v2/index.html

--===============4828889697324263376==
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
<tr><td><b>Series:</b></td><td>drm/xe/gsc: add initial gsc support (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123603/">https://patchwork.freedesktop.org/series/123603/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123603v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123603v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-372-baea10eb27d49a2b8a526d87a70532ab201d140b_BAT -&gt; xe-pw-123603v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-123603v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-372-baea10eb27d49a2b8a526d87a70532ab201d140b/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123603v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7486 -&gt; IGT_7487</li>
<li>Linux: xe-372-baea10eb27d49a2b8a526d87a70532ab201d140b -&gt; xe-pw-123603v2</li>
</ul>
<p>IGT_7486: afd9a940c8247291baadd1977fe881d4f2edf0c7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7487: 77e606dea60110c869ad9f9cc88994a0048845c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-372-baea10eb27d49a2b8a526d87a70532ab201d140b: baea10eb27d49a2b8a526d87a70532ab201d140b<br />
  xe-pw-123603v2: 123603v2</p>

</body>
</html>

--===============4828889697324263376==--

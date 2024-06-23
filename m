Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BDCC27C4F
	for <intel-xe@archiver.kernel.org>; Sun, 23 Jun 2024 21:16:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F13B10E320;
	Sun, 23 Jun 2024 21:16:30 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C3110E320;
 Sun, 23 Jun 2024 21:16:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6760747686241452233=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/oa=3A_Fix_kernel_doc_warn?=
 =?utf-8?q?ings_in_xe=5Fdrm=2Eh_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 23 Jun 2024 21:16:29 -0000
Message-ID: <171917738939.135457.11970290124664715110@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240623203119.3840283-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240623203119.3840283-1-ashutosh.dixit@intel.com>
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

--===============6760747686241452233==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/oa: Fix kernel doc warnings in xe_drm.h (rev3)
URL   : https://patchwork.freedesktop.org/series/135225/
State : success

== Summary ==

CI Bug Log - changes from xe-1516-7fb9ba849242ce027e5233b8e37dad14588d58bd_BAT -> xe-pw-135225v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-135225v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#324]) +2 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1516-7fb9ba849242ce027e5233b8e37dad14588d58bd/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135225v3/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324


Build changes
-------------

  * Linux: xe-1516-7fb9ba849242ce027e5233b8e37dad14588d58bd -> xe-pw-135225v3

  IGT_7895: 7895
  xe-1516-7fb9ba849242ce027e5233b8e37dad14588d58bd: 7fb9ba849242ce027e5233b8e37dad14588d58bd
  xe-pw-135225v3: 135225v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135225v3/index.html

--===============6760747686241452233==
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
<tr><td><b>Series:</b></td><td>drm/xe/oa: Fix kernel doc warnings in xe_drm.h (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135225/">https://patchwork.freedesktop.org/series/135225/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135225v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135225v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1516-7fb9ba849242ce027e5233b8e37dad14588d58bd_BAT -&gt; xe-pw-135225v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135225v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1516-7fb9ba849242ce027e5233b8e37dad14588d58bd/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135225v3/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1516-7fb9ba849242ce027e5233b8e37dad14588d58bd -&gt; xe-pw-135225v3</li>
</ul>
<p>IGT_7895: 7895<br />
  xe-1516-7fb9ba849242ce027e5233b8e37dad14588d58bd: 7fb9ba849242ce027e5233b8e37dad14588d58bd<br />
  xe-pw-135225v3: 135225v3</p>

</body>
</html>

--===============6760747686241452233==--

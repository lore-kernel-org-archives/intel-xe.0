Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D60CA0EDC
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 11:28:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 042D210E6F6;
	Wed, 20 Aug 2025 11:28:16 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C0310E6F6;
 Wed, 20 Aug 2025 11:28:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7899379048968031593=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Optimize_vrr=2Eguardband_an?=
 =?utf-8?q?d_fix_LRR_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 20 Aug 2025 11:28:14 -0000
Message-ID: <175568929498.251997.15166756731735029616@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250820080451.2634888-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250820080451.2634888-1-ankit.k.nautiyal@intel.com>
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

--===============7899379048968031593==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Optimize vrr.guardband and fix LRR (rev6)
URL   : https://patchwork.freedesktop.org/series/151244/
State : success

== Summary ==

CI Bug Log - changes from xe-3584-75c7076379611a94502e5a15f26e5b11ea80b465_BAT -> xe-pw-151244v6_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 8)
------------------------------

  Missing    (3): bat-adlp-vm bat-atsm-2 bat-ptl-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-151244v6_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - {bat-ptl-2}:        [PASS][1] -> [FAIL][2] +5 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3584-75c7076379611a94502e5a15f26e5b11ea80b465/bat-ptl-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v6/bat-ptl-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  
Known issues
------------

  Here are the changes found in xe-pw-151244v6_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@c-edp1:
    - bat-adlp-7:         [PASS][3] -> [DMESG-WARN][4] ([Intel XE#4543]) +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3584-75c7076379611a94502e5a15f26e5b11ea80b465/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v6/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html

  
#### Possible fixes ####

  * igt@xe_pat@pat-index-xe2@render:
    - bat-bmg-2:          [FAIL][5] ([Intel XE#5507]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3584-75c7076379611a94502e5a15f26e5b11ea80b465/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v6/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#5507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507
  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * Linux: xe-3584-75c7076379611a94502e5a15f26e5b11ea80b465 -> xe-pw-151244v6

  IGT_8498: 8498
  xe-3584-75c7076379611a94502e5a15f26e5b11ea80b465: 75c7076379611a94502e5a15f26e5b11ea80b465
  xe-pw-151244v6: 151244v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v6/index.html

--===============7899379048968031593==
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
<tr><td><b>Series:</b></td><td>Optimize vrr.guardband and fix LRR (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151244/">https://patchwork.freedesktop.org/series/151244/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3584-75c7076379611a94502e5a15f26e5b11ea80b465_BAT -&gt; xe-pw-151244v6_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): bat-adlp-vm bat-atsm-2 bat-ptl-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-151244v6_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:<ul>
<li>{bat-ptl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3584-75c7076379611a94502e5a15f26e5b11ea80b465/bat-ptl-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v6/bat-ptl-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-151244v6_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3584-75c7076379611a94502e5a15f26e5b11ea80b465/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v6/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_pat@pat-index-xe2@render:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3584-75c7076379611a94502e5a15f26e5b11ea80b465/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507">Intel XE#5507</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v6/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3584-75c7076379611a94502e5a15f26e5b11ea80b465 -&gt; xe-pw-151244v6</li>
</ul>
<p>IGT_8498: 8498<br />
  xe-3584-75c7076379611a94502e5a15f26e5b11ea80b465: 75c7076379611a94502e5a15f26e5b11ea80b465<br />
  xe-pw-151244v6: 151244v6</p>

</body>
</html>

--===============7899379048968031593==--

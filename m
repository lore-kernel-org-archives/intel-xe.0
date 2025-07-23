Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29294C83F17
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 14:04:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF6610E0E9;
	Wed, 23 Jul 2025 14:04:57 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5C810E0E9;
 Wed, 23 Jul 2025 14:04:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7019076281466352754=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Improve_VF_provis?=
 =?utf-8?q?ion_stability_with_fault_injection_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 23 Jul 2025 14:04:57 -0000
Message-ID: <175327949702.182805.1928473631144342286@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250723131008.26916-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250723131008.26916-1-satyanarayana.k.v.p@intel.com>
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

--===============7019076281466352754==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Improve VF provision stability with fault injection (rev3)
URL   : https://patchwork.freedesktop.org/series/151499/
State : success

== Summary ==

CI Bug Log - changes from xe-3463-aac91a1ef678cd79480a912837cabfaa348aeb79_BAT -> xe-pw-151499v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-151499v3_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@d-edp1:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#4543]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3463-aac91a1ef678cd79480a912837cabfaa348aeb79/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v3/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * Linux: xe-3463-aac91a1ef678cd79480a912837cabfaa348aeb79 -> xe-pw-151499v3

  IGT_8474: 54376e96f3f84e7bc6ccdc0106017cf2778ef08a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3463-aac91a1ef678cd79480a912837cabfaa348aeb79: aac91a1ef678cd79480a912837cabfaa348aeb79
  xe-pw-151499v3: 151499v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v3/index.html

--===============7019076281466352754==
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
<tr><td><b>Series:</b></td><td>drm/xe: Improve VF provision stability with fault injection (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151499/">https://patchwork.freedesktop.org/series/151499/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3463-aac91a1ef678cd79480a912837cabfaa348aeb79_BAT -&gt; xe-pw-151499v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-151499v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@d-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3463-aac91a1ef678cd79480a912837cabfaa348aeb79/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151499v3/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3463-aac91a1ef678cd79480a912837cabfaa348aeb79 -&gt; xe-pw-151499v3</li>
</ul>
<p>IGT_8474: 54376e96f3f84e7bc6ccdc0106017cf2778ef08a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3463-aac91a1ef678cd79480a912837cabfaa348aeb79: aac91a1ef678cd79480a912837cabfaa348aeb79<br />
  xe-pw-151499v3: 151499v3</p>

</body>
</html>

--===============7019076281466352754==--

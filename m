Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A21E7716A
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 10:06:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D05010E8D3;
	Tue, 17 Dec 2024 10:06:53 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7F010E8D3;
 Tue, 17 Dec 2024 10:06:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6392743288340733364=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/hdcp=3A_Fix_Repeat?=
 =?utf-8?q?er_authentication_during_topology_change?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Dec 2024 10:06:52 -0000
Message-ID: <173443001210.3702663.4492380660063482526@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241217083723.2883317-1-suraj.kandpal@intel.com>
In-Reply-To: <20241217083723.2883317-1-suraj.kandpal@intel.com>
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

--===============6392743288340733364==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/hdcp: Fix Repeater authentication during topology change
URL   : https://patchwork.freedesktop.org/series/142699/
State : success

== Summary ==

CI Bug Log - changes from xe-2388-e7c9466eaad2e3e60e6dbd2725a648b58c717fb0_BAT -> xe-pw-142699v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-142699v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@bad-pitch-0:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3429]) +31 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2388-e7c9466eaad2e3e60e6dbd2725a648b58c717fb0/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142699v1/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html

  * igt@kms_flip@basic-flip-vs-dpms@a-edp1:
    - bat-lnl-1:          [PASS][3] -> [DMESG-WARN][4] ([Intel XE#3729]) +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2388-e7c9466eaad2e3e60e6dbd2725a648b58c717fb0/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142699v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html

  
  [Intel XE#3429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3429
  [Intel XE#3729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3729


Build changes
-------------

  * IGT: IGT_8157 -> IGT_8159
  * Linux: xe-2388-e7c9466eaad2e3e60e6dbd2725a648b58c717fb0 -> xe-pw-142699v1

  IGT_8157: 48a70f6795e6d68b9fae275261ae3b09d3401fe1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8159: 2a4c77dc47a59032c8cecd61cb0a5546a2828897 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2388-e7c9466eaad2e3e60e6dbd2725a648b58c717fb0: e7c9466eaad2e3e60e6dbd2725a648b58c717fb0
  xe-pw-142699v1: 142699v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142699v1/index.html

--===============6392743288340733364==
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
<tr><td><b>Series:</b></td><td>drm/i915/hdcp: Fix Repeater authentication during topology change</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142699/">https://patchwork.freedesktop.org/series/142699/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142699v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142699v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2388-e7c9466eaad2e3e60e6dbd2725a648b58c717fb0_BAT -&gt; xe-pw-142699v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142699v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@bad-pitch-0:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2388-e7c9466eaad2e3e60e6dbd2725a648b58c717fb0/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142699v1/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3429">Intel XE#3429</a>) +31 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-edp1:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2388-e7c9466eaad2e3e60e6dbd2725a648b58c717fb0/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142699v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3729">Intel XE#3729</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8157 -&gt; IGT_8159</li>
<li>Linux: xe-2388-e7c9466eaad2e3e60e6dbd2725a648b58c717fb0 -&gt; xe-pw-142699v1</li>
</ul>
<p>IGT_8157: 48a70f6795e6d68b9fae275261ae3b09d3401fe1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8159: 2a4c77dc47a59032c8cecd61cb0a5546a2828897 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2388-e7c9466eaad2e3e60e6dbd2725a648b58c717fb0: e7c9466eaad2e3e60e6dbd2725a648b58c717fb0<br />
  xe-pw-142699v1: 142699v1</p>

</body>
</html>

--===============6392743288340733364==--

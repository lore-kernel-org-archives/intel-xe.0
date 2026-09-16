Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C1CC982C9
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 21:29:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BBF310E110;
	Wed, 16 Sep 2026 21:29:06 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0457410E09F;
 Wed, 16 Sep 2026 21:29:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1522680728178239600=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/fbc=3A_remove_uint?=
 =?utf-8?q?16_from_supported_fbc_formats_in_xe3plpd_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Sep 2026 21:29:05 -0000
Message-ID: <178959414501.174781.11368587083365027348@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260916195602.939242-1-vinod.govindapillai@intel.com>
In-Reply-To: <20260916195602.939242-1-vinod.govindapillai@intel.com>
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

--===============1522680728178239600==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/fbc: remove uint16 from supported fbc formats in xe3plpd (rev3)
URL   : https://patchwork.freedesktop.org/series/161966/
State : success

== Summary ==

CI Bug Log - changes from xe-5759-bb38af66c2f21340a7c081afbb7ace249357fbb5_BAT -> xe-pw-161966v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 14)
------------------------------

  Missing    (1): bat-nvls-1 

Known issues
------------

  Here are the changes found in xe-pw-161966v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] ([Intel XE#8007])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5759-bb38af66c2f21340a7c081afbb7ace249357fbb5/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161966v3/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007


Build changes
-------------

  * Linux: xe-5759-bb38af66c2f21340a7c081afbb7ace249357fbb5 -> xe-pw-161966v3

  IGT_9099: 9099
  xe-5759-bb38af66c2f21340a7c081afbb7ace249357fbb5: bb38af66c2f21340a7c081afbb7ace249357fbb5
  xe-pw-161966v3: 161966v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161966v3/index.html

--===============1522680728178239600==
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
<tr><td><b>Series:</b></td><td>drm/i915/fbc: remove uint16 from supported fbc formats in xe3plpd (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161966/">https://patchwork.freedesktop.org/series/161966/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161966v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161966v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5759-bb38af66c2f21340a7c081afbb7ace249357fbb5_BAT -&gt; xe-pw-161966v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 14)</h2>
<p>Missing    (1): bat-nvls-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161966v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5759-bb38af66c2f21340a7c081afbb7ace249357fbb5/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161966v3/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5759-bb38af66c2f21340a7c081afbb7ace249357fbb5 -&gt; xe-pw-161966v3</li>
</ul>
<p>IGT_9099: 9099<br />
  xe-5759-bb38af66c2f21340a7c081afbb7ace249357fbb5: bb38af66c2f21340a7c081afbb7ace249357fbb5<br />
  xe-pw-161966v3: 161966v3</p>

</body>
</html>

--===============1522680728178239600==--

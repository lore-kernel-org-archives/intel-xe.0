Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531D3C52D6F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 07:14:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E594C10E429;
	Wed,  7 Aug 2024 07:14:18 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3024F10E03B;
 Wed,  7 Aug 2024 07:14:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1462868725197462069=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_usb=3A_typec=3A_ucsi=3A_Fix_a_po?=
 =?utf-8?q?tential_deadlock_in_ucsi=5Fsend=5Fcommand=5Fcommon=28=29_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 Aug 2024 07:14:18 -0000
Message-ID: <172301485818.545143.8757909063759083586@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240807062729.3159701-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20240807062729.3159701-1-chaitanya.kumar.borah@intel.com>
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

--===============1462868725197462069==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: usb: typec: ucsi: Fix a potential deadlock in ucsi_send_command_common() (rev2)
URL   : https://patchwork.freedesktop.org/series/136889/
State : success

== Summary ==

CI Bug Log - changes from xe-1727-194dde5bb5831ec3973cab0a895f1bc94e8ec0b7_BAT -> xe-pw-136889v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-136889v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [PASS][1] -> [FAIL][2] ([Intel XE#886]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1727-194dde5bb5831ec3973cab0a895f1bc94e8ec0b7/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136889v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * Linux: xe-1727-194dde5bb5831ec3973cab0a895f1bc94e8ec0b7 -> xe-pw-136889v2

  IGT_7960: 7960
  xe-1727-194dde5bb5831ec3973cab0a895f1bc94e8ec0b7: 194dde5bb5831ec3973cab0a895f1bc94e8ec0b7
  xe-pw-136889v2: 136889v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136889v2/index.html

--===============1462868725197462069==
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
<tr><td><b>Series:</b></td><td>usb: typec: ucsi: Fix a potential deadlock in ucsi_send_command_common() (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136889/">https://patchwork.freedesktop.org/series/136889/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136889v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136889v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1727-194dde5bb5831ec3973cab0a895f1bc94e8ec0b7_BAT -&gt; xe-pw-136889v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136889v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1727-194dde5bb5831ec3973cab0a895f1bc94e8ec0b7/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136889v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1727-194dde5bb5831ec3973cab0a895f1bc94e8ec0b7 -&gt; xe-pw-136889v2</li>
</ul>
<p>IGT_7960: 7960<br />
  xe-1727-194dde5bb5831ec3973cab0a895f1bc94e8ec0b7: 194dde5bb5831ec3973cab0a895f1bc94e8ec0b7<br />
  xe-pw-136889v2: 136889v2</p>

</body>
</html>

--===============1462868725197462069==--

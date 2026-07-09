Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32D9C43458
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 20:28:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC1E10E256;
	Thu,  9 Jul 2026 20:28:18 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5252E10E256;
 Thu,  9 Jul 2026 20:28:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3127618000958081672=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Reject_PXP_usage_?=
 =?utf-8?q?on_multi-queue_exec_queues?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jagmeet Randhawa" <jagmeet.randhawa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Jul 2026 20:28:17 -0000
Message-ID: <178362889730.172114.16087131571634017643@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <d17f069c16b9e07dfbfae730914b1c095739fe4a.1783626140.git.jagmeet.randhawa@intel.com>
In-Reply-To: <d17f069c16b9e07dfbfae730914b1c095739fe4a.1783626140.git.jagmeet.randhawa@intel.com>
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

--===============3127618000958081672==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Reject PXP usage on multi-queue exec queues
URL   : https://patchwork.freedesktop.org/series/170147/
State : success

== Summary ==

CI Bug Log - changes from xe-5378-e5af800f48075d6b249b979cc8bf210c051d86aa_BAT -> xe-pw-170147v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-170147v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@reltime:
    - bat-atsm-2:         [FAIL][1] -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5378-e5af800f48075d6b249b979cc8bf210c051d86aa/bat-atsm-2/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170147v1/bat-atsm-2/igt@xe_waitfence@reltime.html

  


Build changes
-------------

  * Linux: xe-5378-e5af800f48075d6b249b979cc8bf210c051d86aa -> xe-pw-170147v1

  IGT_8996: 8996
  xe-5378-e5af800f48075d6b249b979cc8bf210c051d86aa: e5af800f48075d6b249b979cc8bf210c051d86aa
  xe-pw-170147v1: 170147v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170147v1/index.html

--===============3127618000958081672==
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
<tr><td><b>Series:</b></td><td>drm/xe: Reject PXP usage on multi-queue exec queues</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170147/">https://patchwork.freedesktop.org/series/170147/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170147v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170147v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5378-e5af800f48075d6b249b979cc8bf210c051d86aa_BAT -&gt; xe-pw-170147v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-170147v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5378-e5af800f48075d6b249b979cc8bf210c051d86aa/bat-atsm-2/igt@xe_waitfence@reltime.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170147v1/bat-atsm-2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5378-e5af800f48075d6b249b979cc8bf210c051d86aa -&gt; xe-pw-170147v1</li>
</ul>
<p>IGT_8996: 8996<br />
  xe-5378-e5af800f48075d6b249b979cc8bf210c051d86aa: e5af800f48075d6b249b979cc8bf210c051d86aa<br />
  xe-pw-170147v1: 170147v1</p>

</body>
</html>

--===============3127618000958081672==--

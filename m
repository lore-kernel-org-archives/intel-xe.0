Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D715C28B30
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 21:56:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A32110E2EA;
	Thu, 20 Mar 2025 21:56:43 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B072910E2EA;
 Thu, 20 Mar 2025 21:56:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1871982660251936561=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_VF=3A_debugfs_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Mar 2025 21:56:41 -0000
Message-ID: <174250780171.61227.3009559029660119156@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250320210738.1733-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250320210738.1733-1-michal.wajdeczko@intel.com>
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

--===============1871982660251936561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: VF: debugfs fixes
URL   : https://patchwork.freedesktop.org/series/146561/
State : success

== Summary ==

CI Bug Log - changes from xe-2828-8fad36bea0fabfbcaec658039f98c833425252e7_BAT -> xe-pw-146561v1_BAT
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

  Here are the changes found in xe-pw-146561v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_vm@munmap-style-unbind-end:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#4491])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2828-8fad36bea0fabfbcaec658039f98c833425252e7/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-end.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146561v1/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-end.html

  
  [Intel XE#4491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491


Build changes
-------------

  * Linux: xe-2828-8fad36bea0fabfbcaec658039f98c833425252e7 -> xe-pw-146561v1

  IGT_8276: 8276
  xe-2828-8fad36bea0fabfbcaec658039f98c833425252e7: 8fad36bea0fabfbcaec658039f98c833425252e7
  xe-pw-146561v1: 146561v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146561v1/index.html

--===============1871982660251936561==
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
<tr><td><b>Series:</b></td><td>VF: debugfs fixes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146561/">https://patchwork.freedesktop.org/series/146561/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146561v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146561v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2828-8fad36bea0fabfbcaec658039f98c833425252e7_BAT -&gt; xe-pw-146561v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-146561v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_vm@munmap-style-unbind-end:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2828-8fad36bea0fabfbcaec658039f98c833425252e7/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-end.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146561v1/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-end.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491">Intel XE#4491</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2828-8fad36bea0fabfbcaec658039f98c833425252e7 -&gt; xe-pw-146561v1</li>
</ul>
<p>IGT_8276: 8276<br />
  xe-2828-8fad36bea0fabfbcaec658039f98c833425252e7: 8fad36bea0fabfbcaec658039f98c833425252e7<br />
  xe-pw-146561v1: 146561v1</p>

</body>
</html>

--===============1871982660251936561==--

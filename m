Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7721ECD98DA
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 00:26:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E25410E25E;
	Tue, 16 Jun 2026 00:26:27 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F28B10E25E;
 Tue, 16 Jun 2026 00:26:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4388487122096611497=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Don=27t_whitelist_OA_regist?=
 =?utf-8?q?ers_unconditionally_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Jun 2026 00:26:26 -0000
Message-ID: <178156958623.81567.14642399533712743180@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260615224227.34880-1-ashutosh.dixit@intel.com>
In-Reply-To: <20260615224227.34880-1-ashutosh.dixit@intel.com>
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

--===============4388487122096611497==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Don't whitelist OA registers unconditionally (rev4)
URL   : https://patchwork.freedesktop.org/series/166809/
State : success

== Summary ==

CI Bug Log - changes from xe-5261-c585a0a7e48a48aca80f7c0acb7294c7bf301bb7_BAT -> xe-pw-166809v4_BAT
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

  Here are the changes found in xe-pw-166809v4_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-vm:         [ABORT][1] ([Intel XE#8007] / [Intel XE#8023]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5261-c585a0a7e48a48aca80f7c0acb7294c7bf301bb7/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166809v4/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html

  
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8023]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8023


Build changes
-------------

  * Linux: xe-5261-c585a0a7e48a48aca80f7c0acb7294c7bf301bb7 -> xe-pw-166809v4

  IGT_8964: 8964
  xe-5261-c585a0a7e48a48aca80f7c0acb7294c7bf301bb7: c585a0a7e48a48aca80f7c0acb7294c7bf301bb7
  xe-pw-166809v4: 166809v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166809v4/index.html

--===============4388487122096611497==
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
<tr><td><b>Series:</b></td><td>Don&#x27;t whitelist OA registers unconditionally (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166809/">https://patchwork.freedesktop.org/series/166809/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166809v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166809v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5261-c585a0a7e48a48aca80f7c0acb7294c7bf301bb7_BAT -&gt; xe-pw-166809v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-166809v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_live_ktest@xe_dma_buf:<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5261-c585a0a7e48a48aca80f7c0acb7294c7bf301bb7/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8023">Intel XE#8023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166809v4/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5261-c585a0a7e48a48aca80f7c0acb7294c7bf301bb7 -&gt; xe-pw-166809v4</li>
</ul>
<p>IGT_8964: 8964<br />
  xe-5261-c585a0a7e48a48aca80f7c0acb7294c7bf301bb7: c585a0a7e48a48aca80f7c0acb7294c7bf301bb7<br />
  xe-pw-166809v4: 166809v4</p>

</body>
</html>

--===============4388487122096611497==--

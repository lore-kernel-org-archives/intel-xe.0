Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4237ACCA476
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 19:59:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0BA710E188;
	Fri, 10 Oct 2025 19:59:02 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDE610E188;
 Fri, 10 Oct 2025 19:59:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8460550807510147997=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/dmc=3A_Test_Xe3LPD?=
 =?utf-8?q?_DMC_v2=2E32?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 10 Oct 2025 19:59:01 -0000
Message-ID: <176012634158.294.6669407953582471933@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251010180240.1032699-1-gustavo.sousa@intel.com>
In-Reply-To: <20251010180240.1032699-1-gustavo.sousa@intel.com>
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

--===============8460550807510147997==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dmc: Test Xe3LPD DMC v2.32
URL   : https://patchwork.freedesktop.org/series/155762/
State : success

== Summary ==

CI Bug Log - changes from xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8_BAT -> xe-pw-155762v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-155762v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@c-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4543]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155762v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#6287]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6287


Build changes
-------------

  * Linux: xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8 -> xe-pw-155762v1

  IGT_8581: 8581
  xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8: c40150f969a0c5c5c08d7a2092485c008aea8fa8
  xe-pw-155762v1: 155762v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155762v1/index.html

--===============8460550807510147997==
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
<tr><td><b>Series:</b></td><td>drm/i915/dmc: Test Xe3LPD DMC v2.32</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155762/">https://patchwork.freedesktop.org/series/155762/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155762v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155762v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8_BAT -&gt; xe-pw-155762v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-155762v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155762v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8 -&gt; xe-pw-155762v1</li>
</ul>
<p>IGT_8581: 8581<br />
  xe-3898-c40150f969a0c5c5c08d7a2092485c008aea8fa8: c40150f969a0c5c5c08d7a2092485c008aea8fa8<br />
  xe-pw-155762v1: 155762v1</p>

</body>
</html>

--===============8460550807510147997==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E596C5AD4E
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 18:59:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E33C10E11B;
	Fri, 20 Feb 2026 18:59:26 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89CB10E11B;
 Fri, 20 Feb 2026 18:59:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8184457251975835927=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_update_the_stolen_memory_al?=
 =?utf-8?q?location_preference_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Feb 2026 18:59:24 -0000
Message-ID: <177161396465.270871.14858878892706781002@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260220170908.201422-1-vinod.govindapillai@intel.com>
In-Reply-To: <20260220170908.201422-1-vinod.govindapillai@intel.com>
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

--===============8184457251975835927==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: update the stolen memory allocation preference (rev2)
URL   : https://patchwork.freedesktop.org/series/161200/
State : failure

== Summary ==

CI Bug Log - changes from xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13_BAT -> xe-pw-161200v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-161200v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-161200v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-161200v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] +12 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html

  


Build changes
-------------

  * Linux: xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13 -> xe-pw-161200v2

  IGT_8764: 8764
  xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13: 5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13
  xe-pw-161200v2: 161200v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v2/index.html

--===============8184457251975835927==
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
<tr><td><b>Series:</b></td><td>update the stolen memory allocation preference (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161200/">https://patchwork.freedesktop.org/series/161200/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13_BAT -&gt; xe-pw-161200v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-161200v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-161200v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-161200v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-dpms:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">DMESG-WARN</a> +12 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13 -&gt; xe-pw-161200v2</li>
</ul>
<p>IGT_8764: 8764<br />
  xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13: 5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13<br />
  xe-pw-161200v2: 161200v2</p>

</body>
</html>

--===============8184457251975835927==--

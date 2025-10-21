Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDDBCCD184
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 15:57:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4886C10E300;
	Tue, 21 Oct 2025 15:57:14 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96FC10E611;
 Tue, 21 Oct 2025 15:57:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0740488813378524722=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Fix_spelling_and_?=
 =?utf-8?q?typos_across_XE_driver_files?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sanjay Yadav" <sanjay.kumar.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 Oct 2025 15:57:13 -0000
Message-ID: <176106223374.36825.11585757678892302315@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251021132054.840023-2-sanjay.kumar.yadav@intel.com>
In-Reply-To: <20251021132054.840023-2-sanjay.kumar.yadav@intel.com>
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

--===============0740488813378524722==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix spelling and typos across XE driver files
URL   : https://patchwork.freedesktop.org/series/156263/
State : success

== Summary ==

CI Bug Log - changes from xe-3955-98fd33882ea53296ba0121286c4e34a76b8bd900_BAT -> xe-pw-156263v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-156263v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@b-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4543]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3955-98fd33882ea53296ba0121286c4e34a76b8bd900/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156263v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * Linux: xe-3955-98fd33882ea53296ba0121286c4e34a76b8bd900 -> xe-pw-156263v1

  IGT_8594: 8594
  xe-3955-98fd33882ea53296ba0121286c4e34a76b8bd900: 98fd33882ea53296ba0121286c4e34a76b8bd900
  xe-pw-156263v1: 156263v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156263v1/index.html

--===============0740488813378524722==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix spelling and typos across XE driver files</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156263/">https://patchwork.freedesktop.org/series/156263/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156263v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156263v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3955-98fd33882ea53296ba0121286c4e34a76b8bd900_BAT -&gt; xe-pw-156263v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156263v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@b-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3955-98fd33882ea53296ba0121286c4e34a76b8bd900/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156263v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3955-98fd33882ea53296ba0121286c4e34a76b8bd900 -&gt; xe-pw-156263v1</li>
</ul>
<p>IGT_8594: 8594<br />
  xe-3955-98fd33882ea53296ba0121286c4e34a76b8bd900: 98fd33882ea53296ba0121286c4e34a76b8bd900<br />
  xe-pw-156263v1: 156263v1</p>

</body>
</html>

--===============0740488813378524722==--

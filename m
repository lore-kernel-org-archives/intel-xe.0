Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25790C83F22
	for <intel-xe@archiver.kernel.org>; Wed, 16 Jul 2025 11:16:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E9D10E7A8;
	Wed, 16 Jul 2025 11:16:50 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEFFF10E79D;
 Wed, 16 Jul 2025 11:16:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1984598236175874187=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/sched=3A_Avoid_double_r?=
 =?utf-8?q?e-lock_on_the_job_free_path_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Jul 2025 11:16:49 -0000
Message-ID: <175266460970.166334.14361293168497228887@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250716085117.56864-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250716085117.56864-1-tvrtko.ursulin@igalia.com>
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

--===============1984598236175874187==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/sched: Avoid double re-lock on the job free path (rev4)
URL   : https://patchwork.freedesktop.org/series/151331/
State : success

== Summary ==

CI Bug Log - changes from xe-3420-69e98a7d66784ff8a833b2b7ef4290ae3f083c5f_BAT -> xe-pw-151331v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-151331v4_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@b-edp1:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#4543]) -> [PASS][2] +3 other tests pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3420-69e98a7d66784ff8a833b2b7ef4290ae3f083c5f/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151331v4/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * Linux: xe-3420-69e98a7d66784ff8a833b2b7ef4290ae3f083c5f -> xe-pw-151331v4

  IGT_8460: 8460
  xe-3420-69e98a7d66784ff8a833b2b7ef4290ae3f083c5f: 69e98a7d66784ff8a833b2b7ef4290ae3f083c5f
  xe-pw-151331v4: 151331v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151331v4/index.html

--===============1984598236175874187==
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
<tr><td><b>Series:</b></td><td>drm/sched: Avoid double re-lock on the job free path (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151331/">https://patchwork.freedesktop.org/series/151331/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151331v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151331v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3420-69e98a7d66784ff8a833b2b7ef4290ae3f083c5f_BAT -&gt; xe-pw-151331v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-151331v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@b-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3420-69e98a7d66784ff8a833b2b7ef4290ae3f083c5f/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151331v4/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3420-69e98a7d66784ff8a833b2b7ef4290ae3f083c5f -&gt; xe-pw-151331v4</li>
</ul>
<p>IGT_8460: 8460<br />
  xe-3420-69e98a7d66784ff8a833b2b7ef4290ae3f083c5f: 69e98a7d66784ff8a833b2b7ef4290ae3f083c5f<br />
  xe-pw-151331v4: 151331v4</p>

</body>
</html>

--===============1984598236175874187==--

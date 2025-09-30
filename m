Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97B7CAC5B0
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 02:45:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883AF10E4B6;
	Tue, 30 Sep 2025 02:45:29 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA4010E3EF;
 Tue, 30 Sep 2025 02:45:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9188822976277501528=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/doc=3A_Add_documenta?=
 =?utf-8?q?tion_for_Execution_Queues?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 30 Sep 2025 02:45:29 -0000
Message-ID: <175920032910.377218.10829391434433632766@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250930015901.411468-2-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20250930015901.411468-2-niranjana.vishwanathapura@intel.com>
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

--===============9188822976277501528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/doc: Add documentation for Execution Queues
URL   : https://patchwork.freedesktop.org/series/155190/
State : success

== Summary ==

CI Bug Log - changes from xe-3843-85a5199d1e7b009e10b7c2cad0c43d28f0540085_BAT -> xe-pw-155190v1_BAT
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

  Here are the changes found in xe-pw-155190v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@a-edp1:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#4543]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2cad0c43d28f0540085/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155190v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * IGT: IGT_8557 -> IGT_8558
  * Linux: xe-3843-85a5199d1e7b009e10b7c2cad0c43d28f0540085 -> xe-pw-155190v1

  IGT_8557: 8557
  IGT_8558: 8d523a5eb4860834ed1ba97dd08d591d9272f837 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3843-85a5199d1e7b009e10b7c2cad0c43d28f0540085: 85a5199d1e7b009e10b7c2cad0c43d28f0540085
  xe-pw-155190v1: 155190v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155190v1/index.html

--===============9188822976277501528==
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
<tr><td><b>Series:</b></td><td>drm/xe/doc: Add documentation for Execution Queues</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155190/">https://patchwork.freedesktop.org/series/155190/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155190v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155190v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3843-85a5199d1e7b009e10b7c2cad0c43d28f0540085_BAT -&gt; xe-pw-155190v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-155190v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@a-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3843-85a5199d1e7b009e10b7c2cad0c43d28f0540085/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155190v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8557 -&gt; IGT_8558</li>
<li>Linux: xe-3843-85a5199d1e7b009e10b7c2cad0c43d28f0540085 -&gt; xe-pw-155190v1</li>
</ul>
<p>IGT_8557: 8557<br />
  IGT_8558: 8d523a5eb4860834ed1ba97dd08d591d9272f837 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3843-85a5199d1e7b009e10b7c2cad0c43d28f0540085: 85a5199d1e7b009e10b7c2cad0c43d28f0540085<br />
  xe-pw-155190v1: 155190v1</p>

</body>
</html>

--===============9188822976277501528==--

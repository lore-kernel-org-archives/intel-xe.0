Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18208C87FC9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 09:46:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D42EE10E15E;
	Wed, 30 Jul 2025 09:46:11 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42AD10E15E;
 Wed, 30 Jul 2025 09:46:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4924403948791355044=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Patch_=22Revert_=22drm/xe/t?=
 =?utf-8?q?ests/mocs=3A_Update_xe=5Fforce=5Fwake=5Fget=28=29_return_handling?=
 =?utf-8?q?=22=22_has_been_added_to_the_6=2E12-stable_tree?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: gregkh@linuxfoundation.org
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 30 Jul 2025 09:46:10 -0000
Message-ID: <175386877086.197938.12155336867362670137@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250729110525.49838-3-tomitamoeko@gmail.com>
In-Reply-To: <20250729110525.49838-3-tomitamoeko@gmail.com>
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

--===============4924403948791355044==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Patch "Revert "drm/xe/tests/mocs: Update xe_force_wake_get() return handling"" has been added to the 6.12-stable tree
URL   : https://patchwork.freedesktop.org/series/152266/
State : success

== Summary ==

CI Bug Log - changes from xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741_BAT -> xe-pw-152266v1_BAT
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

  Here are the changes found in xe-pw-152266v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@a-edp1:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#4543]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * Linux: xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741 -> xe-pw-152266v1

  IGT_8478: 3e7c2bd685397f852853878aef4d9c1e4889a28b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741: 9378b693d04cb60c6d1b13150244c480a7cd2741
  xe-pw-152266v1: 152266v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/index.html

--===============4924403948791355044==
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
<tr><td><b>Series:</b></td><td>Patch &quot;Revert &quot;drm/xe/tests/mocs: Update xe_force_wake_get() return handling&quot;&quot; has been added to the 6.12-stable tree</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152266/">https://patchwork.freedesktop.org/series/152266/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741_BAT -&gt; xe-pw-152266v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152266v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@a-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152266v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741 -&gt; xe-pw-152266v1</li>
</ul>
<p>IGT_8478: 3e7c2bd685397f852853878aef4d9c1e4889a28b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3487-9378b693d04cb60c6d1b13150244c480a7cd2741: 9378b693d04cb60c6d1b13150244c480a7cd2741<br />
  xe-pw-152266v1: 152266v1</p>

</body>
</html>

--===============4924403948791355044==--

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8E9C36005
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 22:26:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5766810E605;
	Tue, 25 Mar 2025 22:26:00 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B965210E605;
 Tue, 25 Mar 2025 22:25:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4684879689321407697=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/guc=3A_Re-word_messa?=
 =?utf-8?q?ge_about_ADS_size_changes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Mar 2025 22:25:58 -0000
Message-ID: <174294155875.2974.14262679167773464832@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250325203211.3907890-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250325203211.3907890-1-John.C.Harrison@Intel.com>
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

--===============4684879689321407697==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Re-word message about ADS size changes
URL   : https://patchwork.freedesktop.org/series/146763/
State : success

== Summary ==

CI Bug Log - changes from xe-2852-b70bbb26ec306486f2ece84a9876d7eefa21da26_BAT -> xe-pw-146763v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-146763v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#4520]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2852-b70bbb26ec306486f2ece84a9876d7eefa21da26/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146763v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  
  [Intel XE#4520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4520


Build changes
-------------

  * Linux: xe-2852-b70bbb26ec306486f2ece84a9876d7eefa21da26 -> xe-pw-146763v1

  IGT_8283: e4eb2265f06fc69e37e56cb6b609e019b6071435 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2852-b70bbb26ec306486f2ece84a9876d7eefa21da26: b70bbb26ec306486f2ece84a9876d7eefa21da26
  xe-pw-146763v1: 146763v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146763v1/index.html

--===============4684879689321407697==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Re-word message about ADS size changes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146763/">https://patchwork.freedesktop.org/series/146763/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146763v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146763v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2852-b70bbb26ec306486f2ece84a9876d7eefa21da26_BAT -&gt; xe-pw-146763v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-146763v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_migrate:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2852-b70bbb26ec306486f2ece84a9876d7eefa21da26/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146763v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4520">Intel XE#4520</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2852-b70bbb26ec306486f2ece84a9876d7eefa21da26 -&gt; xe-pw-146763v1</li>
</ul>
<p>IGT_8283: e4eb2265f06fc69e37e56cb6b609e019b6071435 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2852-b70bbb26ec306486f2ece84a9876d7eefa21da26: b70bbb26ec306486f2ece84a9876d7eefa21da26<br />
  xe-pw-146763v1: 146763v1</p>

</body>
</html>

--===============4684879689321407697==--

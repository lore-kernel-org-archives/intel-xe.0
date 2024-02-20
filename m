Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA680C48BC4
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 21:49:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7192410E4CF;
	Tue, 20 Feb 2024 21:49:47 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBF110E107;
 Tue, 20 Feb 2024 21:49:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7582042775022795247=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Fix_cast_on_trace_vari?=
 =?utf-8?q?able_again?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Feb 2024 21:49:46 -0000
Message-ID: <170846578617.132386.18065411387796382769@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240220205607.1873084-1-lucas.demarchi@intel.com>
In-Reply-To: <20240220205607.1873084-1-lucas.demarchi@intel.com>
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

--===============7582042775022795247==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix cast on trace variable again
URL   : https://patchwork.freedesktop.org/series/130151/
State : success

== Summary ==

CI Bug Log - changes from xe-807-e2b02e89746d8eff8c244f938eecd0f1db8eb805_BAT -> xe-pw-130151v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-130151v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - bat-pvc-2:          [INCOMPLETE][1] ([Intel XE#392]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-807-e2b02e89746d8eff8c244f938eecd0f1db8eb805/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130151v1/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392


Build changes
-------------

  * Linux: xe-807-e2b02e89746d8eff8c244f938eecd0f1db8eb805 -> xe-pw-130151v1

  IGT_7718: 40e8b9122853f455c84afcfa56469a6bc9a0d564 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-807-e2b02e89746d8eff8c244f938eecd0f1db8eb805: e2b02e89746d8eff8c244f938eecd0f1db8eb805
  xe-pw-130151v1: 130151v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130151v1/index.html

--===============7582042775022795247==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix cast on trace variable again</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130151/">https://patchwork.freedesktop.org/series/130151/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130151v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130151v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-807-e2b02e89746d8eff8c244f938eecd0f1db8eb805_BAT -&gt; xe-pw-130151v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-130151v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-807-e2b02e89746d8eff8c244f938eecd0f1db8eb805/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130151v1/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-807-e2b02e89746d8eff8c244f938eecd0f1db8eb805 -&gt; xe-pw-130151v1</li>
</ul>
<p>IGT_7718: 40e8b9122853f455c84afcfa56469a6bc9a0d564 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-807-e2b02e89746d8eff8c244f938eecd0f1db8eb805: e2b02e89746d8eff8c244f938eecd0f1db8eb805<br />
  xe-pw-130151v1: 130151v1</p>

</body>
</html>

--===============7582042775022795247==--

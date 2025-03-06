Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCE8C282D1
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 10:17:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C9F10E8A7;
	Thu,  6 Mar 2025 10:17:48 +0000 (UTC)
Received: from 64e06c682a23 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C56E10E157;
 Thu,  6 Mar 2025 10:17:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1504028723589275477=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Introduce_GPU_SVM_and_Xe_SV?=
 =?utf-8?q?M_implementation_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Mar 2025 10:17:47 -0000
Message-ID: <174125626750.66908.15014023031543665388@64e06c682a23>
X-Patchwork-Hint: ignore
References: <20250306012657.3505757-1-matthew.brost@intel.com>
In-Reply-To: <20250306012657.3505757-1-matthew.brost@intel.com>
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

--===============1504028723589275477==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce GPU SVM and Xe SVM implementation (rev8)
URL   : https://patchwork.freedesktop.org/series/137870/
State : failure

== Summary ==

CI Bug Log - changes from xe-2764-6729782b064be5b1a67ff7ba2a0299532e19ff09_BAT -> xe-pw-137870v8_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-137870v8_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-137870v8_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-137870v8_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2764-6729782b064be5b1a67ff7ba2a0299532e19ff09/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v8/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  


Build changes
-------------

  * Linux: xe-2764-6729782b064be5b1a67ff7ba2a0299532e19ff09 -> xe-pw-137870v8

  IGT_8262: 8262
  xe-2764-6729782b064be5b1a67ff7ba2a0299532e19ff09: 6729782b064be5b1a67ff7ba2a0299532e19ff09
  xe-pw-137870v8: 137870v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v8/index.html

--===============1504028723589275477==
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
<tr><td><b>Series:</b></td><td>Introduce GPU SVM and Xe SVM implementation (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137870/">https://patchwork.freedesktop.org/series/137870/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v8/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2764-6729782b064be5b1a67ff7ba2a0299532e19ff09_BAT -&gt; xe-pw-137870v8_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-137870v8_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-137870v8_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-137870v8_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_live_ktest@xe_migrate:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2764-6729782b064be5b1a67ff7ba2a0299532e19ff09/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v8/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2764-6729782b064be5b1a67ff7ba2a0299532e19ff09 -&gt; xe-pw-137870v8</li>
</ul>
<p>IGT_8262: 8262<br />
  xe-2764-6729782b064be5b1a67ff7ba2a0299532e19ff09: 6729782b064be5b1a67ff7ba2a0299532e19ff09<br />
  xe-pw-137870v8: 137870v8</p>

</body>
</html>

--===============1504028723589275477==--

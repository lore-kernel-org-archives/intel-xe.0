Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C9EBEFD23F
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 05:26:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC40C10E059;
	Thu, 26 Feb 2026 05:26:11 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0C410E059;
 Thu, 26 Feb 2026 05:26:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3556714883403718793=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Fine_grained_fault_locking?=
 =?utf-8?q?=2C_threaded_prefetch=2C_storm_cache_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Feb 2026 05:26:10 -0000
Message-ID: <177208357039.289698.5722397551489087128@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260226042834.2963245-1-matthew.brost@intel.com>
In-Reply-To: <20260226042834.2963245-1-matthew.brost@intel.com>
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

--===============3556714883403718793==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fine grained fault locking, threaded prefetch, storm cache (rev4)
URL   : https://patchwork.freedesktop.org/series/162167/
State : failure

== Summary ==

CI Bug Log - changes from xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440_BAT -> xe-pw-162167v4_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-162167v4_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-162167v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-162167v4_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_debugfs@read-all-entries:
    - bat-adlp-vm:        [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/bat-adlp-vm/igt@core_debugfs@read-all-entries.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v4/bat-adlp-vm/igt@core_debugfs@read-all-entries.html
    - bat-atsm-2:         [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/bat-atsm-2/igt@core_debugfs@read-all-entries.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v4/bat-atsm-2/igt@core_debugfs@read-all-entries.html

  


Build changes
-------------

  * Linux: xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440 -> xe-pw-162167v4

  IGT_8772: 8772
  xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440: f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440
  xe-pw-162167v4: 162167v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v4/index.html

--===============3556714883403718793==
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
<tr><td><b>Series:</b></td><td>Fine grained fault locking, threaded prefetch, storm cache (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162167/">https://patchwork.freedesktop.org/series/162167/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440_BAT -&gt; xe-pw-162167v4_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-162167v4_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-162167v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-162167v4_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_debugfs@read-all-entries:<ul>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/bat-adlp-vm/igt@core_debugfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v4/bat-adlp-vm/igt@core_debugfs@read-all-entries.html">ABORT</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/bat-atsm-2/igt@core_debugfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v4/bat-atsm-2/igt@core_debugfs@read-all-entries.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440 -&gt; xe-pw-162167v4</li>
</ul>
<p>IGT_8772: 8772<br />
  xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440: f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440<br />
  xe-pw-162167v4: 162167v4</p>

</body>
</html>

--===============3556714883403718793==--

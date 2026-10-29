Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53414606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 09:26:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1038710E7AA;
	Thu, 29 Oct 2026 09:26:59 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F2E10E7AA;
 Thu, 29 Oct 2026 09:26:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5397388415237547878=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_CPER_logging_support_fo?=
 =?utf-8?q?r_CRI_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 Oct 2026 09:26:58 -0000
Message-ID: <179326601807.86838.6232173793114195274@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261029082752.1739281-12-badal.nilawar@intel.com>
In-Reply-To: <20261029082752.1739281-12-badal.nilawar@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5397388415237547878==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add CPER logging support for CRI (rev7)
URL   : https://patchwork.freedesktop.org/series/169692/
State : success

== Summary ==

CI Bug Log - changes from xe-6028-8f4ea34f33525cf5120a2a68ee119ef0df276795_BAT -> xe-pw-169692v7_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-169692v7_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_create@create-execqueues-noleak:
    - bat-ptl-2:          NOTRUN -> [ABORT][1] ([Intel XE#9362])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v7/bat-ptl-2/igt@xe_create@create-execqueues-noleak.html

  
#### Possible fixes ####

  * igt@xe_compute_preempt@compute-threadgroup-preempt:
    - bat-ptl-2:          [ABORT][2] ([Intel XE#9362]) -> [PASS][3] +1 other test pass
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6028-8f4ea34f33525cf5120a2a68ee119ef0df276795/bat-ptl-2/igt@xe_compute_preempt@compute-threadgroup-preempt.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v7/bat-ptl-2/igt@xe_compute_preempt@compute-threadgroup-preempt.html

  
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362


Build changes
-------------

  * Linux: xe-6028-8f4ea34f33525cf5120a2a68ee119ef0df276795 -> xe-pw-169692v7

  IGT_9170: 9170
  xe-6028-8f4ea34f33525cf5120a2a68ee119ef0df276795: 8f4ea34f33525cf5120a2a68ee119ef0df276795
  xe-pw-169692v7: 169692v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v7/index.html

--===============5397388415237547878==
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
<tr><td><b>Series:</b></td><td>Add CPER logging support for CRI (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169692/">https://patchwork.freedesktop.org/series/169692/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6028-8f4ea34f33525cf5120a2a68ee119ef0df276795_BAT -&gt; xe-pw-169692v7_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-169692v7_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_create@create-execqueues-noleak:<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v7/bat-ptl-2/igt@xe_create@create-execqueues-noleak.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_compute_preempt@compute-threadgroup-preempt:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6028-8f4ea34f33525cf5120a2a68ee119ef0df276795/bat-ptl-2/igt@xe_compute_preempt@compute-threadgroup-preempt.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v7/bat-ptl-2/igt@xe_compute_preempt@compute-threadgroup-preempt.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6028-8f4ea34f33525cf5120a2a68ee119ef0df276795 -&gt; xe-pw-169692v7</li>
</ul>
<p>IGT_9170: 9170<br />
  xe-6028-8f4ea34f33525cf5120a2a68ee119ef0df276795: 8f4ea34f33525cf5120a2a68ee119ef0df276795<br />
  xe-pw-169692v7: 169692v7</p>

</body>
</html>

--===============5397388415237547878==--

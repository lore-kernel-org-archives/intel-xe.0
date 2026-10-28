Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E61606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 09:32:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A5410E5A3;
	Wed, 28 Oct 2026 09:32:11 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB0310E5A3;
 Wed, 28 Oct 2026 09:32:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0183499360719992145=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/xe=5Fpci=5Ferror=3A_?=
 =?utf-8?q?Wait_for_pcode_init_post_SBR?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Oct 2026 09:32:09 -0000
Message-ID: <179317992938.80440.3824524706085984487@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261028072803.937955-2-riana.tauro@intel.com>
In-Reply-To: <20261028072803.937955-2-riana.tauro@intel.com>
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

--===============0183499360719992145==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_pci_error: Wait for pcode init post SBR
URL   : https://patchwork.freedesktop.org/series/177007/
State : success

== Summary ==

CI Bug Log - changes from xe-6018-6a182ac542350dbca9147134654c35e463aa1382_BAT -> xe-pw-177007v1_BAT
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

  Here are the changes found in xe-pw-177007v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_create@create-execqueues-noleak:
    - bat-ptl-2:          NOTRUN -> [ABORT][1] ([Intel XE#9362])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177007v1/bat-ptl-2/igt@xe_create@create-execqueues-noleak.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - bat-atsm-2:         NOTRUN -> [SKIP][2] ([Intel XE#288]) +32 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177007v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  
#### Possible fixes ####

  * igt@xe_compute_preempt@compute-threadgroup-preempt:
    - bat-ptl-2:          [ABORT][3] ([Intel XE#9362]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6018-6a182ac542350dbca9147134654c35e463aa1382/bat-ptl-2/igt@xe_compute_preempt@compute-threadgroup-preempt.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177007v1/bat-ptl-2/igt@xe_compute_preempt@compute-threadgroup-preempt.html

  * igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:
    - bat-atsm-2:         [ABORT][5] ([Intel XE#9663]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6018-6a182ac542350dbca9147134654c35e463aa1382/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177007v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html

  
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9663]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9663


Build changes
-------------

  * Linux: xe-6018-6a182ac542350dbca9147134654c35e463aa1382 -> xe-pw-177007v1

  IGT_9168: 9168
  xe-6018-6a182ac542350dbca9147134654c35e463aa1382: 6a182ac542350dbca9147134654c35e463aa1382
  xe-pw-177007v1: 177007v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177007v1/index.html

--===============0183499360719992145==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_pci_error: Wait for pcode init post SBR</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177007/">https://patchwork.freedesktop.org/series/177007/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177007v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177007v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6018-6a182ac542350dbca9147134654c35e463aa1382_BAT -&gt; xe-pw-177007v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-177007v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_create@create-execqueues-noleak:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177007v1/bat-ptl-2/igt@xe_create@create-execqueues-noleak.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177007v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6018-6a182ac542350dbca9147134654c35e463aa1382/bat-ptl-2/igt@xe_compute_preempt@compute-threadgroup-preempt.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177007v1/bat-ptl-2/igt@xe_compute_preempt@compute-threadgroup-preempt.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6018-6a182ac542350dbca9147134654c35e463aa1382/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9663">Intel XE#9663</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177007v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6018-6a182ac542350dbca9147134654c35e463aa1382 -&gt; xe-pw-177007v1</li>
</ul>
<p>IGT_9168: 9168<br />
  xe-6018-6a182ac542350dbca9147134654c35e463aa1382: 6a182ac542350dbca9147134654c35e463aa1382<br />
  xe-pw-177007v1: 177007v1</p>

</body>
</html>

--===============0183499360719992145==--

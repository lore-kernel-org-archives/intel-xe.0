Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B663E606A320
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 03:54:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7166D10E582;
	Thu, 19 Nov 2026 03:54:02 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27CCF10E582;
 Thu, 19 Nov 2026 03:54:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5325066133936349705=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bv4?=
 =?utf-8?q?=2C1/2=5D_drm/xe/wopcm=3A_Use_the_size_from_HW_when_excluding_the?=
 =?utf-8?q?_wopcm_range_from_GGTT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Nov 2026 03:54:01 -0000
Message-ID: <179506044115.48288.13812867156130453136@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261118220120.109186-3-daniele.ceraolospurio@intel.com>
In-Reply-To: <20261118220120.109186-3-daniele.ceraolospurio@intel.com>
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

--===============5325066133936349705==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v4,1/2] drm/xe/wopcm: Use the size from HW when excluding the wopcm range from GGTT
URL   : https://patchwork.freedesktop.org/series/178976/
State : success

== Summary ==

CI Bug Log - changes from xe-6183-7f983558aaf724daeafb5904dbb078835857b51e_BAT -> xe-pw-178976v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 15)
------------------------------

  Additional (1): bat-bmg-vm 

Known issues
------------

  Here are the changes found in xe-pw-178976v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_multi_queue@many-queues-userptr-invalidate:
    - bat-bmg-vm:         NOTRUN -> [SKIP][1] ([Intel XE#8364]) +13 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178976v1/bat-bmg-vm/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-bmg-vm:         NOTRUN -> [SKIP][2] ([Intel XE#2229])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178976v1/bat-bmg-vm/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-bmg-vm:         NOTRUN -> [SKIP][3] ([Intel XE#1420] / [Intel XE#7590])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178976v1/bat-bmg-vm/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-bmg-vm:         NOTRUN -> [SKIP][4] ([Intel XE#2245] / [Intel XE#7590])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178976v1/bat-bmg-vm/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-bmg-vm:         NOTRUN -> [SKIP][5] ([Intel XE#2236] / [Intel XE#7590])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178976v1/bat-bmg-vm/igt@xe_pat@pat-index-xelpg.html

  
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364


Build changes
-------------

  * Linux: xe-6183-7f983558aaf724daeafb5904dbb078835857b51e -> xe-pw-178976v1

  IGT_9198: 9198
  xe-6183-7f983558aaf724daeafb5904dbb078835857b51e: 7f983558aaf724daeafb5904dbb078835857b51e
  xe-pw-178976v1: 178976v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178976v1/index.html

--===============5325066133936349705==
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
<tr><td><b>Series:</b></td><td>series starting with [v4,1/2] drm/xe/wopcm: Use the size from HW when excluding the wopcm range from GGTT</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178976/">https://patchwork.freedesktop.org/series/178976/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178976v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178976v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6183-7f983558aaf724daeafb5904dbb078835857b51e_BAT -&gt; xe-pw-178976v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 15)</h2>
<p>Additional (1): bat-bmg-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-178976v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_multi_queue@many-queues-userptr-invalidate:</p>
<ul>
<li>bat-bmg-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178976v1/bat-bmg-vm/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-bmg-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178976v1/bat-bmg-vm/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-bmg-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178976v1/bat-bmg-vm/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-bmg-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178976v1/bat-bmg-vm/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-bmg-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178976v1/bat-bmg-vm/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6183-7f983558aaf724daeafb5904dbb078835857b51e -&gt; xe-pw-178976v1</li>
</ul>
<p>IGT_9198: 9198<br />
  xe-6183-7f983558aaf724daeafb5904dbb078835857b51e: 7f983558aaf724daeafb5904dbb078835857b51e<br />
  xe-pw-178976v1: 178976v1</p>

</body>
</html>

--===============5325066133936349705==--

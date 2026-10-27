Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DA5606A338
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 16:18:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E3F10F6EA;
	Tue, 27 Oct 2026 16:18:23 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E275610F6E2;
 Tue, 27 Oct 2026 16:18:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3916486491107893847=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/2?=
 =?utf-8?q?=5D_drm/xe/migrate=3A_Keep_access=5Fmemory_chunks_within_the_tran?=
 =?utf-8?q?sfer_limit?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 Oct 2026 16:18:21 -0000
Message-ID: <179311790192.77788.13509872889755382028@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261027145237.1862132-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20261027145237.1862132-1-mika.kuoppala@linux.intel.com>
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

--===============3916486491107893847==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe/migrate: Keep access_memory chunks within the transfer limit
URL   : https://patchwork.freedesktop.org/series/176960/
State : success

== Summary ==

CI Bug Log - changes from xe-6015-4fae0a24d63d617b8651b1cc247c3a36bc1eff32_BAT -> xe-pw-176960v1_BAT
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

  Here are the changes found in xe-pw-176960v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] ([Intel XE#9463])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6015-4fae0a24d63d617b8651b1cc247c3a36bc1eff32/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176960v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:
    - bat-atsm-2:         [PASS][3] -> [ABORT][4] ([Intel XE#9663]) +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6015-4fae0a24d63d617b8651b1cc247c3a36bc1eff32/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176960v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html

  
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463
  [Intel XE#9663]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9663


Build changes
-------------

  * Linux: xe-6015-4fae0a24d63d617b8651b1cc247c3a36bc1eff32 -> xe-pw-176960v1

  IGT_9167: 9167
  xe-6015-4fae0a24d63d617b8651b1cc247c3a36bc1eff32: 4fae0a24d63d617b8651b1cc247c3a36bc1eff32
  xe-pw-176960v1: 176960v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176960v1/index.html

--===============3916486491107893847==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe/migrate: Keep access_memory chunks within the transfer limit</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176960/">https://patchwork.freedesktop.org/series/176960/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176960v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176960v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6015-4fae0a24d63d617b8651b1cc247c3a36bc1eff32_BAT -&gt; xe-pw-176960v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-176960v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6015-4fae0a24d63d617b8651b1cc247c3a36bc1eff32/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176960v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6015-4fae0a24d63d617b8651b1cc247c3a36bc1eff32/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176960v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9663">Intel XE#9663</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6015-4fae0a24d63d617b8651b1cc247c3a36bc1eff32 -&gt; xe-pw-176960v1</li>
</ul>
<p>IGT_9167: 9167<br />
  xe-6015-4fae0a24d63d617b8651b1cc247c3a36bc1eff32: 4fae0a24d63d617b8651b1cc247c3a36bc1eff32<br />
  xe-pw-176960v1: 176960v1</p>

</body>
</html>

--===============3916486491107893847==--

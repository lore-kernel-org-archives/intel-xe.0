Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314A5606A325
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 17:48:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E05BE10E5F3;
	Thu, 19 Nov 2026 17:48:19 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225A510E4AA;
 Thu, 19 Nov 2026 17:48:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9130236257186007000=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_gpu/buddy=3A_find_range-bia?=
 =?utf-8?q?sed_blocks_in_the_free_trees?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "William Palacek" <william.palacek@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Nov 2026 17:48:18 -0000
Message-ID: <179511049813.53767.9537911846911633677@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <cover.1795094029.git.William.Palacek@amd.com>
In-Reply-To: <cover.1795094029.git.William.Palacek@amd.com>
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

--===============9130236257186007000==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gpu/buddy: find range-biased blocks in the free trees
URL   : https://patchwork.freedesktop.org/series/179088/
State : success

== Summary ==

CI Bug Log - changes from xe-6188-d05450d36ef3d0f6e4ce4b26a831003847a7e75d_BAT -> xe-pw-179088v1_BAT
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

  Here are the changes found in xe-pw-179088v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] ([Intel XE#9463])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6188-d05450d36ef3d0f6e4ce4b26a831003847a7e75d/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179088v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463


Build changes
-------------

  * IGT: IGT_9198 -> IGT_9199
  * Linux: xe-6188-d05450d36ef3d0f6e4ce4b26a831003847a7e75d -> xe-pw-179088v1

  IGT_9198: 9198
  IGT_9199: f28241ac1ad57574315e7bd31b174294cca2f29c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-6188-d05450d36ef3d0f6e4ce4b26a831003847a7e75d: d05450d36ef3d0f6e4ce4b26a831003847a7e75d
  xe-pw-179088v1: 179088v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179088v1/index.html

--===============9130236257186007000==
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
<tr><td><b>Series:</b></td><td>gpu/buddy: find range-biased blocks in the free trees</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179088/">https://patchwork.freedesktop.org/series/179088/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179088v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179088v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6188-d05450d36ef3d0f6e4ce4b26a831003847a7e75d_BAT -&gt; xe-pw-179088v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-179088v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6188-d05450d36ef3d0f6e4ce4b26a831003847a7e75d/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179088v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9198 -&gt; IGT_9199</li>
<li>Linux: xe-6188-d05450d36ef3d0f6e4ce4b26a831003847a7e75d -&gt; xe-pw-179088v1</li>
</ul>
<p>IGT_9198: 9198<br />
  IGT_9199: f28241ac1ad57574315e7bd31b174294cca2f29c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-6188-d05450d36ef3d0f6e4ce4b26a831003847a7e75d: d05450d36ef3d0f6e4ce4b26a831003847a7e75d<br />
  xe-pw-179088v1: 179088v1</p>

</body>
</html>

--===============9130236257186007000==--

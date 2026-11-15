Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2978606A337
	for <intel-xe@archiver.kernel.org>; Sun, 15 Nov 2026 09:39:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 937B610E26B;
	Sun, 15 Nov 2026 09:39:47 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F7A10E02A;
 Sun, 15 Nov 2026 09:39:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7909035058485741656=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_CI-ONLY_Fix_VM_teardown_and?=
 =?utf-8?q?_migration_queue_recovery_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 15 Nov 2026 09:39:47 -0000
Message-ID: <179473558719.26240.2496017173689816927@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261115085518.1135138-1-arvind.yadav@intel.com>
In-Reply-To: <20261115085518.1135138-1-arvind.yadav@intel.com>
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

--===============7909035058485741656==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: CI-ONLY Fix VM teardown and migration queue recovery (rev4)
URL   : https://patchwork.freedesktop.org/series/178420/
State : success

== Summary ==

CI Bug Log - changes from xe-6142-419bb0e4cadd214a0847010c02ade95e5fc511f7_BAT -> xe-pw-178420v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-178420v4_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] ([Intel XE#9463])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6142-419bb0e4cadd214a0847010c02ade95e5fc511f7/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178420v4/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463


Build changes
-------------

  * Linux: xe-6142-419bb0e4cadd214a0847010c02ade95e5fc511f7 -> xe-pw-178420v4

  IGT_9192: 9192
  xe-6142-419bb0e4cadd214a0847010c02ade95e5fc511f7: 419bb0e4cadd214a0847010c02ade95e5fc511f7
  xe-pw-178420v4: 178420v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178420v4/index.html

--===============7909035058485741656==
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
<tr><td><b>Series:</b></td><td>CI-ONLY Fix VM teardown and migration queue recovery (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178420/">https://patchwork.freedesktop.org/series/178420/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178420v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178420v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6142-419bb0e4cadd214a0847010c02ade95e5fc511f7_BAT -&gt; xe-pw-178420v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-178420v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6142-419bb0e4cadd214a0847010c02ade95e5fc511f7/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178420v4/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6142-419bb0e4cadd214a0847010c02ade95e5fc511f7 -&gt; xe-pw-178420v4</li>
</ul>
<p>IGT_9192: 9192<br />
  xe-6142-419bb0e4cadd214a0847010c02ade95e5fc511f7: 419bb0e4cadd214a0847010c02ade95e5fc511f7<br />
  xe-pw-178420v4: 178420v4</p>

</body>
</html>

--===============7909035058485741656==--

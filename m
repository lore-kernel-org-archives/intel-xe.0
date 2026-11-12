Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFC2606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 22:15:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412D01123B0;
	Thu, 12 Nov 2026 22:15:36 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C256C10E67C;
 Thu, 12 Nov 2026 22:15:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4939072306156676692=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Set_up_for_debug_configfs_g?=
 =?utf-8?q?roup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Nov 2026 22:15:35 -0000
Message-ID: <179452173578.17407.12407696468064455951@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261112213508.457213-10-stuart.summers@intel.com>
In-Reply-To: <20261112213508.457213-10-stuart.summers@intel.com>
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

--===============4939072306156676692==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Set up for debug configfs group
URL   : https://patchwork.freedesktop.org/series/178440/
State : success

== Summary ==

CI Bug Log - changes from xe-6129-ff450c62bc560177d72d0520f53ed445bbf704f6_BAT -> xe-pw-178440v1_BAT
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

  Here are the changes found in xe-pw-178440v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [ABORT][1] ([Intel XE#9463]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6129-ff450c62bc560177d72d0520f53ed445bbf704f6/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178440v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463


Build changes
-------------

  * Linux: xe-6129-ff450c62bc560177d72d0520f53ed445bbf704f6 -> xe-pw-178440v1

  IGT_9189: 9189
  xe-6129-ff450c62bc560177d72d0520f53ed445bbf704f6: ff450c62bc560177d72d0520f53ed445bbf704f6
  xe-pw-178440v1: 178440v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178440v1/index.html

--===============4939072306156676692==
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
<tr><td><b>Series:</b></td><td>Set up for debug configfs group</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178440/">https://patchwork.freedesktop.org/series/178440/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178440v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178440v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6129-ff450c62bc560177d72d0520f53ed445bbf704f6_BAT -&gt; xe-pw-178440v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-178440v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6129-ff450c62bc560177d72d0520f53ed445bbf704f6/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178440v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6129-ff450c62bc560177d72d0520f53ed445bbf704f6 -&gt; xe-pw-178440v1</li>
</ul>
<p>IGT_9189: 9189<br />
  xe-6129-ff450c62bc560177d72d0520f53ed445bbf704f6: ff450c62bc560177d72d0520f53ed445bbf704f6<br />
  xe-pw-178440v1: 178440v1</p>

</body>
</html>

--===============4939072306156676692==--

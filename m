Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759F1606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 16:57:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE9D10E5D3;
	Fri, 27 Nov 2026 16:57:40 +0000 (UTC)
Received: from 8b00d9f022d5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19EF10E5D3;
 Fri, 27 Nov 2026 16:57:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2580124650268919978=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/nvl-p=3A_Add_Wa=5F14?=
 =?utf-8?q?028564128_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Nov 2026 16:57:38 -0000
Message-ID: <179579865865.1530.8670890748150782590@8b00d9f022d5>
X-Patchwork-Hint: ignore
References: <20261127132613.3957154-2-tejas.upadhyay@intel.com>
In-Reply-To: <20261127132613.3957154-2-tejas.upadhyay@intel.com>
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

--===============2580124650268919978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/nvl-p: Add Wa_14028564128 (rev3)
URL   : https://patchwork.freedesktop.org/series/178936/
State : success

== Summary ==

CI Bug Log - changes from xe-6248-c365fe77cc4964431963813514be95adc0cfb56f_BAT -> xe-pw-178936v3_BAT
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

  Here are the changes found in xe-pw-178936v3_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-1:          [ABORT][1] ([Intel XE#9841] / [Intel XE#9845]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178936v3/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#9841]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841
  [Intel XE#9845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9845


Build changes
-------------

  * Linux: xe-6248-c365fe77cc4964431963813514be95adc0cfb56f -> xe-pw-178936v3

  IGT_9208: 9208
  xe-6248-c365fe77cc4964431963813514be95adc0cfb56f: c365fe77cc4964431963813514be95adc0cfb56f
  xe-pw-178936v3: 178936v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178936v3/index.html

--===============2580124650268919978==
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
<tr><td><b>Series:</b></td><td>drm/xe/nvl-p: Add Wa_14028564128 (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178936/">https://patchwork.freedesktop.org/series/178936/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178936v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178936v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6248-c365fe77cc4964431963813514be95adc0cfb56f_BAT -&gt; xe-pw-178936v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-178936v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841">Intel XE#9841</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9845">Intel XE#9845</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178936v3/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6248-c365fe77cc4964431963813514be95adc0cfb56f -&gt; xe-pw-178936v3</li>
</ul>
<p>IGT_9208: 9208<br />
  xe-6248-c365fe77cc4964431963813514be95adc0cfb56f: c365fe77cc4964431963813514be95adc0cfb56f<br />
  xe-pw-178936v3: 178936v3</p>

</body>
</html>

--===============2580124650268919978==--

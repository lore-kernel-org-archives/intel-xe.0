Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E51CF64B3
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 12:59:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1513A10E0A4;
	Mon, 30 Sep 2024 12:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="oMQygBC3";
	dkim-atps=neutral
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA03410E0A4
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 12:59:36 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20240930125934euoutp02950ae7470e5d2e47a659e9be1f357ec1~6BxCUhA611368013680euoutp025
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 12:59:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20240930125934euoutp02950ae7470e5d2e47a659e9be1f357ec1~6BxCUhA611368013680euoutp025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1727701174;
 bh=f1TrYNJ14lIj5b+07e4BNmin29yaHxeVaGoE3NAH3gI=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=oMQygBC3CXfXxiP3E82l1tgHWzzIk+H/3gBo6lLrktHXysQ8X+fgG/ECJmiu0Wf8p
 p1R6rPs8HHAopkVtNqnebYwDf6m8/Uu85d0GhM1YquXdWFvppJxsTX0QkWuHlhcTbH
 2Yv2uUt8IFs6y+3G1FpeV7q8zpG3+mAmbXPk/8nk=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20240930125934eucas1p12294a0358e03b93bd1d619132c3ed355~6BxCKem7y1347213472eucas1p1C;
 Mon, 30 Sep 2024 12:59:34 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id A5.32.09875.6B0AAF66; Mon, 30
 Sep 2024 13:59:34 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20240930125934eucas1p26bec1c6bb6b272f991acde569ef29cfd~6BxBsDDtJ3215432154eucas1p26;
 Mon, 30 Sep 2024 12:59:34 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240930125934eusmtrp2d396f22be0316c9e47e20bfd9bdb6280~6BxBrhtBE2410524105eusmtrp2X;
 Mon, 30 Sep 2024 12:59:34 +0000 (GMT)
X-AuditID: cbfec7f4-11bff70000002693-f0-66faa0b6833b
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id A8.3A.14621.5B0AAF66; Mon, 30
 Sep 2024 13:59:34 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240930125933eusmtip2e094a8dbf2a511d3f699ae16d4dd0edd~6BxBdaQoW2232522325eusmtip2L;
 Mon, 30 Sep 2024 12:59:33 +0000 (GMT)
Received: from localhost (106.110.32.87) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 30 Sep 2024 13:59:33 +0100
Date: Mon, 30 Sep 2024 14:59:32 +0200
From: Daniel Gomez <da.gomez@samsung.com>
To: <I915-ci-infra@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Daniel Gomez via B4 Relay
 <devnull+da.gomez.samsung.com@kernel.org>, Daniel Gomez
 <d+samsung@kruces.com>
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2EBAT=3A_failure_fo?= =?utf-8?Q?r?=
 drm/xe: xe_gen_wa_oob: replace program_invocation_short_name
Message-ID: <20240930125932.pidefagpiyubpmsw@AALNPWDAGOMEZ1.aal.scsc.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172735727458.1107233.1757281470637305143@2413ebb6fbb6>
X-Originating-IP: [106.110.32.87]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH+917vbsOZtcpejTJWmgPbD2x9bJ3Cv5Rhr1EyqF3avniTjOD
 alSKGc2SorVMFxWmltG0WVlmK5pL8YGtTGtqZeUqInXVTF2bV6v/Pud7vt/DOXAoXGgjfKnE
 lHSGTZEmiUg+oXtqa56r0wzJ5tfa/CU19je4pKmwGJe8bVDikl+Vn7DVRJi27DgZZj/Z7RLW
 dcKAbcaj+CvimKTEfQw7LySGnzDy4wwv7bl4v8KqxxTIODMPuVJAL4Zvp28ReYhPCelrCF6e
 uYu4YhBBX8d7kisGELxSGtBEJP9qiwvXKEFQoOwn/rq+5howp0tIVyIobJ3lZIIOgJ4C01ia
 pGdDrVHLc7Kng3/WfuM5wzhdgOC3cQBzFh50DgKb/sWYS0CHg+ajbpzdwXj+PeFknA4CTU2/
 Y0HKwVOgZJRyyq70eujTDZPcqtNBdbqU4PggPKvqGJsPdD0Fo5cVPGcWHAFz91rO4wEWQxWP
 Yz+w3y3GOI6HKxXq8TlpcL9T7cJFl4OyMYmT10DpcDnOyW7Q/tWdW9INCnTnxmUB5OYIOXcg
 lJu/EKfQDPV/Z6n/O0v97ywNwsuQN5MhT45n5AtTmEyxXJosz0iJF8emJmuR4zsaRg2Dd1CJ
 5btYjzAK6RFQuMhTYNbbZEJBnDTrAMOm7mYzkhi5Hk2hCJG3ICDOnxHS8dJ0Zi/DpDHsRBej
 XH0V2Fxr8KeeWS1dsYXRF0IjFKHNH7K216dDzGpZTNWKlrP24VxTUJBFsocfFy0WZm3FtyvV
 HnnV/ddFRX1nLcpjhzvS73i/C5z5cIdR5eV5b9Vg6svN+0m2skTbWLzB5PFZPO0QrTvyIMJU
 uqutP9ot6mhN2altrbJFITt7N9ks4ZqNKhIYaaZrds4yowA9nJTdXZHfrWeGyq3CJWRERKQt
 2zg4oAvtvPljKLRuFWuOrG+P+V2kMHkFV/rQ1Y+fW95WWCffPmCZerittdPvlyrI69Ekpvi4
 WWRXsfOayHWvTSM9N8yX6to75bnazHyfJ7fsfiutF5dGJvTKbMFbop+ICHmCdMEcnJVL/wAe
 VMY8jAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRmVeSWpSXmKPExsVy+t/xe7rbFvxKM9g5hcli9/+7zBbn5sxn
 tnh0uo/Z4sfmF0wOLB6bVnWyefzvfcDqcb/7OFMAc5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWF
 npGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJext9vU9gLruhVNHw9xNTAeFK9i5GTQ0LARKJ/
 6QVWEFtIYCmjxNNbhhBxGYmNX66yQtjCEn+udbF1MXIB1XxklJiydiIjhLOZUaK/4SALSBWL
 gKrEw0lXGUFsNgFNiX0nN7GD2CJA9vd979lBGpgFJjFK/D75mQnEERZoY5T4eegaWBWvgLfE
 gufb2CHGNjFKzPi8nhEiIShxcuYTsBXMAjoSC3Z/AjqEA8iWllj+jwMkzCngIvFy2x82iFsV
 JWZMXMkCYddKfP77jHECo/AsJJNmIZk0C2HSAkbmVYwiqaXFuem5xYZ6xYm5xaV56XrJ+bmb
 GIFxtO3Yz807GOe9+qh3iJGJg/EQowQHs5II771DP9OEeFMSK6tSi/Lji0pzUosPMZoCA2Mi
 s5Rocj4wkvNK4g3NDEwNTcwsDUwtzYyVxHndLp9PExJITyxJzU5NLUgtgulj4uCUamAStPr6
 d4vwMYmvevYKLHZTrxm8iy3b7pljvr5vtW3Wlg1iZjaBFkdWflouqX31hmTOjjX1GfveR/YW
 asTqFV69KSmvmMc7lWdPjfg8zketp1MncCwsPhbS/Ofyod/NTUG8xz+k6prxnpKzYNdKvcSw
 7vO3XwGeUV87XbatnHrr2ESTD7uFM/nYN9pxc/xk1q3uvHVf5KzapJ9yjGLMdiGL5FXKDr+f
 ke0QczHA7FyVT9dBkfZWqyAXYb0Vm6/f2JvDy/jsiPXRM351XYw2oasPJW3nqPJPvrLj75Lj
 865HGae9aS5fcFfoI+dZkV8dh7fcqPVWvyC+aNHvtbHs95+/vpfu/KCgaN3b5z9abixQYinO
 SDTUYi4qTgQAl8CcFSwDAAA=
X-CMS-MailID: 20240930125934eucas1p26bec1c6bb6b272f991acde569ef29cfd
X-Msg-Generator: CA
X-RootMTR: 20240930125934eucas1p26bec1c6bb6b272f991acde569ef29cfd
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240930125934eucas1p26bec1c6bb6b272f991acde569ef29cfd
References: <20240925-macos-build-support-v3-1-233dda880e60@samsung.com>
 <172735727458.1107233.1757281470637305143@2413ebb6fbb6>
 <CGME20240930125934eucas1p26bec1c6bb6b272f991acde569ef29cfd@eucas1p2.samsung.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi,

On Thu, Sep 26, 2024 at 01:27:54PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: xe_gen_wa_oob: replace program_invocation_short_name
> URL   : https://patchwork.freedesktop.org/series/139088/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1978-6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da_BAT -> xe-pw-139088v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-139088v1_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-139088v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.

I think the errors below are not related to the patch. Actually, the changes
should not introduce functional changes.

May I ask someone to look at this?

Thanks,
Daniel

> 
>   
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-139088v1_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
>     - bat-dg2-oem2:       [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1978-6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139088v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-139088v1_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - bat-bmg-1:          [PASS][3] -> [DMESG-WARN][4] ([Intel XE#877]) +2 other tests dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1978-6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139088v1/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
> 
>   * igt@xe_evict@evict-beng-small:
>     - bat-adlp-7:         NOTRUN -> [SKIP][5] ([Intel XE#261] / [Intel XE#688]) +15 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139088v1/bat-adlp-7/igt@xe_evict@evict-beng-small.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
>     - bat-adlp-7:         NOTRUN -> [SKIP][6] ([Intel XE#288]) +32 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139088v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
> 
>   * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>     - bat-adlp-7:         NOTRUN -> [SKIP][7] ([Intel XE#2229])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139088v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@xe_exec_basic@no-exec-userptr-invalidate:
>     - bat-bmg-1:          [DMESG-WARN][8] ([Intel XE#877]) -> [PASS][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1978-6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da/bat-bmg-1/igt@xe_exec_basic@no-exec-userptr-invalidate.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139088v1/bat-bmg-1/igt@xe_exec_basic@no-exec-userptr-invalidate.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
>     - bat-adlp-7:         [INCOMPLETE][10] ([Intel XE#2874]) -> [PASS][11] +1 other test pass
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1978-6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139088v1/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
> 
>   
> #### Warnings ####
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - bat-adlp-vf:        [SKIP][12] ([Intel XE#2849]) -> [SKIP][13] ([Intel XE#2460] / [Intel XE#2849]) +1 other test skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1978-6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da/bat-adlp-vf/igt@sriov_basic@enable-vfs-autoprobe-off.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139088v1/bat-adlp-vf/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2434]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434
>   [Intel XE#2460]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2460
>   [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
>   [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1978-6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da -> xe-pw-139088v1
> 
>   IGT_8032: 8032
>   xe-1978-6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da: 6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da
>   xe-pw-139088v1: 139088v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139088v1/index.html

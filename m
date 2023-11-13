Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73767C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 16:05:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25EE910E160;
	Mon, 13 Nov 2023 16:05:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23BBC10E160
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 16:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699891537; x=1731427537;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9P9BPTIYrrj81WIhg9qd8X0gaGHtNUGbzWuAbI99i7g=;
 b=dqWznW2QntzptolIOP5GqytWLsr5Ggxm0lRpkg1iZTc02s6s5Iij1Ery
 f4eo4jOhnQK9YPyJ7vofaqUL1aaIYW3313lXY2VP1Lp/U1j2Y5jqGFE8X
 865B10JIvuPKOuNjD/j9JOuh8QpVFi0ZPRccAbK1sutHq3Hgf80EuswP7
 CjyJwdaXyo9xoqcQyS35itTgZcbxopdvO+IRLpglq2qvn3nHRQ7nEYcmI
 x2wSWIhCw8cPEEo5fkK+USYbc2meqILnexAAP+z4VbFoIztqaeWJE5992
 TvQ45ePslGymeRKfUMdZATIpiNhpXL8gM4yXjPA9CP8ooZ+1NuOL4epmt g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="3507745"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="3507745"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 08:05:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="764367241"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="764367241"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2023 08:05:36 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 08:05:36 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 08:05:35 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 08:05:35 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 08:05:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZ4Hmhpsscig00ulV2Vv10rdvyktDRMM7qDz3dUvg353V6tmD094sLPnkRHiCfos5Wf13Erxyo41I/Bl22kQG5FTe0T4r42x5AfwNOzpq7q5yGfoTbAu67DiOfKpLN8PY0VeGtpbrjZo/AlMZ+D4GOxJel2Qc4Ycq5B1vtJVI37fVDP09FAQ422xMFbcAqzBRvQ+Wbk4Wn74eY1MDPy28Zz1/hf/fXl3A4RmzrceiJ50zo1fy1JLoye6o/vBm81EeXj6utQDegp5uNmNLtcGLPU8Ldv8L1LoNMT4S7bVRktmkDkwOlEeEva3wzTidStI/nMBOTuLA1kDX6JGhFx+Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vi/kDDjOSNe8Vg5UWK9Ew0GJWyuOyEMruxUkLZJDfYI=;
 b=d/XiHB4+RGue8gU0dIwAw9kcp/CGMSououEyxBxXnVsMROD7hAOn9qRRyFyQnm2ctDScXefI20bxNQ3/Oy0rAgEDWkvKHQKTHKfjJSuq+0NqY7KTQIQl4MQuhj0eMrQIODVqL+9IqUW2cxTpowruf81OWax8q6QHhXfD4hhEVBFpOumOnsY3QyiciFBqwRi6c2J/spd2A4JKF5G5UhDp2HJXkkf47xg3AurIkbJFqvP4sxvGwU4QxpHYqUkjwRhHZEFeK/+1+O8XU2ynOJ/QRGAj1cFHCIRsXN+9590sKt73znaXvhs1B34QNhsZuro3XEm6fg0bTF8l5L7CTqxJMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4688.namprd11.prod.outlook.com (2603:10b6:806:72::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 16:05:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c%4]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 16:05:33 +0000
Date: Mon, 13 Nov 2023 10:05:31 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <wpzk6w3emsgzf266vtcsmjxedv5mfbf7x7dchf3tswzscyoelz@7mlfe5tz2ou6>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BY3PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:254::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4688:EE_
X-MS-Office365-Filtering-Correlation-Id: e331b5e5-460f-4253-4913-08dbe4625dd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oAb6k5Z/5OPxdmfRch8j5T0r/0L8VZB9GZTL70e9qvYHETToonmYcvCEM1GniR/HaM/HOqful4+gIZoA1DCY2iUvNj/f650uSNSvnM39nml4nDn7IJGMFHnnkGJZHsnVxINknT3ip/nEzjRiXjfi1Hcrp6LrS6KywNe7Gghp0IASMHqQyPoa3IOBErKLba91sy45EtGYxPmFM0u2tCeo2VNo+hRY1Y9PwnpNB9UOkK+zIVQLflxnw8jaTY2R01kHudcAToy+cJoV3EaiNmpE9/a+N76Kkx4WU+DWEJ01OAqxpiDsOpQpfQDW66m6/SrqgyMkyfKeTtqcaV4I5IRb1Q0Yb4RGYf7PstZxdhp2NiotCE876BJD7e1VAeuYiMoyo9usMkalJ2Gn5uszaD0yYj0ZOe723FFd19tbL1FtAPKKoWxIwsY/bezLBS/Ae/LUJuKwwl4TsKr6Wy7DmnW/59QtHdZoPGdv64RSBjcPqJ3lFBN2sO4oNIA7FG6sW41QT6bOf8Qdb5E+UtjEaz7dGfx5ZGOVGo+CAfqVgSkUXNLjxboEbnhgVxc9kZ1A4f4U
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(366004)(39860400002)(136003)(376002)(396003)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(26005)(6506007)(33716001)(9686003)(6512007)(83380400001)(4326008)(5660300002)(8676002)(8936002)(41300700001)(6862004)(2906002)(6486002)(478600001)(316002)(6636002)(66476007)(66556008)(66946007)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4IvPuE+LVQ7pkeDX34WkM3lBwrwhnXHPP2aYmbLOGoAluAlIyFqNLMaJ8/IC?=
 =?us-ascii?Q?Fr7mG6C7kh2SrFqlso8K6chRJ+4wi7K7gT/EVmdHX1Lcu4TS1vYA5t6rMDGh?=
 =?us-ascii?Q?Yf24fl9rDnUY+dtC5RAJeyVEEi3KBMuK+RHLaFRG1Dk1FgaJzfqqhokCkrHl?=
 =?us-ascii?Q?TC+tjQjO3idQSn0SPHNfHrpVXV0DPc3HQgk963uZDr1kkk8dDdhS7RqRbAlW?=
 =?us-ascii?Q?Fqat5TOi9NBVIr/wizxmkok4tBcm3zSqHsxdJ1wzb+4DJfRGbQj7APZj2GBz?=
 =?us-ascii?Q?7S5aDsjw9rPiKmGK0NCvfnqWolyOjWn3t6pYBBJqFEn7NKrsU5qgL4Y0lknu?=
 =?us-ascii?Q?r9RJA1SP9SNBYJZTKJpk86/rUO2rYgiyiLZxjIB/R5VV8tPgskQ2LRJrNREW?=
 =?us-ascii?Q?Mrx3/D45W/lhvoWiGE42SwaNyb2ataF3vNhvN+9x60I5cOTnwml1si/76WbM?=
 =?us-ascii?Q?Ie7wQueYK4vceZ70APj5Wevr3ESjiX5BeM0fKR3V9oJZehsH/eBy4xV5Lh2Y?=
 =?us-ascii?Q?XCWytYomluW8Blzug37hYEcG4dB2AgJlDPqfVcwY4ydEdVdb9Rqgz02srbf9?=
 =?us-ascii?Q?POABxKE/WuQYv4vOXGiGmeY1QNp7JCeP2hdt4Oz6CpFp2FsHAYv9IqyuQ3GS?=
 =?us-ascii?Q?gXeVA4gTm7PHz6fOTup3oojZkIPS3MI2onwLvThAPD9ixPcaDWshrSSQZIph?=
 =?us-ascii?Q?+2JlBHUlfDryT3tFyCVeMw5YJEKJSfkggquiRKUoaKIXSLRd+VcsMu/XbPEH?=
 =?us-ascii?Q?NElqzsVVv62H/wcD9KJ8lv/CDnLMmWXvz87PhvCVUhv686A6wlxsPa2cINT2?=
 =?us-ascii?Q?eweBnNvWvWGCBrAFriLpb5onaKBkarjUnYDpizDu6MT5G3jZYapMhgWnmnfD?=
 =?us-ascii?Q?Ji/yYQaBhVM9SpPeFywBVRbjtp1Izd37+W3l3jRF22CxxoYRhv170LhjpMyq?=
 =?us-ascii?Q?MgdyltpfWYUiJlmkpsJYfpsFsfgrfTRjUzU+cwirhpUBw9oC91ZXOIUc2zun?=
 =?us-ascii?Q?URBvoU0jvAScOScl6EKvucXci1gZhiIsqWWnyIcZsx9PMMfzAYvzl+F5mz6U?=
 =?us-ascii?Q?rnklxcKUBz1xS6D6SEbAFdwpeMme7pwgBWNAvNckrKgwFxVpBYbu/76zmlCk?=
 =?us-ascii?Q?TlJWdi2QtBYa0U3MxEEbeNAsz00m7qbRrqzpFmpd1pBYqjw/IughHaTGooEk?=
 =?us-ascii?Q?E9Avteh1GHXtcZEpxW0yH5GLGr1kvMILwCyw4Z01ho/JGTY6pRuQdAXx78wj?=
 =?us-ascii?Q?QfuRAA5kXnZPiMswylRXaOwkZ1Y1JI5xIXnJbf2USbDWd0vRVojj0GfWuxqZ?=
 =?us-ascii?Q?zuvCmxNEv+7nlsfq08XvnrxvSg43Cti7SNy7wEPywHCYR4w5OELXeayZqkbp?=
 =?us-ascii?Q?8gc9mJKJJVblqEC5He0x/usx+dgTdQ7EFprLFsM4v78OLf0gJ6t0SVLqGRhg?=
 =?us-ascii?Q?oMwGLmbDMxB875VB/YXwA5yi3LZ+McBaAx5MaPLwjfDVyIuBbBemMx625wCh?=
 =?us-ascii?Q?MPGq63d8m6WqGECuAXKqFy6TMr0Rhx/6PdDZr6wy/s+qnmawwlpx7rDPcLMg?=
 =?us-ascii?Q?uSsmfmZjD1dopsBcPI1V6XA7Az3Fq+VI04TZJ9rrUP3coGrrjss++TyvZGF3?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e331b5e5-460f-4253-4913-08dbe4625dd0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 16:05:33.7973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vNWOQpIZgvJAYI8XH6sGvKUdYHkwBTjr6ZMhXhlboBESIox0WBd7bxb+YjnljmXAO/XXFUGtOshuLxmQo4QEilR7kZkTYfhoVQvqD+rFHSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4688
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 00/12] GSC FW loading
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Oct 27, 2023 at 03:29:14PM -0700, Daniele Ceraolo Spurio wrote:
>the GSC (Graphics Security Controller) is the root of trust for content
>protection operations (PXP, HDCP), so loading the the GSC FW is a
>prerequisite for those features. Loading the FW is required to turn off
>the GSC forcewake well (which we must turn on to enable GSCCS idleness)
>and therefore allows MC6 entry.

Regarding this last part, I wonder if we could simply put the GSC
forcewake if we detect the problematic situation: GSC fw not being
loaded and platform requiring that for proper MC6 entry.  Would that be
possible?

Lucas De Marchi


>
>The GSC FW uses 3 separate versions: release, compatibility and
>security. The compatibility version is the one that dictates whether the
>driver knows how to interface with the binary so that's the one we match
>against, but we also fetch the other two for debug information.
>
>The GSCCS is used to both load the FW (via the GSC_FW_LOAD command) and
>to send heci packets to it (via the GSC_HECI_PKT command).
>
>Note: the flr patch from Andrzej is being reviewed separately, I've just
>included it here because it is a dependency.
>
>Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>Cc: John Harrison <john.c.harrison@intel.com>
>
>Andrzej Hajda (1):
>  drm/xe: implement driver initiated function-reset
>
>Daniele Ceraolo Spurio (11):
>  fixup! drm/xe/guc: Report submission version of GuC firmware
>  drm/xe/uc: Rework uC version tracking
>  drm/xe/gsc: Introduce GSC FW
>  drm/xe/gsc: Parse GSC FW header
>  drm/xe/gsc: GSC FW load
>  drm/xe/gsc: Implement WA 14015076503
>  drm/xe/gsc: Trigger a driver flr to cleanup the GSC on unload
>  drm/xe/gsc: Add an interface for GSC packet submissions
>  drm/xe/gsc: Query GSC compatibility version
>  drm/xe/gsc: Define GSCCS for MTL
>  drm/xe/gsc: Define GSC FW for MTL
>
> drivers/gpu/drm/xe/Makefile                   |   4 +-
> .../gpu/drm/xe/abi/gsc_command_header_abi.h   |  46 +++
> .../gpu/drm/xe/abi/gsc_mkhi_commands_abi.h    |  39 ++
> .../gpu/drm/xe/instructions/xe_gsc_commands.h |  36 ++
> .../gpu/drm/xe/instructions/xe_instr_defs.h   |   1 +
> drivers/gpu/drm/xe/regs/xe_gsc_regs.h         |  39 ++
> drivers/gpu/drm/xe/regs/xe_regs.h             |   7 +
> drivers/gpu/drm/xe/xe_device.c                |  78 ++++
> drivers/gpu/drm/xe/xe_device_types.h          |   3 +
> drivers/gpu/drm/xe/xe_gsc.c                   | 389 ++++++++++++++++++
> drivers/gpu/drm/xe/xe_gsc.h                   |  16 +
> drivers/gpu/drm/xe/xe_gsc_submit.c            | 170 ++++++++
> drivers/gpu/drm/xe/xe_gsc_submit.h            |  30 ++
> drivers/gpu/drm/xe/xe_gsc_types.h             |  39 ++
> drivers/gpu/drm/xe/xe_gt.c                    |  46 +++
> drivers/gpu/drm/xe/xe_guc_types.h             |   9 -
> drivers/gpu/drm/xe/xe_hw_engine.c             |  20 +
> drivers/gpu/drm/xe/xe_module.c                |   5 +
> drivers/gpu/drm/xe/xe_module.h                |   1 +
> drivers/gpu/drm/xe/xe_pci.c                   |   2 +-
> drivers/gpu/drm/xe/xe_uc.c                    |  21 +-
> drivers/gpu/drm/xe/xe_uc_fw.c                 | 257 +++++++++---
> drivers/gpu/drm/xe/xe_uc_fw.h                 |   3 +
> drivers/gpu/drm/xe/xe_uc_fw_abi.h             | 113 +++++
> drivers/gpu/drm/xe/xe_uc_fw_types.h           |  40 +-
> drivers/gpu/drm/xe/xe_uc_types.h              |   3 +
> drivers/gpu/drm/xe/xe_wa_oob.rules            |   1 +
> 27 files changed, 1329 insertions(+), 89 deletions(-)
> create mode 100644 drivers/gpu/drm/xe/abi/gsc_command_header_abi.h
> create mode 100644 drivers/gpu/drm/xe/abi/gsc_mkhi_commands_abi.h
> create mode 100644 drivers/gpu/drm/xe/instructions/xe_gsc_commands.h
> create mode 100644 drivers/gpu/drm/xe/regs/xe_gsc_regs.h
> create mode 100644 drivers/gpu/drm/xe/xe_gsc.c
> create mode 100644 drivers/gpu/drm/xe/xe_gsc.h
> create mode 100644 drivers/gpu/drm/xe/xe_gsc_submit.c
> create mode 100644 drivers/gpu/drm/xe/xe_gsc_submit.h
> create mode 100644 drivers/gpu/drm/xe/xe_gsc_types.h
>
>-- 
>2.41.0
>

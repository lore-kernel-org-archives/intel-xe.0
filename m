Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E15CC77B7A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 15:11:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC7B10E08B;
	Thu,  1 Jun 2023 15:11:23 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFDFE10E08B
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 15:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685632282; x=1717168282;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=pN1bVRMdqO0wzs/3TnBWSSv5shEToA/o7TkqBpsqT+w=;
 b=jAUSHrH94VMaVP7Djf2OS5R6LL58svSK9CB3rcrWt55ZTJPMJ7d/hgZ5
 lGimuPsAYjpXaxWQeiHJUrHzw6X6xGnkYesgSOoEH86Wt1SqFt/Ocs+4C
 SgwUh/bckSucrOc0Mug6SLEqTwM/6u8YJ8m06UU6QiFZ8IfeqmDLJ+DYf
 vXOfCRpOKgLB+Gg7DmLA7ivf9B5wLuhTLMDWyHq5tBK8M2nM5eLQ6Wnq8
 yYaEMTvaUslReARuINlpAS0Ep3i3/Ew7wCn3ZVv5kq0Nwx9N0kXXKtpXo
 9Ov1/LEs3ThNoJB2es7GncAPpYGwJOz4Figc+Z3doARu/GX6qf9DEoEKc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="419104367"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="419104367"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 08:11:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="707402386"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="707402386"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 01 Jun 2023 08:11:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 08:11:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 08:11:21 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 1 Jun 2023 08:11:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNuoxFDDfbeHWkqdm87RLM0m/NYLFj3nGk14alPokxqFpdJS8m7zZLETaeNtl2UzueSciF1XUlt+biD/hT9mYPRHVahK6z66DchuqACI90WyFAB4SChhztfWnttOWAy3YYjOyHYGm6gCSRwpERink3pgKSKAa4nXCTtssFWsVleWJ27o6TVdnBNJfnEmwBEpAmg6OEMCxjhh6Z9wp6YlD1cQdLDrMR1Nuany1LgnHeo5ucRvG6s5A053EYMqUBdlrznni2XrDnxVefwMYh3LH2MvDV0bLbR4NUL/BrZ5SJ4L4hZ8yuaNf9XN1pA8I4/x0SkyUg4CLW1j07e8mO0Cgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWl9VHbRQCpnYfzaal1xdnGb8ZqEuOT5hJx1HHczGOo=;
 b=JZeCdMU81jAPC2PC3OQNLaaxsiUhp8Vh2a3D8O//4r3MMFR00I9ptqafPN3/8t224dcUcwWnRJBshsbLe9c0cIv/Mzg/hM4AYk4a0BQWXss2ZTVZ50SxP169wKQz6X7ja+XZF8dBqiQrL3HSMPyBWRDd81dOpCb6YTa1jzOkXjsFWalfyQe9ThwR7Whg6TQylnCF29yREDCkJueAA0DVt2Gvy+IgstUR1u9NER1bwmB8FyFhap6xWce9Iv9ifFhM8eNTk3SsM892y1yCGYC/kR18+n52ldANZgnyBzOTHV3OjtQJ+NMG4vkCvapMcnKzdeQv/rIF0+lvM/yN3JfVwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by DS0PR11MB6544.namprd11.prod.outlook.com (2603:10b6:8:d0::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.24; Thu, 1 Jun 2023 15:11:16 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68%4]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 15:11:16 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230601000403.432517-11-matthew.d.roper@intel.com>
References: <20230601000403.432517-1-matthew.d.roper@intel.com>
 <20230601000403.432517-11-matthew.d.roper@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 1 Jun 2023 12:11:11 -0300
Message-ID: <168563227115.3435.12029519448231968813@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BY3PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:217::25) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|DS0PR11MB6544:EE_
X-MS-Office365-Filtering-Correlation-Id: 32040a3b-ff71-4ecf-11f6-08db62b271ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jxeRe6cHSQNwLPl/YUfNRMOpv/CNADbnf50kiJFZMVQQgefje9VsEfHQr2lUge8DxHQa+NWPpSqb4UpLsUqJTzW09LyQ52URYFWXH3xoeYrhzMtt03jplFJ+xq1N11Ps4sE+DPg6K8Y2+p6u6a4wrSSNUOOfX/xGlMFt6QqAo3Hm7mi/EyGbySkDlG3ZfwrE3w2qVg8apshTuRhN6QbCKU9KOhbQxgN7Z0IqRdDHsK/KSSr6z5/Tn1uzdww3K/PxM7fGK6WBpHbssVVg198r5TUdZHWbA5TBTPkBjJ9KBAOYlpMc5hJOnjXeSkUclX6MBxsAyOJV7clU3GkRSXVxmPeawGiwkOwIioLEeSpbwMB0TyJ8Naqsf3bOA3uNDUMXUK9+ow9/TwTbkX5SDuCe+airHtmH/r97AII3hhsxz0XL22TkmrC+avqIl3QRb3x+StQ+qzH+h7khqiBC0IyPXz3PAQvXDUGgB1mcf4dV3c7mv7+ycKx1njMWq8VcgxeK1SKTuwcn8/zkhQWRMTJ8OIHWAF2RGmogzKy+DoeQOnwJH33ji+7JhwESZu52CgWG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199021)(8936002)(8676002)(2906002)(66556008)(30864003)(4326008)(66946007)(66476007)(44832011)(316002)(5660300002)(478600001)(41300700001)(6486002)(107886003)(6666004)(9686003)(6506007)(33716001)(6512007)(186003)(26005)(83380400001)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0x2NUFza250bnlGenkvMnAxYXI1cExVdElhMFBKanI0bW1hZ1FmZHhFeVkx?=
 =?utf-8?B?TnVNUnJhRTBKVjRxK2l2SXA0VnZKcDJMMXBDZ2kzUjRtdXJiZmZFSFNhSUN3?=
 =?utf-8?B?K3dJRDlxalJLcnE5L01GSGhXS3JjLzQ1YWd2dFNXUlRxYW4wRVJ2UDc2aGI0?=
 =?utf-8?B?SmNtZFVTejNGSDYrTURiWmdqa1EzWllVVlQrTnk0RHVSb0hPeVNkS1d4bWR0?=
 =?utf-8?B?eUhMSkw5V2lEbmpqS1l2RHJBM2NKRkRPQ05NbzZWaEhqVDVueHVRTmJHazl2?=
 =?utf-8?B?OGlkalBqcWlSUVZwdjdWRkJjUFR6WnU0ZFNPY1pZWUNTRk5pTVZGaWRUVHIz?=
 =?utf-8?B?WWhocXpKVDAvakJTTS96STcxN0pqdjQxM2s0aU5YVDRRdHVJb0xqaktXZTNL?=
 =?utf-8?B?QTIzNERvWVF2Y1BqVXQ3b1BkMTdjYU5tMmdNY2ZZNTNxa25HQzEwaCt0dGo0?=
 =?utf-8?B?ai83WjhVd2U4OTV3M3VPbmNmQmg1NmZkVnNRc2tJOC9oSlkwQlB2YkEyc09t?=
 =?utf-8?B?aXpSY0xBZUpRS0NvMGFTSlJrL0x6emxqT3c0OUJ4dnB3TUN5dlhHazZ3Mmt2?=
 =?utf-8?B?TENEcmdvNXUxOWppd24wSnRpNE1PVEdCci80VzU3NmhDd0twMzBYQ0MwNlpL?=
 =?utf-8?B?ekJ6TkgvRysvdHcyRzhVUTZFZm9jNUtHWmtGK3pIY2NUV3RBRGNNVXJIV3c0?=
 =?utf-8?B?Y3ErVkFEdjdIWjRjVFdVbXJBVVRlRmx1S09yMWFVbUpSWjdjS3FxalBpb0JX?=
 =?utf-8?B?TW1jV3RmOFpkczdDMyt5MHcxT1hqSnZmSnhmQTNXMUF4UUpPUjkwcFE1YU1u?=
 =?utf-8?B?eDhoMXhDc2hSN1R5RVVSWXQwdnFkc1JoMDNhUm9mYldkMDk1RW5xenBSK29Z?=
 =?utf-8?B?WVk3VW1tL0NKd0cvaUR1bEFvVVNnUVlFSkl4QUdXL05HaEdEUkhJQlV6eHUv?=
 =?utf-8?B?TU5WSFpOK2RnWC8wOGI4bVhPWld5RjRKaFcyZWZremVkdTF6ZXBDQjl5bWF2?=
 =?utf-8?B?dlUybUtXdnFNNFBDeEZnSlNML2kvQjI5RFdzNmZRSUt2UE14RnZWZFJYUDBi?=
 =?utf-8?B?MjhualR3N0ZVOUxITDNjajUySGFZbU10SmNhRXlxN3JDZEJvaWFSS3hBRWdo?=
 =?utf-8?B?bEpJQWtFd1J0Z0tJNGh4WXdEVnlRc2N1ZXVWc0oxdm5TTkIzaXUyZFFDVXU4?=
 =?utf-8?B?dmhHOWJuTU5VUU1nRVJXcTdna2NMd0F1c2FEWGRIVFVMK01yRWlZeVU5dDkr?=
 =?utf-8?B?TUJtSFQrdHVXMFlkeVhtT052eEdxSWNJTDFsa3lFMExrQTlhNVMzWFgrOFlu?=
 =?utf-8?B?aE5YZWR5akhPUUhJK0d5RTJ2aUlZUCttajhnOVVpR2RzS0QyU1Jac08xbUhR?=
 =?utf-8?B?Z25JcDc3d0o0ZUVJbVZobEJOdENtZmFvdHc4NFBCSjNqc1BzYXkveXRtOXZz?=
 =?utf-8?B?Mlo5Q3ZLODNIZEkzcCs2Z0w0dmhqZ2FHaWo1UUtPd0NPYzVxeWtoZGpJb2pv?=
 =?utf-8?B?TmFQTDJFWTExZ0JZa1d1OFZTSDNmUnJJNjFCcFhxcHhRaHpCOHJkNFpGbktJ?=
 =?utf-8?B?bUM4N0ljRVh5aVVWK0pHSzg5NzNzb21ZWTExVXhDUzV3Mi9OekplSTM1RkRN?=
 =?utf-8?B?QlVnWTJXYWJyNzBKVDRFUHg5VHk2ckEzQU9GckYydkxMVHgxMzNGT2lnNFdN?=
 =?utf-8?B?T041QUFtK2tTNjd1WWFOdGZKWWIxdzdNUGZvTi9pbHd6STQ0RWYwSG9Fc096?=
 =?utf-8?B?b05GTkFzaHp5YkdoTmVMNnc3VUcxUVBPRitJOVdtZEt1ajBSOVJqMHczNXBD?=
 =?utf-8?B?YzRaOTF3ekk1bEhVWEI1ZHBpYmIzSjZKOTZiaGxvc0pDRmQzR2o4ckk2blQv?=
 =?utf-8?B?NjJKRjVCTXY1V24rdm56c1dTMi9HYVBqZ1I4T1UxYmFLUTVEZzJMWVZIWkxU?=
 =?utf-8?B?MWVGMXpOM1VOZnR3MFZLMTZHYWhhbTZwbi9UejNIc1NHOThwS1IvM0xGTkxP?=
 =?utf-8?B?eUJYOFdCeGxsK1dzcW9wb1RmRndsWE5iL3QyZ3piR2pzS1NicG9yYnRybjc0?=
 =?utf-8?B?bUdPUlhDTmNNajBHKzFLV1QrUFZYYWlBeWFHdUNVTnhlYytCWTdvWGJITTl0?=
 =?utf-8?B?MHE0OUQ4a1pyUUE5THRrMDJ5S2lUNW1Pc0ZyUEtaMm04b3A0NEFvRHBRd1dR?=
 =?utf-8?B?RWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32040a3b-ff71-4ecf-11f6-08db62b271ac
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 15:11:16.3976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ctO/N5jTDUcqDYC/FX24fmhoaAl37J6u7DbLvEtXpLMiojq/oxMLaC3CrMymaSRPN35TRQGGRRouSoyk4GLh+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6544
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 10/31] drm/xe: Move VRAM from GT to tile
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Matt Roper (2023-05-31 21:03:42-03:00)
>On platforms with VRAM, the VRAM is associated with the tile, not the
>GT.
>
>v2:
> - Unsquash the GGTT handling back into its own patch.
> - Fix kunit test build
>v3:
> - Tweak the "FIXME" comment to clarify that this function will be
>   completely gone by the end of the series.  (Lucas)
>v4:
> - Move a few changes that were supposed to be part of the GGTT patch
>   back to that commit.  (Gustavo)
>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Acked-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/tests/xe_bo.c           |  6 +-
> drivers/gpu/drm/xe/xe_bo.c                 | 44 ++++++------
> drivers/gpu/drm/xe/xe_bo.h                 |  4 +-
> drivers/gpu/drm/xe/xe_device.c             |  4 --
> drivers/gpu/drm/xe/xe_device_types.h       | 30 ++++++++
> drivers/gpu/drm/xe/xe_gt.c                 | 82 ++--------------------
> drivers/gpu/drm/xe/xe_gt.h                 |  1 -
> drivers/gpu/drm/xe/xe_gt_pagefault.c       |  6 +-
> drivers/gpu/drm/xe/xe_gt_types.h           | 37 ----------
> drivers/gpu/drm/xe/xe_irq.c                |  2 +-
> drivers/gpu/drm/xe/xe_mmio.c               | 51 +++++++-------
> drivers/gpu/drm/xe/xe_mmio.h               |  2 +-
> drivers/gpu/drm/xe/xe_pci.c                |  2 -
> drivers/gpu/drm/xe/xe_query.c              |  4 +-
> drivers/gpu/drm/xe/xe_res_cursor.h         |  2 +-
> drivers/gpu/drm/xe/xe_tile.c               | 33 ++++++++-
> drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c     | 18 ++---
> drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 16 ++---
> drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |  4 +-
> drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  6 +-
> 20 files changed, 150 insertions(+), 204 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/x=
e_bo.c
>index 8f3afdc6cca6..6235a6c73a06 100644
>--- a/drivers/gpu/drm/xe/tests/xe_bo.c
>+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
>@@ -115,9 +115,9 @@ static void ccs_test_run_gt(struct xe_device *xe, stru=
ct xe_gt *gt,
>         int ret;
>=20
>         /* TODO: Sanity check */
>-        vram_bit =3D XE_BO_CREATE_VRAM0_BIT << gt->info.vram_id;
>+        vram_bit =3D XE_BO_CREATE_VRAM0_BIT << gt_to_tile(gt)->id;
>         kunit_info(test, "Testing gt id %u vram id %u\n", gt->info.id,
>-                   gt->info.vram_id);
>+                   gt_to_tile(gt)->id);
>=20
>         bo =3D xe_bo_create_locked(xe, NULL, NULL, SZ_1M, ttm_bo_type_dev=
ice,
>                                  vram_bit);
>@@ -179,7 +179,7 @@ static int evict_test_run_gt(struct xe_device *xe, str=
uct xe_gt *gt, struct kuni
>         int err, i;
>=20
>         kunit_info(test, "Testing device %s gt id %u vram id %u\n",
>-                   dev_name(xe->drm.dev), gt->info.id, gt->info.vram_id);
>+                   dev_name(xe->drm.dev), gt->info.id, gt_to_tile(gt)->id=
);
>=20
>         for (i =3D 0; i < 2; ++i) {
>                 xe_vm_lock(vm, &ww, 0, false);
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index 09a9c121a84d..17de7cc5fe36 100644
>--- a/drivers/gpu/drm/xe/xe_bo.c
>+++ b/drivers/gpu/drm/xe/xe_bo.c
>@@ -71,25 +71,25 @@ static bool xe_bo_is_user(struct xe_bo *bo)
>         return bo->flags & XE_BO_CREATE_USER_BIT;
> }
>=20
>-static struct xe_gt *
>-mem_type_to_gt(struct xe_device *xe, u32 mem_type)
>+static struct xe_tile *
>+mem_type_to_tile(struct xe_device *xe, u32 mem_type)
> {
>         XE_BUG_ON(mem_type !=3D XE_PL_STOLEN && !mem_type_is_vram(mem_typ=
e));
>=20
>-        return xe_device_get_gt(xe, mem_type =3D=3D XE_PL_STOLEN ? 0 : (m=
em_type - XE_PL_VRAM0));
>+        return &xe->tiles[mem_type =3D=3D XE_PL_STOLEN ? 0 : (mem_type - =
XE_PL_VRAM0)];
> }
>=20
> /**
>- * xe_bo_to_gt() - Get a GT from a BO's memory location
>+ * xe_bo_to_tile() - Get a tile from a BO's memory location
>  * @bo: The buffer object
>  *
>- * Get a GT from a BO's memory location, should be called on BOs in VRAM =
only.
>+ * Get a tile from a BO's memory location, should be called on BOs in VRA=
M only.
>  *
>- * Return: xe_gt object which is closest to the BO
>+ * Return: xe_tile object which is closest to the BO
>  */
>-struct xe_gt *xe_bo_to_gt(struct xe_bo *bo)
>+struct xe_tile *xe_bo_to_tile(struct xe_bo *bo)
> {
>-        return mem_type_to_gt(xe_bo_device(bo), bo->ttm.resource->mem_typ=
e);
>+        return mem_type_to_tile(xe_bo_device(bo), bo->ttm.resource->mem_t=
ype);
> }
>=20
> static void try_add_system(struct xe_bo *bo, struct ttm_place *places,
>@@ -109,9 +109,9 @@ static void try_add_system(struct xe_bo *bo, struct tt=
m_place *places,
> static void add_vram(struct xe_device *xe, struct xe_bo *bo,
>                      struct ttm_place *places, u32 bo_flags, u32 mem_type=
, u32 *c)
> {
>-        struct xe_gt *gt =3D mem_type_to_gt(xe, mem_type);
>+        struct xe_tile *tile =3D mem_type_to_tile(xe, mem_type);
>=20
>-        XE_BUG_ON(!gt->mem.vram.size);
>+        XE_BUG_ON(!tile->mem.vram.size);
>=20
>         places[*c] =3D (struct ttm_place) {
>                 .mem_type =3D mem_type,
>@@ -362,7 +362,7 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bd=
ev,
>                                  struct ttm_resource *mem)
> {
>         struct xe_device *xe =3D ttm_to_xe_device(bdev);
>-        struct xe_gt *gt;
>+        struct xe_tile *tile;
>=20
>         switch (mem->mem_type) {
>         case XE_PL_SYSTEM:
>@@ -370,15 +370,15 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *=
bdev,
>                 return 0;
>         case XE_PL_VRAM0:
>         case XE_PL_VRAM1:
>-                gt =3D mem_type_to_gt(xe, mem->mem_type);
>+                tile =3D mem_type_to_tile(xe, mem->mem_type);
>                 mem->bus.offset =3D mem->start << PAGE_SHIFT;
>=20
>-                if (gt->mem.vram.mapping &&
>+                if (tile->mem.vram.mapping &&
>                     mem->placement & TTM_PL_FLAG_CONTIGUOUS)
>-                        mem->bus.addr =3D (u8 *)gt->mem.vram.mapping +
>+                        mem->bus.addr =3D (u8 *)tile->mem.vram.mapping +
>                                 mem->bus.offset;
>=20
>-                mem->bus.offset +=3D gt->mem.vram.io_start;
>+                mem->bus.offset +=3D tile->mem.vram.io_start;
>                 mem->bus.is_iomem =3D true;
>=20
> #if  !defined(CONFIG_X86)
>@@ -638,9 +638,9 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo=
, bool evict,
>         if (bo->gt)
>                 gt =3D bo->gt;
>         else if (resource_is_vram(new_mem))
>-                gt =3D mem_type_to_gt(xe, new_mem->mem_type);
>+                gt =3D &mem_type_to_tile(xe, new_mem->mem_type)->primary_=
gt;
>         else if (resource_is_vram(old_mem))
>-                gt =3D mem_type_to_gt(xe, old_mem->mem_type);
>+                gt =3D &mem_type_to_tile(xe, old_mem->mem_type)->primary_=
gt;
>=20
>         XE_BUG_ON(!gt);
>         XE_BUG_ON(!gt->migrate);
>@@ -664,7 +664,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo=
, bool evict,
>=20
>                         /* Create a new VMAP once kernel BO back in VRAM =
*/
>                         if (!ret && resource_is_vram(new_mem)) {
>-                                void *new_addr =3D gt->mem.vram.mapping +
>+                                void *new_addr =3D gt_to_tile(gt)->mem.vr=
am.mapping +
>                                         (new_mem->start << PAGE_SHIFT);
>=20
>                                 if (XE_WARN_ON(new_mem->start =3D=3D XE_B=
O_INVALID_OFFSET)) {
>@@ -836,14 +836,14 @@ static unsigned long xe_ttm_io_mem_pfn(struct ttm_bu=
ffer_object *ttm_bo,
> {
>         struct xe_device *xe =3D ttm_to_xe_device(ttm_bo->bdev);
>         struct xe_bo *bo =3D ttm_to_xe_bo(ttm_bo);
>-        struct xe_gt *gt =3D mem_type_to_gt(xe, ttm_bo->resource->mem_typ=
e);
>+        struct xe_tile *tile =3D mem_type_to_tile(xe, ttm_bo->resource->m=
em_type);
>         struct xe_res_cursor cursor;
>=20
>         if (ttm_bo->resource->mem_type =3D=3D XE_PL_STOLEN)
>                 return xe_ttm_stolen_io_offset(bo, page_offset << PAGE_SH=
IFT) >> PAGE_SHIFT;
>=20
>         xe_res_first(ttm_bo->resource, (u64)page_offset << PAGE_SHIFT, 0,=
 &cursor);
>-        return (gt->mem.vram.io_start + cursor.start) >> PAGE_SHIFT;
>+        return (tile->mem.vram.io_start + cursor.start) >> PAGE_SHIFT;
> }
>=20
> static void __xe_bo_vunmap(struct xe_bo *bo);
>@@ -1344,12 +1344,12 @@ struct xe_bo *xe_bo_create_from_data(struct xe_dev=
ice *xe, struct xe_gt *gt,
> uint64_t vram_region_gpu_offset(struct ttm_resource *res)
> {
>         struct xe_device *xe =3D ttm_to_xe_device(res->bo->bdev);
>-        struct xe_gt *gt =3D mem_type_to_gt(xe, res->mem_type);
>+        struct xe_tile *tile =3D mem_type_to_tile(xe, res->mem_type);
>=20
>         if (res->mem_type =3D=3D XE_PL_STOLEN)
>                 return xe_ttm_stolen_gpu_offset(xe);
>=20
>-        return xe->mem.vram.base + gt->mem.vram.base;
>+        return xe->mem.vram.base + tile->mem.vram.base;
> }
>=20
> /**
>diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>index d945675a259f..2cad82510201 100644
>--- a/drivers/gpu/drm/xe/xe_bo.h
>+++ b/drivers/gpu/drm/xe/xe_bo.h
>@@ -22,7 +22,7 @@
> /* -- */
> #define XE_BO_CREATE_STOLEN_BIT                BIT(4)
> #define XE_BO_CREATE_VRAM_IF_DGFX(gt) \
>-        (IS_DGFX(gt_to_xe(gt)) ? XE_BO_CREATE_VRAM0_BIT << gt->info.vram_=
id : \
>+        (IS_DGFX(gt_to_xe(gt)) ? XE_BO_CREATE_VRAM0_BIT << gt_to_tile(gt)=
->id : \
>          XE_BO_CREATE_SYSTEM_BIT)
> #define XE_BO_CREATE_GGTT_BIT                BIT(5)
> #define XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT BIT(6)
>@@ -108,7 +108,7 @@ struct xe_bo *xe_bo_create_from_data(struct xe_device =
*xe, struct xe_gt *gt,
> int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
>                               u32 bo_flags);
>=20
>-struct xe_gt *xe_bo_to_gt(struct xe_bo *bo);
>+struct xe_tile *xe_bo_to_tile(struct xe_bo *bo);
>=20
> static inline struct xe_bo *ttm_to_xe_bo(const struct ttm_buffer_object *=
bo)
> {
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device=
.c
>index e86583fbbdce..cf28b0f150ed 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -299,10 +299,6 @@ int xe_device_probe(struct xe_device *xe)
>                 err =3D xe_tile_init_noalloc(tile);
>                 if (err)
>                         goto err_irq_shutdown;
>-
>-                err =3D xe_gt_init_noalloc(&tile->primary_gt);
>-                if (err)
>-                        goto err_irq_shutdown;
>         }
>=20
>         /* Allocate and map stolen after potential VRAM resize */
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_=
device_types.h
>index d7b809253eb9..ab8310525f7b 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -102,6 +102,36 @@ struct xe_tile {
>=20
>         /** @mem: memory management info for tile */
>         struct {
>+                /**
>+                 * @vram: VRAM info for tile.
>+                 *
>+                 * Although VRAM is associated with a specific tile, it c=
an
>+                 * still be accessed by all tiles' GTs.
>+                 */
>+                struct {
>+                        /** @io_start: IO start address of this VRAM inst=
ance */
>+                        resource_size_t io_start;
>+                        /**
>+                         * @io_size: IO size of this VRAM instance
>+                         *
>+                         * This represents how much of this VRAM we can a=
ccess
>+                         * via the CPU through the VRAM BAR. This can be =
smaller
>+                         * than @size, in which case only part of VRAM is=
 CPU
>+                         * accessible (typically the first 256M). This
>+                         * configuration is known as small-bar.
>+                         */
>+                        resource_size_t io_size;
>+                        /** @base: offset of VRAM starting base */
>+                        resource_size_t base;
>+                        /** @size: size of VRAM. */
>+                        resource_size_t size;
>+                        /** @mapping: pointer to VRAM mappable space */
>+                        void *__iomem mapping;
>+                } vram;
>+
>+                /** @vram_mgr: VRAM TTM manager */
>+                struct xe_ttm_vram_mgr *vram_mgr;
>+
>                 /** @ggtt: Global graphics translation table */
>                 struct xe_ggtt *ggtt;
>         } mem;
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 0f07f810bb1f..419fc471053c 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -37,7 +37,6 @@
> #include "xe_ring_ops.h"
> #include "xe_sa.h"
> #include "xe_sched_job.h"
>-#include "xe_ttm_vram_mgr.h"
> #include "xe_tuning.h"
> #include "xe_uc.h"
> #include "xe_vm.h"
>@@ -46,58 +45,22 @@
>=20
> struct xe_gt *xe_find_full_gt(struct xe_gt *gt)
> {
>-        struct xe_gt *search;
>-        u8 id;
>-
>-        XE_BUG_ON(!xe_gt_is_media_type(gt));
>-
>-        for_each_gt(search, gt_to_xe(gt), id) {
>-                if (search->info.vram_id =3D=3D gt->info.vram_id)
>-                        return search;
>-        }
>-
>-        XE_BUG_ON("NOT POSSIBLE");
>-        return NULL;
>+        /*
>+         * FIXME: Once the code is prepared for re-enabling, this functio=
n will
>+         * be gone. Just return the only possible gt for now.
>+         */
>+        return gt;
> }
>=20
> int xe_gt_alloc(struct xe_device *xe, struct xe_gt *gt)
> {
>-        struct drm_device *drm =3D &xe->drm;
>-
>         XE_BUG_ON(gt->info.type =3D=3D XE_GT_TYPE_UNINITIALIZED);
>=20
>-        if (!xe_gt_is_media_type(gt)) {
>-                gt->mem.vram_mgr =3D drmm_kzalloc(drm, sizeof(*gt->mem.vr=
am_mgr),
>-                                                GFP_KERNEL);
>-                if (!gt->mem.vram_mgr)
>-                        return -ENOMEM;
>-
>-        } else {
>-                struct xe_gt *full_gt =3D xe_find_full_gt(gt);
>-
>-                gt->mem.vram_mgr =3D full_gt->mem.vram_mgr;
>-        }
>-
>         gt->ordered_wq =3D alloc_ordered_workqueue("gt-ordered-wq", 0);
>=20
>         return 0;
> }
>=20
>-static int gt_ttm_mgr_init(struct xe_gt *gt)
>-{
>-        struct xe_device *xe =3D gt_to_xe(gt);
>-        int err;
>-
>-        if (gt->mem.vram.size) {
>-                err =3D xe_ttm_vram_mgr_init(gt, gt->mem.vram_mgr);
>-                if (err)
>-                        return err;
>-                xe->info.mem_region_mask |=3D BIT(gt->info.vram_id) << 1;
>-        }
>-
>-        return 0;
>-}
>-
> void xe_gt_sanitize(struct xe_gt *gt)
> {
>         /*
>@@ -321,41 +284,6 @@ int xe_gt_init_early(struct xe_gt *gt)
>         return 0;
> }
>=20
>-/**
>- * xe_gt_init_noalloc - Init GT up to the point where allocations can hap=
pen.
>- * @gt: The GT to initialize.
>- *
>- * This function prepares the GT to allow memory allocations to VRAM, but=
 is not
>- * allowed to allocate memory itself. This state is useful for display re=
adout,
>- * because the inherited display framebuffer will otherwise be overwritte=
n as it
>- * is usually put at the start of VRAM.
>- *
>- * Returns: 0 on success, negative error code on error.
>- */
>-int xe_gt_init_noalloc(struct xe_gt *gt)
>-{
>-        int err, err2;
>-
>-        if (xe_gt_is_media_type(gt))
>-                return 0;
>-
>-        xe_device_mem_access_get(gt_to_xe(gt));
>-        err =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>-        if (err)
>-                goto err;
>-
>-        err =3D gt_ttm_mgr_init(gt);
>-        if (err)
>-                goto err_force_wake;
>-
>-err_force_wake:
>-        err2 =3D xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>-        XE_WARN_ON(err2);
>-        xe_device_mem_access_put(gt_to_xe(gt));
>-err:
>-        return err;
>-}
>-
> static int gt_fw_domain_init(struct xe_gt *gt)
> {
>         int err, i;
>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>index f4e98f499b36..27e913e9a43a 100644
>--- a/drivers/gpu/drm/xe/xe_gt.h
>+++ b/drivers/gpu/drm/xe/xe_gt.h
>@@ -18,7 +18,6 @@
>=20
> int xe_gt_alloc(struct xe_device *xe, struct xe_gt *gt);
> int xe_gt_init_early(struct xe_gt *gt);
>-int xe_gt_init_noalloc(struct xe_gt *gt);
> int xe_gt_init(struct xe_gt *gt);
> int xe_gt_record_default_lrcs(struct xe_gt *gt);
> void xe_gt_suspend_prepare(struct xe_gt *gt);
>diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_=
gt_pagefault.c
>index 1677640e1075..f4f3d95ae6b1 100644
>--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>@@ -107,6 +107,7 @@ static struct xe_vma *lookup_vma(struct xe_vm *vm, u64=
 page_addr)
> static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> {
>         struct xe_device *xe =3D gt_to_xe(gt);
>+        struct xe_tile *tile =3D gt_to_tile(gt);
>         struct xe_vm *vm;
>         struct xe_vma *vma =3D NULL;
>         struct xe_bo *bo;
>@@ -195,7 +196,7 @@ static int handle_pagefault(struct xe_gt *gt, struct p=
agefault *pf)
>                 }
>=20
>                 /* Migrate to VRAM, move should invalidate the VMA first =
*/
>-                ret =3D xe_bo_migrate(bo, XE_PL_VRAM0 + gt->info.vram_id)=
;
>+                ret =3D xe_bo_migrate(bo, XE_PL_VRAM0 + tile->id);
>                 if (ret)
>                         goto unlock_dma_resv;
>         } else if (bo) {
>@@ -498,6 +499,7 @@ static struct xe_vma *get_acc_vma(struct xe_vm *vm, st=
ruct acc *acc)
> static int handle_acc(struct xe_gt *gt, struct acc *acc)
> {
>         struct xe_device *xe =3D gt_to_xe(gt);
>+        struct xe_tile *tile =3D gt_to_tile(gt);
>         struct xe_vm *vm;
>         struct xe_vma *vma;
>         struct xe_bo *bo;
>@@ -553,7 +555,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *ac=
c)
>                 goto unlock_vm;
>=20
>         /* Migrate to VRAM, move should invalidate the VMA first */
>-        ret =3D xe_bo_migrate(bo, XE_PL_VRAM0 + gt->info.vram_id);
>+        ret =3D xe_bo_migrate(bo, XE_PL_VRAM0 + tile->id);
>=20
>         if (only_needs_bo_lock(bo))
>                 xe_bo_unlock(bo, &ww);
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_t=
ypes.h
>index c06a0b27d6fc..a040ec896e70 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -16,8 +16,6 @@
> struct xe_engine_ops;
> struct xe_migrate;
> struct xe_ring_ops;
>-struct xe_ttm_gtt_mgr;
>-struct xe_ttm_vram_mgr;
>=20
> enum xe_gt_type {
>         XE_GT_TYPE_UNINITIALIZED,
>@@ -108,8 +106,6 @@ struct xe_gt {
>                 enum xe_gt_type type;
>                 /** @id: id of GT */
>                 u8 id;
>-                /** @vram: id of the VRAM for this GT */
>-                u8 vram_id;
>                 /** @clock_freq: clock frequency */
>                 u32 clock_freq;
>                 /** @engine_mask: mask of engines present on GT */
>@@ -144,39 +140,6 @@ struct xe_gt {
>          */
>         struct xe_reg_sr reg_sr;
>=20
>-        /**
>-         * @mem: memory management info for GT, multiple GTs can point to=
 same
>-         * objects (virtual split)
>-         */
>-        struct {
>-                /**
>-                 * @vram: VRAM info for GT, multiple GTs can point to sam=
e info
>-                 * (virtual split), can be subset of global device VRAM
>-                 */
>-                struct {
>-                        /** @io_start: IO start address of this VRAM inst=
ance */
>-                        resource_size_t io_start;
>-                        /**
>-                         * @io_size: IO size of this VRAM instance
>-                         *
>-                         * This represents how much of the VRAM the CPU c=
an access
>-                         * via the VRAM BAR.
>-                         * This can be smaller than the actual @size, in =
which
>-                         * case only part of VRAM is CPU accessible (typi=
cally
>-                         * the first 256M). This configuration is known a=
s small-bar.
>-                         */
>-                        resource_size_t io_size;
>-                        /** @base: offset of VRAM starting base */
>-                        resource_size_t base;
>-                        /** @size: size of VRAM. */
>-                        resource_size_t size;
>-                        /** @mapping: pointer to VRAM mappable space */
>-                        void *__iomem mapping;
>-                } vram;
>-                /** @vram_mgr: VRAM TTM manager */
>-                struct xe_ttm_vram_mgr *vram_mgr;
>-        } mem;
>-
>         /** @reset: state for GT resets */
>         struct {
>                 /**
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index 5bf359c81cc5..5be31855d789 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -369,7 +369,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>         }
>=20
>         for_each_gt(gt, xe, id) {
>-                if ((master_tile_ctl & DG1_MSTR_TILE(gt->info.vram_id)) =
=3D=3D 0)
>+                if ((master_tile_ctl & DG1_MSTR_TILE(gt_to_tile(gt)->id))=
 =3D=3D 0)
>                         continue;
>=20
>                 if (!xe_gt_is_media_type(gt))
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index b27103080ca9..0120b836dd1d 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -206,8 +206,10 @@ static int xe_determine_lmem_bar_size(struct xe_devic=
e *xe)
>  * NOTE: multi-tile bases will include the tile offset.
>  *
>  */
>-int xe_mmio_tile_vram_size(struct xe_gt *gt, u64 *vram_size, u64 *tile_si=
ze, u64 *tile_offset)
>+int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *vram_size, u64 *til=
e_size, u64 *tile_offset)
> {
>+        struct xe_device *xe =3D tile_to_xe(tile);
>+        struct xe_gt *gt =3D &tile->primary_gt;
>         u64 offset;
>         int err;
>         u32 reg;
>@@ -217,8 +219,8 @@ int xe_mmio_tile_vram_size(struct xe_gt *gt, u64 *vram=
_size, u64 *tile_size, u64
>                 return err;
>=20
>         /* actual size */
>-        if (unlikely(gt_to_xe(gt)->info.platform =3D=3D XE_DG1)) {
>-                *tile_size =3D pci_resource_len(to_pci_dev(gt_to_xe(gt)->=
drm.dev), GEN12_LMEM_BAR);
>+        if (unlikely(xe->info.platform =3D=3D XE_DG1)) {
>+                *tile_size =3D pci_resource_len(to_pci_dev(xe->drm.dev), =
GEN12_LMEM_BAR);
>                 *tile_offset =3D 0;
>         } else {
>                 reg =3D xe_gt_mcr_unicast_read_any(gt, XEHP_TILE_ADDR_RAN=
GE(gt->info.id));
>@@ -227,7 +229,7 @@ int xe_mmio_tile_vram_size(struct xe_gt *gt, u64 *vram=
_size, u64 *tile_size, u64
>         }
>=20
>         /* minus device usage */
>-        if (gt_to_xe(gt)->info.has_flat_ccs) {
>+        if (xe->info.has_flat_ccs) {
>                 reg =3D xe_gt_mcr_unicast_read_any(gt, XEHP_FLAT_CCS_BASE=
_ADDR);
>                 offset =3D (u64)REG_FIELD_GET(GENMASK(31, 8), reg) * SZ_6=
4K;
>         } else {
>@@ -242,10 +244,10 @@ int xe_mmio_tile_vram_size(struct xe_gt *gt, u64 *vr=
am_size, u64 *tile_size, u64
>=20
> int xe_mmio_probe_vram(struct xe_device *xe)
> {
>+        struct xe_tile *tile;
>         resource_size_t io_size;
>         u64 available_size =3D 0;
>         u64 total_size =3D 0;
>-        struct xe_gt *gt;
>         u64 tile_offset;
>         u64 tile_size;
>         u64 vram_size;
>@@ -255,9 +257,9 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>         if (!IS_DGFX(xe))
>                 return 0;
>=20
>-        /* Get the size of the gt0 vram for later accessibility compariso=
n */
>-        gt =3D xe_device_get_gt(xe, 0);
>-        err =3D xe_mmio_tile_vram_size(gt, &vram_size, &tile_size, &tile_=
offset);
>+        /* Get the size of the root tile's vram for later accessibility c=
omparison */
>+        tile =3D xe_device_get_root_tile(xe);
>+        err =3D xe_mmio_tile_vram_size(tile, &vram_size, &tile_size, &til=
e_offset);
>         if (err)
>                 return err;
>=20
>@@ -265,7 +267,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>         if (err)
>                 return err;
>=20
>-        /* small bar issues will only cover gt0 sizes */
>+        /* small bar issues will only cover root tile sizes */
>         if (xe->mem.vram.io_size < vram_size)
>                 drm_warn(&xe->drm, "Restricting VRAM size to PCI resource=
 size (0x%llx->0x%llx)\n",
>                          vram_size, (u64)xe->mem.vram.io_size);
>@@ -275,35 +277,32 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>=20
>         io_size =3D xe->mem.vram.io_size;
>=20
>-        /* gt specific ranges */
>-        for_each_gt(gt, xe, id) {
>-                if (xe_gt_is_media_type(gt))
>-                        continue;
>-
>-                err =3D xe_mmio_tile_vram_size(gt, &vram_size, &tile_size=
, &tile_offset);
>+        /* tile specific ranges */
>+        for_each_tile(tile, xe, id) {
>+                err =3D xe_mmio_tile_vram_size(tile, &vram_size, &tile_si=
ze, &tile_offset);
>                 if (err)
>                         return err;
>=20
>-                gt->mem.vram.io_start =3D xe->mem.vram.io_start + tile_of=
fset;
>-                gt->mem.vram.io_size =3D min_t(u64, vram_size, io_size);
>+                tile->mem.vram.io_start =3D xe->mem.vram.io_start + tile_=
offset;
>+                tile->mem.vram.io_size =3D min_t(u64, vram_size, io_size)=
;
>=20
>-                if (!gt->mem.vram.io_size) {
>+                if (!tile->mem.vram.io_size) {
>                         drm_err(&xe->drm, "Tile without any CPU visible V=
RAM. Aborting.\n");
>                         return -ENODEV;
>                 }
>=20
>-                gt->mem.vram.base =3D tile_offset;
>+                tile->mem.vram.base =3D tile_offset;
>=20
>                 /* small bar can limit the visible size.  size accordingl=
y */
>-                gt->mem.vram.size =3D min_t(u64, vram_size, io_size);
>-                gt->mem.vram.mapping =3D xe->mem.vram.mapping + tile_offs=
et;
>+                tile->mem.vram.size =3D min_t(u64, vram_size, io_size);
>+                tile->mem.vram.mapping =3D xe->mem.vram.mapping + tile_of=
fset;
>=20
>-                drm_info(&xe->drm, "VRAM[%u, %u]: %pa, %pa\n", id, gt->in=
fo.vram_id,
>-                         &gt->mem.vram.io_start, &gt->mem.vram.size);
>+                drm_info(&xe->drm, "VRAM[%u, %u]: %pa, %pa\n", id, tile->=
id,
>+                         &tile->mem.vram.io_start, &tile->mem.vram.size);
>=20
>-                if (gt->mem.vram.io_size < gt->mem.vram.size)
>+                if (tile->mem.vram.io_size < tile->mem.vram.size)
>                         drm_info(&xe->drm, "VRAM[%u, %u]: CPU access limi=
ted to %pa\n", id,
>-                                 gt->info.vram_id, &gt->mem.vram.io_size)=
;
>+                                 tile->id, &tile->mem.vram.io_size);
>=20
>                 /* calculate total size using tile size to get the correc=
t HW sizing */
>                 total_size +=3D tile_size;
>@@ -329,7 +328,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>=20
> static void xe_mmio_probe_tiles(struct xe_device *xe)
> {
>-        struct xe_gt *gt =3D xe_device_get_gt(xe, 0);
>+        struct xe_gt *gt =3D &xe_device_get_root_tile(xe)->primary_gt;
>         u32 mtcfg;
>         u8 adj_tile_count;
>         u8 id;
>diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>index 0ba7aa790f0b..3c547d78afba 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.h
>+++ b/drivers/gpu/drm/xe/xe_mmio.h
>@@ -144,6 +144,6 @@ static inline bool xe_mmio_in_range(const struct xe_mm=
io_range *range,
> }
>=20
> int xe_mmio_probe_vram(struct xe_device *xe);
>-int xe_mmio_tile_vram_size(struct xe_gt *gt, u64 *vram_size, u64 *tile_si=
ze, u64 *tile_base);
>+int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *vram_size, u64 *til=
e_size, u64 *tile_base);
>=20
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 9e0d26329dd7..7fc91e7ec5a7 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -568,7 +568,6 @@ static int xe_info_init(struct xe_device *xe,
>=20
>                 if (id =3D=3D 0) {
>                         gt->info.type =3D XE_GT_TYPE_MAIN;
>-                        gt->info.vram_id =3D id;
>=20
>                         gt->info.__engine_mask =3D graphics_desc->hw_engi=
ne_mask;
>                         if (MEDIA_VER(xe) < 13 && media_desc)
>@@ -578,7 +577,6 @@ static int xe_info_init(struct xe_device *xe,
>                         gt->mmio.adj_offset =3D 0;
>                 } else {
>                         gt->info.type =3D desc->extra_gts[id - 1].type;
>-                        gt->info.vram_id =3D desc->extra_gts[id - 1].vram=
_id;
>                         gt->info.__engine_mask =3D (gt->info.type =3D=3D =
XE_GT_TYPE_MEDIA) ?
>                                 media_desc->hw_engine_mask :
>                                 graphics_desc->hw_engine_mask;
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index b10959fde43b..799bf68800e7 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -182,7 +182,7 @@ static int query_config(struct xe_device *xe, struct d=
rm_xe_device_query *query)
>         config->num_params =3D num_params;
>         config->info[XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =3D
>                 xe->info.devid | (xe->info.revid << 16);
>-        if (to_gt(xe)->mem.vram.size)
>+        if (xe_device_get_root_tile(xe)->mem.vram.size)
>                 config->info[XE_QUERY_CONFIG_FLAGS] =3D
>                         XE_QUERY_CONFIG_FLAGS_HAS_VRAM;
>         if (xe->info.enable_guc)
>@@ -242,7 +242,7 @@ static int query_gts(struct xe_device *xe, struct drm_=
xe_device_query *query)
>                         gts->gts[id].native_mem_regions =3D 0x1;
>                 else
>                         gts->gts[id].native_mem_regions =3D
>-                                BIT(gt->info.vram_id) << 1;
>+                                BIT(gt_to_tile(gt)->id) << 1;
>                 gts->gts[id].slow_mem_regions =3D xe->info.mem_region_mas=
k ^
>                         gts->gts[id].native_mem_regions;
>         }
>diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_re=
s_cursor.h
>index 4e99fae26b4c..f2ba609712d3 100644
>--- a/drivers/gpu/drm/xe/xe_res_cursor.h
>+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
>@@ -53,7 +53,7 @@ static struct drm_buddy *xe_res_get_buddy(struct ttm_res=
ource *res)
>         struct xe_device *xe =3D ttm_to_xe_device(res->bo->bdev);
>=20
>         if (res->mem_type !=3D XE_PL_STOLEN) {
>-                return &xe_device_get_gt(xe, res->mem_type - XE_PL_VRAM0)=
->mem.vram_mgr->mm;
>+                return &xe->tiles[res->mem_type - XE_PL_VRAM0].mem.vram_m=
gr->mm;
>         } else {
>                 struct ttm_resource_manager *mgr =3D
>                         ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
>diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
>index 7ef594f301ca..5530a6b6ef31 100644
>--- a/drivers/gpu/drm/xe/xe_tile.c
>+++ b/drivers/gpu/drm/xe/xe_tile.c
>@@ -29,6 +29,25 @@ int xe_tile_alloc(struct xe_tile *tile)
>                 return -ENOMEM;
>         tile->mem.ggtt->tile =3D tile;
>=20
>+        tile->mem.vram_mgr =3D drmm_kzalloc(drm, sizeof(*tile->mem.vram_m=
gr), GFP_KERNEL);
>+        if (!tile->mem.vram_mgr)
>+                return -ENOMEM;
>+
>+        return 0;
>+}
>+
>+static int tile_ttm_mgr_init(struct xe_tile *tile)
>+{
>+        struct xe_device *xe =3D tile_to_xe(tile);
>+        int err;
>+
>+        if (tile->mem.vram.size) {
>+                err =3D xe_ttm_vram_mgr_init(tile, tile->mem.vram_mgr);
>+                if (err)
>+                        return err;
>+                xe->info.mem_region_mask |=3D BIT(tile->id) << 1;
>+        }
>+
>         return 0;
> }
>=20
>@@ -48,5 +67,17 @@ int xe_tile_alloc(struct xe_tile *tile)
>  */
> int xe_tile_init_noalloc(struct xe_tile *tile)
> {
>-        return xe_ggtt_init_noalloc(tile->mem.ggtt);
>+        int err;
>+
>+        xe_device_mem_access_get(tile_to_xe(tile));
>+
>+        err =3D tile_ttm_mgr_init(tile);
>+        if (err)
>+                goto err_mem_access;
>+
>+        err =3D xe_ggtt_init_noalloc(tile->mem.ggtt);
>+
>+err_mem_access:
>+        xe_device_mem_access_put(tile_to_xe(tile));
>+        return err;
> }
>diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/x=
e_ttm_stolen_mgr.c
>index 49470f0722bd..c68325161c19 100644
>--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>@@ -51,29 +51,31 @@ bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_dev=
ice *xe)
>         return GRAPHICS_VERx100(xe) < 1270 && !IS_DGFX(xe);
> }
>=20
>-static s64 detect_bar2_dgfx(struct xe_gt *gt, struct xe_ttm_stolen_mgr *m=
gr)
>+static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mg=
r *mgr)
> {
>-        struct pci_dev *pdev =3D to_pci_dev(gt_to_xe(gt)->drm.dev);
>+        struct xe_tile *tile =3D xe_device_get_root_tile(xe);
>+        struct xe_gt *mmio =3D &tile->primary_gt;
>+        struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
>         u64 stolen_size;
>         u64 tile_offset;
>         u64 tile_size;
>         u64 vram_size;
>=20
>-        if (xe_mmio_tile_vram_size(gt, &vram_size, &tile_size, &tile_offs=
et)) {
>-                drm_err(&gt_to_xe(gt)->drm, "Querying total vram size fai=
led\n");
>+        if (xe_mmio_tile_vram_size(tile, &vram_size, &tile_size, &tile_of=
fset)) {
>+                drm_err(&xe->drm, "Querying total vram size failed\n");
>                 return 0;
>         }
>=20
>         /* Use DSM base address instead for stolen memory */
>-        mgr->stolen_base =3D (xe_mmio_read64(gt, DSMBASE) & BDSM_MASK) - =
tile_offset;
>-        if (drm_WARN_ON(&gt_to_xe(gt)->drm, tile_size < mgr->stolen_base)=
)
>+        mgr->stolen_base =3D (xe_mmio_read64(mmio, DSMBASE) & BDSM_MASK) =
- tile_offset;
>+        if (drm_WARN_ON(&xe->drm, tile_size < mgr->stolen_base))
>                 return 0;
>=20
>         stolen_size =3D tile_size - mgr->stolen_base;
>=20
>         /* Verify usage fits in the actual resource available */
>         if (mgr->stolen_base + stolen_size <=3D pci_resource_len(pdev, GE=
N12_LMEM_BAR))
>-                mgr->io_base =3D gt->mem.vram.io_start + mgr->stolen_base=
;
>+                mgr->io_base =3D tile->mem.vram.io_start + mgr->stolen_ba=
se;
>=20
>         /*
>          * There may be few KB of platform dependent reserved memory at t=
he end
>@@ -141,7 +143,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
>         int err;
>=20
>         if (IS_DGFX(xe))
>-                stolen_size =3D detect_bar2_dgfx(to_gt(xe), mgr);
>+                stolen_size =3D detect_bar2_dgfx(xe, mgr);
>         else if (GRAPHICS_VERx100(xe) >=3D 1270)
>                 stolen_size =3D detect_bar2_integrated(xe, mgr);
>         else
>diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_=
ttm_vram_mgr.c
>index 73836b9b7fed..1a84abd35fcf 100644
>--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>@@ -353,16 +353,14 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, str=
uct xe_ttm_vram_mgr *mgr,
>         return drmm_add_action_or_reset(&xe->drm, ttm_vram_mgr_fini, mgr)=
;
> }
>=20
>-int xe_ttm_vram_mgr_init(struct xe_gt *gt, struct xe_ttm_vram_mgr *mgr)
>+int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mg=
r)
> {
>-        struct xe_device *xe =3D gt_to_xe(gt);
>+        struct xe_device *xe =3D tile_to_xe(tile);
>=20
>-        XE_BUG_ON(xe_gt_is_media_type(gt));
>+        mgr->tile =3D tile;
>=20
>-        mgr->gt =3D gt;
>-
>-        return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + gt->info.vra=
m_id,
>-                                      gt->mem.vram.size, gt->mem.vram.io_=
size,
>+        return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
>+                                      tile->mem.vram.size, tile->mem.vram=
.io_size,
>                                       PAGE_SIZE);
> }
>=20
>@@ -373,7 +371,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>                               enum dma_data_direction dir,
>                               struct sg_table **sgt)
> {
>-        struct xe_gt *gt =3D xe_device_get_gt(xe, res->mem_type - XE_PL_V=
RAM0);
>+        struct xe_tile *tile =3D &xe->tiles[res->mem_type - XE_PL_VRAM0];
>         struct xe_res_cursor cursor;
>         struct scatterlist *sg;
>         int num_entries =3D 0;
>@@ -406,7 +404,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>          */
>         xe_res_first(res, offset, length, &cursor);
>         for_each_sgtable_sg((*sgt), sg, i) {
>-                phys_addr_t phys =3D cursor.start + gt->mem.vram.io_start=
;
>+                phys_addr_t phys =3D cursor.start + tile->mem.vram.io_sta=
rt;
>                 size_t size =3D cursor.size;
>                 dma_addr_t addr;
>=20
>diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_=
ttm_vram_mgr.h
>index 35e5367a79fb..6e1d6033d739 100644
>--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
>+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
>@@ -10,12 +10,12 @@
>=20
> enum dma_data_direction;
> struct xe_device;
>-struct xe_gt;
>+struct xe_tile;
>=20
> int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *=
mgr,
>                            u32 mem_type, u64 size, u64 io_size,
>                            u64 default_page_size);
>-int xe_ttm_vram_mgr_init(struct xe_gt *gt, struct xe_ttm_vram_mgr *mgr);
>+int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mg=
r);
> int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>                               struct ttm_resource *res,
>                               u64 offset, u64 length,
>diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/=
xe/xe_ttm_vram_mgr_types.h
>index 3d9417ff7434..48bb991c14a5 100644
>--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
>+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
>@@ -9,7 +9,7 @@
> #include <drm/drm_buddy.h>
> #include <drm/ttm/ttm_device.h>
>=20
>-struct xe_gt;
>+struct xe_tile;
>=20
> /**
>  * struct xe_ttm_vram_mgr - XE TTM VRAM manager
>@@ -17,8 +17,8 @@ struct xe_gt;
>  * Manages placement of TTM resource in VRAM.
>  */
> struct xe_ttm_vram_mgr {
>-        /** @gt: Graphics tile which the VRAM belongs to */
>-        struct xe_gt *gt;
>+        /** @tile: Tile which the VRAM belongs to */
>+        struct xe_tile *tile;
>         /** @manager: Base TTM resource manager */
>         struct ttm_resource_manager manager;
>         /** @mm: DRM buddy allocator which manages the VRAM */
>--=20
>2.40.1
>

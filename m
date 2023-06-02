Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3B2C77B7A
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 14:31:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FCD10E6A8;
	Fri,  2 Jun 2023 14:31:44 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3AA410E6A8
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 14:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685716302; x=1717252302;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=RmVUlK2nViwH3nAXdDHnN+YJQv3aV/0VRrxki8OFI/E=;
 b=TxZOtYDlOvvk9veptTXodM82qu0HYIMUBlMo86hYZ7lOO6ettB/jwcgW
 V7arwIYZWBkLLhvsXDr/H0lsVgPIJZdk9SwupTLFR99yfZM5cTKgxegMQ
 ZhXpGDnkL1eE6A+cQsF4iu7bn4YdxuCCfrdu07iuUpR8uZsK1KDOYulYC
 d5fBHGUVuQdBfeKZiw2labh5/7HYkBvJuxdrj6a11hEcWeaBusMMh6jMs
 g1b8Gxm1OTYEjRriOHtxLVjfgMoVm3d8lZFomuNLTIbvBm38AWHn08mRr
 gGVwPVqJVkwGCr6deRqXl4TAHR/ynBodIqO+nkq3eSvqr2bLyJVZG1kzs Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="354728108"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="354728108"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 07:31:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="832002563"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="832002563"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 02 Jun 2023 07:31:40 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 2 Jun 2023 07:31:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 2 Jun 2023 07:31:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 2 Jun 2023 07:31:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RS8/0tq0mU0YqkTvIZ76BHNrBmQKEAWVDel+8OBERABg0m7CfltNE1nsqU3yu1RtQzDcrIpigCbKTr/N0g8kAdygmGJ726I67vVgOLfvYG4biPOtx0tbwVOUq6Qc8Q5zrV32GEPgqZbqZ9BXtx91z2Ce4f8hd2W2fSKOiaDhhIG19eb3TJZ+BC4In3hpsVy0YEDOyYAVf2+gzyI3UMYdE0KH0VzBL2d9dbe/arRl0I3k3HV72fPG5IuuGyZn9c0hGdCLo7YtPTv3BBGLyR5XgZmt3+yVwmfWBCfgJZkdLPlhyi176ZNwlrln/7l4oOjeDJqyKmJUDF1ImEbyCSG/9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2mxusYDqytABe3ulNl3JIUTPAmhrZxJuU3CfV2doSjA=;
 b=OUQOI1fOUaRy+yBGx/ya3ZLs1CkjXUpPA9sbLSaejwSCehDAhp/sz7qyC7WJGSdFYt0APAUhA9shJkvAygtNY5XhYS8UaKBxvVQrppkr2xuMhe25xCz3710OBgBDuW3APRRBvvqeYt6YnDj0anNL8lEf/rohcdKPO94uM9E261ai/OS8NTtk7I50Ixm31VK8GKpuqWisft6Q8XH/W+T8WunI/bPnmZAM1UTaxxF6p645qOTw2zsupnhuldLwy5wOObQjzIFxeLWPZyv8dpV9e3ybaQxs2aHp0AVcLb8GAa7UsRjGcISU5LXY9sJHbGd2MxFlZioCXtnMqnGQzsYAwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by PH7PR11MB6379.namprd11.prod.outlook.com (2603:10b6:510:1f9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Fri, 2 Jun
 2023 14:31:34 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68%4]) with mapi id 15.20.6455.020; Fri, 2 Jun 2023
 14:31:33 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230601194419.1179609-1-gustavo.sousa@intel.com>
References: <20230601194419.1179609-1-gustavo.sousa@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 2 Jun 2023 11:31:28 -0300
Message-ID: <168571628815.3435.13991959186316393292@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR05CA0135.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::20) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|PH7PR11MB6379:EE_
X-MS-Office365-Filtering-Correlation-Id: 517461f9-f89a-43fb-8065-08db63761057
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AQR9igl1d49Kq+ozf9eSOPSH80q/E0P/WmOcoDpYkS2xeGLNYRD6wwqya+YjuZwmBFEmfhjQyaceTOaoFn8iOajf0RStFemqX94SSEcXurmJX3bB5e0ypE3MKogtA88s8C5B+GzcDBDn7UFwenT+aXp3x5Ih0i5e9Cttmwtpu6EJK9YfKXK0C0UNM17zXvG+G1+P4NQAp6ebfa24vPCcg4pyAg4YJjq0YGj4NOHr2ZnjrJnHYqL/U4ji7mO90i1QBrVWOTCUTeA7qJmpGnv+KIbw/ZZrLQp+VjZRuNUTFiCoF25jo1eREYSWaNEo0R7LiG7NnMN8M2X+yczb0NYa7bbydRmsRbmWt5AWWzFq/jyY20Y4E0kORSHsD737KCUPxZvCp9NSYJ7gbADirTpMYZaKvSLbyorVZHtVVIXyfUTsj6tUij/d9Qd3xe4QrSTelGsGv95tC5pfaWrnsDyFaTlOdKh2eF89d7TQezraSnYUFoSwp1K/BecdrfYES9+EmImD3zHNj5tqiZKaiWNCgxuNR0eSCAGygzgMtDOojuqsycye2iXgIbAoQyAkitTL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(39860400002)(396003)(366004)(376002)(346002)(451199021)(316002)(38100700002)(82960400001)(6486002)(41300700001)(33716001)(44832011)(478600001)(107886003)(86362001)(6512007)(2906002)(186003)(83380400001)(6506007)(4326008)(5660300002)(9686003)(26005)(54906003)(6916009)(6666004)(8676002)(66476007)(8936002)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3ZRV1VvaGtmVCtJSWgyMUw1NGRnMG15V2FnYy9RZWI0aVhVNUFiNEVOaHJ0?=
 =?utf-8?B?Mk41LzByZUJhU3lzaWxRZmxTSXNHZ2t6MC9CWEt3alYyT1lKN2ozQnBlTSt3?=
 =?utf-8?B?NVljbHF0WTlsZFJwR3hGTHM0bCtVZWVTUU5sZGxHTjlhcnF5RUIwSFdEODhw?=
 =?utf-8?B?OTgyQ0Q5QnFiV3VGTkh2WDRHckJqdHVOM0w2WUFNNXJTYnNwTEtaWmpJaDc5?=
 =?utf-8?B?Ry9wbC9NQUkydmJJOTBYSnhHckdFSnJ0d1k0clQrcm9hN1NmbllBV0IvbFlz?=
 =?utf-8?B?R2ZBMG9EZTJ4WGtZdloyTDVHZEtXQjlueDNHWkI3c3FWaWhCblZXeXBqN0Zj?=
 =?utf-8?B?SFY5Mnd2QkU0d29CK3ZYREpMWVRwRVkvUHFHZGNjcEhDV1dkUmRweCsyanBU?=
 =?utf-8?B?NTg4cnlWbTVJbm10em1veVZPMVhlaW0rb2pPTGQ0MG5zUkcrQmFXc1NLTHlG?=
 =?utf-8?B?V2RhOW55K0loZXBMOCt0MGk4M1JubEEzQnVoOU1JTU1aeGtlTWIwcWpsQm9V?=
 =?utf-8?B?QXdWbkxaMGVqMWpPa2pRdlBSandBQnluNXlLcXhrMFc0MkIydjNuL1Q2dE01?=
 =?utf-8?B?ZWtXWUR5WlJ2RmV2dnZ0UjF3T0xrZ2dXeHhtYjJzN1NQUmVWYktlRk83REFC?=
 =?utf-8?B?MTcveTl1REdubFFnaHU2aHRrL3RPMWUvSWFvMjFFc3BTSDJmblVKMEo5RHNJ?=
 =?utf-8?B?aDZkM0RBNU9CQk5iS1hNMkc0NTc0OFB3NXpsS0kyMU9vWW9Bci9yUHpJU3Zj?=
 =?utf-8?B?TTNTZmtBeitZTnRVRlpOUUtuallydy9MZEpsSTVLZWc1WTdDN3REVVZBK3p3?=
 =?utf-8?B?QW9OSkVKQTBUTTd6bHg0NWtKek1rRU9CbXhPZW9XNzA0dEhZbGsrQ1Z4WHhn?=
 =?utf-8?B?d0FWMWpocTI5amhleVNSNThiWTI1YlNqZjZQd05zTVB0VTRpc1pFRlZ3QnY5?=
 =?utf-8?B?VmJLcWxHenZFcmRCd1h0VURHRE93ZDcrcFNyalBiWEJWV2tVMHgyekNUTU41?=
 =?utf-8?B?Y1h1M0tWM2N5VmpkQnowZWx5dGx0RWg3c1cxL0ZNZGhwNEV2aGdWNWdMdkdN?=
 =?utf-8?B?TnJrSDFENmtHK3Q1Y1VGL3oyc1FiTzVIK29obTgyVHFxSmhoaWJrRXZ0RzVz?=
 =?utf-8?B?SG54OVJGd2syOTRVVlJBVjR6clQrenozMWY0Uy8rV2RRS2VFY3ZpU3hMNDRG?=
 =?utf-8?B?SmpGZUxaWDdpbVNoWGoxY09Hc1ZDNDVMaDBZaFoyR3NsQzlheU00S3piaWtz?=
 =?utf-8?B?YXlKUVY2YUdUTGNkMWFEUGlJamdwaHVjclNXRHZtRlpualhkRGRXb1dQb1Ry?=
 =?utf-8?B?Q3lYMHRQWE5sZTRRMFRSTnJKeVdDZWYwL0x2N09Ta2lQdUlTT3Q1RVJ0b0dW?=
 =?utf-8?B?K3BjcVErQTNXVExXUmRwdEFCRmVGdU9ycFRUQnBDTms2cjBVYlRrUnVGQ0NT?=
 =?utf-8?B?c09zS2NDbjh2dG9WR2ZEUTEzc0E2OVl5K05zUTFvWUE3ZkoxVVBVMHBIVFdD?=
 =?utf-8?B?K3VOeGVuek1iUit4elVHYm55ZEVUblkxRVl3cHRyb3hDTGFaSjNFNlkzZU92?=
 =?utf-8?B?eDBGRmpJeDFqR2RFS3FaUm1aWmkzck1HbGZaVmo1OFpIYVhqcENPRFgxMkM5?=
 =?utf-8?B?QU5MMG1TRWxWU1FGTnFMRFBsSzl0SUpWcXZCT1JMTnN6VGdpSXFnbWtRR0l2?=
 =?utf-8?B?VzNCSW5WU1Z4SXRqRUEySkNYc2xBTzZFMWdRVklkS0JjU21EMmtkZ2dDV0s2?=
 =?utf-8?B?MitxUTE1cmM3blhhU0NJUkRmeVZ5UW1NQkR6bEVXYTVxSmZoMXRweVhneWYr?=
 =?utf-8?B?bXQrYTBqK1A2VXBnNC9wbG03NGl5eHdyZFk4TTV5K1NUM0llOWxQUVh2UVFB?=
 =?utf-8?B?WFFiZDlLTEx2TzQwQlRTZHQ2Z0pJbC9oTGdhV0d3WStKeUxENXR4QWE1Vmkw?=
 =?utf-8?B?VUxNWkgxcEYwTlNrYVZwNVROSlZCTEZndWpFaUFwY20vSTdwYzAvamdSTlRP?=
 =?utf-8?B?dWlDVGZockduR3lEK1JNZ3c3cElhbXlVNE5xVmIrV3FwUXVOVkdtL201TTRr?=
 =?utf-8?B?aTdVV0tIb05SblFJWlp1YnRtY0ZudldzYWZCSjBBd0ZkK21IdjhnVEFJT0Z2?=
 =?utf-8?B?Z0FFdFRkUU1qZFErYVJGcnlVdldPVGx1K2cvdVh4TkVqZi9SeW9LYm1zNnA3?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 517461f9-f89a-43fb-8065-08db63761057
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 14:31:33.7638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C7Bdrovrj0UCBB3MjHGgPMNnowA4FUp5v6QbTwSWDcqzXPAzi6J7GFwVxsEOs+BmBxHCGUv7awpYzRt4uLwjKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6379
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Replace deprecated DRM_ERROR()
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Gustavo Sousa (2023-06-01 16:44:19-03:00)
>DRM_ERROR() has been deprecated in favor of pr_err(). However, we should
>prefer to use xe_gt_err() or drm_err() whenever possible so we get gt-
>or device-specific output with the error message.
>
>v2:
>  - Prefer drm_err() over pr_err(). (Matt, Jani)
>v3:
>  - Prefer xe_gt_err() over drm_err() when possible. (Matt)
>v4:
>  - Use the already available dev variable instead of xe->drm as
>    parameter to drm_err(). (Matt)
>
>Cc: Jani Nikula <jani.nikula@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Haridhar Kalvala <haridhar.kalvala@intel.com>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Pushed. Thanks for the reviews!

--
Gustavo Sousa

>---
> drivers/gpu/drm/xe/xe_reg_sr.c | 7 +++++--
> drivers/gpu/drm/xe/xe_reg_sr.h | 3 ++-
> drivers/gpu/drm/xe/xe_rtp.c    | 2 +-
> drivers/gpu/drm/xe/xe_vm.c     | 3 ++-
> 4 files changed, 10 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr=
.c
>index 434133444d74..8580ff38b82c 100644
>--- a/drivers/gpu/drm/xe/xe_reg_sr.c
>+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>@@ -19,6 +19,7 @@
> #include "xe_force_wake.h"
> #include "xe_gt.h"
> #include "xe_gt_mcr.h"
>+#include "xe_gt_printk.h"
> #include "xe_macros.h"
> #include "xe_mmio.h"
> #include "xe_reg_whitelist.h"
>@@ -89,7 +90,8 @@ static void reg_sr_inc_error(struct xe_reg_sr *sr)
> }
>=20
> int xe_reg_sr_add(struct xe_reg_sr *sr,
>-                  const struct xe_reg_sr_entry *e)
>+                  const struct xe_reg_sr_entry *e,
>+                  struct xe_gt *gt)
> {
>         unsigned long idx =3D e->reg.addr;
>         struct xe_reg_sr_entry *pentry =3D xa_load(&sr->xa, idx);
>@@ -122,7 +124,8 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
>         return 0;
>=20
> fail:
>-        DRM_ERROR("Discarding save-restore reg %04lx (clear: %08x, set: %=
08x, masked: %s, mcr: %s): ret=3D%d\n",
>+        xe_gt_err(gt,
>+                  "discarding save-restore reg %04lx (clear: %08x, set: %=
08x, masked: %s, mcr: %s): ret=3D%d\n",
>                   idx, e->clr_bits, e->set_bits,
>                   str_yes_no(e->reg.masked),
>                   str_yes_no(e->reg.mcr),
>diff --git a/drivers/gpu/drm/xe/xe_reg_sr.h b/drivers/gpu/drm/xe/xe_reg_sr=
.h
>index 0bfe66ea29bf..c3001798d9e8 100644
>--- a/drivers/gpu/drm/xe/xe_reg_sr.h
>+++ b/drivers/gpu/drm/xe/xe_reg_sr.h
>@@ -19,7 +19,8 @@ struct drm_printer;
> int xe_reg_sr_init(struct xe_reg_sr *sr, const char *name, struct xe_devi=
ce *xe);
> void xe_reg_sr_dump(struct xe_reg_sr *sr, struct drm_printer *p);
>=20
>-int xe_reg_sr_add(struct xe_reg_sr *sr, const struct xe_reg_sr_entry *e);
>+int xe_reg_sr_add(struct xe_reg_sr *sr, const struct xe_reg_sr_entry *e,
>+                  struct xe_gt *gt);
> void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt);
> void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
>                                struct xe_gt *gt);
>diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>index 43a86358efb6..956bd39fe1a0 100644
>--- a/drivers/gpu/drm/xe/xe_rtp.c
>+++ b/drivers/gpu/drm/xe/xe_rtp.c
>@@ -122,7 +122,7 @@ static void rtp_add_sr_entry(const struct xe_rtp_actio=
n *action,
>         };
>=20
>         sr_entry.reg.addr +=3D mmio_base;
>-        xe_reg_sr_add(sr, &sr_entry);
>+        xe_reg_sr_add(sr, &sr_entry, gt);
> }
>=20
> static bool rtp_process_one_sr(const struct xe_rtp_entry_sr *entry,
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index 5aa2aeb14beb..30ffaf8b1e1a 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -7,6 +7,7 @@
>=20
> #include <linux/dma-fence-array.h>
>=20
>+#include <drm/drm_print.h>
> #include <drm/ttm/ttm_execbuf_util.h>
> #include <drm/ttm/ttm_tt.h>
> #include <drm/xe_drm.h>
>@@ -3056,7 +3057,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *d=
ata, struct drm_file *file)
>         }
>=20
>         if (XE_IOCTL_ERR(xe, xe_vm_is_closed(vm))) {
>-                DRM_ERROR("VM closed while we began looking up?\n");
>+                drm_err(dev, "VM closed while we began looking up?\n");
>                 err =3D -ENOENT;
>                 goto put_vm;
>         }
>--=20
>2.40.1
>

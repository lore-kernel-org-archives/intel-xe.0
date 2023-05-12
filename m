Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D333AC77B7C
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 05:33:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B3910E61B;
	Fri, 12 May 2023 05:33:37 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFFF10E61B
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 05:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683869615; x=1715405615;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=dfJndPO9mgKYgNDJVcwOcPzzGgl9cAopVGhN8UAY7IY=;
 b=elrtWxX1WDP5P2g//cUk8yrG/ZlCqMENbV0feOUAWjhEYleX5TLy/wyQ
 AdNeAzko5wq+KHZ1swf5DtlKykKD0Dw79BiQHzrpUOx0ecW9sbAbtutFD
 Nt4xBuiuPFTineb7Rx90LH8gsCz2yJb1Qu5x+YdP+1c+i/h3tgOCZokdI
 6IdVx2hEIGtYC4QWBVRfiu0Xy/YWclKEPxOB5ROZn7JszvPEpcsx90BjV
 Lj8Y/CVVs6M9XDEetfjNuyvmAzIinTogLru3z3vk9GTD/vLaDPscGKz6T
 zAMzHPnlm3vsKNopc8FpdDbN0CZWQKgtoxeeH5CY/hIcqAiDn1PxW6xbv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="335223700"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="335223700"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 22:33:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="765034634"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="765034634"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 11 May 2023 22:33:33 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 22:33:33 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 22:33:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 22:33:32 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 11 May 2023 22:33:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cCYtZbBNUsj6+0sauszR+PzTm1dWO3sMGRALPTTEkDslFcRv9mPrHPPo1emxKJAlDtIsTcnQnjot6Hy0/uT/E7HvLAOIJpVgEz6neobLTEbfANFeelBXV+9ae/XFWyyJjRs99/s/dAWZ/w8Q1xjIjcJdef50iVv/ibpf01IDUuobXmhtssJ2j6/D4FigmyJWXOpCX+bSXTCf2IW58mmCg/3XuRxVGXYnPNTc418hW02zRUu9QCGnOkcMrSn9Sn8ilN3CfRivHd5XIAoZrSSm5IbY4F0eLIBDfD3oCEIl9QGr/baI3QynR51CaDsSDWj67nfnCRbHQgkaY6JOIZ+MnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dWV/kNHDVw0xBoDzHgVNpkP2ajtKfWaROj9Jo5xo8M=;
 b=I4PU61umy7KFXnjV9EOfaTXhhC64swlTi4QJSf2pTvQ0YnurMNsf17RTUNAiHXjUQ4naF1o84Ph7TAkhGZ7ADRtRMru+EtJI2CHTAyYDWFPZQkqllPxi2fuiU+11FL4SOqI5vei7y52WzId3f7hny46L1vqaSwDzAmhdxJEvrzeG+EQzuSMPDHB5ulnxVAVAE/0tJ9C6wNpGYUbn3WkIV3ziscnkRpQPKJiQ5NwX9Lcu/IEz0/ae75W0SW372PCbhrEwitANifXIeOIx6wYlcFLBRv65ThoPaIcBS/xGp2rfaK2t2pG+d6o0wMlzojmXkP5opnFLkYiL85wHqXmQCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by IA1PR11MB6289.namprd11.prod.outlook.com (2603:10b6:208:3e7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Fri, 12 May
 2023 05:33:30 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::4921:b87b:297:f312]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::4921:b87b:297:f312%6]) with mapi id 15.20.6387.022; Fri, 12 May 2023
 05:33:30 +0000
Message-ID: <5ae567e0-62c8-5fa2-9787-0e4292ef5771@intel.com>
Date: Fri, 12 May 2023 11:03:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.1
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-3-matthew.d.roper@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20230511034722.1929038-3-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::8) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|IA1PR11MB6289:EE_
X-MS-Office365-Filtering-Correlation-Id: b50a2a4d-166b-45df-ccda-08db52aa6b64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wweWNx0KgpcwLlNrIXaoWOTx/4P+SGoY0IoEGtNrpmXfkh/56GrkQPxcTjep8WSbMmyawaTSa5hL0k0uq2gYe+oDtxxuPRx25afX892AvWs6oAZeHxOUbNlflFCx1Sv+YiHGt+o7YZ4a7NDWkONfx5Nx6PNE113j2Uxr2L/U00OvTT7ubrihek6T2KrOa6d6wNaXCzj0AwsHYXeEJC+LKC0bphYwko8WSbcHLlktYeF7qsIvhy5YxQsI6mnALbNn5uzXKpfUv1zgvfmYMK99eLGXa/INbZ+lpl5Viet76tKJcWLGq3xjPaGxRQ8qx7JZflpb08f5u4cTBhz1Q84xrwnaYRbD2z/ERTK8ilJhcHjIOT8tIbl4m5y7/815CrqICSQ4E3i6GMbvawQDzEFS6F2kCT2kujK7ds9awqbzfsHRPNYPoY/eAP1s25wD2aVEygE9Cb/CsJjmJT99Ifpu3VZ/6AyQCLBJffmAwViRw3RHgztmD2PueG5HyLlizS6TZHV+/AhX+AF9FTotHCX/il1PdDXGor6KwUG3Ox5x14cKDV8NCXF16DlOURsWYCtdyOckqbv831AZcTNsizpTcoEGzeEmUBryThDHEyick0ElqggSwIjl8PzhpMMgVhkVSVDMLzPUyVw25f6Zz0zn6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(39860400002)(366004)(396003)(136003)(451199021)(186003)(36756003)(2906002)(26005)(31696002)(53546011)(6512007)(83380400001)(38100700002)(86362001)(6506007)(82960400001)(2616005)(8676002)(478600001)(8936002)(66476007)(66556008)(41300700001)(66946007)(6666004)(316002)(6486002)(5660300002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TStSU1RBbHFodnBzV3N6eFhOZERWK01sYndPYzcwS1liKy9uWm1CeGxWT0FP?=
 =?utf-8?B?VTBqbkgvUzJPWDZQb1BNcjAwbi9Wc04ycXRaWFUrNzcrS2VOTVhTUjNjZFIz?=
 =?utf-8?B?ZlNzbVVHa1U3dS8xTXkvblhRV3A5TDhLVnhkOFhBV0Y4Q0ZZSCtzSi9zcStz?=
 =?utf-8?B?TENKSU53UnlTSlNLYy9kWURCKzFRZDJYaU54c1I1TXhldmFhQ0tBa1Nsdmto?=
 =?utf-8?B?MEVySldMZWp4NTNZT0xmVm5hMkw5aWJtZXJudUEyZlBla2w5a2FmWUZVTmNu?=
 =?utf-8?B?Uy9zRURvZ0tURzJqMWNlNXF4dWtPZmdURklBQUdaT0lhMXhVV01lL0dhajAv?=
 =?utf-8?B?Q1IvdnZNRDRKZlVqL1p5eG95RUFXZXNYRTlXa1BiajFzODVpZ2NCbFhCSW50?=
 =?utf-8?B?Q3dhVFJkdldyaFk0clRUMjRVM3g3K25TdWxWQWRPL2NxN2cyNUd5dW5ieFMv?=
 =?utf-8?B?aDkzcDgyZ3JtRjdvazhpUFZCY2VZWG44Qm9oUTFDTUk2Qkp3NXMrK2R2dXFj?=
 =?utf-8?B?bWZzRDhabEErNGEvNW1pRlVLazlJQ0k2VlpJTU9kU05Cd2tuTVBoaHhJODZI?=
 =?utf-8?B?eklRSjFnczY3cG94YXZ0QkZTeWVlR2NZbm9scGdhdE1RTUY1ZVBtK0xxazBJ?=
 =?utf-8?B?ODVmV1N1SXAwbGdJYnlFanBMZzBxcE81YXltVWlnbnVnOERiNW1ROHBxdHdl?=
 =?utf-8?B?NmZJSEEvRGlhYmJFdnVMTjJIMzhIWkVWcWt4djNWME9PNU5jM1lTdi9BYzNp?=
 =?utf-8?B?U0pualNqZlZPaDJ3M1E0cjk2by83STA2bEszcXR0UkZFWE1pUlNWSXY0R0Zx?=
 =?utf-8?B?S2ZITk9nRXI5dkUzUzNNS0xqZnFzcFROTVhSMXpSNDBDd3gyVElwdVdqOEdt?=
 =?utf-8?B?djFyZmZkd0JPL0Q1cXl2QWlqeDEzdysrSVI5dU5hVmUyZVZQSy8zSlptQXlq?=
 =?utf-8?B?NlFPYjFFRy8rT1BwMm5SU0lQekhpeFVPdGo4dzlpUGZxbEVVbXcxYUwwSEY5?=
 =?utf-8?B?Z2NrL3M2Q2dMaGQyQy9ZUVV0UUtmbzkzT0ZsUHJUamtHcmg0OHBLVHdEcVpp?=
 =?utf-8?B?QlJNeXMrVmRZUENCcTAyVnVmWXR4d250Z3lyRWI4cmpHVjNzaGVlZzdDOTV2?=
 =?utf-8?B?L0EzU2NhTTR5OG0vTGJ4alFwZWJXMW0vQTNXS2VlNzlVTHRnZi81N0I3MW9J?=
 =?utf-8?B?SVFhUjg4QUVuSk9sYjhYazdhb0lFdFNickVLRWJXM0taQXdxc2ZZcHBZZk8x?=
 =?utf-8?B?YS9oZE5WY2tGeFRnTGR1a2lFbkhyNHFCdnhYTHErTjEydFI4d0thZ0pXL0Na?=
 =?utf-8?B?aUhzWWQ1WEhieE9wanQ4S3lERUNXYVZMV29Ec0cyclB1NVNDc1VVVkM1ZlY4?=
 =?utf-8?B?eDRJUUlJUWduR2VSZHVsRjgwbFRLZkMzejFBeEdvcU5QOE00M0krWE5BdFJC?=
 =?utf-8?B?TmpjNEY1dkdQSkpoOTdxdk1TSGlySis0bnFsOUVQNzVmNHVXeFhCRXRuQnVx?=
 =?utf-8?B?VmFkWmNGa3lCcTlUTHFCWFR1V3FNSzZvdFp3YlVNZ2pDcHN1WEhvS3V0STls?=
 =?utf-8?B?SEhBV21Wd1ZaQ3J1SE5Sazc0dC9FaDVpb0FRb3BDcHRiVmY2dmJVb2FjTGRm?=
 =?utf-8?B?U1JUR2xnckJPbyt3blUyenNwWnpRQWtvUXpvNzJpLzd4TENlNUJjMXBubFlM?=
 =?utf-8?B?WVE4R2lLR0JlTU00czArT1RCWDUzTnVFUVdNajFkVHg1dTVTd1c0MC9ncVBS?=
 =?utf-8?B?T2JnRkJZcnhBRmFMaDBFQ0pvZGJHZXJDWi9RcU43eit4cTdBdkhhWU55MG5j?=
 =?utf-8?B?WCt6WkVELzZ4bHI4TkkzQzlpVGpiT2I5aS8yQ2tBdGlzWEM5bVFHM25NTnlp?=
 =?utf-8?B?ZzdaOEVGaVJpOVN4akxPNU1OcXBBRy9lbGtLSWdTSjE2cUtMVlBYamFNU3Ba?=
 =?utf-8?B?TnpqSktiaTA2d2xlMmljWTBESWU4TXYwNUdhVTdtVUduL2VrT2dZVUErakJJ?=
 =?utf-8?B?SVl4aWZXNnYwc1o3ZTI1MkhtblpHUk5taVhzSTdyRHdjTDN3OUs0TWx4U0Vk?=
 =?utf-8?B?Z0hienFnNHo5VWxIRWpQcnFTQjd3dmlaMmRhVkdva2xmNGJYOTZpOU5ORGxZ?=
 =?utf-8?B?bTUxc0luMW10MndOUmdQamhVZFhJZzZEaE5rVk5wb2phSXJXZm1CK2I1MEpz?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b50a2a4d-166b-45df-ccda-08db52aa6b64
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 05:33:30.6337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LcwuTpOloCBTKMlAjjxFiW72IcsG/a/F2xXH3JFUm5onweVgmNVIfwZiiQF5/ArS9yCQMOb+xa7JlC07axTpXED+1Qx2Wuk6DzaVU82SBTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6289
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 02/26] drm/xe: Introduce xe_tile
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



On 11-05-2023 09:16, Matt Roper wrote:
> Create a new xe_tile structure to begin separating the concept of "tile"
> from "GT."  A tile is effectively a complete GPU, and a GT is just one
> part of that.  On platforms like MTL, there's only a single full GPU
> (tile) which has its IP blocks provided by two GTs.  In contrast, a
> "multi-tile" platform like PVC is basically multiple complete GPUs
> packed behind a single PCI device.
> 
> For now, just create xe_tile as a simple wrapper around xe_gt.  The
> items in xe_gt that are truly tied to the tile rather than the GT will
> be moved in future patches.  Support for multiple GTs per tile (i.e.,
> the MTL standalone media case) will also be re-introduced in a future
> patch.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.h       | 11 +++++---
>  drivers/gpu/drm/xe/xe_device_types.h | 40 +++++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_gt_types.h     | 15 +++++++----
>  drivers/gpu/drm/xe/xe_mmio.c         | 13 ++++-----
>  drivers/gpu/drm/xe/xe_pci.c          |  5 +++-
>  drivers/gpu/drm/xe/xe_vm.c           |  2 +-
>  drivers/gpu/drm/xe/xe_vm_types.h     |  8 +++---
>  7 files changed, 71 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index cbae480a2092..f7acaf51a1fc 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -48,12 +48,17 @@ static inline struct xe_file *to_xe_file(const struct drm_file *file)
>  	return file->driver_priv;
>  }
>  
> +static inline struct xe_tile *xe_device_get_root_tile(struct xe_device *xe)
> +{
> +	return &xe->tiles[0];
> +}
> +
>  static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
>  {
>  	struct xe_gt *gt;
>  
> -	XE_BUG_ON(gt_id > XE_MAX_GT);
> -	gt = xe->gt + gt_id;
> +	XE_BUG_ON(gt_id > XE_MAX_TILES_PER_DEVICE);

why do we expect the number of GTs to be less than tiles
> +	gt = &xe->tiles[gt_id].primary_gt;

some how this doesn't look correct to me, if GT is per tile, using GT_ID
to reference tile might not be right.

also through this routine we always return primary_gt but the GT ID can
correspond to other GTs as well.

please check below.

>  	XE_BUG_ON(gt->info.id != gt_id);
>  	XE_BUG_ON(gt->info.type == XE_GT_TYPE_UNINITIALIZED);
>  
> @@ -65,7 +70,7 @@ static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
>   */
>  static inline struct xe_gt *to_gt(struct xe_device *xe)
>  {
> -	return xe->gt;
> +	return &xe_device_get_root_tile(xe)->primary_gt;
>  }
>  
>  static inline bool xe_device_guc_submission_enabled(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 6490a04614ce..5dcf1695925f 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -34,7 +34,7 @@
>  
>  #define XE_GT0		0
>  #define XE_GT1		1
> -#define XE_MAX_GT	(XE_GT1 + 1)
> +#define XE_MAX_TILES_PER_DEVICE	(XE_GT1 + 1)
>  
>  #define XE_MAX_ASID	(BIT(20))
>  
> @@ -48,6 +48,40 @@
>  	 (_xe)->info.step.graphics >= (min_step) &&			\
>  	 (_xe)->info.step.graphics < (max_step))
>  
> +#define tile_to_xe(tile__)								\
> +	_Generic(tile__,								\
> +		 const struct xe_tile *: (const struct xe_device *)((tile__)->xe),	\
> +		 struct xe_tile *: (tile__)->xe)
> +
> +/**
> + * struct xe_tile - hardware tile structure
> + *
> + * From a driver perspective, a "tile" is effectively a complete GPU, containing
> + * an SGunit, 1-2 GTs, and (for discrete platforms) VRAM.
> + *
> + * Multi-tile platforms effectively bundle multiple GPUs behind a single PCI
> + * device and designate one "root" tile as being responsible for external PCI
> + * communication.  PCI BAR0 exposes the GGTT and MMIO register space for each
> + * tile in a stacked layout, and PCI BAR2 exposes the local memory associated
> + * with each tile similarly.  Device-wide interrupts can be enabled/disabled
> + * at the root tile, and the MSTR_TILE_INTR register will report which tiles
> + * have interrupts that need servicing.
> + */
> +struct xe_tile {
> +	/** @xe: Backpointer to tile's PCI device */
> +	struct xe_device *xe;
> +
> +	/** @id: ID of the tile */
> +	u8 id;
> +
> +	/**
> +	 * @primary_gt: Primary GT
> +	 */
> +	struct xe_gt primary_gt;
> +
> +	/* TODO: Add media GT here */
> +};
> +
>  /**
>   * struct xe_device - Top level struct of XE device
>   */
> @@ -248,8 +282,8 @@ struct xe_device {
>  	/** @ordered_wq: used to serialize compute mode resume */
>  	struct workqueue_struct *ordered_wq;
>  
> -	/** @gt: graphics tile */
> -	struct xe_gt gt[XE_MAX_GT];
> +	/** @tiles: device tiles */
> +	struct xe_tile tiles[XE_MAX_TILES_PER_DEVICE];
>  
>  	/**
>  	 * @mem_access: keep track of memory access in the device, possibly
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 7c47d67aa8be..e0ed4508269b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -77,12 +77,17 @@ enum xe_steering_type {
>  };
>  
>  /**
> - * struct xe_gt - Top level struct of a graphics tile
> + * struct xe_gt - A "Graphics Technology" unit of the GPU
>   *
> - * A graphics tile may be a physical split (duplicate pieces of silicon,
> - * different GGTT + VRAM) or a virtual split (shared GGTT + VRAM). Either way
> - * this structure encapsulates of everything a GT is (MMIO, VRAM, memory
> - * management, microcontrols, and a hardware set of engines).
> + * A GT ("Graphics Technology") is the subset of a GPU primarily responsible
> + * for implementing the graphics and/or media IP.  It encapsulates the hardware
> + * engines, programmable execution units, and GuC.   Each GT has its own
> + * handling of power management (RC6+forcewake) and multicast register
> + * steering.
> + *
> + * A GPU/tile may have a single GT that supplies all graphics and media
> + * functionality, or the graphics and media may be split into separate GTs
> + * within a tile.
>   */
>  struct xe_gt {
>  	/** @xe: backpointer to XE device */
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 4804616a3c44..254b4a63d901 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -399,6 +399,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
>  		  struct drm_file *file)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_gt *gt = xe_device_get_gt(xe, 0);
>  	struct drm_xe_mmio *args = data;
>  	unsigned int bits_flag, bytes;
>  	struct xe_reg reg;
> @@ -440,7 +441,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
>  	 */
>  	reg = XE_REG(args->addr);
>  
> -	xe_force_wake_get(gt_to_fw(&xe->gt[0]), XE_FORCEWAKE_ALL);
> +	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  
>  	if (args->flags & DRM_XE_MMIO_WRITE) {
>  		switch (bits_flag) {
> @@ -449,10 +450,10 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
>  				ret = -EINVAL;
>  				goto exit;
>  			}
> -			xe_mmio_write32(to_gt(xe), reg, args->value);
> +			xe_mmio_write32(gt, reg, args->value);
>  			break;
>  		case DRM_XE_MMIO_64BIT:
> -			xe_mmio_write64(to_gt(xe), reg, args->value);
> +			xe_mmio_write64(gt, reg, args->value);
>  			break;
>  		default:
>  			drm_dbg(&xe->drm, "Invalid MMIO bit size");
> @@ -467,10 +468,10 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
>  	if (args->flags & DRM_XE_MMIO_READ) {
>  		switch (bits_flag) {
>  		case DRM_XE_MMIO_32BIT:
> -			args->value = xe_mmio_read32(to_gt(xe), reg);
> +			args->value = xe_mmio_read32(gt, reg);
>  			break;
>  		case DRM_XE_MMIO_64BIT:
> -			args->value = xe_mmio_read64(to_gt(xe), reg);
> +			args->value = xe_mmio_read64(gt, reg);
>  			break;
>  		default:
>  			drm_dbg(&xe->drm, "Invalid MMIO bit size");
> @@ -482,7 +483,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
>  	}
>  
>  exit:
> -	xe_force_wake_put(gt_to_fw(&xe->gt[0]), XE_FORCEWAKE_ALL);
> +	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index bf2c234c4f6e..e79b16d8bf7f 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -525,7 +525,10 @@ static int xe_info_init(struct xe_device *xe,
>  	xe->info.step = xe_step_get(xe);
>  
>  	for (id = 0; id < xe->info.tile_count; ++id) {
> -		gt = xe->gt + id;
> +		xe->tiles[id].xe = xe;
> +		xe->tiles[id].id = id;
> +
> +		gt = &xe->tiles[id].primary_gt;
>  		gt->info.id = id;

since GT is per tile, shouldn't it's numbering also start from 0

Thanks,
Aravind.
>  		gt->xe = xe;
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 0a4becdf4675..fe6abb6ed6ca 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3347,7 +3347,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>  	struct xe_device *xe = vma->vm->xe;
>  	struct xe_gt *gt;
>  	u32 gt_needs_invalidate = 0;
> -	int seqno[XE_MAX_GT];
> +	int seqno[XE_MAX_TILES_PER_DEVICE];
>  	u8 id;
>  	int ret;
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index fada7896867f..203ba9d946b8 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -159,7 +159,7 @@ struct xe_vm {
>  	struct kref refcount;
>  
>  	/* engine used for (un)binding vma's */
> -	struct xe_engine *eng[XE_MAX_GT];
> +	struct xe_engine *eng[XE_MAX_TILES_PER_DEVICE];
>  
>  	/** Protects @rebind_list and the page-table structures */
>  	struct dma_resv resv;
> @@ -167,9 +167,9 @@ struct xe_vm {
>  	u64 size;
>  	struct rb_root vmas;
>  
> -	struct xe_pt *pt_root[XE_MAX_GT];
> -	struct xe_bo *scratch_bo[XE_MAX_GT];
> -	struct xe_pt *scratch_pt[XE_MAX_GT][XE_VM_MAX_LEVEL];
> +	struct xe_pt *pt_root[XE_MAX_TILES_PER_DEVICE];
> +	struct xe_bo *scratch_bo[XE_MAX_TILES_PER_DEVICE];
> +	struct xe_pt *scratch_pt[XE_MAX_TILES_PER_DEVICE][XE_VM_MAX_LEVEL];
>  
>  	/** @flags: flags for this VM, statically setup a creation time */
>  #define XE_VM_FLAGS_64K			BIT(0)

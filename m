Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5669C54E76
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 23:51:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A1510E06C;
	Thu, 16 Nov 2023 23:51:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E2910E06C
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 23:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700178716; x=1731714716;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=S+dJovNR8Y5G2c5p319qr6s7axX3tBDxqUqol04N+Ks=;
 b=i+U/sYzqcwcsjzHQ0fNeHTWAFU5UZNsyRCMEgjkjHhwoTClUoYdZkLd9
 aZuCIZPundF/SQBBJ339VAhRO2tiz6LycVE6L8tNVrfkcNn+OL5EU32jf
 Dvj0P+lHDgIkZapegiFSAddnjLqJbKO64M8LgTu6R/TcIFlr9DfcjAQiT
 oiOkCfu8UcMnGq7REjl883ymU2zRcpMDZxHGjjGksKkg3ogS7gD8diLWp
 +JpGYnnU32Z6efnM0hdB0SI9f3OmBblPYF41LtCevxZluscRHQlVN0zzp
 CnjIJbeo9JnCuA6cyMhxsUKCIrJlKeFs7kDVqV6UkzVia6HO2mXqRtnGJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="477424551"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="477424551"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 15:51:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="856164550"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="856164550"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 15:51:54 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 15:51:54 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 15:51:54 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 15:51:54 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 15:51:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VoFMaJdZs1qVJ0UIsqyfFgpb3iR9YrVMkIJi28i6zIf4OMzbLgWZIgDHk48bTTw1f5Cw+3waIGRiXZDgArVAxVi6kr0cqNzoXPSYtg4DgsQaIkkImlIhOswikGh94d3zzHrsrw6X+7vWGvpJBW7iLNkzXSgiTwZi61YPpQoU1GcvaB6VPpOxLC4cq6zN4iGGX9Kg5o3qY1ZB+y71dyllssWhjWJJc3R5MIGREDx4+m4sx19H82kTkuIVZtVaadtdMFAS1ESI/CCVBl4Yv1cjn1tOCaYvqj/EeeogMh1wElbnMTVZZxR6945BudY2/qzPZGzzYKZUOvRzRnq8vHsxIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPzNSyKfsQr/jbAEENgYSpcR9Nl/n7lspv7LzRRWzjQ=;
 b=Bet9g6B/w8twVaVZQVam8aT+G/qeF6e+/XGSV+l+M7sVmY7+siKAEt/wGujX6OJDrlQHTuwEpKS9pOSoMhTypJr8GOMnuF1DEoZ7z5g7GT0s4zuTr6EoLmNhDg9sRHFce+iYupsDRoDdqnHG4tzPtrU3WYTtlHi0HX+H56ILk7YDjMd/bxxK9UMIWONHXWJyCb67tGGtcNDBg53BbfaUgQ6uguRQRHl+QCDeczGn34Jyaa8dK/nM5bQ5DFGSl30sjfLEGkyAx9Au4B/P1MfGywCq6hS/+aY9TwEg7hU8adQyaLnT/ZMIfkcuVMJNqXsvvk+20FP4TNdCmZ3k2KHLjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CH3PR11MB7370.namprd11.prod.outlook.com (2603:10b6:610:14e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20; Thu, 16 Nov
 2023 23:51:46 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54%4]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 23:51:46 +0000
Message-ID: <6a30839b-4941-4973-8d9f-2fd5bec346f8@intel.com>
Date: Thu, 16 Nov 2023 15:51:34 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231115004615.2424177-1-daniele.ceraolospurio@intel.com>
 <20231115004615.2424177-7-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20231115004615.2424177-7-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR16CA0049.namprd16.prod.outlook.com
 (2603:10b6:907:1::26) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CH3PR11MB7370:EE_
X-MS-Office365-Filtering-Correlation-Id: a4635857-5393-462f-767b-08dbe6fefe53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fno/Cu6075Gku1O0QZeDRJCpRLNWdBMA3B67BbebIdFPna1RKPSZQaMoc+j4hG7ZJty1ryD2AtFHa7R5kZBFhtCHfDxfvOa1tZZIPmLxEP1IZ+d1BZyrlIE38mTft15AkBj1ynZR6a0JLJFU4c3j3RoJsydWZRYsbB+qeJzOSetgw5n3iVYs9EJDkSniK6GTXC87a3iQ2QFE+7+3oAIH6PO+MhT70vEK1bNcZtTVaMqQg168VLcrGCA4SLX0wjxRileoz4XcbmRPLSLaxq+BKmgy8NB8ZxXAI7dxVIXj5mr65mUf95yJgDil1VrLReGcotJs/vhQNAtDg2NgxD3S745IzroBDMs7t+Uq01yIr+Dnu0OPOhskvBR1ZN2+HruB16D2+sp5NVmVQ3BG49YOR/sR747wXcYaumwz4MLi9NfwTgrbm/HuxUf56XgEgVA89dPivlXAQ4IlDuGHJzYfpLNbSLgSGwTaFDCQKtmcbViPluXzJ0KyqL+L+TsMm2oa4GtCfwNF6ZyVY2+myAUQko8FD5DknH/l7d9mfXnEDGbzz4CEIf6loQAMOpL3s0BpJxitjvWK8t/uiGk3+1523xFvjIEbLwMBgMsJwzlZW06VThUnxXJ9RlnQQTjqYQ4jTZbqBYMXkdvwr1mPqhuFYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(376002)(366004)(346002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(8936002)(31686004)(66946007)(66556008)(2616005)(2906002)(8676002)(41300700001)(5660300002)(82960400001)(316002)(66476007)(38100700002)(478600001)(83380400001)(6486002)(36756003)(6512007)(26005)(6506007)(6666004)(31696002)(86362001)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RyszWjlJczFXWmp6U044ajNoUlNtNVFRUm4vaU1ndzZrOEhTdzlnQmdhc0cz?=
 =?utf-8?B?Zm1pbXptL3lsL3p1WXg2Z3lTd2tsc0RwUnZhRWdEVGNuYWNYSkFyK0ZOcVFX?=
 =?utf-8?B?RGZwUm5GOElZNWR4QllSaUNwOUptZXhrTDBiKytuOHhuQ0xyQTZCZjZvS055?=
 =?utf-8?B?bzhUb2laSG56R1dBeTdpa0VndkJRcEh0d25ES1BRUktnckFIbXZsckh3M1R6?=
 =?utf-8?B?aHovQXpwNmpiT0NXVS9QWUh1b1VwRjFFcVlwZGxDeCt6V3dnZStVR1p5SzNj?=
 =?utf-8?B?SnI4bUdrcllKU3BGT1luUTRNYS8rT0JoU1VlQnRCVnovZzA1UTRmVGJDVE1z?=
 =?utf-8?B?VFJqL0JZMzFQb1I4UmdPakFaMjY2c1lsdWo4QW1tSERVOUt2dkR2MEFtSXlk?=
 =?utf-8?B?aWpnYjZsaUprTEtMYzZlQVlnQTJoZ0xGUVJsMkVZWmJ1eXVSblBNTVdJZSsv?=
 =?utf-8?B?a0hndERBZTBiSU5YOVhvTjN3OXdRS05JK2ZENmczUlNvVUp6eFExdGdpSFoy?=
 =?utf-8?B?amEzRXp6NVFIUHhVa1RuL1hCM3JSZHUxQVVWQXRUTW1wazdxcjZtOUhLVzly?=
 =?utf-8?B?aUZEUHVTaEVpU0ZoK2VlUEo5M3JXSTlNZ3EvZ09aZHIwcW9CWkV1MkliK2RH?=
 =?utf-8?B?RlEyczZnYkZBVWd0Zk1JQmtXbU5QcXUwTFl6WUUxZTFsRmYvbjdCbnNzZ1Y2?=
 =?utf-8?B?OVhDRG5sRGlSM2gxWWtzTlJYK3lMU2hKU1ZrbWFiZmZYNm85Y0M0aXpHdEZR?=
 =?utf-8?B?eEorSWVZK1l6QlVpSFNiWXJWemRpT3JiOEdZNkVRRTY5cWZCOUVTbm44UTlV?=
 =?utf-8?B?Q0tVbVJ0NzVXMGc2Tjl6M0xSdlc1a3ZVRS91Y2h6cjIvNEZCTG5GbUNZaXlH?=
 =?utf-8?B?NnBmaXRmZEVwSUxTMC9yaUVoKzk1TTZRN1dkMU5RY2RnWGM5NUJEb3d3Wlpx?=
 =?utf-8?B?Zk5FT3hrUGF1bDBOWThPYjZBM3IrUXAwSEh4aEdwNmQxbmFWb09CVENaTEhC?=
 =?utf-8?B?dHpEZ0NkbG1MOXFCdmdwczlES1N4M3FjSFZ3a1NkeHdMTGRTVWFQYklxbWFH?=
 =?utf-8?B?c09ZRExKWmNuMThLT2FBWm94YWxPTVJHVUtEYzR4NWpIZEZueXJIYTU0NHgz?=
 =?utf-8?B?N1ZodGYyUmlCNFRWZC9xWFU2VjN1NDA3ZUVDQTdIM2NUVHpYclg2WTd5KzZw?=
 =?utf-8?B?aENERDFPV2wwVTV4NXVXRkc4czczMXR1aHVpWmpVMk5tZkpQZyt1ZlpxVy84?=
 =?utf-8?B?cHM0enJ3aDlQaUlLYVY4NnJsU0JGam5jZjV3bENzSlBuaUNOU1hwUXY2WHFY?=
 =?utf-8?B?dmR5b3hleGM0SmlsK3NETzNvemxhM3ovcGFQOTRsSmViU3I3RlE1Q2J1THBL?=
 =?utf-8?B?RmUxNnhreUZyV3dUNWdtVWhIZElEOXQwdHVNODIrTlpFZS9IMXdqZFFCcFcz?=
 =?utf-8?B?alJPYjBYZ0Y4V2RkZEpCeFlsKzh2bFlKanpUdmI2cjNVZHREeWhJUU5vWFl3?=
 =?utf-8?B?NnVQd1lVeFN3V1FaY1pxL0d1TTlRTzZaMFRYalVXVzY0bnJ5SGRyRUpNN0NP?=
 =?utf-8?B?T0lhdDJuOElnamFmUkFBdkF5KytlMFJPbEs1c0JrUkJXeEtyN0VZNUR1cHU1?=
 =?utf-8?B?NDkrQ0UzdkcrRS9LbkZveC9vSDNHcWw4WUJoOXVONzNUNDF3Rzh4aS9UQmpp?=
 =?utf-8?B?eGhUMVUzTjBHWXpRNTE0aVBJSGhVTlpIV1NQMllYaE43c1grdVE4U1N4SjN2?=
 =?utf-8?B?bkhJa3IrNitQenFWditBNlJLRDhacHhMNXRUWnRONG9VS2pGWDJmRVk0WXFP?=
 =?utf-8?B?YUpnT0p1V0ZPbzRyeTFFVHZ3dk1IbWJWOTlZaTY2ZkpnUHN0YkdmelNLTkVH?=
 =?utf-8?B?NUZjRGsyb0RjdGdrdyt5Z29XbUZFeDBUNmwxVWoyM3g5QUNMc0dPWXYzRHpE?=
 =?utf-8?B?T3lGbVg3SVBWM3pDNG1aUmJEOW85YjZOVXV0MVU1eUtsZ1RPUGRVTWN2U2dE?=
 =?utf-8?B?MmNVTnd0Z1RSNGtOcTlwTURwbUFjWE1BQk1kSEY1dWprRnFvbHMrRmhrMVE2?=
 =?utf-8?B?WFhjemtEM08zU3JKNHlJR0lQbThyRE96U1YrUXNPN2VDZnl3Y1NTSFRCTjlh?=
 =?utf-8?B?cWFQd3JJQXVGQ3ZnY1AwZC9FV2ZsL05MTjExMmhrMzhRTGlIbklSYSt0N2R0?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4635857-5393-462f-767b-08dbe6fefe53
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 23:51:46.7788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vq2eju0O+8wFo/rtASpNgfcLdyZUM9CeNI48yV4sWfgmC4ZWBSGp4v0FBC1e1QbU8D6f2GkaywdqVUWSYoYF52L64nhVIyXjX2RtmyTD+3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7370
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 06/11] drm/xe/gsc: Implement WA 14015076503
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

On 11/14/2023 16:46, Daniele Ceraolo Spurio wrote:
> When the GSC FW is loaded, we need to inform it when a GSCCS reset is
> coming and then wait 200ms for it to get ready to process the reset.
>
> v2: move WA code to GSC file, use variable in Makefile (John)
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/Makefile           | 11 +++++++++-
>   drivers/gpu/drm/xe/regs/xe_gsc_regs.h | 10 +++++++++
>   drivers/gpu/drm/xe/xe_gsc.c           | 29 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gsc.h           |  4 ++++
>   drivers/gpu/drm/xe/xe_gt.c            |  5 +++++
>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
>   6 files changed, 59 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 1ea6e0679528..b98b2d76a324 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -37,7 +37,16 @@ quiet_cmd_wa_oob = GEN     $(notdir $(generated_oob))
>   $(generated_oob) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
>   	$(call cmd,wa_oob)
>   
> -$(obj)/xe_guc.o $(obj)/xe_migrate.o $(obj)/xe_ring_ops.o $(obj)/xe_vm.o $(obj)/xe_wa.o $(obj)/xe_ttm_stolen_mgr.o: $(generated_oob)
> +uses_generated_oob := \
> +	$(obj)/xe_gsc.o \
> +	$(obj)/xe_guc.o \
> +	$(obj)/xe_migrate.o \
> +	$(obj)/xe_ring_ops.o \
> +	$(obj)/xe_vm.o \
> +	$(obj)/xe_wa.o \
> +	$(obj)/xe_ttm_stolen_mgr.o
> +
> +$(uses_generated_oob): $(generated_oob)
>   
>   # Please keep these build lists sorted!
>   
> diff --git a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
> index 22d2ad9cb64d..9a84b55d66ee 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
> @@ -16,6 +16,13 @@
>   #define MTL_GSC_HECI1_BASE	0x00116000
>   #define MTL_GSC_HECI2_BASE	0x00117000
>   
> +#define HECI_H_CSR(base)	XE_REG((base) + 0x4)
> +#define   HECI_H_CSR_IE		REG_BIT(0)
> +#define   HECI_H_CSR_IS		REG_BIT(1)
> +#define   HECI_H_CSR_IG		REG_BIT(2)
> +#define   HECI_H_CSR_RDY	REG_BIT(3)
> +#define   HECI_H_CSR_RST	REG_BIT(4)
> +
>   /*
>    * The FWSTS register values are FW defined and can be different between
>    * HECI1 and HECI2
> @@ -26,4 +33,7 @@
>   #define   HECI1_FWSTS1_PROXY_STATE_NORMAL		5
>   #define   HECI1_FWSTS1_INIT_COMPLETE			REG_BIT(9)
>   
> +#define HECI_H_GS1(base)	XE_REG((base) + 0xc4c)
> +#define   HECI_H_GS1_ER_PREP	REG_BIT(0)
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index cc9c6cdc31aa..0def7c1ae84d 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -7,6 +7,7 @@
>   
>   #include <drm/drm_managed.h>
>   
> +#include "generated/xe_wa_oob.h"
>   #include "xe_bb.h"
>   #include "xe_bo.h"
>   #include "xe_device.h"
> @@ -17,6 +18,7 @@
>   #include "xe_mmio.h"
>   #include "xe_sched_job.h"
>   #include "xe_uc_fw.h"
> +#include "xe_wa.h"
>   #include "instructions/xe_gsc_commands.h"
>   #include "regs/xe_gsc_regs.h"
>   
> @@ -300,3 +302,30 @@ void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc)
>   	if (xe_uc_fw_is_loadable(&gsc->fw) && gsc->wq)
>   		flush_work(&gsc->work);
>   }
> +
> +/*
> + * wa_14015076503: if the GSC FW is loaded, we need to alert it before doing a
> + * GSC engine reset by writing a notification bit in the GS1 register and then
> + * triggering an interrupt to GSC; from the interrupt it will take up to 200ms
> + * for the FW to get prepare for the reset, so we need to wait for that amount
> + * of time.
> + * After the reset is complete we need to then clear the GS1 register.
> + */
> +void xe_gsc_wa_14015076503(struct xe_gt *gt, bool prep)
> +{
> +	u32 gs1_set = prep ? HECI_H_GS1_ER_PREP : 0;
> +	u32 gs1_clr = prep ? 0 : HECI_H_GS1_ER_PREP;
> +
> +	/* WA only applies if the GSC is loaded */
> +	if (!XE_WA(gt, 14015076503) || !gsc_fw_is_loaded(gt))
> +		return;
> +
> +	xe_mmio_rmw32(gt, HECI_H_GS1(MTL_GSC_HECI2_BASE), gs1_clr, gs1_set);
> +
> +	if (prep) {
> +		/* make sure the reset bit is clear when writing the CSR reg */
> +		xe_mmio_rmw32(gt, HECI_H_CSR(MTL_GSC_HECI2_BASE),
> +			      HECI_H_CSR_RST, HECI_H_CSR_IG);
> +		msleep(200);
> +	}
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gsc.h b/drivers/gpu/drm/xe/xe_gsc.h
> index f870eddc77d4..bc1ef7f31ea2 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.h
> +++ b/drivers/gpu/drm/xe/xe_gsc.h
> @@ -8,9 +8,13 @@
>   
>   #include "xe_gsc_types.h"
>   
> +struct xe_gt;
> +
>   int xe_gsc_init(struct xe_gsc *gsc);
>   int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc);
>   void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc);
>   void xe_gsc_load_start(struct xe_gsc *gsc);
>   
> +void xe_gsc_wa_14015076503(struct xe_gt *gt, bool prep);
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 6c885dde5d59..e591e9c72604 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -21,6 +21,7 @@
>   #include "xe_execlist.h"
>   #include "xe_force_wake.h"
>   #include "xe_ggtt.h"
> +#include "xe_gsc.h"
>   #include "xe_gt_clock.h"
>   #include "xe_gt_idle_sysfs.h"
>   #include "xe_gt_mcr.h"
> @@ -512,12 +513,16 @@ static int do_gt_reset(struct xe_gt *gt)
>   {
>   	int err;
>   
> +	xe_gsc_wa_14015076503(gt, true);
> +
>   	xe_mmio_write32(gt, GDRST, GRDOM_FULL);
>   	err = xe_mmio_wait32(gt, GDRST, GRDOM_FULL, 0, 5000, NULL, false);
>   	if (err)
>   		xe_gt_err(gt, "failed to clear GEN11_GRDOM_FULL (%pe)\n",
>   			  ERR_PTR(err));
>   
> +	xe_gsc_wa_14015076503(gt, false);
> +
>   	return err;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 752842d734be..c7b7d40b5d57 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -20,3 +20,4 @@
>   16017236439	PLATFORM(PVC)
>   22010954014	PLATFORM(DG2)
>   14019821291	MEDIA_VERSION_RANGE(1300, 2000)
> +14015076503	MEDIA_VERSION(1300)


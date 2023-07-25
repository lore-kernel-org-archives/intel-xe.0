Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741E9C001DF
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 17:14:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4290F10E3E8;
	Tue, 25 Jul 2023 17:14:08 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D87B10E3E8
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 17:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690305246; x=1721841246;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6RwedLd/y/jstiuxmThfSPz+Np3qYU+AX6UpNfrVXtU=;
 b=lqsGXt3ptjW0bjf86E4TLWSqYK7h9/Smq0XVQTB9UHCN79TlT1uOC7u4
 P0Je/OWAVmu4NHJ7cVVWs3Pes8+6M9Tx8icAW41x3hi+ugmq/rq2WW1wo
 e2kEQ8Q22JZ+Atg1sB3NRCLAZMdJmtR/zkLUDhX56+Ekok8PQ+zYPBuDK
 KlwlxC76ZSlRbsYdIU3YtJZzVARfMKv/K0mhQBQTHrd6kaZhhGMOMmhcO
 oRpehP42zFHJP9Zi3e/aUbp8bz6Huxqhyt/BTkI5vEB4KVNcaYk/heI/5
 UPmyZdlZvuPmTW7TlbOWB+GeQUeNzyiSHsDyo+igXyYuG8QRePE/I0dvt A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="347401793"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="347401793"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 10:14:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="796214944"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="796214944"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 25 Jul 2023 10:14:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 10:14:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 10:14:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 10:14:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YFf/k3iiei7+kfEQgdM18Jpf78gbkzCBIVO9diIchPz28fjC87FFqnjSMYOYjP0xyUPLklLoiq2pWyLTxtDHF+Gax4C/7GIZBOb0kn3Q1mRPAYp2TUG4zTyaWB7kYR7y6V12LDOM43/lK1UcZEKMWgUpQDfGdJjlnxCXi+GJz3pLYXBxLc5vlShkI+AiiqiYhVp6dEyyxt3hNaUyWHSgNE4rIuNriNk9ZOaiYyBpTDxtltx8rLdGxhXCkfmxONdA6NSskgaJ3al3+MLiD+7kBVcQ5caOT4OjPcDaQGbngRjJy3gLYajZBmNZNIHnmSnqngB5vcEO7zoOvM66Fj0hjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ayGpGG0cdmAJ7aAq37HQ62D0ySH5vsGZbyPQIi/6HlM=;
 b=h89cT4qMcbxmFU2snIqyZ4Yw4x5xeh+LbNmXFW1PCtE2ym/VC6U5mMmQdO6OT3didGOd6gHWvpAzqqYlzCi4X1w0o3yxi8cqoJdXEbT0WFsLMlLRRRHB+OdWMfy6ZOCImHlidHupDD8eKunyrdaJBlBgquWpuQ0doR9hxLf5V8wQyB+FbpcbQE4sXcryfFSfltk+UY4Mp2h/67hCAC8boOzj41EQLtwm7kRd0zwEl1b0w+JRFVd467IdORK9oQMjJT1diSuNePPqnLULTHc3756+LfalectN3yZaTEYR4lY1D1SiKMSwuOrc0ltwyugq3VJVq57b4FK3oEeEahKdwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CY8PR11MB6940.namprd11.prod.outlook.com (2603:10b6:930:58::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 17:14:03 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d218:3a45:e9ae:f699]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d218:3a45:e9ae:f699%4]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 17:14:03 +0000
Message-ID: <d1203c4d-ecef-30de-daf2-b957fcf66b9e@intel.com>
Date: Tue, 25 Jul 2023 10:14:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230725164344.3797085-1-lucas.demarchi@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230725164344.3797085-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0073.namprd03.prod.outlook.com
 (2603:10b6:a03:331::18) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CY8PR11MB6940:EE_
X-MS-Office365-Filtering-Correlation-Id: 655bef29-3081-4f4e-709d-08db8d328b7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QbA5N61uQ1d7nwkOfXbtv/S661fjDEAVmb9Q0D+Lj7tc5/j8cIsxMbbg+uL4NO4DM75QBo3+W+vvXIs3n0DivnenYppKV8dDZp57I4NaqdgakHhhOBXdEGmsC+++bbhnGIgYIE23Nz7w6yWJ50pFBoOPwkD6Pp5nE5Qa9scCOMkHUmgcpkEtp5d/n9Gv3xQXdd1sSpoKshlzVLZmOmckuEoPT5HriL5a1dVXuFUwAKeEz+bPf76ITFe1fvTKHmOOwfq52gqDoKmMKSKM9+fE0/ndZ9Yht0ic9VfhafVTLXZ77/fu0UDPLOrKTwgyjJCaRER7xrlEratLMHIkL2qZH+SpyYdiSMdmg9CI64T6zlvjLZtJmYAxJs+mCkR2A5PYOJe5Jd2K99Dkde1v6EySGkNzzNsbO//zCHeS9pvOQOjZk/WRHp+hIFpzWvbMWcq5Oy/lgxD81jaAN8xQs4KwmLjvONldZIfMtZwvtqI1rKm7kIZLEcjooVoKhRSIgIIgfraHAtbnTCwxYSu9YUWiwqGoRdVEwGbCuGuMIyBDXfjSA82niJjo7aHeGWikWSa1amTabaf+ahaex17v+MHFu5Zmxt8ZaM0olTOE6BqrvG+3G+UXeXNrRhxBpLEYPH2mwMu9q1HPOPoXQLuvCPQrNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(366004)(39860400002)(396003)(376002)(451199021)(53546011)(107886003)(38100700002)(82960400001)(186003)(6506007)(83380400001)(2616005)(26005)(36756003)(2906002)(5660300002)(41300700001)(8936002)(8676002)(31696002)(86362001)(478600001)(6486002)(6512007)(66556008)(66476007)(66946007)(316002)(4326008)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEpvY2RJSkVzQmNybFJyelhOUjlscTVmVjNKT045RVRCSW5xM0VSbFZ6TkhQ?=
 =?utf-8?B?a01kVS9zcDVGMkZ1UldnSnJ2eDNoMUFKTU1nZmVrZjVnNlN2SjZKcURyeGVV?=
 =?utf-8?B?S2szcVRZUUJNLzFkTmw5RC9PYmdJV2swUExLUWxsbXFvNjIvTmlyTHk0SEcw?=
 =?utf-8?B?a3hXYzdoVHZ1endHTWxGRFJHVnBVL3ZiNTYwZGluZ2dRemlrVWkvd2p0RFEz?=
 =?utf-8?B?ZjI4bnBJa2RNaXZsN20wZ2ZCS2RKcHdEY0o2WXpXekp2YzRBSk9KZk5xOFV2?=
 =?utf-8?B?WGVLSGlEMW1GN0E1dDNUV1NudmlwanFVUTVoZW44dlpvRURZWTJ2M0xQZVlv?=
 =?utf-8?B?ZjJld2FCU2dacmhRTlVGUW9hNHNrT096STdNcXNsNVFhdlhhazREbzhqSGpJ?=
 =?utf-8?B?cnRIZTZCaWJXWVRkWVhVeDd3bDNRcU03bjc5OU0vSVZHUTEwanhWUlJPL2lo?=
 =?utf-8?B?QVdhNkZhTjF0YzBzNFBiWWQxRml3cDhnVy9aU3FZYWIyRW9YVGZFdGRaaWVr?=
 =?utf-8?B?V2psb2plNG1kVVVhMnZuL3VBSGxKTit0VG5tWnRqbThNZHE4czdDQlFBVnlN?=
 =?utf-8?B?M2VTcW9Ha3hRV29jTjVWR1NjcjN0Y21yYktvZUdMbDFOZUR2Y1NBL2Q3QklO?=
 =?utf-8?B?aWhjbHhNdUwwWGdGRGlRK0JsZnVXVzZud3NFYU1uZFdNRE5uNW1JK3BQYkVE?=
 =?utf-8?B?S0hWZmNPUmJrTHdmMmZueDZVd0ZHZzFXMTJ0czI5Tjl5dkpiaFF1a3FDZHRN?=
 =?utf-8?B?U2EzRlNTQUxhRnVuVFoybnh2VEZCdmU1ZDVqMmtUWVNQTWJoSUZvMTloek1u?=
 =?utf-8?B?YlZyUmt3czNnRzZUUGNwYmEyZGFBSjlucVhXVjltZThDcEU4YXJjQ0l4WTJM?=
 =?utf-8?B?MjFpa25yek9aWXZ3bXhtVkh2b3MrbUtFbnY2MmdweUh4NFlSa2x6WHJPMnRU?=
 =?utf-8?B?RXY2OU02aWlvbUpMUm92c1NUZDlpbkNPcDNrSENvZnRKOVh3Sk5seUVCZ1JH?=
 =?utf-8?B?OE5CSEVWeHQ1clBYWjhhRUNra2FkQTFTaVFobSswYzlkb0tra0VZZitDNXEz?=
 =?utf-8?B?WENZUkxHQ21oNHFjT3drV09DTWpNMTdCYkN2QlVjTGJjMUpKNTg4alNzb20w?=
 =?utf-8?B?SmJSNnpvOUNWNkZ1aDlXNkZsZE1MeUpwZ0VPV0dvb3hYT0dJZG9vOW1kbTgw?=
 =?utf-8?B?MFk4ekNwMVZFQkFtL20xUk1qdkN2WHJnOW1aQ1BjdHY4Y0hMZmdhZ2lVYzlP?=
 =?utf-8?B?RE0rWUhJVzFnbmlDd240NFUrZFFJSGFHOENqYUpHNHhCQkNjOHQzdlhGTlVU?=
 =?utf-8?B?Zi8vQ1VjdnFDWjE0elUwUnZvRHdqNzhUQStQOWdFYllwOXFDTURkR2ZUbGJX?=
 =?utf-8?B?c1p2OEFsdmZoNWtHTUl5ZXpvRkx3V1BoTkM0SmRHMGpsZ3VOcFhPUEM0L042?=
 =?utf-8?B?VjE1SVM2cGVJVmNibUs4VGZCSFRxRlE1bXJyeER4ZW1NNTNETE43L0hyemI5?=
 =?utf-8?B?UmxLUjdvYXFPZ1IzczRUTmcrdFBUd09SbERGRTdqRFltL0FtRXBWbllFckY3?=
 =?utf-8?B?aEpoR3dnWVlzNHdldjBKMzRVd1Evc252TUlmeG5Ca1h2OUZoMDd4eUQrRVZF?=
 =?utf-8?B?MDZOK0dhbnpTZ0hvdWVhWGttQjVhemtNOXl3N09nbDExUExxT3JVL1dHQmtP?=
 =?utf-8?B?bExnMDNpRG04S0hueVVuSVBuZ0lZUUF2eE45R3dsQkhUNC9JdEJOWE41ZHJq?=
 =?utf-8?B?N01UOHFEektjS1B1UDhEandxSDJweENWUjVJMW1QUkgwRmFlbCtqQ2ZwZU1p?=
 =?utf-8?B?bHkyNHdWTnNXejZuWHZRckl4bjk3ZUc5WmdlZVdHWDc4MDVZY3Fzd3p5NmNz?=
 =?utf-8?B?cHFYVGoyTittWkhlM3N0Mk9pM0RoWjB5NmhweVUwVnVBVkdsZ3l2ditjOXU1?=
 =?utf-8?B?bkx1eHRWQkpZMkhkYUlCcjJTbml4S1FHSnB2ajJMbGNxN3Q0eU0ySStxcVdR?=
 =?utf-8?B?aEZIK1dwVnBsUWltMDdhR25qeUFHN0NrYlYvNVdiRXVBNVVVYlhJdmhZMmpP?=
 =?utf-8?B?OE54U3NFYVZ1bitya05rVVNuVXhsT1RSQm1jL1lCcnNNOTg4anZ6MG0zby9q?=
 =?utf-8?B?TFBUcFVqMEJGMzYzRko2NUZNaTBpNUFiSkZmSGdJemN5M0hjcjcrRGJZZWpD?=
 =?utf-8?Q?qzeVNHH2QuF0lSSXvCvXWXk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 655bef29-3081-4f4e-709d-08db8d328b7c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 17:14:03.2373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bviF5iMZ2HjVX2CXfdvVG7lVVzzg7RurXUwANIWVXElMeG+llxU2tpeaxiBDW9NySa7I4wAwb4rIkZl8C0ri1TdiiXyo4ja2dpF9nXd20/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6940
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix MTL+ stolen memory mapping
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 7/25/2023 9:43 AM, Lucas De Marchi wrote:
> Based on commit 8d8d062be6b9 ("drm/i915/mtl: Fix MTL stolen memory GGTT
> mapping"). For stolen on MTL and beyond, the address in the PTE is the
> offset from DSM base. While at it, update the comments explaining each
> part of the calculation.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

> ---
>
> Untested as stolen in MTL is supposedly to be disabled. Need to find a
> proper way to test it.

Is this disabling a recent change? I did try to use stolen on a tree 
from a couple of weeks back (for GSC loading) and there were no errors 
due to stolen being disabled, although things didn't initially work due 
to missing changes like this one. From what I was able to check/test, 
there is at least 2 more things that are required in addition to this patch:

1) update resource_is_stolen_vram to return true for MTL-style stolen 
LMEM, so that the LM bit is correctly set in the PTEs
2) implement support for removing the stolen reserved area from the 
allocator range (this seems to be missing for all platforms, not just MTL).

Daniele

>
>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 21ecc734f10a..271b3fba4129 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -94,11 +94,22 @@ static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr
>   
>   	ggc = xe_mmio_read32(xe_root_mmio_gt(xe), GGC);
>   
> -	/* check GGMS, should be fixed 0x3 (8MB) */
> +	/*
> +	 * Check GGMS: it should be fixed 0x3 (8MB), which corresponds to the
> +	 * GTT size
> +	 */
>   	if (drm_WARN_ON(&xe->drm, (ggc & GGMS_MASK) != GGMS_MASK))
>   		return 0;
>   
> -	mgr->stolen_base = mgr->io_base = pci_resource_start(pdev, 2) + SZ_8M;
> +	/*
> +	 * Graphics >= 1270 uses the offset to the GSMBASE as address in the
> +	 * PTEs, together with the DM flag being set. Previously there was no
> +	 * such flag so the address was the io_base.
> +	 *
> +	 * DSMBASE = GSMBASE + 8MB
> +	 */
> +	mgr->stolen_base = SZ_8M;
> +	mgr->io_base = pci_resource_start(pdev, 2) + mgr->stolen_base;
>   
>   	/* return valid GMS value, -EIO if invalid */
>   	gms = REG_FIELD_GET(GMS_MASK, ggc);


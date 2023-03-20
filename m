Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA4EC7618A
	for <intel-xe@archiver.kernel.org>; Mon, 20 Mar 2023 14:34:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D59410E1CF;
	Mon, 20 Mar 2023 14:34:15 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727D510E1CF
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Mar 2023 14:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679322853; x=1710858853;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WiAoKWlrKBkY097H4KWStbSwUbHWGQ58Uf7f6qzL5YU=;
 b=bjN+xK1GzLVB46dH2pvFnaNIlbEoMDt7li1vM7enrhFmbUi7kQsAcpIm
 7OzHGPi8apACOBB7akWGdZrAqVGM/ULrdR96ablQuP0h1G/xp7z/nTLqt
 yB4e5LQVOdZ+FdK6BYDgUfra2ugr8WI3Ak3T54sVKtRUiGk8QWjZku0kz
 GSDH8H2NA1DKo4rauu9GZl6DhhdhqYMd5D5RnM8Xypc8Rkq1gYp/l+OPa
 /bLRn49aNwhDqxgezQVMCPaHUzUUlf3/mWXc2uYa+VEV6mJbq5lIhDKLN
 rb7H7Z5sML3Gtq6c3CZzPNMfM0zD//mcNHh4V1JmPm0l5tPKITb22l0oC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="341035440"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="341035440"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 07:34:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="855303583"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="855303583"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 20 Mar 2023 07:34:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 07:34:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 07:34:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 20 Mar 2023 07:34:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 20 Mar 2023 07:34:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HFBfo27F2h4yMEXBQZXg7CyWWdh6+KuqZEqahRA8bXqoQUPgqK1UVi22QWeR4gKLxRkWMVP1KqX5pKHsMMKFIYjcHxjT9kGZ9UpYaPuPXoB4F9Fblpb6Or6+3zezUZAClWryiaVU2yv8yS3aXkd0mmMPN19oBbtpcbOzujDLUpr2UhbXYu06GtVrDp4caKYFb6DMx+k2JleDYXRTBXObb60Nmcm7jx/2pcOgX3kQiBRhzs6cTf8FT1zhi9yDktQXWqrqiaBsilmjUeZEHsPmgFhyct8ETh1egjJNvx7rh0k/s0ocYq2TbMQUkfAVgAgb0s9T23R3wGgWtOZYO6aT8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IneBe/TUMjV0Lj7RgE6fb7jwrZJcRPowJiFb5+WqvqA=;
 b=dTKIfxGDED3n4z9HUZ951Z7loTD3Ma1EvjHeB+eplfh316wqU+dsjtw/tM1R8S1FXuwCl58SqiGtE+5EYtOhDGr5pVJcQ7wRzdu35SkAdTZltuRJFCBPuASPw1Quo0fFK/Uqgx82k078UOBQdHP1nm8RfwEDlSFihYQeIUUanbxcbBQFq/8YP0YUevDlR2QCI2B+V7cR1I/04phtf2peChJZkVCAcHU2vHM8MCTzZJlUayQPNHbsrbnkIfhTqAC/+9WvgX9IA5Nx/ppe3cCVsVMhjQwzNn5qVZCS7Zv2Ot5aqtP4C+L3y59EeXvngWggKgGa6C5+hYwX3o+/hZ2vag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6)
 by CY8PR11MB6819.namprd11.prod.outlook.com (2603:10b6:930:61::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 14:34:09 +0000
Received: from SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc]) by SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc%4]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 14:34:04 +0000
Message-ID: <64da59e4-c767-0c38-7406-86a1e1139493@intel.com>
Date: Mon, 20 Mar 2023 16:33:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230314085842.134239-1-matthew.auld@intel.com>
 <20230314085842.134239-7-matthew.auld@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20230314085842.134239-7-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB7PR03CA0073.eurprd03.prod.outlook.com
 (2603:10a6:10:72::14) To SN7PR11MB7539.namprd11.prod.outlook.com
 (2603:10b6:806:343::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7539:EE_|CY8PR11MB6819:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d6a7280-5fde-4304-1518-08db295027c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Mx+lJT+J6xzqthuul3rFySkj5uc/pQYj5wTdvOetGjL2EmCdOadi8ZtoEfA88ukCudYiBnLRl7lZooMSMQDbozoro4zkjdMa12JUgosZVkT+thQr7MLguyDVQsRrLuS5psYIhd1NJQmLNPEvVMRGHsgNsKhamUquVYQF9DOnHzjqQUguooeG83uA8lzdhxE0Na0Ng4TiLVa4dz9cDPqufA1SoW/erYCpNDApf0v6ofLihEOmV+2xv5S02AtxcBW6R5auzimU5a+urDl7OnMTgMEmfFITM0OOCcaEM+PY+VYC2rDkZxwdVFk5Wz5tqgZiGK4gxBANLCPPO4AjuizE6SwCQnMViGqyjWKxofFyfr+8mIetAn1SfeATzm5aOTvaZTty88xehoLEP7mAFBnPFuZBG81CA9lphumkoPZKk7c34FLfd4Lioe5Ld90uYhhZRR1dOiOqs7FKJWmk6Mu26VRaHhU7G3BFg5riTEGU+82MKh2ovG3bGvwvhAe4ynsc/dPijBvMX9jogeG5hyB/yTdyv7schqR7GfE6M7tEbsxoiQuVP0E7M9uS9mqxo6ULK3xCzkEwMl9Ay/rFetbYkHuaJ/Y+3c6b6fbTK0HWbMGAF2NqZkqZIV/LZ7gRNFPFvewvUS9mv93OmqZmyZmTuiCi5V/001/IVI6Slmcdw4rYu4VHm3wgxN35/B5Hv1T
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7539.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199018)(86362001)(31696002)(36756003)(83380400001)(4326008)(8676002)(316002)(53546011)(478600001)(66946007)(186003)(6506007)(2616005)(26005)(6512007)(31686004)(966005)(6666004)(107886003)(6486002)(66556008)(66476007)(38100700002)(8936002)(5660300002)(41300700001)(82960400001)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QU1kaU9MV2krcXVmb1cyNnh3V1pSbW0vSUpIdWdVT0NkSktsR3N1M1VZVDhX?=
 =?utf-8?B?cDRLeHB0T0drYm96YllYV21CWHBvRzd4ZTZCTGdHMVRiQWd6Q0IzR1M2MnhV?=
 =?utf-8?B?Z3hJWm1lY29acE84UkEyL3k0MysrL0Vxam4wa1UvY1ZlQlhQaHBJcUtaclhQ?=
 =?utf-8?B?amV0RS9kaUFjQlBrd3huWUxtSFBvMTgyNExGNUdkQ1ZIMk9ldXI0NUM0TVov?=
 =?utf-8?B?VlhrZUYxcUdYNmNBSEQ0RWFwd3hFblpjSUJxNERDZjJKK2ppOUU3bzIwN3JJ?=
 =?utf-8?B?MkdqeHZQQ3d3YUJRUnEvQjQ2cjBqS1hoNWZ4blZ5VW1Ra3VyOFhJUW5XaDJT?=
 =?utf-8?B?SHRMUmhyL01QaldPbjM4d0tyL1E0OTI0c29UTDN1MVh5Z1kvNVdTRnQ0Umk4?=
 =?utf-8?B?V2djRkVZWUJ2TFp5Z1U0Z21heWlOcXhIMXk4cjNyRmllbGRzWWV0WGZkUzZs?=
 =?utf-8?B?VkUrbGt4WnQ5c2paL0ZqcCthYnJSR2hmbEUyUjVKTFJBa2tGQ25malpoMEpE?=
 =?utf-8?B?bHJYMTNKYkorZVFGbDNQZXFZN0V4dER5MzN3Qk0yd3R3cnVHSW5KZEZ0TG1r?=
 =?utf-8?B?UU9vVUQ4N09rb2JlTGVXQktzeGo2UWdCeml4NGdnV09nWGhCSTZlYnl0MUlL?=
 =?utf-8?B?ajVBMzN5NDIvSlNweEdDNHlCUXhuTzRUTnFFaGlPMnhoelZqQi8rc2Rtazl1?=
 =?utf-8?B?dWZjdUttTCtWeHlONjRhbWpVdmRZMUk2cVBpNzRpV2VIK2Fub3c4TzFYSkFl?=
 =?utf-8?B?eWY4Wm1iR3VzbFNubGdlbXJPVUlVMzFidGFrS1pjd2pLMWlpSkdYY3NIWXB4?=
 =?utf-8?B?d2cxRlQ4d2MrVU1uWWwzVU52eDl2ektoUFlyVk9LdDJWME1oWXg3bnlwSUxp?=
 =?utf-8?B?dFQrbVhKL21QQmdMWFNiRnZUVDArNmNRd2dyQy9UWjlFS09Kc3lIRnZrMnpH?=
 =?utf-8?B?MjBxYjFHL3ZrZEcxOU5xQkVYaW1Vb0lrY0dHbGdZUHZ2TVczK1RJdWdoUi9i?=
 =?utf-8?B?NDQ1R1Vwd1ZzbUY2L2lSYnlRdjdhdkxiLy8vUGM2YjJCVTJFdUpwQTRMeEFR?=
 =?utf-8?B?ckZGRVBIV1ZZL2xub3FmUE5SMllBYmhqS1FTSmR3eCsyN2lXU3RmVnF4TStZ?=
 =?utf-8?B?azVYSy96OHJSY3NhNkhycE5abmxiRDBzNE9hTE8vTng3N2NPNFJlMUFZa1di?=
 =?utf-8?B?dEJBdlQwOEExZjBUb3Vqdk5QaVM4a0h1TFp3K2JvRis2aWd1ckFsKzZGVzBk?=
 =?utf-8?B?RGJsNldZc2FZNS9pOVA4c2srNDhTNHcyb09KazRZWFFBTkV6OXZRbmxWcExY?=
 =?utf-8?B?ejNVaDFzVjRmSXNRWnhuTGN0Y0ozSndJK1BJc2d4MCtSMWwwOXJ6d1B4NmRa?=
 =?utf-8?B?ZVdlcUp4SGM3R2t5K2crNVM2VkNmdDdXdFZtNk0xVlNVaGxMeDJZSWQvUmQ3?=
 =?utf-8?B?Q3hPOWhMeThhTzJ5dEhsTWhnNWY2bHg0c2VHTkVVZWpnZnppZElObGh1RFVD?=
 =?utf-8?B?WnVWYS9KMVJjZkNkZ1NwTVl0OGlWREpkMlJmcmM1eFJSWnpqVStOMEdiNW1Q?=
 =?utf-8?B?RGM4RlpxdlphZzMrRmxHK3kvakNiRjFkcFBOcmhLNGtmdUk0RVhaaGVVc1dS?=
 =?utf-8?B?TTJmd3h6MXZ6dEh5N2ZtTFFoV1BzSmVHRkhkTTJZS1JKNnJUZHljZlM2WnJ6?=
 =?utf-8?B?d0JscDJxNXExNGdqRElXVUh3NnJVM1c0eHJ3Y0Y1NGFtZzg5UmRVUERpc3pN?=
 =?utf-8?B?djVRZVY5OGNiT3dQTUpKUEkwSldtNkFqWDJrK3p6SVdIRWkxSy9ScFBnaEow?=
 =?utf-8?B?aTgwQmJhQkNUV2xOajZRKzk0ZDZMV2lMeXB0QXVsbXlrRTVCY016K2tEL3VP?=
 =?utf-8?B?bHZld2tRQldQZ01Wa28vcFJacGhyN0RaRGZlYzFMMk5hRzgrRXV5MlNoWm10?=
 =?utf-8?B?eDZhWmJtbnR6YkR6T1RUT0RTMEVsNHhna0NpSWNLNUhLNVVHcTFnRDVBdUxM?=
 =?utf-8?B?WnRDVnUyaTNlaEFkSXhwMWZKSER3V08yS01Yb1RKaGkvRFpGYUVsRUFpL3Zu?=
 =?utf-8?B?cHdCbk1zbU1ySWdhc000dnZMd2U5akNzSHI1V3BWQXhjNlZKM2FSZUUvckFw?=
 =?utf-8?B?WCs1dzZhd0l3aFhnQjQwV0ltRGlwYVlCSWlTVXF1M0NmUXhkU0lpU1lEcURR?=
 =?utf-8?B?L3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d6a7280-5fde-4304-1518-08db295027c8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7539.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 14:34:04.8990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gSw+PKYBvHUTIvAMnjy+UIZCHeo8bg5yk4hRaGkPOm6IfVTh8Qodz6ReF/XCTU/+22ZzB+VFj6PoxnpyVAoMR4vmIfiqEa4iWzCfWeh2H3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6819
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 6/6] drm/xe/buddy: add compatible and
 intersects hooks
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Inquiries about the code were accidentally replied to the previous 
version, v2, so the code comments remain here,
https://patchwork.freedesktop.org/patch/525676/?series=114521&rev=2
but I reply with the previous review comments.

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

On 3/14/23 10:58 AM, Matthew Auld wrote:
> Copy this from i915. We need .compatible for lmem -> lmem transfers, so
> they don't just get nooped by ttm, if need to move something from
> mappable to non-mappble or vice versa. The .intersects is needed for
> eviction, to determine if a victim resource is worth eviction. e.g if we
> need mappable space there is no point in evicting a resource that has
> zero mappable pages.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 62 ++++++++++++++++++++++++++++
>   1 file changed, 62 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index a110cf1a15e2..5f3983b06a93 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -230,9 +230,71 @@ static void xe_ttm_vram_mgr_debug(struct ttm_resource_manager *man,
>   	drm_printf(printer, "man size:%llu\n", man->size);
>   }
>   
> +static bool xe_ttm_vram_mgr_intersects(struct ttm_resource_manager *man,
> +				       struct ttm_resource *res,
> +				       const struct ttm_place *place,
> +				       size_t size)
> +{
> +	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
> +	struct xe_ttm_vram_mgr_resource *vres =
> +		to_xe_ttm_vram_mgr_resource(res);
> +	struct drm_buddy *mm = &mgr->mm;
> +	struct drm_buddy_block *block;
> +
> +	if (!place->fpfn && !place->lpfn)
> +		return true;
> +
> +	if (!place->fpfn && place->lpfn == mgr->visible_size >> PAGE_SHIFT)
> +		return vres->used_visible_size > 0;
> +
> +	list_for_each_entry(block, &vres->blocks, link) {
> +		unsigned long fpfn =
> +			drm_buddy_block_offset(block) >> PAGE_SHIFT;
> +		unsigned long lpfn = fpfn +
> +			(drm_buddy_block_size(mm, block) >> PAGE_SHIFT);
> +
> +		if (place->fpfn < lpfn && place->lpfn > fpfn)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static bool xe_ttm_vram_mgr_compatible(struct ttm_resource_manager *man,
> +				       struct ttm_resource *res,
> +				       const struct ttm_place *place,
> +				       size_t size)
> +{
> +	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
> +	struct xe_ttm_vram_mgr_resource *vres =
> +		to_xe_ttm_vram_mgr_resource(res);
> +	struct drm_buddy *mm = &mgr->mm;
> +	struct drm_buddy_block *block;
> +
> +	if (!place->fpfn && !place->lpfn)
> +		return true;
> +
> +	if (!place->fpfn && place->lpfn == mgr->visible_size >> PAGE_SHIFT)
> +		return vres->used_visible_size == size;
> +
> +	list_for_each_entry(block, &vres->blocks, link) {
> +		unsigned long fpfn =
> +			drm_buddy_block_offset(block) >> PAGE_SHIFT;
> +		unsigned long lpfn = fpfn +
> +			(drm_buddy_block_size(mm, block) >> PAGE_SHIFT);
> +
> +		if (fpfn < place->fpfn || lpfn > place->lpfn)
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
>   static const struct ttm_resource_manager_func xe_ttm_vram_mgr_func = {
>   	.alloc	= xe_ttm_vram_mgr_new,
>   	.free	= xe_ttm_vram_mgr_del,
> +	.intersects = xe_ttm_vram_mgr_intersects,
> +	.compatible = xe_ttm_vram_mgr_compatible,
>   	.debug	= xe_ttm_vram_mgr_debug
>   };
>   

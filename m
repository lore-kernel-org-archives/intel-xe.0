Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D57C678D5
	for <intel-xe@archiver.kernel.org>; Tue,  7 Mar 2023 09:54:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D6310E3C3;
	Tue,  7 Mar 2023 09:54:48 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3778510E3C3
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Mar 2023 09:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678182886; x=1709718886;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wPPwMKUYaBQK/T1NoZqvEARyZ26ODGg5ptXOfirx7YM=;
 b=Y1TNidppetacL+/LpoNOQ3or7dgbFG2ScL2ofl26cZxokHkzZvSjUifo
 0wJdm43wgu2a+hBX1L+iGPjGUS/9JTsPcdgtx/zQ7+rywL05fBkhnfxNk
 CFkVw91bOWMfcYeCMAI0wr/IGd9YnBY/cn/+DyweudwXNX8XXUxuxhAAr
 PttY0or5UMf82L3mG/n6mFtu3aU5HEAJ4YTTPgIJQlUu7vHbTQVgT6D7r
 4/qEGxl/+eyZ3ravXHskzeuSy9Wi/TJcB95Q3d0z6ONX2NjcqT5LBv68X
 NCE2CpqPudCX1uD3VGRZSDCxOBiiKZU8OP5JQF+Uq1q5ydkopDQy7udQa g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="319641715"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="319641715"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:54:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="678857635"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="678857635"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 07 Mar 2023 01:54:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 01:54:44 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 7 Mar 2023 01:54:44 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 7 Mar 2023 01:54:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fa/cHBfQqPdt5ZNhl2ncWG47FQ2SLF/ve0vmqJNiA/jlF2+49VHuvn7AT3gcarBbpZb5zrSkx9zqxMl5znfvHwmTrGX45duST13cQ6ZhIXjLL7O6/OijpxiUCGiFgmGxlJUEH+eGz8pbJqdQfh98OL+b2YqhUtncNOoC65MnXbD81ETqzfPf1MfjnjL7+9CEi3rBCFc7FQraZ+obAIFdZh9KO9A9C+x/gtOnsr3DLS3R5NCl1pDm1PI20piE17WXXIJm7SRfEvcwAvs5l6KRZePr4cAProQiTVYnxmLVXv0QDA/9M0xEHFTp/ID38ME3O/PZv09KkonB0b/OOImgWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCxoUVGKCE7o/ispQEQZUBD3+fvaank5/9CKPDaBk5c=;
 b=NxNvjoTIvrdlvtMp2SAhFWxgj414Dk2LZBGI/oUZEIheR2j/UGAuLQidiH4HB24osA00229sSoLhbQsLBJ6twSYO+z4xziD1eQis+eA/hL+n7yKhmZdIs2tq6tfTQqSuKglvS3YSKhpDGQxQBSLnw2ik0zlse8M6APryBa7KQwPthO38N1rccdKAvTVB0PokvbRWIb/2WTc5M5HACOgyHgyP+R2sWQIPWfiHJoJemth9aeZtj07La1QGD4FLzIC1QXdkJyeV3JNY0MW/zLAmsKIJhlIyvcsr8WkN9IU3/yPXTgUTtoVS3YCzjnNCAk777dU22B8g3phhXiT4FvcT0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by SA1PR11MB6712.namprd11.prod.outlook.com (2603:10b6:806:25c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Tue, 7 Mar
 2023 09:54:42 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::de64:d1fd:cc87:a040]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::de64:d1fd:cc87:a040%7]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 09:54:41 +0000
Message-ID: <29c89d5f-0d58-2972-4434-31d130d638d3@intel.com>
Date: Tue, 7 Mar 2023 11:53:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230301144815.248239-1-matthew.auld@intel.com>
 <20230301144815.248239-2-matthew.auld@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20230301144815.248239-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::20) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5409:EE_|SA1PR11MB6712:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b12cd8e-f890-4980-f682-08db1ef1f88c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: euNtU27fZu3Zi+pmakmF5onGT27zGo5dWPItwHioxgtAVCu5/oflFCrZSMtKniwGdXHIrcKglcIoVNC7mRU8AU2PoqkMx35JeW9eAgp7fJUMEWUYSAl7jNAOhXyHE+hiLTuveeArVcuwF90OJpNj9uwbOvnvsit36hJaSJtRZQShdstQ9nDOIX/VKjYOXJJTRrJ1Pr0WBkZimOjYF2cPZQH26AIB1oTzlARWMwI6ZbP2S7E/7aq/RBBnQg1raHJO4km0g5QlhAKh+U5P7tY3bYqsmFNP0aBJsanD+/r/77KHBI77IGJRhos+eujKLBbVcjHP1kFXlDOq9DPbDIiRmw3/Xs/cZRnMBHjEQie1DkrKPZdqGcnshsPP01BZbu6ZmukL8Zerm85oUBDX7pZC9GAPgel6APgDZxTJ54Oc9DB2bzm8oVtzilOAcGMgtxISd6rFGjPVyd52quoGKHKLuMVbvzZWSQCr9jy+NJvfFpHbJsc+bpwVh3DZK2DXeuJX1cJ30tXcJSzC90QtKkxYnbr5xxL4QH9xghn1aOMovubuzzuzvo7V/2yV0jgDs+O9cHq87lIcuM3/RZLnckpIqd7nDPBRAxQF1Umn6jXdEjPiVq9361jrYKB5HyYFhq6jh2VVkzGtZc5m+qaEGcbyvorQMSXIj6oi7j7G3FKBHIbtz5tfL2uTgKiZ/6fxs2LyH7R9MtTB700OzzUnamCIbxUl9XFZZ7Vsl7rm1nYyc1g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(39860400002)(346002)(396003)(136003)(366004)(451199018)(31686004)(6486002)(316002)(36756003)(83380400001)(86362001)(31696002)(6506007)(186003)(82960400001)(2906002)(66476007)(66946007)(8936002)(41300700001)(8676002)(6512007)(478600001)(26005)(66556008)(2616005)(53546011)(6666004)(5660300002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjMwUU1Qd09rbWJsSkllT0tTZWpFRmt1WW82OFRYVCtqK0JzN0lmaU9kRjYy?=
 =?utf-8?B?cnlHWEREMmdrL3o2eGF3NHAwQ3B0TWdaL2lLSWJlT01NTzJEc1A3TTltN0xo?=
 =?utf-8?B?ekJob29veFlNVkF4bXlRa0NqK0pHb0pESktzTTBQKzcvdmZTQUpmMk9Kdnow?=
 =?utf-8?B?R3J0MDVHd2M1UG1KOUxmaXd2cFB1WW92YnJUOGhaRGNFbUhscDNlWjl0eStH?=
 =?utf-8?B?RFpjODRSQ2htNEM1QkVySDlDTEN3U2tmQUJOUjhGcCtTVXMvdTc4bnozS011?=
 =?utf-8?B?L21TZWE1OEVBZ3lMV1dGZ2VDTjMyd09wUXgyZVpwcjJkTHBQWEtsekJoVnBr?=
 =?utf-8?B?TCtpZzMyamZlQkI3QWFkeFBTNmlLaFlseXFuMXNHT04xV3JuV0lDdjEvcHFo?=
 =?utf-8?B?YS9HYUFZUHFiYStjNjBEeDNGZHlGNXp5eGdpcnE2c045ZUpYS0pScnZURHNr?=
 =?utf-8?B?WFNCaDY5aDVNNFJRU0l6VlhxSlIzcjVvWmxZeEFmZGNGUlNyY2tJM1BLRE9Z?=
 =?utf-8?B?VFVPK1U0VmdJQWNqVHdnVUNqeG0vWVdXWVA3dm1yRER4WWVDTHNvbEh4Uk5N?=
 =?utf-8?B?Y25PN2FHR0YzaEMxMzVtb0xvRzdITWpaWWVNNkJGdVJWQ1NjWUk4bWI0Nzlw?=
 =?utf-8?B?WVdtSWg4Mll6dVAvNzlTRzB2ZUZSejAzRUtVQVlsNUs0Vmp4aU1rQkFJTEgx?=
 =?utf-8?B?amNhTE85b1BlY2crQVVtczNCN2JpTU9oTjB3bVlEQndCSWJXeEM2VFFzcnQ1?=
 =?utf-8?B?cVIyNXlwbEdkM0RoMTBTU0hnZmU5QnRZd2VNNDB5b25BKzRDZW9jMWdObWhW?=
 =?utf-8?B?TFBzZEJyNkV2bmZaQVZnUzJ4R0pVaUZUYkxJbHJRUlFhN1VSYURVc3J0Mkk1?=
 =?utf-8?B?ZWNhaERaSWxEQytXbVo1eGlGSURVTE5EcW11azBtcWFWdGRjVEM3Z2xaZkUz?=
 =?utf-8?B?S2d5K0hBUmJRS0o1K0JyQWxoTUhrRGRYSXNBazAzTEUwdk5EM3dSYUxVMTB5?=
 =?utf-8?B?SG14cGVTZmd2L0hHR2pTUmpKZkx6SnVVM0JleHErZFA2MklhelVsKzQ4U0cr?=
 =?utf-8?B?SzJ1QWFoVGs5SnpRK3Z6b2ltNmVuNTNxV1RIQ1JnTGFhUHdTNmRnZ1pPbHk4?=
 =?utf-8?B?WE4yWStpR2orNHdDMm9MeXZqa1hlU2Z3dHhjM1lTYURjRFV5eDllZFJaeXRv?=
 =?utf-8?B?dEpnTDc5WWFLQmY4eVg0VnR6dGthT3hXeUZ1ZnFYWXgxZFlaaWJRWko5L1ZF?=
 =?utf-8?B?RERFVmxuVGFMd1k2K1lkdC9JTEoyMVd1VDcvaThqZVN0Q3U2Tis3eFltWVd1?=
 =?utf-8?B?WFVMWW9adWZneDYrc21Wa0l3NXo1ZU1nbmtZS0djQjVIRmc0SExuV2Jnd3c5?=
 =?utf-8?B?ZGMrYmxhK2tob1BMK1NIMEFNV2k4UnJkdjRRNzducGNhazZaZldsMVpJNVNt?=
 =?utf-8?B?eDVjbzhVc1FwZ000QmtxTm1zUWpPRTRodkpyeE5rUE9nS2paNkRtcEIrSENs?=
 =?utf-8?B?bjhOTHVJbG9KUUo1ZG1nanBrL05xaW92TVZ2RDIzT1gyd1F3alZHYWtzeGhW?=
 =?utf-8?B?YVEwdC9vNmpRZUg0MTNkU1c2T0p1UWF1N2hWVjJhZnYxVDZjWUxEV3BxUldl?=
 =?utf-8?B?ZUtFZGZySS9wbUpudlVMS1c3MDAzQWErV1gxOXlER2dwL0J5d3A5MVlOMkYx?=
 =?utf-8?B?VmdaSjBiYmpYdW9mUWg0cnJUVmVSeStRTzBOL1YwWUFKV0VIZDZPNERpY0Zw?=
 =?utf-8?B?MEQxdVc2WDFpaEVSeVZQYkwxYk90WE1HdTNjbW9lejR3RElsZ1BVN0ZhTGls?=
 =?utf-8?B?NmxjaXdPbktpUjNiUWxob01aL0FrVjF3TkE3WnFMb3M5QkMwNjhjZzJzQmtz?=
 =?utf-8?B?d09IaE9adms0VjQyMXoxanBwSURqUlBNcEJ3NDZqWFFCSTJFR1lUbEU1T0dI?=
 =?utf-8?B?STZMTEVKQVZ6bzVNejZRT3h0STJLVmgvaWFEZDlyQzJydFlwTUkwR2J6WDFN?=
 =?utf-8?B?QXVsTnUxdkgwT2p5d3JWaXZMZitZL1E5U29HUUNxRlo3R2dEV0VzZmxIQzlR?=
 =?utf-8?B?dStrTGkzSlhiZStOdldXQkdraG1DZTJ4NC9UenJrczgvdmxZZ2JvSFY2Nmto?=
 =?utf-8?B?UlY5SDlGTEp1VmNmNWFER2NyYnp4Q1c5bFQ2WGFLcDBQMGxpTk9WaS96RFlT?=
 =?utf-8?B?eEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b12cd8e-f890-4980-f682-08db1ef1f88c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 09:54:41.5256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlCIf5Ha4ldH9Z+bh+rduCWUH4ctj1XFwhSsBFLCIe2Glg0zOyy7QlOpqmLeego188tXkniBMsGbTvPXSdbL4pg5frqoy1jTS6/XCTUjqwM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6712
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/6] drm/xe: add
 xe_ttm_stolen_cpu_access_needs_ggtt()
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

Looks good to me.
By the way, the commit message explained only the case of smallbar, is 
there a way to access stolen memory in the case of dgpu resizable-bar?

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

On 3/1/23 4:48 PM, Matthew Auld wrote:
> xe_ttm_stolen_cpu_inaccessible() was originally meant to just cover the
> case where stolen is not directly CPU accessible on some older
> integrated platforms, and as such a GGTT mapping was also required for
> CPU access (as per the check in xe_bo_create_pin_map_at()).
> 
> However with small-bar systems on dgfx we have one more case where
> stolen is also inaccessible, however here we don't have any fallback
> GGTT mode for CPU access. Fix the check in xe_bo_create_pin_map_at() to
> make this distinction clear. In such a case the later vmap() will fail
> anyway.
> 
> Suggested-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c             |  2 +-
>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 14 ++++++++++++++
>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h |  1 +
>   3 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 2bfd3f6f2e9a..876f77669104 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1151,7 +1151,7 @@ struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_gt *gt,
>   	u64 end = offset == ~0ull ? offset : start + size;
>   
>   	if (flags & XE_BO_CREATE_STOLEN_BIT &&
> -	    xe_ttm_stolen_cpu_inaccessible(xe))
> +	    xe_ttm_stolen_cpu_access_needs_ggtt(xe))
>   		flags |= XE_BO_CREATE_GGTT_BIT;
>   
>   	bo = xe_bo_create_locked_range(xe, gt, vm, size, start, end, type, flags);
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 2e8d07ad42ae..4bf373a03d64 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -66,6 +66,20 @@ bool xe_ttm_stolen_cpu_inaccessible(struct xe_device *xe)
>   	return !mgr->io_base || GRAPHICS_VERx100(xe) < 1270;
>   }
>   
> +/**
> + * xe_ttm_stolen_needs_ggtt - If we can't directly CPU access stolen, can we
> + * then fallback to mapping through the GGTT.
> + * @xe: xe device
> + *
> + * Some older integrated platforms don't support reliable CPU access for stolen,
> + * however on such hardware we can always use the mappable part of the GGTT for
> + * CPU access. Check if that's the case for this device.
> + */
> +bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe)
> +{
> +	return xe_ttm_stolen_cpu_inaccessible(xe) && !IS_DGFX(xe);
> +}
> +
>   static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>   {
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
> index 2fda97b97a05..e210dada636e 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
> @@ -15,6 +15,7 @@ struct xe_device;
>   void xe_ttm_stolen_mgr_init(struct xe_device *xe);
>   int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem);
>   bool xe_ttm_stolen_cpu_inaccessible(struct xe_device *xe);
> +bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe);
>   u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset);
>   u64 xe_ttm_stolen_gpu_offset(struct xe_device *xe);
>   

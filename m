Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA0EC77B7A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 19:40:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A64710E5AB;
	Thu,  1 Jun 2023 19:40:05 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3445810E5AB
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 19:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685648403; x=1717184403;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=hGyGweEEVtRLQAzGt7ERh8fmIOUV3uHhy3leIj7kIdo=;
 b=O9TzKJeYJTJiHwVVbcV9XCGyrTWnRNOX97TayG2J4MqxoEeBLyvJjcs8
 paxxOZMdC7C0tMcV8JORU/e8MZcRa1wueQ/XaVQ2m1Vw7pZfv0M2Psuz5
 8NESILRAyeDvjPw8TIjG7Osup5gLuSI+1MXtpoDXDBD+9i/5p2txh4kKK
 LNLJVx95yOI/hpChGsbF5DdY/MxN60Umtwtvpo3OGJk+S1rNrqsHs/uiQ
 oBAUC3cMuT8l7UwgVSVx5LjG6vv2E46goYPqtLQE1qhynVWFO4l+NogGY
 YT9ZdoZvnbIkF4P39xO3vB3hp3u+cp6RkvMdwawQ7JPdqVxTX130zcXop w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="442032047"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="442032047"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 12:40:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="772565185"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="772565185"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 01 Jun 2023 12:40:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 12:40:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 12:40:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 12:40:00 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 1 Jun 2023 12:40:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRBLtoUvZc5O+0d0u1ILfp+z5xKTsvKR0tvixxD/Wa7uAxlswnBskuwhLy6yhvVSUOmDBJKYTdijy1O2ChirXtBCeXulPImKlQnJOgKfJptcnGOj+P5HbH9w9mQ/nKa3y5J+RFQupz5XP0KiBWkQpfLgJfiCqzSqI3TsDQqxaplxgxaNfuFKbGw7sbZq6U+IokJQJXzot/IE8rtcizkwGX8rYHKvu6x4VuxaGfzM1b5qx0iLbI4NLfGr7JRZ/a2MdLt68UnXV70Dt0lf4h3JLkBh+cIiG+z654C8Nmzcj3JKUp4CREsFJT5tePebiVDK60iaITavPWVIh08ucq4wiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SdDuSttXRKqu+7tfEFKPFoPrslWJ3PQhpioIcNWBJpE=;
 b=lmMnErLUPKuAh0geQfBpVyIaowK/CaycukCkRyECh+cW9t8UTIZFAZSEi1mYbW4EU4SvzP9yvSzO1QW2zzoY/kvTPjeQPt/aTCWe11YYZFp7zLmYf9aPWdGOxD50H08xsP8FOZly3HjvMbhq6MsizOVHj4dF45h14mBjLWuC9y/bfUEcBOkCH0co0WSnP7wzDKAxzPCY1hvgWftItEiT8dkH+ra26hBxiBTpdZ7JnjNohd6JjHGe6PfTkbTV6IKmLPBTEm15qOo2CJxvIm3qmCmZBsD/uFsoiZwYhITvax6jMJWjXmhENak1shjngGb5arpIyzqxG+dT+hUvRV8cxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by SA1PR11MB6845.namprd11.prod.outlook.com (2603:10b6:806:29f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Thu, 1 Jun
 2023 19:39:58 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::7fc1:e8a4:1646:c9f8]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::7fc1:e8a4:1646:c9f8%5]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 19:39:58 +0000
Message-ID: <5c1750f7-bc9e-b869-1810-bfae680bfc6d@intel.com>
Date: Thu, 1 Jun 2023 12:39:56 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
References: <1ddaea08-ed16-9cab-c8f3-b1222787722e@intel.com>
 <20230601155900.498280-1-matthew.d.roper@intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20230601155900.498280-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0019.namprd08.prod.outlook.com
 (2603:10b6:a03:100::32) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|SA1PR11MB6845:EE_
X-MS-Office365-Filtering-Correlation-Id: 8afc1abb-892c-48ce-952b-08db62d7fba3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nO+UQi6J4v3E7i/XdduTp4WEmHR4vLyURxxuzn3oVeNyXDWfvrCsJouvqiZZcj2AqKktGU3911+EuKupLO7HP9KYRpqDrsC7BjNiUI3Iei54APC2tppO5bL2SBjyYAYhR18cwwZq6XaLY9yYU7o2D0Gl0uV7CgfyR9pHdxaFKyLq+XLT2bOG6vXH34sGtw1kkvMUJvz/n83egcicI1arBJEAW2odtmNV+SFkxLGiGaDY+RY75GoWEC8Ovje+xQjLDyWD2hGcbduLm0Q2My6ONCV7d8Yw2TQH4qKwP4aMrF6brV4iU3b2qnjqdgYoEDXXEPz3vUsfL1BQkzeNZABQtxoeFeahDKhP01NbKMsgw/RwIQz4EGLihN+++oAIeGigY59HEUJ0VLsRLMmKbfQX7qLfV5rQJdn93Bruo+0zd6w5lm5DenAOIPN3pn9FquCwL0IDlw8AaT/XPITmJVlPw9r44UkYKqwuqAhw0jWJfrCx8LJkCH7Pvahjwcy7WlUuaagmA8SwGUVTmQV5Y6qdzDg0vZykhkCk4OVv6WlosxX9l1SdvnD5SdBttOMkrqS2UG6jL4YMLL6CE7TMvJw/23LCe5Ij2Ls85+UlvUircTOBRH60xVrgO5wP14VLaIGXFSKh/A/4TURjR7FDWhbJlA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(39860400002)(396003)(366004)(346002)(451199021)(86362001)(83380400001)(66556008)(316002)(66946007)(5660300002)(31696002)(36756003)(8936002)(6486002)(82960400001)(8676002)(38100700002)(41300700001)(66476007)(2906002)(2616005)(53546011)(6512007)(6506007)(26005)(186003)(31686004)(15650500001)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dllncUp2RFlWa3dOOThkWktFT3BwU3Urd0tNMHRKU0V2STVQWkZCbCszd01t?=
 =?utf-8?B?endHOFIzYk1hdjY2UFFVcGFrdng3Q1pOYVlQTDJwbnlkY3hheW00bCs4Q0RS?=
 =?utf-8?B?d1BxVEViandLTjlMRnpHNFJOY3pON2o3TzhEbW9GZXB2aTJhV3RvclJqSmRj?=
 =?utf-8?B?MDZqNkFPRjVHcmV2c3lyZUVnRmo4Y3Z3bnR4d0hGZ1lQY1VYODV3bDdUZkNh?=
 =?utf-8?B?OEJxcVFSbVlSYWZKR3J2UE5pMDNUZFp0QW1iRTFDWUlTR2dScGVYZ0twVkJE?=
 =?utf-8?B?cTNEc1FsUFYwMitoQ1lLTnNUWjdjNHRlNUNpdmVsd2c0QzU2c1FuU3dKY1Ja?=
 =?utf-8?B?WTV3MDB2QnJBQ2EyR3lhT1UzNmlUbFNWODNtNURjS3NYdzRoS3NBRU5jT3p3?=
 =?utf-8?B?RVlIL2pHYjZpVlpla0k2VjNGMVRUWG9ZLzVYQTBCYlVnb1puOEN4MFZmeFZQ?=
 =?utf-8?B?eWVDOTcyVEFZMHR5bi9DZGtNTDcwQnhmbG8xcnZIOTFRaEllUmUvQkZyRkR5?=
 =?utf-8?B?d1g4VDh1T01mMHJZZjE1MTRvdVEwMTAzKzdER1NWSVcyTEFsY3Z4eTkyYjha?=
 =?utf-8?B?ZHdTekxGcGEvYmMxUjBaMndTRlN6NENnajVSVVRyeml3ak5RQ0V4NDdLTjdS?=
 =?utf-8?B?MVpzRWFPTUQ0VkZlNmNSeXl5RS9acUNUV1puWndrY2tiRDNkL1RSSXVyL1pu?=
 =?utf-8?B?VklEUXZ4c2hiQVNNTGJmWjdsRzN1clI5ZGRHZUFlbXRFZE1EOFRmaUxiaFZ3?=
 =?utf-8?B?MjFqNDU0ckZ2R3J1VXhCdjNwVHFheFcwM1k1b0VNTUtXVDFsS3dvSVU1enlk?=
 =?utf-8?B?Q2kvV0M0L0c0OXhrblNnVm5YWXhJVmtJcnZVZU1zWDRwNlo1R1J1RHNpSEdF?=
 =?utf-8?B?eC9tNVQyaFpIQnRuUUU4WFlGSFBXUlZheVBiR1ZXR1ZWTllhTHdKdExvbjg1?=
 =?utf-8?B?UWo1Q09wd3JTTncxbExhQnZvY1JsdnBGaHJVM2J2TTg2SkxIOG1IZUhLQUtK?=
 =?utf-8?B?ZGdLdWRpZ2M0ZFRtUlMxTlZSTXc0bFEwM2thczVmbEh6bHBXVmtpQTgzc1RR?=
 =?utf-8?B?NTNqaUh1bkFIcHI4TXVJU28wUlROWHFxLzlHY0VaekN0cy9IYlYvNGwxbkYw?=
 =?utf-8?B?bDA2U0xmL0pRVmZYQ2lweU5rWFVyM3lEVDM2dHlxTEtRZFJjbCtMODVBSzNU?=
 =?utf-8?B?dVNyOGQvLzBhVVFrSFJ4TGJRS3BEbzRPQ3gvMUloR01EeXZwVlhheUdkUXNJ?=
 =?utf-8?B?Z2tXc1VlM0hVU1NkMnRBQS91VWY1UEg3ZWVUbUt5YUtaMWRFQ3hFY1l4NnRV?=
 =?utf-8?B?djVyRklwQ3h2ajN6YnRXcTlOTkozNEJWM2RaY0QxUkc4aWRxVnEvRE16RlFn?=
 =?utf-8?B?bW0rTzlaS1l0ZDZVQ2RCYkNaM3lsSzZsWUg3SmQydUtJV0U0UERCL3FVSjlm?=
 =?utf-8?B?ajE2V04vS1hZYTk5M3gvTU5ZM0dhcVJvaU1zWHl6RC84ckNLRnpyK3BXeWVV?=
 =?utf-8?B?MXp0QThzdDVRc3krMWwyRkRlM1V5QllDTkt0K2xOY0RJVFRIeTgrWVVscThn?=
 =?utf-8?B?ck1hZGZFTWRVVW9TSmdmellyRThLaU4xQUh6bVJhYzhmUk52NjU3dVlpRjNV?=
 =?utf-8?B?SEQ4a05JN0xsOFBTYm56S0t3aFRQS2txQmEyV3pueXNlYXpGK3JGbXJXSU15?=
 =?utf-8?B?Sm5hSlllT1NaTktmaFd2WmVhZG1kRm83UFNoUk1OSjUrRUlseTFsVURoaDBt?=
 =?utf-8?B?MFRiWEhhSm9raGZnUVRBVnJST1VPek8zaHBORHRGVmtpWTN4VFYxQ1MrZHJw?=
 =?utf-8?B?emlJbW4vTm55NjlRSkE0L2xNTHN2aDF0anJhYmk1NnZqVXhLaTFKUFh2RnBa?=
 =?utf-8?B?OGJLRTdNSnI3VWF5aDFhRmU3K0FJa0lGZDQwaktEdXJHNHNoWHY1Q1FlWXhw?=
 =?utf-8?B?ak1QOVVJNWFkR1REOGJmcHd3cXcxcTQ2QWZhZFFpamFFdlVCc016OVlKQnlP?=
 =?utf-8?B?YjJLcWZHS0VBSmdpK29Ba0JBWHk4RDBqc0plM2plYlV4THdIUkcvNm5ENU56?=
 =?utf-8?B?S3FzQi96b3VGbFFaa3dSVzcwOEozLy95TGZWWUpXQm1XM0tVOWJmM2FiNWZr?=
 =?utf-8?Q?hbo2mB6vrXvGz9Y50RgB0nZ/H?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8afc1abb-892c-48ce-952b-08db62d7fba3
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 19:39:58.5380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pWuBIOLyMjTk46gX3f9IcXGbCQIzchghcsZ5M3ZknSeHJs63kTnNxutOjwqRySjyM0wZgwjpRexQNFLMyCeN9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6845
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4.1 29/31] drm/xe: Update query uapi to
 support standalone media
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


On 6/1/2023 8:59 AM, Matt Roper wrote:
> Now that a higher GT count can result from either multiple tiles (with
> one GT each) or an extra media GT within the root tile, we need to
> update the query code slightly to stop looking at tile_count.
> 
> FIXME: As noted previously, we need to decide on a formal direction for
> exposing tiles and/or GTs to userspace.
> 
> v2:
>   - Drop num_gt() function in favor of stored xe->info.gt_count.  (Brian)
> v3:
>   - Keep XE_QUERY_GT_TYPE_REMOTE around for now.  Userspace probably
>     doesn't actually need this, and we may remove it in the future, but
>     for now let's avoid changing uapi.  (Brian)
> 

Reviewed-by: Brian Welty <brian.welty@intel.com>

> Cc: Brian Welty <brian.welty@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_query.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 8087c94dd782..c4165fa3428e 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -192,7 +192,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>   		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
>   	config->info[XE_QUERY_CONFIG_VA_BITS] = 12 +
>   		(9 * (xe->info.vm_max_level + 1));
> -	config->info[XE_QUERY_CONFIG_GT_COUNT] = xe->info.tile_count;
> +	config->info[XE_QUERY_CONFIG_GT_COUNT] = xe->info.gt_count;
>   	config->info[XE_QUERY_CONFIG_MEM_REGION_COUNT] =
>   		hweight_long(xe->info.mem_region_mask);
>   	config->info[XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY] =
> @@ -211,7 +211,7 @@ static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
>   {
>   	struct xe_gt *gt;
>   	size_t size = sizeof(struct drm_xe_query_gts) +
> -		xe->info.tile_count * sizeof(struct drm_xe_query_gt);
> +		xe->info.gt_count * sizeof(struct drm_xe_query_gt);
>   	struct drm_xe_query_gts __user *query_ptr =
>   		u64_to_user_ptr(query->data);
>   	struct drm_xe_query_gts *gts;
> @@ -228,14 +228,14 @@ static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
>   	if (XE_IOCTL_ERR(xe, !gts))
>   		return -ENOMEM;
>   
> -	gts->num_gt = xe->info.tile_count;
> +	gts->num_gt = xe->info.gt_count;
>   	for_each_gt(gt, xe, id) {
> -		if (id == 0)
> -			gts->gts[id].type = XE_QUERY_GT_TYPE_MAIN;
> -		else if (xe_gt_is_media_type(gt))
> +		if (xe_gt_is_media_type(gt))
>   			gts->gts[id].type = XE_QUERY_GT_TYPE_MEDIA;
> -		else
> +		else if (gt_to_tile(gt)->id > 0)
>   			gts->gts[id].type = XE_QUERY_GT_TYPE_REMOTE;
> +		else
> +			gts->gts[id].type = XE_QUERY_GT_TYPE_MAIN;
>   		gts->gts[id].instance = id;
>   		gts->gts[id].clock_freq = gt->info.clock_freq;
>   		if (!IS_DGFX(xe))
> @@ -290,7 +290,7 @@ static int query_hwconfig(struct xe_device *xe,
>   
>   static size_t calc_topo_query_size(struct xe_device *xe)
>   {
> -	return xe->info.tile_count *
> +	return xe->info.gt_count *
>   		(3 * sizeof(struct drm_xe_query_topology_mask) +
>   		 sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
>   		 sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +

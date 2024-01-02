Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B442DC47073
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jan 2024 18:08:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A8110E1D5;
	Tue,  2 Jan 2024 18:08:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521B710E1D5
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jan 2024 18:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704218934; x=1735754934;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3LKldMvaZFodIjogGR8ySbpuEnKQtlHgPUO2ur0+2yg=;
 b=C7z2wX/GQ0mdtJ57PpnzFlyawIR258Oqqt6wPkcUCFJaKdsD8lPQIfzx
 c+6asQG42pMAUl7guiHmD9lqwRaqFQxtNpBI/Pek78+MBnNZakiJnQA4G
 YZk9OOpKRXpIfSGWnjlAQMGipvuy8g74J2nxZpCcciLhG/EdGhTlEkI71
 Kd0CXdLUrxy+uPtjTvSfISX9nxgmuY+zYf3+3mem3x3jffAHmgFU0eAzC
 GVx+J8vmfZ0Fa7LSDOYal1Ki+4WFIrtbQgDPfGw/0YTYyNFoz1BHNlrFd
 203zDOliEh+/dddvzqtPDNLPHyF4ScXN5BDz5nfL00mPFxFt5854MARby g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="377061660"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; d="scan'208";a="377061660"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 10:08:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="850199567"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; d="scan'208";a="850199567"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jan 2024 10:08:54 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Jan 2024 10:08:54 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Jan 2024 10:08:54 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Jan 2024 10:08:54 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Jan 2024 10:08:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lKf5NGttg/nFOt0dXpvduvbv3RIHz3fs7zoKcMJG6NM+XBFZ/WecLpEfnUztKwIK2p4uZOMhvvwIGc8cYoFRxt1YpO75fVul1N00OR7sPVIuvn7RiZAn/WBP0+TJ1wQqvdyZ8dZUcnYo2eftz7gSqT4L9ZVKy08FGn/DYUrbv8lEObe7NXOWr2N4eOfoWBFaYEtCpDXvw3KYhraR05qDrentlpTm/tMixKZt2tHmHZrxPmuzcZVH2rskFJAlSU5b5ADrzS6kZorkKE3L4d8cD8vBZC/2oZFzJVjrXJdv5dRwEjM+UTOL2yS3nPwWrup2MvhrGOSB8fmhXnR2npojbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfUBrMKcQKWZlI6xmPT3WC3gxdO/blwUnF6DSVW+H4I=;
 b=MGNOcfVHhZyGnQubyrVYzaJTBCqYxApjWlb4BCHqwDp/qm6EHgiS67/P1WyfCy2X94bsoVeIkZppy7trfmWCKaopA+73olws7IN4WknEIhzebj6Ie5JJR5WbBaXHU2xi/8rf5fiKVAJNFDzQcT8twnHqQ8oxbAVwlMmAZyJntxA3NyhB8lKbBkbYby56N07gWK9b036xJJ06zb7mD5P1+a4AHskAn9cRJnfccCCJ6YhD4HBZUCQ4Z9Lwsbzpna+jDwDb5D/julVvOXJdHLiYghpqVIjIPjNxCtfc8a1LO3A0tZuW3eONAVjVTBqVunP4EPmRltmBvyc5bS4ESGgejQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 CYXPR11MB8709.namprd11.prod.outlook.com (2603:10b6:930:dd::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7135.21; Tue, 2 Jan 2024 18:08:52 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::b651:485:1973:7554]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::b651:485:1973:7554%3]) with mapi id 15.20.7135.023; Tue, 2 Jan 2024
 18:08:52 +0000
Message-ID: <b356056a-dbd4-4876-b7e0-ebd22a98be77@intel.com>
Date: Tue, 2 Jan 2024 19:08:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe2: synchronise CS_CHICKEN1 with WMTP support
To: Matt Roper <matthew.d.roper@intel.com>
References: <20231227152249.3570-1-nirmoy.das@intel.com>
 <20240102175937.GB3529480@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20240102175937.GB3529480@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::10) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|CYXPR11MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d46760b-d29f-4109-407e-08dc0bbde02e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GFseqrdG9IEioiTBk8KzCQTd7FqbJB6tWCepYhD0/u0TMyc74KpRavWQn2njQawWGSxNEDSCd0fCR8rQlSP2mepEpQCwTy2YYUMDDLOTn8z8AalgGFZW0Vj8POhuBwXf/t9mDGgKxRp0whOWaSQKFh6ecKiuvTkzggx5pgTTmjCgBnqG/32VpvW9SO7YjvqT18IrdiF0usnuqy4GpSnkwPQ/SOG14v9j9dXzfA4tB4EZVWMM2G/qRtYHnUjy0JJtvolvKWhcvF7R7wpbdaUWFNHDrVFRcNbPGduekOhfqEQwXsoqynIY6zuBs94b6Do8RJKFi9sgD/AfXmfSovPi+gi/WPp6YC+FLcHStos0eC1e1mlT9sa7mUfjY59pdMj0SUDyT7SN/xy9VJZtMTyup7AemheECfliDFbddlAd4KkoHqpsJoUMZBNsNWfdkJr47mLjxW/j6198klAKC8K9AoOHPtn97CC7zMiorPWUgVtoJ88lwEtHVj0NQIsaamN2wtOjFMRhnTtpu0XpGykO8qxfA9g4LmlwXTkP1VMtUsGZX6BhkPqojHNaj17BW8L6c9G3mzoFzDjw18mx1EkzBVkf/A9cE64DK3t8p14TO/rzjsZAEaLJOPaynX8F76kiI6ObNHnF54yS93gn07JmQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(39860400002)(376002)(346002)(396003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(31686004)(36756003)(66556008)(38100700002)(6506007)(6512007)(6486002)(53546011)(66476007)(6636002)(66946007)(6666004)(107886003)(31696002)(86362001)(37006003)(82960400001)(44832011)(2616005)(83380400001)(41300700001)(26005)(4326008)(478600001)(8676002)(5660300002)(8936002)(316002)(6862004)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eG9DMUdIZlBGR0Vsa2ZHeVZKdnVzbk5PQzFZQ2EvMTF4SEIyeEV0VjJNV0lh?=
 =?utf-8?B?c1ZWeDN6ZjZYV2lHNk9NaWdLRHQ0c3BweUhWQzN2N1pLeXR5aXUvNWZSUU44?=
 =?utf-8?B?UTNUZ1FJWE9pRVVrRkFEQkJOSTRJalU2Um5pMlBHbFB5cTBXTnJNWUwvT3Zv?=
 =?utf-8?B?K1I5dUREK2k5SjZrQjJEZkZVRmV5UzlNb29GTEQrYS9MYzdtRzByZ0pxYmpy?=
 =?utf-8?B?TXU1Yk1zYjVlUWRld2FuUTRWdlFSczIxSXM1VWtZWDJ6Rzg4NllSc0orYnZL?=
 =?utf-8?B?YTlaYkxxY0RGbUpvZWVUcE50WTFsZUp0NUIrMVF5aWxlZEpmcDFZemh2V0dk?=
 =?utf-8?B?cExiVXpSUElNYXhsK2d5RmlpRE5qTWh6cndCeEtJVmgwYytmTWhram9VZ2d3?=
 =?utf-8?B?Z2NPNDM4WllvQXNlY3lOOEhaTi9YbTI3a1ZEb1F3L0RJZ0taaXB4VjFrTWhi?=
 =?utf-8?B?SW9tWUltUUZZb3EzWld1UnNQcVZ4SytBWGdGTjNJT2FiUXV1d0d3NWVwRWtU?=
 =?utf-8?B?TWdHZWhuUzBJMzVpTVBscnBrZ1NIRERhMFpETUk4Z3VTL1NUbTQrQnl1Rm9h?=
 =?utf-8?B?dzJmTjJ6N1dJN3JmTmU2aysyR1ZuTlEwQ0dGTzNsWGJGMXpPOXRGN1Y2VklK?=
 =?utf-8?B?TVVpWjV2eThkaFg4eGxZWkZHWGhtcnpKYVB1TXg3ZG1QUXpGZ2FieHlReHBU?=
 =?utf-8?B?Rkp3NndYRVNOTUc4dkp5RDRTUXV4bXYyb0E3UURGdUI2SWpUTDRiTkY2TVhP?=
 =?utf-8?B?bStJUHZ4dW1UVGticWljYStKN2Z5WEVLRnkxUnY0eGlKZ1YvQ2pYbVhrZC9E?=
 =?utf-8?B?UFBaNTlIUmdjUUdnUXBwdFZEemZoaGFwV3ZzeTd2SmVRWFJGd2pHSXQrTDBZ?=
 =?utf-8?B?MGNHYXdZVWV2TVU5Z3FlVFppZU5zWVBycmhObTNuWW9OTW9INk5VTjJxVzAy?=
 =?utf-8?B?V3JkRllaZVVxT2U3Si9mQjliNlFOcitCbXU3K2pGalJzejZoNG5ISzdiSlhj?=
 =?utf-8?B?ZDhjc1IrU0FSeU1wZjVjVlpuZzcrMDdlL0xTdlFSSXE5NUJLYXZJTmZ0T0Vu?=
 =?utf-8?B?ZjNpdHZaTkptdjFuQU1XZDNzemZNMUpTRU5pY1Jna2RjbCswVUZrTmYrOUhQ?=
 =?utf-8?B?bXIzSEZnRFJONEt5RWdSYTMzSWZ6dytMZExmczlaUmFjMk5FVHREV0hpaEl6?=
 =?utf-8?B?UzFXakhwYUp3bjFIMzJpK3BEVzFsZEx6eU9vbVB1N1ZUVkdFb2hPWGJKM2Rh?=
 =?utf-8?B?ZDREY2RsYVZZVWZWNXVOOVZJYXVqc1B4TGptZmdLZ3QzR1FpM3ZLR0M0eCto?=
 =?utf-8?B?ek1iSkdHb3NHVXF6YWhwQ3hBU1JsV3ZJc21PSDlVTUcxTVJVZVA3d2M2ajY5?=
 =?utf-8?B?c3NTTGhqZzloeVA4anpsbTRjWlBaYjJTbE9zaFVNWllJdUp2UkZKTkZ4SFFp?=
 =?utf-8?B?UWFiZmtJZ2JMTGhJWkxSbEhoSS92SFhjd2N3VU1RNXgzTlNhd0tpL3NIWDJ1?=
 =?utf-8?B?OUxwOFR6dTZlbzA2alFyamh0cVpyNkpKeGdSMTkxQzV5VEtGK2VEUmozYUxl?=
 =?utf-8?B?NWw3OVdaejl0bnFYSDN4L3NHWi9mNU12RDJINlFMOU00ZWxHTTRaTzhYa3pE?=
 =?utf-8?B?elNjeExkVmxpL1BpZUJ4RDQxbmQ4Z2dFTVJkYkFXOFgwK0I3aDlqOHk1cjJH?=
 =?utf-8?B?ZFVRL0pndC9JdlRhZWg3bXB4YlVCMkxyaUdXZ1JGMXVZbWRFYmg5VmlmZjV5?=
 =?utf-8?B?U21qUEZjNjg2c0lOcEM4dHlzalMrSDFHWm9UL0FodUhyVlQ3Nm5URmdYL3dI?=
 =?utf-8?B?SWRMVEJ4WHJpOFBVQkZWVDhHQ296cE45cnlTV2U1SEVGbnkvTnJQa2p3RXRY?=
 =?utf-8?B?VWNuL1dzZWFtQVE2SmJtR3FTc09CR0dUdno0RkQ3UmpIczVrVmZMMzJxUXBw?=
 =?utf-8?B?Wlc2UDNIbXRpZ0NQTmhoVmRJdmJ5blMvc0RyeTNaWGlUdU8zR1JJS09hQ05j?=
 =?utf-8?B?YmJiWkc3WDVVUDE0QXBUb0ZmbXRnSjd5UnNpOWZsSUhzTDZWNlRrYzg2cFVQ?=
 =?utf-8?B?OXg0Sys1Q3ptR29WS2lOYWEraXpKNk1Gcms5Qm1DQnVjbjJ3L2J3Q2xsVmtV?=
 =?utf-8?Q?0oTMUTUsYgh/xbbzm3LefBpPW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d46760b-d29f-4109-407e-08dc0bbde02e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2024 18:08:52.0705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bxlr6uFo72JCZvs7gACu1WgaOFRMvFQ4jLiUJb5TMlZdEGdMAaS6zcf3hwWlsmjX26vFi3m9uFeoo/BttY7efg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8709
X-OriginatorOrg: intel.com
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

Hi Matt,

On 1/2/2024 6:59 PM, Matt Roper wrote:
> On Wed, Dec 27, 2023 at 04:22:49PM +0100, Nirmoy Das wrote:
>> Recommendation is to read FUSE4 register to check if WMTP has been
>> enabled/disabled by HW. If enabled we don't need to do anything special,
>> however if disabled recommendation is to also disable the WMTP mode in
>> the FF_SLICE_CS_CHICKEN2 register, falling back to thread-group and
>> mid-batch preemption only. However on Linux, the per-context CS_CHICKEN1
>> is how userspace controls pre-emption, so instead use the default lrc to
>> disable WMPT using CS_CHICKEN1, if disabled by HW. Userspace is still
>> free to set CS_CHICKEN1 to whatever they want later.
>>
>> HSD: 16016466292
> We don't need this line.
I will remove it.
>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Co-developed-by: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
>>   drivers/gpu/drm/xe/xe_hw_engine.c    | 28 ++++++++++++++++++++++++++++
>>   2 files changed, 29 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 6aaaf1f63c72..37bb54187d1d 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -148,6 +148,7 @@
>>   #define XEHP_FUSE4				XE_REG(0x9114)
>>   #define   CCS_EN_MASK				REG_GENMASK(19, 16)
>>   #define   GT_L3_EXC_MASK			REG_GENMASK(6, 4)
>> +#define   CFEG_WMTP_DISABLE			REG_BIT(20)
> Nitpick:  bits are usually defined in descending order so this should be
> above the 19-16 field.
Will do that.
>
>>   
>>   #define	MIRROR_FUSE3				XE_REG(0x9118)
>>   #define   XE2_NODE_ENABLE_MASK			REG_GENMASK(31, 16)
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index 832989c83a25..c212ca2c8625 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -316,6 +316,26 @@ static bool xe_hw_engine_match_fixed_cslice_mode(const struct xe_gt *gt,
>>   	       xe_rtp_match_first_render_or_compute(gt, hwe);
>>   }
>>   
>> +static bool xe_rtp_cfeg_wmtp_disabled(const struct xe_gt *gt,
>> +				      const struct xe_hw_engine *hwe)
>> +{
>> +
>> +	bool mtp_disabled;
>> +
>> +	if (GRAPHICS_VER(gt_to_xe(gt)) < 20)
>> +		return false;
>> +
>> +	if (hwe->class != XE_ENGINE_CLASS_COMPUTE &&
>> +	    hwe->class != XE_ENGINE_CLASS_RENDER)
>> +		return false;
>> +
>> +	mtp_disabled = REG_FIELD_GET(CFEG_WMTP_DISABLE,
>> +				     xe_mmio_read32(hwe->gt,
>> +						    XEHP_FUSE4));
>> +	return mtp_disabled;
>> +
>> +}
>> +
>>   void
>>   xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
>>   {
>> @@ -346,6 +366,14 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
>>   		  XE_RTP_ACTIONS(FIELD_SET(RCU_MODE, RCU_MODE_FIXED_SLICE_CCS_MODE,
>>   					   RCU_MODE_FIXED_SLICE_CCS_MODE))
>>   		},
>> +		{ XE_RTP_NAME("16016466292"),
> ID numbers only get used for workarounds (i.e., the lineage number to
> let us correlate the status across multiple platforms).  For
> functional/feature-based programming, we should just use a descriptive
> string instead of a number.
Sorry, I missed that from your last review.
>
>> +		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED),
>> +			       FUNC(xe_rtp_cfeg_wmtp_disabled)),
> The xe_rtp_cfeg_wmtp_disabled function already checks the graphics
> version, so filtering based on graphics version again here is redundant.
>
>> +		  XE_RTP_ACTIONS(FIELD_SET(CS_CHICKEN1(0),
>> +					   PREEMPT_GPGPU_LEVEL_MASK,
>> +					   PREEMPT_GPGPU_THREAD_GROUP_LEVEL)),
>> +		  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE)
>> +		},
>>   		{}
>>   	};
> It sounds like it might be important to also convey this information to
> the userspace drivers so that they'll be aware of whether WMTP is
> available or not, so we'll probably need to add that to the uapi at some
> point.  But that's separate from the work here and can be done as a
> follow-up after this patch lands.

Agreed, I am planning to have discussion in out xe-sync on how to do 
that(query,sysfs or other)


thanks,

Nirmoy

>
>
> Matt
>
>>   
>> -- 
>> 2.42.0
>>

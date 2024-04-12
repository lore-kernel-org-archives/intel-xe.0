Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EAE0C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 15:40:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E5F10F702;
	Fri, 12 Apr 2024 15:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lxa2K/2H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C41D10F70A
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 15:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712936439; x=1744472439;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NKbPtGyXUfIN4S+litkRMSqX9H7BF5DJGY552R0uWOI=;
 b=lxa2K/2HfLp9nnnUv+lAv3k38SThpFgY85wPcTnnyfl1MCnTHhmz+B88
 ivQO89CY+zXxzFTCeDxVdF+rO8PwO5lmsJwa3mkKBWD5AxsUGon/OjjjW
 HycZsSTbtDFHgGh+K6+E6nlNpylh94hkbrvTLKUHFNirhIsRNNnydoDWB
 l3AIH/jrnHnqraWM+vn6RZsrAIleQf/i02RGirueNUGu2CDLU88/ljy1K
 Kwvj8HL03Sn5ZVfd68AD/H+GSqb8nxA2uZyAJZLgIP5hQEPnCTLOSjyCA
 gmHHfoKpD+16iGP5C3OMmzui+/Xdw89/y22r1f1DxZ2IabD+pbo/M7pmC A==;
X-CSE-ConnectionGUID: OMbUpaEbSkiaZulyvdMkow==
X-CSE-MsgGUID: MWHuL1PfTNuaQJ26PW04cg==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8314117"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="8314117"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 08:40:37 -0700
X-CSE-ConnectionGUID: 74/RDzuYTIuC3n7745HwWw==
X-CSE-MsgGUID: yIShrAh3SHmPJ5wPsQkm0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="25916212"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 08:40:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 08:40:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 08:40:35 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 08:40:35 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 08:40:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QvnQ9nWr7H1U4E4PlNp7VBHjeY/8ULcTugYSFDrNQAIX93FTN2gAEMEWpQVxCbZqqHZ9aUDoFMlgnQJiRBj5MGTEVZwozcKoVqyh3lV3m4VeAI9Ih87LE/zBGNx92pJWSdvXKSnSBPkeHDWB4XkIb/HN/Z5FrmMEYo/ohuPrAlth2XIxuvFSET4Lduch+F4M3FTEhjx4zZUrPY6nhi+SMf0l5UA+kcjeS/X5dBR49x6sekId7S8//RKZn72hcRa8GJb2V3rGGDUCi2uYZXA2Agv/6RB4K6oaFqpGComOcP3ZperqszA+/0Bp+eW3OX1/cbyEskikPinWSgzTF+QwHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7hgESEIHfiIsI8+iMw3fz5hBDrwmNYNjmSEAu70RB4=;
 b=ivKGhD4WPecWUsFK0B5KA+2MiqLvMnzVmvlqlV5M6w4Kh10EAFsgc8a39fzlSitZ5EYse7F7lK5H7Cw3HAe4tOJFK8h+ExuW8vzYYsFWKK3HutyLr2Ggb1pB33lM6hYQVV0dEix23zTadXjaLRMoGgobsQwwqnci08FjSSOrw3KRLkeV7nP2uNYazseO54fCDwyWq9ugidLX7gxDTMuyEX0nzwuPq7oDfyTuOwsfniP71g+urRwVrrHNiNG4A8YL1P9BrKo9kB6zenrR83q6Mh/Y1OWPnkMZWidecq5SWekIhm0GIxwGv70GVWXAXEsM8PA02d+/keuLWbSoXSEUtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA1PR11MB8328.namprd11.prod.outlook.com (2603:10b6:806:376::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Fri, 12 Apr
 2024 15:40:05 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7472.025; Fri, 12 Apr 2024
 15:40:05 +0000
Message-ID: <9339338f-5b11-47b9-8278-ebb5896904c1@intel.com>
Date: Fri, 12 Apr 2024 21:09:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] drm/xe/tile: Abort driver load for sysfs creation
 failure
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240412080245.1044902-1-himal.prasad.ghimiray@intel.com>
 <20240412080245.1044902-7-himal.prasad.ghimiray@intel.com>
 <6utingku2ql5achp5wf52jkvduohvngrcr7mcfitjpdbdjth6c@rn5yhmhuryze>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <6utingku2ql5achp5wf52jkvduohvngrcr7mcfitjpdbdjth6c@rn5yhmhuryze>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::15) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SA1PR11MB8328:EE_
X-MS-Office365-Filtering-Correlation-Id: 186e0b27-e021-487b-23b9-08dc5b06d333
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NuyCr0Quq/237N8WpGdMjXmdVUMXsTAofXT023O1i8Gb4djH/nucFmKfoZH3kODnbyrcXgOZQ6TyBF200Etr1uhuPm+KyP08XYgi8XPF3QxRwp9twUhgFDsIV8DsnawkEHz21eCIyVb28p917NOF25ZTWHQzA45TdV/T5PZwV9L13OhhWalWlRiinQ0gY06oU70+WZnaI4UtOoquqM4CqtPnOxTK5aTXFUnCgGjBupVxMPtwiU9+c8Q2o0DRg6ts4fEbN88VHoAnfbS77zUHMPUP/habHrK8nIGhPt2M50Vl9wIvIp5I75rl9Zpz9GlSV3YS2c42K5xleyPa2QuJZ0HQKIgWxy3nnfPu3OTrsvtG09tU2aMn5QrB38gPJM1/EQp1dRbzrTG2OREMhd855iQohK7Yxtw/eGPfT/bhtKQDd+akI8BBhUn8rD1ERZ+/zNQyzH5Z669SMtVmPzE7MhOSm8QFuWVsjswbwMElpSBljd+H5XJEyWnXYhQH/j0Lc6DzO36Qp3iaccsWOxYC0QlX8yAQk30XOTOvgPJyy2mAyo9Qg8BOYcwxCeDPu/RVFHXBTduD2lZ1WItqb5+QxO1zso4bTasgBaaeUMO0Y/U1e3YQUqwq44XxwQDtcQeZpDqT6ZKPBDjTfTheSPnDj2qntCwEXq3eFHQdUOH+Xcg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDhOWFhwMFBDK0NyYzF5bFJLZmUzN2tJbUFNbU9DeHN5VFdrTUplK0V1bjdW?=
 =?utf-8?B?aDU4OEJwdFptdnBFWFJVK2hxUjdFaktVb0t6Z25IUUM3Z0pOejlDL2p0V2Jo?=
 =?utf-8?B?azcwMTlJMlpXcTRVM014NDNGQXhlb3c5Mm5qSUtMc2w3cmtpVDRsU2t4NFU2?=
 =?utf-8?B?am1iRmN5WkNOMXU5bnE1YzZyNGpONUdCK1RCdVBYWHBjTDV4SlI0VjRjN1g1?=
 =?utf-8?B?SUdjUm9tUlRJa1NtMEorWGdmTDUvYTE4bHhDVVdIYkVJT0RjeXVSRFpINmMx?=
 =?utf-8?B?QW91aGxGK1hUU2Z0RHJGV0NCbkIyVVdjSVU4QmlMLzZndVNWR3BnNWFFMndM?=
 =?utf-8?B?aDF4NE1IQ2REbnorWnpTY3JGazZaQnp3d1VDcktlTW43YzlacGF0T3BITVZT?=
 =?utf-8?B?Z2dHdmpJcUNRUU5iZmgzdDAzdkVxdzZraUlCaW1ldVhlK3Z4RzJ0cWJqM2FO?=
 =?utf-8?B?a1dxbG43bFg0NW1JU1Uza1V5a1M1WHd6azNOQlFhYk5xYVpTcEhNRThSUEVh?=
 =?utf-8?B?akVFWkg0S01ZVXl4QkFlOVB2UHMyWXpicEs2d25rclovdTVtMy83NHpDZnAr?=
 =?utf-8?B?QUVHRjcxcTRQWHBSRTJaV3dqb1VLclVxOU5uTHZuUEVxNE5LclE3c0tDZm9Y?=
 =?utf-8?B?Mjc0aGd5NGJtOGpmejhPVlFhcnI5RTBvSmJVa2FsYlpRMlZvbC9CYm91UkVR?=
 =?utf-8?B?N2s2U2s1OTc3SHBxdWRMbWt3NjBIL0dwdE9abERST1RPazRCT2I1Zk12Ymtx?=
 =?utf-8?B?SC94T3Q5REh6N1JDWXdqWS8vVkdKMk5zbThyUUp1WXpwRHFmZ2tXV284bEFi?=
 =?utf-8?B?dGticGJyRnJVUlJWVzJvY2xtTWNuQ0JWaW81aWlkKzJVK0lZeUZKdFAzbFJ6?=
 =?utf-8?B?eWhBdk1XclViY1A3TVR1c1QvTVJicHpGSHdkdHkxOFJvZktqM1A2N0kwdWNw?=
 =?utf-8?B?NHhvOFFVeXd5eHBSTGVGYTFWSFl6aWVmSmorR3NQQnN0K05NSFVDb0J3aHhJ?=
 =?utf-8?B?OExYRVd6V1V2SVM0QmtLSWFvdXhSMyswM0J2M0RpU0JtampSVEdMY3I2MDNM?=
 =?utf-8?B?Z3JTUG1FTndnNWFYUTY3MjhneGNaaWNQNXQ1M3B5dzVoT3RWamsvNCtYYVF5?=
 =?utf-8?B?M2dIcFdhWDZMRjQ3bXBzY0R3ZUxGZEJOaUgyaEh3emt1bXgwZk13b1lidzFP?=
 =?utf-8?B?N1BVLysxMjNDVVQ2aE15b0dibEEwUk0yNEpXT0IyU0hhZGlIZStjYmhoVWo3?=
 =?utf-8?B?WnAyeHR2UkFCTG9hSHJkVW5RbVpWT0V5bG1kYVdMdGM5b0xtdHZnMmVSTHRG?=
 =?utf-8?B?UFVIdDIrTlFmWktXUzh3QjgrdVY1MDhxNkNTUHRPVlpyTkhFT3FGWklOb1Yz?=
 =?utf-8?B?Yk5hdkpRZlZpeThxdDY1bjhQSVBCeGpLYkJyUWd3WDhFdFJKMDQyRm1yRk1P?=
 =?utf-8?B?anZaZElrQ2d3ZVM3RFB5aWppVDhJdzZjbkZIOGpsZEk2TnhvRUFodlNGVC82?=
 =?utf-8?B?SmpoZkl6bFB2VXRHRWR3QzRyZ3NYVWVucCtTWm9kNHZzSmdaM08rd0lzRFhs?=
 =?utf-8?B?VmZvVlQwR2Q5R0VyRTlkRlI3ZWxQVitaUVhoL3VpcXVqNUhjdWZnSWJFb3ZC?=
 =?utf-8?B?NGZPSUZiaTZBUE16RlZReUZJc2RBUkVkdERnNmNMS2xzaGk2NklCUythOFRM?=
 =?utf-8?B?UDZNVzJCeG1pbVl1OHBMckhCb0daOFE2Vlo2ME9ldldEclBaMzMzUWNOa3Vl?=
 =?utf-8?B?dGxxUWRvLzMxMzRCbmZCR0pqa0pudGpBQnRzb3U3UVI2K1hlMlA1SEQvMVpk?=
 =?utf-8?B?cGFIa2xZYVhIZDlGaThSVGlMK2dZZmhkaE5OZUNDMmVBcmpyRXUxL2R0N1Fp?=
 =?utf-8?B?MktWaDBOOGZRTW1uZkQrMXhXM0Zrc1krc3lQcDl4SGtNMnNaRWhnM0lFczFZ?=
 =?utf-8?B?TkpJWnE4R2lTR0lTNlpHTEtKblVsMjZnd1A4V0tJd2h6MTdwQm5McnFNTzdw?=
 =?utf-8?B?Mit6TVNhMWJiMjNoSUJ1MWdRQUFRVFlYNjl4cGswT2hJblg2aHE4UDZ5eEVj?=
 =?utf-8?B?ZmJLbVd0cjQrRjVtRjFzbjFac053MGtXeFE5NURSNUgzbGc4d0o2REtCOEY3?=
 =?utf-8?B?SFpaanhHR2hSYlNqeU5NYm5LMlF1bGFyR0MyalM3YTArTzk0MlQzQUl5aVRM?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 186e0b27-e021-487b-23b9-08dc5b06d333
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 15:40:05.4008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EbolicKkjnkns1BT6viSh6QwThcv8Anu2cD7EXZBeu63uj1stMeElJZsgSz+Dqq5dbYDwDFnEZVyy8Tivb0Fb0twtmzs4p/k4TudmdR2MMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8328
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 12-04-2024 19:02, Lucas De Marchi wrote:
> On Fri, Apr 12, 2024 at 01:32:44PM +0530, Himal Prasad Ghimiray wrote:
>> Ensure that the status of all tile associated sysfs entries creation is
>> relayed to xe_tile_init_noalloc, leading to a driver load abort if any
>> sysfs creation failures occur.
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_tile.c       |  2 +-
>> drivers/gpu/drm/xe/xe_tile_sysfs.c | 17 ++++++++---------
>> drivers/gpu/drm/xe/xe_tile_sysfs.h |  2 +-
>> drivers/gpu/drm/xe/xe_vram_freq.c  | 21 +++++++++------------
>> drivers/gpu/drm/xe/xe_vram_freq.h  |  2 +-
>> 5 files changed, 20 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
>> index 0650b2fa75ef..409cf55aa8a1 100644
>> --- a/drivers/gpu/drm/xe/xe_tile.c
>> +++ b/drivers/gpu/drm/xe/xe_tile.c
>> @@ -173,7 +173,7 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
>>     }
>>     xe_wa_apply_tile_workarounds(tile);
>>
>> -    xe_tile_sysfs_init(tile);
>> +    err = xe_tile_sysfs_init(tile);
>>
>> err_mem_access:
>>     xe_device_mem_access_put(tile_to_xe(tile));
>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c 
>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> index 237a0761d3ad..3cd340984c34 100644
>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> @@ -29,7 +29,7 @@ static void tile_sysfs_fini(struct drm_device *drm, 
>> void *arg)
>>     kobject_put(tile->sysfs);
>> }
>>
>> -void xe_tile_sysfs_init(struct xe_tile *tile)
>> +int  xe_tile_sysfs_init(struct xe_tile *tile)
>> {
>>     struct xe_device *xe = tile_to_xe(tile);
>>     struct device *dev = xe->drm.dev;
>> @@ -38,7 +38,7 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>
>>     kt = kzalloc(sizeof(*kt), GFP_KERNEL);
>>     if (!kt)
>> -        return;
>> +        return -ENOMEM;
>>
>>     kobject_init(&kt->base, &xe_tile_sysfs_kobj_type);
>>     kt->tile = tile;
>> @@ -46,16 +46,15 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>     err = kobject_add(&kt->base, &dev->kobj, "tile%d", tile->id);
>>     if (err) {
>>         kobject_put(&kt->base);
>> -        drm_warn(&xe->drm, "failed to register TILE sysfs directory, 
>> err: %d\n", err);
>> -        return;
>> +        drm_err(&xe->drm, "failed to register TILE sysfs directory, 
>> err: %d\n", err);
>
> same comments here and below as previous patch
Noted.
>
> Lucas De Marchi

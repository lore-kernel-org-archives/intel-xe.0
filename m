Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD21C47258
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 20:30:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7704B10FCE8;
	Wed, 31 Jan 2024 20:30:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1794C10FCE5
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jan 2024 20:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706733015; x=1738269015;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=voAkZHQfa+oO74JQX9RU8q12xHl/D7yPVPQbppjv74o=;
 b=PvbIDbU97nueOohH83wrK6c4IiZcikwduYM9Y2q0xRsoGdsKFA2QTBN5
 2EB/BbL7vtW34L3dbQuTG5UtyE5nTwpxvNqYVmG2Owb2xd+FUeBQKjDK1
 m3jSOZiUlnsvNodj6Grv7imLFWLu4fVmLrzpFpuPrhrCcgkPurKEjuhev
 NQFjfZ6nBHWLoAHuziEsATyJQltUXURe76iR2R/g41xPVG9XQKVuLg67+
 EUW+wZVF1DmDDC6bfEbLFsZqUw5snNMSAT916ao+/TCPYb2BtFMVZDfPN
 jY+ZRaWmV4L/mENf85zr//c/5J4hPv8mkUISJKFhOlnZMcA7+T2oW6TmI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="407436587"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="407436587"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 12:30:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="788706011"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="788706011"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2024 12:30:14 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 12:30:14 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 12:30:13 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 31 Jan 2024 12:30:13 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 31 Jan 2024 12:30:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVUWfLTnvA9E6sBcSh4Fb0i86QSDnfE/HP7ofq4JRP4ufXZMaEROZxrMyW/g1hdzsxbK2/6vOiuZ7dAYiL05AQWxAQwoPd3PHNfoT6nTYymdTlglHsPndiG4xdAbxfCzlF7OcjOmZ7czPIq74VxyITZkipEoAJDQ3Ws3qdXTzq7Ln+acZHNbBxVh4ymNpokVlbYJmQ2MHDdsFW/6Y36ODAXRGvy+NCn0/MNMbaR0KguyCO43IgdtkYRFczML0txicoecLz9RNmQeV76BWzUL6wuxLQwqr87fozsTQaznYgjd85j772c9GzbstPNvnwI4QCjHDM6sy3qksIxS+M8beQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1twa+fMShEWGSKLVvqF6Xl5nWNKDAL8TIMmSRT2VAto=;
 b=BxCKeVyAamxvXsLx9Pau+pHQcyZDO1WxIU8iSO4jL+zjE0y1jK8OVwu4Cfppt7GeumKQXQBnuGf8Op59Ez3rqSZfTvyZaJ6oTwSREeNCID7pDD6c2P+nexFUZaIVHKw2z93MbrWVcCiPdQVbPsMbsxl4dtVp4rBdairIaR8thjyzemHt/XQU6enYjJDE/LgJDW0CacuKk7/vZzUXNfCt0gNMeAxaE3+Wg7lQ2Iu7EI24Mjcxru7B4fUsHp8PB2+KL89YzlodXHfzbazdeQw5349caUMLt3pLU2TQqGtNBs0EUcEFK2BfmnYES16KRyS5wuaRtMpT7hXxHIc/bfMHOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SJ0PR11MB4878.namprd11.prod.outlook.com (2603:10b6:a03:2d8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24; Wed, 31 Jan
 2024 20:30:11 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::9ccf:6986:9706:16cb]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::9ccf:6986:9706:16cb%6]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 20:30:11 +0000
Message-ID: <743d1372-610d-4f4b-82d9-b3020567f56e@intel.com>
Date: Wed, 31 Jan 2024 15:30:07 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/1] drm/xe: Expose number of dss per group and helpers
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20240130212208.235448-1-zhanjun.dong@intel.com>
 <20240130212208.235448-2-zhanjun.dong@intel.com>
 <20240131000941.GA8089@mdroper-desk1.amr.corp.intel.com>
 <3bb9f8ee-b797-4dde-b228-7590bd3dd0ad@intel.com>
 <20240131183018.GB8089@mdroper-desk1.amr.corp.intel.com>
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20240131183018.GB8089@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0236.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::31) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SJ0PR11MB4878:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ebb90bd-5b3c-4a11-3c18-08dc229b6c4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dY5FhpjwWbgvNIcteN/HODU+0lFJ0LVAc512i6xkqfbjNx/tV/5V7CwiuYEaORoRIIUmgJMDQ2JNzQVz6vgp0FynJp5SgOoPcVlwqdIbwDFk7v5KcYSvn4hKOD/P0ULcEI15vfakML/IvNWl0M9uAeQihUo54TxZOYFzBqxOMJrdLsS9xeDGXnZQvrdYESGbCDY/hmEJw2sF51Ck3hznNYPTEngXZ9YNXMy1xixzeeEUpQsz85Xk4WdCQyaWSe33uvrWiLZFIBtPLrhM0RJ1U2usHyKpWjAK5520yY/BF1xlhL4yO/bW55FNSmAvKvZvcOd5I1pNWZE3lcIsFtYG0y/v5g3mMKSyFlmNZ2QFzjxwWQOr6AtXrlLdglLDW+DgsnfkBqKbtemWuL5wip2y361GO5P3oNZ7Jsai5avLCsHFqN0ylvHI9PowPF/DtQdZV6sH1idIzAMqlP1rP//71zw1dBASmqK6KDfd8IEsnwyU2Fz511xqrQPNGL+YP/UP9QGrUq13xeFuKwDBZnulTpBc19Jp4Mm6xDIcN/5qBYnEwkyiwb+OhO56+7Fty481+JlJsmOwxZe/AXB2Xa4cf+FKJjDOGJz1Xsmw3vjTriAqhBrZX6fPdA2pTZJ8pLRRE2ebG8UxZlNfzQcM6xuqpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(39860400002)(136003)(396003)(346002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(26005)(6666004)(2616005)(83380400001)(478600001)(53546011)(6486002)(41300700001)(6506007)(66899024)(6862004)(6512007)(36756003)(8936002)(4326008)(8676002)(316002)(66476007)(66556008)(6636002)(66946007)(82960400001)(37006003)(2906002)(5660300002)(38100700002)(31686004)(31696002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVJVQ0ZKSGpnWUpTcXpydGFKM1k3L3RROWpuVmx1Y05kTHlXN2F4TDN5MndR?=
 =?utf-8?B?Q1BMdSt5bDJDbnc0bStKWitNS1BZeFJmL0lWeWxwbGx5eUFGV0R3K1o2eVFK?=
 =?utf-8?B?UWZob0JTMURQMHJFR0VhZzF5SG9GYVBZTDJtSTNER2tjTHh4citwMndZa1F2?=
 =?utf-8?B?dG15UlByVFpEQUNPbno3Zi9MTi9CRUx5czFtbWxNd1E1aFV6cmw1WWFMaVh2?=
 =?utf-8?B?VjZwL3A3aVJOT2p3R0tIaTFqR1ZxWkhqTUNtdjJJczhGK1VubmVOMUxNaFN6?=
 =?utf-8?B?bWM2Sk5ZTWg4SGFTZmhYMzJMV096OWxJS3YzVWtHQmxXVjNvTjh2cjZ5S21l?=
 =?utf-8?B?T0FSMmF0ZElySWY4L1BJMXdPcHJHWkxhNkhGbjRMOEdDSWZaaElUMDkveXQx?=
 =?utf-8?B?SnVuRzlhWG5ITlNGUTlVR1Q0VjNQdGRpTnA1dEdEZExVTUt1M2c4T0tQQ09q?=
 =?utf-8?B?MzQydDZJUlQrOVJJVWc5Y1hWMUEralRlRnE3aGQ4V05lMUppOFdGVGp1U2ox?=
 =?utf-8?B?RWVpSjdnZ1lUc1liQjk0WWFmald2WTVrVlkwZ0VpcUpGQUFFRWJDVFlIaTdJ?=
 =?utf-8?B?clNkdXZueU52YU14RXRzNzM0b3M3c0dGM2hsVFA2RzZWMDVBeDNRSjRwcDRW?=
 =?utf-8?B?dmRDZ01adGR1YTdSMXdmdS9ablF4RWNJU204c2lTdWk0MEpPdWl5eFpCWHV3?=
 =?utf-8?B?ZUdUWTJHZHhTU3o2T0ltRjkxVzc0cUJkZHJCQlhkU1I2amp1ZFdVWFFvRGFz?=
 =?utf-8?B?ZzVPcHdRbnpleTNxVEFYZCtBQmNPMlBDK1B4VTZ6akpXUU10c1pVenF2Z2tZ?=
 =?utf-8?B?OTJVdGJxcy92Z201R0tNdU16KzVHMWJ2UDhHaXkzZ2EvQkhZM3pDWSt5L0pC?=
 =?utf-8?B?L21WOW9ySU5Ga25KWDlLSENONTEzcUpXTExZNVhWaVNabk9GYzhFbUpPVWJo?=
 =?utf-8?B?Wlc1d2x4NngzeGhIZFp2TEU3Rk41MmYyY1dGT0RYRjBkOUZ1alZqUEJCdGg5?=
 =?utf-8?B?bmY0Y0NsMTM3alNyM2I1SThCU1h4bFFCbkYxVWZXdU5xbk1UQldRRWZvMWJp?=
 =?utf-8?B?bS9ZdVdLcDh2Mkt1QUZmTCtIOHBqWnY2djFSNFFtVWVrMU1iT2t0NXFnL2pV?=
 =?utf-8?B?RU1xTldLUDNiNTFZdzFOV2lTeGlpT1dHSFZTSzVkK09aU2p1Zi9rNXhSL2Fy?=
 =?utf-8?B?N2JQRnFzbUhKMk9iTW42QlE2UVo2WlBoUk4vaFNTQXMyUHhPaVFQblFpbmtB?=
 =?utf-8?B?R1FWbFg1NjkvdDVkS1NZMVZ0c0svN0ZNNDVpRzlQZFkvaUpzcFZhdDFWZlly?=
 =?utf-8?B?ZXB0RzNoNWRWSXdHajlRSGVHWlNDMGNuREtsVVRTLzM5WDdaVG9Bdm1yU2V0?=
 =?utf-8?B?VE5aMDlHdzdGbFVNN2kyMytBc3hFY0xMUTlTeStFc2xESTU2b1M3YTBoRGw3?=
 =?utf-8?B?emdtZnY2SWR6UEZtaDl1dkxpNjhIL01xRlAvWWNrZVZCSFZTSzZKV0NiTzM5?=
 =?utf-8?B?emo2ajh1dlZGRVE5TW5PMHVaazdveFhPa1p4aGxWdGhqNFA3SFRjNlZxNzBF?=
 =?utf-8?B?VjRROStOT2JvZHFwQ0ZabkYzTUhzZk0vNmtFYTF6Mi90UTJUdlE0UzMrcDVM?=
 =?utf-8?B?WEZ2dlYycm1pNVNRcDdwYjdyZmU3NVZHWlFkM2cwRjc5VS91V2wzSmkvL09R?=
 =?utf-8?B?T1pYb1dnb2p5WUJ0K2RUZFVMaEl0VU5lR2RPYlR1L2Q3ZGV1QVUrcytQQ3Qv?=
 =?utf-8?B?WFBKU1FuaVJ6bDN3VnVJQnhzbWxBOHA2UWVBcXdIN04zTE44NEhRODZiM01p?=
 =?utf-8?B?dWkxa1pqRlI5alQ5SFVxT2doT2tFN1pVOVowWWFGV1JBSll1VURKNVQrMTlQ?=
 =?utf-8?B?ZThRMDE3RDFlUE4rOURZYkUvcitBZUpQVS93YzVHdHBtTDJtZmRQems1am00?=
 =?utf-8?B?bUlMMlByWXN4aDVJOWF5NW5aWnBFT3d4QTlzUFF2ZytYSmhLZWhkVDV4RVJE?=
 =?utf-8?B?Y3lMSlRHSHdya00yVWl3RFRFT0lsUHVoTUh1MVlKenVkOEt4UEpYaFZEQkts?=
 =?utf-8?B?dHJpRFRmTjJkZkhtWGF0dVdTNVVTOGFhSWgvWW5LL2ZaM0ZrSU9ZSjRqRUpE?=
 =?utf-8?Q?02SBwEuDEHO7SIloI4B4kCGDf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ebb90bd-5b3c-4a11-3c18-08dc229b6c4d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 20:30:11.4148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JDFsfKL87uVyv8xlt88owGSaaMplKSFUf3oxz/w0Z7bzdByze/yBp3qaVTF6Fi7vw1H241jYWeE5Cn5R/wG81Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4878
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



On 2024-01-31 1:30 p.m., Matt Roper wrote:
> On Wed, Jan 31, 2024 at 10:47:32AM -0500, Dong, Zhanjun wrote:
>>
>>
>> On 2024-01-30 7:09 p.m., Matt Roper wrote:
>>> On Tue, Jan 30, 2024 at 01:22:08PM -0800, Zhanjun Dong wrote:
>>>> Expose helper for dss per group. This is a precursor patch to allow
>>>> for easier iteration through MCR registers and other per-DSS uses.
>>>>
>>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_gt_mcr.c      | 40 ++++++++++++++++++++++++++++-
>>>>    drivers/gpu/drm/xe/xe_gt_mcr.h      | 17 ++++++++++++
>>>>    drivers/gpu/drm/xe/xe_gt_topology.c |  3 ---
>>>>    drivers/gpu/drm/xe/xe_gt_types.h    |  2 ++
>>>>    4 files changed, 58 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
>>>> index 77925b35cf8d..ad2e42dc2218 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>>>> @@ -291,11 +291,16 @@ static void init_steering_mslice(struct xe_gt *gt)
>>>>    	gt->steering[LNCF].instance_target = 0;		/* unused */
>>>>    }
>>>> +int xe_gt_mcr_get_dss_per_group(struct xe_gt *gt)
>>>> +{
>>>> +	return gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
>>>> +}
>>>> +
>>>>    static void init_steering_dss(struct xe_gt *gt)
>>>>    {
>>>>    	unsigned int dss = min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
>>>>    			       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0));
>>>> -	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
>>>> +	unsigned int dss_per_grp = xe_gt_mcr_get_dss_per_group(gt);
>>>>    	gt->steering[DSS].group_target = dss / dss_per_grp;
>>>>    	gt->steering[DSS].instance_target = dss % dss_per_grp;
>>>
>>> To avoid duplicating the logic, we could just replace these lines with a
>>> call to your new xe_gt_mcr_get_dss_steering() function as well.  Then we
>>> don't even need the dss_per_grp local variable.
>>
>> There are pointer type mismatch issue, both gt->steering[DSS].group_target
>> and gt->steering[DSS].instance_target are u16, while
>> xe_gt_mcr_get_dss_steering take uint*, which called by the macro and get the
>> pointer from macro. I would prefer leave int type as macro argument type as
>> it is easy and safe way to avoid write 4/8 bytes to 2 bytes data.
>> Let's leave the part as is to avoid u16* vs uint* type issue.
>>
>>>
>>>> @@ -683,3 +688,36 @@ void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p)
>>>>    		}
>>>>    	}
>>>>    }
>>>> +
>>>> +/**
>>>> + * xe_gt_mcr_get_dss_steering - returns the group/instance steering for a DSS
>>>> + * @gt: GT structure
>>>> + * @dss: DSS ID to obtain steering for
>>>> + * @group: pointer to storage for steering group ID
>>>> + * @instance: pointer to storage for steering instance ID
>>>> + *
>>>> + * Returns the steering IDs (via the @group and @instance parameters) that
>>>> + * correspond to a specific DSS ID.
>>>> + */
>>>> +void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, unsigned int *group,
>>>> +				unsigned int *instance)
>>>> +{
>>>> +	int dss_per_grp = xe_gt_mcr_get_dss_per_group(gt);
>>>> +
>>>> +	*group = dss / dss_per_grp;
>>>> +	*instance = dss % dss_per_grp;
>>>> +}
>>>> +
>>>> +bool xe_gt_mcr_dss_has_subslice(struct xe_gt *gt, int slice, int subslice)
>>>
>>> "dss" and "subslice" are basically two terms for the same thing so this
>>> name is a bit redundant.  Something like "xe_gt_mcr_has_dss" would
>>> probably be fine?
>>>
>>> Although this should probably be in xe_gt_topology rather than xe_gt_mcr
>>> since it deals more with the hardware topology than with steering.  So
>>> moving it over to that file, the name would become
>>> "xe_gt_topology_has_dss."
>> Moved to xe_gt_topology is fine, because the function need dss per group to
>> do calculation, then it requires xe_gt_mcr_get_dss_per_group exposed.
>>
>>>
>>>> +{
>>>> +	int dss_per_grp = xe_gt_mcr_get_dss_per_group(gt);
>>>> +	int index = slice * dss_per_grp + subslice;
>>>> +
>>>> +	if (index >= XE_MAX_DSS_FUSE_BITS) {
>>>> +		xe_gt_dbg(gt, "DSS id out of range: slice:%d subslice:%d\n", slice, subslice);
>>>> +		return false;
>>>> +	}
>>>> +
>>>> +	return test_bit(index, gt->fuse_topo.g_dss_mask) ||
>>>> +	       test_bit(index, gt->fuse_topo.c_dss_mask);
>>>> +}
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
>>>> index 27ca1bc880a0..356f21978eb8 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
>>>> @@ -7,6 +7,7 @@
>>>>    #define _XE_GT_MCR_H_
>>>>    #include "regs/xe_reg_defs.h"
>>>> +#include "xe_gt_types.h"
>>>>    struct drm_printer;
>>>>    struct xe_gt;
>>>> @@ -25,5 +26,21 @@ void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
>>>>    			       u32 value);
>>>>    void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
>>>> +int xe_gt_mcr_get_dss_per_group(struct xe_gt *gt);
>>>
>>> It doesn't look like you actually use this outside of xe_gt_mcr.c
>>> anymore so we probably don't need to export it.  It can remain a static
>>> function for now.
>> Same to above, move xe_gt_mcr_has_dss to xe_gt_topology.c conflicts with
>> this static prototype definition.
>>
>>>
>>>> +void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, unsigned int *group,
>>>> +				unsigned int *instance);
>>>> +bool xe_gt_mcr_dss_has_subslice(struct xe_gt *gt, int slice, int subslice);
>>>> +
>>>> +#define _HAS_DSS(gt__, group__, instance__) xe_gt_mcr_dss_has_subslice(gt__, group__, instance__)
>>>
>>> I don't think we need this macro which is just a pure alias for the real
>>> function.
>> Sure, will take it off.
>>
>>>
>>>> +
>>>> +/*
>>>> + * Loop over each subslice/DSS and determine the group and instance IDs that
>>>> + * should be used to steer MCR accesses toward this DSS.
>>>> + */
>>>> +#define for_each_dss_steering(dss_, gt_, group_, instance_) \
>>>> +	for (dss_ = 0, xe_gt_mcr_get_dss_steering(gt_, 0, &(group_), &(instance_)); \
>>>> +	     dss_ < XE_MAX_DSS_FUSE_BITS; \
>>>> +	     dss_++, xe_gt_mcr_get_dss_steering(gt_, dss_, &(group_), &(instance_))) \
>>>> +		for_each_if(_HAS_DSS(gt_, (group_), (instance_)))
>>>
>>> We could also probably implement this more efficiently if we had a
>>> topology helper like this (untested):
>>>
>>>       int xe_gt_topology_get_next_dss(struct xe_gt *gt, int from) {
>>>               xe_dss_mask_t all_dss;
>>>               unsigned long next;
>>>               bitmap_or(all_dss,
>>>                         gt->fuse_topo.g_dss_mask,
>>>                         gt->fuse_topo.c_dss_mask,
>>>                         XE_MAX_DSS_FUSE_BITS);
>>>
>>>               next = find_next_bit(all_dss, XE_MAX_DSS_FUSE_BITS, from);
>>>               if (next == XE_MAX_DSS_FUSE_BITS)
>>>                       return -1;
>>>               return next;
>>>       }
>>>
>>> Then you could write these loops as something like:
>>>
>>>      #define for_each_dss_steering(dss_, gt_, group_, instance_) \
>>>              for (dss_ = xe_gt_topology_get_next_dss(gt, 0); \
>>>                   dss_ >= 0; \
>>>                   dss_ = xe_gt_topology_get_next_dss(gt, dss_ + 1)) \
>>>
>> The macro above actually not set group_ and instance_, while the macro
>> for_each_dss_steering designed is to iterate all dss id, call a code block,
>> with group_ and instance_ already set. In my review comments to Jose's
>> patch, I have similar optimization, but revert back because of the same
>> group_ and instance_ not set reason.
> 
> Sorry, typed it up too fast.  Something like this should work I think?
> 
>       #define for_each_dss_steering(dss_, gt_, group_, instance_) \
>               for (dss_ = xe_gt_topology_get_next_dss(gt, 0),
>                    xe_gt_mcr_get_dss_steering(gt_, 0, &(group_), &(instance_)); \
>                    dss_ >= 0; \
>                    dss_ = xe_gt_topology_get_next_dss(gt, dss_ + 1), \
>                    xe_gt_mcr_get_dss_steering(gt_, dss_, &(group_), &(instance_))) \
> 
> Or if the commas are too ugly, you can make xe_gt_mcr_get_dss_steering()
> return an int and do something like
> 
>       #define for_each_dss_steering(dss_, gt_, group_, instance_) \
>           for (dss_ = xe_gt_topology_get_next_dss(gt, 0); \
>                dss_ >= 0; \
>                dss_ = xe_gt_topology_get_next_dss(gt, dss_ + 1)) \
>                   for_each_if(xe_gt_mcr_get_dss_steering(gt_, dss, &(group_), &(instance_)))
> 
> so that the for_each_if assigns the group/instance.
I like this idea, it go through slices through get_next_dss, thus 
eliminate the need of has_dss check. Sounds like all I need to do is let 
xe_gt_mcr_get_dss_steering return false if dss id is out range, 
otherwise return true on normal case.

Zhanjun
> 
> 
> Matt
> 
>>
>>> That also avoids leaking the XE_MAX_DSS_FUSE_BITS internal detail
>>> outside the topology files.
>>>
>>>>    #endif /* _XE_GT_MCR_H_ */
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
>>>> index a8d7f272c30a..e973eeaac7f1 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>>>> @@ -11,9 +11,6 @@
>>>>    #include "xe_gt.h"
>>>>    #include "xe_mmio.h"
>>>> -#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
>>>> -#define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
>>>> -
>>>>    static void
>>>>    load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
>>>>    {
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>>>> index 70c615dd1498..b926606edb38 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>>>> @@ -25,7 +25,9 @@ enum xe_gt_type {
>>>>    };
>>>>    #define XE_MAX_DSS_FUSE_REGS	3
>>>> +#define XE_MAX_DSS_FUSE_BITS	(32 * XE_MAX_DSS_FUSE_REGS)
>>>
>>> Based on the suggestions above, I don't think moving these will actually
>>> be necessary.
>> This bind with for_each_dss_steering macro define.
>>>
>>>
>>> Matt
>>>
>>>>    #define XE_MAX_EU_FUSE_REGS	1
>>>> +#define XE_MAX_EU_FUSE_BITS	(32 * XE_MAX_EU_FUSE_REGS)
>>>>    typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
>>>>    typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
>>>> -- 
>>>> 2.34.1
>>>>
>>>
> 

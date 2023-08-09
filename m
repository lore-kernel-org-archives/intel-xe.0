Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7AAEB64DD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 11:57:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D44E10E418;
	Wed,  9 Aug 2023 11:57:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3322D10E418
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Aug 2023 11:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691582267; x=1723118267;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sTAuQGjWXDoiTHedSFR+rU4s8F1b0K35nFSTccqj9ww=;
 b=iDBriboU2kJaFRx/Zz5ZIF6BSHGJptCEcvpikvAaPi7PmW2Zra3fbA6Y
 Nzd1AjpRUHevf7dl0JTklnmhaVr5FpDCEZ7Y0rJaiKe6qDZLJwHPMwiVx
 ntcq4TfVS2g19uxQxcms8QDa593mT+nVIQbOv6Bg95n8VjlFffxCjB5OB
 UIUsrV5fk9EeNnKKiZYn2AlFSVeqOTIhAIa4/0iubtuziizh/5is2UslI
 sXnfOHP+gZw1jGF9WoiifHrNOFN5yHJrhtmCfLA7dAtS7VQ/hlkGiihCp
 i0X/C1Q15Vv8fwiCWyhdLEYZXq/8FxWwV3z7rcGzWgZ0DJYiURnywM52f w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="374811618"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="374811618"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 04:57:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="731781279"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="731781279"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 09 Aug 2023 04:57:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 9 Aug 2023 04:57:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 9 Aug 2023 04:57:46 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 9 Aug 2023 04:57:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MiM/8uEo4Jqe/DHUpamaj8/IYdpeiVkJIof9a0/T/vVRB3ttI+jeDCTkSt2xRY/FilB7tz31GkaXKVfz0f5KsHMCHsV+hHLFX/l0uwMDlmwmSyeQb3pKLgj6otA5zhRMcigwClcpZ9aqr0Ru6rJVmzDmwXqfXkd2LYSA7FBogu6uX9BF+XTMLbAP9RPXIyC+dybqmB2AHMXTGGn60ubt5fkMTi99cl+NDRuZeuBUcH5zXocaG17gQf4ECIGb5aELSRag3npVZwgkpJMdiop3GEGBMILvk5tE+d9keYvzsnhGuj9daNFGSpOtrnCMN4kqaauZetA175R/WCV/8Buzaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVdp0lF513XOXbdRjhqDn5+Ifb0fbKcPJisCIKmpjsw=;
 b=DAU6f6tStPfSMuLjI1SbqjS1/CjBDEdo3nqMrL6e0MufhBBWiD3NdbwoVOz4U/pMpTPriYlioeqkccUtAN9ljo/bUNKFUazWErSxWOzFqEEuE65zq3qmWfYkbmy5/gWUJrWhT0+5ucW5tViAE4ji0NdOAMf+1sCs2yk1rQrzOaV0HGViBLAp/9VEYRpKtzj2aBPRPH/2UgXUn4VN6appk7uBosVDG+K7WdZsyeb7HvROOGut/O2Fe595vsq6qg3W0VIVcro0aXnKuNO4JcLjIf0pDZgtitDEgv/CzE6YIjVPTZbMIZ6LsyU+kzrGnO/scN0Nr/Ir2KPLsFjckeXV2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by IA0PR11MB7355.namprd11.prod.outlook.com (2603:10b6:208:433::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 11:57:38 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153%7]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 11:57:38 +0000
Message-ID: <b9496a4b-bea2-fa15-6ae1-5810baf70260@intel.com>
Date: Wed, 9 Aug 2023 17:27:29 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.14.0
Content-Language: en-US
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230808115436.400611-1-aravind.iddamsetty@intel.com>
 <20230808115436.400611-3-aravind.iddamsetty@intel.com>
 <877cq4y8s3.wl-ashutosh.dixit@intel.com>
 <95750d7f-df24-a9c5-ab39-86db69767bac@intel.com>
In-Reply-To: <95750d7f-df24-a9c5-ab39-86db69767bac@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXPR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::14) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|IA0PR11MB7355:EE_
X-MS-Office365-Filtering-Correlation-Id: f71ab2ea-551e-4ec7-fc5e-08db98cfd3c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yhi05yBBYW4SY4qKWUiPiiTPx9IoDnhcITMMWSYYKCAf6zqiD5Fv/vNAtFI0DAZKTHTS76ph9/MB3IU/Fmgae1gUbAFzlW39IAlVa8SrIXSnU5AFUnoBtgrVlBsdsLh8kIguP/2E3NBbqlzHjmGwxHhi1lexBKvKfbSKzzv5+jYFpJA60R9KxfuRLz2cGEYAlU7lsKQBi9pggz/lMzUc+EZ9Cc4xQf7dfMZt8zZl6oT2sSj78tPPQH3XBlXNyy8eSQQGRG0BT/RuhcLcUmguYiOOa6CPDbz8L6hDRGSkdk4CWBbVqevJDui1YvOMauozWv6rMohRX6pu+jSrF5FWbVWRMOH6CPFl//ixWXX5u8x/8r3jlmjz4yDZZAFGENRozJw2kLw7g8fVXehhg+rcn4uEZlowjC4CCdhrvmzT07L9+9XXLRufYe2/cFMEpVMjTrQDrAcpAaV/NPmqGzHCl1afAFqnl5KKVKUm/XsY6zk91yB88PPPZ0iNkFwea871t0OxENalKL0BLXs4o2bVry6G/ZC5vs24nesZCRZOu7j10zXHC8u329uQ8+/7Pi7UtrvQO89+osAQCjynGutg830LmQiMktuBC15unuZS848KqfyvWyRCeZiR/1H7n8+kC08UHHWuE03cfO0Vy5yQPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(136003)(39860400002)(346002)(366004)(186006)(451199021)(1800799006)(316002)(6862004)(8936002)(8676002)(5660300002)(2906002)(82960400001)(6506007)(38100700002)(53546011)(26005)(107886003)(83380400001)(2616005)(41300700001)(36756003)(6666004)(6512007)(86362001)(31696002)(6486002)(66476007)(66556008)(66946007)(4326008)(37006003)(6636002)(478600001)(54906003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M251UTUzYWd2UnY0TVkvcEFGTyswUy9DalBHVmVORFQ3OEI1ZzdrQjRDODN5?=
 =?utf-8?B?ZFdmbVpHd0g3S29DK3RwWmpKZEo5Tnl0a2d6WndOVFpHdmd1SmRkUHMxL2Ur?=
 =?utf-8?B?RWdTVXdPQlBoT29kM2MyS29CVjlDY21uR2NiTkVtQ1c5L0JhNzIwVmNDZHNT?=
 =?utf-8?B?c1U0YnZNVzk1SXdLUjYraTdwR1lIVG9KYlpTUW5iaEdWK3FtVTNwWWpqc1ZC?=
 =?utf-8?B?WEhxVSs3WVUyaG9KNS9pcmJST2g5VkYrR3crUTNwaFRNQjFLZjNkYjd4ZkJq?=
 =?utf-8?B?c05PdmJ4Z0RYVzV4T3FCcElKVll4YlNyZGJ2VDJhMkFsOERqWHlxdHR0a3Q1?=
 =?utf-8?B?V1BrMVU5R00yUUlBVm16MVo3S1lSaXF2T0I0amE5cDc2emlKVHNlM2lBUWV6?=
 =?utf-8?B?OWgrWC9pQkE5NVc4VkdtT2NTOWlITG5iaHN0QzhqK0dUOTlHblhrY1BoVEJU?=
 =?utf-8?B?L0ZaUkVKZ1RWQ3MwL0RscS9kY2NnalJTL0hTSHYvekk4a25FTFQwdUgvMEwr?=
 =?utf-8?B?RGhmMlpyK1BBaVJYTEcva3BrUjY1OGI2OFFwRlpJUUVCcWg3cDluNkRXb0RL?=
 =?utf-8?B?SmgwMHpoOEV0dDYwdUcrTTRqanY1cEtqdnN2MVIxWUtEQlYxRGs4YVQwLzRu?=
 =?utf-8?B?bHhzRXZVWXd2amhZL3luVzQ4V3lKM28rc25YbUdnb3A0VHVOUnNwQkxwMlhL?=
 =?utf-8?B?dENOWmp1V0c3dmFlUHFQcEVrZUNyNUhrcGNUTzRvN1ZyQ3BoUm16aXpZU1px?=
 =?utf-8?B?eElLcWZ5bExyVmV4cVc4QVlJTjJ6N1JrOGw3cnV0MUc3Y3NLTmRZKzlhK21R?=
 =?utf-8?B?M3hwMUNMWE13OVliODVpVDg1YjhIbU1BbEI1MmNOSityVmY4OWUzbDBBM3BS?=
 =?utf-8?B?S2xWQXQyRmNNSUVTOWJ4S2MyZVBjYXh4NXYwYjhGTjl0VzBET1R6VDFrQkNF?=
 =?utf-8?B?K25ua21Ec2pOTVRxQ2hZYzJucDF0RG8rbTBsNFp0YnhGSElRczlxUDhBbFda?=
 =?utf-8?B?VllOaVhFV2xzZUhJSTZkMXpGSTJHUGE2eVptZmlDd1pLZ0Q1QjBINFNwMVp2?=
 =?utf-8?B?SExjMm53cVVGSU5taFlJYU9pMm15TUpjeTluNHhuMytqMHFRYW8xNlluOEha?=
 =?utf-8?B?T3Y1dnpCZExicms4bHFkTkJlUDNxRGViZHVHeVZNSEl5NS80c2dZS055Zy8y?=
 =?utf-8?B?bmpjaEc4ODl5Mk80Vk1zdmljVGFIdTNId0RJYjVXU0tOT3lvdGk4eGdhTFZw?=
 =?utf-8?B?czNJV3d2WFZrOGhVYkRRUGlmcSsvdldMUXpwbzZ6YkpEWXZHeXhVNTVyV2x0?=
 =?utf-8?B?UHNYWkVWR0gxMC8rR2tDQjJPQ1Q5UHZsanRzdy9SbVg2eHJQUnJQdjNqL2lT?=
 =?utf-8?B?WlE4K3F0dlFnbW12TEx0c1dZZDZKWHBScnNnRXRGTW5EQkdzTjRtWDU4NEl0?=
 =?utf-8?B?OURHUU1Tb2laNGc3OHMxOTlhRjBtQzJXcS9zRTRCcC9sU2tkRGh1Vy9LbERZ?=
 =?utf-8?B?bXF3WUsxeFI0ZmZoY1lTMjlyRTFlcjVCWGxRWWFKL2I2aHJjVFFtellGUlZX?=
 =?utf-8?B?M21RdzkxWlJsUVZvMC90RFFPbEtnOUt6VjlEUHljRkNTMi9mSEZQa2VIYm42?=
 =?utf-8?B?aFlPQkZKaWVqSXNLdWhXS2k4L00vNnd5eVFwZUtseXRxNS9kUnVWU291b3Vh?=
 =?utf-8?B?d3BWSVhlV0l5eWdsVi9GckZ2ZklOOHJ1ejZLMkRJS0N3Nk45ZmJTUmZJOWF5?=
 =?utf-8?B?ekRFSEtER21rbGtsRHZPeUhycDlaZVBqektaUTcyRGlaTTlpa05BbUlwWHJn?=
 =?utf-8?B?Sm44TTVGeGVNT1FSQmtpaW52K21kZXpsVDA0RDVOS0tOdWVlUWl1T1NBWldU?=
 =?utf-8?B?RlVRQnR2NTRQMVk2dU8yeDdCN3l6M1lDaWx6eFB0RFZwM3pER3B6RklQWVQ1?=
 =?utf-8?B?cFMxazhTL2cvM2RQWlBXWkIySkdSR2JWazZWOHdmNUIxaXVTdjdSR0JsTDlI?=
 =?utf-8?B?KzVXTklwMHozN3N5dkpVdUJwNW96aTZoNFFhQjg1YzY1Y3FqYkFaWGxFemEy?=
 =?utf-8?B?c0l6YnErWDI3OU1oVVZUUm55dnpzbE5aMUlaaFh1YmVDQmVWMzI3WDVJMERI?=
 =?utf-8?B?bzJ5Z1JwbXBTUzBmTmpxU0d6aU1XUlZlWnYwc1hhY0o0NmZmaXo2VGJDN2F6?=
 =?utf-8?B?QXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f71ab2ea-551e-4ec7-fc5e-08db98cfd3c7
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 11:57:38.5822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f39ORbAZhMyczowYWzjZamFPvoGF92gt8efl6TLgsiTQIY51ibdPTKuiQ3FlczGKFMnjRAj50qJGmC9kkPTJ7xTRa7py43eVX5tXHE5MfIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7355
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 2/2] drm/xe/pmu: Enable PMU interface
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 intel-xe@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 09-08-2023 15:25, Iddamsetty, Aravind wrote:
> 
> 
> On 09-08-2023 12:58, Dixit, Ashutosh wrote:
> 
> Hi Ashutosh,
> 
>> On Tue, 08 Aug 2023 04:54:36 -0700, Aravind Iddamsetty wrote:
>>>
>>
>> Hi Aravind,
>>
>> Spotted a few remaining things. See if it's possible to fix these up and
>> send another version.
>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>>> new file mode 100644
>>> index 000000000000..9637f8283641
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>>> @@ -0,0 +1,673 @@
> 
> <snip>
>>> +static u64 __engine_group_busyness_read(struct xe_gt *gt, int sample_type)
>>> +{
>>> +	u64 val = 0;
>>> +
>>
>> What is the forcewake domain for these registers? Don't we need to get
>> forcewake before reading these. Something like:
>>
>>         XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> 
> based on  BSPEC:67609 these belong to GT power domain, so acquiring that
> should be sufficient.

But if i understand correctly taking forcewake is not allowed here as it
is an atomic context and forcewake can sleep and that is what I'm seeing
as well, might also be the reason why i915 didn't do that as well.

[  899.114316] BUG: sleeping function called from invalid context at
kernel/locking/mutex.c:580
[  899.115768] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid:
290, name: kworker/27:1


Thanks,
Aravind.
>>
>>> +	switch (sample_type) {
>>> +	case __XE_SAMPLE_RENDER_GROUP_BUSY:
>>> +		val = xe_mmio_read32(gt, XE_OAG_RENDER_BUSY_FREE);
>>> +		break;
>>> +	case __XE_SAMPLE_COPY_GROUP_BUSY:
>>> +		val = xe_mmio_read32(gt, XE_OAG_BLT_BUSY_FREE);
>>> +		break;
>>> +	case __XE_SAMPLE_MEDIA_GROUP_BUSY:
>>> +		val = xe_mmio_read32(gt, XE_OAG_ANY_MEDIA_FF_BUSY_FREE);
>>> +		break;
>>> +	case __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY:
>>> +		val = xe_mmio_read32(gt, XE_OAG_RC0_ANY_ENGINE_BUSY_FREE);
>>> +		break;
>>> +	default:
>>> +		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>>> +	}
>>
>> And similarly here:
>>
>>         XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>>
> 
> Thanks,
> Aravind.
> 
> <snip>
>>
>> Thanks.
>> --
>> Ashutosh

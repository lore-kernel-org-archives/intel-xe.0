Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88DBC83F2D
	for <intel-xe@archiver.kernel.org>; Sun,  3 Sep 2023 13:37:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FBE210E03B;
	Sun,  3 Sep 2023 13:37:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55ADF10E03B
 for <intel-xe@lists.freedesktop.org>; Sun,  3 Sep 2023 13:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693748223; x=1725284223;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IjJUSeYCwnL/RqhyyXrAIpBYoxkyavg1nLFIw0Vlpg0=;
 b=ma3WuVPBCYQW1VsHP3fSt4WM1+ko3hxP5PNfM2ic7dmfsHnYjLFkig/T
 YmCn6GUX/UE43mE5JRyZ+KDHbh1EUa8Lawt2NX9A5pnzOM3UFf/kcOOvl
 fhMGqa4n0iTTmp/bFlBAtsZnHWsJTWYDxbKvNb2wOTW86qvIZMav8MKNc
 bb1KBE7RSWPKqLpn+V/NoT7JEmeVyJC+CtmI723mhrG+jEwgp5stygMtA
 Jxn0IKyh7SL+WtCQ8ftUMmJFK+Lyhmq4RhVzms3MFkkMT2ZrC5T9Chhp8
 WcbewvlfSEKSkYnOB0NMBPHXJGkrDcQ0AytVCHz9NAHGa5j59CWN9jlWB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="356766195"
X-IronPort-AV: E=Sophos;i="6.02,224,1688454000"; d="scan'208";a="356766195"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2023 06:37:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="734046867"
X-IronPort-AV: E=Sophos;i="6.02,224,1688454000"; d="scan'208";a="734046867"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Sep 2023 06:37:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 3 Sep 2023 06:37:01 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 3 Sep 2023 06:37:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 3 Sep 2023 06:37:01 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 3 Sep 2023 06:37:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bFeFCe8Af70pMNNDE/WdTjLAyiXsFz+Yr15V6Ou+rEotVfVo8xwF91nNFKeBMHYKcaQVQiwQa8E8ziAzs7Mj3b4GuZd1YLSE2TmME8JKOjsX8tMGQM+CkQRuVN+iSzBf3F3D8WCC99el1T9IsqT0RKpbSTZ/0bsPlSrDDR2IWKXzL+5ajhW6vrQW6j98eoU7SSyIV1AcH9eLB/DgobHh5RUwpjD4VgtgMt/nbkAfrOAaKSmMqICrB2SZWBgkAi8EMo3vhRj6HRewIjm/ZTw2ronKlsBnSsYLXIGFRUVWvLsAgwBT16ebClUK6PXH5aeXD7uVxQNnlA/vDmx5smRxIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7xyvWIdbu5L7To35dY7eMZjXeF3qObc3NUHfXvbaU+4=;
 b=ZA0JVn4RdCfKqoClFIvlhWJkAQhSwgP1rnK4ljhKkZaWMF0+rtZZIB5Yz6Dq4Z5yD5omOv091VMX4FyKvgT8ctv16NiO8M9Mt9cddj7Ggnddhc5gl6FyfhaXU8fj1TDjJ7rob2okJL8uK7ubvhvfmbDxABJ3NkD+qznONEVz0jDNGwzPCYffb8q2rDyrOToxjeu2Pw43rpFP4+8hjn3U/N09ZaW0AjHh59F44WrmQk+M/8W+jqDf7/+1UZ80oOx5r7LJFztqKXGGptn1vxxPls3QvfgHkugPoRSqz2ooCkR0SjogdH7xcrn+AxjiHF7j52pGx55ZLq6PMyMHDa7QTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 PH7PR11MB6007.namprd11.prod.outlook.com (2603:10b6:510:1e2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.28; Sun, 3 Sep
 2023 13:36:53 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::3382:a13a:ef37:f584]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::3382:a13a:ef37:f584%5]) with mapi id 15.20.6745.030; Sun, 3 Sep 2023
 13:36:53 +0000
Message-ID: <286c8c28-7bb1-f6c6-d8ed-da4875ffa105@intel.com>
Date: Sun, 3 Sep 2023 19:06:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230901121545.361436-1-sujaritha.sundaresan@intel.com>
 <20230901121545.361436-3-sujaritha.sundaresan@intel.com>
 <ZPJLIlS7K7ey17kL@intel.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <ZPJLIlS7K7ey17kL@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXPR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::14) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|PH7PR11MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: 744ba014-8785-4d69-0ada-08dbac82d58a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I3+ZR6YwGI34MJxxWTShFczRV4lOhIkwNW7yxyHk4GeYQnyalpDCWcVTtLiI6RNOorA6lkRnrVus8wWRv7H0q+VRSW0CfJ80QzgF/EkRxfJsqKzw1gbPTzOA6q04Qr/78bAB38E3jR1ynQ0R7E/TIWb0/m08k47NF5gr/l4bIlBGTgLUrXvce9pwpCLEOGB8tPlM1uSz1XkKR/8Zn8WgkNrYQLETqWwdniD1Z4lKj8fB2OU9GntEoyl/aVxUtcPK4crkONjq6uLFUSMRrZXbqfi2CYe0gcZaPAMdungPO5NyKb1s2J/8p5Wg5kNjlngQHfPxSBcVhDpRGmCo1uV4P4RqseBiirS+6KBbyeiP5IS7+EXUDgS7LDnXhEdCrmoeZWf69UnHZcAs7MZHK8tvbtA8tJAT3Goz+IOmHiGRQqbS1pVabNAZp7zsVByIiOh7/YiKiPk3RC9C9AHG6iKiWMPuIujh7f06YDGgYykWsz7a5jZZDq+PLr1H9o+LkWsOJkkMQcOqtNI8HPpFKSToqbzZNnkJjxnnf+iSk54Kkcb0aBy0LcX4UtQ2bqOtmAKPEoAbyBkPh23GKXp6KzAbmcwKhzqULWYtjIDbIuR3/a1MAjWG9i1VVL37SDXTV9TBtTLr4qJqrM7lZq6aquU5jQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(376002)(136003)(366004)(451199024)(186009)(1800799009)(31686004)(66476007)(66556008)(2906002)(36756003)(66946007)(37006003)(86362001)(31696002)(6636002)(316002)(5660300002)(8936002)(8676002)(6862004)(4326008)(41300700001)(6512007)(2616005)(38100700002)(83380400001)(26005)(478600001)(82960400001)(6506007)(6666004)(6486002)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjREMGQzenhSa2tocFQ4TWpURERTanZ4dHYwYjV1bDJHSDVocjFCWlFSZ255?=
 =?utf-8?B?VGt3aHdNQTErR1dkdnpJZnJOenE5cVBHdU1Ob1ZjQ3JZbkFySUY5VWR1OHFC?=
 =?utf-8?B?S08xMUlSOHZQMXVKajdyYnViYzVSRndjQytmaTcwRE1keTRRUUVrZjFhVkVE?=
 =?utf-8?B?aCtEdVZ6NU5IdGFQT3h0cElBY0o3c21CRDhIL1prNFlEbjhidEN6VVBCNXg0?=
 =?utf-8?B?cWVEd2xIS2RmZ1REUDB6Wis5YmJPWDhBVjZhaURDY05yVy9qOGxvalByNG40?=
 =?utf-8?B?dkRpaWJqWUVXMmo5Y0srWWlZY0tKUVBzMmlNaE05ZTFjdjhMS2VTN1NIQk8w?=
 =?utf-8?B?RlhhN1ZjcTA1OTNOSU5DWmI2eDN0UzJiWENSQkJEQnh4SWF4d3JaTFNiNDVk?=
 =?utf-8?B?MXliMlhRa21BdTdpcFBKeU9TaVM5MGwxL2NobllpOTFOY0NQWW04eGhndHZU?=
 =?utf-8?B?RmNFZTl1RklteDVpZHd5YktJUkVydURnWnNqQUdhbEtnZHVWZTN0Y1VHeTdN?=
 =?utf-8?B?V1g1ejhhVXAzUTFFd1ZnakpjUDlRcmwyVzZ6bGxhOGNFNVJDdWtpRzE0SWlL?=
 =?utf-8?B?LzRGWXo4bm1kNm05eHlISHJKY091NWRjakhOWWlQNXUxdDB3WERWaEphOFkw?=
 =?utf-8?B?aDFUUGFoU05teVFTRnlWWkNudi9EbXFLN3VSMU9XZkNRYThSR1Mzb2xMOFl1?=
 =?utf-8?B?eXh4dlcrQnozdWJmRmF6SFBaQXRIZXQ4RVRRcmJOUC9YZVV4cy9GbTE2eFZh?=
 =?utf-8?B?QzQvRmFTTjVWdEJEa0tXTExLcVV0emRlUnBTY3l1UDQ5bVRiNjl6MjJYT0Rn?=
 =?utf-8?B?ZE5ITzgyRHBnYnJYWGZwdVUxM3RvMzFUVEdOYjNzcHEvdmZDMTBtRG9jeEUx?=
 =?utf-8?B?cXZWRkM5N08yNHBROEhkKzk1Z2I5M1dFdlVtbkdLVkhLZEhtc1NQL3Q4ZXBZ?=
 =?utf-8?B?S3lhZmt2RjAyNTNjaHVPWG05aFd2VVQ5Wi9Fb3J4dzd0bGlPQ2xKQzg1azJT?=
 =?utf-8?B?ZnJ1UTVqZG9id0pYb1Z5OUpPTFBXcnBOOHNUcmlnd3NQWnNxWXZ2OXJRZGox?=
 =?utf-8?B?K3RsbUd3aGZURCtualJyc0Zvb01oNSthOHJXN3FoN3BVUDlpK3VhVEhHT1Ry?=
 =?utf-8?B?RThTTklVMWI4UnF6ZEw4OHBGYWlnYm05NzJqeVR0b3ArZWtOV29GUjdDSUxz?=
 =?utf-8?B?V21uSjJBSk4weWZGemVqZDBFWWp1d0svcmlQcDQ4SnNVeGwxUE9kN2tlY2s3?=
 =?utf-8?B?cTNveE1TMGptdVpwNXphWnROdTBmTng4RkpFMW11YVFmUHh0dkNIYnBFUXZr?=
 =?utf-8?B?VFFndGdCNEYxNDJiemgwVUlTQ2lKVGpXSGhDak5IZ2tDRDZlSlYwbUxmMUI3?=
 =?utf-8?B?R3dqWEkwK3prb3pRWU92RjRWa0FDc3BnbXp1RytRWFo5REVmV3I0MUFOWlM1?=
 =?utf-8?B?bTl5Y0ZLVjQrdVQ4a0ZaTXlaV0QrMGdJWnNRbXEzZ1hvbTVTOGRUUGNtMkM5?=
 =?utf-8?B?SlN6RFhqSjAvR3I1Q3U3WG01b1Vtc0JUdzVjemxNQnZQSVBQWnRicmtRVEtC?=
 =?utf-8?B?bkxxVVhyeitYc3V5YXlZNHZnR3N0MithcEdsZVROVFhETk9YWDVPbTVhUmM4?=
 =?utf-8?B?U1JNaG1yRjkyMzJkYjRtcWp3dFNVUy9tSHFISWEzUHJBaGFodzBqQStrYVJk?=
 =?utf-8?B?WWVCbTV3aTAxVHN1dXRwUjJ1SURPT2VqbWFTMnY3dzV3N29JQW9LVURMK3dZ?=
 =?utf-8?B?ckRQZm5zVEhGY0taOGcwb3NyS3ZhMXRzbjU3cU9RaFRqazM5NXBSeVk0NEsx?=
 =?utf-8?B?emszNnRjTjFicFhmcThCb0c4eGVUS1F6VEhVdGd6bTViOThtbHYyWFRZcWNR?=
 =?utf-8?B?K3ZHczZjYUQvQzh0Mjgyd2Q0RTc1ZWF6QlRsOGMwcktsL2lQY3ZIU3dTMHBz?=
 =?utf-8?B?TTZpVHEzemI3c25SKzZMSEc4Uk9lVkhzemRNT1N2a2hFU1Q5RW0zUWp4ekxh?=
 =?utf-8?B?T1BLZkhSSVlnZDlQaDBwRTVjbTZybkhycG5Id0NYUVNDajY1a1kyQTJMN0I5?=
 =?utf-8?B?MzNyblQ5STFYZ3lRMHd3Z1ZadldlaXk1dmZyc3RaMU5vRXdWWEpyNFA1S3Z1?=
 =?utf-8?B?NUx6VjNuS25XeDNzbm9yTnZjUlZzbnFOcDg5SndQdHpwd09mb09ocThJTklh?=
 =?utf-8?Q?BYJKpajsMMGVpgR5JP2+Bww=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 744ba014-8785-4d69-0ada-08dbac82d58a
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2023 13:36:53.5026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWm6zzr9Ltdzk6Dfn/3Udbb6+IvoGi7RHadth7P18PsI/Z7EA9eZj/EfV9LYkM8wi1H8KDzsmYwamyOZ2oIppM1O+a6FxVDiNnzIuOphZ0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6007
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Add base performance sysfs
 attributes
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


On 9/2/2023 2:05 AM, Rodrigo Vivi wrote:
> On Fri, Sep 01, 2023 at 05:45:44PM +0530, Sujaritha Sundaresan wrote:
>> Add the following attribute to Xe sysfs
>> - base_freq_factor
>> - base_freq_factor.scale
>> - base_freq_rp0
>> - base_freq_rpn
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_pc.c    | 116 ++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pcode_api.h |  19 +++++
>>   2 files changed, 135 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index c03bb58e7049..6a139d1dbf66 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> again, this has nothing to do with guc_pc.
> We clearly need a new component to handle the frequency.

Right. will look to define a new xe_freq component

Thanks,

Suja

>
>> @@ -20,6 +20,7 @@
>>   #include "xe_map.h"
>>   #include "xe_mmio.h"
>>   #include "xe_pcode.h"
>> +#include "xe_pcode_api.h"
>>   
>>   #define MCHBAR_MIRROR_BASE_SNB	0x140000
>>   
>> @@ -37,6 +38,9 @@
>>   #define GT_FREQUENCY_MULTIPLIER	50
>>   #define GEN9_FREQ_SCALER	3
>>   
>> +#define U8_8_VAL_MASK           0xffff
>> +#define U8_8_SCALE_TO_VALUE     "0.00390625"
>> +
>>   /**
>>    * DOC: GuC Power Conservation (PC)
>>    *
>> @@ -642,6 +646,112 @@ static const struct attribute *pc_attrs[] = {
>>   	NULL
>>   };
>>   
>> +static ssize_t freq_factor_scale_show(struct device *dev,
>> +				      struct device_attribute *attr,
>> +				      char *buff)
>> +{
>> +	return sysfs_emit(buff, "%s\n", U8_8_SCALE_TO_VALUE);
>> +}
>> +
>> +static ssize_t base_freq_factor_show(struct device *dev,
>> +				     struct device_attribute *attr,
>> +				     char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	u32 val;
>> +	int err;
>> +
>> +	err = xe_pcode_read_p(gt, PVC_PCODE_QOS_MULTIPLIER_GET,
>> +				PCODE_MBOX_DOMAIN_CHIPLET,
>> +				PCODE_MBOX_DOMAIN_BASE, &val);
>> +	if (err)
>> +		return err;
>> +
>> +	val &= U8_8_VAL_MASK;
>> +
>> +	return sysfs_emit(buff, "%u\n", val);
>> +}
>> +
>> +static ssize_t base_freq_factor_store(struct device *dev,
>> +				      struct device_attribute *attr,
>> +				      const char *buff, size_t count)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	u32 val;
>> +	int err;
>> +
>> +	err = kstrtou32(buff, 0, &val);
>> +	if (err)
>> +		return err;
>> +
>> +	if (val > U8_8_VAL_MASK)
>> +		return -EINVAL;
>> +
>> +	err = xe_pcode_write_p(gt, PVC_PCODE_QOS_MULTIPLIER_SET,
>> +				PCODE_MBOX_DOMAIN_CHIPLET,
>> +				PCODE_MBOX_DOMAIN_BASE, val);
>> +	if (err)
>> +		return err;
>> +
>> +	return count;
>> +}
>> +static DEVICE_ATTR_RW(base_freq_factor);
>> +static struct device_attribute dev_attr_base_freq_factor_scale =
>> +	__ATTR(base_freq_factor.scale, 0444, freq_factor_scale_show, NULL);
>> +
>> +
>> +static ssize_t base_freq_rp0_show(struct device *dev, struct device_attribute *attr,
>> +				  char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	u32 val;
>> +	int err;
>> +
>> +	err = xe_pcode_read_p(gt, XEHP_PCODE_FREQUENCY_CONFIG,
>> +				PCODE_MBOX_FC_SC_READ_FUSED_P0,
>> +				PCODE_MBOX_DOMAIN_BASE, &val);
>> +	if (err)
>> +		return err;
>> +
>> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
>> +	val *= GT_FREQUENCY_MULTIPLIER;
>> +
>> +	return sysfs_emit(buff, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(base_freq_rp0);
>> +
>> +static ssize_t base_freq_rpn_show(struct device *dev, struct device_attribute *attr,
>> +				  char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	u32 val;
>> +	int err;
>> +
>> +	err = xe_pcode_read_p(gt, XEHP_PCODE_FREQUENCY_CONFIG,
>> +				PCODE_MBOX_FC_SC_READ_FUSED_PN,
>> +				PCODE_MBOX_DOMAIN_BASE, &val);
>> +	if (err)
>> +		return err;
>> +
>> +	/* data_out - Fused Pn for domain ID in units of 50 MHz */
>> +	val *= GT_FREQUENCY_MULTIPLIER;
>> +
>> +	return sysfs_emit(buff, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(base_freq_rpn);
>> +
>> +static const struct attribute *pvc_perf_power_attrs[] = {
>> +	&dev_attr_base_freq_factor.attr,
>> +	&dev_attr_base_freq_factor_scale.attr,
>> +	&dev_attr_base_freq_rp0.attr,
>> +	&dev_attr_base_freq_rpn.attr,
>> +	NULL
>> +};
>> +
>>   static void mtl_init_fused_rp_values(struct xe_guc_pc *pc)
>>   {
>>   	struct xe_gt *gt = pc_to_gt(pc);
>> @@ -925,6 +1035,12 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>>   	if (err)
>>   		return err;
>>   
>> +	if (xe->info.platform == XE_PVC) {
>> +		err = sysfs_create_files(gt->sysfs, pvc_perf_power_attrs);
>> +		if (err)
>> +			return err;
>> +	}
>> +
>>   	err = drmm_add_action_or_reset(&xe->drm, pc_fini, pc);
>>   	if (err)
>>   		return err;
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 837ff7c71280..da4114bfaa7a 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -30,6 +30,25 @@
>>   #define   PCODE_READ_MIN_FREQ_TABLE	0x9
>>   #define   PCODE_FREQ_RING_RATIO_SHIFT	16
>>   
>> +#define   XEHP_PCODE_FREQUENCY_CONFIG			0x6e	/* xehp, pvc */
>> +/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0		0x0
>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN		0x1
>> +/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
>> +/* XEHP_PCODE_FREQUENCY_CONFIG param2 */
>> +#define     PCODE_MBOX_DOMAIN_NONE			0x0
>> +#define     PCODE_MBOX_DOMAIN_GT			0x1
>> +#define     PCODE_MBOX_DOMAIN_HBM			0x2
>> +#define     PCODE_MBOX_DOMAIN_MEDIAFF			0x3
>> +#define     PCODE_MBOX_DOMAIN_MEDIA_SAMPLER		0x4
>> +#define     PCODE_MBOX_DOMAIN_SYSTOLIC_ARRAY		0x5
>> +#define     PCODE_MBOX_DOMAIN_CHIPLET			0x6
>> +#define     PCODE_MBOX_DOMAIN_BASE_CHIPLET_LINK		0x7
>> +#define     PCODE_MBOX_DOMAIN_BASE			0x8
>> +#define   PVC_PCODE_QOS_MULTIPLIER_SET			0x67
>> +/* See PCODE_MBOX_DOMAIN_* - mailbox domain IDs - param1 and 2 */
>> +#define   PVC_PCODE_QOS_MULTIPLIER_GET			0x66
>> +
>>   /* PCODE Init */
>>   #define   DGFX_PCODE_STATUS		0x7E
>>   #define     DGFX_GET_INIT_STATUS	0x0
>> -- 
>> 2.25.1
>>

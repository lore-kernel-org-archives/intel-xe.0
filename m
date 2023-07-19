Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3C4EB64DA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jul 2023 06:59:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8884110E406;
	Wed, 19 Jul 2023 06:59:46 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E5D410E1C1
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jul 2023 06:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689749984; x=1721285984;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BBF4hD1NEPhlt0YrZix90EMUEHvKgAM4DNFB7TVjVVI=;
 b=Ahelk+MzfeYml6LyROLLqhtUATnkXjGgz0zvQYMUjdfizEw6i8A5dDF+
 FaJGc1ManvHUjiUd/KrfdGu+s/ubz2tK0+k8Ev0ba7oVgQFFBjw647pth
 qoa+mcc8NGRdBbcdP0oYui06vb1XD2/MMBffmW5CtYlAitY/WI1yZCaTU
 +RKIgZ2P6HZT7DO9y8BRaezju/TYsKaUx8I6Z1yVBL8+Ug9k8cnMJPoKi
 7IpytebO6b173O5+5QkZdaSYCm8OyUfkwKxiqTxf7+I4ZJ+rxQMg2vMdW
 EbfZbTJwrAFUZhD2nOSjOLck1C9CgI6v2tHV+V3hRo1a3/RKG0cDDqP3N A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="397240147"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="397240147"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 23:59:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="753602552"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="753602552"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 18 Jul 2023 23:59:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 23:59:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 18 Jul 2023 23:59:42 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 18 Jul 2023 23:59:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UHIr2t7+YUXeOtYR0U0E6pg7saukz61rnLcobMREaQVpS71MdmL5cN9Gv0pFWVsgF4ckITNn0cVqPo3OOo+ePe3Tq4Q4X5nM0osrJ4dB419AJaBq8A5AZ1QXsbLLOuMHO7c4uzbSOwxVXYA+UMtlm/HbR0lNTmmHQN7x9Epwo6O4PSPkvUi9DIUAjGv23e5in90Wi8fnmsuHVqqAvPkoPp9FgasdBFhS6sAJaA2RqWQMyAQ9a87qknJ/NuJQJNeG357ZCx6vNuGScrOiqy4XVlGVwfi9dHFjb+9WmXpA+4/hHAsuJDNw1ZIFr5pyiGEK/3KNRdjKNiGUjiMs3Jwf0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YeZpsO32ozhcL/vVSgod/+gqMh+CvU00PgmRi+Yg8m4=;
 b=S3Kjzl0HcZIfrsh3+Cqhu7AGDO6mgtZ+XAT3k1VSLSRIZmJXD0WUXB1h9H1QgMUwofz5DSix5Zly+mcluzSBzIY7Qr/U0UhySnQHQ0tf6w0OvBzBTahsZhj4auGs1fthVpGl8kg0aPKi3xB4Y1RwejbkGp3CxgAAA+NTEZfijObkalKBWXJHLJXPDx71WG/yp4aoelxQbYWBHpygtnboigC9p/J+ryt6U3pKkXsgiWeOFBuDJmK7Rzrtsi9c5Mx0b7W56kDz/0UJfPnQcvzzjrfgkI7W2IymUx7euByazkUQlgD5BR+xylzKKNse75fAQnB4baAIZj2Bd3a14YHGPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by CH3PR11MB7761.namprd11.prod.outlook.com (2603:10b6:610:151::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.23; Wed, 19 Jul
 2023 06:59:40 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153%7]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 06:59:40 +0000
Message-ID: <c6664a6f-8034-b094-1f26-1980c57018b6@intel.com>
Date: Wed, 19 Jul 2023 12:29:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230627122113.1472532-1-aravind.iddamsetty@intel.com>
 <20230627122113.1472532-3-aravind.iddamsetty@intel.com>
 <87mt09daqu.wl-ashutosh.dixit@intel.com>
 <a6fbb435-6383-772c-703d-183f26a8144e@intel.com>
 <87a5w8cvmr.wl-ashutosh.dixit@intel.com>
 <04ae6811-9bc1-c66d-6cb8-640bfd8a9c7b@intel.com>
 <87ilahiz8i.wl-ashutosh.dixit@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <87ilahiz8i.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0223.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::16) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|CH3PR11MB7761:EE_
X-MS-Office365-Filtering-Correlation-Id: f9c35366-388d-4a69-4bfe-08db8825b8a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BrG1DkkKVbWYdNREgQPPSnrD8B4Il6I0Y0QzMtV/egGhQOItzdZrRPweMr4sP4G5eLpWB9B8wu9QAHy7SV0Ivl3PGUMnYYu+IjNMkvP3ikYZhcvO9Rp69tIIvkwL995qoW8ZEF5c8zED2Xy6DClgWmvVVHUQNHrWv6yzL9oHMVtIzmKZ1LMvT6m8QHM9/dh2zU6iKl750K6G4IHUd2ZEKmKS1iEdU6qvk47BNjYWkkscND6D3+3Bt+81YQx9DJz2IX1xeHHc3FoLByfNUqaTFuVgQW5Yz8OoSw/X1PKkkkqE7DvZUDsCyb4JVbwkDXMZ0wuz9oZ936VRcKBKUhTRGl32wr1LO9mpowKK8ncHOVwd5p0YUdCOVEAb6lBbpXqyCUvHZsO248qklSLtLmPjuqKxblm9UaCSc+1mVh/DVQLKLCRjFOG30FI4qKnnpoUgWgdlw8fDOCc8TxHBMK9+RsEoqMdZ9z5dFKz2W/9juJwCu6F8sz/9FS9vEgD6Vx/P0Wy45QM30nRbPHjuazTU2cJFPFSuBgqzGGYcpgjAzJ8ZZ8Iyqd18l9JmFgUm04K1D/q/6xY3o0TA9s/nD49hUFf0unXKmVSW/WkMBn14b1EOMy7vZq2lQE9zQUTZQq5Meyf7KkhhuHK/JgOPeNkfNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(376002)(366004)(346002)(396003)(451199021)(31686004)(2906002)(8936002)(8676002)(66556008)(66476007)(66946007)(6636002)(4326008)(316002)(41300700001)(6862004)(5660300002)(6512007)(6486002)(6506007)(53546011)(26005)(186003)(36756003)(478600001)(54906003)(107886003)(6666004)(37006003)(83380400001)(2616005)(82960400001)(31696002)(86362001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTI5cTkxbldSb2t5dGVHVTNJcGNqTitjY2VkYnJkdWVidFdIcm5Qanh3MXRR?=
 =?utf-8?B?OU1xVTMzZk82Kzc5UE1mMDROSXZNRmEyNHYvcnk4bE9IdXh5OHJGOTNGTTZ5?=
 =?utf-8?B?VVYrY0IxL0lBa2xRbG14SXpjY1dZcUI5VnI3WGgvQm9FMHcrcUN3Y3VFUzAv?=
 =?utf-8?B?aDRwQVlCWnplZnhlZUZad1pyOExDME5jSWFVSjgwd1d0Yk55SmZuOEVKVmMx?=
 =?utf-8?B?VFQxM015R0JlQjI2MU9TeHMwUmxYbVMvUzE3YWQ1Mi9uU2JIMGxGZjR0d01x?=
 =?utf-8?B?RWVOK294RVBRNVVWZXJJMEkvRHhJWDI4eERmOGI0SjYyeHpHM1graHpHVzgx?=
 =?utf-8?B?V2daN1liRllacmJrTlVsWVlKZUVpZFBIUGwvZWZ5ckFJUEk1NWFTRzNVTkxS?=
 =?utf-8?B?VkVkYTdXbk9YVzFHdS9mWXlWRnFuT1JjeEFtclRmcWVVNXRzYTRObWJXenEw?=
 =?utf-8?B?cTlBVk1QcC9ldHhCaW55aVB6WHBQbEV4Q3BiVDZtakhqN0RsSzJKMzh0aEZZ?=
 =?utf-8?B?bmNEZ0NRN3BJcUpQeFlJem1yT2hWYVEzd0pxM2xjOE1mbzlYdFcyMGtEMzBL?=
 =?utf-8?B?a1FjVFE0TkpqWUh1bXNGOWtJK0ZFZzlWUkdnSmRkanJjNVMwZTdERnhqMXEy?=
 =?utf-8?B?UFBDMjN5K2JNSldxaGV1VlJwMlZ0b09TT0NvbUd0LzIrckJaMWlpSGM3RXF5?=
 =?utf-8?B?dHQ3M01HOWg5dDU0bzYvSXYrcWNJbXh6TTVJSHRzeTRUeHRoOHprbEFNMkRv?=
 =?utf-8?B?WWRtZHQ0TVVWUitTdnZLNGpZTHZDS3dRa2lSNmRMb1lEclh1Q3BldDdjTm0v?=
 =?utf-8?B?Y0RSTUxuNG1sSUZaSWE4ak9OVUY0YU9RVTYzbVBXVWw0eXVRZ2g3MlZiN0hL?=
 =?utf-8?B?UXRvdk5RWnZyOE1Jd0dveE8xS2ZUekg5NzJ3TkM4ZEFOaG1BeVM1WFpxQjZu?=
 =?utf-8?B?SERBVW53cURYTjR2TFpkRlljSEgvanNQRFhEOG5sMHlMODdsZTR5R1Q3VUt2?=
 =?utf-8?B?YUQvU2J2UCtPeE5YSGJiTEdqMnQvQmV5NzYwclcva2lqWSsyT1NCNEIwRFBk?=
 =?utf-8?B?ck1DSUhNZk5MYlNtNmxQNVZJSVRmZFNnZWhPZWkxc2pPR0ZhSlNFNVBqMDg2?=
 =?utf-8?B?Q3U3YytRYTFQRFJscHFMcDdGN3YzV3BBekhhSGdMTTV6aE9JRm5jaXdYdmxF?=
 =?utf-8?B?Y3VKVytUcy9HcjdGdHk0ZUJIV0lneWRCQU94bkZJN0FEbHorY0JEbmJuTUJs?=
 =?utf-8?B?VGl0Zk5iOUp5RDFvM2pTdTBsMS8vSG1ldFE1L0hROXpqYm56bzdYVFhWVWRq?=
 =?utf-8?B?ZmQxc3NyN1l0cDBycDUxSEtZOXJvSmt5c0lEaDRLS1lEOUN2YVFLUmZUQ1RQ?=
 =?utf-8?B?Q3IrVkY4WnQ2dGNsZVV4R2NkeWJXREtLWFNlWiszVm1aU3FwVmY1aXpNMGY5?=
 =?utf-8?B?MitFdVBxL1dCaVU1ckRFbUFndjk3ZFYxa0NLd08xb0F1WDFwa2pZVzFPUjFz?=
 =?utf-8?B?QWUrREtkeVFFUlFaai9XdW91c2NoUEZGdHdxOUoxWWNXZk9JNExrUUJQaHU5?=
 =?utf-8?B?WU9pM2IvVDNydUNLQlp2K1M5M2xGekNCdEtHWE41Y09BSWc1SEhtb1A2VVRF?=
 =?utf-8?B?d2JrbW5UeW0vcmRPa3ROajUvT2NkRndhZGRybUJ4VkdEUVFSNmU2R0xwODZK?=
 =?utf-8?B?YWxrcjVxaFBqdHBoYjlwYTI5cnhKOEM3bFZ5S0pLL2pzVjdwZjJZbmtjbEVQ?=
 =?utf-8?B?OHZpK05rR0YvbnlHWHdnYVhkVkhVU0d5OTludjN5TmZ5V2pzTVhIVHNwWm1T?=
 =?utf-8?B?ajh3eTBMRWt1a05JOVA0QmdRWHMrRmRJMlBNbFZtU1AvNDUwdFJWWXpMNlpk?=
 =?utf-8?B?VklxNS9GSWFHR21MZktLRFd2SFpwT29xQUlLVnc5eGVTaTV5UnJ6UFdtb3Fs?=
 =?utf-8?B?K2M5N0NDLzRNU2VJUFowOU9xYVhZbTV3VTNQS2ovVU9ObWE3OStFRGdFTThZ?=
 =?utf-8?B?TEs2WkZLQ1ZyVk1XTUZmUm5UTE1ZUVlBZUd2REpwWWdRS21VeDYzWE9nR2Z3?=
 =?utf-8?B?Ky9peHROU1FoWURVTnpFM0d1TnBGUU5pTDNWNmcwV2gwWXIrTnVWWE5DcDZr?=
 =?utf-8?B?UFNmcVlQTzNEYnZIcnZSNExzNElBOE1sNnVDWEZtaWQ5aGEvSjZzdm5xYmdS?=
 =?utf-8?B?NFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c35366-388d-4a69-4bfe-08db8825b8a7
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 06:59:40.0936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HbSs/a3/vmyd5wV5yZ7Zo/QNYlYXQGFJMwI7zqAUvDtWKxbVColcyp/5KnvxRvnvVUJ+VM8jsOTgmrT0QvA69BPNRM3XDCONdnb8Y+P4Jb8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7761
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe/pmu: Enable PMU interface
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



On 18-07-2023 10:37, Dixit, Ashutosh wrote:
> On Thu, 06 Jul 2023 20:53:47 -0700, Iddamsetty, Aravind wrote:
>>
> 
> Hi Aravind,
> 
> Back to this review.
> 
>>>> On 06-07-2023 08:09, Dixit, Ashutosh wrote:
>>>>> On Tue, 27 Jun 2023 05:21:13 -0700, Aravind Iddamsetty wrote:
>>>>
>>>>>> +static u64 __engine_group_busyness_read(struct xe_gt *gt, u64 config)
>>>>>> +{
>>>>>> +	u64 val = 0;
>>>>>> +
>>>>>> +	switch (config) {
>>>>>> +	case XE_PMU_RENDER_GROUP_BUSY(0):
>>>>>> +		val = xe_mmio_read32(gt, XE_OAG_RENDER_BUSY_FREE);
>>>>>> +		break;
>>>>>> +	case XE_PMU_COPY_GROUP_BUSY(0):
>>>>>> +		val = xe_mmio_read32(gt, XE_OAG_BLT_BUSY_FREE);
>>>>>> +		break;
>>>>>> +	case XE_PMU_MEDIA_GROUP_BUSY(0):
>>>>>> +		val = xe_mmio_read32(gt, XE_OAG_ANY_MEDIA_FF_BUSY_FREE);
>>>>>> +		break;
>>>>>> +	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>>>>>> +		val = xe_mmio_read32(gt, XE_OAG_RC0_ANY_ENGINE_BUSY_FREE);
>>>>>> +		break;
>>>>>> +	default:
>>>>>> +		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>>>>>> +	}
>>>>>> +
>>>>>> +	return xe_gt_clock_interval_to_ns(gt, val * 16);
>>>>>> +}
>>>>>
>>>>> A few questions on just the above function first:
>>>>>
>>>>> 1. OK so these registers won't be available to VF's, but any idea what
>>>>>    these counts are when VF's are active?
>>>>
>>>> VF's cannot access the registers but the counters will be incrementing
>>>> if respective engines are busy and can be monitored from PF and that
>>>> will be across all VFs.
>>>
>>> Ok, good.
>>>
>>>>
>>>>>
>>>>> 2. When would these 32 bit registers overflow? Let us say a group is
>>>>>    continuously busy and we are running at 1 GHz, the registers would
>>>>>    overflow in 4 seconds (max value 4G)?
>>>>
>>>> Based on BSPEC:52071 they use MHZ clock assuming the default 24MHz, it
>>>> would take around 5726 secs to overflow.
>>>
>>> OK, overflow should not be an issue then. Though I have seen 19.2 and 38.4
>>> MHz in OA. Also, if these are OAG registers, OA timestamp freq can be
>>> different from CS timestamp freq, so not sure if that needs to be
>>> handled. See i915_perf_oa_timestamp_frequency() in i915.
>>
>> so that is handled by below calculation
> 
>>>>
>>>>>
>>>>> 3. What is the multiplication by 16 (not factored above in 2.)? I don't see
>>>>>    that in Bspec.
>>>>
>>>> These counters are incremented based on crystal clock frequency and we
>>>> need to convert to CS time base hence a 16x mul. BSPEC:52071
>>>
>>> Hmm still don't see the 16x mul in BSPEC:52071. Anyway.
>>
>> lets say the frequency is 24MHz so the counter increments every
>> 1333.333ns(granularity) and corresponding cs timestamp base for this
>> frequency is 83.333ns, 1333.333/83.333 = 16 and this true for rest of
>> the frequency selections as well. hence we multiply the counter x 16.
> 
> OK, I finally see in Bspec:71028: "Unit in GPMusec. Refer to Timestamp
> Bases for details" which is a pointer to Bspec: 52071. So the 16x multiply
> looks correct (and these registers are not running at OA freq otherwise
> we'd have to use i915_perf_oa_timestamp_frequency()). Hopefully it's
> correct. Thanks.

Thanks,
Aravind.

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599C2EE49A3
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 05:03:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C57610E14E;
	Tue, 22 Aug 2023 05:03:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8682F10E14E
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Aug 2023 05:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692680624; x=1724216624;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5VQ6EyQSijJiLQ9pES29My2qMjUieenVqyJfeYsFTqg=;
 b=MFa0zZz0MbJbNJGtFhnHVP9bR93W+39I1BC9vxoq3J0zybl7E4vWg/d5
 XuJImygccxkJcsaNxkhbJPntQWVSITNpP+v+Ud4IkQSDmCj7C02/f5Id3
 kdEYTYbrYMy++IAs4/gt6S9hHLPlTuJ9Hjuql8hPm6at+juD4d8yXh+Md
 U3IGkkV63VchEB0NldR1KvcXgdxpRVs+BilRvjUJ42KyC+pIoOgJZhfRr
 55ZExwPShcj2Am99GbRh2tMy39wv1KzyJDEreOfG82MplN9XTakU2+MKD
 vPHd7VTmlZcCqjuO6DhQZa5ChoZ0IAlAnNUBfil93t51p6FCkEmVuJyvR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="372670466"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="372670466"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 22:03:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="729674174"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="729674174"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 21 Aug 2023 22:03:43 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 22:03:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 22:03:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 21 Aug 2023 22:03:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 21 Aug 2023 22:03:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IuQ0UIAES3aiGQCnadRa9RD17pYUlo2pxOvmlvvMt2ZwJG01R8e9Qalf4IMbuBo5BISL4tiN+AJuQ43cnfoK0NG6BycWjBevWDI4FadmHSWmvbEEEhPFbq7Hp1OO3/UGryJo2UB1vLxw6xHoMbcaRUddQszaC0k0jd6+1VHYMzVPqTDvCmg0GJzFoKS2ehez+7fD03slwR01dcrPdWI+Axq9HvXbOCcTnlwO30G9sfMHjDtEfwkmKSlC1roPWzx3XCt4tvfQL22bDW3dzaduQrvamPy2wibB/nkqqxCITFXrusQvF7nLncfw30IEZnlUqg0s2ai3DqMqW0nLQLoLhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjFwHc7G/8LNjBKpbAkADJP5VS5tt5WA6bXleO+Cbmk=;
 b=L6fsoqg7Fdy4+TkSunskCILVOSFkfUMt1Lre2+uhfwnPpY3IiX4m3/dTRk1SQxP4oSidhYr5kEjMYparMqAq+rNbII18yqN6xBmwiYoN5xoBOLvSvdVOTXXqSYH+Yw8c+mqvLU/E9TvQ0DOmTG3ESRPnIYm95jcmG3yCuGRV0nGvDjyJJlx1CJhE3XiNiKmnr1rvh+DcogoKKOKAUfqarrnpdv9gUVLCOs3Lb8EaiDEizYpktKPr6Ktx5XQ4IrHQq07klOcQC8nfuHyGkU3poYooxUzINHHK250KwzGYoDi98quLmsYi5p4NmRouLNAByMUZui9roviaWeTPcSDtgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 CH3PR11MB7769.namprd11.prod.outlook.com (2603:10b6:610:123::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 05:03:29 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::3382:a13a:ef37:f584]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::3382:a13a:ef37:f584%5]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 05:03:29 +0000
Message-ID: <86302b45-1d5d-6635-fbf6-18700e3c62c8@intel.com>
Date: Tue, 22 Aug 2023 10:33:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230821120728.3871527-1-sujaritha.sundaresan@intel.com>
 <20230821120728.3871527-2-sujaritha.sundaresan@intel.com>
 <CY5PR11MB62118E5479707B19C5DC0929951EA@CY5PR11MB6211.namprd11.prod.outlook.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <CY5PR11MB62118E5479707B19C5DC0929951EA@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::10) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|CH3PR11MB7769:EE_
X-MS-Office365-Filtering-Correlation-Id: c8f60d67-eac3-44b5-b78d-08dba2cd1fcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 99icW2olTvqvMxEx1wLgM9M2eX28zUM6MiDXOt/nSIGPgecf/ljyrmCW+5wUnWarFb/h5khXmRx170YKFJSZsmqDvDHrd/7dg2u7ATvl+ZQhsFsxOp9EgplU+Yw4qY6JprlvdHyz6BiDMoUh08bXtPImDBzq8wfzO9IthqOiB+iVYFaK9hqNm4+E0KDvzpHv6wf+3lsU9p/2izK8xag5LH6uZSwh35zQ7M/uQWGDr+2kpWAvQOZ7lL4GFK5euZHHpM1+Pxab3pNbzU9ud9WPSG/iPsZGGPyUA611Gzs+zZ71lzb4/xDckBEhOZMDlpTfKb1wcLS+QR4PkFAE1MoSa2DHG4x+4/9W72KLu4ddGurl6YB1p3nE4MtC4//xRcAybTgSZLOXTPpRoMMDO0f7AoYagcw6CKAJtL2u6WKEoVkPjgCfskhMKaLEdo826YlDWQDfyb5D8ViJMtehcGnwgCMKGfYygvwApohUbZb6a5MbIXUgMPHh3dN18HP2OEGywss1KyWOlmLpp2KABmfJMfkH0mOD22/yoN6gEspJVaGklcE7zSlofzmrWb7NdQR9YsJgL2Rqu6oV5unzTCvoSGxgNLFKTfdO5b50EwLSEuxbUIlmNV4Yzhu8W1n+YUSrMkK2BwzM1jU5seZ0PBNvdw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(376002)(136003)(396003)(39860400002)(451199024)(1800799009)(186009)(2906002)(53546011)(38100700002)(6486002)(6506007)(83380400001)(5660300002)(26005)(86362001)(31686004)(31696002)(8676002)(2616005)(8936002)(316002)(66946007)(6512007)(66556008)(66476007)(110136005)(82960400001)(478600001)(6666004)(36756003)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzRUazVsQ0hYTkwrZVBLUUhIU2t4MUFOUVY1cGNBRkZBVHE3OXBVZ2Q1Rk9S?=
 =?utf-8?B?Zk5oTmFDQ29SQWkxY1BWNWdoQlhWdkc3MjVTa3djdFQ1dWt3YzFIV1FQd1lq?=
 =?utf-8?B?cUVMSm53K08xNHlrSkpNOUowV3pva2hrYkI1SEtocFlwbTVnbTJUL2toelRC?=
 =?utf-8?B?dFZHNTI0ZHNvTGp2QmJ5anAyd1IxZnpQRGdTMVYwY1pPSG1zRHpIKzg5QTZ2?=
 =?utf-8?B?Unk4cnhaSHpOSHlPejIzcWcwY2dDT1hlRnFtZGtqSEJRZFB2cFpCVU9OS0N0?=
 =?utf-8?B?SGJkRFdYb3VuWkVWQUxvTnlzT3dLMVZWbUw5VWVkajNPQlB2b3VQbW9zZW12?=
 =?utf-8?B?U0NScVhkWFRTeW1qOCszYS8xcXFRMVgzOVJBZG9PTUFyR01HQUt5NzQzQ1ZB?=
 =?utf-8?B?UXoycFJIWUVFYzBRYnA5QzB3dGc2YnNuZmc0UjgyaTA5M1lsQm80VkxoemhQ?=
 =?utf-8?B?RjNXajNYZmZ4cnNmWEpZdXZhd3p0SEw3aUxURkxjQlhzUEkyc2JTMURxNDVG?=
 =?utf-8?B?d3R3ckdreUVDYXhjWGVQWmZ5WjF6S2xGSzkwYkYrYjN1T1FSUXdoL3U4T2tW?=
 =?utf-8?B?dnUxZitQWUFwUHZkTE5CcFF5SVRVaExFZFowZGVCN1VFWXZXR1d1cmFFWita?=
 =?utf-8?B?R1BlWTJUSzZSRFBva2RNTFRmUFRvbGdNM2dHbzYyTmFIZGFxT2hkYUhUejY4?=
 =?utf-8?B?RlBjYUg3eGlYR2QxQmNWZVJjMWZtSUt2bXhqcnh3Q2sxZlplSElIWWlaY0xP?=
 =?utf-8?B?eGhFbGNCM1RYRmJsWGloQ21oWjRXWE9jdjJhb0tPWmFCdFJ4QWtnczZHSTNW?=
 =?utf-8?B?amNRN0FENHBvL0JIS0hjZGl5c0tMSmgwWkJCZnhQRHMxT1ZpeFpXY05yOVZ6?=
 =?utf-8?B?b0NyVTM5cFJ5WUpOQjZvbVljK1RSN3pNd0tqd3FLcTZuZisvam1jQnZhWHFO?=
 =?utf-8?B?Ujh4czlKY3lKb3k4anZOdHZ5amFORjRSeEc1ZTlSNXRaT1V0M21OUkthOUI0?=
 =?utf-8?B?YjVZczBHbDZNRmFXRGNOYnlUME42Nm50NkhQOTVUWGZKUGtSV1hSNG5nTlFu?=
 =?utf-8?B?cGpDWHM0NmNFeE8yYVVZckZSc045dHJtL3NReDJLcjZYdzNVVUtFRytLOEF3?=
 =?utf-8?B?MkU5Y3hZWndpNk0zYVd6ekFKQjRUWlRJRFFyaWN6VEFFS0hBVHVYdUJGMmlF?=
 =?utf-8?B?eGwrTmwyd09ETnVYZnZ6NFh2Z044emZDbG1LeEErT0U0eFUyRHBiTlNZdnlM?=
 =?utf-8?B?VG1UOVl2N25CdVNibzJNU05HbEVGRm9Ga2habGhHVzU0S2RpOThYT0lPR0hW?=
 =?utf-8?B?VklVOWQxRW1PNmZETnV1aWJ0WEFENHBMaTQ0dXNyMWxrbHpWbmhKRFUxa0hR?=
 =?utf-8?B?OVltbUw2NVViSTM5dnBZUXRrUVFXbThUdzUvVU1BYWt0MVdpRGJGbWdXWVFl?=
 =?utf-8?B?eVRhQkordW96V2d3citlZXpoVVkzd3pIUjIzdklwR3pBa3hDMkxobU55dEhi?=
 =?utf-8?B?Ui9PcG9BWXhub0g2QjJsZU8xNGU2VUk4amxwTFo1MU03OUQ4amZLMlJJeGhH?=
 =?utf-8?B?WkxoaElHU0JCZURFQjB4cjlTbDdQcGtwZjArSmZ0TDdtd01QMzg3WXZCeEhM?=
 =?utf-8?B?a0dQRzA4UHpqVE1XQkJGcWJKSlp6ZGlOcndDWk15ZytvSmJYY2crMFBvS216?=
 =?utf-8?B?cGIrWWZQa0E5TGt2alMzZmJyODNwRGM4dzE2UFRkbDQ5TkZlY0pTTUlqbXdj?=
 =?utf-8?B?Q2RKV0hPelNUWGhsSHR0SVQzZUUxODJhYThQWUVzN1RETnJpdWVmck9uWmla?=
 =?utf-8?B?eGRRdXZJRDdmRUlZSk9CTTREZFhScG9xYVhtR1VxRU9VR01IRklmVHBQV3lO?=
 =?utf-8?B?L1lXa0E5NFZ3a2JJVGNIUG9zWk5BQ01xTkpBa3VXWWR5Q3RHVGI2L1MxWXpH?=
 =?utf-8?B?VDIwY1hlVElvUDA4eVMrSjk3Z1Q1OVRxem9yVG92Qk5CcHZSQ2pJV3JTSTN0?=
 =?utf-8?B?ZnhrQ1haMHBXQVR4Z3U5OUtKU2NPWXdhYmZhVE5YR3VCZVJ3RUM2SkduYnZV?=
 =?utf-8?B?K0k1YmZTY01mdWtIR1hHUWpQRzRUeFJZdHVVQXlkY1FDUzdrM3ZRUHM3R01s?=
 =?utf-8?B?MFNnbDd0Mk80aUMrNHMzUFEzbVpSNHFmdkxwRGp2Z3d6dTVObVlqSVpSMFZi?=
 =?utf-8?Q?pjJP5IPSZkEtUZ27IrA0L/M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f60d67-eac3-44b5-b78d-08dba2cd1fcb
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 05:03:29.2099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i94uvLgy+53ZoTGTBSDNRQzWYqdGeqNqfcUnmwja2rbADMJC3zUDzRlp9p1sIMmnfJswo10dwCAmTS/sChSDqq3S8P1AMZxF6rvTqbMn4Zk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7769
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC][PATCH 1/2] drm/xe: Add a couple of pcode
 helpers
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


On 8/21/2023 6:46 PM, Gupta, Anshuman wrote:
>
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>> Sujaritha Sundaresan
>> Sent: Monday, August 21, 2023 5:37 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>> Subject: [Intel-xe] [RFC][PATCH 1/2] drm/xe: Add a couple of pcode helpers
>>
>> Some pcode commands take additional sub-commands and parameters. Add
>> a couple of helpers to help formatting these commands to improve code
>> readability.
> IMO we don't need this, instead I would prefer to have a macro in the caller of
> xe_pcode_read, which would convert the pcode params to mbox.
> Thanks,
> Anshuman.

I was hoping that adding these hooks would make it cleaner and will also 
be helpful when trying

to add some other performance factors to sysfs as well.

Thanks,

Suja

>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pcode.c | 28 ++++++++++++++++++++++++++++
>> drivers/gpu/drm/xe/xe_pcode.h |  3 +++
>>   2 files changed, 31 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pcode.c
>> b/drivers/gpu/drm/xe/xe_pcode.c index 7f1bf2297f51..e45169f47500 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode.c
>> +++ b/drivers/gpu/drm/xe/xe_pcode.c
>> @@ -104,6 +104,34 @@ int xe_pcode_read(struct xe_gt *gt, u32 mbox, u32
>> *val, u32 *val1)
>>   	return err;
>>   }
>>
>> +int xe_pcode_read_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, u32
>> +*val) {
>> +	u32 mbox;
>> +	int err;
>> +
>> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, mbcmd)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, p1)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, p2);
>> +
>> +	err = xe_pcode_read(gt, mbox, val, NULL);
>> +
>> +	return err;
>> +}
>> +
>> +int xe_pcode_write_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, u32
>> +val) {
>> +	u32 mbox;
>> +	int err;
>> +
>> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, mbcmd)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, p1)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, p2);
>> +
>> +	err = xe_pcode_write(gt, mbox, val);
>> +
>> +	return err;
>> +}
>> +
>>   static int xe_pcode_try_request(struct xe_gt *gt, u32 mbox,
>>   				u32 request, u32 reply_mask, u32 reply,
>>   				u32 *status, bool atomic, int timeout_us) diff
>> --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
>> index 3b4aa8c1a3ba..8d4103afd7e0 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode.h
>> @@ -19,6 +19,9 @@ int xe_pcode_write_timeout(struct xe_gt *gt, u32
>> mbox, u32 val,  #define xe_pcode_write(gt, mbox, val) \
>>   	xe_pcode_write_timeout(gt, mbox, val, 1)
>>
>> +int xe_pcode_read_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, u32
>> +*val); int xe_pcode_write_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32
>> +p2, u32 val);
>> +
>>   int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
>>   		     u32 reply_mask, u32 reply, int timeout_ms);
>>
>> --
>> 2.25.1

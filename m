Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A37E810AD
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 10:02:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4468410E042;
	Wed, 27 Sep 2023 10:02:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0A410E042
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 10:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695808956; x=1727344956;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fobqwgd/oT7PsdDGr6nkK4nv8EibbydfA2hVJJQqThY=;
 b=SKNPhEQqYQGx+VIruyK1RHgMgNU2QiJbHvm5ZmvdpSlQEnAwTQIYqYN1
 cei1DevGoJlCluDfGoaXEQ2EWFIvf6JWsEUdjrMjjEvEWJaFLHnj65U6P
 7Z/356L2/16h+bHGtRVY1liqD2TBgwSAg5dpY8vcxIX6gL0wXAs/BPZtL
 Y4kuZbviuvsuA2aDd5HI2UEl5gtRFKEJKUyMz8MQ7x9Me2kPtMMktf+yr
 UqeboRV6oQF0C7PDK/brqRuaVN/c8BlKILSai05w+Rz/GN2xgYHilylAj
 ucF0XljVyeWJykHGC6YuJYCWW3fRfBMs+3RAUW1LD1mG+gqPABykxtWP/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="361173186"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="361173186"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 03:02:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="698801432"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="698801432"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2023 03:02:24 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 03:02:23 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 03:02:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 03:02:23 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 03:02:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MjUD/TwMII7mbfrmY69k6f6ThBlKxQVlCcADylwqf/1W7rRzfZieyvJYRJw7HYf0y0mNpnodZNrTba/7W7aqniU7rx7VxxprikLX4bnnaf8gfizYwE75T/XUJvUtO/jqHXASGsZFebfFzeB8GvcVodDRyUN1MiGrfdEx9Uplx+SuUZJ+Q9cvpps4JnJ3m9o4CGVW6h3wAT3lCKK7IhsOVbXS4qG4TkR0kEWIcdUC6vJrfjVyqaMAJTHobLuy2GXRFCwdbPplt3G4C8iX+1eIimjjvgnqAZf6ShRAeYgnr65Bo4mf4ql6xXiVq1Sr6yUAKzVsOwO5v6WwE9aYWvMjGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnjdtbRnvzl8MOEk3Z6L1NwFLLeekbIqRIynIfdKw6k=;
 b=AGO8Kv6HXdKztKobvoXb85e2WKBig9T3F+KT5WI9VzhSiqDg1Zg9M8edj1v1KMHSmHr5+4lD8YC/1dyihv9qoDa4+Mo7I6fEbA+9iTfBQgipRKlGMx3rqjYEUfzM6djIRAJ3WWf/yDxRrp2+wAs5wvX+kshT6yKrjUReTSqEqs+/L6QeknrFoH7Nx8CmP449h7GLirCt+RwRhh9+tzzZLl4J5gSzyjsQgBP7eUDeOjkh3PTvbfgjVAN1XCzRSdU0MnnW+kVdoiLb+VPnBJBZdaCC7FEExwKgTNq5op9P1apjoYOMCM39QY6y1XS6hodcOv85bGcmPi/cK1O+x2QwGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 CO1PR11MB5058.namprd11.prod.outlook.com (2603:10b6:303:99::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.23; Wed, 27 Sep 2023 10:02:20 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::c5ac:9134:7e53:b45c]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::c5ac:9134:7e53:b45c%7]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 10:02:20 +0000
Message-ID: <76cdbdd9-507b-c4c3-2f49-f157f12a4bc5@intel.com>
Date: Wed, 27 Sep 2023 15:32:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230926144120.334009-1-sujaritha.sundaresan@intel.com>
 <20230926144120.334009-2-sujaritha.sundaresan@intel.com>
 <ZRMUqwN70Bl+foMo@intel.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <ZRMUqwN70Bl+foMo@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::10) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|CO1PR11MB5058:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f194a11-93f7-47e5-6d1a-08dbbf40d668
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vjl4eZhJV+AxVCXuZ4ORGF7jOP4ZHovIDUsezN44uKAtRon+gGWPdzv9nXSXNk4YnoK1fVcH1jNXl/GsJ1RJ7PkqCi48w4lf1foyI2r5wN36iGB8vvNZG2NFR3sHdl6F1RBashWg3qwR4kIUeGIe/M1ehKDIoRx4TIzzx+CNHGxr7OumA95TzLCstNJcKnwo1i+BmaZ/gV0TNLyAoRhzpC9sPeOisYEabgV/RsCiLfpSfWOPckmRqSVOoUbaXdbYSN1Fih/TgLE1OLlns63suSQf6RqcLoyubAGQaU2Dv0QMjKQ8NDui025U+JNOvd2Sy7fOCRR7lKgQ9f5XLyPXuhCHIQLU41SEOXHKuxd0Fp6YN2bEnOqR+90qdetbM4pDF6j90+aC3OBetTZ5uYTygXBhYaQC75KlD75PTomg2yGC0pcFY2Fm209A5ZfnoUI393x3G/lzH23Ofb5GZEYlKqPO7ssnTKQx0JJJPuugki6j3ys9NHW2o8GTJ7SY92ksHxr56wmqdSf/zFOitk4/2Sd/Si1CSW1oQzt3kW18oaTlhWGohr8bEg2k+idA7uKA3OadsePyyCy6BxPrKS8o0tFJw6HCcXMpeawKrbxTGqXjqaWlSaZXRS9Ki6Lg78VwfoU/GyceUZ7O6gmcOZsYiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(396003)(136003)(346002)(230922051799003)(451199024)(186009)(1800799009)(31686004)(2906002)(82960400001)(5660300002)(31696002)(86362001)(38100700002)(36756003)(8936002)(8676002)(4326008)(6862004)(83380400001)(41300700001)(6636002)(316002)(26005)(6512007)(2616005)(53546011)(66946007)(66556008)(478600001)(66476007)(6666004)(37006003)(6506007)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aG1sdXl1aFRuUVpnT0ErTGNvYXRkaXF1RVE1UHd4MEdnSkdEYmE4SlVzd2gy?=
 =?utf-8?B?Ulo0Wk1RVHpXR09ERWI2cFlsNVlwMStPWExZVm1HOVVmWnphT3hMUXRrbVlm?=
 =?utf-8?B?QkYzbFRsTFprdTV5ZzB4RG9mTTR2V09JV2M5aUdLeUNCcjI5bGJQNXFJYlJ2?=
 =?utf-8?B?NnJacUhWZERPVGs2UWV3Z21QMkt4RjhjV2tTcDJEaUdxY00xR0h4OVZPc0Jq?=
 =?utf-8?B?cVh1eklldkh2Uk5EYW9aVSsvcmVFeWQ0VXBmZ2VmTDNCZXdXcnBPNTFDV2xY?=
 =?utf-8?B?SjhzamhMOVZwSlRicEVIUDBoaUN1cS9tYTdzNTBoVDhaUTVhSGJGaDZHK3Z6?=
 =?utf-8?B?d2lmU2NPaU1GcW9FVDM0R3o0aTZGT1ZEUWhMcHR6ejA2VXV3Um5aOHM5N2hr?=
 =?utf-8?B?bFVhdDZLVjkyLzZMTThBaHNqMCt4NVgwdGZmdmUxaXo5U0JvcEdmNnB3Ukpr?=
 =?utf-8?B?aWtyVElxTUd2OCsrSEVaS0NBdXYwVXdPeGlHVzM0bXJ0NC90Ti9tUTYwakJr?=
 =?utf-8?B?ZFI2UjBJZmxCdXRLVkQ2ZmdrK1BuUE80TWx6T3kxdXJscTExem1QR0MzNUpv?=
 =?utf-8?B?eW05UUNjUEw4UE8rUlk3WWNrbXZDSmx1UUVwaldQK2w3cFBNWkZMNTBZK1hi?=
 =?utf-8?B?aHR6emZhUG5CZjdpTDdSRG92SlkxMjZKenFLQmx0aTBGTllQVlJTZy9wcElJ?=
 =?utf-8?B?dVlZeFpoOG51NlhHOTBjQ1I4VzEyN1FLZlZUYzY0RXJjNnRwcXhHcnZSeHBa?=
 =?utf-8?B?OFk1LzFQK0cxUFh3ZTFFSVRPZUUxRnRCUkUwa20zUEFuYlRjaGJrM0kyNVpm?=
 =?utf-8?B?RjBSL0pCZmhWZ0pscW9wSlBMODZmWFNha1VqWTRzbU9HanlUL1ZpcXVTLysv?=
 =?utf-8?B?TjYweGJWU1pxNDlBZjl1dVA3aHJSSHVsajZhWFMxeW1VM0tvaEdjOEc3eUlW?=
 =?utf-8?B?SWxnelRNeDduVTBXZVhQMnVZVUQvZVN6dXYxc2tvenp6azZFQWUxeUQ0RG9t?=
 =?utf-8?B?QVJmaHppWXV4dDdPbG9teTlNbjhvaGRLL2hGQ3QvYVdSTmNheFUyeCs3dDhp?=
 =?utf-8?B?Y1RQdEQ2OHMxa0N6UDA5cWUreGMwVDNIN1l6MXBXN3M3amhLT2VJOFdoZi92?=
 =?utf-8?B?WktET1U1clIrUVNlQnUvajIzM1ljNHIyK0kxOW9ZeHZUQzQ4amdaRUhQVy9I?=
 =?utf-8?B?V2xhL1ArSXhtOVIvTXEwV1d4NElXOW92SlVYTGxseW4xTzYrcXArVWl2UElt?=
 =?utf-8?B?dHZ2THF5TUk1Nk9RUnl1bGhMc2s1RStmdVZlVDFEVi9yNWNUY3RJd2xOS1BI?=
 =?utf-8?B?V2RoYXdXeFhXVTRxUHcwdkpEajBvTDhkRkY4ZmtqU05lTG8yUXAwanRTeUxH?=
 =?utf-8?B?aVZXL05CQ01wVnF4NW83VUl4WWs0bjVqcFk5VUlKWWtpRHZrRUUrTmJyL2tO?=
 =?utf-8?B?cXgyQ2xSaGdSMVRxZE1CVy9YczJRTU14Z1hDVkZQWnVORjdobmttL3lkWm5O?=
 =?utf-8?B?YlpUU05hZnE0Mys5bStyUkh2ZTNMR1M3Qjh0SUJOWm54dEhpSGdTazFtZDcw?=
 =?utf-8?B?WUp0TDEvbUtzYjJQTlFKK29aakx4ZVRybHUzREVHRTJJOXJxT0hoT2F5Nkwx?=
 =?utf-8?B?NDY4U1VLMWo4TUx2QjIvNkhGcDNWbmtwQUhPOStzdmhhaEU1Q0RzZnVXNCt2?=
 =?utf-8?B?cXJMMmJTWWxUc1VIK0VSMTFmZS81KzA1OTV5TVJudy9oTW5XMlh0WnBCNWJJ?=
 =?utf-8?B?VHZYRWdZUmFabi9IcG9OMnJZQ3pSU212RjY1Tm54K2Y1MUdNanZJTWZ1M1BS?=
 =?utf-8?B?UTM4eUxXeWx5UWd1Y0t4cDc1eEhqWUxvZjE0Vk9xYWI1TWlvOHZXSFFCMUxI?=
 =?utf-8?B?OUp6TUdjMGpjTkpPUzdlTzVid3o0WndGREZnK3I0SEhvZlc4V1Jlclcvby9V?=
 =?utf-8?B?ekFSNlNldHQ5R1laZjY1QXBnU2h5d1N6ZHBaOWxBS3Y1NDREazVzSFpqVlhZ?=
 =?utf-8?B?NUJLSW9mODJBTDhUUWlvVHZJeUdURURzOHIxa0ZBdFFPcG9mS2grTm5JcWZO?=
 =?utf-8?B?akV5dWxFVmozTDBVajlqWnllRUpNYllNQ2dBcmswcXFCQ09kZXdHM2hSQk5N?=
 =?utf-8?B?R2hsWStWMWVXYWpOejhkeWdJR2ltVjdDcENWanl1Rmw2eVZUNi9iTmp3Y3lY?=
 =?utf-8?Q?T7ph/yqdxr0MEou2gWoUbKE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f194a11-93f7-47e5-6d1a-08dbbf40d668
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 10:02:20.3386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ndf54XtJkMdJ9K/GECQkJIDN8+WMUAEaAqc+N/PLmjAcs5Xbc5b+tCEP+DOVd/gIFvRAjXHQzPZVhcqUtVER436TMP1UNHB/2ZzZWo1YHdg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5058
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/2] drm/xe: Add a couple of pcode helpers
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


On 9/26/2023 10:58 PM, Rodrigo Vivi wrote:
> On Tue, Sep 26, 2023 at 08:11:19PM +0530, Sujaritha Sundaresan wrote:
>> Some pcode commands take additional sub-commands and parameters. Add a
>> couple of helpers to help formatting these commands to improve code
>> readability.
>>
>> v2: change function name (Rodrigo)
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pcode.c | 28 ++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pcode.h |  3 +++
>>   2 files changed, 31 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>> index 7f1bf2297f51..eed096ffc23c 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode.c
>> +++ b/drivers/gpu/drm/xe/xe_pcode.c
>> @@ -104,6 +104,34 @@ int xe_pcode_read(struct xe_gt *gt, u32 mbox, u32 *val, u32 *val1)
>>   	return err;
>>   }
>>   
>> +int xe_gt_pcode_read(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, u32 *val)
>> +{
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
>> +int xe_gt_pcode_write(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, u32 val)
>> +{
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
>>   				u32 *status, bool atomic, int timeout_us)
>> diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
>> index 3b4aa8c1a3ba..79ae45e71228 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode.h
>> @@ -19,6 +19,9 @@ int xe_pcode_write_timeout(struct xe_gt *gt, u32 mbox, u32 val,
>>   #define xe_pcode_write(gt, mbox, val) \
>>   	xe_pcode_write_timeout(gt, mbox, val, 1)
>>   
>> +int xe_gt_pcode_read(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, u32 *val);
>> +int xe_gt_pcode_write(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, u32 val);
> A few things that are wrong here:
>
> 1. namespace: xe_pcode is the name of the component. That should be in the prefix.
> Please notice the xe_mmio for instance on the tile option vs gt... 'tile' comes
> after the xe_mmio, not before.
>
> 2. 'gt' is already the main argument in the other xe_pcode functions, why are
> you adding that as prefix?
>
> 3. Please unify the read and write functions, without creating new ones.
> Please take a look to hwmon series there... There's a need for something
> different there, and that solution from Badal is better than adding new
> signatures. But please, let's combine them all.

I think I'll just skip the functions and have the mbox be defined in the 
call itself.

Thanks,

Suja

>
>> +
>>   int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
>>   		     u32 reply_mask, u32 reply, int timeout_ms);
>>   
>> -- 
>> 2.25.1
>>

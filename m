Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789A8C4706C
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 13:10:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 414C710E542;
	Tue, 16 Jan 2024 13:10:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2607710E542
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 13:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705410645; x=1736946645;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=25lOwPQ0zGn+PFyVzaucTcyKSg4lJ9HYQSvxYqgx+Z8=;
 b=W8v+clKUeFnu2oZ9bEu3UQxzo8YforkOZRrf/YkuqIMwZ+puus2nIKJf
 x588beqYEB1XplUkT4NIk3ReBpGcn9FLoq78jcBejQUfI21BuSujk1Ap+
 I+oInRBcSh2KmPtfLkNIc7xv4IbpiQ0uQ4yoQNEyrAK2rOo5jH+QmcNmg
 WpL+hhPLqMP4yllxCMV3jjCZ7nfnZHjxTz8SgVYNhDIR73yAgwUqG4qiN
 d4weB40vnu7K4F7NS78qzVYtwrhUwgnSIUKPsLTbvzitB8y3gbbXFBUX4
 mRsmOM0uGWQ6wIMqPLNf8gMOqPIEOxz6QthZuQXxSAS8lK0zgBusD2ZC5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="486015099"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="486015099"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 05:08:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="18462157"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2024 05:08:57 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 05:08:55 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 05:08:55 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Jan 2024 05:08:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXuQsrGuS6q/RmgIRDADYmxfWQH/4Q/sCPL76Uq5BFYLMJluQMZAgbDiJf5hz1KV7tPHrVHfDH7Fix3tPUic97aMo3Zim1KzGC8ps4XF/dq4toyiwTz9lad2B0b3HoY1z9Gh4DVzclCDuGhdoHRiQwOS1RWSV21H+oirWA11ROnysa6vPgG7Em/TmiEqMftHMYJz+OUOU+qewvxGaQtF60x1F+1rmsQtOYmD+bKiK2rA1WHY/TAyeG9h+e+uS1javzJTVLGblkUlYYEMZj36eGHMqTqs+pMuwMr1C2vT3Uyc3ZAaPdO7l6ENwMpWawoQKncnrTTqILHkp2Pq1f5mJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NuwZIe3Do79U7SkKFyPV6pTD7AG+QLNIIuz0n8K5TRw=;
 b=UngjaaXfbv2iapzRKZLNKjVmHw9ycDmTnE6byHegxfsfSfAahoweRZaM+zkvX/D1OBAXL7X12kAIRaINmXpwE7XWcGPw0m/cDg8nh3bovBhlj+HoSj4QjgqHGJmCvX82DOV3yHkJFEpQ6rCXLe99WxHmYGtR3/xWNOVMNiztllxltM5wePkCikRncB/s3P9MXRQGtzu8QO4EicCwct4j9xBt88DWrgakTNcozKv0CSF/r1GSlp1b1n1HDXjhNoTdlYaLqZpRMef5xRNOEPrmBrrUXZcnVk+u60owtRsHRuLViG0ubchhG+Syx20puSFPS6alugRhaqjlr9dNRLGmcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 CH3PR11MB7723.namprd11.prod.outlook.com (2603:10b6:610:127::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Tue, 16 Jan
 2024 13:08:53 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::1ed2:770e:2fbb:de41]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::1ed2:770e:2fbb:de41%5]) with mapi id 15.20.7181.026; Tue, 16 Jan 2024
 13:08:53 +0000
Message-ID: <60b41122-dbba-43f0-9314-d057ddd646b7@intel.com>
Date: Tue, 16 Jan 2024 18:38:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Enable WA 14018913170
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240116095535.2304397-1-karthik.poosa@intel.com>
 <7ea5cc7c-27d3-4f3b-9592-5c5181250203@intel.com>
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <7ea5cc7c-27d3-4f3b-9592-5c5181250203@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0159.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::20) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|CH3PR11MB7723:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f6d3a83-0e97-456a-292f-08dc169449b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b720fac+01JDwqJeK+HDhiNBzw9xija5LsRJaF1pKtGnTdlZi+Zg+Jtl8HW/ANX+70QuoNAeAuJEK9LtliVtrNcSJ3w8D6uKQHwHSXN7hIb/kqZsQHG5PIVOLP+VjA1ZW/n/TEbYbnH6QjzJao2ZQOiz0j4QUoouVocqJFZzDD2syQp6Mi7L4rvmN6abt2ogQv1QDZQUTMzU9cKsZlLmU7rnuyFNyEUuswlUq90TCyTiN5J2zOYzy2iecbgrOvKBg7l2zqPhd8eYJAkGiqlIzU+07RNPO7bynkEZScc0mNBCT9Ay2fZNChSsGhxkgfEwZ4WWgJ0xpsAy0qdKRsy23BmlG+xza+M3+6t5ELcfrodfhkhh76Ta7dsDSv3fQdrLzjMMR4c80XH5gO2idEmDsog+wh75w9Cnv4oqFDtj1lnNW33dTAJAZTSUqUcbSm/IAyoLUOU568bcS7lA1FQL3/jShwsKLej1bl5/HnN4zWekiDbgvUFiNjXqLjM8U7d9nHqgQuif64bNS6Eg30MVugCum7mn3Siu9bkFmQS00XK3sjzjKs3ioMuXxlCLxieYLWooTgPAVQAPmysN9kENBj5vwY8ptj3CeaDdXXTYBSrfttg3NivIxivk4gj3MqqSecuHIKa/T2swIKbAWiM2ZLh9nPIQi71hzfQCEYl1w3SDWuX09NrdSkaOeUgTo0PT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(39860400002)(136003)(366004)(230273577357003)(230173577357003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(41300700001)(31696002)(36756003)(86362001)(2906002)(82960400001)(38100700002)(53546011)(6506007)(66946007)(8676002)(316002)(8936002)(6666004)(6486002)(6512007)(66476007)(66556008)(478600001)(83380400001)(5660300002)(4326008)(2616005)(26005)(107886003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWN2MjJrQTl5aitYZXFBTEdyMzBoY0hSOWtBMTdvcVhpZ20xcGU4Z2E1ZGNV?=
 =?utf-8?B?NGw2VTBlTllMYitBQ1dIZllFTE5tRW15QUxVN2drSjh3ZnVyN2RCRWludUE5?=
 =?utf-8?B?YXZGejlGaDROL2ZleEJpbjNENzBBZm1UaW9mamtVeXRFamJEVlNOMURudGpP?=
 =?utf-8?B?a2MwbEN2cEx4TWxlVHoyNE1SN21obW43KzNVekw0RzF4QmtqVENmRStneno0?=
 =?utf-8?B?N3JIWGRUbXA5ZDU0c3o1N1hQSlExakRBeEZOT2V3dGJ3d3A0dDkwWHdYYXBR?=
 =?utf-8?B?dkFSOWIwYUk3aWQvelZJSG1IK2lsMUpGekw1NHJ5QlRxZ2ZuQjNHVHBQQWhz?=
 =?utf-8?B?U2MvSzdoSzFMWGFJT1pMNzBLR0ljM2RRYXd6aXArb1k4blYvdnR1T1kvUFJ3?=
 =?utf-8?B?NW1JRithZS9hQVJOdjhGbytPcU1EQjlFbWE2MEljTUkyNUI2WjJzVVN1NHV2?=
 =?utf-8?B?TTVmc3drWHlXWC9sQTBaelNwcVJOTFIvVGpvMmJ4eDdFT2huTEhtMDJUdlpE?=
 =?utf-8?B?b2NobEQxczd5Y1ZsaDVLVFBkMnA1dDl0UFRlWlJzbWUwUE43OFBIT0tlKzBu?=
 =?utf-8?B?Z05xTWVacTAyUzdlZUdNNFdDdERmM1JhRml0a2VkMFJPVG04NmJqMTRyRy95?=
 =?utf-8?B?UnBWdG5IdnhrTHJJUHFjUThoVkdoUFhFeHBUbkJVTE5TVTJ2ZXNLMDRibyth?=
 =?utf-8?B?SndjbENPcE4ySnU5WU45OERub2JFMTVsN0x6N0pTQllpeEVLT0RtQmIwOE1q?=
 =?utf-8?B?b2N3ZFBrU3VFbFBSRW9kZ1hWMmVpbGNTUlN6b0Jka3U3OGxtencrdDlpeHh3?=
 =?utf-8?B?Mll6MUhVMDZmenRPSnhLZ1VoaFRrNjAvRk9UenhZZGRzTTlFemZXUE5sM1pT?=
 =?utf-8?B?S2ttc0syMG9jbDI3cEN3Tjg2OWdNZjZqa1NxZGdmNE0rT2R0M1RiYkkxWVJl?=
 =?utf-8?B?VVBMNE9XeFhkeUdiczdhNFZNaE5jY2hYeFZqUkR2U3ZRNzlONkhUT3VsL1Fq?=
 =?utf-8?B?V0RSSlJIUy9SL3B3NUxyQXJ1aTh1NHVKNUZmOEpDZmF0OHgwQ05Xcnh5Sy81?=
 =?utf-8?B?akd4UXNiSlB5RlZrcSt2a2dwRG0xNzh3MVEyRFVlS21rbVJueUlaVzdyWTdi?=
 =?utf-8?B?UGlld2ZtSDdJZWhaTVZSWCtCaGNLaURVZnRjTGRtZVVsTTUvN09DM0xLYWVM?=
 =?utf-8?B?cGg2UDAyWHBDTGFQNVFoT0tVR3dpUVRqNDY3bmR3UHVjTHl5RWdoVFpoeUpy?=
 =?utf-8?B?TURyZ0lSZXRlaDNRb3d4b1NmVHFjZlJJWnRKU3pWOXpKaEFXZ1ZkWkR1MDRB?=
 =?utf-8?B?bWh2a3dySkV1bTRiV05hR1J4bGZmTmpWSG53a0ttOTJPZmVObitsRWc0aSs0?=
 =?utf-8?B?UEVkYk1weU1QbHFpREpzdGJVUmYyeEpXdnZxVmdSUUFZQWJKY0pJaW5iaEdZ?=
 =?utf-8?B?ZE02MEp3eERJV3FIb0dwY3RVRytqeFJvalpTK3IvUUtQM2NFWmVKc00zZ0l6?=
 =?utf-8?B?dWNuaGViQzliRXJseGRJaHNHM2ZSaGJweVg1dDlWZVY3VzVldUVuamwzR1BQ?=
 =?utf-8?B?T2NDSlljbnpvSTJnK0xHd1lCMWYxay9qMmY2N01vLzVHOGdqN3kzSS92VW5q?=
 =?utf-8?B?MWlNR1VIU3pzVGNYUDQyZlVWbWYrdVlVRzM4K0h6VVFKMXV3eW5GUHVCbDlF?=
 =?utf-8?B?d0FsMG9jNGFTRWhjNTNJZUZJeVlBbDdGaE5wYjFZMDZ5eTZPSlUyRktuRC8r?=
 =?utf-8?B?MWhOVkdPY3V6cnlrRE9QUmFnbmFvNk9GeVVMVldkejJ5YmNFdmZNck04THZk?=
 =?utf-8?B?aDRuekRMWk5hWlpmWU5CM1g2VTFYZDVxSktiK3dZQUxVWUUzMXI5RXFFSERl?=
 =?utf-8?B?U1RqUjJ2MzFBcWE3TlNKbFhXS200NDIrMkpIN1p2S2Nla2lLaEpLSXBuamlj?=
 =?utf-8?B?R1Q0bTBVUFpuTy9MNVpnY25ydVR3NCt5MlFZWXNxeVlKVGsrZFBmR1lvelEz?=
 =?utf-8?B?UlBIZ2pjUHdaRnRaWWRweXREZjFVckx5citGTE1IWS91Mi82QmE5amVRVTBn?=
 =?utf-8?B?K3djWW9EUlR2L05pMnYyVzNBaTBReHFkLzcrbWNaV2k1SnkxYkJkbXJ3Rk9t?=
 =?utf-8?B?ZDNIUFhUc3huSnJRWnBsdVNXNEVwdWpJckQxQ0IwbnpzcVhpV2ZwN2FIWkZI?=
 =?utf-8?B?OWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f6d3a83-0e97-456a-292f-08dc169449b4
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 13:08:53.1232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iRoMh5Rzfx1E1NeeM77cZRIYOhQddGzkGt1YeV/YwHWMjUFMllStiViOLyZcsPmqhqKMWqdwNAaYmDLzK5uuBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7723
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Badal,

Fixed the issue in latest patch. Current GUC FW version stored in 
XE_UC_FW_VER_RELEASE.

On 16-01-2024 17:07, Nilawar, Badal wrote:
>
>
> On 16-01-2024 15:25, Karthik Poosa wrote:
>> The GuC handles the WA, the KMD just needs to set the flag to enable
>> it on the appropriate platforms.
>>
>> v2: Fixed CI checkpatch warning, alignment should match open 
>> parenthesis.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc.c        | 13 +++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_fwif.h   |  1 +
>>   drivers/gpu/drm/xe/xe_wa_oob.rules |  5 +++++
>>   3 files changed, 19 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 235d27b17ff9..5ecd9cd964de 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -132,10 +132,15 @@ static u32 guc_ctl_ads_flags(struct xe_guc *guc)
>>       return flags;
>>   }
>>   +#define GUC_VER(maj, min, pat)    (((maj) << 16) | ((min) << 8) | 
>> (pat))
>> +
>>   static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>>   {
>>       struct xe_device *xe = guc_to_xe(guc);
>>       struct xe_gt *gt = guc_to_gt(guc);
>> +    struct xe_uc_fw *uc_fw = &guc->fw;
>> +    struct xe_uc_fw_version *version = 
>> &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
> Why not XE_UC_FW_VER_RELEASE here?
>> +
>>       u32 flags = 0;
>>         if (XE_WA(gt, 22012773006))
>> @@ -165,6 +170,14 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>>       if (XE_WA(gt, 1509372804))
>>           flags |= GUC_WA_RENDER_RST_RC6_EXIT;
>>   +    if (XE_WA(gt, 14018913170)) {
>> +        if (GUC_VER(version->major, version->minor, version->patch) 
>> >= GUC_VER(70, 7, 0))
>> +            flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>> +        else
>> +            drm_warn(&xe->drm, "can't apply WA 14018913170, GUC 
>> version expected >= 70.7.0, found %us %us %us\n",
>> +                 version->major, version->minor, version->patch);
> In bat results this warning is appearing even if guc firmware version 
> is > 70.7.0
>
> Regards,
> Badal
>> +    }
>> +
>>       return flags;
>>   }
>>   diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h 
>> b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> index 4dd5a88a7826..c281fdbfd2d6 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> @@ -97,6 +97,7 @@ struct guc_update_exec_queue_policy {
>>   #define   GUC_WA_POLLCS            BIT(18)
>>   #define   GUC_WA_RENDER_RST_RC6_EXIT    BIT(19)
>>   #define   GUC_WA_RCS_REGS_IN_CCS_REGS_LIST    BIT(21)
>> +#define   GUC_WA_ENABLE_TSC_CHECK_ON_RC6    BIT(22)
>>     #define GUC_CTL_FEATURE            2
>>   #define   GUC_CTL_ENABLE_SLPC        BIT(2)
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules 
>> b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> index e73b84e01ea1..b138cbd51bdb 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -17,3 +17,8 @@
>>   14019821291    MEDIA_VERSION_RANGE(1300, 2000)
>>   14015076503    MEDIA_VERSION(1300)
>>   16020292621    GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
>> +14018913170    GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
>> +        MEDIA_VERSION(2000), GRAPHICS_STEP(A0, A1)
>> +        GRAPHICS_VERSION_RANGE(1270, 1274)
>> +        MEDIA_VERSION(1300)
>> +        PLATFORM(DG2)

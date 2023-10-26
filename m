Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9A7C25B6B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 08:01:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2EB910E78B;
	Thu, 26 Oct 2023 08:01:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A4610E770
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 08:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698307290; x=1729843290;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Dqydc6DkQ+Psutyobi8irtSBGgYgRj08v8DIPcNHEs4=;
 b=abuTbir/9mvRPmp1X/HwjgM4tlVhiEUSsFdFHLkBfXaJ66fWM8DF8ySg
 910BvbhACkpoAN6/mZ2/8/WVemMq0X31pM1gb4A/51Hf055jGI5cccVL2
 FgcCIJQQdJkPECsAiBf8CO5QtKMb2ZJVrpbPbAfz8QwZ74glq+lR3tdjn
 mRPmL8yZzCL2Hu4bCKVq9iAuAaOlLVFGqfk4vk9GZA544/ViCX+LsOcKB
 Q7fPGCh/pF+BsqkuJHpqv9MftWG0F/z+NUf0ngyXg6qqEIReZcvByi86T
 JBQraM9gmGfte7h0ByNOAiTr9DFGEyO/B3j5dmhALtJR751SPjXC/36Da g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="278604"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="278604"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 01:01:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="849839094"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; d="scan'208";a="849839094"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Oct 2023 01:01:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 26 Oct 2023 01:01:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 26 Oct 2023 01:01:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 26 Oct 2023 01:01:16 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 26 Oct 2023 01:01:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lFfBMOMdL2wGorYRos6irPlOF4zQahA2uG9VVyWeBDCMt05ryBdApO8whe1j8EkPsofxlZOrx1qr+uDdMxQWEaAenUmgx4oFYEWmcmP5UxOl0xZ2dFFY0CnqAWvDjnF1IIgayZlxvS3c6vMlM9RCj6aCPOsH0abAmzG94RiMeSfM+arIjEGPwrN88FTjxy95hJdFU9Z0I3bThc0K8SkU65gy8sBILBszs8R51lgSLmqNv1fZ2M0NLRPWkuABgXNgs3CWe0A08J+FbvtFHY55BVxLrof/63CjHcbWwnFo2DIYFiXg68EYN7p7BT5d4/fG7aIMxJZNnBDFcl8KDjQFXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ts9Zkx3Altpo5vV39ka2aiEWSDF9VsuM+JqqufCH4bU=;
 b=WMEV6HaGA6Mo3+I7kwga8OhoSulRoi2uo2e39Cz1PHy2tRnXNxuwRjZjui7pQY+SlZjGlNvsw1kZqAUyO28+Hrtk3dR7Opq+mDdxjmdttLDfzxAoiO346QPVnf1F/qrgLpxM1viRQ0CNUSXZtkQTT10at/mqbhw1ufDcGY2+ss6vONbVTh020F664WwgFl2lwmLZeHX1FfDbtExlrjribuKYxnJTtmiL/LAZq3nXm/agyIsuSroUgUuVXbJGVScVkKqVc5M4IThlG1yq652Y8+KclVSAIXDMIAfIQdkhp+VrLK+GcdRDk+ZCUhJAsnbu9doQqEmRhO5L+hbWxxb2Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by BL1PR11MB5272.namprd11.prod.outlook.com (2603:10b6:208:30a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Thu, 26 Oct
 2023 08:01:14 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::51c3:59ea:6d4:8bc0]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::51c3:59ea:6d4:8bc0%4]) with mapi id 15.20.6933.022; Thu, 26 Oct 2023
 08:01:13 +0000
Message-ID: <ec0746a5-b693-4bae-8c3a-f128a9392312@intel.com>
Date: Thu, 26 Oct 2023 13:30:56 +0530
User-Agent: Mozilla Thunderbird
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231018190341.726098-1-badal.nilawar@intel.com>
 <20231018190341.726098-2-badal.nilawar@intel.com>
 <CY5PR11MB6211E43E9DC96961DA842F1795D4A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <CY5PR11MB6211E43E9DC96961DA842F1795D4A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::6) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|BL1PR11MB5272:EE_
X-MS-Office365-Filtering-Correlation-Id: d1b1cefd-e696-46a5-5fe0-08dbd5f9b36f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V8xuR8wPFGHmUVJ9jnS8lp7Rbe07tNeL+lOpMRhyJF2EEbCe4uBEk/kjpVL7cD8nFGkHFTHGsgWaM3P7nvfdma7I4xO1rbXe1G2jZJUq86/HHF6VicMqwFeq59KLy0zT5tKEjvsRJ3CRTZhzU1U25qVc27/qcGd/W2wRza8ghKxd46buSIlq4ZgKCZRljP1oE35NyPvF10c32x1h3n2w6Kv9oS2aAOqjMlpQPa7O/Ibq2zJKP27mSBDgfND14VXizyswoun33dRUwfxyxl4SGMeKwlYwklLr59owCXah2UY8DVcL5alHt4SOlA6VCJGc3/Yx6g0JpyS8Ud9LUSeKhyI/GacKTdkHK31paf+ZL7py6NDUmF+lEdzMAnNykYB1zycQvX/4cpRJYmjS1YQnjw51iDklV1WBzlm7juH8aaZLC3EuFEQ4ME43GmDVknXGLJImdnVzv8prZh/k1HvQz6RC+MoDQUyXkLmP1B19vRS+GehOSsjjefF+SkkEZTZjvaHiFoT1aeH5Rj+xCmh4iO+sB9HQaLk6x0QSl/OEkSidzM9D5ijuT4UAVZ6Rlr8k1k4U6XNcAgcRnyDKdQA5HE+LwtLX0UyJLyLi3qPkWAwLxhxBoOzFO3hRlxCpabJvi4VqbToJv3JW7QxanYj8pQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(39860400002)(346002)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(478600001)(66556008)(316002)(66476007)(66946007)(110136005)(31686004)(8936002)(8676002)(4326008)(6486002)(54906003)(6506007)(5660300002)(53546011)(86362001)(31696002)(82960400001)(38100700002)(6512007)(2906002)(26005)(83380400001)(41300700001)(2616005)(6666004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHBEd3YrM0tXVUlaQW5xTVY5Uk8zY1ZwK0ZnYXZ0Ry9HUU1naWc5aWRkcXUr?=
 =?utf-8?B?UWYxMWFIbExUdTBvZG1GS3RhYzhYcUFiaXoyYVpYR0ErWWNEUXJ1SGs5MHZ6?=
 =?utf-8?B?Vk8zVm9xU1ZZK05IMHRtRVdnWUprNFBUUW9zb0x2SmtKK0lqZFlqaGc0ZmIy?=
 =?utf-8?B?UzA1bEZ1Tzk5ZFpLdkFXQXg2UEowa1h0SUFRcFhWV2Q3TDlORGFra3ZYYlUz?=
 =?utf-8?B?SFdDR1lvbnZjVi9aaEo3aUxidjRodE9VMEcvMVJLa2l1SzFyMUlBVVRsNmpR?=
 =?utf-8?B?ZDRoYU42dHI4N0llQVU0aGI4aHF5b2NkRjBDNFVTdlRSSVFQd2dvcEVDWGE1?=
 =?utf-8?B?bTRNYzF2WkJ0M3BDRjVhdXJBN3U3VmdQcWJUYmdLUmt0VStOVWRVRTZQTEVv?=
 =?utf-8?B?andRajkxR29oOGtXcUhoR1hBOWpDQ0RMbVhialIyLytZRVV1WTZKM1RtUXp2?=
 =?utf-8?B?eldRYUFRdWhtWFNtTm9INU43dHEvL0NLTXFXWVh5T1VSaUR5YXphMDhGMlMz?=
 =?utf-8?B?QlJPRUREMmJEcUlSWmZHOGdoTVBzWjJiQmRhYmNudWdxKzViQTJTT21wNkZB?=
 =?utf-8?B?Q2xNR1FXR0hQamJIcms2TU0zL3pITjZmTVN1Mm1OWndRcG1PRlpINm0wTE9z?=
 =?utf-8?B?dmtmZ0VtZGdCT3hDZnVmTjVIRml4RUJJOFAyRVV1Wkx0THZSWjRwczMyRVNW?=
 =?utf-8?B?czNoZmVleUgyZDRuVXA0TG9Oakd5OE52c0I1US9WTkc1Sk1CVW1CMisvc3or?=
 =?utf-8?B?OWVpcWhUZGlEeDZWTW9PQlBuSGxTWWpwcmhIZkgxN0REcWY5L0lWSVdJOE9V?=
 =?utf-8?B?a2ZneW1tWXhZSmV6b2Y4YlJweGlFU01TRERZZHVjSHEyTm54eHlwWENHeGp4?=
 =?utf-8?B?alNWZUtUWlc5a1JMMzc5Y0lDSlBmUnBLbUpvZkpBYmQ4bmcwOVpwS3hKTmJt?=
 =?utf-8?B?L0M0TzlweG0rM2ZUT2NuWlpPWkRtUENhYzA1bEJCWDFReDdUUEkxNDF6dUdU?=
 =?utf-8?B?OFl0QWM5ZkVEcENlRVR2SDlpL21leVVpRU5WaWxwdnZYajdTT1VpYU9ncndM?=
 =?utf-8?B?UEl2d0pudU0yU2ZkUlp5ZWRuOWMwRnZPdlBLVlRiTzRMQTAxOXhvQlo2UFRp?=
 =?utf-8?B?ZW95Q215emkxMlhSbWRHUnhyNU1rREJzdDU3RHFNVTM3alZ1MGJ3djlhcldy?=
 =?utf-8?B?blE3VStWeVdpcElYM2hEblFuaGRPZks1YWc5aUZuN0c3UmJiM2svbkxkaWF3?=
 =?utf-8?B?ZGc3UGk4dngvQnQvWjhHb0F5WGorOE96bVpZbm0vYWhDbU1vbzNsT1c2aHhj?=
 =?utf-8?B?Qi94dWZodlkvUTJ4UWhmSnZDZjlLZTl0RUVHZGJKUHJTWnV0OFRUNDVIaW1Q?=
 =?utf-8?B?aUExbUpMajFGYVNjZWluYm51QnV0cHY5WDFUcWc4NnFaek9tMEg4dXdpYlNX?=
 =?utf-8?B?UjZzMzU3RlluOVZHSG9GYjVBcDdiNFJjM3p5YXVZbFdMSWZRUUNibWdkQU5B?=
 =?utf-8?B?d1NPRUdwWEJ5Z3N5clo0ZjFkdGFGUUVINTBIeFhHa2hqTHBreHhCakdzcWVp?=
 =?utf-8?B?aEg3V1Z2bFhoZmZydWVRWTRqcTFXSkdoamNLTkpnTDB3OGRxN20xajR6Z1dM?=
 =?utf-8?B?TGRaY2VsNHlHNWRkSklReDBPb3J1QUFpRUlVTDdPeXBtNENZcWZCcGRWdHFV?=
 =?utf-8?B?Y29jelNPZHBwck9seDEvYTdYR1FFNU1xajNiYnJPbFVTN2p5Q2ROSU1kMUdE?=
 =?utf-8?B?WDQycHFOZVQ0U0xJeDBQODhUNHhLSGptMGU1b3l4Y21nbkFhYUdydWpzVTY3?=
 =?utf-8?B?aHVzZUF0VU9uWFAvWUphWm9VRjJKL1pzVmt6aFpmYUt2cWlxdU9xWTdIblBl?=
 =?utf-8?B?ZUNLU0ZNZHV0cHBJYUNJUVpaU0orTGd0QXVSc1EwMml3bnBhQXRnQ1VBaU90?=
 =?utf-8?B?RUUyamhRdU53aVZvZ1Q2eTNGY0trMElvdWdlN3hseElRRlRWbFdiVmtEUmRR?=
 =?utf-8?B?bkdSdm1yUVR0QzZwK3ZHM0xKOTMvUllCMXRqTXlLV0djSGNZLy9wTlp6WUNr?=
 =?utf-8?B?NWErck5XdE1WVklHUjhPbjFIZThPRFhhT1dxWUoySWRqUEthYWdtalBlL2g4?=
 =?utf-8?B?K3F6VXBwWkxVM0Z4ejR3bWhuanFqaCtNcERMTm8wbjBGVUFBY0xhRGFXZEVk?=
 =?utf-8?B?REE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1b1cefd-e696-46a5-5fe0-08dbd5f9b36f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 08:01:12.2197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MSJX+mqOmnHemfi/2WdRkvPzuwqDbI4goMptkoPNofWXnG9QgjnZ2F9R9IWxVZHjunrHC6EJct7jmd1mArVvKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5272
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/3] drm/xe/hwmon: Wrap 64 bit reg
 accesses to xe_hwmon_process_reg
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
Cc: "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 19-10-2023 11:34, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Nilawar, Badal <badal.nilawar@intel.com>
>> Sent: Thursday, October 19, 2023 12:34 AM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Dixit, Ashutosh
>> <ashutosh.dixit@intel.com>; andi.shyti@linux.intel.com; Tauro, Riana
>> <riana.tauro@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
>> Subject: [PATCH v2 1/3] drm/xe/hwmon: Wrap 64 bit reg accesses to
>> xe_hwmon_process_reg
>>
>> Maintain single wrapper for 32 bit and 64 bit reg accesses
> Missing full stop here.
> The patch should do only  the stuff mentioned in subject, converting function
> to void should be another patch.
I think I will rename patch as refactor patch and add some details about 
it in commit message.

Regards,
Badal
> With that,
> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>>
>> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_hwmon.c | 122 +++++++++++++---------------------
>>   1 file changed, 45 insertions(+), 77 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
>> b/drivers/gpu/drm/xe/xe_hwmon.c index 9ac05994a967..08c7289723ae
>> 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -26,9 +26,9 @@ enum xe_hwmon_reg {
>>   };
>>
>>   enum xe_hwmon_reg_operation {
>> -	REG_READ,
>> -	REG_WRITE,
>> -	REG_RMW,
>> +	REG_READ32,
>> +	REG_RMW32,
>> +	REG_READ64,
>>   };
>>
>>   /*
>> @@ -95,49 +95,34 @@ static u32 xe_hwmon_get_reg(struct xe_hwmon
>> *hwmon, enum xe_hwmon_reg hwmon_reg)
>>   	return reg.raw;
>>   }
>>
>> -static int xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum
>> xe_hwmon_reg hwmon_reg,
>> -				enum xe_hwmon_reg_operation operation,
>> u32 *value,
>> -				u32 clr, u32 set)
>> +static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum
>> xe_hwmon_reg hwmon_reg,
>> +				 enum xe_hwmon_reg_operation operation,
>> u64 *value,
>> +				 u32 clr, u32 set)
>>   {
>>   	struct xe_reg reg;
>>
>>   	reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg);
>>
>>   	if (!reg.raw)
>> -		return -EOPNOTSUPP;
>> +		return;
>>
>>   	switch (operation) {
>> -	case REG_READ:
>> +	case REG_READ32:
>>   		*value = xe_mmio_read32(hwmon->gt, reg);
>> -		return 0;
>> -	case REG_WRITE:
>> -		xe_mmio_write32(hwmon->gt, reg, *value);
>> -		return 0;
>> -	case REG_RMW:
>> +		break;
>> +	case REG_RMW32:
>>   		*value = xe_mmio_rmw32(hwmon->gt, reg, clr, set);
>> -		return 0;
>> +		break;
>> +	case REG_READ64:
>> +		*value = xe_mmio_read64_2x32(hwmon->gt, reg);
>> +		break;
>>   	default:
>>   		drm_warn(&gt_to_xe(hwmon->gt)->drm, "Invalid xe hwmon
>> reg operation: %d\n",
>>   			 operation);
>> -		return -EOPNOTSUPP;
>> +		break;
>>   	}
>>   }
>>
>> -static int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon,
>> -				       enum xe_hwmon_reg hwmon_reg, u64
>> *value)
>> -{
>> -	struct xe_reg reg;
>> -
>> -	reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg);
>> -
>> -	if (!reg.raw)
>> -		return -EOPNOTSUPP;
>> -
>> -	*value = xe_mmio_read64_2x32(hwmon->gt, reg);
>> -
>> -	return 0;
>> -}
>> -
>>   #define PL1_DISABLE 0
>>
>>   /*
>> @@ -146,42 +131,39 @@ static int xe_hwmon_process_reg_read64(struct
>> xe_hwmon *hwmon,
>>    * same pattern for sysfs, allow arbitrary PL1 limits to be set but display
>>    * clamped values when read.
>>    */
>> -static int xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long
>> *value)
>> +static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long
>> +*value)
>>   {
>> -	u32 reg_val;
>> -	u64 reg_val64, min, max;
>> +	u64 reg_val, min, max;
>>
>> -	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ,
>> &reg_val, 0, 0);
>> +	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
>> REG_READ32, &reg_val,
>> +0, 0);
>>   	/* Check if PL1 limit is disabled */
>>   	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
>>   		*value = PL1_DISABLE;
>> -		return 0;
>> +		return;
>>   	}
>>
>>   	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
>>   	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon-
>>> scl_shift_power);
>>
>> -	xe_hwmon_process_reg_read64(hwmon, REG_PKG_POWER_SKU,
>> &reg_val64);
>> -	min = REG_FIELD_GET(PKG_MIN_PWR, reg_val64);
>> +	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU,
>> REG_READ64, &reg_val, 0, 0);
>> +	min = REG_FIELD_GET(PKG_MIN_PWR, reg_val);
>>   	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
>> -	max = REG_FIELD_GET(PKG_MAX_PWR, reg_val64);
>> +	max = REG_FIELD_GET(PKG_MAX_PWR, reg_val);
>>   	max = mul_u64_u32_shr(max, SF_POWER, hwmon->scl_shift_power);
>>
>>   	if (min && max)
>>   		*value = clamp_t(u64, *value, min, max);
>> -
>> -	return 0;
>>   }
>>
>>   static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long
>> value)  {
>> -	u32 reg_val;
>> +	u64 reg_val;
>>
>>   	/* Disable PL1 limit and verify, as limit cannot be disabled on all
>> platforms */
>>   	if (value == PL1_DISABLE) {
>> -		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
>> REG_RMW, &reg_val,
>> +		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
>> REG_RMW32, &reg_val,
>>   				     PKG_PWR_LIM_1_EN, 0);
>> -		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
>> REG_READ, &reg_val,
>> +		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
>> REG_READ32, &reg_val,
>>   				     PKG_PWR_LIM_1_EN, 0);
>>
>>   		if (reg_val & PKG_PWR_LIM_1_EN)
>> @@ -192,21 +174,19 @@ static int xe_hwmon_power_max_write(struct
>> xe_hwmon *hwmon, long value)
>>   	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon-
>>> scl_shift_power, SF_POWER);
>>   	reg_val = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1,
>> reg_val);
>>
>> -	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW,
>> &reg_val,
>> +	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
>> REG_RMW32, &reg_val,
>>   			     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val);
>>
>>   	return 0;
>>   }
>>
>> -static int xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon,
>> long *value)
>> +static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon,
>> long
>> +*value)
>>   {
>> -	u32 reg_val;
>> +	u64 reg_val;
>>
>> -	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ,
>> &reg_val, 0, 0);
>> +	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU,
>> REG_READ32, &reg_val,
>> +0, 0);
>>   	reg_val = REG_FIELD_GET(PKG_TDP, reg_val);
>>   	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon-
>>> scl_shift_power);
>> -
>> -	return 0;
>>   }
>>
>>   /*
>> @@ -233,13 +213,11 @@ static void
>>   xe_hwmon_energy_get(struct xe_hwmon *hwmon, long *energy)  {
>>   	struct xe_hwmon_energy_info *ei = &hwmon->ei;
>> -	u32 reg_val;
>> -
>> -	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
>> +	u64 reg_val;
>>
>>   	mutex_lock(&hwmon->hwmon_lock);
>>
>> -	xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS,
>> REG_READ,
>> +	xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS,
>> REG_READ32,
>>   			     &reg_val, 0, 0);
>>
>>   	if (reg_val >= ei->reg_val_prev)
>> @@ -253,8 +231,6 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon,
>> long *energy)
>>   				  hwmon->scl_shift_energy);
>>
>>   	mutex_unlock(&hwmon->hwmon_lock);
>> -
>> -	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
>>   }
>>
>>   static const struct hwmon_channel_info *hwmon_info[] = { @@ -284,16
>> +260,14 @@ static int xe_hwmon_pcode_write_i1(struct xe_gt *gt, u32 uval)
>>   			      uval);
>>   }
>>
>> -static int xe_hwmon_get_voltage(struct xe_hwmon *hwmon, long *value)
>> +static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, long *value)
>>   {
>> -	u32 reg_val;
>> +	u64 reg_val;
>>
>>   	xe_hwmon_process_reg(hwmon, REG_GT_PERF_STATUS,
>> -			     REG_READ, &reg_val, 0, 0);
>> +			     REG_READ32, &reg_val, 0, 0);
>>   	/* HW register value in units of 2.5 millivolt */
>>   	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK,
>> reg_val) * 2500, SF_VOLTAGE);
>> -
>> -	return 0;
>>   }
>>
>>   static umode_t
>> @@ -322,9 +296,11 @@ xe_hwmon_power_read(struct xe_hwmon
>> *hwmon, u32 attr, int chan, long *val)
>>
>>   	switch (attr) {
>>   	case hwmon_power_max:
>> -		return xe_hwmon_power_max_read(hwmon, val);
>> +		xe_hwmon_power_max_read(hwmon, val);
>> +		return 0;
>>   	case hwmon_power_rated_max:
>> -		return xe_hwmon_power_rated_max_read(hwmon, val);
>> +		xe_hwmon_power_rated_max_read(hwmon, val);
>> +		return 0;
>>   	case hwmon_power_crit:
>>   		ret = xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
>>   		if (ret)
>> @@ -418,21 +394,13 @@ xe_hwmon_in_is_visible(struct xe_hwmon
>> *hwmon, u32 attr)  static int  xe_hwmon_in_read(struct xe_hwmon *hwmon,
>> u32 attr, long *val)  {
>> -	int ret;
>> -
>> -	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
>> -
>>   	switch (attr) {
>>   	case hwmon_in_input:
>> -		ret = xe_hwmon_get_voltage(hwmon, val);
>> -		break;
>> +		xe_hwmon_get_voltage(hwmon, val);
>> +		return 0;
>>   	default:
>> -		ret = -EOPNOTSUPP;
>> +		return -EOPNOTSUPP;
>>   	}
>> -
>> -	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
>> -
>> -	return ret;
>>   }
>>
>>   static umode_t
>> @@ -564,15 +532,15 @@ xe_hwmon_get_preregistration_info(struct
>> xe_device *xe)  {
>>   	struct xe_hwmon *hwmon = xe->hwmon;
>>   	long energy;
>> -	u32 val_sku_unit = 0;
>> -	int ret;
>> +	u64 val_sku_unit = 0;
>>
>> -	ret = xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT,
>> REG_READ, &val_sku_unit, 0, 0);
>>   	/*
>>   	 * The contents of register PKG_POWER_SKU_UNIT do not change,
>>   	 * so read it once and store the shift values.
>>   	 */
>> -	if (!ret) {
>> +	if (xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT)) {
>> +		xe_hwmon_process_reg(hwmon,
>> REG_PKG_POWER_SKU_UNIT,
>> +				     REG_READ32, &val_sku_unit, 0, 0);
>>   		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT,
>> val_sku_unit);
>>   		hwmon->scl_shift_energy =
>> REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
>>   	}
>> --
>> 2.25.1
> 

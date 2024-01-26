Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7C7C47DDB
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 17:11:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9762410FC6F;
	Fri, 26 Jan 2024 17:11:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE88E10FC6F
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 17:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706289087; x=1737825087;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SxIOY0hIuNvuYmvty6opKLuRONUxkSytAfp9oFr8Zmg=;
 b=DSnOEEO0hy1KV3w2rfsbzrg5E2+eLLTIzXUmzlyjN/a9M0inTx4D36Av
 oeGNa5f7eWBq8Wi4DwGqSy5J0s3g4BHUUP++qaFmTROqU3lC/A+4ReiF4
 XWl6Me7VbPBjiC+radjRehYrPjMLRgTT9jWr2JtvIWbxfYnvN13FIszAa
 WLHx+I93hcKnWbCm7FwmH84YAWXdNDkjFjzckHYCyoP+VT1nv8jFwnFR+
 w9f4CZU16hISyD/ihxPZL7ilwe+5knEx6tBbssHk+6/A3m9IB6zRkeQkX
 5S22aD0fI3fbK9trEh14hLeXhczVUu9SKWU9B8Q+y9Wow6NY7gE7UHFqO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="466798289"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="466798289"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 09:11:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="877439896"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="877439896"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 09:11:25 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 09:11:24 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 09:11:24 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 09:11:24 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 09:11:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jxkdVPexYPWr1VCHRG0GfsSK0x6frVoVCSk4xOYvV8d+Rr/LYj/A9ZvHcvseXYnQoc4qmZX1nPmr8SvspjkFrToW82lFQqjV48sOf7+LCTbJcVMlBiViVmsUXzi3ttAupSFCtojzLQ6lkO7Atfc6qcaJ7ORg0Jq+RmEyECLhVR5FxYh1kay+OeDuUahfIg711piLoUzSgMecZBEETO2JVMiSuQeYiS13Qqp8EFUw0iEOIbftd+X/N8/Gyj7neT8mQ1GGvkTHk0ih2ZEqZ8AvsPqWukfmS5a4+xB1q6H7IjfRm7kvtTymO6iwineS1DlbJN9lQHZNFP1x7rUBdrl4qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2138/lQyTob3oG7uFnmVgKJRDwTJj2RD39GsE5Lu/s8=;
 b=CvL8YjPgU5tnqhsDMTWs+aiB0JfYqERZAJF5ag3FTjsDTl3XEfGFk+i2h0WL4FD/kc3HehVub0zJqn6GAro4foX4DLP0YSxZGjIAAz6oct0ZQXGdd4/vPdfEHFMkm3T0PUZtiMMQg32ho9VLj0ujiQm5u9+Wwb9RdW/gQXgQ7e+te6tNTet0fNRp4nQ2Gm9fN/WOM89Jt71/wGpyras5/VXlu2MEdk1UJhG9Gcc+bI1agJERzEENwAMQbs+nBTNyefBg3MFH2dkj38choVaXxv4qZes8jMwlTDH0PAigC7Dv0jd+QG6i50T+dz8W9H0D0NLZrbfITAbDaHVw9NPIZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SN7PR11MB7116.namprd11.prod.outlook.com (2603:10b6:806:29b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 26 Jan
 2024 17:11:21 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 17:11:21 +0000
Message-ID: <37d2cf67-85e0-4b30-b0d3-e55853303322@intel.com>
Date: Fri, 26 Jan 2024 22:41:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: Fix abi doc warnings
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20240126153943.2294003-1-badal.nilawar@intel.com>
 <5klw4ya4dqjb7krzgon44cn4gqyiuk3gemof7lvk73ge225bmv@uwouw7wmcj2p>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <5klw4ya4dqjb7krzgon44cn4gqyiuk3gemof7lvk73ge225bmv@uwouw7wmcj2p>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0016.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::18) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SN7PR11MB7116:EE_
X-MS-Office365-Filtering-Correlation-Id: c7483301-5c34-405d-9eaf-08dc1e91d122
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jInqlfGwPWE+oMIdp7ywORWpR+QsTJ9tdUGMqxOQUPy4UEyeIPLa+w2Yi0LI25ao+m067yukx9swLmQVP7+H+8Xn+IsvyTHuIOvOSsQUI6NFh9V9LCmCaGhDMi550Sp3n++76Bt2XqFDy6/oOHtZPcsR5HakBCbxqv0M7Uw0Emmf8+Nwgy7w9C9jT9hZS5uYcjLiTi2ZWoK9AZ0JHu6qEtwi3VHXe7aVbxGdN+nYe2ehD+1+hsuGvI6uZeGq+RjH85TOhWBtxmgWbDLsWVIyRn/12lCeJ/eKYmfzf+2Jd91mRqnUzkyNvxx+2ebKcYOefcX+a+Frhi6zM3JUgIuP0dQrwr8TBBpFR06cMBmBuaNxSb/DeKgZ8MdeeVBpsNAAfLlXFn6YEM9YBjCVHg4ZtzQE2sRzJjCBnVseuHvOdFZXlS5+yaqF+fRM8oXizVr5SFE6RN1owZ1Vrwau94oN2BQJc9wNnR9l1MjsY5Criep7AgLpQkW8OlfEQ9zBcnmYx/t4Nfl0VWpHx2HLLkYP6HenidzcO/ver6E+kq0kWsaKPZ4sbMgY9DWjqGOd5x98iGpO2L67uU1Z0ZTINoaNIp/9IGChmOd3+wmNw96qBSZQp7H98lqYEVP7OIqNVaeH+ath79TeZ6VEzO2EI3wB1b3h8UYmsP5H8rgfacw7ByPhGgyKSbS/SG42Io2Je7wJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(396003)(39860400002)(136003)(230922051799003)(230173577357003)(230273577357003)(1800799012)(451199024)(64100799003)(186009)(41300700001)(6666004)(53546011)(6506007)(2616005)(38100700002)(6512007)(26005)(4326008)(83380400001)(8936002)(66556008)(36756003)(110136005)(966005)(66946007)(66476007)(8676002)(478600001)(6636002)(316002)(6486002)(86362001)(82960400001)(31696002)(5660300002)(2906002)(107886003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUxIVzFZWFBHQ0RzbXcrTUNMVkc5ODV6Y0ZrMUF1a0R5cUJ4T1p6MU1jOUNw?=
 =?utf-8?B?Uit5RFZ0dHJyZUZmZGZGd3lHMEFidHBqeVpsZVFuNmJsZnV0L3dQOUc2QTND?=
 =?utf-8?B?YkZXMGFXaGpXUVRZcm54eVpBU21ObjhRUmUvM1VaS2FZTUY5c2t1MVdxQ01G?=
 =?utf-8?B?UnVPV2I3ZmlhczczTGk4RTdmSXp3OUZTSm5sTSthWVZFVyswRmpFUGdUancx?=
 =?utf-8?B?RzRaakpmSmZRK2hKeXgrQk0vOWxtOVZ0UGEvZTB2eGRPVkhmeHVVZzJ1VGFu?=
 =?utf-8?B?cjdLcHhxUjFMZTVuQ2lRY1VnOFhjc28zSDBqVTYzTDJNaXlJamVIWnpjVUFx?=
 =?utf-8?B?UVp4b0lDNzkyV01uTVVSWjdTNmZvNWIrTEJzWGpuakU0N010M3FIUGhiNnA1?=
 =?utf-8?B?cVJ1Y0xlcjBaYUVsdGRBTzgrYk9BRWsrTm5vdXdhNGN4SDB4SHFOUm5LR2hI?=
 =?utf-8?B?RWxlTThDc3YzNzJzNVRxUVFVYXZUS3Y5UjlxalFQYU5WbjlHMStBb0RLZStH?=
 =?utf-8?B?cDBBZ0RDdU5NbUJmQzlBdnVnZ0ljSGxwa25XaGNLcGRnb2VEbzBaVFhZRStv?=
 =?utf-8?B?R0cxYUFhS0Z4ekdXNm5NYnZCbExiSXpHMlN6QTB3alg3bGZWa2JpWTRhOHFp?=
 =?utf-8?B?SWoybkQwTExOQXZUM09ISjM3bkJqYnV1eDZveWtBQ2VhVDF5cmhSbGRnV1F4?=
 =?utf-8?B?ZWJVRXQyWXVkZFRUbi9yNnZTNU5jYmViUXBhRmlLYm1mL29HaDRTeFVrMnFq?=
 =?utf-8?B?VkV2b3pzc1ZtR3l1Y1JNRnpJWXZtM0V3UVh4dUpjUTc1UWpoZnpMa2FVZHoy?=
 =?utf-8?B?eTZpTGRzbjBXcW9jTisvYmRCWlFEc3RvVzhVMmFiZ3paVVJnNnR1K25FRURa?=
 =?utf-8?B?K0k4UzVsbnlhR2xwYW5zUGRWMnBKcHYvVEE2Y2JYR29qQ294REZKb2UwMHZ4?=
 =?utf-8?B?Q2VQY1lWazlnaEl6MVdQQXV4UFFJa1lkeGQxTGdlUFpyOHlYUzdHY3FkRDhK?=
 =?utf-8?B?V2hPN042cTdCUzFXYzdIWEloclhXNy9ndXBmVEROZlhrMmtsUUZUYWp5Tjcy?=
 =?utf-8?B?M2pIbjh4aUtQMjNJeGl5elE1WGVlY1kxZUh2cmlwMnNWODF1cldmSWpzSWsw?=
 =?utf-8?B?LzNLUXJsNFNwUUhVQkdqN01ZeEFKRFIrbkJ4VTgxU256M1hXeXhnaTczUDJs?=
 =?utf-8?B?WFdmdEtPNzdMT2FNWmFCNldSN0oxUFR3NTdiZzVNN0ltY2lRczd5WWJXdFZS?=
 =?utf-8?B?dG5kNnNOVnFIWER0aktCSVNRNnlXdzduVTI1NkxieWJ5SStnVXljK3NuSXNI?=
 =?utf-8?B?YVdodlZ6VHNuUGc2dTVPelFYbTRFNHQ4ZlloSnRQL3BPLzBMcHd0S3l5dHJT?=
 =?utf-8?B?TUtFK1J1aGJsZ1ZUd3ZaSmdDRmpQT1VmZy9WS2ZLMFJXWEV1TXRGbmFYSU0x?=
 =?utf-8?B?OFJJVXFNb2FJQmJGdDF1QXhwcmZhU2xUa1Q5cEFrcWt3RjA0bGtFM1ovbENR?=
 =?utf-8?B?YzdsSkNLd3U5am1CVWtrVDdnN2poazg4ZlBwNWYySm1Xdkt0Qi9LYkwrOVVN?=
 =?utf-8?B?V295dkcvditoYVZRQXZlM0drZTArcytnSlFpNVArSFArZFBjVmpnYTRYVXNt?=
 =?utf-8?B?dWc5cmJxcGVNeVRORHI0bzVzY2s3aFB2MjR3YUJZVWo3SnQvZHVxeXJQRkQ0?=
 =?utf-8?B?T05iaVlWVEhReTNodGtlcVVPMXEvYk91MG9NU3B6SFNnaDNPZFozZDc5TkVC?=
 =?utf-8?B?WG93Q3kvRnhrUjFOUHBpcmtKK1ZMZkdqTlNwRWwrNFhzTldoTlRjZGhGUm9a?=
 =?utf-8?B?TnRFT1B1NFpZS1R4NTU3VDJxVHhzZmExOWNmTStxTzhRV2k5MzdLY1lFRzBy?=
 =?utf-8?B?aGl4MlRkeFY4cHVOQkVWZzVxNzVoV0FLSjlzVVRZR3RkcEYrdForbVg5SVlw?=
 =?utf-8?B?NWRSK2g3TStEZ1luRUNpb3NITkxRb2VlOTRGMWl0dk9URldKZ3ZuQk1BZzZP?=
 =?utf-8?B?OVNURWEwMXpqdWZGejFQVE5tSXUwMFJRbWduUkdvZkVMQ3ZBYXpjUVhCRklL?=
 =?utf-8?B?c25EQmtzY1cvQmI3MWYxaVg4YjIxbTBELzdQNXlZRklTVEZaSGRMc1JCcG5V?=
 =?utf-8?B?dTQ4M3EvRWxDd3ltcE9XSDhkczFwb2xGYUZkellQdUoxZkNlY1g3MmlvRnVP?=
 =?utf-8?B?YkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7483301-5c34-405d-9eaf-08dc1e91d122
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 17:11:21.0483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kuEwQbE/y928Y9+OEv69GCPdpWW3wQRaaT6cnyIEm/PP5g1xHa8u9aCnB9BOETaPmKAZb5lS0K42kIgjN6U7sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7116
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
Cc: thomas.hellstrom@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 26-01-2024 21:35, Lucas De Marchi wrote:
> On Fri, Jan 26, 2024 at 09:09:43PM +0530, Badal Nilawar wrote:
>> Fix warnings in xe hwmon documentation
> 
> Please spell out the warning you are fixing. And:
> 
>      Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>      Closes: 
> https://lore.kernel.org/all/20240125113345.291118ff@canb.auug.org.au/
> 
> and Cc who was Cc'ed in that thread. From that thread, you need a
> Fixes trailer with at least one of the commits there, but I think adding
> all should be acceptable, too.
Sure I will fix above comments and resend patch.
> 
> i915 should also be changed from a doc pov since that path is also
> reachable for xe. I think this should be done in the same patch, but
> need confirmation from i915 since they'd need to ack it.
Shouldn't i915 fix be in separate patch on drmtip?

Regards,
Badal
> 
> Lucas De Marchi
> 
>>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>> .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 28 +++++++++----------
>> 1 file changed, 14 insertions(+), 14 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon 
>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> index 8c321bc9dc04..48544bd970ab 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> @@ -1,6 +1,6 @@
>> -What:        /sys/devices/.../hwmon/hwmon<i>/power1_max
>> +What:        /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_max
>> Date:        September 2023
>> -KernelVersion:    6.5
>> +KernelVersion:    6.8
>> Contact:    intel-xe@lists.freedesktop.org
>> Description:    RW. Card reactive sustained  (PL1) power limit in 
>> microwatts.
>>
>> @@ -12,17 +12,17 @@ Description:    RW. Card reactive sustained  (PL1) 
>> power limit in microwatts.
>>
>>         Only supported for particular Intel xe graphics platforms.
>>
>> -What:        /sys/devices/.../hwmon/hwmon<i>/power1_rated_max
>> +What:        /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_rated_max
>> Date:        September 2023
>> -KernelVersion:    6.5
>> +KernelVersion:    6.8
>> Contact:    intel-xe@lists.freedesktop.org
>> Description:    RO. Card default power limit (default TDP setting).
>>
>>         Only supported for particular Intel xe graphics platforms.
>>
>> -What:        /sys/devices/.../hwmon/hwmon<i>/power1_crit
>> +What:        /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_crit
>> Date:        September 2023
>> -KernelVersion:    6.5
>> +KernelVersion:    6.8
>> Contact:    intel-xe@lists.freedesktop.org
>> Description:    RW. Card reactive critical (I1) power limit in 
>> microwatts.
>>
>> @@ -33,9 +33,9 @@ Description:    RW. Card reactive critical (I1) 
>> power limit in microwatts.
>>
>>         Only supported for particular Intel xe graphics platforms.
>>
>> -What:        /sys/devices/.../hwmon/hwmon<i>/curr1_crit
>> +What:        /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/curr1_crit
>> Date:        September 2023
>> -KernelVersion:    6.5
>> +KernelVersion:    6.8
>> Contact:    intel-xe@lists.freedesktop.org
>> Description:    RW. Card reactive critical (I1) power limit in 
>> milliamperes.
>>
>> @@ -44,25 +44,25 @@ Description:    RW. Card reactive critical (I1) 
>> power limit in milliamperes.
>>         the operating frequency if the power averaged over a window
>>         exceeds this limit.
>>
>> -What:        /sys/devices/.../hwmon/hwmon<i>/in0_input
>> +What:        /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/in0_input
>> Date:        September 2023
>> -KernelVersion:    6.5
>> +KernelVersion:    6.8
>> Contact:    intel-xe@lists.freedesktop.org
>> Description:    RO. Current Voltage in millivolt.
>>
>>         Only supported for particular Intel xe graphics platforms.
>>
>> -What:        /sys/devices/.../hwmon/hwmon<i>/energy1_input
>> +What:        /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/energy1_input
>> Date:        September 2023
>> -KernelVersion:    6.5
>> +KernelVersion:    6.8
>> Contact:    intel-xe@lists.freedesktop.org
>> Description:    RO. Energy input of device in microjoules.
>>
>>         Only supported for particular Intel xe graphics platforms.
>>
>> -What:        /sys/devices/.../hwmon/hwmon<i>/power1_max_interval
>> +What:        
>> /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_max_interval
>> Date:        October 2023
>> -KernelVersion:    6.6
>> +KernelVersion:    6.8
>> Contact:    intel-xe@lists.freedesktop.org
>> Description:    RW. Sustained power limit interval (Tau in PL1/Tau) in
>>         milliseconds over which sustained power is averaged.
>> -- 
>> 2.25.1
>>

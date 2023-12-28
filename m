Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11F7C3DA6E
	for <intel-xe@archiver.kernel.org>; Thu, 28 Dec 2023 10:05:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 675B210E26A;
	Thu, 28 Dec 2023 10:05:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D56010E26A
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Dec 2023 10:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703757899; x=1735293899;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jSptX5o5SZAhu2dKbArHAXyNcz+5oddDDV9s3Eo8oqY=;
 b=gR975+GwLI8v8ZStBLomcv+jjUhDvCxrTpZ5QCK9c2jeJYYDvzAKobn3
 zNyqM12ETkEW3VD9MxgyIQAzQ7ygjuM5yYv+xDg5BpdSAC0J7oV4PVGB4
 NXbEkW9FQNw1GbUicOqBQmNuGesRQQi3IkLbO0N25+v4ZyzQjCwG8rdBf
 yLnu6tdbHm1gS7dlOw317KnWOvVgiaRj1kpraqimLfFYV7yYEeloOynRJ
 DURdZXWyd5iItcbHlUHc0uD8j1TXsrUG5k+YSxKS43csdfF4UOEnJ+bt1
 owsHI2xjQptlTsyHwgn8uCmosAaDnq6e7RhwecFFwrFk/z2APEJk/B1gE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="3378772"
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; 
   d="scan'208";a="3378772"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2023 02:04:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="807385777"
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; d="scan'208";a="807385777"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Dec 2023 02:04:57 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Dec 2023 02:04:57 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Dec 2023 02:04:56 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Dec 2023 02:04:56 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Dec 2023 02:04:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6XeC+0RrqedLAyO/k6Dxd5DvETYnFu2HJ7XV4+2+oXU0mXbxip0RA0/o4IfWWEhArhYTG4JpCyGcfIU1CXYbwkLDK4fIxAeiSfpZlNZOCFu/9uU4BeO7xzrGMaaH2EWTVxRzUvyC7EmwGqdI5x/75Apv9BWaFIRdU/NIbX9Wxx1b8dxsqUTODH7BpKDchQqu3fUFINeTTBNpENdp2kaoGVdTRyUqDOd5TcmIBoLVrkLcw/60EM95Kzc4qWbX4toajrTr1YpmyYkEz+ggdw0OKVQ44vnxA4ni3lSg9Oo1DbFm3R+pPHF4o0CAGqD/TbXpXRKoxTEf2IldOnPIaqBpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXoR14zp9MPvigkbvLYahee4HmkwTlmLYDqoaTybYpo=;
 b=MdzsV89LKKbe3N533zU2i8xkHiYGdW+LypigqpzigOLHCkQXQn9mw6adUd0JptFXYxTf4ztHcfEhxO82Lp53/gp5CzZH+GYYvH/agYDO6bz0wxl3JthVcmLfYjK0vTfQR8+T+sMFx17jwXDTAWSvS8/Kz9h25YJr1itk+DlHTg0RXnuqoIc9/09vP0HSZNdsNG1y5AuPUw9qoHHyxdxVSSTMuRHuCyac6Z8ZXJJ5WML4bJeW3dmmKrKEFRLotQIH1nivvpV+mJBQdgjiofEP4ys1eWpk307xKhxc+L1ngqeeytdhJBCquGp5rFqCgvQERDDFYkG9yoMrSpf2Cn+4NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 SJ2PR11MB7646.namprd11.prod.outlook.com (2603:10b6:a03:4c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Thu, 28 Dec
 2023 10:04:54 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7135.019; Thu, 28 Dec 2023
 10:04:54 +0000
Message-ID: <835dc339-16bd-4a5d-beb5-c3ab51262f8d@intel.com>
Date: Thu, 28 Dec 2023 15:34:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v6] drm/xe: Add vram frequency sysfs attributes
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231222110631.999517-1-sujaritha.sundaresan@intel.com>
 <CY5PR11MB6211B2AC3B3E3B1A926252219594A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <369acab0-b07e-48d3-ad90-c28969e8957e@intel.com>
 <CY5PR11MB62110361C1C67AD8ABA5AA259598A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <9c0e0cda-5768-4c0a-973e-74ecfdf2ce8b@intel.com>
 <CY5PR11MB62110375C2241F8AE3AFFE99959FA@CY5PR11MB6211.namprd11.prod.outlook.com>
 <3f701189-fb71-493b-ba7f-7699df458fa1@intel.com>
Content-Language: en-US
In-Reply-To: <3f701189-fb71-493b-ba7f-7699df458fa1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2P287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::16) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|SJ2PR11MB7646:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f59a91c-36d6-4cb0-c2e9-08dc078c6fb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0rj7kCEp+/Kpwwvg6d6Q06TEJwGcnjz/oZfqhRGIuGg8T4TDPeZsgcABvejLhn4qwXOFjAQpc3caHS7SO/V+QHaD47e2JO9ZYWfx5jvfyEyoojyzRlYy0tKtyMob0EwyQPLC0d0tPTHQZJJTuOZzwYM4O+dQ99qGpk8aFF8Justq8iPPvMT7G/gQ160poWMc0iU6LQ/IgB8v+NR2pn6z6nkJM/b0mFKEi3xtMOxA+wfGmbrUgWsKZR6neN/S9AMSR4O+Dt5SXsDIsFbzl2YIdm09GKMrrfk2+dvlxXflCfGhtq2tg/JrxPHpoJofySjWOxZJ0h/TKsR0Dqt2CwOoOegK9OHcGer4/6volI7/u5v+b6ik7JmF7mzRqlkjKHcLHpKOQD4sh1vUlVIRpHCsd5Fzqi5LcceCrgd5GLyzXxkqNY5IAgjq22bdXkFbdl2JW3Pm72FsNyftsNiC5RmDfiLjO4AFwmedZZsj7hKJ9y+zDUzLbzieP381idOPTQ+oO5YlS0uk2apgoSVWxO0sZqIZyzp/F60bzJlLop/0q7eQL0uwxC93mco4W444G9r/E6DA8cyp85IYYoH9gOGYRjC8XkxyCNVnZNvt9CwmimX7ogoMzieoz2TOplZAYCegxl5/X1Jyp6CRyQxUdtJtPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(376002)(366004)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(36756003)(31686004)(6666004)(6506007)(6512007)(53546011)(6486002)(66946007)(66556008)(66476007)(86362001)(31696002)(26005)(38100700002)(82960400001)(83380400001)(41300700001)(2616005)(5660300002)(2906002)(4326008)(107886003)(478600001)(110136005)(30864003)(8676002)(316002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnBINWxDRTlMZmxZa2syT01sS0NBU3RlalZwdENGcG5LWUk0OGlqZXJiNlR6?=
 =?utf-8?B?T1dCQm9lU2FhWk01YUZHOE5EM1pJZ3JuY0lGazM2V2F5cFdwUWkyaDY2NnFa?=
 =?utf-8?B?Y002Ri9kUUlaQ0xkNVRCL215L3g3TEwxWTExSTRlcjEyTXRJM1NrVVZhMDNT?=
 =?utf-8?B?NWczOWpncWNocytJSjdZb2E2aFl5UlFCdHRsZndtdUFTamZRdms4WThtUUc1?=
 =?utf-8?B?TGY5KzhIay9UQ3k3TXp3dTViRnpXZFVReldiZjRqY0pqM3FwME5OYjdQbFM4?=
 =?utf-8?B?WExxMC9ma2xmeld0eHFnYmRyeGc5bWg3OTkyR2VTZFZwU3dIL0ZkcWdObm1Y?=
 =?utf-8?B?UEZJYjNWSkZiRmJod2h6QktPRi9kcGtxRTlOdnFYUEp5NWFuRjEvQlY0TUQv?=
 =?utf-8?B?TzNGem8yT2h1UVlOK2ZGUjRQdWN1VGt1ZlBzQzZDZTR4TytndHpYdUdhbmVI?=
 =?utf-8?B?enRZV0lucXRndTc0RFROR2xXZVQyTjM3ZkdESUtjRVR4RmpVdC9STXdPTWd1?=
 =?utf-8?B?SFJyQkg5RXR3MjB0YXQzYTBXY0JraVJaZ09HMml5M2huN0lsNWFRY0VVc0pj?=
 =?utf-8?B?aERmb3k5TE03VEZsT3lWUGVIMnR1ZC8vZjhCT3RRZlNLTm9lbVJCcUV3dHVB?=
 =?utf-8?B?MXJYRWlVVHUzRmxjTmkrMTBjVzFBYkNqdElwTVlJQjBVazdWVnBVWGRONHdQ?=
 =?utf-8?B?anYyU1ZwTVdrU3NMeUV6aTZzQUhSa3cyRXpNZDV4bmZjWUpRL2VLQVhScHhp?=
 =?utf-8?B?Y1dCSnZ3cHVQRG54dkRpK05nWUdyNFVBclB0NllFQ0ZTelJEd1pJNkQ1Nm43?=
 =?utf-8?B?aENMV0Y1bU5Wb0hBREFndHNnTCtHOWo5VmNKRVhrWm5ocCtlSkd1QTRtZnBa?=
 =?utf-8?B?eVlCWFhPVVJrclVvZTd6emJPQ290d0g4UmZwbUcxUmNWQnBqdWZmYjg0QUNh?=
 =?utf-8?B?UU5uNDJZUWFBS1U1WmNXQWM0Q3JZRU5OdVFqNzRiL0Y5Ymd5U2tlUDcxU09o?=
 =?utf-8?B?L2FiL21YbFpCR2NYcGVBOXBETXcyNUJUajZ0Y25Yc3k0RTlwU3pCa3RONG9W?=
 =?utf-8?B?S3pPdXBuUXEzK3pGWCtDZXR2RmRXUmhNNDMzRHlrd0FnNmFEcGsxQmNJRUN2?=
 =?utf-8?B?ZDdMVm9kMGhIaVl3VFZISTljSXhrd3pieTRVeklkbE5aZGx3YWRjVVhzeGVZ?=
 =?utf-8?B?UjJUSzN6RHJ5Mk5TUVVadVFJN1o4OHZqbWhFdnRmUldzbWNGNUsxWGtLRHNP?=
 =?utf-8?B?NTErbWtNLzlwNzU0NlZYK3JpUCt4d3Q3c3ZQVE9TU3lJOFp5QU5JV29MZDA0?=
 =?utf-8?B?ZytkMWZZT2pIWmFhRUZzdUxKNERnOXh1bXNERVN6b2Q0UFdVbWhSb2VaQkxH?=
 =?utf-8?B?UGVKYVRKNXZpTUJFSjNndzlMM05BWS9KZU9iQXUzWXFDL0RZWVR6SkNEOUlP?=
 =?utf-8?B?aWs4R2oreEtnd3dXcFgrMWZ6U29wbEQvL1BMMDRJVUNib2tPamNuVS8ydHRR?=
 =?utf-8?B?LzhzYWhsQkRhSTg4ZWoyaVhkT0RWUTdXTnJoR2IyVEtqeCt5MnpjQ2FnU3Va?=
 =?utf-8?B?dkR6SFRYY0Zrc0lnYWRlc2ZhVXE0R1l3UGZTUnZJYjBrQVJXZWxOemFBNmN1?=
 =?utf-8?B?V2oyRU9sL0RVbE5XT1RlZ0tjdkwrMitpSjhDQUk3T0I1WWhWVWpNUFkva2tD?=
 =?utf-8?B?MExybm5kUDNYQ1RzV1ZaaEQvVHFrZTF2d2ZiOVNTQ25Lbm8wMVpERllKUUlZ?=
 =?utf-8?B?QytLdlZuYXRSYndUOEhSdVFsVlFBaUcrM3EyeXgyZDlNSXVxZTBjaEdta2VV?=
 =?utf-8?B?NVV3UVJaZ2ZiSWtDQUpEOXdyOTE1RFJoSGswdWZSU2tTRWJVWHdmdzFvRXh4?=
 =?utf-8?B?bG43R3lBcncyMFdUUjg3VXFzZjRHOS85VG5scHFheDN2MER3UkRTckhZaEZV?=
 =?utf-8?B?amE2OGoyVzYzWTlKNU44bDZQd2FHZGtDMXd1VFBZZjZYcmRnRUJDVFE0RGFV?=
 =?utf-8?B?Z08rWE1QYnZOckxqb0doeUZDRHIvVW1uM3JubGEvR1FpbDZhMUFHVGFTdDVZ?=
 =?utf-8?B?NnVVZ0loY0ZPKy91a29GZ3RiUU90RTdmQUgyT2t2K1hnSXFuSFNZNisyWjM2?=
 =?utf-8?B?L1llenpucDVRVVg5OGZUaEhieXJ5QkxzdVNyQjNaOTRVM3pRTkVWQ01sZDVw?=
 =?utf-8?B?b1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f59a91c-36d6-4cb0-c2e9-08dc078c6fb5
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 10:04:53.9895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8XaLnZTQHLbQb96ZzWfC30T3nd0M8ApN550c+uBWR3yToqEHTPfD5DDC7Vfz+TRpW43EwWBirEtAP3kXiu5PxTk2b49GKl/aRfAhn31DF+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7646
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 12/27/2023 5:48 PM, Sundaresan, Sujaritha wrote:
>
> On 12/27/2023 4:26 PM, Gupta, Anshuman wrote:
>>
>>> -----Original Message-----
>>> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>>> Sent: Wednesday, December 27, 2023 3:01 PM
>>> To: Gupta, Anshuman <anshuman.gupta@intel.com>; intel-
>>> xe@lists.freedesktop.org
>>> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>>> Subject: Re: [v6] drm/xe: Add vram frequency sysfs attributes
>>>
>>>
>>> On 12/26/2023 7:58 PM, Gupta, Anshuman wrote:
>>>>> -----Original Message-----
>>>>> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>>>>> Sent: Tuesday, December 26, 2023 10:02 AM
>>>>> To: Gupta, Anshuman <anshuman.gupta@intel.com>; intel-
>>>>> xe@lists.freedesktop.org
>>>>> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>>>>> Subject: Re: [v6] drm/xe: Add vram frequency sysfs attributes
>>>>>
>>>>>
>>>>> On 12/22/2023 7:34 PM, Gupta, Anshuman wrote:
>>>>>>> -----Original Message-----
>>>>>>> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>>>>>>> Sent: Friday, December 22, 2023 4:37 PM
>>>>>>> To: intel-xe@lists.freedesktop.org
>>>>>>> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Gupta, Anshuman
>>>>>>> <anshuman.gupta@intel.com>; Sundaresan, Sujaritha
>>>>>>> <sujaritha.sundaresan@intel.com>
>>>>>>> Subject: [v6] drm/xe: Add vram frequency sysfs attributes
>>>>>>>
>>>>>>> Add vram frequency sysfs attributes under the below hierarchy;
>>>>>>>
>>>>>>> /device/tile#/memory/freq0
>>>>>>>             |-max_freq
>>>>>>>             |-min_freq
>>>>>>>
>>>>>>> v2: Drop "vram" from attribute names (Rodrigo)
>>>>>>>
>>>>>>> v3: Add documentation for new sysfs (Riana)
>>>>>>>        Drop prefix from XEHP_PCODE_FREQUENCY_CONFIG (Riana)
>>>>>>>
>>>>>>> v4: Create sysfs under tile#/freq0 after removal of
>>>>>>>        physical_memsize attrbute
>>>>>>>
>>>>>>> v5: Revert back to creating sysfs under tile#/memory/freq0
>>>>>>>        Remove definition of GT_FREQUENCY_MULTIPLIER (Rodrigo)
>>>>>>>
>>>>>>> v6: Rename attributes to max/min_freq (Anshuman)
>>>>>>>        Fix review comments (Rodrigo)
>>>>>>>
>>>>>>> Signed-off-by: Sujaritha Sundaresan
>>>>>>> <sujaritha.sundaresan@intel.com>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/xe/xe_pcode_api.h  |  7 +++
>>>>>>> drivers/gpu/drm/xe/xe_tile_sysfs.c | 86
>>>>>>> ++++++++++++++++++++++++++++++
>>>>>>>     2 files changed, 93 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h
>>>>>>> b/drivers/gpu/drm/xe/xe_pcode_api.h
>>>>>>> index 5935cfe30204..f153ce96f69a 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>>>>>>> @@ -42,6 +42,13 @@
>>>>>>>     #define        POWER_SETUP_I1_SHIFT        6    /* 10.6 fixed
>>>>>>> point format */
>>>>>>>     #define        POWER_SETUP_I1_DATA_MASK
>>>>>>>     REG_GENMASK(15, 0)
>>>>>>>
>>>>>>> +#define   PCODE_FREQUENCY_CONFIG        0x6e
>>>>>>> +/* Frequency Config Sub Commands (param1) */
>>>>>>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0    0x0
>>>>>>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN    0x1
>>>>>>> +/* Domain IDs (param2) */
>>>>>>> +#define     PCODE_MBOX_DOMAIN_HBM        0x2
>>>>>>> +
>>>>>>>     struct pcode_err_decode {
>>>>>>>         int errno;
>>>>>>>         const char *str;
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>>> index 0f8d3e7fce46..cdc9dbbc97b0 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>>> @@ -7,9 +7,21 @@
>>>>>>>     #include <linux/sysfs.h>
>>>>>>>     #include <drm/drm_managed.h>
>>>>>>>
>>>>>>> +#include "xe_gt_types.h"
>>>>>>> +#include "xe_pcode.h"
>>>>>>> +#include "xe_pcode_api.h"
>>>>>>>     #include "xe_tile.h"
>>>>>>>     #include "xe_tile_sysfs.h"
>>>>>>>
>>>>>>> +/**
>>>>>>> + * DOC: Xe Tile sysfs
>>>>>>> + *
>>>>>>> + * Provides sysfs entries for frequency in tile
>>>>>>> + *
>>>>>>> + * device/tile#/memory/freq0/max_freq - Maximum Frequency, not a
>>>>>>> configuration and read-only.
>>>>>> Let's increase verbosity of doc something explaining it is a fixed
>>>>>> fuse point not a
>>>>> configuration.
>>>>> Sure
>>>>>>> + * device/tile#/memory/freq0/min_freq - Minimum Frequency, not a
>>>>>>> configuration and read-only.
>>>>>>> + */
>>>>>>> +
>>>>>>>     static void xe_tile_sysfs_kobj_release(struct kobject *kobj)  {
>>>>>>>         kfree(kobj);
>>>>>>> @@ -20,6 +32,65 @@ static const struct kobj_type
>>>>>>> xe_tile_sysfs_kobj_type = {
>>>>>>>         .sysfs_ops = &kobj_sysfs_ops,
>>>>>>>     };
>>>>>>>
>>>>>>> +static ssize_t max_freq_show(struct device *kdev, struct
>>>>>>> +device_attribute
>>>>>>> *attr,
>>>>>>> +                 char *buf)
>>>>>>> +{
>>>>>>> +    struct kobject *kobj = &kdev->kobj;
>>>>>>> +    struct xe_tile *tile = kobj_to_tile(kobj->parent);
>>>>>>> +    struct xe_gt *gt = tile->primary_gt;
>>>>>>> +    u32 val, mbox;
>>>>>>> +    int err;
>>>>>>> +
>>>>>>> +    mbox = REG_FIELD_PREP(PCODE_MB_COMMAND,
>>>>>>> PCODE_FREQUENCY_CONFIG)
>>>>>>> +        | REG_FIELD_PREP(PCODE_MB_PARAM1,
>>>>>>> PCODE_MBOX_FC_SC_READ_FUSED_P0)
>>>>>>> +        | REG_FIELD_PREP(PCODE_MB_PARAM2,
>>>>>>> PCODE_MBOX_DOMAIN_HBM);
>>>>>>> +
>>>>>>> +    err = xe_pcode_read(gt, mbox, &val, NULL);
>>>>>>> +    if (err)
>>>>>>> +        return err;
>>>>>>> +
>>>>>>> +    /* data_out - Fused P0 for domain ID in units of 50 MHz */
>>>>>>> +    val *= 50;
>>>>>>> +
>>>>>>> +    return sysfs_emit(buf, "%u\n", val); } static
>>>>>>> +DEVICE_ATTR_RO(max_freq);
>>>>>>> +
>>>>>>> +static ssize_t min_freq_show(struct device *kdev, struct
>>>>>>> +device_attribute
>>>>>>> *attr,
>>>>>>> +                 char *buf)
>>>>>>> +{
>>>>>>> +    struct kobject *kobj = &kdev->kobj;
>>>>>>> +    struct xe_tile *tile = kobj_to_tile(kobj->parent);
>>>>>> If you are missing to create a kobject for freq0 , then this should
>>>>>> be
>>>>>> kobj->parent->parent.
>>>>> I don't think a kobject is needed for freq0, since it we are only
>>>>> using attribute_group for it.
>>>>>
>>>>> Similar to throttle_reasons.
>>>> Sure,  thanks for explanation.
>>>>>>> +    struct xe_gt *gt = tile->primary_gt;
>>>>>>> +    u32 val, mbox;
>>>>>>> +    int err;
>>>>>>> +
>>>>>>> +    mbox = REG_FIELD_PREP(PCODE_MB_COMMAND,
>>>>>>> PCODE_FREQUENCY_CONFIG)
>>>>>>> +        | REG_FIELD_PREP(PCODE_MB_PARAM1,
>>>>>>> PCODE_MBOX_FC_SC_READ_FUSED_PN)
>>>>>>> +        | REG_FIELD_PREP(PCODE_MB_PARAM2,
>>>>>>> PCODE_MBOX_DOMAIN_HBM);
>>>>>>> +
>>>>>>> +    err = xe_pcode_read(gt, mbox, &val, NULL);
>>>>>>> +    if (err)
>>>>>>> +        return err;
>>>>>>> +
>>>>>>> +    /* data_out - Fused Pn for domain ID in units of 50 MHz */
>>>>>>> +    val *= 50;
>>>>>>> +
>>>>>>> +    return sysfs_emit(buf, "%u\n", val); } static
>>>>>>> +DEVICE_ATTR_RO(min_freq);
>>>>>>> +
>>>>>>> +static struct attribute *freq_attrs[] = {
>>>>>>> +    &dev_attr_max_freq.attr,
>>>>>>> +    &dev_attr_min_freq.attr,
>>>>>>> +    NULL
>>>>>>> +};
>>>>>>> +
>>>>>>> +static const struct attribute_group freq_group_attrs = {
>>>>>>> +    .name = "freq0",
>>>>>>> +    .attrs = freq_attrs,
>>>>>>> +};
>>>>>>> +
>>>>>>>     static void tile_sysfs_fini(struct drm_device *drm, void 
>>>>>>> *arg)  {
>>>>>>>         struct xe_tile *tile = arg;
>>>>>>> @@ -32,6 +103,7 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>>>>>>         struct xe_device *xe = tile_to_xe(tile);
>>>>>>>         struct device *dev = xe->drm.dev;
>>>>>>>         struct kobj_tile *kt;
>>>>>>> +    struct kobject *kobj;
>>>>>>>         int err;
>>>>>>>
>>>>>>>         kt = kzalloc(sizeof(*kt), GFP_KERNEL); @@ -50,6 +122,20 
>>>>>>> @@ void
>>>>>>> xe_tile_sysfs_init(struct xe_tile *tile)
>>>>>>>
>>>>>>>         tile->sysfs = &kt->base;
>>>>>>>
>>>>>>> +    if (xe->info.platform == XE_PVC) {
>>>>>>> +        kobj = kobject_create_and_add("memory", tile->sysfs);
>>>>>> How freq0 is getting added, I am unable to see the freq0 kobject as
>>>>>> per the path
>>>>> "device/tile#/memory/freq0/"
>>>>> freq0 is being added as an attribute group. It is similar to the
>>>>> throttle_reasons implementation.
>>>>>>> +        if (!kobj)
>>>>>>> +            drm_warn(&xe->drm, "failed to add memory
>>>>>>> directory, err: %d\n", -ENOMEM);
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    if (kobj && xe->info.platform == XE_PVC) {
>>>>>>> +        err = sysfs_create_group(kobj, &freq_group_attrs);
>>>>>>> +        if (err) {
>>>>>>> +            drm_warn(&xe->drm, "failed to register vram freq
>>>>>>> sysfs, err: %d\n", err);
>>>>>>> +            return;
>>>>>>> +        }
>>>>>>> +    }
>>>>>> Don't we need sysfs cleanup and kobject_put in tile_sysfs_fini() ?
>>>>>> Have you made sure kmemleak won't complain here on memory leak ?
>>>> Check the kobject_release() , this will only get call , when all 
>>>> ref count of that
>>> kobj is being put.
>>>> Here you are creating a object and it will never be released.
>>>> Also  we need to call  the sysfs_remove_group() as well in fini 
>>>> function ?
>>>>
>>>> Thanks,
>>>> Anshuman.
>>> This is a bit of unique case. In this file we have two issues that 
>>> keeps us from
>>> cleaning up like others.
>> Current patch looks broken to me, this will leak the kobject on 
>> module unload.
>> Please check kmemleak after module unload.
>>> One, we need to cleanup the base tile directory here. And second, we 
>>> are
>>> creating the kobject only for PVC. If we add the "memory" kobject 
>>> cleanup to
>>> fini, we will be defining tile using kobj. This is causing an error 
>>> on unload,
>>> despite adding platform conditions on fini.
>> You may try by changing the type of void *arg to "memory" kob to fini 
>> function ?
>>> After testing multiple iterations of the fini function, this was the 
>>> cleanest way
>>> with no errors that worked across platforms.
>>>
>>> If needed, the only way to accommodate the kobject_put(kobj) and the
>>> sysfs_remove_group is to move the vram sysfs creation to a separate 
>>> file,
>>> similar to throttle_reasons and gt_freq.
>> I think it is needed for a functional working patch, if it can not be 
>> handled by using
>> "void *arg" in fini function.
>>
>> Thanks,
>> Anshuman Gupta.
>
> Since this is bit contentious even though the patch is functional, I 
> will move these sysfs out of xe_tile_sysfs.c to it own new file.
>
> This should clear up everything.
>
> Thanks,
>
> Suja

Hi Anshuman,

I've moved everything to a new file called xe_vram_freq.c/h . All 
kmemleaks and unload/reload checks are clean.

Let me know if the naming works.

The documentation added is as below, let me know if any tweaks are needed;

/**
* DOC: Xe VRAM freq
*
* Provides sysfs entries for vram frequency in tile
*
* device/tile#/memory/freq0/max_freq - This is maximum frequency. This 
value is read-only as it
*         is the fixed fuse point P0. It is not the system
*         configuration frequency.
* device/tile#/memory/freq0/min_freq - This is minimum frequency. This 
value is read-only as it
*         is the fixed fuse point PN. It is not the system
*          configuration frequency.
*/

Thanks,

Suja

>
>>
>>
>>> Thanks,
>>>
>>> Suja
>>>
>>>>>> Thanks,
>>>>>> Anshuman Gupta.
>>>>> I have already checked for mem leaks during the cleanup. The
>>>>> kobject_put is not needed.
>>>>>
>>>>> Thanks,
>>>>>
>>>>> Suja
>>>>>
>>>>>>> +
>>>>>>>         err = drmm_add_action_or_reset(&xe->drm, 
>>>>>>> tile_sysfs_fini, tile);
>>>>>>>         if (err)
>>>>>>>             drm_warn(&xe->drm, "%s: drmm_add_action_or_reset 
>>>>>>> failed,
>>>>>>> err: %d\n",
>>>>>>> -- 
>>>>>>> 2.25.1

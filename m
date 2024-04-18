Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC1B5C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 04:18:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B84310FA84;
	Thu, 18 Apr 2024 04:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="diBX4OhW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A3E10ED21
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 04:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713413927; x=1744949927;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=s6cY9wQcJXIDOIAxHNOclhKuMfVcStPHps/idQdS924=;
 b=diBX4OhWiEUHowj50+N1cX2Fdl2ybdV++gEYZQOitb1McU+/CMlDJdmt
 5SVPTSO8eruranNmVb04EKjwnXZ3+azOX5AlvXEitN8h8MrbiseuLIBlk
 G7XRTm47KJl2/PN1jenjDM5nsm4vhkXXrwPX/HZX49meKTeS+eDAxGqDl
 QO7cHWK1CnugUJKNkycDzAUijdyEbcnyEFX3IfP9EnTW+fIVMsS1FT1RP
 RgIU4bT2v4XAUIu05PPbOa+oJpkypDYjkP7N+gMO7STRuvnwpyuEFSemZ
 JUzNsBGmXGMS9sLl2yBmPDFhbjA8+sDdSU9hVFedczLN5ZffBDL1PsHby g==;
X-CSE-ConnectionGUID: UJOCuI8vSZSK7EsfZp6sdg==
X-CSE-MsgGUID: EpKeB5w1Sni3wCvx3eZGTA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="19545068"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="19545068"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 21:18:46 -0700
X-CSE-ConnectionGUID: jNw8YcSLQOmR2Ms5YMPqmw==
X-CSE-MsgGUID: +J33/v3nR22TpEkX9iEZng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="23357575"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 21:18:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 21:18:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 21:18:45 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 21:18:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ewetmwesor8O7NIJ8GpqJd9Iep7QXspE2GH7jkYQQH4di0/aCduq/WliJrUThdW3kbwNzkLCsFfWO12Tc8wZ8sAw94Gyqx6YysrmLUD01JojoIIiBWnJd2FkMP1yKGgBeUa027bdczZwGoc2O8e6uk5t4rdvdXh53nvWwc3APOMT2X3wPx4EmXAYxnzybSQxuuJw9AT5O33l0dm5ZGCLnoBF7T42ZlIk5uzsRXj1o2j3MBN8dE1jnxtx9Z/7B/EaOun74mF3aC3BpKvKYpPvmYL6A4QwvoK0PVJCN6LpgPZSLOZwkNlau4PByQUlAR2iv3bR+zmDgOz3CN6hxiNXsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mH2he8G6Mhavxfk+XVOpm3oAciGUHTZ2vlhCtQx80BI=;
 b=bhHMTz2zGD1HkoedUqcLYfvYMjwKLesFKolhpaw7lLcP2tOZDEM6nrAjepvqAqpER6OVm5HqI44Rjo4h1FMFoax1B0c3zCNv2/1FFQDZXm7FHm6sg0iVxKjTmHzYmysZBwfh4LFzjcfYAPlF5i65IfcVfA1KxcHNMcPA5X6QVdn/tYM9jzrnTNHUEfttv/L4HQl/4hKLVlgDOzg67hpkVYmgoyXgYd8pOWQIW3Z8NCW6H+huBJyHE5ggVPBrqO0Hq122evIaQ+UuwFA5AcTr/XehufIWoHeGeSSDZyKG5GXLRF3EPW5kdqLbMiX/3zMgm8H2x/wfHb5PxuBHUZ/U6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by SA2PR11MB4841.namprd11.prod.outlook.com (2603:10b6:806:113::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Thu, 18 Apr
 2024 04:18:43 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::cea4:315b:52ce:11f2]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::cea4:315b:52ce:11f2%3]) with mapi id 15.20.7472.027; Thu, 18 Apr 2024
 04:18:43 +0000
Message-ID: <83d66294-c089-467b-a65c-e90314613caa@intel.com>
Date: Thu, 18 Apr 2024 09:48:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Define all possible engines in media IP
 descriptors
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240417152621.3357990-2-matthew.d.roper@intel.com>
 <vwpy2sr62wcnwkjslreseee37kpi47msw5l4mbvos7dxuavnqa@cohkzrvkkddv>
 <44845ee2-79bf-4641-ad73-ffb88a23ce0c@intel.com>
Content-Language: en-US
In-Reply-To: <44845ee2-79bf-4641-ad73-ffb88a23ce0c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0133.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::15) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|SA2PR11MB4841:EE_
X-MS-Office365-Filtering-Correlation-Id: 4046a3f5-5095-468c-5227-08dc5f5ea200
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GYevpmwN4YItQxXAplwZdifwyeMXOaiaNyQVP7v1iHfdOPs1ydgUMMdaEbxdL0dPtTwPSd9FS74nbQM6d/9KUx+WaRnaOlzPCb69t6j8EqAQDlIZy7+QK9KmF/4CxcgFI1z+uxURoQrSBVnOUozlmarBfx7W6dTrg/OWKTo3CM7WhC27UDb6mD+v5v4EUV9Fvt+NMJV6NkU2n+Xe3czcTM7KnsoBFJ60zei5JhYnJX8gUdUkDqrVdoPOFrO5sMkbe50ouARipk02ZREs6sVxPB4pD1a1p2wbjIKUdn6aSe14XJESWf6cthBH6RGjFvTn0JB3WWOpv8povW8kK5Ie+W8RbBQrq1vYaAqCD6fwNF3h+WNM4bR+PuPn2nxdZnogifMi6a+dPe2PMd4abs2eYKldUxAeN3SijwmEm4ds8dEFbOvNoMHQ0UDmJPscClbPSEKKYJ0E17dwQ2lue1cN8D8aswvn7+5GPz7gvPIWG2xTd8GnOO1c9fy3DCB7bo8fO4FdAtMXeKpW9A3y/Ceka+de6plJtD6QTrURywguQdDPtwk2/3gAn3BpjD+msPzhhNdGojtBqz3mMGZI4sTgzQJz4L7g+PHFkPRlvtgwrkCZOvL6vS27gbULp9qJ8+v8NmhddKsF7u9V1si9HG6aGk0XvZ3yKZz9qhE4b2kSStk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWFwT0NvTzZzY2t4Q0k2VHRoNmlaWkpIQXlxSjBPd0dQY2V4Tk13Y1g3REZT?=
 =?utf-8?B?eXloSThTc2EySy9uMERUbEgvOUhMVUJBNS9lVml5R3BhZnlxWnFENjErVVJ5?=
 =?utf-8?B?WHR3bnZYbWNjUFBEekdaRFR5V3FnU1V5VnZBUUU1ZnFsTzBDZFJlMXdTRFRz?=
 =?utf-8?B?My9tdlY0VXh3VWxwakU3TEhpalJHZ2VNRWhmUXZXb2tXeTlNMmFQWlI4My9o?=
 =?utf-8?B?RzcvVE9sWEZYVkRZaENDZmJLZFZnSlRnNjNPSjZ1WUY3SkxSNkN2ZWpSSlFv?=
 =?utf-8?B?K0NhaXdPVVJjTytndkJJeXY3U1YyVE9KdTZxRUJsSFBldFlhVUcyR0d3eXlr?=
 =?utf-8?B?ZmRQU3kxRytDbjhZTmhWbFJZZ0VMbW5pODEzM2JFZVhKdmVKd2tGSE5jdlJJ?=
 =?utf-8?B?NkNvWTBVZjNEUnhtNVhaaXZSWk9wZWFqRVd2RjBDSUNZUGVTYU1zWVJvWGZI?=
 =?utf-8?B?VkM3N0JvSDQ2SE5CZE1XTlowTWFOMHFwMldielg2dmc1ak0wYU5GS2ppTnRm?=
 =?utf-8?B?YWhaUVBnbEpQajZEanNGNGtNNEpCTldqMFdKZlNmektYbmFrdkpBNEduNWxt?=
 =?utf-8?B?d1BTay80WnkyQUoyNmp0WVlMdlY3SGFpZmdjdmFtVDZPcGR1VjRzOWFNb2J3?=
 =?utf-8?B?MzUxelNIZDMycDNUSHJ5WDk1VGRLZzhyWGllbjExVkZ4aFk0N2FPVjJXM0VD?=
 =?utf-8?B?MnJEL2dyWENNbWJ2SFE3bE9YN2FkUEUrWHBjUnN5R0dzMTNUN1QxZHpsR29r?=
 =?utf-8?B?M0NvelhkNWlqV1lMNFQ3S3FCcDBQN3lYREhYWGwwTVdNa1BLRVVSWUs5Y0Yx?=
 =?utf-8?B?emkxT0xxU1puSktlN1lBdE5nSlBQSCtXWmgyb0Z0UnBQWnZ6SC9nQVlqQko2?=
 =?utf-8?B?ekpJUkw2MWZuMnF4SFFyc29rVW13SEtodERudmk4NkROZkY1OGNPNzMzWDBU?=
 =?utf-8?B?Nmw2Y1NOMUEwUGlYU01xWWg2UzB2QUZpaGtkVmpUZU1DaTI3cHNzM1NKVStw?=
 =?utf-8?B?NjJwQUxBbmZyQXNaZUFmZGxBWTYrVjhOdGtaZmliR0thQk9oTjNad0NVeGtD?=
 =?utf-8?B?NklhMHpaRmtkSDFYVWFYZ1lNMW9nRTVkL2FibzFjcEh4cXptOFI0NXZDdXc0?=
 =?utf-8?B?d0czOGcyblQrQkJETkJTemtkcXZsUXJiTlhkUE1sa05ZdUIxQzVYVEJvMzlG?=
 =?utf-8?B?YU9XWXBoUGc0TC9ORGhWcFVOb1ppUGRXQjdQVGE5SlNnc0Q1M2haZlZ3SXNO?=
 =?utf-8?B?eFQ5WlJzYlZSWU1QSHNCYjZnT1RDZksxNkROWFZ6NDIrS0o5NXBMcGFBSWJG?=
 =?utf-8?B?aHhlY0tib1p2RC9Gb1RMZnJJMjBaa0pwT1V1WStDQWJIcXpiMENSNEZYSHhZ?=
 =?utf-8?B?SVdvZlMxOUpSNjRvTGcwTnVQR2MvS2M2ZjNXL2xreGkwcVJaZW9peWt5WExP?=
 =?utf-8?B?Rm1vWEZGSnZuV1FXLzBJTll4OVY1RTJ3c0ZWclJhRThXaFUrczg0ZUZsYzQw?=
 =?utf-8?B?MTVBUTE5UVlwZy9aVkNINWNNd2RnZVRzbEwramRMeEhGK1c4TG9VZXZzbVNk?=
 =?utf-8?B?MlRIRHNYVXlmeVZja3NUcDNiUFl3NU9ZNjlnZ25kRUY5K0c4SlRrL01oUEVv?=
 =?utf-8?B?Umk3anVHQURQS3Ard21mZWFzejhpcjNjVEljc05aa1A5aDFNVE41MFAxUDFk?=
 =?utf-8?B?NS9xU3IxbkhkdVluaktvVDk1c3hmQkN1ay82YUROWjNFaXZvQWl6K3p0dlho?=
 =?utf-8?B?SW16MzNJUHdZelNWNEN0OTFDY1VXL2FIMjYrTnJqMkt6Sm9vZVdQRFVpbUcw?=
 =?utf-8?B?ckpjcDI2NUZERWtDbVF6cFk5YnZTNVUwb0F1dGVrUUIrVVUzbTRPS0hYZG5N?=
 =?utf-8?B?Yzg2Tlk3SXlzUXdzUlJXUFNpeklabG5oRlFQVHUyZ2tIc1YxNTVEL2NNVkNy?=
 =?utf-8?B?NmJYYW1yMVZzVUpydVJKU0p0MzFVMzZZRlhXcUk1N2cyQkkvNXpPUnpjRFNM?=
 =?utf-8?B?NStJcnRkZFl2YUxvSllMMzZmNnU4MG1KRHRSMW1XQXEvU2pJRWJ6VFFVT0Z0?=
 =?utf-8?B?Nm93d25aL0VkYXFmMUpvR0tEd3FjL0o1dSs1SG5qN1U0VDVtTVEyUFpQazNQ?=
 =?utf-8?B?Y2R0SjgxM29qMkd6bU9PUmZtUnAwcTBET01PdjkwTnNwRW1teVZkTE5RRkwy?=
 =?utf-8?B?Qmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4046a3f5-5095-468c-5227-08dc5f5ea200
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 04:18:43.1880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RfbkhBcMyybuTIm+woJYAMKnQUdrBipmFj9pdjSkLzzweQB/z9Nn7r4YUGGGmTjDfFFZw1kWmKqXpqD+o8mpkctDsKuDZhlswD00kWlPOg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4841
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 4/18/2024 09:46, Chauhan, Shekhar wrote:
>
> On 4/17/2024 23:48, Lucas De Marchi wrote:
>> On Wed, Apr 17, 2024 at 08:26:22AM GMT, Matt Roper wrote:
>>> Rather than trying to identify exactly which engines are available on
>>> each platform in the IP descriptor, just include the list of all media
>>> engines that the IP could theoretically support (i.e., 8 VCS + 4 VECS).
>>> We still rely on the media fuse registers to tell us which specific
>>> engine instances are actually present on a given platform, so there
>>> shouldn't be any functional change.  This will help prevent mistakes
>>> with engine numbering (for example ambiguity about whether the 2nd VCS
>>> engine on a platform with exactly two engines is numbered "VCS1" or
>>> "VCS2") and will also future-proof the code a bit more in case new SKUs
>>> or platform refreshes extend the engine list in the future.
>>>
>>> Note that the media fuse register technically has an 8-bit field for
>>> VECS engine presence starting on Xe2.  However there's still no MMIO
>>> register range reserved for VE engines above VECS3, so VE0-VE3 is still
>>> consider the "maximum" VE engine mask that the driver can support for
>>> now.
>>>
>>> Bspec: 52614, 52615, 62567
>>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>
>> I remember we tried something similar for BCS and had to revert. However
>> for media it seems we have fuses available on all platforms, so should
>> be better handled by the current code.
>>
>> Assuming CI is happy,
>>
>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>> Lucas De Marchi
>>
>>> ---
>>> drivers/gpu/drm/xe/xe_pci.c | 16 +++++++++-------
>>> 1 file changed, 9 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>> index 3b30353dbc09..0d21306f8995 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>> @@ -185,8 +185,8 @@ static const struct xe_media_desc media_xem = {
>>>     .rel = 0,
>>>
>>>     .hw_engine_mask =
>>> -        BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
>>> -        BIT(XE_HW_ENGINE_VECS0),
>>> +        GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>>> +        GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0),
>>> };
>>>
>>> static const struct xe_media_desc media_xehpm = {
>>> @@ -195,21 +195,23 @@ static const struct xe_media_desc media_xehpm = {
>>>     .rel = 55,
>>>
>>>     .hw_engine_mask =
>>> -        BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
>>> -        BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VECS1),
>>> +        GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>>> +        GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0),
>>> };
>>>
>>> static const struct xe_media_desc media_xelpmp = {
>>>     .name = "Xe_LPM+",
>>>     .hw_engine_mask =
>>> -        BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
>>> -        BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_GSCCS0)
>>> +        GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>>> +        GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
>>> +        BIT(XE_HW_ENGINE_GSCCS0)
>>> };
>>>
>>> static const struct xe_media_desc media_xe2 = {
>>>     .name = "Xe2_LPM / Xe2_HPM",
>>>     .hw_engine_mask =
>>> -        BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0), /* TODO: 
>>> GSC0 */
>>> +        GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>>> +        GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0), /* TODO: 
>>> GSC0 */
> Are we correct in excluding the 4 new additions that are part of a new 
> HSD, stated in BSpec 62567?
Correction: Not new, rather, different*
>>> };
>>>
>>> static const struct xe_device_desc tgl_desc = {
>>> -- 
>>> 2.44.0
>>>
-- 
-shekhar


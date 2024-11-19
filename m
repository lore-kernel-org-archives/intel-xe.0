Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0F6D6C299
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 21:08:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF9488F94;
	Tue, 19 Nov 2024 21:08:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FRtVcNgB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828C988F94
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Nov 2024 21:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732050492; x=1763586492;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lvoa/AbaaJdNpjRz9zGseNLg61dIYWenzKiL1OSuoHg=;
 b=FRtVcNgBmWRDCvNt0G0/HIdu2vROiRIPAZeF25gcUeh7UnKZFpiqvvRu
 aWNUsJxzyNN9adQQfSTp+W3caModzluu1A8w7PrFfAdNk341e/m0P6PPH
 vcY72TRo6ikPh9Y6iM0zEGdQNTEntGpky6t1FbdbCOrxeeBVN+Ql76I/M
 vV4FTdyY/4O+OuCrm9WorSujp1sizWG2Tf9VQs6GnF6u5tcoQfSWT54hZ
 ZqpHXi+oWKoGxUmKb9c0f2Aswze+5R0/rgweOgamuXfI2IWCRfOPZ33x5
 Uqqtul/pzTS4ZasZa9zrl5S89uKzmbFZVfBYfXxnfJdgo3tAGetCyK6Sw w==;
X-CSE-ConnectionGUID: 4N0jxJr5TLCaS8sYgJPN9A==
X-CSE-MsgGUID: y5PJPv8iREW31UOAgkkJbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="42717389"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="42717389"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 13:08:07 -0800
X-CSE-ConnectionGUID: 6z/9cVBlSsqie/ffD7LHbA==
X-CSE-MsgGUID: 1CrEY9SzQJ2dE0yAjUbh+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="90513469"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2024 13:08:07 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 19 Nov 2024 13:08:06 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 19 Nov 2024 13:08:06 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 19 Nov 2024 13:08:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xnhL6qc9YWCrGF1SPwpwyLIDntqBuO1CfD5TtCYvh341Z9STLmZlz/0q7Yiro5YjF6/X3kn9ebGg5ZhN9GVBin8fvPMQTc/lx5hykxWjnJHQt9Pj3ly/UHKU7w4QuHkHIQ70ou0PvNiGJH4gF1xRaLYd113GnXMSMBfwkgvihwGSAu0snCx54Cn3hvqWRBJPnUwPTlf2NgZz+3StchxrZHb+fNiSL21n0FabXF0+pBb4Lc1NEpjM0IEr4KOq+YnVNuYXpmTwqFNfDCSZMdGttuEyLO+nvCpFyOFMUY7zp6OVLEb/VkHyRFnUby0GaKGzUh7dKUpGQbIrh1F+tGRGUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Juf47V0EvM+5Zzb1VNQ5RzkC41DoBIaOoBBr9ij6pfA=;
 b=O1VKytvk9m9zackQNBDno/iY0bf5KYT/wwYZ17my3Ax/oPEGPMr+CHXhzdoyuZhUFE6ZPy72wSbhSllWoaXH5ZX7qryrMppERc4u2H4z0pFDu0zXws7IvfjHHtQ/D593fyw5JH16/Dr8es05H5x1a4u1ugcYYedFBQjXLiXlcluI/CWIp6Do+uP0YV/d0q4sKVbzY7KmTsfwCJn/0Xq/RPZHnSTYOm9QE5136lnHd7FBPtQuxgKozrqlHN7gKU15Vyi/PeWd6AVOV9AtCy716ekE/B0bFVQ9nQjzRjVnF1G3zrU87duJ+waKJvkJ2c//I3k8u2anAlRyovLGeBq9Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by CH0PR11MB5219.namprd11.prod.outlook.com (2603:10b6:610:e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.14; Tue, 19 Nov
 2024 21:08:03 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%2]) with mapi id 15.20.8158.019; Tue, 19 Nov 2024
 21:08:03 +0000
Message-ID: <e2fefd41-5b0e-43bf-ba8e-165886636a3d@intel.com>
Date: Tue, 19 Nov 2024 13:08:00 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] drm/xe/pmu: Enable PMU interface
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Aravind Iddamsetty
 <aravind.iddamsetty@linux.intel.com>, Bommu Krishnaiah
 <krishnaiah.bommu@intel.com>, Riana Tauro <riana.tauro@intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>
References: <20241113174242.24787-1-vinay.belgaumkar@intel.com>
 <20241113174242.24787-2-vinay.belgaumkar@intel.com>
 <lnvrm7guru3ujx7kt4irhvjb3wc3vcfzzhko3h5zkvgdig6znm@xb56nnaemwi5>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <lnvrm7guru3ujx7kt4irhvjb3wc3vcfzzhko3h5zkvgdig6znm@xb56nnaemwi5>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0152.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::7) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|CH0PR11MB5219:EE_
X-MS-Office365-Filtering-Correlation-Id: b56647fd-4d06-48fb-e72b-08dd08de4136
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmQ4a2Y0OVBEMTFNRkFoUWRoTnNkWG12ZmRhMkQrYnZnaXQ4d1JwbUNYbzRB?=
 =?utf-8?B?M0tEdEFKK0tIaVAyU1hPTnZjQ0k1MEJTOXZCRXlReVo3bWIzb2pIdndCUEdE?=
 =?utf-8?B?blpGSEpFdldqdTN4N3k3SEM3Q2VSUGEzSVZQUXU2eDRtWjV5TUpjS2gwemVK?=
 =?utf-8?B?SytQQ2Z5TWY0ZlA3QlY0Z3RHSWZEZUNGNmlZcmlrSlJDdEJHaXVCZzlpQUpB?=
 =?utf-8?B?UzN3SW12ekUyQ1NoUUduTGxBVUNvUE5xbGZpamhWSkRxdGFSaElpM2ViUXdx?=
 =?utf-8?B?dTdteCszRzNmRDBpS1NtTUF1Q0kvK3RQTk5yNGo4cGlYdkZIaWUwZlR6UXRU?=
 =?utf-8?B?WUl5UzFCNFdEc0FSc0xOQnVoWU92Y0pEdkJOSldlK3FJSDZZbXM4Vm44WjhU?=
 =?utf-8?B?L2hQVGtRZlZFdExqdGxLMlJaQ1kxTkovNWhHL0lFdjk4US9IRThyYTVFYzl3?=
 =?utf-8?B?ZGI3SGVheldZSTRXOUxxOEpmQXF6cVpaWFR3Y1JEcE9Va09wUUlQSEI3RlFw?=
 =?utf-8?B?N0FqSlMvRVFzNTl4YThxcC9DdGxublVKaGpqUFo2RW5Kd09IUWN1VVVpcUh1?=
 =?utf-8?B?VURXWTdaYjVXYW1MNVRsWHRlM0txckJtbFdWeXJ5OGpmcFRzcmNJN1ZybWtZ?=
 =?utf-8?B?SWI2eE03dTZKZHdtRVZWWFJUaTIyQjJ6cjNCNFZnSnp3bGZ1U3ZSL0dDNHVq?=
 =?utf-8?B?S3ZObnFIa2JTNDkrc1c5V0NONnZ4dDIyMXdpOFl5c0dWRmRFY2EzTUZySnNv?=
 =?utf-8?B?d2l5NFU0MHNDK3lPcWxkOE9UOVNvcjZNSm03RkkwVEkxQTZoaWwxQUZMQ1FH?=
 =?utf-8?B?MFZmMVBXdERkcE43a0ZxTCt3NmxJTzgzaWhZbHBEckxWZWMrMnh1M1lrQ0JC?=
 =?utf-8?B?Wit2UXVRMzFjcDMzMmM2S2lLdUZEb0F6TU82YWZ5OTIrTEsrVGVOWXd5KytC?=
 =?utf-8?B?ZFJFMFI5SkZsdjdjWDhLemkrRzg4NFFIcXgvOUhNSmdBcVhLSlRlNlMvRHl6?=
 =?utf-8?B?UWx2Y3JzbVh2MDZHaWZaVW5NSFY0alFTekNiaXc4dGZVRncrTlRPSUFQb0Zz?=
 =?utf-8?B?VWNoSXBaQ2NVcTFvTCszeUJKdWtPSEorZk55TkNUUkxjMVhEdUlRN2RlRzFx?=
 =?utf-8?B?dVJ4R0g5Z09yYVp4a2NLOEY1aUQvNmQwSU1WdkFydzlsODI3TnlncHdMeWZJ?=
 =?utf-8?B?d3hsM2UvenI4eGd5c0JqYXBpcnduZW9rRTRCYzJSSFplczRYWTdSR2xRTVpF?=
 =?utf-8?B?NzNramhqTEJIc3pZTGZib0w4SVJWUkZnWUhkQ0xCTUxwdjgwMmxISEl3WVNI?=
 =?utf-8?B?SHd3Z0h1V09uVzExUXVKNzkwcXpBTWt4dUFDVHlPSXJVSWVpUkw5Tm94VHdQ?=
 =?utf-8?B?a2RnUnZQTmVtc1NmSmpESHpoNmdHbmlOaTFKb3dkc2tFMytFdXNDNis5c3I1?=
 =?utf-8?B?RmR2SU12WHBaNUtPaDlEaVBNRDRuQ1lFRkRpUjBoTUJZYWFsRGNGenpnQlRC?=
 =?utf-8?B?TWFLakVmL1JxVXg4cnJzMUdHVkVka0lTcDZBU1VyeXRabWdQUXZxbDBEcjBD?=
 =?utf-8?B?TVlkeTR4NUlHY2VrNFVnMldtVUpyWktaWUkxNFVaZ1hTV3g4WTJCOCtLN3ZF?=
 =?utf-8?B?eEViaDl5MFppVThVZWNROTZtK0twU1hMRlZRSkp4Mkg3QldjZUNmS3B2V0JP?=
 =?utf-8?B?TnhsR1J1R2lPK0kzWjRsOFhCREtxc09jRzhEejRTOEhiMkN3NVRaU1d3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVZjRUk3SU5ua2hackR4ZEloZUhMemZlcHJXYW55OVpObjJsWkFxSGRjb3Jq?=
 =?utf-8?B?MHRxaC9IVVpiV1hZT0ZvNHpLWURpSUJ4dkE3N3lFM2FzUWZMUTdHdzAxU2Jv?=
 =?utf-8?B?SGlxMzIwRzBRVDZrc21uMGxxajB3T2hlWkN0TG1mUWxXcnduMXB0UEo5SG53?=
 =?utf-8?B?S3JrVVpRZ3VpanBXbVJLMzIvTERjU3dETDY3enc2MFppT0pZYytpcC9ITTBB?=
 =?utf-8?B?bVd0WElXbzhmOFJOTzNFQVcyY1ExazhWRHFLZU9SVElOZDJqUTRUSXRaMGZJ?=
 =?utf-8?B?QVhHVVBQeTAwOG9SWlNITkU4Q0tPdFgwTlhaZEVxaENheG84bTdJeEN1UzBr?=
 =?utf-8?B?OFZ1QlRWZzlEbFRQcldsWVVBQkd4eHNWaTdFMWczMWhDNHpSS1NRV1V0dWFP?=
 =?utf-8?B?RGNTUjN4dGJMbFl0U2s0ckNkWGtmM29hMzNKZmVvTnpTOGkyMFFMalp2OE8y?=
 =?utf-8?B?WHZKVHJMWVNoRGhJWTBKUG0wUEtMZ0p4bmg0RjRVYTE4b2thakNsU292Y3Zu?=
 =?utf-8?B?S1ZkeENxaGpIT2ZGeno1NHN6S0tiNnhnNW1HeUJML1BndzNGaXNnc2J1dHZx?=
 =?utf-8?B?VWNmam80Ymd1Qzk0ZHhkcDMvelh0MUZCei9ZaVRIenA3dUUxVDVTSzF4WWpV?=
 =?utf-8?B?MjVnNTNGa0Q0TXVhZzNQQU40eS9TYm00azJrTi9RbUJBMFBrc1JmVG41U0Ja?=
 =?utf-8?B?MVBnVTdoNWNsLzJ1R2JaZnRFU2x4ZWdIOHNUR1hXS0xmVHhhQWtnbFZ4N2Nj?=
 =?utf-8?B?L0VaSTltSmNGRkNyVGllNHYzMDZlZlV5YUQ0RzlwankxcjFqNmFtOE5od2F4?=
 =?utf-8?B?OG14NDVUNHd0YW9nQ2RvcXpJdEFaMEkxNldlU1VsSGp5Z25ManZRQjArTEVG?=
 =?utf-8?B?cjJUZjAwS1p3Y1gxUTFkVGhkdmtERXVKS2ZwQVlaMmdWWjMrVklNbkg4WXRz?=
 =?utf-8?B?NUFWcjBXaEc3c2pwanJHVWhyZGFKVm1tWU9NOE1VS3ZVMzREanpHUXd0WnE2?=
 =?utf-8?B?bU5acDNKb0hvTzBrdmplcXoxK2dpQkYvRzUwQ0p2cWtkTjkwdEtHSkdmNWIw?=
 =?utf-8?B?Q1ZxbjBVNFcwdGpUY2NyZnhJTXpRNEtBNVErMDZoVWFFUmNHUitSNW0zZUtF?=
 =?utf-8?B?NndlVC9keExoUVUzY3cwMjhTK0hyNG1rSmY0VSt6bUEvWXhtc0VUYjJ3ZzB5?=
 =?utf-8?B?aXFYN0JLL21sdXhXY1Ezc0FocTczYVo1SmwreTdkOGdrdm5kU0pJUzFtQUNM?=
 =?utf-8?B?NUV0YTRYTi84M1hCZXp4b0lWSGhYTGlHb3NvZkxjK1FPMTdjaVQyaEx2ekFM?=
 =?utf-8?B?dFF6T3FEQjExWm9wUDYxLzJMUXZQNjJDMkdLVHBzelZPRWthek9qdFVvRFZv?=
 =?utf-8?B?NWMyL01XaXlWck1tdHMxdmVlT2t4NWtVakIxUHRZakFSZTZKRCs5UzVQUmtE?=
 =?utf-8?B?ei8ySU15TWRoMGZOdUJFV1RYeWtkRVV2TDRFenQ3OGp1d0d6Zk96M2Y2Q1l6?=
 =?utf-8?B?Q1FOcERVUDNzRmF0KzlCemJ0bVU1Mk1OV0R6Y0kzWGh1Vk1Hc2lISXJKaWdV?=
 =?utf-8?B?NnpCYmVJOWlIRTlGUElHWTJCT0dIczBSNnk5YmlFSkEyRkJld1VkTWtzZUhz?=
 =?utf-8?B?TDZqTk5GaGFxc09WRHBia2kwR05tSjUwZGtISWo0TGdrUjQyRUNFZVEyVkNa?=
 =?utf-8?B?MDBxN0dIQVRVV241RFU4QkI1b2Q1LzlZTWhLdDNYc2s5dXV4a2VPRGplbTdi?=
 =?utf-8?B?Witrc0RqajVUYllCUDlQUXFBUGpZQllJZnVhcHRNemJZd09RNzFwYkdCNXk0?=
 =?utf-8?B?TDl0bE05L2ViUENKWVZzR3ZpSWpIZUsweGRINUNZQjZTV3hhSmFKQnJSeWlm?=
 =?utf-8?B?amx6Y0N2aDYvd3dMeGZHOWMzTXFYM01jWW15dFlZU1Q0TXlweGtvZzZyYmJK?=
 =?utf-8?B?VUhUNThrcEovcmFQRWIxN2FJcVUxbElFUk1ia3RYTEp1cUNjR0RRSWJ2NjJJ?=
 =?utf-8?B?RkcwcXhyNkh1ZkVjekxUUG10ZTZrSUlVc3hVQ2pHa0lhNW9XYzgwdTlMeVh0?=
 =?utf-8?B?ZDhJNUVyRkZrSFZ1U3pQajAyc1lwY1JjR1Q1OWdXcUtvSjlYSXVtS1k4T3Fy?=
 =?utf-8?B?ZGNEcnNIVUFtWSs1ajl4R1N3clppTHdEQnIzaHgwcGwyMVM0WVViL3N4Q053?=
 =?utf-8?B?cnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b56647fd-4d06-48fb-e72b-08dd08de4136
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 21:08:02.9039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xX7Q4foCf3vceT4GvcDt7/F+MZp74G9FTflTq4oYTrnE9nrsiBnRzqCXRGPCuapyjInJWro0bbeXG0hT6gdYdH+hhLvdx7VQJHS5Zxj7ll4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5219
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


On 11/13/2024 7:16 PM, Lucas De Marchi wrote:
> On Wed, Nov 13, 2024 at 09:42:40AM -0800, Vinay Belgaumkar wrote:
>> From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>>
>> Basic PMU enabling patch. Setup the basic framework
>> for adding events/timers. This patch was previously
>> reviewed here -
>> https://patchwork.freedesktop.org/series/119504/
>>
>> The pmu base implementation is still from the
>> i915 driver.
>>
>> v2: Review comments(Rodrigo) and do not init pmu for VFs
>> as they don't have access to freq and c6 residency anyways.
>>
>> v3: Fix kunit issue, move xe_pmu entry in Makefile (Jani) and
>> move drm uapi definitions (Lucas)
>>
>> v4: Adapt Lucas's recent PMU fixes for i915
>> v5: Fix some kernel doc issues
>>
>> Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>> Co-developed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
> are all these s-o-b and r-b still valid after several changes and back
> and forth?
>
>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>> drivers/gpu/drm/xe/Makefile          |   2 +
>> drivers/gpu/drm/xe/xe_device.c       |   6 +
>> drivers/gpu/drm/xe/xe_device_types.h |   4 +
>> drivers/gpu/drm/xe/xe_module.c       |   5 +
>> drivers/gpu/drm/xe/xe_pmu.c          | 579 +++++++++++++++++++++++++++
>> drivers/gpu/drm/xe/xe_pmu.h          |  26 ++
>> drivers/gpu/drm/xe/xe_pmu_types.h    |  70 ++++
>> 7 files changed, 692 insertions(+)
>> create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
>> create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
>> create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index a93e6fcc0ad9..c231ecaf86b8 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -299,6 +299,8 @@ ifeq ($(CONFIG_DEBUG_FS),y)
>>         i915-display/intel_pipe_crc.o
>> endif
>>
>> +xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
>> +
>> obj-$(CONFIG_DRM_XE) += xe.o
>> obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c 
>> b/drivers/gpu/drm/xe/xe_device.c
>> index 0e2dd691bdae..89463cf7cc2c 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -759,6 +759,9 @@ int xe_device_probe(struct xe_device *xe)
>>     for_each_gt(gt, xe, id)
>>         xe_gt_sanitize_freq(gt);
>>
>> +    if (!IS_SRIOV_VF(xe))
>> +        xe_pmu_register(&xe->pmu);
>
> this IS_SRIOV_VF be inside xe_pmu_register()
>
> Also, differently than i915, the direction is to fail probe if any
> component fails. So this call should return something and we should deal
> with the fallout if it happens.
>
> not all parts of the probe got the memo though and requiring this to be
> done here would be outside of scope.
>
> Anyway, this should definitely not be be between xe_gt_sanitize_freq()
> and the return!
>
>> +
>>     return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, 
>> xe);
>>
>> err_fini_display:
>> @@ -803,6 +806,9 @@ void xe_device_remove(struct xe_device *xe)
>>
>>     xe_heci_gsc_fini(xe);
>>
>> +    if (!IS_SRIOV_VF(xe))
>> +        xe_pmu_unregister(&xe->pmu);
>
> same thing, no check for SRIOV in here. It's not even needed inside
> xe_pmu_unregister() as it only unregisters if it got registered at some
> point.
>
> This should follow the inverse order of registration.
>
> [ It's sad we got mixed style in the probe and it's now
>   a complete mess. The idea behind the calls 
> devm_add_action_or_reset() is
>   that you wouldn't need the call on the remove side since it'd be
>   automatically called. In the right order. ]
>
> For now, let's just move this above xe_oa_unregister(), since it got
> registered after it.
>
>> +
>>     for_each_gt(gt, xe, id)
>>         xe_gt_remove(gt);
>> }
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h 
>> b/drivers/gpu/drm/xe/xe_device_types.h
>> index bccca63c8a48..0cb8d650135a 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -18,6 +18,7 @@
>> #include "xe_memirq_types.h"
>> #include "xe_oa.h"
>> #include "xe_platform_types.h"
>> +#include "xe_pmu.h"
>
> you will need a xe_pmu_types.h where you only define the types.
> See the other lines that serve as good citizens, don't look at xe_oa.h
>
>
>> #include "xe_pt_types.h"
>> #include "xe_sriov_types.h"
>> #include "xe_step_types.h"
>> @@ -509,6 +510,9 @@ struct xe_device {
>>         int mode;
>>     } wedged;
>>
>> +    /** @pmu: performance monitoring unit */
>> +    struct xe_pmu pmu;
>> +
>> #ifdef TEST_VM_OPS_ERROR
>>     /**
>>      * @vm_inject_error_position: inject errors at different places 
>> in VM
>> diff --git a/drivers/gpu/drm/xe/xe_module.c 
>> b/drivers/gpu/drm/xe/xe_module.c
>> index 77ce9f9ca7a5..1bf2bf8447c0 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -14,6 +14,7 @@
>> #include "xe_hw_fence.h"
>> #include "xe_pci.h"
>> #include "xe_pm.h"
>> +#include "xe_pmu.h"
>> #include "xe_observation.h"
>> #include "xe_sched_job.h"
>>
>> @@ -96,6 +97,10 @@ static const struct init_funcs init_funcs[] = {
>>         .init = xe_sched_job_module_init,
>>         .exit = xe_sched_job_module_exit,
>>     },
>> +    {
>> +        .init = xe_pmu_init,
>> +        .exit = xe_pmu_exit,
>> +    },
>>     {
>>         .init = xe_register_pci_driver,
>>         .exit = xe_unregister_pci_driver,
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> new file mode 100644
>> index 000000000000..2bd98c91ab0f
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -0,0 +1,579 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_managed.h>
>> +#include <drm/xe_drm.h>
>> +
>> +#include "regs/xe_gt_regs.h"
>> +#include "xe_device.h"
>> +#include "xe_force_wake.h"
>> +#include "xe_gt_clock.h"
>> +#include "xe_mmio.h"
>> +#include "xe_macros.h"
>> +#include "xe_pm.h"
>> +
>> +/*
>> + * CPU mask is defined/initialized at a module level. All devices
>> + * inside this module share this mask.
>> + */
>> +static cpumask_t xe_pmu_cpumask;
>> +static unsigned int xe_pmu_target_cpu = -1;
>
> I still have no idea why we need this, even worse that it is at the
> module level rather than the driver/device level.
>
> since we are working with the gpu it seems we are limiting perf to
> create the event in just 1 cpu, and because of this we then need to let
> it migrate to another cpu if that cpu go offline. Wouldn't it suffice
> to set cpumask syfs to 0 like we have in e.g. cstate_pkg?
>
> $ cat  /sys/bus/event_source/devices/cstate_pkg/cpumask 0

we still need to have the online/offline event entry points, so this 
really isn't that different from hard coding to 0, right?

static int xe_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
{
         struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), 
cpuhp.node);

         /* Select the first online CPU as a designated reader. */
         if (cpumask_empty(&xe_pmu_cpumask))
                 cpumask_set_cpu(cpu, &xe_pmu_cpumask);

Thanks,

Vinay.

>
>> +
>> +/**
>> + * DOC: Xe PMU (Performance Monitoring Unit)
>> + *
>> + * Expose events/counters like C6 residency and GT frequency to user 
>> land.
>> + * Perf tool can be used to list these counters from the command line.
>> + *
>> + * Example commands to list/record supported perf events-
>> + *
>> + * $ ls -ld /sys/bus/event_source/devices/xe_*
>> + * $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/events/
>> + *
>> + * You can also use the perf tool to grep for a certain event-
>> + * $ perf list | grep rc6
>> + *
>> + * To list a specific event at regular intervals-
>> + * $ perf stat -e <event_name> -I <interval>
>> + *
>> + */
>> +
>> +static unsigned int config_gt_id(const u64 config)
>> +{
>> +    return config >> __XE_PMU_GT_SHIFT;
>> +}
>> +
>> +static u64 config_counter(const u64 config)
>> +{
>> +    return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>> +}
>> +
>> +static void xe_pmu_event_destroy(struct perf_event *event)
>> +{
>> +    struct xe_device *xe =
>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>> +
>> +    drm_WARN_ON(&xe->drm, event->parent);
>> +
>> +    drm_dev_put(&xe->drm);
>> +}
>> +
>> +static int
>> +config_status(struct xe_device *xe, u64 config)
>> +{
>> +    unsigned int gt_id = config_gt_id(config);
>> +
>> +    if (gt_id >= XE_MAX_GT_PER_TILE)
>> +        return -ENOENT;
>> +
>> +    switch (config_counter(config)) {
>> +    default:
>> +        return -ENOENT;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int xe_pmu_event_init(struct perf_event *event)
>> +{
>> +    struct xe_device *xe =
>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +    int ret;
>> +
>> +    if (!pmu->registered)
>> +        return -ENODEV;
>> +
>> +    if (event->attr.type != event->pmu->type)
>> +        return -ENOENT;
>> +
>> +    /* unsupported modes and filters */
>> +    if (event->attr.sample_period) /* no sampling */
>> +        return -EINVAL;
>> +
>> +    if (has_branch_stack(event))
>> +        return -EOPNOTSUPP;
>> +
>> +    if (event->cpu < 0)
>> +        return -EINVAL;
>> +
>> +    /* only allow running on one cpu at a time */
>> +    if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
>> +        return -EINVAL;
>> +
>> +    ret = config_status(xe, event->attr.config);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (!event->parent) {
>> +        drm_dev_get(&xe->drm);
>> +        event->destroy = xe_pmu_event_destroy;
>
> We won't need this anymore after the pending pmu patches.
> We can keep it if we end up applying this before.
>
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static u64 __xe_pmu_event_read(struct perf_event *event)
>> +{
>> +    struct xe_device *xe =
>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>> +    const unsigned int gt_id = config_gt_id(event->attr.config);
>> +    const u64 config = event->attr.config;
>> +    struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>> +    u64 val = 0;
>> +
>> +    switch (config_counter(config)) {
>> +    default:
>> +        drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>> +    }
>> +
>> +    return val;
>> +}
>> +
>> +static void xe_pmu_event_read(struct perf_event *event)
>> +{
>> +    struct xe_device *xe =
>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>> +    struct hw_perf_event *hwc = &event->hw;
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +    u64 prev, new;
>> +
>> +    if (!pmu->registered) {
>> +        event->hw.state = PERF_HES_STOPPED;
>> +        return;
>> +    }
>> +again:
>> +    prev = local64_read(&hwc->prev_count);
>> +    new = __xe_pmu_event_read(event);
>> +
>> +    if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
>> +        goto again;
>
> should have been a do { } while() and need to use the try_cmpxchg 
> variant.
> we shouldn't need the local64_read(&hwc->prev_count) when repeating.
>
> I think arch/x86/events/rapl.c:rapl_event_update() is a good reference.
>
>> +
>> +    local64_add(new - prev, &event->count);
>> +}
>> +
>> +static void xe_pmu_enable(struct perf_event *event)
>> +{
>> +    /*
>> +     * Store the current counter value so we can report the correct 
>> delta
>> +     * for all listeners. Even when the event was already enabled 
>> and has
>> +     * an existing non-zero value.
>> +     */
>> +    local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
>> +}
>> +
>> +static void xe_pmu_event_start(struct perf_event *event, int flags)
>> +{
>> +    struct xe_device *xe =
>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +
>> +    if (!pmu->registered)
>> +        return;
>> +
>> +    xe_pmu_enable(event);
>> +    event->hw.state = 0;
>> +}
>> +
>> +static void xe_pmu_event_stop(struct perf_event *event, int flags)
>> +{
>> +    struct xe_device *xe =
>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +
>> +    if (!pmu->registered)
>> +        goto out;
>> +
>> +    if (flags & PERF_EF_UPDATE)
>> +        xe_pmu_event_read(event);
>> +
>> +out:
>> +    event->hw.state = PERF_HES_STOPPED;
>> +}
>> +
>> +static int xe_pmu_event_add(struct perf_event *event, int flags)
>> +{
>> +    struct xe_device *xe =
>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +
>> +    if (!pmu->registered)
>> +        return -ENODEV;
>> +
>> +    if (flags & PERF_EF_START)
>> +        xe_pmu_event_start(event, flags);
>> +
>> +    return 0;
>> +}
>> +
>> +static void xe_pmu_event_del(struct perf_event *event, int flags)
>> +{
>> +    xe_pmu_event_stop(event, PERF_EF_UPDATE);
>> +}
>> +
>> +static int xe_pmu_event_event_idx(struct perf_event *event)
>> +{
>> +    return 0;
>> +}
>> +
>> +struct xe_ext_attribute {
>> +    struct device_attribute attr;
>> +    unsigned long val;
>> +};
>> +
>> +static ssize_t xe_pmu_event_show(struct device *dev,
>> +                 struct device_attribute *attr, char *buf)
>> +{
>> +    struct xe_ext_attribute *eattr;
>> +
>> +    eattr = container_of(attr, struct xe_ext_attribute, attr);
>> +    return sprintf(buf, "config=0x%lx\n", eattr->val);
>> +}
>> +
>> +static ssize_t cpumask_show(struct device *dev,
>> +                struct device_attribute *attr, char *buf)
>> +{
>> +    return cpumap_print_to_pagebuf(true, buf, &xe_pmu_cpumask);
>> +}
>> +
>> +static DEVICE_ATTR_RO(cpumask);
>> +
>> +static struct attribute *xe_cpumask_attrs[] = {
>> +    &dev_attr_cpumask.attr,
>> +    NULL,
>> +};
>> +
>> +static const struct attribute_group xe_pmu_cpumask_attr_group = {
>> +    .attrs = xe_cpumask_attrs,
>> +};
>> +
>> +#define __event(__counter, __name, __unit) \
>> +{ \
>> +    .counter = (__counter), \
>> +    .name = (__name), \
>> +    .unit = (__unit), \
>> +}
>> +
>> +static struct xe_ext_attribute *
>> +add_xe_attr(struct xe_ext_attribute *attr, const char *name, u64 
>> config)
>> +{
>> +    sysfs_attr_init(&attr->attr.attr);
>> +    attr->attr.attr.name = name;
>> +    attr->attr.attr.mode = 0444;
>> +    attr->attr.show = xe_pmu_event_show;
>> +    attr->val = config;
>> +
>> +    return ++attr;
>> +}
>> +
>> +static struct perf_pmu_events_attr *
>> +add_pmu_attr(struct perf_pmu_events_attr *attr, const char *name,
>> +         const char *str)
>> +{
>> +    sysfs_attr_init(&attr->attr.attr);
>> +    attr->attr.attr.name = name;
>> +    attr->attr.attr.mode = 0444;
>> +    attr->attr.show = perf_event_sysfs_show;
>> +    attr->event_str = str;
>> +
>> +    return ++attr;
>> +}
>> +
>> +static struct attribute **
>> +create_event_attributes(struct xe_pmu *pmu)
>> +{
>> +    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +    static const struct {
>> +        unsigned int counter;
>> +        const char *name;
>> +        const char *unit;
>> +    } events[] = {
>> +    };
>> +
>> +    struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
>> +    struct xe_ext_attribute *xe_attr = NULL, *xe_iter;
>> +    struct attribute **attr = NULL, **attr_iter;
>> +    unsigned int count = 0;
>> +    unsigned int i, j;
>> +    struct xe_gt *gt;
>> +
>> +    /* Count how many counters we will be exposing. */
>> +    for_each_gt(gt, xe, j) {
>> +        for (i = 0; i < ARRAY_SIZE(events); i++) {
>> +            u64 config = ___XE_PMU_OTHER(j, events[i].counter);
>
> what's "OTHER"?
>
>> +
>> +            if (!config_status(xe, config))
>> +                count++;
>> +        }
>> +    }
>> +
>> +    /* Allocate attribute objects and table. */
>> +    xe_attr = kcalloc(count, sizeof(*xe_attr), GFP_KERNEL);
>
> afair from doing the dummy_pmu
> (https://lore.kernel.org/all/20241008183501.1354695-1-lucas.demarchi@intel.com/) 
>
> we don't need to allocate the attributes. What we need is a function
> like dummy_pmu_events_sysfs_show() that returns the right config using
> the id.
>
>
>> +    if (!xe_attr)
>> +        goto err_alloc;
>> +
>> +    pmu_attr = kcalloc(count, sizeof(*pmu_attr), GFP_KERNEL);
>> +    if (!pmu_attr)
>> +        goto err_alloc;
>> +
>> +    /* Max one pointer of each attribute type plus a termination 
>> entry. */
>> +    attr = kcalloc(count * 2 + 1, sizeof(*attr), GFP_KERNEL);
>> +    if (!attr)
>> +        goto err_alloc;
>> +
>> +    xe_iter = xe_attr;
>> +    pmu_iter = pmu_attr;
>> +    attr_iter = attr;
>> +
>> +    for_each_gt(gt, xe, j) {
>> +        for (i = 0; i < ARRAY_SIZE(events); i++) {
>> +            u64 config = ___XE_PMU_OTHER(j, events[i].counter);
>> +            char *str;
>> +
>> +            if (config_status(xe, config))
>> +                continue;
>> +
>> +            str = kasprintf(GFP_KERNEL, "%s-gt%u",
>> +                    events[i].name, j);
>> +            if (!str)
>> +                goto err;
>> +
>> +            *attr_iter++ = &xe_iter->attr.attr;
>> +            xe_iter = add_xe_attr(xe_iter, str, config);
>> +
>> +            if (events[i].unit) {
>> +                str = kasprintf(GFP_KERNEL, "%s-gt%u.unit",
>> +                        events[i].name, j);
>> +                if (!str)
>> +                    goto err;
>> +
>> +                *attr_iter++ = &pmu_iter->attr.attr;
>> +                pmu_iter = add_pmu_attr(pmu_iter, str,
>> +                            events[i].unit);
>> +            }
>> +        }
>> +    }
>> +
>> +    pmu->xe_attr = xe_attr;
>> +    pmu->pmu_attr = pmu_attr;
>> +
>> +    return attr;
>> +
>> +err:
>> +    for (attr_iter = attr; *attr_iter; attr_iter++)
>> +        kfree((*attr_iter)->name);
>> +
>> +err_alloc:
>> +    kfree(attr);
>> +    kfree(xe_attr);
>> +    kfree(pmu_attr);
>> +
>> +    return NULL;
>> +}
>> +
>> +static void free_event_attributes(struct xe_pmu *pmu)
>> +{
>> +    struct attribute **attr_iter = pmu->events_attr_group.attrs;
>> +
>> +    for (; *attr_iter; attr_iter++)
>> +        kfree((*attr_iter)->name);
>> +
>> +    kfree(pmu->events_attr_group.attrs);
>> +    kfree(pmu->xe_attr);
>> +    kfree(pmu->pmu_attr);
>> +
>> +    pmu->events_attr_group.attrs = NULL;
>> +    pmu->xe_attr = NULL;
>> +    pmu->pmu_attr = NULL;
>> +}
>> +
>> +static int xe_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
>> +{
>> +    struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), 
>> cpuhp.node);
>> +
>> +    /* Select the first online CPU as a designated reader. */
>> +    if (cpumask_empty(&xe_pmu_cpumask))
>> +        cpumask_set_cpu(cpu, &xe_pmu_cpumask);
>> +
>> +    return 0;
>> +}
>> +
>> +static int xe_pmu_cpu_offline(unsigned int cpu, struct hlist_node 
>> *node)
>> +{
>> +    struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), 
>> cpuhp.node);
>> +    unsigned int target = xe_pmu_target_cpu;
>> +
>> +    /*
>> +     * Unregistering an instance generates a CPU offline event which 
>> we must
>> +     * ignore to avoid incorrectly modifying the shared xe_pmu_cpumask.
>> +     */
>> +    if (!pmu->registered)
>> +        return 0;
>> +
>> +    if (cpumask_test_and_clear_cpu(cpu, &xe_pmu_cpumask)) {
>> +        target = cpumask_any_but(topology_sibling_cpumask(cpu), cpu);
>> +
>> +        /* Migrate events if there is a valid target */
>> +        if (target < nr_cpu_ids) {
>> +            cpumask_set_cpu(target, &xe_pmu_cpumask);
>> +            xe_pmu_target_cpu = target;
>> +        }
>> +    }
>> +
>> +    if (target < nr_cpu_ids && target != pmu->cpuhp.cpu) {
>> +        perf_pmu_migrate_context(&pmu->base, cpu, target);
>> +        pmu->cpuhp.cpu = target;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static enum cpuhp_state cpuhp_state = CPUHP_INVALID;
>> +
>> +/**
>> + * xe_pmu_init() - Setup CPU hotplug state/callbacks for Xe PMU
>> + *
>> + * Returns: 0 if successful, else error code
>> + */
>> +int xe_pmu_init(void)
>> +{
>> +    int ret;
>> +
>> +    ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
>> +                      "perf/x86/intel/xe:online",
>> +                      xe_pmu_cpu_online,
>> +                      xe_pmu_cpu_offline);
>> +    if (ret < 0)
>> +        pr_notice("Failed to setup cpuhp state for xe PMU! (%d)\n",
>> +              ret);
>> +    else
>> +        cpuhp_state = ret;
>> +
>> +    return 0;
>> +}
>> +
>> +/**
>> + * xe_pmu_exit() - Remove CPU hotplug state/callbacks for Xe PMU
>> + */
>> +void xe_pmu_exit(void)
>> +{
>> +    if (cpuhp_state != CPUHP_INVALID)
>> +        cpuhp_remove_multi_state(cpuhp_state);
>> +}
>> +
>> +static int xe_pmu_register_cpuhp_state(struct xe_pmu *pmu)
>> +{
>> +    if (cpuhp_state == CPUHP_INVALID)
>> +        return -EINVAL;
>> +
>> +    return cpuhp_state_add_instance(cpuhp_state, &pmu->cpuhp.node);
>> +}
>> +
>> +static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
>> +{
>> +    cpuhp_state_remove_instance(cpuhp_state, &pmu->cpuhp.node);
>> +}
>> +
>> +/**
>> + * xe_pmu_unregister() - Remove/cleanup PMU registration
>> + * @arg: Ptr to pmu
>> + */
>> +void xe_pmu_unregister(void *arg)
>> +{
>> +    struct xe_pmu *pmu = arg;
>> +
>> +    if (!pmu->registered)
>> +        return;
>> +
>> +    pmu->registered = false;
>> +
>> +    xe_pmu_unregister_cpuhp_state(pmu);
>> +
>> +    perf_pmu_unregister(&pmu->base);
>> +    kfree(pmu->base.attr_groups);
>> +    kfree(pmu->name);
>> +    free_event_attributes(pmu);
>> +}
>> +
>> +/**
>> + * xe_pmu_register() - Define basic PMU properties for Xe and add 
>> event callbacks.
>> + * @pmu: the PMU object
>> + *
>> + */
>> +void xe_pmu_register(struct xe_pmu *pmu)
>> +{
>> +    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +    const struct attribute_group *attr_groups[] = {
>> +        &pmu->events_attr_group,
>> +        &xe_pmu_cpumask_attr_group,
>> +        NULL
>> +    };
>> +
>> +    int ret = -ENOMEM;
>> +
>> +    spin_lock_init(&pmu->lock);
>> +    pmu->cpuhp.cpu = -1;
>> +
>> +    pmu->name = kasprintf(GFP_KERNEL,
>> +                  "xe_%s",
>> +                  dev_name(xe->drm.dev));
>> +    if (pmu->name) {
>> +        /* tools/perf reserves colons as special. */
>> +        strreplace((char *)pmu->name, ':', '_');
>> +    }
>> +
>> +    if (!pmu->name)
>> +        goto err;
>> +
>> +    pmu->events_attr_group.name = "events";
>> +    pmu->events_attr_group.attrs = create_event_attributes(pmu);
>> +    if (!pmu->events_attr_group.attrs)
>> +        goto err_name;
>> +
>> +    pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
>> +                    GFP_KERNEL);
>> +    if (!pmu->base.attr_groups)
>> +        goto err_attr;
>> +
>> +    pmu->base.module    = THIS_MODULE;
>> +    pmu->base.task_ctx_nr    = perf_invalid_context;
>> +    pmu->base.event_init    = xe_pmu_event_init;
>> +    pmu->base.add        = xe_pmu_event_add;
>> +    pmu->base.del        = xe_pmu_event_del;
>> +    pmu->base.start        = xe_pmu_event_start;
>> +    pmu->base.stop        = xe_pmu_event_stop;
>> +    pmu->base.read        = xe_pmu_event_read;
>> +    pmu->base.event_idx    = xe_pmu_event_event_idx;
>> +
>> +    ret = perf_pmu_register(&pmu->base, pmu->name, -1);
>> +    if (ret)
>> +        goto err_groups;
>> +
>> +    ret = xe_pmu_register_cpuhp_state(pmu);
>> +    if (ret)
>> +        goto err_unreg;
>> +
>> +    ret = devm_add_action_or_reset(xe->drm.dev, xe_pmu_unregister, 
>> pmu);
>> +    if (ret)
>> +        goto err_cpuhp;
>
> now I'm confused... if you added it here as an action to be called on
> remove, why are you manually calling xe_pmu_unregister() on xe_device.c?
>
>
> So.... I have some stashed changes here with the suggestions I mentioned
> above and will probably have some more once I get to play with it. Are
> you ok if I just do the changes locally and submit the result?
>
> thanks
> Lucas De Marchi
>
>> +
>> +    pmu->registered = true;
>> +
>> +    return;
>> +
>> +err_cpuhp:
>> +    xe_pmu_unregister_cpuhp_state(pmu);
>> +err_unreg:
>> +    perf_pmu_unregister(&pmu->base);
>> +err_groups:
>> +    kfree(pmu->base.attr_groups);
>> +err_attr:
>> +    free_event_attributes(pmu);
>> +err_name:
>> +    kfree(pmu->name);
>> +err:
>> +    drm_notice(&xe->drm, "Failed to register PMU!\n");
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
>> new file mode 100644
>> index 000000000000..d07e5dfdfec0
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu.h
>> @@ -0,0 +1,26 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_PMU_H_
>> +#define _XE_PMU_H_
>> +
>> +#include "xe_pmu_types.h"
>> +
>> +struct xe_gt;
>> +
>> +#if IS_ENABLED(CONFIG_PERF_EVENTS)
>> +int xe_pmu_init(void);
>> +void xe_pmu_exit(void);
>> +void xe_pmu_register(struct xe_pmu *pmu);
>> +void xe_pmu_unregister(void *arg);
>> +#else
>> +static inline int xe_pmu_init(void) { return 0; }
>> +static inline void xe_pmu_exit(void) {}
>> +static inline void xe_pmu_register(struct xe_pmu *pmu) {}
>> +static inline void xe_pmu_unregister(void *arg) {}
>> +#endif
>> +
>> +#endif
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h 
>> b/drivers/gpu/drm/xe/xe_pmu_types.h
>> new file mode 100644
>> index 000000000000..4da96b8fadd1
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>> @@ -0,0 +1,70 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_PMU_TYPES_H_
>> +#define _XE_PMU_TYPES_H_
>> +
>> +#include <linux/perf_event.h>
>> +#include <linux/spinlock_types.h>
>> +
>> +enum {
>> +    __XE_NUM_PMU_SAMPLERS
>> +};
>> +
>> +#define XE_PMU_MAX_GT 2
>> +
>> +/*
>> + * Top bits of every counter are GT id.
>> + */
>> +#define __XE_PMU_GT_SHIFT (56)
>> +
>> +#define ___XE_PMU_OTHER(gt, x) \
>> +    (((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>> +
>> +struct xe_pmu {
>> +    /**
>> +     * @cpuhp: Struct used for CPU hotplug handling.
>> +     */
>> +    struct {
>> +        struct hlist_node node;
>> +        unsigned int cpu;
>> +    } cpuhp;
>> +    /**
>> +     * @base: PMU base.
>> +     */
>> +    struct pmu base;
>> +    /**
>> +     * @registered: PMU is registered and not in the unregistering 
>> process.
>> +     */
>> +    bool registered;
>> +    /**
>> +     * @name: Name as registered with perf core.
>> +     */
>> +    const char *name;
>> +    /**
>> +     * @lock: Lock protecting enable mask and ref count handling.
>> +     */
>> +    spinlock_t lock;
>> +    /**
>> +     * @sample: Current and previous (raw) counters.
>> +     *
>> +     * These counters are updated when the device is awake.
>> +     */
>> +    u64 sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
>> +    /**
>> +     * @events_attr_group: Device events attribute group.
>> +     */
>> +    struct attribute_group events_attr_group;
>> +    /**
>> +     * @xe_attr: Memory block holding device attributes.
>> +     */
>> +    void *xe_attr;
>> +    /**
>> +     * @pmu_attr: Memory block holding device attributes.
>> +     */
>> +    void *pmu_attr;
>> +};
>> +
>> +#endif
>> -- 
>> 2.38.1
>>

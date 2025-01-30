Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D63C0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 23:56:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5C410E115;
	Thu, 30 Jan 2025 23:56:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mom0nq7M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A21410E115
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 23:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738281376; x=1769817376;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=c1DEqy7Vdbar6De5T6Uxbr42b9TV4iPXSrA9fytKwOQ=;
 b=mom0nq7MCQKGY1OHtaLyhbmN6iHeI2j0dfaFrTwqd9rq8ONKYXH3ukZz
 SEKNYFzNCP38xjBcOa6qx8az7bshNIgYCFj2xlDdzOFksKkKvEoHsCCsg
 73omP64+XU7HGYUJsdwPXIk3DMnqmp7ZzGhs8RgXE3LWLg/9+bD4Bbf8Z
 ATrT7cWuat/qZtx8s2ZdUzqCGKDrYSm8P7jEPLh8NDIUwJwM0sYgQNrzZ
 IyP6G2ZhGLZf0zyB/oXZfQFet1QxZLB6IUYGwtkgkrCpQaymAeKcHrzxe
 FiTGFMM9N4qTHFGFEzIGuNCkvONGI6CCU6YWligC1DnIQDhasO12xRXUT A==;
X-CSE-ConnectionGUID: TbPCv6/5TaSjYfNBGpanBg==
X-CSE-MsgGUID: HiIXrE8dT0qnL91fiw8+sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38955377"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="38955377"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 15:56:14 -0800
X-CSE-ConnectionGUID: BZKY/UhaQs+C02Fub2GTCg==
X-CSE-MsgGUID: j0UX0QG4TdmVud9TPP2SfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109931191"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 15:56:14 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 15:56:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 15:56:13 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 15:56:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mgG0zU/srQenFMitGlJarU0yINSstGOkRCRx8iMV9JHho4fyry3f7wiJeIUWAQAhuJ77haxFGjWBNYlSrlxfYP0Z9JEabl8fIQZCQA66t0XeBb4464EA0NMDoqYzvHz/u8J78u1ygjfhXGtMwYByIEVVoI6tvA/prCi5xMpHafh94mtc1LZ8g9Dm/t3+f31YxgmiA3+nobpPNRvJFMRKdn46XDTWRkNkda/Kfbi106ca4E21kN2CEggkQJR0k/RKnMrKeGpeJaiYyCo8tc+fKuGY3mP4O8I1qAzLrfYI2XzKNM7ybeaEOeJwPHUka1eBG6UWAKQVzf6rGSSK9WwYZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EvG47cwjl4NQ+SzMYEq+QVAkWpT1ZeUbXreGuh9zgZ0=;
 b=pwPTe6cBNOA/qwrcb8AASryKJ7oqJaQroTe2ugbVmxtYPpYLrXcEXDhX9dz54/IyBDbE2+3Peh0HFzqrzMi+CDuggi44hfl/32bBNwoytB4MAOSogYasIFeJc6mbRqkTixY2dfZv3g8Er61mg7N0n/m9CUQApOXfeuvri0ICX08Lb1nMW6NBaTAvW3PqO5/D9VlOCYxFLCAqYUlc/DNIlCRy13ys57AzBYiJJariyFKjCXl1mDCcWN3dAAzA7rTMIJFZ/L4+zGRVKJ/yqFc1I9Jp0TvLY8cfHUJqwybQI2belNkoDhMlpFpoLrDi/vgudp+Yui79x0KGPr7k5glpug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4610.namprd11.prod.outlook.com (2603:10b6:5:2ab::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 23:56:10 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 23:56:10 +0000
Date: Thu, 30 Jan 2025 17:56:05 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v4 1/8] drm/xe: Add per-engine-class activity support
Message-ID: <fof33aho3t55pqxhnaclyzhld2iroeqwckd3uk47wvn3ec73iq@fftqnbgdfuic>
References: <20250129101653.1976699-1-riana.tauro@intel.com>
 <20250129101653.1976699-2-riana.tauro@intel.com>
 <Z5rHtFUIbLNRfBfk@orsosgc001> <Z5rlgedsHPm6lhSw@intel.com>
 <d2bb059f-61a3-4e5c-bd84-b8a746a10f87@intel.com>
 <Z5v-00L-GsSTye0h@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5v-00L-GsSTye0h@intel.com>
X-ClientProxiedBy: MW4PR04CA0261.namprd04.prod.outlook.com
 (2603:10b6:303:88::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4610:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a2812b5-1c90-4e40-2664-08dd4189abb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|27256017;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?tNmzhDmd3QopTktXLMF/1I15Z1ikgb1fV1+7/y63a3z1QMAxPmSPO6H5DL?=
 =?iso-8859-1?Q?C2RkHqLoFsH/oJ/OwoLSK4X9IAAKP1zEBrvOT3Vu/KrdjsvSn6gc7RZeu0?=
 =?iso-8859-1?Q?mJ+NvsitwEQaaTt25J22Rt6E/fpKogltc7sO1Xt89f3oGlmoyTtbwDn78v?=
 =?iso-8859-1?Q?9Ojw8gA885FDLfJwLGC9Hf3I8fp0JOmalTpz8D+EM70snf/np7xHhE6ZfL?=
 =?iso-8859-1?Q?Xxz6Uni7M56DnpjmKZY5EL4tN+ZsmX80qIL6PnSFhCLm7Oy47kiWpbQoWC?=
 =?iso-8859-1?Q?1vfd5mnkIdQwKxOIUUESmhTXOzmgVx/hDL2MjY+RjFrF4vlY1YaNcilb/d?=
 =?iso-8859-1?Q?3V+Gpk90PYieG/B67WdBxNZg4v0zzrhoDhT0ZXuTOgAak6BYO5UfP1lCbL?=
 =?iso-8859-1?Q?fXZCXvOF7laOq3D6U3IfW6CKm8sg0+MTfOtfa2fVPsOIfJNViGA6v/cYsE?=
 =?iso-8859-1?Q?9cPl0g48l/tfMkqtzheNdaRwFF5Z7DJKEKuYFqBUBh3uCg0x5WKaSIg/ri?=
 =?iso-8859-1?Q?lK/In5xFWv5wCYCBfoag4SLyrqbMz8xBVafMnwTzK+1oB08EXhQOycj4sM?=
 =?iso-8859-1?Q?eyS3cuSnFUxdNMvhOW9KnmdGguoZAFQtDC/RY8wm2sGkg0LD7Ufy1Xs7N0?=
 =?iso-8859-1?Q?LpHN8kwIMzZSQdzEvor57MZ+Z4Z2ZscZEK0sL+VasExMN4HC+UQYP/AOZO?=
 =?iso-8859-1?Q?c3Fitw2kqzL69dEtnK3MAXF6rVRtaBfXhUrTM20Yuvjef0IKOmwCN3K15F?=
 =?iso-8859-1?Q?4E50cNj4vW2ypJybGOScFml1XTNhA+eeTtmo3ivJ1u6OLFOkFegh1CfZuW?=
 =?iso-8859-1?Q?moS77yD3Hw1QuZZuZqswer7Y68rIoHaxNIFzR7JsaT7tr9FeyZf2Qxbsuq?=
 =?iso-8859-1?Q?Q7g8gvHA5zs8jhdcfy343MX06vyi+PxlpG6qoxoV7zgyIjKdnqyH0yD0UC?=
 =?iso-8859-1?Q?duUyKiERwk0pU9lj9GVLhfq5Az7k1UB5L2DUyqIMox9EpgeciL50/nymZM?=
 =?iso-8859-1?Q?0yiJrj1A8OSWROVLB4OdTz3E0B+5jBwFhqfvpZc7ybo4UHzQ9CbiNDk5Or?=
 =?iso-8859-1?Q?HtqD2dEOF0b9I3iAfwAd8RlHqo7+cwTL/24OI9PAFU/bsFFRroXn4s7x44?=
 =?iso-8859-1?Q?xZr5OFOJUZJeeVVrt4pPdkL/nUMhs+zWTIb8Cc5X5cbd0ygcqYmtwrlz26?=
 =?iso-8859-1?Q?FrrIlenAGKSiv1rEWVQbOWsou+Z1+mnLWW/uhd++kBqBl4/p/yFVmpDIdc?=
 =?iso-8859-1?Q?QVyGnf/WHkVV4Uych4DDMzKZNoHi491mBlmjJ0VcNU5is0Ytjd0tu1VwpJ?=
 =?iso-8859-1?Q?bcODUIelyhVOsKr22nNNCELdeBpbB3QU2rmYYXzjBXUxeP2qTNgMmF3OSx?=
 =?iso-8859-1?Q?EWA1ylQpXNX3NF3BGveNFmpYC/0vxZJazjKD2BJWVTECDy25wbr/kLO+HU?=
 =?iso-8859-1?Q?repuKJh0vXpldv2yEQqk4z0TcKoxXFRJfWmbDBSYd9WlFpmnL4F1XPPUwE?=
 =?iso-8859-1?Q?N4AMkgVYMKgMYLoiDwOB1t?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8BGVvO2xLBgmTr+9x2I2YAFTD1w907Kl5n3FnJA6t3+AbG2lv1C3xMHeig?=
 =?iso-8859-1?Q?o/F8nEDSSNM9kC82p8mtcWEFuCrZ2bLLHxp1ISnHH/Co9lhhrC3fsHRmRA?=
 =?iso-8859-1?Q?pDkPdudsJmcXs2dwISk+BzHHIdmlxgsGCYkxVtp58TIeimPB3BEqKoiXAt?=
 =?iso-8859-1?Q?ZY3zV8jExCsObexLxNg66wqtD25p1Rp7HqaDPAYlbiJQ+Z1+gWhWEqFb0i?=
 =?iso-8859-1?Q?kOx2zVA99eZexqWgIo3fj4krdV8KVEd+cyg6FMYEYbnpTmbiE+uO3fAEh9?=
 =?iso-8859-1?Q?i6LIAnbvUsZe/Z2/usNrrsGV+E+915X9f5y/uc7feRqfmX28b0S2E49E4E?=
 =?iso-8859-1?Q?mzDJnFLU4hDDZEr/yicf0VlN8/Ni1Wnm06vw6BWHuUFLqE0t4e/A2v+dkW?=
 =?iso-8859-1?Q?n9Gucjnj5p4DURKf2iEEY0yA6YCwtt1QdsqTfoaUUflBODAXtcCB0x/Q8S?=
 =?iso-8859-1?Q?IT8uws2NScb5Rtuhbul3eFBTYaJoyOm5h0MfV+RmI6TSEW18XxHfAvD7xH?=
 =?iso-8859-1?Q?OLGpzMZznGw2qUlzylO5PzVwmEFIpODEtYAlPadKi3mHD0bHF+Z/h05FBm?=
 =?iso-8859-1?Q?zIR1tj/uW9rRUjNZXh2rwqN9mWH3XbbUM89hG1qL3BnoIFi9MK6GqfMMNG?=
 =?iso-8859-1?Q?8Fk0oX6/yXeYBUBnfm9yfPrrtpvf7CPATL7l+LrlVcGGptIJpQ92p+6haR?=
 =?iso-8859-1?Q?hMnaEAGR2q3607G33Zzjzpt/XBzn1Ee9Vn3OBiiptzzpWsfF1VHG9+oVV5?=
 =?iso-8859-1?Q?L3Oc0P7cl2WR92yIcjbTumO643od/4dLFgL+e9R/IsormJ2T15ioStdebI?=
 =?iso-8859-1?Q?CwlJj+ppwlw20N4mnF9h+Y4pAAOGlWVpqsdB31NiNAESFI45dZ6Gz7/vfI?=
 =?iso-8859-1?Q?vQOf616mVOLm7IdE+y/RHv4Tubl9XSRSQd44M1KeQCj7Y93gJumAr8ExrZ?=
 =?iso-8859-1?Q?mBaohicfj1/AcgxX8dg9Dgh/NEFSPUvzuTTLRmvWbGOdTETneN3yALtJVq?=
 =?iso-8859-1?Q?vERgvnFOpQ4IR1RGXvI+ADZ3t4BLjc//E6ywj8poTo9PIiVUtIlzzXCjD8?=
 =?iso-8859-1?Q?T0LvN9kUBB7kVr41D60760b/4yuDPFcPHttYE3Km5yczAJMnrgtnFGm4Jj?=
 =?iso-8859-1?Q?2RUjukQDvawhRuUnp5vPbimzsS0Nf8rUlHRqQ29PwMAqJw59npYb1nVRlv?=
 =?iso-8859-1?Q?MOLKGuawUdVScYZE9jb1bL9mObsHuwP0DgUeVNW7FxAu13deRuD5wZMJt3?=
 =?iso-8859-1?Q?/0OinkRa4YSdRikWQ3qFmq9vKuaxM45mekseTmQs5jFXYwXmNf+JoguWp3?=
 =?iso-8859-1?Q?ChNCn9NEGMYnmkAf5/248pfoaKJOZAHT05FE8+SumVMfZmyZUlDpcR7ntX?=
 =?iso-8859-1?Q?F9xgzZqu9vyTCVG8CAucyn0ZVcO7V5h/CC3FaVUJeRysRGbFKGwCPk4xIU?=
 =?iso-8859-1?Q?50RmDzuauhHAr1EB1/ne3hX0ZVPJXO3kh6wW8MxhAcwuXXaLHo3vCQ68Hg?=
 =?iso-8859-1?Q?yaOpAKRsU1NURA6naVGUtBQNelyhOt18Q7OeLegaGvqIbg+d9vunPZlUC2?=
 =?iso-8859-1?Q?6ish6gFxKYRDibzSgmVyrXfaO4nTuQ5JCvWjp7WycfphZ+WObq1P9QbZSB?=
 =?iso-8859-1?Q?YQ4md/eKbAKlGwFJSZAYfOJ4FXk2GJes81yw0EQJpmlGkIEVrGMYFunw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a2812b5-1c90-4e40-2664-08dd4189abb8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 23:56:10.7018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3oynPV/NXF7TZqpm273G8PC3hetq8pFW3VrMAA8P2kveHXX6nosVoN46AM6bbdTMgAsUdqqDGMvjPKn6YmfU6Q5HTErd+eONiO2PIM6ilBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4610
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

On Thu, Jan 30, 2025 at 05:36:03PM -0500, Rodrigo Vivi wrote:
>On Thu, Jan 30, 2025 at 10:19:24AM +0530, Riana Tauro wrote:
>> Hi Umesh/Rodrigo
>>
>> On 1/30/2025 8:05 AM, Rodrigo Vivi wrote:
>> > On Wed, Jan 29, 2025 at 04:28:36PM -0800, Umesh Nerlige Ramappa wrote:
>> > > On Wed, Jan 29, 2025 at 03:46:44PM +0530, Riana Tauro wrote:
>> > > > GuC provides support to read engine counters to calculate the
>> > > > engine activity. KMD exposes two counters via the PMU interface to
>> > > > calculate engine activity
>> > > >
>> > > > Engine Active Ticks(engine-active-ticks) - number of active ticks for engine
>> > > > Engine Total Ticks (engine-total-ticks) - total ticks of engine
>> > > >
>> > > > Engine activity percentage can be calculated as below
>> > > > Engine activity % = (engine active ticks/engine total ticks) * 100.
>> > > >
>> > > > v2: fix cosmetic review comments
>> > > >     add forcewake for gpm_ts (Umesh)
>> > > >
>> > > > v3: fix CI hooks error
>> > > >     change function parameters and unpin bo on error
>> > > >     of allocate_activity_buffers
>> > > >     fix kernel-doc (Umesh)
>> > > >     use engine activity (Umesh, Lucas)
>> > > >     rename xe_engine_activity to xe_guc_engine_*
>> > > >     fix commit message to use per-engine class(Lucas)
>> > > >
>> > > > v4: remove forcewake as engine is already running
>> > > >     when reading gpm timestamp
>> > >
>> > > + Rodrigo
>> > >
>> > > Sorry, I think I mentioned offline that the runtime pm get is sufficient for
>> > > reading this register, but it's not. It does need a forcewake of the GT
>> > > domain.  At the same time, we cannot use the xe_force_wake_get because of
>> > > the lockdep issue you mentioned and also I assume that xe_force_wake_get may
>> > > sleep and the event may be read from irq context.
>> The lockdep issue is due to perf holding a raw_spinlock and forcewake having
>> a spinlock. In 6.13 due to config PROVE_RAW_LOCK_NESTING being enabled was
>> seeing this issue. Latest patch has disabled this due to issues with i915.
>>
>> [  465.359017] =============================
>> [  465.363050] [ BUG: Invalid wait context ]
>> [  465.367063] 6.13.0-rc5-xe #11 Tainted: G     U
>> [  465.372544] -----------------------------
>> [  465.376555] swapper/0/0 is trying to lock:
>> [  465.380652] ffff88810d5b8098 (&fw->lock){....}-{3:3}, at:
>> xe_force_wake_get+0x1f9/0x8c0 [xe]
>> [  465.389168] other info that might help us debug this:
>> [  465.394221] context-{5:5}
>> [  465.396847] 1 lock held by swapper/0/0:
>> [  465.400682]  #0: ffff88885f031fb8 (&cpuctx_lock){....}-{2:2}, at:
>> __perf_event_read+0x60/0x230
>> [  465.409295] stack backtrace:
>
>
>hmmm I had forgotten about this...
>
>Lucas, since you were the last one that looked into it,
>would be feasible to switch at least the xe_force_wake towards
>raw_spinlock?

no, I don't think so. We hold the spinlock and then call
xe_mmio_wait32(... XE_FORCE_WAKE_ACK_TIMEOUT_MS). Yeah.. it's only upper
bound, but we should look at other solutions.

1) move the read to the hrtimer, like is done for e.g. rapl. We can then
    continue using spinlock for the hw interaction.

2) introduce a raw_spinlock that will protect only domain->ref
    that would allow us to implement an _if_active variant. But I
    don't know how that would help here since we need to read the
    register. What do we do when the fw is not taken?

    on gt-c6 that idea was dropped on the floor since it was
    not working well and overcomplicating it.

3) ... something else?

Lucas De Marchi

>
>
>>
>>
>> Since in this case we are checking mmio only when engine is running
>> and gt will be active. i thought we could remove it.
>>
>> >>> +	if (ea->running) {
>> >>> +		gpm_ts = xe_mmio_read64_2x32(&gt->mmio, MISC_STATUS_0) >>
>> >>> +			 engine_activity->gpm_timestamp_shift;
>> >>> +		ea->active = lower_32_bits(gpm_ts) -
>> cached_activity->last_update_tick;
>> >>> +	}
>>
>> But yeah, gt might enter c6 just after reading ea->running. To avoid this,as
>> lucas suggested have to use hr timer.
>>
>> I thought if needed, will add it as part of a separate series.
>> I can add the forcewake back as the config is removed and add hr timer in
>> another series.
>>
>> Thanks
>> Riana
>> >
>> > I don't understand this statement entirely. force wake get cannot sleep.
>> > It is based on spin locks. It should not be issuing any lockdep here.
>> > It is quite simple flow with minimal or none interdependency. Remember
>> > that in i915 for instance it exists and lives in the middle of every
>> > mmio read and write call...
>> >
>> > >
>> > > I would check if we can add a helper xe_force_wake_get_if_active() and just
>> > > use that to bump up the wakeref.
>> >
>> > I would prefer to not complicate things...
>> >
>> > >
>> > > @Rodrigo, @Vinay Any thoughts on this ^ ?
>> >
>> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> >
>> > >
>> > > Thanks,
>> > > Umesh
>> > >
>> > > >
>> > > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> > > > Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > > > ---
>> > > > drivers/gpu/drm/xe/Makefile                   |   1 +
>> > > > drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   1 +
>> > > > drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   2 +
>> > > > drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 317 ++++++++++++++++++
>> > > > drivers/gpu/drm/xe/xe_guc_engine_activity.h   |  18 +
>> > > > .../gpu/drm/xe/xe_guc_engine_activity_types.h |  89 +++++
>> > > > drivers/gpu/drm/xe/xe_guc_fwif.h              |  19 ++
>> > > > drivers/gpu/drm/xe/xe_guc_types.h             |   4 +
>> > > > 8 files changed, 451 insertions(+)
>> > > > create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> > > > create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.h
>> > > > create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>> > > >
>> > > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> > > > index 328aff36831b..7e93461c60bd 100644
>> > > > --- a/drivers/gpu/drm/xe/Makefile
>> > > > +++ b/drivers/gpu/drm/xe/Makefile
>> > > > @@ -33,6 +33,7 @@ xe-y += xe_bb.o \
>> > > > 	xe_device_sysfs.o \
>> > > > 	xe_dma_buf.o \
>> > > > 	xe_drm_client.o \
>> > > > +	xe_guc_engine_activity.o \
>> > > > 	xe_exec.o \
>> > > > 	xe_execlist.o \
>> > > > 	xe_exec_queue.o \
>> > > > diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> > > > index fee385532fb0..ec516e838ee8 100644
>> > > > --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> > > > +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> > > > @@ -140,6 +140,7 @@ enum xe_guc_action {
>> > > > 	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
>> > > > 	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>> > > > 	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>> > > > +	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
>> > > > 	XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
>> > > > 	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
>> > > > 	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
>> > > > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > > > index 096859072396..124cc398798e 100644
>> > > > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > > > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > > > @@ -358,6 +358,8 @@
>> > > > #define   RENDER_AWAKE_STATUS			REG_BIT(1)
>> > > > #define   MEDIA_SLICE0_AWAKE_STATUS		REG_BIT(0)
>> > > >
>> > > > +#define MISC_STATUS_0				XE_REG(0xa500)
>> > > > +
>> > > > #define FORCEWAKE_MEDIA_VDBOX(n)		XE_REG(0xa540 + (n) * 4)
>> > > > #define FORCEWAKE_MEDIA_VEBOX(n)		XE_REG(0xa560 + (n) * 4)
>> > > > #define FORCEWAKE_GSC				XE_REG(0xa618)
>> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> > > > new file mode 100644
>> > > > index 000000000000..088209b9c228
>> > > > --- /dev/null
>> > > > +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> > > > @@ -0,0 +1,317 @@
>> > > > +// SPDX-License-Identifier: MIT
>> > > > +/*
>> > > > + * Copyright © 2025 Intel Corporation
>> > > > + */
>> > > > +#include "xe_guc_engine_activity.h"
>> > > > +
>> > > > +#include "abi/guc_actions_abi.h"
>> > > > +#include "regs/xe_gt_regs.h"
>> > > > +
>> > > > +#include "xe_bo.h"
>> > > > +#include "xe_force_wake.h"
>> > > > +#include "xe_gt_printk.h"
>> > > > +#include "xe_guc.h"
>> > > > +#include "xe_guc_ct.h"
>> > > > +#include "xe_hw_engine.h"
>> > > > +#include "xe_map.h"
>> > > > +#include "xe_mmio.h"
>> > > > +
>> > > > +#define TOTAL_QUANTA 0x8000
>> > > > +
>> > > > +static struct iosys_map engine_activity_map(struct xe_guc *guc, struct xe_hw_engine *hwe)
>> > > > +{
>> > > > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> > > > +	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
>> > > > +	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>> > > > +	size_t offset = 0;
>> > > > +
>> > > > +	offset = offsetof(struct guc_engine_activity_data,
>> > > > +			  engine_activity[guc_class][hwe->logical_instance]);
>> > > > +
>> > > > +	return IOSYS_MAP_INIT_OFFSET(&buffer->activity_bo->vmap, offset);
>> > > > +}
>> > > > +
>> > > > +static struct iosys_map engine_metadata_map(struct xe_guc *guc)
>> > > > +{
>> > > > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> > > > +	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
>> > > > +
>> > > > +	return buffer->metadata_bo->vmap;
>> > > > +}
>> > > > +
>> > > > +static int allocate_engine_activity_group(struct xe_guc *guc)
>> > > > +{
>> > > > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> > > > +	u32 num_activity_group = 1;
>> > > > +
>> > > > +	engine_activity->eag = kmalloc_array(num_activity_group,
>> > > > +					     sizeof(struct engine_activity_group),
>> > > > +					     GFP_KERNEL);
>> > > > +
>> > > > +	if (!engine_activity->eag)
>> > > > +		return -ENOMEM;
>> > > > +
>> > > > +	memset(engine_activity->eag, 0, num_activity_group * sizeof(struct engine_activity_group));
>> > > > +	engine_activity->num_activity_group = num_activity_group;
>> > > > +
>> > > > +	return 0;
>> > > > +}
>> > > > +
>> > > > +static int allocate_engine_activity_buffers(struct xe_guc *guc,
>> > > > +					    struct engine_activity_buffer *buffer)
>> > > > +{
>> > > > +	u32 metadata_size = sizeof(struct guc_engine_activity_metadata);
>> > > > +	u32 size = sizeof(struct guc_engine_activity_data);
>> > > > +	struct xe_gt *gt = guc_to_gt(guc);
>> > > > +	struct xe_tile *tile = gt_to_tile(gt);
>> > > > +	struct xe_bo *bo, *metadata_bo;
>> > > > +
>> > > > +	metadata_bo = xe_managed_bo_create_pin_map(gt_to_xe(gt), tile, PAGE_ALIGN(metadata_size),
>> > > > +						   XE_BO_FLAG_SYSTEM |
>> > > > +						   XE_BO_FLAG_GGTT |
>> > > > +						   XE_BO_FLAG_GGTT_INVALIDATE);
>> > > > +	if (IS_ERR(metadata_bo))
>> > > > +		return PTR_ERR(metadata_bo);
>> > > > +
>> > > > +	bo = xe_managed_bo_create_pin_map(gt_to_xe(gt), tile, PAGE_ALIGN(size),
>> > > > +					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>> > > > +					  XE_BO_FLAG_GGTT |
>> > > > +					  XE_BO_FLAG_GGTT_INVALIDATE);
>> > > > +
>> > > > +	if (IS_ERR(bo)) {
>> > > > +		xe_bo_unpin_map_no_vm(metadata_bo);
>> > > > +		return PTR_ERR(bo);
>> > > > +	}
>> > > > +
>> > > > +	buffer->metadata_bo = metadata_bo;
>> > > > +	buffer->activity_bo = bo;
>> > > > +	return 0;
>> > > > +}
>> > > > +
>> > > > +static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine *hwe)
>> > > > +{
>> > > > +	struct xe_guc *guc = &hwe->gt->uc.guc;
>> > > > +	struct engine_activity_group *eag = &guc->engine_activity.eag[0];
>> > > > +	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>> > > > +
>> > > > +	return &eag->engine[guc_class][hwe->logical_instance];
>> > > > +}
>> > > > +
>> > > > +static u64 cpu_ns_to_guc_tsc_tick(ktime_t ns, u32 freq)
>> > > > +{
>> > > > +	return mul_u64_u32_div(ns, freq, NSEC_PER_SEC);
>> > > > +}
>> > > > +
>> > > > +#define read_engine_activity_record(xe_, map_, field_) \
>> > > > +	xe_map_rd_field(xe_, map_, 0, struct guc_engine_activity, field_)
>> > > > +
>> > > > +#define read_metadata_record(xe_, map_, field_) \
>> > > > +	xe_map_rd_field(xe_, map_, 0, struct guc_engine_activity_metadata, field_)
>> > > > +
>> > > > +static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>> > > > +{
>> > > > +	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>> > > > +	struct guc_engine_activity *cached_activity = &ea->activity;
>> > > > +	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
>> > > > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> > > > +	struct iosys_map activity_map, metadata_map;
>> > > > +	struct xe_device *xe =  guc_to_xe(guc);
>> > > > +	struct xe_gt *gt = guc_to_gt(guc);
>> > > > +	u32 last_update_tick, global_change_num;
>> > > > +	u64 active_ticks, gpm_ts;
>> > > > +	u16 change_num;
>> > > > +
>> > > > +	activity_map = engine_activity_map(guc, hwe);
>> > > > +	metadata_map = engine_metadata_map(guc);
>> > > > +	global_change_num = read_metadata_record(xe, &metadata_map, global_change_num);
>> > > > +
>> > > > +	/* GuC has not initialized activity data yet, return 0 */
>> > > > +	if (!global_change_num)
>> > > > +		goto update;
>> > > > +
>> > > > +	if (global_change_num == cached_metadata->global_change_num)
>> > > > +		goto update;
>> > > > +	else
>> > > > +		cached_metadata->global_change_num = global_change_num;
>> > > > +
>> > > > +	change_num = read_engine_activity_record(xe, &activity_map, change_num);
>> > > > +
>> > > > +	if (!change_num || change_num == cached_activity->change_num)
>> > > > +		goto update;
>> > > > +
>> > > > +	/* read engine activity values */
>> > > > +	last_update_tick = read_engine_activity_record(xe, &activity_map, last_update_tick);
>> > > > +	active_ticks = read_engine_activity_record(xe, &activity_map, active_ticks);
>> > > > +
>> > > > +	/* activity calculations */
>> > > > +	ea->running = !!last_update_tick;
>> > > > +	ea->total += active_ticks - cached_activity->active_ticks;
>> > > > +	ea->active = 0;
>> > > > +
>> > > > +	/* cache the counter */
>> > > > +	cached_activity->change_num = change_num;
>> > > > +	cached_activity->last_update_tick = last_update_tick;
>> > > > +	cached_activity->active_ticks = active_ticks;
>> > > > +
>> > > > +update:
>> > > > +	if (ea->running) {
>> > > > +		gpm_ts = xe_mmio_read64_2x32(&gt->mmio, MISC_STATUS_0) >>
>> > > > +			 engine_activity->gpm_timestamp_shift;
>> > > > +		ea->active = lower_32_bits(gpm_ts) - cached_activity->last_update_tick;
>> > > > +	}
>> > > > +
>> > > > +	return ea->total + ea->active;
>> > > > +}
>> > > > +
>> > > > +static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>> > > > +{
>> > > > +	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>> > > > +	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
>> > > > +	struct guc_engine_activity *cached_activity = &ea->activity;
>> > > > +	struct iosys_map activity_map, metadata_map;
>> > > > +	struct xe_device *xe = guc_to_xe(guc);
>> > > > +	ktime_t now, cpu_delta;
>> > > > +	u64 numerator;
>> > > > +	u16 quanta_ratio;
>> > > > +
>> > > > +	activity_map = engine_activity_map(guc, hwe);
>> > > > +	metadata_map = engine_metadata_map(guc);
>> > > > +
>> > > > +	if (!cached_metadata->guc_tsc_frequency_hz)
>> > > > +		cached_metadata->guc_tsc_frequency_hz = read_metadata_record(xe, &metadata_map,
>> > > > +									     guc_tsc_frequency_hz);
>> > > > +
>> > > > +	quanta_ratio = read_engine_activity_record(xe, &activity_map, quanta_ratio);
>> > > > +	cached_activity->quanta_ratio = quanta_ratio;
>> > > > +
>> > > > +	/* Total ticks calculations */
>> > > > +	now = ktime_get();
>> > > > +	cpu_delta = now - ea->last_cpu_ts;
>> > > > +	ea->last_cpu_ts = now;
>> > > > +	numerator = (ea->quanta_remainder_ns + cpu_delta) * cached_activity->quanta_ratio;
>> > > > +	ea->quanta_ns += numerator / TOTAL_QUANTA;
>> > > > +	ea->quanta_remainder_ns = numerator % TOTAL_QUANTA;
>> > > > +	ea->quanta = cpu_ns_to_guc_tsc_tick(ea->quanta_ns, cached_metadata->guc_tsc_frequency_hz);
>> > > > +
>> > > > +	return ea->quanta;
>> > > > +}
>> > > > +
>> > > > +static int enable_engine_activity_stats(struct xe_guc *guc)
>> > > > +{
>> > > > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> > > > +	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
>> > > > +	u32 metadata_ggtt_addr = xe_bo_ggtt_addr(buffer->metadata_bo);
>> > > > +	u32 ggtt_addr = xe_bo_ggtt_addr(buffer->activity_bo);
>> > > > +	int len = 0;
>> > > > +	u32 action[5];
>> > > > +
>> > > > +	action[len++] = XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER;
>> > > > +	action[len++] = metadata_ggtt_addr;
>> > > > +	action[len++] = 0;
>> > > > +	action[len++] = ggtt_addr;
>> > > > +	action[len++] = 0;
>> > > > +
>> > > > +	/* Blocking here to ensure the buffers are ready before reading them */
>> > > > +	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>> > > > +}
>> > > > +
>> > > > +static void engine_activity_set_cpu_ts(struct xe_guc *guc)
>> > > > +{
>> > > > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> > > > +	struct engine_activity_group *eag = &engine_activity->eag[0];
>> > > > +	int i, j;
>> > > > +
>> > > > +	for (i = 0; i < GUC_MAX_ENGINE_CLASSES; i++)
>> > > > +		for (j = 0; j < GUC_MAX_INSTANCES_PER_CLASS; j++)
>> > > > +			eag->engine[i][j].last_cpu_ts = ktime_get();
>> > > > +}
>> > > > +
>> > > > +static u32 gpm_timestamp_shift(struct xe_gt *gt)
>> > > > +{
>> > > > +	u32 reg;
>> > > > +
>> > > > +	reg = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
>> > > > +
>> > > > +	return 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
>> > > > +}
>> > > > +
>> > > > +/**
>> > > > + * xe_guc_engine_activity_active_ticks - Get engine active ticks
>> > > > + * @hwe: The hw_engine object
>> > > > + *
>> > > > + * Return: accumulated ticks @hwe was active since engine activity stats were enabled.
>> > > > + */
>> > > > +u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe)
>> > > > +{
>> > > > +	struct xe_guc *guc =  &hwe->gt->uc.guc;
>> > > > +
>> > > > +	return get_engine_active_ticks(guc, hwe);
>> > > > +}
>> > > > +
>> > > > +/**
>> > > > + * xe_guc_engine_activity_total_ticks - Get engine total ticks
>> > > > + * @hwe: The hw_engine object
>> > > > + *
>> > > > + * Return: accumulated quanta of ticks allocated for the engine
>> > > > + */
>> > > > +u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe)
>> > > > +{
>> > > > +	struct xe_guc *guc =  &hwe->gt->uc.guc;
>> > > > +
>> > > > +	return get_engine_total_ticks(guc, hwe);
>> > > > +}
>> > > > +
>> > > > +/**
>> > > > + * xe_guc_engine_activity_enable_stats - Enable engine activity stats
>> > > > + * @guc: The GuC object
>> > > > + *
>> > > > + * Enable engine activity stats and set initial timestamps
>> > > > + */
>> > > > +void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
>> > > > +{
>> > > > +	int ret;
>> > > > +
>> > > > +	ret = enable_engine_activity_stats(guc);
>> > > > +	if (ret)
>> > > > +		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
>> > > > +	else
>> > > > +		engine_activity_set_cpu_ts(guc);
>> > > > +}
>> > > > +
>> > > > +static void engine_activity_fini(void *arg)
>> > > > +{
>> > > > +	struct xe_guc_engine_activity *engine_activity = arg;
>> > > > +
>> > > > +	kfree(engine_activity->eag);
>> > > > +}
>> > > > +
>> > > > +/**
>> > > > + * xe_guc_engine_activity_init - Initialize the engine activity data
>> > > > + * @guc: The GuC object
>> > > > + *
>> > > > + * Return: 0 on success, negative error code otherwise.
>> > > > + */
>> > > > +int xe_guc_engine_activity_init(struct xe_guc *guc)
>> > > > +{
>> > > > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> > > > +	struct xe_gt *gt = guc_to_gt(guc);
>> > > > +	int ret;
>> > > > +
>> > > > +	ret = allocate_engine_activity_group(guc);
>> > > > +	if (ret) {
>> > > > +		xe_gt_err(gt, "failed to allocate activity group %d\n", ret);
>> > > > +		return ret;
>> > > > +	}
>> > > > +
>> > > > +	ret = allocate_engine_activity_buffers(guc, &engine_activity->device_buffer);
>> > > > +	if (ret) {
>> > > > +		xe_gt_err(gt, "failed to allocate activity buffers%d\n", ret);
>> > > > +		kfree(engine_activity->eag);
>> > > > +		return ret;
>> > > > +	}
>> > > > +
>> > > > +	engine_activity->gpm_timestamp_shift = gpm_timestamp_shift(gt);
>> > > > +
>> > > > +	return devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, engine_activity_fini,
>> > > > +					engine_activity);
>> > > > +}
>> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.h b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>> > > > new file mode 100644
>> > > > index 000000000000..c00f3da5513d
>> > > > --- /dev/null
>> > > > +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>> > > > @@ -0,0 +1,18 @@
>> > > > +/* SPDX-License-Identifier: MIT */
>> > > > +/*
>> > > > + * Copyright © 2025 Intel Corporation
>> > > > + */
>> > > > +
>> > > > +#ifndef _XE_GUC_ENGINE_ACTIVITY_H_
>> > > > +#define _XE_GUC_ENGINE_ACTIVITY_H_
>> > > > +
>> > > > +#include <linux/types.h>
>> > > > +
>> > > > +struct xe_hw_engine;
>> > > > +struct xe_guc;
>> > > > +
>> > > > +int xe_guc_engine_activity_init(struct xe_guc *guc);
>> > > > +void xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
>> > > > +u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe);
>> > > > +u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe);
>> > > > +#endif
>> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>> > > > new file mode 100644
>> > > > index 000000000000..a2ab327d3eec
>> > > > --- /dev/null
>> > > > +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>> > > > @@ -0,0 +1,89 @@
>> > > > +/* SPDX-License-Identifier: MIT */
>> > > > +/*
>> > > > + * Copyright © 2025 Intel Corporation
>> > > > + */
>> > > > +
>> > > > +#ifndef _XE_GUC_ENGINE_ACTIVITY_TYPES_H_
>> > > > +#define _XE_GUC_ENGINE_ACTIVITY_TYPES_H_
>> > > > +
>> > > > +#include <linux/types.h>
>> > > > +
>> > > > +#include "xe_guc_fwif.h"
>> > > > +/**
>> > > > + * struct engine_activity - Engine specific activity data
>> > > > + *
>> > > > + * Contains engine specific activity data and snapshot of the
>> > > > + * structures from GuC
>> > > > + */
>> > > > +struct engine_activity {
>> > > > +	/** @active: current activity */
>> > > > +	u64 active;
>> > > > +
>> > > > +	/** @last_cpu_ts: cpu timestamp in nsec of previous sample */
>> > > > +	u64 last_cpu_ts;
>> > > > +
>> > > > +	/** @quanta: total quanta used on HW */
>> > > > +	u64 quanta;
>> > > > +
>> > > > +	/** @quanta_ns: total quanta_ns used on HW */
>> > > > +	u64 quanta_ns;
>> > > > +
>> > > > +	/**
>> > > > +	 * @quanta_remainder_ns: remainder when the CPU time is scaled as
>> > > > +	 * per the quanta_ratio. This remainder is used in subsequent
>> > > > +	 * quanta calculations.
>> > > > +	 */
>> > > > +	u64 quanta_remainder_ns;
>> > > > +
>> > > > +	/** @total: total engine activity */
>> > > > +	u64 total;
>> > > > +
>> > > > +	/** @running: true if engine is running some work */
>> > > > +	bool running;
>> > > > +
>> > > > +	/** @metadata: snapshot of engine activity metadata */
>> > > > +	struct guc_engine_activity_metadata metadata;
>> > > > +
>> > > > +	/** @activity: snapshot of engine activity counter */
>> > > > +	struct guc_engine_activity activity;
>> > > > +};
>> > > > +
>> > > > +/**
>> > > > + * struct engine_activity_group - Activity data for all engines
>> > > > + */
>> > > > +struct engine_activity_group {
>> > > > +	/** @engine: engine specific activity data */
>> > > > +	struct engine_activity engine[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>> > > > +};
>> > > > +
>> > > > +/**
>> > > > + * struct engine_activity_buffer - engine activity buffers
>> > > > + *
>> > > > + * This contains the buffers allocated for metadata and activity data
>> > > > + */
>> > > > +struct engine_activity_buffer {
>> > > > +	/** @activity_bo: object allocated to hold activity data */
>> > > > +	struct xe_bo *activity_bo;
>> > > > +
>> > > > +	/** @metadata_bo: object allocated to hold activity metadata */
>> > > > +	struct xe_bo *metadata_bo;
>> > > > +};
>> > > > +
>> > > > +/**
>> > > > + * struct xe_guc_engine_activity - Data used by engine activity implementation
>> > > > + */
>> > > > +struct xe_guc_engine_activity {
>> > > > +	/** @gpm_timestamp_shift: Right shift value for the gpm timestamp */
>> > > > +	u32 gpm_timestamp_shift;
>> > > > +
>> > > > +	/** @num_activity_group: number of activity groups */
>> > > > +	u32 num_activity_group;
>> > > > +
>> > > > +	/** @eag: holds the device level engine activity data */
>> > > > +	struct engine_activity_group *eag;
>> > > > +
>> > > > +	/** @device_buffer: buffer object for global engine activity */
>> > > > +	struct engine_activity_buffer device_buffer;
>> > > > +};
>> > > > +#endif
>> > > > +
>> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> > > > index 057153f89b30..6f57578b07cb 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>> > > > +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> > > > @@ -208,6 +208,25 @@ struct guc_engine_usage {
>> > > > 	struct guc_engine_usage_record engines[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>> > > > } __packed;
>> > > >
>> > > > +/* Engine Activity stats */
>> > > > +struct guc_engine_activity {
>> > > > +	u16 change_num;
>> > > > +	u16 quanta_ratio;
>> > > > +	u32 last_update_tick;
>> > > > +	u64 active_ticks;
>> > > > +} __packed;
>> > > > +
>> > > > +struct guc_engine_activity_data {
>> > > > +	struct guc_engine_activity engine_activity[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>> > > > +} __packed;
>> > > > +
>> > > > +struct guc_engine_activity_metadata {
>> > > > +	u32 guc_tsc_frequency_hz;
>> > > > +	u32 lag_latency_usec;
>> > > > +	u32 global_change_num;
>> > > > +	u32 reserved;
>> > > > +} __packed;
>> > > > +
>> > > > /* This action will be programmed in C1BC - SOFT_SCRATCH_15_REG */
>> > > > enum xe_guc_recv_message {
>> > > > 	XE_GUC_RECV_MSG_CRASH_DUMP_POSTED = BIT(1),
>> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
>> > > > index 573aa6308380..63bac64429a5 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_guc_types.h
>> > > > +++ b/drivers/gpu/drm/xe/xe_guc_types.h
>> > > > @@ -13,6 +13,7 @@
>> > > > #include "xe_guc_ads_types.h"
>> > > > #include "xe_guc_buf_types.h"
>> > > > #include "xe_guc_ct_types.h"
>> > > > +#include "xe_guc_engine_activity_types.h"
>> > > > #include "xe_guc_fwif.h"
>> > > > #include "xe_guc_log_types.h"
>> > > > #include "xe_guc_pc_types.h"
>> > > > @@ -103,6 +104,9 @@ struct xe_guc {
>> > > > 	/** @relay: GuC Relay Communication used in SR-IOV */
>> > > > 	struct xe_guc_relay relay;
>> > > >
>> > > > +	/** @engine_activity: Device specific engine activity */
>> > > > +	struct xe_guc_engine_activity engine_activity;
>> > > > +
>> > > > 	/**
>> > > > 	 * @notify_reg: Register which is written to notify GuC of H2G messages
>> > > > 	 */
>> > > > --
>> > > > 2.47.1
>> > > >
>>

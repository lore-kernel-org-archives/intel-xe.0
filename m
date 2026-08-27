Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB69C61DB9
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 17:38:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5285210E110;
	Thu, 27 Aug 2026 17:38:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D80WzlFI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B101510E110
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 17:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787852305; x=1819388305;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WYqPb5iVu67a7AsmaSOnBIlQeMcgq75C23agAEuXJ1o=;
 b=D80WzlFIWNpAKczL2W+bNFMKYnCoGqY7QhpcaLRL5kBNrpcarfb4C7DK
 G/KGvdCkifXDOgEtnExyM/Z9KcUPnHP3ydH7BnWTTKtaYhrqDI3uieY3d
 tw0Ubj4DbbzKPOQ9fNBV/ItwYz7st1dTLCHQBaJHKRO8U1MIEYhO/YATp
 zAunDjxWzDlolX/gyIFdUrr/+NGTANQwzWQ7ocuqemH99cc0eo/Cxxyxx
 OmQNG14Tn8N3WHHETGEICftstkEPTVLqFs0aUa0DukySwwxvnqauPEzIN
 hEi19C1d5mCwBdHyoPYYWr9T7yv8HMCpI9JIDOQxQ//Cw0u+qQd+YYWB0 w==;
X-CSE-ConnectionGUID: ESSGFekyTuWVLNR3eGA9Ig==
X-CSE-MsgGUID: +DbluDZaT224675cf6TV8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88411995"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="88411995"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 10:38:25 -0700
X-CSE-ConnectionGUID: /dnlJGSZQBG7ZG/pumRqgA==
X-CSE-MsgGUID: O2tT4FcZS8G8sYf6qh12xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="297833795"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 10:38:26 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 10:38:24 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 10:38:24 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.61) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 10:38:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FvrfaQwIZq5sFFAWv6A8dIMrL5/uYUuxAXeJ+hYGaHUqAorBn0bcIubYsznOO6NlWCuJo6msYPkzR8X6fMR9QcEk3KWUI15FMCuPo+9y8IR4Uy+tdMdmZEolsnOIzyn6o3xU9/eiRtYE6NwOnXEIpBNA8ZZ9YJStylPvtDQzjVXTV1B7aOUNLK+xhl2naxxsWlo4L7RHB/dCJ/BISi1FgLgecMfxlP0AOtq1OerQAqvVO2cv+40/o0UkTop742hfk8s/rkpj4shKTHCVBVEUd7DmsETGGtR2KDPaPsQx0h89E4smIW8L4cr9ONvS7yT1UGQTRyjrqsc+/FjHOYvytA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QG2j4bHSaC+NjuSQur+4xgaliNClqnDBS5P8kuKA1Z4=;
 b=mVuBgMfndWItB+IRREoSTY4dZjzIlKS/nUu/VZSlBHICO9FTiqgF//3f0ONg/0uzPH9XwPL5VUOEz8RZA+/1lNumRmFxcD1YAPf+RmI6nE9heEQMFak75Pzfdc8k+1ch39f8wmwZORlV+lXm7maDVU9xWXdEVwGAuHRAbymbEdmzsEE3u8JpSsCixc+RSQ7Tki8BhvNfMtuKXeuF33Vrx9hh3PkOshoOfmRBvrgg71awO7APFzGjlPOc+i15xouREctVsNv3H9xcjZo1WInbaHGrYd5sXmUiUNwQkwVj1NnNi4Rm9cqZSMpB9bPXQizYpnnyriw/7TixEsEr2rYknA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW3PR11MB4682.namprd11.prod.outlook.com (2603:10b6:303:2e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 17:38:21 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 17:38:21 +0000
Message-ID: <e7b7a00e-37b2-4be7-a275-f339c84d82ab@intel.com>
Date: Thu, 27 Aug 2026 19:38:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe: Introduce xe_wedge
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <lukasz.laguna@intel.com>,
 <matthew.d.roper@intel.com>, <matthew.brost@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20260825114450.1371821-1-raag.jadav@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260825114450.1371821-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIXP296CA0025.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:36c::15) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW3PR11MB4682:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eb7d952-4d81-46cf-c74c-08df0461fcc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|10067099003|6133799003|18002099003|22082099003|11063799006|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: 0L5J+yUxOPaSmdGG7spy+ZVRLXt5tTUW1g/sBXXI6h0DiPjnzZZUnbMw3NE8WQTXuuJ/Lse9OCDIKIQyofoQGgVnviiQb3lLEIBE5dKSZ3HFNRKgP3wOt6tN9VIPB/k4EkuLpXfn14uwjJDPq8xs19+3GuE9iBXhRsjmvQUgbK3JziKDqbtH6AYTk+tTfnHOJYNQnsk0mSHs9jRQ942Jcsd/qVx+Yo890i9feXYsoZir18L4dkAGKXdcUGsjOLdwt3JyoWlFhBqvth0Lj2e+fgfWJGGcB/SBHf1uyCruCIYwfW0mHuFYk53zJKSXc3qBqI4SLJvmMuCy8gG5mLQWRu/f31mN1cLmLVlL16308Vxw4ap2/Aj4X8GTJfCSiFSNPAZSL99NdTzLVvGtzSQbsPx8dqBdWeaTVGO1G18h1YGNVtiE0bOiw/XNb1hXsYJSqvx0pwhLF5bNP6arO8Jju96oFLVhM8Fj7+ggZT+ZCjYJBRiAaCdE12YH+r6dzfxhO2nHeJkhgdOxQ7pBwgz3PX4xz3Me+elfxFIoPJucT1PKK9JmcLYqhMEDfBnxP66CY4svGX2hSZO61X8qy9DCqQET+hnYh6q4cRHOTI2Lk+cEWnRDltmPkibSRPXpZEwj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bm5RV25ZNFZtNWQ5VDF2MWI1Wk9UUzlvQXhTcElRelI1bmYrWkk4VUk0cU5a?=
 =?utf-8?B?RGQwV0ZkNkgyZndYMWdaR0F4c2FYWVVXU3g0bk0wNk15YXByK0pKYTN6SjBk?=
 =?utf-8?B?UElFdHdSeUxPSW9qSXBBcDlqN0hQYit4U25wdGF6dDZMbXNzdmlacmlXeWRz?=
 =?utf-8?B?cDlqUnFVT0pXT2c2MFZxbWQycGlnNWtESVI5aWFkSS9JWk90N1czR1ZwSjVD?=
 =?utf-8?B?V2ZDTTRzQ3VNOTlXUTJZUTVmSUlCbjRGL2NoMGZpb043bWIxYkgxN2wrSmI3?=
 =?utf-8?B?MC9henpOZ2k2UUlJYW03bm5ORW9LWTBXN216UnUveXFnVXJmdk55QkRXcE0w?=
 =?utf-8?B?OGxpRFpkTDBKNGdnY1gvanYrRmZKVkdUaUNjUlkvVFl1T3JhVnRxM1IzUTdm?=
 =?utf-8?B?WlhIVTFZb3FSeDhqdUpDTlVWUWtlTStFZEJNN3R2YkdLc1MvUTUxdmRyUEx0?=
 =?utf-8?B?UXBYSU1FbENzNk9tUlBUVEoxckJrRzZSZXBPcmE2THhkb1pvbHhSQXd6RzJG?=
 =?utf-8?B?WmxLVXRMV1FpQ0FDY0lEckc2VUYvbHpEL0hOUml2aldLeHVUd1JuRGVBZE13?=
 =?utf-8?B?WW9RNFh0dGNzMXpHRU0zcFBoS2hFVGpMVzVFb2NRSGxpcEkzUGp5dVFZV1Ex?=
 =?utf-8?B?ZEw4bVJRejEwdWd1S3UxZEIyOG0vcE9qaktySllvd2NiOGZhS3dIQkNZVk0x?=
 =?utf-8?B?MER6OW5lay85MWh5UGhRQXNOSUpiL3hjZjRXYzFhR1ZKb3BZdGVuQ1F3Q2o5?=
 =?utf-8?B?YzBYQmNyMlJvNjZVUEk4STZodERpT3BhcEx1cXY4WFlId252UTIwTGluZkpD?=
 =?utf-8?B?WTNubTh3bERWOWdGYlpUeUlpMTl0V1IxRmd1VzV4VnRoNkNLRDc5RU9SK2dl?=
 =?utf-8?B?c2ZaTWJNUmw2aWZJRE1QYUFhbVVvMGgxUVZzYXhvaFN3RWRhYnY5ZjVEclEz?=
 =?utf-8?B?dkxkQUJ6dHVXNlB2SVlLRDVTamYra0tKRUdOZ0x1c1p0a1pCTUVqZ25vU2hD?=
 =?utf-8?B?TFNoVTRMVHFyazQrNVhubXBFN1pQdGVVY0ZXK3lNL3BBSlpGZkdzN2QvZzQ4?=
 =?utf-8?B?SG1DSFJ1SUhrbzVVLy9jU2tjV3VYMEtNeHlQNmZoamlKait6eGxaUkpBQW91?=
 =?utf-8?B?T0gySjgxQWtVclhIaDB2dTBqaXZFUWFBTkdqb2tUWmpFTTJPQ0hLWTNXMitJ?=
 =?utf-8?B?RlpMOXd4dEErZ3dqZkJ6VW1hSzQ1c0l1d3l1WEk5ZlJkeC9YTnZJU09XQ21r?=
 =?utf-8?B?eVl2N2Y0Z0Era1hqOXFPLzVhK3dHWFZkamJNUEpva3FCMU1rQzRuUkJqUWxx?=
 =?utf-8?B?c2V1eitSV1VyM0duejdPU1BleWVwRmpOcU1WSy9HcWphcEFIbU5NcHJrMWJG?=
 =?utf-8?B?YWZzQTNqcWEzNDFHUEdQSFJkRDFFcExicVcxYVYzQ3JHU2pHd1k1dTVoa0k3?=
 =?utf-8?B?S0hkMXhqa054MktndllZTVQ1c09lUStFWkFsTkkvdTRCMEdmNXV4MTlDMERi?=
 =?utf-8?B?VWIyRWxRejRIV3hycThYT3k1VTJzUlRSNUhrUkNxSW12eUNGVFozSjVLWG9P?=
 =?utf-8?B?WEcwbDAvbEFhNkF0U1RydWdvNnJWRi95UWxwVlZwVlRUdFRtS0xHd2g0UDNO?=
 =?utf-8?B?YnZsUjRwRGlmRDErOGR5R3V6cGY2cXZlclc5d2haNU9BOXRzaXYvRXlNSmxu?=
 =?utf-8?B?Y0QxYjZYZW4wS0pPMit6Z1BZK2VPcnBiTUw3RmZzNVdNSHNHaVZMYTJOeVhX?=
 =?utf-8?B?c1VMU2JFOXpWQXE4cWowUkhwK3J2OC80MmZRWFo1STNlRDRZUm9WVEdJTWhB?=
 =?utf-8?B?dFA4R21BTnBaTVVKU2Q3WnBmay9EWkRXMWJzVjR4K1MyUmhOaU9JeWVzUkUx?=
 =?utf-8?B?WGNTM2s1QXlpZDhnRVZqS0lTTG5pd3lZdGFFY1BMQTVtWjc5Q1hnMXgvMjF0?=
 =?utf-8?B?Zm8vNE1PdFVuNWVpSGpvWE9abDB0UUVEbXE4MGFFVjZxN0phbStDakVSZk5s?=
 =?utf-8?B?NUs5U3h5Um13c2JlQ1NIcWJaZ21LekpSbjBXTFFGd3VudFk0M3RqUWdicEE4?=
 =?utf-8?B?SmlHZVYwYUg4MWZQNUtyVkZJWjF0dEhLZlVqck0ralBNUGJVampBRVQ2TjVQ?=
 =?utf-8?B?aXVMZjRTNGUybTJCNXdxTSthREc0MXB6b1E3cHpxZVFmdVBoNzVuN1ZXRlFx?=
 =?utf-8?B?eEgwQU5PbTJjVEVieGVadEVHcy8xckh1aDFmZDJwUzV6ajBrZDBMWElZZ3I2?=
 =?utf-8?B?eHkrenUxSVB5c3N5MzZGTlN2UDN5OHNHZWtES1JyWDNQL1FNbCt1ejhYc2Mz?=
 =?utf-8?B?V0hQN05XOWlDVGtiOVZic1NyeEVZWWF0V3ozRnVZZnV4SHh4dzlaVFBUYXB5?=
 =?utf-8?Q?DOCaW97XokMG1aAo=3D?=
X-Exchange-RoutingPolicyChecked: LodSl0izrBDb7JFP1tt5XS9DR9wzQ1hDiZnyV7Vrub0X2VVh/mCjsviUdOsoYRFXK/hN6iutW6S6AzZeAhVLYOPujdGElasSBym4Rd6mTXX3Gi/+3aHUNLze99Y4D3TVYMZkU1fBQeF52gPZucShoy0WXZAIGAgf+VXopFQNQjE6M/2Kl4rrU9F9psI2Wpk7mhEyQCxYKjjim8yIHpjjSaCebnlqOls8FBKUj1joFIicS9HaxsxlfBTs51meD97VATdkyyzSuVc6JW2/k1WkJtlLE2Y7OTlFCKntBW+5FrGZrNjUOYevoVWm8cXR9cC/eqUo4wiWipMgVVCAnYczMA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eb7d952-4d81-46cf-c74c-08df0461fcc1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 17:38:21.1037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zTanWMtDdts+suJqtzaA7THo5Hn3umiNP7w85NE4F8mFeyXyk5RwxPPksy3ukOTe5G7akt3yYvKcKVicu/0CcKoBQSQaLfVZrV67w5Kzb0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4682
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



On 8/25/2026 1:42 PM, Raag Jadav wrote:
> Consolidates all wedging implementation into a dedicated xe_wedge
> component. While at it, add a worker to schedule the wedge handling to

as Rodrigo said, split into at least two patches

more comments below

> be done async making xe_device_declare_wedged() safe for atomic callers.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
> PS: The original intent was a bug fix, but that's just a matter of opinion.
> 
>  Documentation/gpu/xe/xe_device.rst   |   2 +-
>  drivers/gpu/drm/xe/Makefile          |   1 +
>  drivers/gpu/drm/xe/xe_device.c       | 172 +--------------------
>  drivers/gpu/drm/xe/xe_device.h       |  11 +-
>  drivers/gpu/drm/xe/xe_device_types.h |  19 +--
>  drivers/gpu/drm/xe/xe_wedge.c        | 214 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_wedge.h        |  24 +++
>  drivers/gpu/drm/xe/xe_wedge_types.h  |  25 ++++
>  8 files changed, 271 insertions(+), 197 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_wedge.c
>  create mode 100644 drivers/gpu/drm/xe/xe_wedge.h
>  create mode 100644 drivers/gpu/drm/xe/xe_wedge_types.h
> 
> diff --git a/Documentation/gpu/xe/xe_device.rst b/Documentation/gpu/xe/xe_device.rst
> index d3a022362ade..8baed81580c9 100644
> --- a/Documentation/gpu/xe/xe_device.rst
> +++ b/Documentation/gpu/xe/xe_device.rst
> @@ -6,7 +6,7 @@
>  Xe Device Wedging
>  ==================
>  
> -.. kernel-doc:: drivers/gpu/drm/xe/xe_device.c
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_wedge.c
>     :doc: Xe Device Wedging
>  
>  ====================
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index adc2de37e768..c739a50b6896 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -152,6 +152,7 @@ xe-y += xe_bb.o \
>  	xe_vsec.o \
>  	xe_wa.o \
>  	xe_wait_user_fence.o \
> +	xe_wedge.o \
>  	xe_wopcm.o
>  
>  xe-$(CONFIG_I2C)	+= xe_i2c.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 74d566693dfd..d3a7034fac01 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -829,10 +829,7 @@ int xe_device_probe_early(struct xe_device *xe)
>  	 */
>  	assert_lmem_ready(xe);
>  
> -	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
> -			  XE_DEFAULT_WEDGED_MODE : xe_modparam.wedged_mode;
> -	drm_dbg(&xe->drm, "wedged_mode: setting mode (%u) %s\n",
> -		xe->wedged.mode, xe_wedged_mode_to_string(xe->wedged.mode));
> +	xe_device_wedged_init_early(xe);
>  
>  	err = xe_device_vram_alloc(xe);
>  	if (err)
> @@ -924,14 +921,6 @@ static void detect_preproduction_hw(struct xe_device *xe)
>  	}
>  }
>  
> -static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
> -{
> -	struct xe_device *xe = arg;
> -
> -	if (atomic_read(&xe->wedged.flag))
> -		xe_pm_runtime_put(xe);
> -}
> -
>  #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
>  static int xe_debug_page_size_alloc_ctrl_init(struct xe_device *xe)
>  {
> @@ -1148,7 +1137,7 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	detect_preproduction_hw(xe);
>  
> -	err = drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
> +	err = xe_device_wedged_init(xe);
>  	if (err)
>  		goto err_unregister_display;
>  
> @@ -1394,163 +1383,6 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
>  	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
>  }
>  
> -/**
> - * DOC: Xe Device Wedging
> - *
> - * Xe driver uses drm device wedged uevent as documented in Documentation/gpu/drm-uapi.rst.
> - * When device is in wedged state, every IOCTL will be blocked and GT cannot
> - * be used. The conditions under which the driver declares the device wedged
> - * depend on the wedged mode configuration (see &enum xe_wedged_mode). The
> - * default recovery method for a wedged state is rebind/bus-reset.
> - *
> - * Another recovery method is vendor-specific. Below are the cases that send
> - * ``WEDGED=vendor-specific`` recovery method in drm device wedged uevent.
> - *
> - * Case: Firmware Flash
> - * --------------------
> - *
> - * Identification Hint
> - * +++++++++++++++++++
> - *
> - * ``WEDGED=vendor-specific`` drm device wedged uevent with
> - * :ref:`Runtime Survivability mode <xe-survivability-mode>` is used to notify
> - * admin/userspace consumer about the need for a firmware flash.
> - *
> - * Recovery Procedure
> - * ++++++++++++++++++
> - *
> - * Once ``WEDGED=vendor-specific`` drm device wedged uevent is received, follow
> - * the below steps
> - *
> - * - Check Runtime Survivability mode sysfs.
> - *   If enabled, firmware flash is required to recover the device.
> - *
> - *   /sys/bus/pci/devices/<device>/survivability_mode
> - *
> - * - Admin/userspace consumer can use firmware flashing tools like fwupd to flash
> - *   firmware and restore device to normal operation.
> - */
> -
> -/**
> - * xe_device_set_wedged_method - Set wedged recovery method
> - * @xe: xe device instance
> - * @method: recovery method to set
> - *
> - * Set wedged recovery method to be sent in drm wedged uevent.
> - */
> -void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
> -{
> -	xe->wedged.method = method;
> -}
> -
> -#define WEDGED_URL	"https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
> -#define XE_BUG_URL	"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"
> -
> -/**
> - * xe_device_declare_wedged - Declare device wedged
> - * @xe: xe device instance
> - *
> - * This is a final state that can only be cleared with the recovery method
> - * specified in the drm wedged uevent. The method can be set using
> - * xe_device_set_wedged_method before declaring the device as wedged. If no method
> - * is set, reprobe (unbind/re-bind) will be sent by default.
> - *
> - * In this state every IOCTL will be blocked so the GT cannot be used.
> - * In general it will be called upon any critical error such as gt reset
> - * failure or guc loading failure. Userspace will be notified of this state
> - * through device wedged uevent.
> - * If xe.wedged module parameter is set to 2, this function will be called
> - * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
> - * snapshot capture. In this mode, GT reset won't be attempted so the state of
> - * the issue is preserved for further debugging.
> - */
> -void xe_device_declare_wedged(struct xe_device *xe)
> -{
> -	struct xe_gt *gt;
> -	u8 id;
> -
> -	if (xe->wedged.mode == XE_WEDGED_MODE_NEVER) {
> -		drm_dbg(&xe->drm, "Wedged mode is forcibly disabled\n");
> -		return;
> -	}
> -
> -	if (!atomic_xchg(&xe->wedged.flag, 1)) {
> -		xe->needs_flr_on_fini = true;
> -		xe_pm_runtime_get_noresume(xe);
> -
> -		xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
> -		xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
> -			    "For recovery procedure, refer to %s\n"
> -			    "Please file a _new_ bug report at %s\n",
> -			    WEDGED_URL, XE_BUG_URL);
> -	}
> -
> -	for_each_gt(gt, xe, id)
> -		xe_gt_declare_wedged(gt);
> -
> -	if (xe_device_wedged(xe)) {
> -		/*
> -		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
> -		 * hangs, so wedge the device with 'none' recovery method and have
> -		 * it available to the user for debugging.
> -		 */
> -		if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> -			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
> -		/* If no wedge recovery method is set, use default */
> -		else if (!xe->wedged.method)
> -			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
> -						    DRM_WEDGE_RECOVERY_BUS_RESET);
> -
> -		/* Notify userspace of wedged device */
> -		drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
> -	}
> -}
> -
> -/**
> - * xe_device_validate_wedged_mode - Check if given mode is supported
> - * @xe: the &xe_device
> - * @mode: requested mode to validate
> - *
> - * Check whether the provided wedged mode is supported.
> - *
> - * Return: 0 if mode is supported, error code otherwise.
> - */
> -int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
> -{
> -	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
> -		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
> -		return -EINVAL;
> -	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET && (IS_SRIOV_VF(xe) ||
> -		   (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG)))) {
> -		drm_dbg(&xe->drm, "wedged_mode: (%u) %s mode is not supported for %s\n",
> -			mode, xe_wedged_mode_to_string(mode),
> -			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
> -		return -EPERM;
> -	}
> -
> -	return 0;
> -}
> -
> -/**
> - * xe_wedged_mode_to_string - Convert enum value to string.
> - * @mode: the &xe_wedged_mode to convert
> - *
> - * Returns: wedged mode as a user friendly string.
> - */
> -const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode)
> -{
> -	switch (mode) {
> -	case XE_WEDGED_MODE_NEVER:
> -		return "never";
> -	case XE_WEDGED_MODE_UPON_CRITICAL_ERROR:
> -		return "upon-critical-error";
> -	case XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET:
> -		return "upon-any-hang-no-reset";
> -	default:
> -		return "<invalid>";
> -	}
> -}
> -
>  /**
>   * xe_device_asid_to_vm() - Find VM from ASID
>   * @xe: the &xe_device
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 6c4cfaebc44a..c984972bd0f8 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -11,6 +11,7 @@
>  #include "xe_device_types.h"
>  #include "xe_gt_types.h"
>  #include "xe_sriov.h"
> +#include "xe_wedge.h"

why? just add that include in any .c that needs this

>  
>  struct xe_vm;
>  
> @@ -207,11 +208,6 @@ bool xe_device_is_l2_flush_optimized(struct xe_device *xe);
>  void xe_device_td_flush(struct xe_device *xe);
>  void xe_device_l2_flush(struct xe_device *xe);
>  
> -static inline bool xe_device_wedged(struct xe_device *xe)
> -{
> -	return atomic_read(&xe->wedged.flag);
> -}
> -
>  #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
>  static inline bool xe_debug_page_size_supported(struct xe_device *xe)
>  {
> @@ -260,11 +256,6 @@ static inline bool xe_debug_page_size_mode_is_mixed(struct xe_device *xe)
>  }
>  #endif
>  
> -void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
> -void xe_device_declare_wedged(struct xe_device *xe);
> -int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
> -const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode);
> -
>  struct xe_file *xe_file_get(struct xe_file *xef);
>  void xe_file_put(struct xe_file *xef);
>  
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 180d450a6deb..f307d7e5e6b6 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -30,6 +30,7 @@
>  #include "xe_sysctrl_types.h"
>  #include "xe_tile_types.h"
>  #include "xe_validation.h"
> +#include "xe_wedge_types.h"
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>  #define TEST_VM_OPS_ERROR
> @@ -45,22 +46,6 @@ struct xe_pxp;
>  struct xe_ttm_stolen_mgr;
>  struct xe_vram_region;
>  
> -/**
> - * enum xe_wedged_mode - possible wedged modes
> - * @XE_WEDGED_MODE_NEVER: Device will never be declared wedged.
> - * @XE_WEDGED_MODE_UPON_CRITICAL_ERROR: Device will be declared wedged only
> - *	when critical error occurs like GT reset failure or firmware failure.
> - *	This is the default mode.
> - * @XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET: Device will be declared wedged on
> - *	any hang. In this mode, engine resets are disabled to avoid automatic
> - *	recovery attempts. This mode is primarily intended for debugging hangs.
> - */
> -enum xe_wedged_mode {
> -	XE_WEDGED_MODE_NEVER = 0,
> -	XE_WEDGED_MODE_UPON_CRITICAL_ERROR = 1,
> -	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET = 2,
> -};
> -
>  #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
>  /**
>   * enum xe_page_size_alloc_ctrl_mode - User BO page-size allocation control modes
> @@ -534,6 +519,8 @@ struct xe_device {
>  		unsigned long method;
>  		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
>  		bool inconsistent_reset;
> +		/** @wedged.work: Worker for wedge handling to be done async */
> +		struct work_struct work;
>  	} wedged;

shouldn't this struct be defined in xe_wedge_types.h ?

>  
>  	/** @devres_group: devres group */
> diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
> new file mode 100644
> index 000000000000..52d4661a2dee
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_wedge.c
> @@ -0,0 +1,214 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_managed.h>
> +
> +#include "xe_defaults.h"
> +#include "xe_device_types.h"
> +#include "xe_gt.h"
> +#include "xe_log.h"
> +#include "xe_module.h"
> +#include "xe_pm.h"
> +#include "xe_printk.h"
> +#include "xe_wedge.h"
> +
> +/**
> + * DOC: Xe Device Wedging
> + *
> + * Xe driver uses drm device wedged uevent as documented in Documentation/gpu/drm-uapi.rst.
> + * When device is in wedged state, every IOCTL will be blocked and GT cannot
> + * be used. The conditions under which the driver declares the device wedged
> + * depend on the wedged mode configuration (see &enum xe_wedged_mode). The
> + * default recovery method for a wedged state is rebind/bus-reset.
> + *
> + * Another recovery method is vendor-specific. Below are the cases that send
> + * ``WEDGED=vendor-specific`` recovery method in drm device wedged uevent.
> + *
> + * Case: Firmware Flash
> + * --------------------
> + *
> + * Identification Hint
> + * +++++++++++++++++++
> + *
> + * ``WEDGED=vendor-specific`` drm device wedged uevent with
> + * :ref:`Runtime Survivability mode <xe-survivability-mode>` is used to notify
> + * admin/userspace consumer about the need for a firmware flash.
> + *
> + * Recovery Procedure
> + * ++++++++++++++++++
> + *
> + * Once ``WEDGED=vendor-specific`` drm device wedged uevent is received, follow
> + * the below steps
> + *
> + * - Check Runtime Survivability mode sysfs.
> + *   If enabled, firmware flash is required to recover the device.
> + *
> + *   /sys/bus/pci/devices/<device>/survivability_mode
> + *
> + * - Admin/userspace consumer can use firmware flashing tools like fwupd to flash
> + *   firmware and restore device to normal operation.
> + */
> +
> +/**
> + * xe_device_set_wedged_method() - Set wedged recovery method
> + * @xe: xe device instance
> + * @method: recovery method to set
> + *
> + * Set wedged recovery method to be sent in drm wedged uevent.
> + */
> +void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)

as we are adding/renaming functions, should we combine two old:

	xe_device_declare_wedged(xe)
and	xe_device_set_wedged_method(xe, method)

functions into single new:

	xe_wedge_declare(xe, method)

as we either already know the recovery method or can use
default one

> +{
> +	xe->wedged.method = method;
> +}
> +
> +/**
> + * xe_device_wedged() - Check for wedged device
> + * @xe: xe device instance
> + *
> + * Returns: %true if device is wedged, %false otherwise.
> + */
> +bool xe_device_wedged(struct xe_device *xe)
> +{
> +	return atomic_read(&xe->wedged.flag);
> +}
> +
> +#define WEDGED_URL	"https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
> +#define XE_BUG_URL	"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"
> +
> +static void wedged_work(struct work_struct *work)
> +{
> +	struct xe_device *xe = container_of(work, struct xe_device, wedged.work);
> +	struct xe_gt *gt;
> +	u8 id;
> +
> +	for_each_gt(gt, xe, id)
> +		xe_gt_declare_wedged(gt);

is it ok to do that in the async worker?

the idea was to move uvent notification to the worker

> +
> +	/*
> +	 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
> +	 * hangs, so wedge the device with 'none' recovery method and have
> +	 * it available to the user for debugging.
> +	 */
> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
> +	/* If no wedge recovery method is set, use default */
> +	else if (!xe->wedged.method)
> +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
> +					    DRM_WEDGE_RECOVERY_BUS_RESET);
> +
> +	/* Notify userspace of wedged device */
> +	drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
> +}
> +
> +/**
> + * xe_device_declare_wedged - Declare device wedged

nit: there should be () after function name

> + * @xe: xe device instance
> + *
> + * This is a final state that can only be cleared with the recovery method
> + * specified in the drm wedged uevent. The method can be set using
> + * xe_device_set_wedged_method before declaring the device as wedged. If no method
> + * is set, reprobe (unbind/re-bind) will be sent by default.
> + *
> + * In this state every IOCTL will be blocked so the GT cannot be used.
> + * In general it will be called upon any critical error such as gt reset
> + * failure or guc loading failure. Userspace will be notified of this state
> + * through device wedged uevent.
> + * If xe.wedged module parameter is set to 2, this function will be called
> + * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
> + * snapshot capture. In this mode, GT reset won't be attempted so the state of
> + * the issue is preserved for further debugging.
> + */
> +void xe_device_declare_wedged(struct xe_device *xe)
> +{
> +	if (xe->wedged.mode == XE_WEDGED_MODE_NEVER) {
> +		drm_dbg(&xe->drm, "Wedged mode is forcibly disabled\n");

you can use:

	xe_dbg(xe, ...)
> +		return;
> +	}
> +
> +	if (!atomic_xchg(&xe->wedged.flag, 1)) {
> +		xe->needs_flr_on_fini = true;
> +		xe_pm_runtime_get_noresume(xe);
> +
> +		xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");

recently there was a discussion about the error code to be used
here, and one suggestion was to allow caller to pass the err parameter

as we are renaming functions, maybe we can add err param?

> +		xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
> +			    "For recovery procedure, refer to %s\n"
> +			    "Please file a _new_ bug report at %s\n",
> +			    WEDGED_URL, XE_BUG_URL);
> +
> +		schedule_work(&xe->wedged.work);
> +	}
> +}
> +
> +/**
> + * xe_device_validate_wedged_mode - Check if given mode is supported
> + * @xe: the &xe_device
> + * @mode: requested mode to validate
> + *
> + * Check whether the provided wedged mode is supported.
> + *
> + * Return: 0 if mode is supported, error code otherwise.
> + */
> +int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)

maybe this can be static - all we need is to move here also
debugfs stuff that adds "wedged_mode" attribute

> +{
> +	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
> +		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
> +		return -EINVAL;
> +	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET && (IS_SRIOV_VF(xe) ||
> +		   (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG)))) {
> +		drm_dbg(&xe->drm, "wedged_mode: (%u) %s mode is not supported for %s\n",
> +			mode, xe_wedged_mode_to_string(mode),
> +			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));

xe_dbg() ?

> +		return -EPERM;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_wedged_mode_to_string - Convert enum value to string.
> + * @mode: the &xe_wedged_mode to convert
> + *
> + * Returns: wedged mode as a user friendly string.
> + */
> +const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode)
> +{
> +	switch (mode) {
> +	case XE_WEDGED_MODE_NEVER:
> +		return "never";
> +	case XE_WEDGED_MODE_UPON_CRITICAL_ERROR:
> +		return "upon-critical-error";
> +	case XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET:
> +		return "upon-any-hang-no-reset";
> +	default:
> +		return "<invalid>";
> +	}
> +}
> +

missing kernel doc

> +void xe_device_wedged_init_early(struct xe_device *xe)
> +{
> +	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
> +			  XE_DEFAULT_WEDGED_MODE : xe_modparam.wedged_mode;
> +	drm_dbg(&xe->drm, "wedged_mode: setting mode (%u) %s\n",
> +		xe->wedged.mode, xe_wedged_mode_to_string(xe->wedged.mode));
> +}
> +
> +static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
> +	disable_work_sync(&xe->wedged.work);
> +
> +	if (atomic_read(&xe->wedged.flag))
> +		xe_pm_runtime_put(xe);
> +}
> +

missing kernel-doc

> +int xe_device_wedged_init(struct xe_device *xe)
> +{
> +	INIT_WORK(&xe->wedged.work, wedged_work);

this could be don in _early()

> +
> +	return drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
> +}
> +
> diff --git a/drivers/gpu/drm/xe/xe_wedge.h b/drivers/gpu/drm/xe/xe_wedge.h
> new file mode 100644
> index 000000000000..fedb30c99398
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_wedge.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_WEDGE_H_
> +#define _XE_WEDGE_H_
> +
> +#include <linux/atomic.h>
> +#include <linux/types.h>

not needed?

> +
> +#include "xe_wedge_types.h"

simple forward decl also works:

enum xe_wedged_mode mode;

> +
> +struct xe_device;
> +
> +void xe_device_wedged_init_early(struct xe_device *xe);
> +int xe_device_wedged_init(struct xe_device *xe);
> +void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
> +void xe_device_declare_wedged(struct xe_device *xe);
> +bool xe_device_wedged(struct xe_device *xe);
> +int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
> +const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_wedge_types.h b/drivers/gpu/drm/xe/xe_wedge_types.h
> new file mode 100644
> index 000000000000..ffe7f9c64166
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_wedge_types.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_WEDGE_TYPES_H_
> +#define _XE_WEDGE_TYPES_H_
> +
> +/**
> + * enum xe_wedged_mode - possible wedged modes
> + * @XE_WEDGED_MODE_NEVER: Device will never be declared wedged.
> + * @XE_WEDGED_MODE_UPON_CRITICAL_ERROR: Device will be declared wedged only
> + *	when critical error occurs like GT reset failure or firmware failure.
> + *	This is the default mode.
> + * @XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET: Device will be declared wedged on
> + *	any hang. In this mode, engine resets are disabled to avoid automatic
> + *	recovery attempts. This mode is primarily intended for debugging hangs.
> + */
> +enum xe_wedged_mode {
> +	XE_WEDGED_MODE_NEVER = 0,
> +	XE_WEDGED_MODE_UPON_CRITICAL_ERROR = 1,
> +	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET = 2,
> +};
> +
> +#endif


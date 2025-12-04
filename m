Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA76AD2A551
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 22:06:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C57E10E21C;
	Thu,  4 Dec 2025 22:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N3Pfseg1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE44310E0ED
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Dec 2025 22:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764886018; x=1796422018;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6xzO3pTCDZR2u5+x2Mzx1hR8hfoBXewbqUZl115nMxE=;
 b=N3Pfseg1rEyNWQtAS7/GUodD310G+Yff9764tFEMhwolqGnWwSKPf9SY
 OS3HsgJlcCF68T3F3RH7phlXxw2N5Ec5otPers9zHNhDP/VYjfx2mGSVC
 jsWf6nGhFsqCAGCyc/lbOFFrUFpLFdgIXUl/Z8jtgpDjBvKHoJ1Os/P2X
 F6WEQcO8rX0UlOGQnVtK/u71EuYsAuoFCzd6ItWbYqK93DIjvHrhVsxbA
 XkuI/xpfNf/XT+3sEFKzwir3bTsR8LIpT5DgdMFBrqiqEuT7CfuUXhYDO
 x3Oc3UtT2gem6vxWkfRnT5wthCJxGHhj0k5cEJuasyzvV+q166hZY9Hfw g==;
X-CSE-ConnectionGUID: YIpIEe8VQ+en1N3FlrnDkA==
X-CSE-MsgGUID: wnzLhmckTC2yRPuQCwzXsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="65918368"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="65918368"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 14:06:58 -0800
X-CSE-ConnectionGUID: b43Jmp9uQ4yGziUabTX9wQ==
X-CSE-MsgGUID: 75auLKQNSc+Ef0q0SbIZJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="194175321"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 14:06:57 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 14:06:56 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 14:06:56 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 14:06:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vhEwSMyYnfIN/u1bkn3ekxbZaBmJ0ujp74Ptvp+aBfcPcQnEwQ76JKM2w4dXSUhvoq4b48jGL4uLv3xHYwCL8cLLO598f2xnBw2s/L297cbJUDugC6FaFKR2Ino1RbXRapKP5cwgpEACmthtcQcMTLcHywQ7er36Q7jXPsJWS1aCyuiOBXaYtXyUXo+eEJX6P9E8kDOpS3PmdfdsGWNCkp9bK/nxyptbadjYrtDAX5EZnRRRxV0d12JjNXQTimSpubLhr+ERn82UDGXk4iqNRbOPdIdth8Vw4eTPUn+OHkim8lIGKaBiTJBGgn/xZM8v6iTYq3EuhaOfYzL9TBEksA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEk3fBr0lnMyQWcKjb1Ng8befEPsmbZ6F/KNwujVquA=;
 b=iczxOEJPLBUKVVkcMjgYwsSfPGb1h573jlhTc4ykOt0HiURTlnjlvpvFMwFuGYfGEav1aKu/LZ/Tr1ee1F7ik+ro2nSbwv3W29O+M8W2FhO9bys3EJQuHbUPChANDHUFG6FHD3gC3neP5Ox1z+dxnt9WHprkehJNz+plOchfeUr7gaoJymy6assX7dyMV7kVvsLvCXxjlGkKhQd/8CfEbxOcq6y3ijeEKBJmcHJAGeddvw2KTCYybWhfZHi8kWgNoFtZ9s0wpLWr9XhXMl4fe2hShhQr+yFVljeHMdyV/IqbyTN52MtkUI4N5mPptA3kZYgikAM7CVszaNF/WQRglg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SN7PR11MB6727.namprd11.prod.outlook.com (2603:10b6:806:265::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 22:06:52 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 22:06:52 +0000
Message-ID: <d28271d1-352f-4616-b5bd-6d041ba2536d@intel.com>
Date: Thu, 4 Dec 2025 14:06:50 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] drm/xe/sriov: Add support for enabling scheduler
 groups
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
 <20251127014507.2323746-15-daniele.ceraolospurio@intel.com>
 <cb4816e4-f0c9-4f1d-8628-ff8d3eeedb9b@intel.com>
 <b4bcf5fb-2743-4155-9bc0-df42ba36b134@intel.com>
Content-Language: en-US
In-Reply-To: <b4bcf5fb-2743-4155-9bc0-df42ba36b134@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0132.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::17) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SN7PR11MB6727:EE_
X-MS-Office365-Filtering-Correlation-Id: ba3a1b3a-2546-4117-d440-08de33816db7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzJ5N0tnemxSdkdmNjZwaCtLTFV0TUtYQ3ZFTnFJaVRlTHZnaC95SlJMeFl5?=
 =?utf-8?B?NURPU29VRDVqSWxVajFsOHN2cVRrT0FrVkhibE42dWtQRlNvaFg3ZTVUTHFB?=
 =?utf-8?B?aUtmRENTRTQxbnFYYkV1bGowUEdzUE9ZN0czWng3cEk3VC9pUC9LYnBXQW1E?=
 =?utf-8?B?OFFERUxOOXBBQ3k1QkNDa2gvbVhMbTVKaDVYWlpkWkY3ZHRoTGdaaUp5OTRt?=
 =?utf-8?B?aG9DbGdySUFHMjZsVGVCcCs5TUh5ekFDOUpOTE9wbU1OT002ZnhSb1paVmQ1?=
 =?utf-8?B?ZE5qbHBnRWpnSWo2RmtPUkZES0VnQmtmYkNOM3FLeTRuZnRxVkJWT2NCRUF0?=
 =?utf-8?B?OWZ2Z3ZNYlYvSGQ3QnFzZFFRU2kwdEJ1Y1MveGxlbSs0UmZJVU5GSSthZUFh?=
 =?utf-8?B?b21telBGMnlNcEZJbGVCNlZIV2NML2hVNWN2Uk1jbGY1QWNGTmJIdURZcXBi?=
 =?utf-8?B?aWFmUFJWaWZaamV3MStlL3VVRnR0L0lRTERmQms3djBkSHlKalhvVklnSWlm?=
 =?utf-8?B?THYvMTB5dWg3TVdyR1c0S1dWRHZVVnZPV25TRVk5UXFXaXpNdzdqSGhKa0N6?=
 =?utf-8?B?NG9iK0Jqb3R6ZmhranVsUXFvbUpHUzJRWGVlbmFtazA5L1pER0lKSVJQWUE5?=
 =?utf-8?B?RUd3VHlYNjJCeTE3ZkpFdFpudHN5OGlldjN0QXI2NlBIQzh3ZmtrUTNwTFQy?=
 =?utf-8?B?R3JiM1lPVXpvZm8vTmxjQmhKbmI2Q1ViQWJiSDZXWWlJbVZ2bHB5elY0WktZ?=
 =?utf-8?B?SEpUdmtGUnN2Y2Y2SjVHdDFXY05MS2ZMMjR2Z0xaR29rWkt6VG9XNTN6UzJ4?=
 =?utf-8?B?Y3hpRkZueXlpdXdXdXd5SDNXQ28weElTY3VQbEVjNjVUUS83d3VtOE96ek5N?=
 =?utf-8?B?UDFxbFVzd3VTcEh0cVIycEkyUEIyakhsbTR5ZkdlRCs1YTZzRC9uM3gyckg1?=
 =?utf-8?B?SEI3bDZDSmtIa0FacjZuYkhlRGJBQ3NXUTZDeEl1bStZdTZYZThqYnZLeW9a?=
 =?utf-8?B?MWZENkRMMi8zZ0hHdUs0d0ROTnB5bWk1djIzQnNGL2g2QXc2MWY3THVUMHBy?=
 =?utf-8?B?OFl5b0NlNnFWVEw4bzlUWlQrOXFyeWc2eWI3MHIzWjUyelZRR0ZhbVpVeWJP?=
 =?utf-8?B?MmVyaVkvMlNEdE1HZ205VXgzQXVlbGdsZzM2NXA0d1JTcFJ6TGNrZW1uVWdX?=
 =?utf-8?B?a0ExK2UybFVIV2FOdHlDMXFoS1dDTEdkWVhEQURSUlpOZUdPak1FVk5WNnNm?=
 =?utf-8?B?WUZYcjduYWNPYW1ZUFBrRzJQM25nSHB2R2JWU3NCNzZpbmtHNHBQZVRMRlRB?=
 =?utf-8?B?Q3ZwR2JuOE1pc0lKcUZGRFoxZEROSnMra2xIYVd2SG1EM3M0ZlI0SHBNeDdM?=
 =?utf-8?B?akw4aXJEamgrdkI3c0g0QzZaTUNSUTQ0d1orMVJaS2o3ZVJlV2laQUJWdkU2?=
 =?utf-8?B?cmJPS21LVkhoNkc3YnRia1lFTzI2bFFXUm42NVRpOVM5ZG5HYklxTEk3Wlk2?=
 =?utf-8?B?eEE0TWhObktCa1JSMWFPTDNLdGZ5dGIxQUI2V0prTWQrWU5TOWNpdHJFZnZ6?=
 =?utf-8?B?dFBvc1ZRVENuTm9TNmRQMkNVTmNTT1oxZjd5eWNzbjhmWm4vdHBmRVhPa28z?=
 =?utf-8?B?R1h6cWFYTW41bElHL2RYMDhxb0txOU5iYVdqMllvdEtNVFVpbWZVY2QvMlYx?=
 =?utf-8?B?Uk9NRmo5cGFYZGdpdHNvVWtGMEgrV3k1SVY2RHBzZlNDZFM1ajRLS2ZNOTNR?=
 =?utf-8?B?d2hOdTdkOUFsZGk5L0docEVRVUpidHBFM05Bd3RIT00rWkxRZWV3NkxuaXdV?=
 =?utf-8?B?TGk4eFFWTDBkWktTREUvSmVGU3Q4ZXdrYjQrVGhCc3YxbjJ2RWUvM1J6R3hQ?=
 =?utf-8?B?RVBObktnVE1xbHdnRmpQdGZGRCtINWI0Y0JqcWpYeGhNbXJ1aW4yQTNOTTlH?=
 =?utf-8?Q?vUtMCUIG8AY0sFu3B8xXPPv0MKzp+HWm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0YzbFRFV2NwUGNCNkhNZ1lpeVJWVDJhVmVlWkxjbnB4cFNrcUcrelgwdzQ4?=
 =?utf-8?B?UW9XN0tPdUgxU1d2UlZGYWwxNkFwZG9obzhSbTFrUE9ncmVwNFhDNUJFVXJl?=
 =?utf-8?B?WHZXL2RuYndWYUI3YmNBL05IMkt0RHJQMW50L2NiYWVOOTQrVzhSRjNJTGJT?=
 =?utf-8?B?VjZKVHI2OGN5VFA1bmlacHAyVmRaVFBKMlJmclRNekJkVVZYbllIVmQyY25L?=
 =?utf-8?B?bkx2L0hMRmVaOFViT0NtUlYvMTdwdHM1V2w3bnNlR0hqV0VSQ3ZqMFN5aGhX?=
 =?utf-8?B?ZW1JVXk0ZThpQW9JcTIxMWl5YWJUZFJ5ejliSFQ3anpaWVZPSnZZR0lLRFJ2?=
 =?utf-8?B?bjcrS1dKR28wTzNOM3ZML29pbno2VllQZnY5K3VwZDd4V0FyMEN2WFVBdDRa?=
 =?utf-8?B?ZmgyVnJkZE9tRURLQ3gwaTBwRzQvZjZmWVZnTzVTTXVITkdTbTVDY21KWDdX?=
 =?utf-8?B?TlFvYTYvT1lTYi9sMFhBRWZxanlIeWk4Sis5cGNRZ1V1MTVtMU4yQklMaWNI?=
 =?utf-8?B?R0RQRXN6VkdyU1VMWmlHTXVQdzBUNm9sYkQrV0FxYlBCakZxZDhrU2Fjb05K?=
 =?utf-8?B?eVBnY3pJMGdrZ1BYdkpEbGh0YUNPTEsxditaTUlvenVJYWFmUGdtQ2FFVk5a?=
 =?utf-8?B?anlXbFZGbG9tQXYrdlBZc08zd3hYaWE0UGJQcWFsOVJUVm1jN00yT0NoVjdN?=
 =?utf-8?B?WnBQQkVvMEk3THNQQm9DMDhaZkhvMU5CUHpUNjlRaUpsaGFuNUFuTCtoc3B2?=
 =?utf-8?B?cWVzQkdWUXUxUWJxdFZheVlVN01TK2NsWE41T1N2Rkc0MW43OHR0MHJHbHlr?=
 =?utf-8?B?UWxTNnAvdlFtY2VpdFMxREZPUS9oVTFZZ1RKamhoNGQzUWRKWUJEY0Vjbkk5?=
 =?utf-8?B?S3FwNnpxTDlza0twVzh3RGE3UUN5Qk53aXowOG5oNHYwazZzMEdZaC9zNzlr?=
 =?utf-8?B?eXJwY3ZQbVdSZE83d3ozckorVUpySVo2VmxyQWg5UjdET2MzUXc1eWp5d0pR?=
 =?utf-8?B?YXhxY3V1dCtQZFFGT3kwS3NzRHFKYnFNUGZSOUQxaFZBSzFhNVZwelRyWUtt?=
 =?utf-8?B?ZFdVRFYxT1h5UnEzZDk0aVA3RXRCL3hydEY5amE5UVVnWEV3VHNYTVVLWFBp?=
 =?utf-8?B?MmJvYi8yUG5BU1ZRbWpaaGd5NmF4RzMxOHVOeno1QVFKNnJDdFBDeC9JbTZx?=
 =?utf-8?B?aGUrQy9CaXEwK2ZmTzYwV2gwcUxlRU5Fbk02ZnVodlhzNDFiL1dlK0VLRnRL?=
 =?utf-8?B?dytqZ2V3UjNWcjlMd0xDbStaN3hvbjZmcW9YZUpBVVZielZ2ZkUrR2FHMSto?=
 =?utf-8?B?K3JDaWNYbmE0b3pZVmVHMm1iR25FNStrVGF6WXNNdVNXOUFJRmpXTmI0aW1w?=
 =?utf-8?B?SW01a282K2pTWWxCd0R2c0RLZVAwMUpQOG1JTk1rMnltTDNscHgyQzBwYnhD?=
 =?utf-8?B?ajV5cnMrMlNEQlZkQjBxeTZENEozNVk2dlEwREFiZEI1RTQrMUZjK1JJNHhj?=
 =?utf-8?B?cWVHZ3JnbUxwNnUrQzJRVGhHRUVmampSOTE1WkN3WlFmbDNwZWVUR2R4anlW?=
 =?utf-8?B?c3dxT2lxQXpNbU9WeTIxc3pua1ZFQzl4dzdhakxJenB4d1RrRG4rbDdCODAy?=
 =?utf-8?B?S3QxZHVhbWJzQTZGaG0rODdoanJRWnBiMS8raWhkSDJhcjIwd2hPc3JvVndJ?=
 =?utf-8?B?c0E1SGxMc0dneUZjTGY5dkM3YTh1MmMvUExWMjhPV29UUlFMeXdWem5wRWJT?=
 =?utf-8?B?cFpPamJsaXdWdnV0RXlycW0vYWJaNE16VXEyYWlKSVVtd1dZek5LRHdjT1Yx?=
 =?utf-8?B?elhjRU9XWmFkdXo2N3hmSUxNTzNGaVNYckxyMnhSRmhJdFlxTHd3bDNXL1JY?=
 =?utf-8?B?disxNVZlTWdNb2dPd1ppQ2ZzYjJxbW9MVG1JODdSaFVDenNSQUY4UnoyQlho?=
 =?utf-8?B?K1lURnFHWU90bHJueHJVcFZzYmlUQkJ2MCthWjNnemE2NXdmSi96YllRU0VN?=
 =?utf-8?B?bVZ2MXp4Rnc5Q2xrSnAwbGNlY1BGS0xjZ0RUVlEwTVNYZTU1MjBOZ2lySFMx?=
 =?utf-8?B?TXpPQi9pS0tRb3MydGt3c0ZlMHJsMjVFZmtCUjNlSFdnOUxCMzluaUQrbUlG?=
 =?utf-8?B?QjdrT0M4bkdZN1VjekdET1o5TWxOMFNHbStPU0ZYTG91QTVhYjNyK2gwRjBM?=
 =?utf-8?Q?XIbmCpd+xk/QyaMRMUugDBQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba3a1b3a-2546-4117-d440-08de33816db7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 22:06:52.1211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +zkvE0rlacEe6hIvhLB9q5Igxl+iS7RHlclxt24p3o/319JXuqpm0xzpsMj5LhRy8GoprVElYQpvTNRGo1ze9BkbjpYqYagsAOBZA6IcaLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6727
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

<snip>

>>> @@ -214,6 +228,9 @@ enum  {
>>>   #define GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_KEY 0x8002
>>>   #define GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_LEN    1u
>>>   +#define GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_KEY 0x8004
>> maybe we should add some _LEN macros for completeness?
>>
>>     #define GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_MIN_LEN    0u
>>     #define GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_MAX_LEN \
>>     (GUC_MAX_ENGINE_CLASSES * GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT)
>>
>> which then can be used in some asserts where we prepare KLV payloads
>
> ok
>
Can't actually do this in an easy way because GUC_MAX_ENGINE_CLASSES is 
defined in guc_fwif.h, which already includes guc_klvs_abi.h . Easier to 
just do the multiplication in the .c file.

Daniele

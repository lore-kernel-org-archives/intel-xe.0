Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59544C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 12:57:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0721A10E98E;
	Tue, 14 May 2024 12:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R4tfeXyz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6647810EA5F
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 12:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715691421; x=1747227421;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dm8QccOshTKF+lhmItjG86lR/2pRoTVdvXk0BlPvRhs=;
 b=R4tfeXyzKOig4NWUfkrDQJwZ3YGMbJlDZpEz0c/4TWzi+3wP+aYnR2aL
 gnErPjdkvl6r5uPEBXuseXf0pHf8rVuludNNCQOqKJrcT5aRbXlAN/c8g
 RjKiBk7SLDTgGSBX52/1/P/haxSVftC49uyn/lF9Bf4z4INVHpnl3FMP+
 2LNMZkO/cf3TDZgEfQrNr7+JAJig+c61wrUsE3kujo3gL+n0AZwhWpZdg
 l8Pl3afV7VTlnp95znQz5hnE/RegaMezMUEo3+BqdHwaBdxKQRgqib8d4
 QpR6r9sz2VO0gugMQW3S5ZWciciU32rVbG78DVoQalnHi+QeIDugjhSWy w==;
X-CSE-ConnectionGUID: zJl9P0LwRnGxQgxJ3uERXw==
X-CSE-MsgGUID: p1YKXEnHTUyotV0Lg8/PIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11613946"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11613946"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 05:57:00 -0700
X-CSE-ConnectionGUID: yNACA7M6QJyAMnv0QlaE/A==
X-CSE-MsgGUID: afWNxsLuQzuL/2gu5sL9ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="31232496"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 05:57:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 05:56:59 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 05:56:59 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 05:56:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EgIXBWYQ+t914iZahTbrCIK5FLsCXJHewrHIF3GmgTsP69uJO9ecZLs9SNXcqOVEmfXfB//PeOeVS6ZqbkJZ2ly4PZo/vIvsZRD0jTLf3h8NCpsZVtuGqL70QxecvbVvNjD1+EfqIHCanEYjG3ruCgkHEvjC7DFkiJFksrfW2LqxnYb3htej3Xmt6pg/cDl9VRwAUnrwI9anX77I191oL4d/RMX97bRkRAYsx5dWWkoi2gJxebezGmgvwOMP1zQeaTmnp1xK/s9phb3qCRNcbvC+bHoR1Nw0qkkvgoalRy+/0YY02iT3OOitPI/zMpitWjUXEqnWUszTBACCFVHHiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dd2KYhR3RvFGYmhqCbVNTn1Adt6yITO4Eppsns7oiY0=;
 b=mOZkWBfqz0ggV1JjimvePOtm7CC8OIMkBh/Pwd1wN7wW8EE8AYYOjtYA0qRd9kEF9P3jvFdEkNp/DjIgFYPUmg8/HT5T8OiX4mSIMY0udsrjtbzS7nqrGpygMLGe/1gmo5p/kEBDfCms8ziHcSSldiDp1NwtP7Be5LuJX8Cx0zqDrbB86q5lUVmjiw5YLwRDS2FMw2LGheLza9azrhm3t5DHXHe8jX+T/xQBiwgrF2Mnq4FefUiVFT9VHp5jmuuFlw/IXH957NrgEasrxv4R3Gm4P7U0qcWagPBQnzGzKeelW8S4YeZjHJvuSD2N4CGqgmrRE6dhp5fguu+p0CXWUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CH0PR11MB5281.namprd11.prod.outlook.com (2603:10b6:610:bc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 12:56:53 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%5]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 12:56:53 +0000
Date: Tue, 14 May 2024 14:56:50 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/6] drm/xe/guc: Add VF2GUC_MATCH_VERSION to ABI
Message-ID: <20240514125650.y2imokuexhiz5nxd@intel.com>
References: <20240512154915.2040-1-michal.wajdeczko@intel.com>
 <20240512154915.2040-2-michal.wajdeczko@intel.com>
 <20240514124703.4o5royonzqivxokw@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240514124703.4o5royonzqivxokw@intel.com>
X-ClientProxiedBy: DBBPR09CA0025.eurprd09.prod.outlook.com
 (2603:10a6:10:d4::13) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CH0PR11MB5281:EE_
X-MS-Office365-Filtering-Correlation-Id: f789999b-3e94-4d7c-5118-08dc741553ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eU1RTkp6WVF0MnNJZmRTMGdONDlGWlB0TWNLV1pLZkU1bFFRbm9UcExWbGJs?=
 =?utf-8?B?aG9QUy9SR3d6Y2NKaFhiYisydDZNcG45T3JUZFRVUzJYYVJSckNVSzhWTzhD?=
 =?utf-8?B?ZFVZVEh3eGJDNCtveGcvNm43ZWV0ZzZzd3hHdFBtUUkvWm53a2dXTmM5aEd0?=
 =?utf-8?B?T01nWUVJZm1GaFdBamNOTFZ1Vi9aU3Q4bk8vNDFZUmRiQ2JBOVVqQkxYUERZ?=
 =?utf-8?B?MmZHNXZnOG1WSGIvUTZUMUo1QlRJV1o4b3J4OHI1cC9wdUNjRUU3MHAzaU5z?=
 =?utf-8?B?bTA1d2VDYmdpcGhrVE05K1pXMTAyRWxYeG1FcTFCaG4rU3lXeVBDSzMraW9r?=
 =?utf-8?B?U2x5bUNrYjVZK0tkbXdpbHNmQS93aytoOSsvSG5jZkgxUXMrN25SZE5Yc2Q5?=
 =?utf-8?B?K2grN3JPUjRZanBnN3JwUnJMbUFsYTFMKy9BSzV4RFZSOURkdWlOWHBHQ2xF?=
 =?utf-8?B?dmpTRWtnVnk1NDFqN3VJNndBR2RuK3Z3WW5hUzlKbC8raGlpZjE2Rmx3R2pj?=
 =?utf-8?B?d2RURExmNHB5Qk4wUFdxZ1Y1c0kreFNvSkt0U2ZkZ0lmRnA3WTZwaFI0LzNh?=
 =?utf-8?B?U25zMzdUWXgrU1BZTk5HVXJWMm1Ceklpdkh2MHlQS0NlSXp5UUJDTVhKaFFS?=
 =?utf-8?B?aFVnN2RpK3pRWUxGSEF0V240RXIvSnc0N2poTVhIeGNEdEZ1c3hkWVNDaG5C?=
 =?utf-8?B?dkhiTVo5NzJIRG52all0VDZUazdwaFZqN1F0RlA1MjVFbUNZcm9GZTVEUDNC?=
 =?utf-8?B?T1VNaWVSbk12YXdIdGU5eVFIQjlDVThvRmx2S0xBVktCYmVINWFHUGF2cGti?=
 =?utf-8?B?d2dUNGNqVkM0d0VZdmwvaTdEM2I2dXFkVVdyYnpIbkxBUWIrWHMrQmdCR1JF?=
 =?utf-8?B?RVZ4aTJmdmlCb0FieVR0R3pETlAyejFsMUp0NVI2TU5nd2VrdnUzSzlaV2wy?=
 =?utf-8?B?bWl6RitncVUwdW03MmJBYTNYdE9ScTZKZDFITVBiRlBhbjYzWUhnc25Ta0x6?=
 =?utf-8?B?NXF4NGcvbmt1a0YwbmZGUHZvMzZIckVJbis1MHAyekdzb3ZRQUdxTjRvcVp6?=
 =?utf-8?B?VEJJQXRvSVVZZit0N2p6M0t3KzR5clg5V3JRemcyb3pwc0cxRFFkdHJacDha?=
 =?utf-8?B?VHdjYzRQVlU5WUtOZUlKRkhHVHc5QmJGYzlWRUtRQTBVUTBkV0lpMTErUUo2?=
 =?utf-8?B?YUVvS3pNMUU5OWJtNnpiN1lISHlyRzRsTlA5NGJHRUx3R09TOHBUbTRJTHlC?=
 =?utf-8?B?czZrMUg1REtuOWNCOUtNSG5EeWZNUU1BZkhJUEFhaHBycDVWL1BkcmZlcUdN?=
 =?utf-8?B?ZVg0UGRmdW9qSDc1V0R0T0owa0lJaEhwZW5JMGpvN3d1Zk1PQnFNVWhPaVBQ?=
 =?utf-8?B?Z0c0SXpnK0d0TVN1L2VXcks2Zk1hc05ZbjBvNkpRMGpraWV1dUJ6QThDSjlm?=
 =?utf-8?B?WVZzc2NlUEYvbDRLVVora3VwVWxSWVVob3Z5TDZWVGtVTTM1cFhtODlmbEgr?=
 =?utf-8?B?YmF4dDF0a05sdWpoRFo2My9LRk52b0RKU3l4YU9wNWxYVDNURHRXZDFOTjM0?=
 =?utf-8?B?STdESGhyZzI0MFBEY1pDWEt2QVdYckg3WTRnWTl0Z0JoZmlETit4MHRKN3dL?=
 =?utf-8?B?eFZMNlplUlpwMExqMnZ5TENzVmZVdHNCOENDT1JrQzhnQmdiWUx6RCsyekl4?=
 =?utf-8?B?REtNOFJBeXlWS3E4ZzVldXRMMzV4OGVMNS9UbEFqWW44eDRsbVljUnVBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?andQTHJlYUVub09XUURFQlFzMkpVRVdqbnJSOFJWL0dUZFYwOXVlZDR5TWUx?=
 =?utf-8?B?bkxvbU43dHhoNER2QkViVXJoeElCQlp5ODRLMXRaMktDdDM2anlQZzlmZkMy?=
 =?utf-8?B?K2M1RkZWOHgyQ1FQTWNsWEhpVkE4ZXIyb3lPWml0SFlpOUswWUZ2YjJteVdq?=
 =?utf-8?B?QTVxOUpITnZZWkl4OGNVTGF0VXlMWHhDMnljbzhpQi9wK1RudkhKbG1DZ0xZ?=
 =?utf-8?B?ZHR3WEk0aWNjZURpNXN0OXdFRzEwOUt0c3FlajRHZC9jZnNyaStVWDZNUnhs?=
 =?utf-8?B?SEpTZ1V3OGRrbTEwdnpJV2RTdDlrTTEyMUhUQ1FnakpkUTFYS0dzSFIrNVZN?=
 =?utf-8?B?bWNDRlMyK2RIMms5NjZweWRxVC9DWUdZM0ljN3AvdE10UVZBeE5lbjFRVm9D?=
 =?utf-8?B?KzloZXNMR3dKNGpQWHpVLytEYklhMHZyWmdnWEgwU1BHVkphcUE0YVB3ZmM4?=
 =?utf-8?B?ektMMnBlZWZ6UWdsc3l4Q2RCays3ejhqS2UxS1FNOWdycEh1d0ltVzFNaDZI?=
 =?utf-8?B?Sm4yNlVaMzNCNkY0UDdHSXY0aERVOVhCQ3I2VEdRVTZ6WlRWNGhGT0lKSG12?=
 =?utf-8?B?Q0hTNHRRakdCdDZPd09aelIzTlNVN2ZTWGJoaUFrclZDaEVVR1M3TW11a09t?=
 =?utf-8?B?clZSZDg3RG5xSGxIYVhxeGt3dEZVMVM3NG1KUnV0T1hDRU1EK0hGZWIrL1Bz?=
 =?utf-8?B?MWZ6MHY5ZGp4c1JseDFBT1ZmamVlNENCWW42ZE1rQXVqa0RNU2VhYVBtTGp6?=
 =?utf-8?B?WTNrK29rd0JJYzBzcFN2Q2pHUmlkTjJ2a0owSmZvM05DSVNJVEVPK2VoSEZW?=
 =?utf-8?B?Nkd5OFdUNlAyYnlDTnFLS1F1VVNiUHdFS3duQXIvb3RKNXFLZk1mVmprK3M4?=
 =?utf-8?B?Y3gxNTVmQjhJQXBCQjYrVkRaU0xad2lmZmFwRE5lbzhCR2pGbFlGOEJ0V0ZW?=
 =?utf-8?B?U3draTVGRkdsdmkweGdQUUlsT05sWmtaUDIxTUZDK2VQR1FId01Iek55Y3FX?=
 =?utf-8?B?NmpEdW51R2JMcmRzb2xTb2RxR2F4RTVBS1F3N3Q0TEpmZGNYRmQ2T1J4MXl5?=
 =?utf-8?B?UEhBYjBBQ1NidEE3T1RvMS81Z1FuSUlhNFpFeU9vK003c0Q4b1Z1VEpyUkdE?=
 =?utf-8?B?NURoeFdwajRjUU13NTJERmRYL0FIZ3lqNWJWSEt2dDN2NVNBeGVJV2RjWkNz?=
 =?utf-8?B?QzAyUW82d2IwbzFXSkNxcVpCUW1YWDU2VFEyN0pEdDVONkR2Nm9aS0NIb1Mx?=
 =?utf-8?B?Q2Z2Rlh2SDBSY2xKK0hvaWE2UjQyVGV2ZFJndlBWTzlDdmxEWG1mTUNwNEZL?=
 =?utf-8?B?MkpuZXNQNUkvSkpIM200SjlEOWFJdHlORExTL2d1djJ3Skw5YjhsZnZTTWRM?=
 =?utf-8?B?V2VUdjhSUERDRzVVT1NxR00ydlJrakdWYmMybzBGN0VFMEM4WXBadGVQcGxo?=
 =?utf-8?B?MmhrbVJFSENUL1BEYytDNHVFVCtPSkNyVVQ5Zkg3eXdLQUUybkltK2c2dG5K?=
 =?utf-8?B?S0QxS1hPUDRlcys5RVdTZUFzVDQrd0lXSVV4QVZNRkZza2hEYTRzdWI3ZURm?=
 =?utf-8?B?T2FMY01JaWdDUTRiVWllQnptamJpa3NqSi9BQldXNHdEOXpyVFo2OTRwUVYw?=
 =?utf-8?B?cWZ0S05RZjZSd3E1L29SNmFYNmRwRGVDZEpxVThxS1dIN0EwVXh1QVExclBj?=
 =?utf-8?B?RGVTYnMxeUNFTFJJYTlkTE1QRTRyRnFHeU92eEd1SmNGV1ZGeG5zYkxPVG02?=
 =?utf-8?B?NmZ5ZUdkdkVJOEc3Qk55Z0pIeFMyOE1zcGVTd0h1ZmFZWEN6eCtwQzN0Ump5?=
 =?utf-8?B?ZmhpLzRFcFpCQ2xjR0Nza2FuT0wrWmMrcWVnbDFRU1lpRjhuOFNjWXQ0bS94?=
 =?utf-8?B?Z2JlLyt3VHBVN0FDeXlLZHd0ejZlTDd3a3pLUTlicnhRcUlCTUpQazdxOHIz?=
 =?utf-8?B?UTFCR0lmTjdRYXRqRTRVL1hCSDM5MzAvdzFQQU43N1hNUU9FcWdOY0ZZYWFk?=
 =?utf-8?B?RjZWWDFxcHNCWmJvT0V4L3pMb2krTzBrZzlTZWdIeXRDMDdsYldHY2l1QWRj?=
 =?utf-8?B?dlZLRGZEaXM5cytNc0FPUEEwcHBiOC90eFFncHBWTnVmUlMyQlZHWkpqak1n?=
 =?utf-8?B?Wk9iUUo3OVJsMlpyNHJpMW1TbnFIczgwWEF0ek94eDUweTR0d0V4ZE5hOGJl?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f789999b-3e94-4d7c-5118-08dc741553ed
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 12:56:53.2135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UxmtDbpAdoMTdsilOFuS9YUMmyx23+UFk5G/NJuDoOeaL658EGms6mO8meZvlgUiq4QRfw/TxGDwydMEeghccjWCZ1PqiA3cxKucBJnEPK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5281
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

Piotr Piórkowski <piotr.piorkowski@intel.com> wrote on wto [2024-maj-14 14:47:03 +0200]:
> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on nie [2024-maj-12 17:49:10 +0200]:
> > In upcoming patches we will add a version negotiation between
> > the VF driver and the GuC firmware. Add necessary definitions
> > to our GuC firmware ABI header.
> > 
> > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > ---
> >  .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 67 +++++++++++++++++++
> >  1 file changed, 67 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> > index c1ad09b36453..49ed5fbd4ced 100644
> > --- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> > +++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> > @@ -213,6 +213,73 @@
> >  #define   GUC_PF_NOTIFY_VF_PAUSE_DONE			3u
> >  #define   GUC_PF_NOTIFY_VF_FIXUP_DONE			4u
> >  
> > +/**
> > + * DOC: VF2GUC_MATCH_VERSION
> > + *
> > + * This action is used to match VF interface version used by VF and GuC.
> > + *
> > + * This action must be sent over MMIO.

One more thing:
In the next patch you use the phrase:

+ * This message must be sent as `MMIO HXG Message`_.

Maybe use it here too.

Thanks
Piotr

> > + *
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  |   | Bits  | Description                                                  |
> > + *  +===+=======+==============================================================+
> > + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   | 27:16 | DATA0 = MBZ                                                  |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_MATCH_VERSION` = 0x5500         |
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  | 1 | 31:24 | **BRANCH** - branch ID of the VF interface                   |
> > + *  |   |       | (use BRANCH_ANY to request latest version supported by GuC)  |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   | 23:16 | **MAJOR** - major version of the VF interface                |
> > + *  |   |       | (use MAJOR_ANY to request latest version supported by GuC)   |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   |  15:8 | **MINOR** - minor version of the VF interface                |
> > + *  |   |       | (use MINOR_ANY to request latest version supported by GuC)   |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   |   7:0 | **MBZ**                                                      |
> > + *  +---+-------+--------------------------------------------------------------+
> > + *
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  |   | Bits  | Description                                                  |
> > + *  +===+=======+==============================================================+
> > + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   |  27:0 | DATA0 = MBZ                                                  |
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  | 1 | 31:24 | **BRANCH** - branch ID of the VF interface                   |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   | 23:16 | **MAJOR** - major version of the VF interface                |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   |  15:8 | **MINOR** - minor version of the VF interface                |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   |   7:0 | **PATCH** - patch version of the VF interface                |
> > + *  +---+-------+--------------------------------------------------------------+
> > + */
> > +#define GUC_ACTION_VF2GUC_MATCH_VERSION			0x5500u
> > +
> > +#define VF2GUC_MATCH_VERSION_REQUEST_MSG_LEN		(GUC_HXG_REQUEST_MSG_MIN_LEN + 1u)
> > +#define VF2GUC_MATCH_VERSION_REQUEST_MSG_0_MBZ		GUC_HXG_REQUEST_MSG_0_DATA0
> > +#define VF2GUC_MATCH_VERSION_REQUEST_MSG_1_BRANCH	(0xffu << 24)
> > +#define   GUC_VERSION_BRANCH_ANY			0
> > +#define VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MAJOR	(0xffu << 16)
> > +#define   GUC_VERSION_MAJOR_ANY				0
> > +#define VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MINOR	(0xffu << 8)
> > +#define   GUC_VERSION_MINOR_ANY				0
> > +#define VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MBZ		(0xffu << 0)
> 
> NIT: It seems to me that GENMASK would be more appropriate here
> 
> > +
> > +#define VF2GUC_MATCH_VERSION_RESPONSE_MSG_LEN		(GUC_HXG_RESPONSE_MSG_MIN_LEN + 1u)
> > +#define VF2GUC_MATCH_VERSION_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
> > +#define VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_BRANCH	(0xffu << 24)
> > +#define VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MAJOR	(0xffu << 16)
> > +#define VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MINOR	(0xffu << 8)
> > +#define VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_PATCH	(0xffu << 0)
> > +
> >  /**
> >   * DOC: PF2GUC_UPDATE_VGT_POLICY
> >   *
> 
> LGTM:
> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> > -- 
> > 2.43.0
> > 
> 
> -- 

-- 

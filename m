Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94652D3C545
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 03:49:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB9910E1E5;
	Fri, 18 Oct 2024 03:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i2SwInoH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A554C10E1E5
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 03:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729223378; x=1760759378;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=AGp88HjZ8v8VqIcHkhq35qh6PHuKEMk15Z47DqtsQ6U=;
 b=i2SwInoHNtqn5iZmD8dFcNz97w4gXNVr2Ytp8uptBRrRbgj26b8/96fN
 v/dsq9FN3MFVQykWk+BSz+g+iR/7r+N4U4+pjLkBCvoHJPHwc6H/XWqkG
 M2tJNllBDfUA3cieG5yX2/k4LCOW4FuRq6RlySeQ8sCvaQ1qRf4fqOOiH
 Dl+KZxqmO7LOECbQF9eZoRT4f4q4HjvNGGdbGZ39ZBJ+zdo86fGrxB0nQ
 F1AgFGWHxoHNJip06BnteOlxRrt7f2RYDtESF+2mGnbyYUuNs+cHC62og
 7buAjLMF9aVafXCvuarkcl0rRQwazKRz54KrjejhILGJ40wHvBvjJvGj0 w==;
X-CSE-ConnectionGUID: xqjPwsE5SoyCJ07erp5Yaw==
X-CSE-MsgGUID: Cy4tCqkTQha3qZNMicQAoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39867694"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39867694"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 20:49:38 -0700
X-CSE-ConnectionGUID: xyMSd/FpTr+f37E3G/bi/Q==
X-CSE-MsgGUID: RBy0lQa4TTanMlLqR0f3iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; d="scan'208";a="78716022"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 20:49:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 20:49:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 20:49:35 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 20:49:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yXKuu05PGllqKKl2bZ4mt/6x6WwnLJGFkC3AAKXE/3RdKV2+invzPieF7gQhs66Y+Qcm9f13WeLa4acA+7chSK3lQZng/izQDavcRnO+Q3fAcF63OSfJP9jhtWvqGegy+s7Fkerdt7Qkgfjm9ZOPp3Y43Pv5Au4Iver/t74GERQr95QNOWBwO+wja/WQwrw4FMft+jVG0gCwQ2kE47VLMDWgv5tM0FYgqZ16apcJ3O+Nbi9YSoeWgcaMWsSLwWfJwMy/wNlc4eSxB+M1Bt5mxOaTzJJdEuut5KorMVs0s0o99XCRHMbPGEYi/5KzZGMVVXvyat+ZC+T5aTHGfZ3TEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHE4fSkQCZSp990ahkII89HF/PRS9s7TsginnRDux0s=;
 b=YSqeuwfwUmVfXS3yZ+Z8Oj820oct4IphkZwKp0+ReulLXxNKLRHnhU9Rc69o3a8aKH3SvrL4WwzxQq9NKqoCndT9ceN51OKMfQWda4hCTJzGZbbNj6x6XVB0TsLE+xuoHeUzUcgk1JPBHQEhdyOkLybFRhmxP36mOIsj+R3C/F9/864983wr6cZ00rkuIrjlMKjPkqf+w8M2aAzE1HMNazyZQYmSq77cwWkWi4vHNJwnt6tuBvOkBItiyBUtV/DlgRTiMPeupO+eJZggKgoP0qWqqTCqGpXKyPGoCkojW23FmMEoDzXv/tcFtEU+up35rPruPYQ+Eh7N0iHEiagCRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH0PR11MB5080.namprd11.prod.outlook.com (2603:10b6:510:3f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21; Fri, 18 Oct
 2024 03:49:33 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 03:49:33 +0000
Message-ID: <63adcddf-4c71-4fb2-9585-fca4178ab152@intel.com>
Date: Fri, 18 Oct 2024 09:19:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Use __counted_by for flexible arrays
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20241018030039.1077842-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20241018030039.1077842-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::14) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH0PR11MB5080:EE_
X-MS-Office365-Filtering-Correlation-Id: e13aa8b5-8f78-4f3d-f225-08dcef27e086
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vlcyb0dZRUlZSFlYeHF2cDlDYnJNaTlVMTQ5T3kwY2c5eGZBK0xwbis3d3No?=
 =?utf-8?B?RzNaRXA2b0kyT0FUeVYyUXZmM0tOY3FHbllSTUh4aEtyOWRiMlRJSWo0NkJD?=
 =?utf-8?B?SnFiQlBUZ3VaNHo3NlErQzNURERhMmMvYjZVZWd4RjBJUzJ5c3d4Rk1jOEh4?=
 =?utf-8?B?REdSZ2FGeGlnQTFDaHNzOGI5dlpjRHZMM3lrcmN0b0lYUk1NdEpFRFAvMGt5?=
 =?utf-8?B?d25nTGlpNG00cHRvZTVvYkpGSzdzM0xVVGcwb2t3N1NsV0VGVXYxb2sxalRu?=
 =?utf-8?B?QnJzK0s5K3NCYXRiT3Y1azlBTitNVHBkUzJvb3hQS3NuT2Y2eTJPTkVqTXpE?=
 =?utf-8?B?SmJJS3MrNnk1QU12RUhlUGtyTWV6SjdzakJqMS9zU0RhM1NLWklGN2k0cjVH?=
 =?utf-8?B?eHBET2NoK0RDdnNOQXlBcUp6VWRHcE45L1BTY3QxUnhPcTVyQW01NDgxQmE3?=
 =?utf-8?B?eU5CWDRiMGxobnNzNTJnMENGMnFvaUdNbWN5MjBXMCsyRDI5d1RPb0dFQzJX?=
 =?utf-8?B?MS9lcUNYZDl2aFZMcXozOGhxdlJmd2JVOHV4N2lrMVNzQWdEcDlNZ2lueWl6?=
 =?utf-8?B?OGwvZUFEYUxMQXhSK1djMVZaZ0RpNlZ4dXd4VTRwNEpDT1Y1WEFXWWFGcnJR?=
 =?utf-8?B?R3VBYW1icWxpZy9GYkdObXZhRGNzRjFGSmtoUWdPWmQ0b3EycW9DZTJtWHM3?=
 =?utf-8?B?OGRQTkRiZE1COEYwRGMxSWxMRE5pNVFhb3FuWUdIMzV6MFJ0UVV3ZnlNRVRp?=
 =?utf-8?B?QlpJRFptenAvWGZyZVZOQ21VbGljaVg0R3lTUENlQURpb3NzdTViVis5UFpn?=
 =?utf-8?B?ckhoWnpOMVVzNDRaQmVjU3N1dnhaVW9TYnpKRG9pdXBkWTY1NlJEeTVyWkVK?=
 =?utf-8?B?SFRmNUdpTEE1MGkvVmJmUEphT25JTldlZXd0OVQzZ1RycWdFVHNUeVNJUWY0?=
 =?utf-8?B?QWF3dDI5UHIwOVE4UFVzZjhqY002UG85SVJCQVJmYy9RMy8yUVNlRmVGN3dC?=
 =?utf-8?B?NDk0VW8zeEZubXVRcTFBblRoSWFCRmRwSWJwS1Y3SUNLWWJuZ3g3akxtMUl6?=
 =?utf-8?B?WmJJUStIMDhiVVdpamdFYUtVdmZ4N3BIcGUvZTNTY3paUlBuaHp5TzZaVFQy?=
 =?utf-8?B?Z1R1VmJ1VFdZRGNYZ2Zkd3phZE5xd1RkcjA5N1hxYytYcXJxZnZGT0VpWEpK?=
 =?utf-8?B?bEo1alFRKy8wM2NSaXIycnhtSkNDREI3Q0JKcUNONVBkakY2RFBYTjRxTTJJ?=
 =?utf-8?B?WkJrTGlEbkRISXRIa0NKbzE2RDlOWEo3R2xJb0pVVVpWdFpYbFVodUdRR0Q5?=
 =?utf-8?B?VjlWUElURzJXL1phM1dqTjc4TkdCZVk1SStLL2lXclNHazZ5dmlyUnhhRjlu?=
 =?utf-8?B?ODRtZWlsU2R0Ky9Gbk8vNFVrQ1lJK3FFSFl6QmprbE1lUzBWakZ3dTFHRnVZ?=
 =?utf-8?B?ZnM2aGUzQ3UxWnVCKytYcHlINFhyTUZwZzh2T0M1SFArdFRtcFl2OUNEN0pO?=
 =?utf-8?B?ZTJuNnFoeHRXSC9oRmdSRi80SFIzMEY5V1Q5RWpqZlNKZ3Y4V0FxQ0dXcDNF?=
 =?utf-8?B?TWJXaTdlY05GNjFVQmpLTkY0dHl2a1lYc2QrZEhXSy9abWRVb0I5c1ZXeThF?=
 =?utf-8?B?S280LzNsQkh5Q2x2TU1NZHN0M2k0ODNYWE9aRDVXdUNCMFRtYlUvMG1ldFNx?=
 =?utf-8?B?WkxYNDZFWXZJYVNaaUpTeVAvL05OR3I5dU90bm14Z0Q3MWI4TERDS1VYK3NO?=
 =?utf-8?Q?KxDFDWebpH4Y0xFn2qXqD6l4HeSpUPWdO1laYlC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDJHZE5pYXduMXJwUE9MY3hXQzZyeU9ZVjVPMDRhZHRTTDN2K2xtcVNuZjFm?=
 =?utf-8?B?bU52SEgzYXVDYVBxUlY5Rk1ESW9wWk1EYUx2SlBNcjVFb3dObU9PNHI1anA1?=
 =?utf-8?B?NWxrNmVvMUR2SkR4MGplTUs1L1hjeHZWNTdNU3NYRkVxQU9hZHpwTWdiU2lB?=
 =?utf-8?B?UzZOdk1JSHMwZkErY3NsNVRwTVJ5TTdOWkwxUDUyS3NhTVZuMzF4SGM1Tm5a?=
 =?utf-8?B?blQxWGpZd1d1QlR3aXhFVUd2TDdEQUxEc0tmN2lsSE5MclM0TDJxMW9HRi9i?=
 =?utf-8?B?MVZMbXNIU1hHSWlwSXEzb0hGV3VmaXh1V1MyWkI0NGI5MC92dHlIT2Y1V2ho?=
 =?utf-8?B?eE5TU1FPeFFEdEtlSDBEUEVYMUhwMzF0WkRBbWpIUERRRGcxMzFsNXVLaUh6?=
 =?utf-8?B?KzNtUkZXeWh3Mmp0OHF3bHYySUtaWkg0TkpHakNMVHFOM0ZRRUJWYzJOYzhJ?=
 =?utf-8?B?R21SRHJEU0hPNFpGTHRQY1V6SDQveG53Rm5EbDVsU0NkUktIenI2OGNyUVhv?=
 =?utf-8?B?ancyOVBBVHlFbHRMUnZFV3B5Q0JCSW5MdUdST0ZreEhoTGIzbXUzWFN0Y0Fv?=
 =?utf-8?B?SzJhamZBZ09jaEtNR3NCY2NxOUpCTzFJbjFsTWVZUm43Lzg2azhIdVlGOHZU?=
 =?utf-8?B?SUw0S0dFWTQ0ajNpWWpFcURFVUtud3hRV1JaT3pzaDU2aEhUaFVSL2pxazJK?=
 =?utf-8?B?NHRMOS9UOVJyNVZJdDVaVElYcFAxQzZpWXFNYTB6d2ZLZG5YM2FSRUFyVGtY?=
 =?utf-8?B?WUgwRHZucHhRWDYvOVExWGxBa3ZPNjhJaGt2VFg3RHpER2lHejFsU3RLY21z?=
 =?utf-8?B?blRVM3lRMHB2Y1JQdDNjMEorL1VON2h2TERwT1c0VVBBNnduOERkRkJOQ0U2?=
 =?utf-8?B?ZFlaTlRkS1JyQ2d2ZUtHdHR1aXhSUEJ5RHQ5cTdydXRpZVFYZ0pST2p1ZFk2?=
 =?utf-8?B?dzJrYnZoeGlFSEV1djVCWHBoaEdYeWpCRWpTeUVrV1YwbUZ3RDBxbDJLQWt1?=
 =?utf-8?B?S3haNDdsR3piSHFFTXNpQkZ6OFBER21CaFJGaUFrVmtSZjcvYUhvV1FHOThy?=
 =?utf-8?B?OEZRSFVHVzQ5TFZwTHB2ZkZwWjdPN3R4bHZjdVBNMW9CMUMzZWM3ZlBjeWc4?=
 =?utf-8?B?SWhnSFhnbnVPRmp6SmRoYTN2d3F2emlTMUxrVEovbzJHSHJxTS9SMmIrRnRB?=
 =?utf-8?B?M2lDVmYrR1FMRGkxaHhSNGVLU1JaMDRyMzdrSWh6cE9WN0ZwS2o5NGxMZjky?=
 =?utf-8?B?UzZQL3RPSnBETXFVUzRhUjUxb0VCR2FWWHNrVmJpdW4vVERWeHdXaW8wY015?=
 =?utf-8?B?eXVuNnl2TU5rOFNuTVd4RUtPSnFNTXdpTG9nUytOM1JzdU9JZWVLSW1wYXRU?=
 =?utf-8?B?eWZuc3lqRGJwV1Eram54QU9mVmh1SEh4eGo5Vld4bG56eHFIYkRBWWRLRk52?=
 =?utf-8?B?VlRwTzFScThVUVg0MFBKU2diVEwyWHFCM0YzSVVGZXZkUGhaeEMyb1dkQ0pK?=
 =?utf-8?B?WmozZG5sQWVBM3JwdDJSdlp5dks0UlRVcmxUa0ZxOUx2MTBoTFlkKzE5U21o?=
 =?utf-8?B?TmMreE5TdGFWTDJLOFN0Q0o5MUp5NzdFejI3MmdhYzBvZjQ5eDY3NUlsSjJi?=
 =?utf-8?B?Q1hpOU5nMmpBcGJJYUpvUkpqbWN6eTZ4clJPcHU0TVludEhOajZaS0I1WlM2?=
 =?utf-8?B?K2pLY1pRRUFVWGJlZ3JSMFdxOEJLNkZqQ2dxT1U4L1NUanFhOTBzNjRHVmw4?=
 =?utf-8?B?bVNKUTliRklzWGtFSzQ2UzBUTCs0Z2orSDl2SGp5cVhhTWlSbnlFYlgrYVNP?=
 =?utf-8?B?UnNNZmlYamZpNGF1aE1TcDh2WG14ekJ5eUtlTy9Ma2lpNjJTeUdvUlJHaFMw?=
 =?utf-8?B?Vkg0K0FZTU9lL1lCOFd1NXM2UkNSaFZla1pVOTZlU2djbDRTSy9Na2ZKUWls?=
 =?utf-8?B?TGtvRVlseDNmcmpsR2ZubThqR0p0NGl3b0psWXhVb00wSHVneVp6MERIY1hJ?=
 =?utf-8?B?SXd2WEc2K2ZaMzAvM0poQjBWRm5wR2tsWWpDZDJjRW8rRUhWL2VQTzNnL3Ix?=
 =?utf-8?B?WkdLRFdmUUFhNjVyWGRGc1RnaGhTdjJkaXFLdTdyVDRSUXVxVktSN1BoMHI1?=
 =?utf-8?B?WFVscngzTUVieHNWUTBiYkJxNUJPWXEweFVpc1pQSG52MnNiZkFMNndycjhL?=
 =?utf-8?Q?1KKF4mQR73Ms/AmDOQ8IYXw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e13aa8b5-8f78-4f3d-f225-08dcef27e086
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 03:49:33.2547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V/zVFmcxwe7ZnFPl1/9F3rhZCLyWn3m8f+G126+x+Pkcy3RuBBSgbtc3rh/5asa3PfgpKAgpxPF1IludAhaEsq3IdC4DWgeOCfyZvKzKLks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5080
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



On 18-10-2024 08:30, Matthew Brost wrote:
> Good practice to use __counted_by in kernel coding for flexible arrays.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 +-
>   drivers/gpu/drm/xe/xe_sched_job_types.h  | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 7deb480e26af..1158b6062a6c 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -143,7 +143,7 @@ struct xe_exec_queue {
>   	/** @hw_engine_group_link: link into exec queues in the same hw engine group */
>   	struct list_head hw_engine_group_link;
>   	/** @lrc: logical ring context for this exec queue */
> -	struct xe_lrc *lrc[];
> +	struct xe_lrc *lrc[] __counted_by(width);
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
> index 0d3f76fb05ce..426d261d7359 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> @@ -63,7 +63,7 @@ struct xe_sched_job {
>   
>   struct xe_sched_job_snapshot {
>   	u16 batch_addr_len;
> -	u64 batch_addr[];
> +	u64 batch_addr[] __counted_by(batch_addr_len);
>   };

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   
>   #endif


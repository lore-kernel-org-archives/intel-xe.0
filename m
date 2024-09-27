Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508B2CDD1CD
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 17:50:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F2010E436;
	Fri, 27 Sep 2024 17:50:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P7lVfVHS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D84210E0F6
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Sep 2024 17:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727459454; x=1758995454;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iEAsNT7dAHNI2b7lUJClagVB+Y2vd1/d3oPTxIqDY8k=;
 b=P7lVfVHSg0p8pBrqetDfI4nstJ516mvxQcOhpzYm85AP4TJGLrXsSFkF
 9J8e6iJzl6g9E7CYvGJKDu8iBiB+WdZsytv7tADWD4CsWW6kRf4phl6uy
 i8QDFRluC1dN8PKzhFVNgQ99RpdgMo6cCHgN9t+zFBUqIPpPkESQ7mQWB
 f39EVzl4QHJZ7cACwH8J4Q6UyoUFnvKcvEsY+7w9uY/BMMT8WhmjXoyzO
 ZYLk2dh3KTBhtSumlkSf5e1Tg7RNFunwWQLUAwsc5dt/udneiVxY0Zqrw
 xKCBVRIQrQqoL37xSAHDI8yHfLMRHITA498L9njmPTPDTTgx0DjTtVr8A w==;
X-CSE-ConnectionGUID: o1EMaDoNR+6hWVubu3chXA==
X-CSE-MsgGUID: iZo3QIGLTweAJ5PYv0p/HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="37750798"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="37750798"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 10:50:53 -0700
X-CSE-ConnectionGUID: oEWOASFYSOeWlmsQcH9ogA==
X-CSE-MsgGUID: s01UhDNSRsqUXkHPt51A0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="73029027"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2024 10:50:49 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 10:50:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 10:50:46 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 10:50:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVtfzbLbnov5MrIv8u6CI4KXCaGs8uVSvmPTnU0V8potjFoHdRi8rU6ibFtiYdJauCNlEN8ZJLCL4AuVH2umxo78ZWZFjW8JtPcDF9+igTZQwrJqWeenwU0v4fsNF6MyjPTGm8VEa7rdxU3FAgg8i/6O5HvnKPZvzTTWsPJVr+vMG8QlLQpYXM21oi0Khq/dE4iQzrnlUMRxIOBGcRHH/ZV6qasS+CDY/262emXwpY+Z0UOmaxr9P0aK0SZVaD0R/9TvXEAx39FmTMS/tUUTYxq9hZdcFrOaf1TNbMr9zkBI/aXqWipUdaUF6fHfYPc8Tapg9JvKKuySpak52+C2og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JIO4j8xSJ3f4nMhjFouj7tslbBzAkg2PMOgdwPpxY5U=;
 b=PgBKtSpwgyM3hBkmkhTzHuanstUnQd504n7wAGqJFSkqHCH7b2V8yBP0PClQMd+dy0Qq55V8oEm+fZ561DiW6SKwbZUfH8jgalKvFjObQG7+h6BdBSeZeL4BlxcxRzYY92V+HDXYmMmLSNJAcm2Cc5GwrjHMErZ9OOkjZGVGCG4xQokE+4f5f8dlDfcl+4JVNmmI2B6J7N212dLbLTiLW4DqABcygxSZCZnGbyUtSJS6srgsaL715oLj9FL82OKMM/qQ91YPR9fvWl5kd8f4F86xATuLWSoIHw1/bbeD0OHDCOiv5UDxssCPH/8vawzIl2XkiWihvTBISsUqz7zzOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SN7PR11MB6775.namprd11.prod.outlook.com (2603:10b6:806:264::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.23; Fri, 27 Sep
 2024 17:50:43 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.8005.020; Fri, 27 Sep 2024
 17:50:43 +0000
Message-ID: <f8352635-120e-4dd2-bb45-36fa773ae468@intel.com>
Date: Fri, 27 Sep 2024 23:20:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [CI 00/12] Debug g2h timeout issue
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, John Harrison
 <john.c.harrison@intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>
References: <20240920142922.618649-1-badal.nilawar@intel.com>
 <87bk0i8jol.fsf@intel.com> <d3db53f4-e061-4b4a-b90b-93687ad2fdfb@intel.com>
 <ZvWuCCBBJIFuQNFj@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <ZvWuCCBBJIFuQNFj@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::19) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SN7PR11MB6775:EE_
X-MS-Office365-Filtering-Correlation-Id: 47aab1ac-aa31-4898-38f1-08dcdf1ce81d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SlUvd2J3ZWtJS095djgrRkw1Qkp5M0RONjdTYXRxcGhyYTZIbzZ2ME04SDFx?=
 =?utf-8?B?LzhCVVAzR3VIMnZBZGpkZ3B0bW85N0hKNEtqZC95K0ZsS0c5ZDNiUFh2VHh3?=
 =?utf-8?B?ZnA0bFpZVDBtZUtkMWJpaGd5bmdHQ09VYW5Rb01DanBzdFZRNjVSV05ORzhk?=
 =?utf-8?B?VWdSTFpHOXR0ZktLb3doRUhOWk9BUi85c0dkUzBHdnhodm44VDZza1BRRXpV?=
 =?utf-8?B?Yi82TzEyYXhJalUvaG9aZUZxTkIvQkt6TU5sb0taUVRqR0JUZ28rQko5VURr?=
 =?utf-8?B?SmpHN3pKSFhxNHN2dWNuOVJ2N3RBSFYyTlRqY290NWt2L1pEMysvc0xFdnd3?=
 =?utf-8?B?UHZjTTlXeUtDMUNDQTFqM3FKd2JucUk3aVdVWENQeGp3OVBXWWJxRGxWdm5T?=
 =?utf-8?B?T0hGY3lwQ09OZzBMbXVhandRNWtoNmI5ZG95L1pxRVdlS2pKMXVrNXBLRktm?=
 =?utf-8?B?L3FGUkVJZHZlWTZ2eEl5dzR4VEdXREQvMnF6eGF1REtFbmI2cGpQU3dPemlU?=
 =?utf-8?B?TWdFY1JONGlWaldCenYzVm1QcW1pRU1OczJjR1kvYWhxZjZldE5MdDBtajgv?=
 =?utf-8?B?ZDBYZ09DQTJLTFFmZW1FNjR1cjVubmR0b3kwbGltamlnK0NadytCeURyU2o2?=
 =?utf-8?B?bmVSUzU3RWFyYjdzSmVZUHFSUFZ5MW1UUlFSU3AwQmJHYS94VTNobjRha01H?=
 =?utf-8?B?WnVuWHIvYTRVQmgxdGYvSWpEdzdhMXhPS0lhdklBZHh1K3VJRE5UWWo0bEVx?=
 =?utf-8?B?VllaOG9VS0JnUG9tVzIvbzZLZVZVSFUreXoyMkdwWFUrNGxSUVc3QnorRzd6?=
 =?utf-8?B?VndZQ3U0YVhpS2xuZldjR1Baekg1aUYvK0ZRWTJpL2ZVcEF0aStYRFpodjVD?=
 =?utf-8?B?dnB4cHFpSUhBMnFtL3V3YWt0RXQ3NFdVUjdUV1NEUThReHFWQnUwNmEvdHlZ?=
 =?utf-8?B?RTBEcTRHSGxBQXBEVHBPMkdJMFZvcjd6MTJNdDMxK3phQkdJb3FsZ0F4ZnlE?=
 =?utf-8?B?YllSdyt5ay90YVp2QnplK3B4UDluaHhndHhkNVZhK0ZmREdmZzlEZjhzQ2ZN?=
 =?utf-8?B?dCsrTEc2SnFBN2Y5RU5nYnk0OUFYczJHalMyNmxhaER3bHdRcTZFbU5SR3g5?=
 =?utf-8?B?S1VTdmUwaUx4c2U1WHlKcDhpdnlxMlUrdnJGYkZnRUw1SXM3SGxiU21wL0Y3?=
 =?utf-8?B?bDRDOHFPTm5ZNE9GS0ZOQTlBRG5OTjRQN2RFVWNMK1haR0RHbkZpS0ZvQWRz?=
 =?utf-8?B?VG41R1ZSMU5MYlRSdVpZODJMUGtFOGpFTjI0cmYzYlVGWlFJUkR3ZjBBVUZh?=
 =?utf-8?B?bjcwWW1RNzJHVXc3TER6eEZNTWZWSndmKy8rWVFXblB3aEJNbTliaVhPTmw0?=
 =?utf-8?B?R1oyYXNTTjRXYTRxRndnazVOdmZhd2xFdVFJbXp4Rzgydm9YdmdvcFVGUWE0?=
 =?utf-8?B?cUljeDhvTk9DOExDM2o4ZEpMK0VwajVYSFBLWVNZMHl0OU5YMlZDUDVEaHJm?=
 =?utf-8?B?ZG9FVHFVeEpFWTg5dWphOHdRWFpFVDdvK0Q0bXJYMHBaQUJ6T0xTNUdnS3NK?=
 =?utf-8?B?aUtPV0tuQ3FmTVBBZWgyVTJJU3hoT3ZTV01XRDZDRjlOK2grMkxpZWc3bkJn?=
 =?utf-8?B?OWFYT0lVbW83eG1YbXJCYmszMFN2OCsvcWFSZEFVZEpHdmFsei9lVXA3T0Fi?=
 =?utf-8?B?cWdSMHpQVTRrWStJVFhWanZpTUlsVmVsbE5OVE44QUJOaGo2THNSUTB3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UldYckJSekRYTUI1eGNCZG01cENwMVd6TVlVOGloYTBWanJmV0Z6VFB0ZmNv?=
 =?utf-8?B?b0wyVDlYRzBXb09YKzV6SFp6ZXVIOENBWW9GYS80eTdxWG9DckNxSHp6UEZQ?=
 =?utf-8?B?cHpFbFcyNWN0ZFpxYmp6dmpMazJ2K0RkQyt4R1Z5SlRYTzY5cjdpckxRNlJB?=
 =?utf-8?B?R252VXcrSG9iOGhqeVc2ZXJoQ2RZejUzNTdXdzdNVzdWY3BoOXRNUzI5amhE?=
 =?utf-8?B?SXVWYW9GOXk3WnFMNS9mcmNLT0xmalpWWmFkUFdka3prVjR2aEhZZ05JQlNJ?=
 =?utf-8?B?RitlSDJHQlBnSHJCd2JQOXdyOUg3dktZWkJ2bVltOGtIdmFLM0p1VVM0N1RT?=
 =?utf-8?B?Njg5RmR1QUp2dS9xam1pV2VROGpmSmFXRVBKUjE2WHM1UVJHMFFSOXFiR0V5?=
 =?utf-8?B?WERud3FUYlg5dSs2OFJlNzBmSDlEZGhTMU41enVJL0x0VlI4b2dkQTVqbkFR?=
 =?utf-8?B?MlFHUVUrR29GRlpEVUdDQVpMRmJwMEoxdTIza2ZFOE1UVnJjMllMTDcwQlpn?=
 =?utf-8?B?MVB3dkM2WDFRSVFIbUJobTdSSTFQNDBBcTlnakU1MzJKSCt5a2NlNk9CcWI3?=
 =?utf-8?B?eUhjbUlzd09KcGJhY244dUF1azdzUGFwVFl4QlZQYTgraHJEaGdnRzlldzkz?=
 =?utf-8?B?WEl5Z01hQmpDRjZaaWJ6b2dZdU9jaGZkNHE4MVAvcFNxYitYUG43a0xhL0Zq?=
 =?utf-8?B?cGpodkNMajc5L3JzeEo2SlkxdmNlVHd2L2NVYlJyVVpjVHBrK1hGSHVSL0FC?=
 =?utf-8?B?L1cxWW9pYWdseE91YmZUOThVTjNVeFMvQUd5T3pQNVp3d3cydzRNcTVvNlc1?=
 =?utf-8?B?MmZ5ekgrcWQyR1p4V2MrMEtLNnVRd0p2c0RoaGx4NkFyZERhU3NTZVJIbVF4?=
 =?utf-8?B?Y1NzVGVwenNqTlV1bkVBNUpsM3BSOVJhVklGcEtrRVc0QngxcjJ1U2N5MHkw?=
 =?utf-8?B?ZWhrSVlpQnZ0T0EyaDZJVURJbU1Jbi81Qzl4K3lHd3h6YnJneGhpK29CT096?=
 =?utf-8?B?Y0FrS1V5Nk5HT3VMK3FlVDA1REgwMmhheGdqWUFkVDBJWngyc0F5RlZHNWp6?=
 =?utf-8?B?d1RzVmVQdzFPUmc2YW9UdzZLeEtwa1EwUldzNVpxVGxnVU9RdldUcXZNenV4?=
 =?utf-8?B?ZVd0ZGRCb2p5cmpLc3BQcnpEZ1BOcm1PeVczOVNsTGJjc2czMFJjTWpIL09N?=
 =?utf-8?B?T09pang3TWl4VnA3L3lvTjZVQ29PQkR4c1FoOUlrODMyY3IxMWRrUTVheVhT?=
 =?utf-8?B?Vkd3M2lSU1Y2bk1YMzk0RlUyNUxzNGxyZmdVU2ZOdlhKT3RkYkpuSzd0cDRY?=
 =?utf-8?B?UGFvTnhQb1FiVVdmcDhGdWJiZ2pNUTRaVzlOOGRrZGRWMXR1Mmo3UUo3cnJL?=
 =?utf-8?B?RXhTejcrdmZhSXZZcXA0VFlFT0RnSUZBdWV6L2g4VkI1VmJtaU1MbEg0VmRK?=
 =?utf-8?B?UXcyRG1KWjhiQ0c5S1JvQ3ZEV29WRHJrQVJaMmZqQUVpbXBmSHprU0VvbElq?=
 =?utf-8?B?QnREdVJLYlUwK1BqWktHNW1iUkd6SG9sY3Y4NXR2SnhlaHlKRVpSYTFvOG5v?=
 =?utf-8?B?dkFERmF2QlFVK1o5TVo5QThwcENNaklxWXZERURNdnduOTAwbjdaOFVKL0J4?=
 =?utf-8?B?bHJWc3hsQ3YvcmMxSXV6dWd3bm85NSt6djRPem5nSGplV0JUSnNCUlZpOURJ?=
 =?utf-8?B?NGxVT0F6N1VFZXlCblRFLzNNeWFtU3YvdW04YzJJWEUreEFUVXFnV1ZPS2pE?=
 =?utf-8?B?VktFUGhWNnpnZjc2YUdvL0l0Y2d1RWx1cUIvaThoZ1MwWG9JMm9IdWgrdGNq?=
 =?utf-8?B?RjJZTkFvTUpZVit6eEdYSzNFaTZZRzRlcDNobTFOdnQ2cG5zNERSZzhOSWE5?=
 =?utf-8?B?R2QzUkhFWXZtRXBXUVlTaTZoay9YMEI5dW8zNDVEM01RV29xMmZxTUZCYXZI?=
 =?utf-8?B?RTZNcUhoV1pvcW4vaDNSYTFHaXZlZE03VEQ5OXB6bGl2VXEwSUEvNG5XWlNW?=
 =?utf-8?B?UWFKM0JHeDM4UmI2SURVR29OOThXSmltUjFtZ0xISm5EZlRRTFZ6VHZacllT?=
 =?utf-8?B?bUNXdWlUZEVpS1RaV2VEMHgwQnRBYzBhenp2Ykt1OWMrZUd5SVI3U0tZTTV3?=
 =?utf-8?B?Sjl1Zkl4YW0xdjJ6VWJsREtGbUU1b3pjQWx0YVFsd2NKTElHSlRydy85VW1N?=
 =?utf-8?B?Tnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47aab1ac-aa31-4898-38f1-08dcdf1ce81d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 17:50:42.9404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C2fgbHJBEijwmNiNjLYxaJrAV5GtrVA1fYHyDkKmgKeokdw4MrCbvH/nteMkANlgImgASsuTnlQv6SwPt12y6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6775
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



On 27-09-2024 00:25, Rodrigo Vivi wrote:
> On Mon, Sep 23, 2024 at 12:45:18PM -0700, John Harrison wrote:
>> On 9/20/2024 07:48, Jani Nikula wrote:
>>> On Fri, 20 Sep 2024, Badal Nilawar <badal.nilawar@intel.com> wrote:
>>>> Do not review
>>> Explanation would go here.
>>>
>>> [CI] Usually means everything's reviewed, and this is just a resend for
>>> CI. And there's no need to resend multiple times for that. Patchwork has
>>> a "test again" button.
>>>
>>> Finally, the patches are missing your Signed-off-by.
>>>
>>> BR,
>>> Jani.
>> I think the intention here is to just get extra CI runs with more debug
>> output to debug a failure that is only happening inside CI and cannot be
>> reproduced locally. Although it is generally simpler/clearer to just squash
>> the patches down into a single "Add extra debug for CI failures" patch
>> rather than re-submitting an entire series.
>>
>> Of course, the ideal would be to actually get all this extremely useful
>> stuff merged and then it wouldn't need to be reposted over and over to get
>> more CI results with it enabled.
> 
> yeap, the lack of try-bot in xe side. But yes, next time please squash them all...

Sure, I will squash the patches from next time.

Regards,
Badal
> 
>>
>> John.
>>
>>
>>>
>>>> John Harrison (10):
>>>>     drm/xe/guc: Remove spurious line feed in debug print
>>>>     drm/xe/devcoredump: Use drm_puts and already cached local variables
>>>>     drm/xe/devcoredump: Improve section headings and add tile info
>>>>     drm/xe/devcoredump: Add ASCII85 dump helper function
>>>>     drm/xe/guc: Copy GuC log prior to dumping
>>>>     drm/xe/guc: Use a two stage dump for GuC logs and add more info
>>>>     drm/xe/guc: Dead CT helper
>>>>     drm/xe/guc: Dump entire CTB on errors
>>>>     drm/xe/guc: Add GuC log to devcoredump captures
>>>>     drm/xe/guc: Add a helper function for dumping GuC log to dmesg
>>>>
>>>> Michal Wajdeczko (1):
>>>>     drm/print: Introduce drm_line_printer
>>>>
>>>> bnilawar (1):
>>>>     [For CI] Debug prints/logs to debug G2H timeout issue
>>>>
>>>>    drivers/gpu/drm/drm_print.c                   |  14 +
>>>>    .../drm/xe/abi/guc_communication_ctb_abi.h    |   1 +
>>>>    drivers/gpu/drm/xe/regs/xe_guc_regs.h         |   1 +
>>>>    drivers/gpu/drm/xe/xe_devcoredump.c           | 144 +++++-
>>>>    drivers/gpu/drm/xe/xe_devcoredump.h           |   6 +
>>>>    drivers/gpu/drm/xe/xe_devcoredump_types.h     |  13 +-
>>>>    drivers/gpu/drm/xe/xe_device.c                |   1 +
>>>>    drivers/gpu/drm/xe/xe_guc.c                   |   6 +-
>>>>    drivers/gpu/drm/xe/xe_guc_ct.c                | 416 ++++++++++++++----
>>>>    drivers/gpu/drm/xe/xe_guc_ct.h                |  10 +-
>>>>    drivers/gpu/drm/xe/xe_guc_ct_types.h          |  29 +-
>>>>    drivers/gpu/drm/xe/xe_guc_log.c               | 208 ++++++++-
>>>>    drivers/gpu/drm/xe/xe_guc_log.h               |   5 +
>>>>    drivers/gpu/drm/xe/xe_guc_log_types.h         |  27 ++
>>>>    drivers/gpu/drm/xe/xe_guc_submit.c            |   2 +-
>>>>    drivers/gpu/drm/xe/xe_hw_engine.c             |   1 -
>>>>    include/drm/drm_print.h                       |  64 +++
>>>>    17 files changed, 804 insertions(+), 144 deletions(-)
>>


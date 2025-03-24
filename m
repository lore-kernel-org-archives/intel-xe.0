Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69C4C3600B
	for <intel-xe@archiver.kernel.org>; Mon, 24 Mar 2025 14:37:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4AE810E41A;
	Mon, 24 Mar 2025 14:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WTyxwjeI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015CE10E41A
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Mar 2025 14:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742827037; x=1774363037;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1eQgXs3UzX1V8JBwk1yIpuAmAtpgzu1NPzOOi2hVr9Y=;
 b=WTyxwjeI9k/Gren1aoaZcdPAPP5Zk8bzsQfEigxIqKyVp4qdgDclr6vY
 NVnJoxi+1AOHK/mp/t1HLmgba5bRSP89JsCiy+7Nl2h1hToJq9tv1+/xG
 upmU/WhO4CL19USxKuRtWHVdKWB9MVAjfUYF92sq3AvpTU1GVhZSf4IMO
 s+ur24IWtfOhZDmRyvXpWixKz9rJ7YHJ15Kjf5Py9OzvgDIT/gESl5FGj
 bpQbxHmdNN/0znxcs3xKreUOuxaXQridiVhdr/g0MeBWYfVIALlfd2vSa
 UWSTg4pPDwwDKkarXE/pTxuiJEawcSexdAzSiaR1oApqJzj+3klrfFrgL A==;
X-CSE-ConnectionGUID: rIzOlXS2QbiepMTAZ9TL3A==
X-CSE-MsgGUID: dxcJYumLQ4+UdZb+K9OR6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="54698980"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="54698980"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 07:37:16 -0700
X-CSE-ConnectionGUID: CppCKIwuQj68U+qezwub3w==
X-CSE-MsgGUID: yVLdvv7bSbyp7qfszEntvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="129258064"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 07:37:17 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Mon, 24 Mar 2025 07:37:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 24 Mar 2025 07:37:16 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Mar 2025 07:37:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m0AgGIQZDeAG1abYEZVZDmSK2xHbha9NPfdYqFhwI3Rt5tHHA7cJZuTt4+Cpu6R6mW+UsbRRv8PNaRkxRbkL/0euT1aa3k5S6xFR6MGBk9XthEyI3JEgNkdS9ZYL1EXMtvh1AuWk/1fvrtdDUNteB1EXQKOZHOEn3NitzespYXJNZdRZAMgCOEPClg7aPw9Xw7Lf5DiQ3auiwsVeQh+KviIb4Pvefg00IvfcLmvZF1eRKQqtt2SNumJT6si22O+ZRc6fRDx5DU8fDymFnJITJNKLYIku8GTvlNO1ZpggtAlDHVgHs9g8P8qy2FQtr1fZW4GbeOUMsumvbfrzGBS0HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMDXhA/z8yblzrDd5ZBKed2TjnvdoyQ/00kj8GzITMs=;
 b=OQpwKPyu10d9KdIX3tYVZ/83QDFLMVAdTTDbQ/X/czraMQaxeEUmGLn2eiOhn+TkrHX7J9P/01iSv46jM0i7hsc2sn1JFgjXgPzyLHTirz/9kcANvKtN9x3C4hmAzp+127ZcIgJqDJ9YD4XLsuqV0mWy9L/NmU5ClSxxDTe8bJOiT70eKZ3WiPaY+K/e6mDwHSmRiCprlTbnNgZS7Mb5dGdv95cQWXZDA8JMFBGF1qgMNOc75glEPMEDNJuzue8G4pokbsgyDB6eMxxoKkoT34kZK5MMTaA21ee7Tlitu3x20hfoPXODU/l3kDfizAqp97mL743XsfVZXx8Yb3bXHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH8PR11MB8260.namprd11.prod.outlook.com (2603:10b6:510:1c3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 14:37:10 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 14:37:10 +0000
Date: Mon, 24 Mar 2025 10:37:04 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Francois Dugast <francois.dugast@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?=
 =?utf-8?Q?re_for_drm=2Fxe=2Fhw=5Fengine=5Fclass=5Fsysfs?= =?utf-8?Q?=3A?=
 Allow to inject error during probe (rev2)
Message-ID: <Z-FuEPOop3bZUjY3@intel.com>
References: <20250314105050.636983-1-francois.dugast@intel.com>
 <174198921965.37342.16553574591723215462@18a75f3d1eae>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <174198921965.37342.16553574591723215462@18a75f3d1eae>
X-ClientProxiedBy: MW4PR03CA0360.namprd03.prod.outlook.com
 (2603:10b6:303:dc::35) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH8PR11MB8260:EE_
X-MS-Office365-Filtering-Correlation-Id: 19ab9eb5-89b6-473d-376d-08dd6ae15b58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVZGNzFUdUVEUU9ZemN1dnEvR2hWbVNjYUtUa3h6b0dQU21xeFVGWnovTHYw?=
 =?utf-8?B?ampzRldZWHZ2MkFUQWtwQlByTEhINEVQMktERnBXTWc2TGtBUE5Eblp5bDRa?=
 =?utf-8?B?VlN2SFFBcFRPWkJhaWFSQ0pTMlRXRWxIelM3eFpMVUZNZXMvWlh5VkdCVm0r?=
 =?utf-8?B?d0N6bEUzZDBzeTlnN0F0NXo2Qk81YjFUT1kxeFZvZXRBWStXMnJzQU1ZdnU5?=
 =?utf-8?B?YWhVMmh0SUljQjZ3MllaeXpsMmhWcFBMM0orbzFvR2F6UzRNNGpQckZndXFv?=
 =?utf-8?B?cElPVjhQME5qQ2szQnNyS1JvRFp6b2tORUdUSXczMGQvQXZ3SFRNNXdMRVZ3?=
 =?utf-8?B?MmtPQVFzekh3ZlVLUldzaHBUYXRXYWNIOWFrNWFGUEJqQk4reHBWZXV0cFNu?=
 =?utf-8?B?VWNlTktVUVUrcDVZZmlxc1RQektnaFdnZHdSWTBCcEcwNXBTam9XS3BaSk5I?=
 =?utf-8?B?VUtpTitoOU9pM1Bhem5RUnIrbzdPZmVqRUtLcHRYUU1qbm83a05kb2xTeU55?=
 =?utf-8?B?OHNYb0lMdzR5VGNEZFlDNjcwUjBxQjBISmVZODlJUTNLbVdSNlN5L0VOYnBm?=
 =?utf-8?B?VlVjUlBuOC9rWHE3eWVMbjY3S3hhY3F2WnZxV2FudVoyWEo3RGNrbmVzSTZt?=
 =?utf-8?B?aGdmRi9NWVBlaktmTTJ0d0pVSzJJQW1OZ1FoYWl5YUljUjhpNUpPQmRPTnA5?=
 =?utf-8?B?bGF3U2c2RkxvMm9jaE1pcFQ1ekxSQ2ZrbnlTZ1NJemRDYjlpcXR6ZDhUUWdi?=
 =?utf-8?B?M29rRkhxcndZbnlhZ3dRd0hIMW9pWVM0RDc1TTkvU2VoejhyVVYzdjE1SnZJ?=
 =?utf-8?B?S284WnJFS1VmSjhwU1hKY0tIY3lNdDUyNnpaRktkeEh4WWNlSWkwb1BZWlph?=
 =?utf-8?B?ZGo4RVFPMEJHNWNDQ1pBVUNRTHlqYlJXVG4zbEdCQ0E1UlN2REF2OVVITWI4?=
 =?utf-8?B?ZzJVME5sU2ZxNkx3SjN1S1EvNnllZ0dKV2d2Q3g4ZDVqZkQ0OURwc1g1c1Yr?=
 =?utf-8?B?QVZLQWRpbXV5Z1NtSE1rNWx0ZjB6dXBqZTdjUmp5eE13UGxmUktTTVJxZ3NF?=
 =?utf-8?B?WFVWTnhRa1QwNllwSmwzUnhsNXF3SlBWdXdRMWtvMW1YL0hoM3VQNXJjOUc3?=
 =?utf-8?B?TG9KRWNOMkUwN2FOM0ZqTzdualQrbXZJTjlMZ0toQm9RaDQ1UDRyOVhWS2ZH?=
 =?utf-8?B?ZHYzdmFJajhRMGQxdGdydDZiVkZWOXY1dzNISWFpZ1hUWnRnRWpjaW0rb1hD?=
 =?utf-8?B?SXhZQjNOcXozS2JUYUlMRkZ1U0UwS1JBOGhIdWJqKzIyckR1cUdmTVM5TEVR?=
 =?utf-8?B?bU5rK3FIcWpDRkxJWldhSXY1akZ6Y0lpVko5aDRFc1dERUNRVWlqWnB5Unpw?=
 =?utf-8?B?MStkNDY4NWZOWTlWV0ZGVVhBbzlCTTlZYUwxYjl0dkJXdENCWklucStpWG9E?=
 =?utf-8?B?ZTNRcVR0TmxqakVHYWlMMHhEbms3VkhNNHRyblJLUWZDSVRzVG1PaU1VTWo3?=
 =?utf-8?B?VGFFWUdJUWpJZDJqVCtJRWlzUXk5L1E0Umt1VjBRNzEyQ2x0SmUvU3RWZktI?=
 =?utf-8?B?ODZMbGJuVjZ5UVAwdDN5c2lxOEFhUUZNV2VxRFZ5VzhDU0pyVVFPYVB3bm9W?=
 =?utf-8?B?MkZGeGhmaWZpNnhzRFN5eXFBTVpaT212Vy82T2FLaGpYUitsVW4ydmNCV2Vj?=
 =?utf-8?B?QTVaVUdxVUdPVmRTSG1COGJ4MTVLeUZ1dUdjV3luSXNMZng1UHFrRytVaUdi?=
 =?utf-8?B?OTUybGtSMDluK1JJR3NiUTBiSkhFVHBDT0h3QzYrR2hCR0NsUXBqd1d2dTB1?=
 =?utf-8?B?blkxY2s5Umc1L0VvVmFEZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2dTM3BVZ3lpMEM4QnRDUXB4QnNuNVBjVExrajl4TllkeW1ZMlFkb0JCMnRo?=
 =?utf-8?B?MFcrUzB5VmZzdGZoR0YxMFRBaDZIM0M2TUNwU0wxSURDRWkxbHh3TUJHTlE2?=
 =?utf-8?B?YnNNWW1LL2J3aTBueXdGZUtqYkdPTTQvWXFOak84S2NpeDBVOFZlNlJ1cUh5?=
 =?utf-8?B?TC9vaUtZL1FMTU1YVXFrWDk5ZEJleXZIcU9CUG1JUU5VeG41OFBRVzdHNWlU?=
 =?utf-8?B?Wm8zOThYYy9FQUcyaGtBSDZUVjUvSGI3QnhPR1Z2TC96MHBsa2ozOUEvU0pr?=
 =?utf-8?B?VlFjQk1zQzZUcyswejBkUEFHMEZpa0RlNjlPaDJkMkVpN0tOSytSMys5bnhq?=
 =?utf-8?B?Vm5La05qN1JHOVNHYTNTYnhxYmcwL2Q3bVZ1dGJkM25OY05WeG8vRjNHWjUv?=
 =?utf-8?B?NWI4OHB1amRzZUNySmx3RThqblNwczFldWdpRFpXN21xaXNWZW01aXdQb1dV?=
 =?utf-8?B?aUtQNTE5L1ByRzNUblltZTY0ZGdhRHJzMUluTjQrTytwSmsxamdvU1BnMWJh?=
 =?utf-8?B?Ky95Z2NJY1h4NytFeW91OE9yNUVZU2ZPMUJReHREd1dkQ3dsSWRZK3FhdFBq?=
 =?utf-8?B?ajFDQnA1OE1TUk1XbUlGdExVd3hRR1RTOGVZTEVsN3ZLUGRYYnpqbnVFTjQ3?=
 =?utf-8?B?ZkVDSytMaHJzdGJpNnpmQytUZ2FDSkhzNEN3RklBYkYwblZTbG9wY1ZlR2RQ?=
 =?utf-8?B?WWMxMmorRGNjNmhHejVRamt4VmNaNDZhUDVlQ0pTeElISkxnbDI5d05Xbklv?=
 =?utf-8?B?YkN5WXcwMnlZc0RQK3hKYUZFTkhLTWwrdWQrdW4yRHBKL2lNbXFiUk5aUXlu?=
 =?utf-8?B?Uit2ajgvMkpRbW9mSlozY3Z5SG82SmxDNytEaEhvd0t5OG0wUGJtUUx1M1pF?=
 =?utf-8?B?SEtKRHY4SkNtaEJMTEtsZFZaRktIUXdlanNGakcvdWlaYXdJbUlSOWNTVDlG?=
 =?utf-8?B?ZzdTTG5lN0dvYkU5WHJJaExSdmMwZUN6aktxRC9aUEgwWkFHbVd6L1QzV1px?=
 =?utf-8?B?MS91RHBIUnl2MGNkcmdkMDU2azVFYnJmSXVKS0VyWTVGKzBlQ3JuMXBkaWda?=
 =?utf-8?B?OTkySkwwTVNNR1hyWFhBaHp4emVUTEZOVVlNOXAzNXB4V1hCOXZJbVJFWHIz?=
 =?utf-8?B?NDhDSjNGNGVPZUhUb1NnQVZKZ2NEZk5jaTBSbmhqK0EyYjFzRm04WmMyMlh5?=
 =?utf-8?B?ZVVxL1FHZ0FRT2RhK0VFN294cGFxd2ZhdVgyTyswWmppQ2o3U09wY2pNM294?=
 =?utf-8?B?VWh4ZDJvak9kUU9xZmZmeWVyUjVKT2s3UFFxQWxmeTFFcm5PaEkxeFpvc2lu?=
 =?utf-8?B?Q0pQeUplZnVqUks0ejBkcUNRM1VNSnVQaVFKUWdXMjg3b1JHVmlXV1c0VUpo?=
 =?utf-8?B?cjAzblkzVTBIaVViMU5VWEtaanlnSDBjOXJ2V3ViNEFKQS9pTk40Zkhidlk5?=
 =?utf-8?B?OFNWSndsVkVjSlIrNDB0bGcvNHNTM2FSSXlXVEViUWNYb2RnSmowYnVlU096?=
 =?utf-8?B?ZVlqZHdsVFowS2czRWJPNzRQa1JYM1FyTHRiL3ZISFpZSCs2c3F1cHIva0hL?=
 =?utf-8?B?akRNR2JPNXRxSEJTYVczQ1ZqYThnZi9qODhiVWR0cHo2ejVwZE84WmJITVJP?=
 =?utf-8?B?dUxWUENndkFFNExidStyaVJxbVBqRE1LM1d5SlpOWWFvSE8ycGVCaUMzMStp?=
 =?utf-8?B?RlBNOTlXYldHRCtkZWpOck8vaW5uQ1Y5bGY4bEhOWE9nV1h1dm5PblBGTzky?=
 =?utf-8?B?dDJJKzdMZmNVVXdNVGthZVgzTU5qd3owS1FGczhYQnhOWkh4U2VRZmU2VGt0?=
 =?utf-8?B?QSt4Qm5VTXZ0NVcrOWgzdGd2Y3VBZldqZk1OY25nU2hyUVRSUmd3TU1JcTV0?=
 =?utf-8?B?SmliVHRNLzdzVjlkVWU3WjdVdm8xUGVFdy95MDhOd1d1NFdqZGpIKzBMbUpl?=
 =?utf-8?B?V2hQQUIrbU55L2JSV1NqeFYxRGNJYjh4UDRBTnB6Z1RCVzZreUFkZlh6bG9h?=
 =?utf-8?B?M29lekRHOS9Rd3hkODV5L29GMlV5dzlBT00vM2ZhL2VQenVJRzRHclhXbEpx?=
 =?utf-8?B?WkdLT1RIbjZVa0ZlaHVQT1ozZVpRN2NGa0tsZWcxRDFjcUU1dFl6cFBSUG5M?=
 =?utf-8?B?S1oyVTgyRk5KVTIxNGNMNlAwbjZUaFhmZ2dpd2tReTJJUzd6dEtZQlA1LytX?=
 =?utf-8?B?UHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19ab9eb5-89b6-473d-376d-08dd6ae15b58
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 14:37:10.4753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oCowusr4spkdG3S0jV4oFx8zdY7IbtjZF89UayZ4eOdkI5ada2j+GrOQKVebDvgD7jUqSg/QES3CkV6oFL+zVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8260
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

On Fri, Mar 14, 2025 at 09:53:39PM -0000, Patchwork wrote:
>    Patch Details                                                                
>                                                                                 
>  Series:  drm/xe/hw_engine_class_sysfs: Allow to inject error during probe      
>           (rev2)                                                                
>  URL:     [1]https://patchwork.freedesktop.org/series/146307/                   
>  State:   failure                                                               
>  Details: [2]https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/index.html
>                                                                                 
> CI Bug Log - changes from xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e_full 
>                              -> xe-pw-146307v2_full                             
>                                                                                 
> Summary                                                                         
>                                                                                 
>    FAILURE                                                                      
>                                                                                 
>    Serious unknown changes coming with xe-pw-146307v2_full absolutely need to   
>    be                                                                           
>    verified manually.                                                           
>                                                                                 
>    If you think the reported changes have nothing to do with the changes        
>    introduced in xe-pw-146307v2_full, please notify your bug team               
>    (I915-ci-infra@lists.freedesktop.org) to allow them                          
>    to document this new failure mode, which will reduce false positives in      
>    CI.                                                                          
>                                                                                 
> Participating hosts (4 -> 4)                                                    
>                                                                                 
>    No changes in participating hosts                                            
>                                                                                 
> Possible new issues                                                             
>                                                                                 
>    Here are the unknown changes that may have been introduced in                
>    xe-pw-146307v2_full:                                                         
>                                                                                 
>   IGT changes                                                                   
>                                                                                 
>     Possible regressions                                                        
>                                                                                 
>      • igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a2-dp2:                       
>           • shard-dg2-set2: NOTRUN -> [3]FAIL +2 other tests fail               

If we stop considering NOTRUN -> FAIL we shall get a greener full CI!

patch pushed to drm-xe-next, thanks for the patch and reviews!


>                                                                                 
> Known issues                                                                    
>                                                                                 
>    Here are the changes found in xe-pw-146307v2_full that come from known       
>    issues:                                                                      
>                                                                                 
>   IGT changes                                                                   
>                                                                                 
>     Issues hit                                                                  
>                                                                                 
>      • igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-3:  
>                                                                                 
>           • shard-bmg: [4]PASS -> [5]INCOMPLETE ([6]Intel XE#2613) +1 other     
>             test incomplete                                                     
>      • igt@kms_big_fb@linear-64bpp-rotate-90:                                   
>                                                                                 
>           • shard-bmg: NOTRUN -> [7]SKIP ([8]Intel XE#2327) +1 other test       
>             skip                                                                
>      • igt@kms_big_fb@y-tiled-16bpp-rotate-0:                                   
>                                                                                 
>           • shard-bmg: NOTRUN -> [9]SKIP ([10]Intel XE#1124) +5 other tests     
>             skip                                                                
>      • igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:                
>                                                                                 
>           • shard-dg2-set2: [11]PASS -> [12]SKIP ([13]Intel XE#2191)            
>           • shard-bmg: [14]PASS -> [15]SKIP ([16]Intel XE#2314 / [17]Intel      
>             XE#2894)                                                            
>      • igt@kms_bw@linear-tiling-1-displays-1920x1080p:                          
>                                                                                 
>           • shard-bmg: NOTRUN -> [18]SKIP ([19]Intel XE#367)                    
>      • igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2:               
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [20]SKIP ([21]Intel XE#787) +80 other     
>             tests skip                                                          
>      • igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:         
>                                                                                 
>           • shard-bmg: NOTRUN -> [22]SKIP ([23]Intel XE#2652 / [24]Intel        
>             XE#787) +3 other tests skip                                         
>      • igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-dp-4:                 
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [25]SKIP ([26]Intel XE#455 / [27]Intel    
>             XE#787) +14 other tests skip                                        
>      • igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:                            
>                                                                                 
>           • shard-bmg: NOTRUN -> [28]SKIP ([29]Intel XE#3432) +1 other test     
>             skip                                                                
>      • igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:                              
>                                                                                 
>           • shard-bmg: NOTRUN -> [30]SKIP ([31]Intel XE#2887) +7 other tests    
>             skip                                                                
>      • igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:       
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [32]INCOMPLETE ([33]Intel XE#1727 /       
>             [34]Intel XE#3113 / [35]Intel XE#3124)                              
>      • igt@kms_cdclk@mode-transition@pipe-a-dp-2:                               
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [36]SKIP ([37]Intel XE#4417) +3 other     
>             tests skip                                                          
>      • igt@kms_cdclk@plane-scaling@pipe-b-dp-4:                                 
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [38]SKIP ([39]Intel XE#4416) +3 other     
>             tests skip                                                          
>      • igt@kms_chamelium_color@ctm-red-to-blue:                                 
>                                                                                 
>           • shard-bmg: NOTRUN -> [40]SKIP ([41]Intel XE#2325) +1 other test     
>             skip                                                                
>      • igt@kms_chamelium_hpd@common-hpd-after-suspend:                          
>                                                                                 
>           • shard-bmg: NOTRUN -> [42]SKIP ([43]Intel XE#2252) +4 other tests    
>             skip                                                                
>      • igt@kms_content_protection@content-type-change:                          
>                                                                                 
>           • shard-bmg: NOTRUN -> [44]SKIP ([45]Intel XE#2341) +1 other test     
>             skip                                                                
>      • igt@kms_content_protection@legacy:                                       
>                                                                                 
>           • shard-bmg: NOTRUN -> [46]FAIL ([47]Intel XE#1178) +1 other test     
>             fail                                                                
>      • igt@kms_content_protection@srm@pipe-a-dp-2:                              
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [48]FAIL ([49]Intel XE#1178)              
>      • igt@kms_content_protection@uevent@pipe-a-dp-4:                           
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [50]FAIL ([51]Intel XE#1188)              
>      • igt@kms_cursor_crc@cursor-rapid-movement-max-size:                       
>                                                                                 
>           • shard-bmg: NOTRUN -> [52]SKIP ([53]Intel XE#2320) +3 other tests    
>             skip                                                                
>      • igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:        
>                                                                                 
>           • shard-bmg: NOTRUN -> [54]SKIP ([55]Intel XE#2286)                   
>      • igt@kms_cursor_legacy@cursora-vs-flipb-atomic:                           
>                                                                                 
>           • shard-bmg: NOTRUN -> [56]SKIP ([57]Intel XE#2291)                   
>      • igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:  
>                                                                                 
>           • shard-bmg: [58]PASS -> [59]SKIP ([60]Intel XE#2291) +3 other        
>             tests skip                                                          
>      • igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:                           
>                                                                                 
>           • shard-dg2-set2: [61]PASS -> [62]SKIP ([63]Intel XE#309) +4 other    
>             tests skip                                                          
>      • igt@kms_dither@fb-8bpc-vs-panel-6bpc:                                    
>                                                                                 
>           • shard-bmg: [64]PASS -> [65]SKIP ([66]Intel XE#1340)                 
>      • igt@kms_dp_link_training@non-uhbr-mst:                                   
>                                                                                 
>           • shard-bmg: NOTRUN -> [67]SKIP ([68]Intel XE#4354)                   
>      • igt@kms_dp_link_training@non-uhbr-sst:                                   
>                                                                                 
>           • shard-dg2-set2: [69]PASS -> [70]SKIP ([71]Intel XE#4354)            
>      • igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:             
>                                                                                 
>           • shard-bmg: NOTRUN -> [72]SKIP ([73]Intel XE#4422)                   
>      • igt@kms_feature_discovery@dp-mst:                                        
>                                                                                 
>           • shard-bmg: NOTRUN -> [74]SKIP ([75]Intel XE#2375)                   
>      • igt@kms_flip@2x-blocking-wf_vblank:                                      
>                                                                                 
>           • shard-dg2-set2: [76]PASS -> [77]FAIL ([78]Intel XE#886)             
>      • igt@kms_flip@2x-flip-vs-absolute-wf_vblank:                              
>                                                                                 
>           • shard-dg2-set2: [79]PASS -> [80]SKIP ([81]Intel XE#310) +8 other    
>             tests skip                                                          
>      • igt@kms_flip@2x-flip-vs-blocking-wf-vblank:                              
>                                                                                 
>           • shard-bmg: NOTRUN -> [82]SKIP ([83]Intel XE#2316)                   
>      • igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:     
>                                                                                 
>           • shard-dg2-set2: [84]PASS -> [85]FAIL ([86]Intel XE#301 /            
>             [87]Intel XE#3321)                                                  
>      • igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:     
>                                                                                 
>           • shard-bmg: NOTRUN -> [88]FAIL ([89]Intel XE#3321) +5 other tests    
>             fail                                                                
>      • igt@kms_flip@2x-nonexisting-fb:                                          
>                                                                                 
>           • shard-bmg: [90]PASS -> [91]SKIP ([92]Intel XE#2316) +10 other       
>             tests skip                                                          
>      • igt@kms_flip@flip-vs-suspend:                                            
>                                                                                 
>           • shard-lnl: [93]PASS -> [94]DMESG-WARN ([95]Intel XE#2932) +1        
>             other test dmesg-warn                                               
>      • igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-valid-mode:
>                                                                                 
>           • shard-adlp: [96]PASS -> [97]DMESG-WARN ([98]Intel XE#4173) +1       
>             other test dmesg-warn                                               
>      • igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:   
>                                                                                 
>           • shard-bmg: NOTRUN -> [99]SKIP ([100]Intel XE#2293 / [101]Intel      
>             XE#2380) +1 other test skip                                         
>      • igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:
>                                                                                 
>           • shard-bmg: NOTRUN -> [102]SKIP ([103]Intel XE#2293) +1 other test   
>             skip                                                                
>      • igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:           
>                                                                                 
>           • shard-adlp: [104]PASS -> [105]DMESG-FAIL ([106]Intel XE#4543) +2    
>             other tests dmesg-fail                                              
>      • igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:           
>                                                                                 
>           • shard-adlp: [107]PASS -> [108]FAIL ([109]Intel XE#1874) +1 other    
>             test fail                                                           
>      • igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:     
>                                                                                 
>           • shard-bmg: NOTRUN -> [110]SKIP ([111]Intel XE#2311) +11 other       
>             tests skip                                                          
>      • igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:           
>                                                                                 
>           • shard-dg2-set2: [112]PASS -> [113]SKIP ([114]Intel XE#656) +8       
>             other tests skip                                                    
>      • igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:      
>                                                                                 
>           • shard-bmg: NOTRUN -> [115]SKIP ([116]Intel XE#4141) +4 other        
>             tests skip                                                          
>      • igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:       
>                                                                                 
>           • shard-bmg: NOTRUN -> [117]SKIP ([118]Intel XE#2312) +10 other       
>             tests skip                                                          
>      • igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:      
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [119]SKIP ([120]Intel XE#656) +1 other    
>             test skip                                                           
>      • igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:                    
>                                                                                 
>           • shard-bmg: NOTRUN -> [121]SKIP ([122]Intel XE#2313) +10 other       
>             tests skip                                                          
>      • igt@kms_hdr@invalid-hdr:                                                 
>                                                                                 
>           • shard-bmg: NOTRUN -> [123]SKIP ([124]Intel XE#1503)                 
>      • igt@kms_joiner@basic-max-non-joiner:                                     
>                                                                                 
>           • shard-bmg: NOTRUN -> [125]SKIP ([126]Intel XE#4298)                 
>      • igt@kms_pipe_stress@stress-xrgb8888-ytiled:                              
>                                                                                 
>           • shard-bmg: NOTRUN -> [127]SKIP ([128]Intel XE#4329)                 
>      • igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [129]SKIP ([130]Intel XE#2763) +2 other   
>             tests skip                                                          
>      • igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [131]SKIP ([132]Intel XE#2763 /           
>             [133]Intel XE#455) +1 other test skip                               
>      • igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:  
>                                                                                 
>           • shard-bmg: NOTRUN -> [134]SKIP ([135]Intel XE#2763) +14 other       
>             tests skip                                                          
>      • igt@kms_pm_backlight@bad-brightness:                                     
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [136]SKIP ([137]Intel XE#870)             
>      • igt@kms_pm_backlight@fade-with-suspend:                                  
>                                                                                 
>           • shard-bmg: NOTRUN -> [138]SKIP ([139]Intel XE#870)                  
>      • igt@kms_pm_rpm@modeset-non-lpsp-stress:                                  
>                                                                                 
>           • shard-dg2-set2: [140]PASS -> [141]SKIP ([142]Intel XE#836)          
>      • igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:                 
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [143]SKIP ([144]Intel XE#1489)            
>      • igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:                   
>                                                                                 
>           • shard-bmg: NOTRUN -> [145]SKIP ([146]Intel XE#1489) +4 other        
>             tests skip                                                          
>      • igt@kms_psr@psr2-sprite-blt:                                             
>                                                                                 
>           • shard-bmg: NOTRUN -> [147]SKIP ([148]Intel XE#2234 / [149]Intel     
>             XE#2850) +6 other tests skip                                        
>      • igt@kms_rotation_crc@bad-pixel-format:                                   
>                                                                                 
>           • shard-bmg: NOTRUN -> [150]SKIP ([151]Intel XE#3414 / [152]Intel     
>             XE#3904)                                                            
>      • igt@kms_scaling_modes@scaling-mode-full:                                 
>                                                                                 
>           • shard-bmg: NOTRUN -> [153]SKIP ([154]Intel XE#2413)                 
>      • igt@kms_setmode@basic@pipe-b-edp-1:                                      
>                                                                                 
>           • shard-lnl: [155]PASS -> [156]FAIL ([157]Intel XE#2883) +2 other     
>             tests fail                                                          
>      • igt@kms_setmode@invalid-clone-single-crtc:                               
>                                                                                 
>           • shard-bmg: [158]PASS -> [159]SKIP ([160]Intel XE#1435)              
>           • shard-dg2-set2: [161]PASS -> [162]SKIP ([163]Intel XE#455) +1       
>             other test skip                                                     
>      • igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4: 
>                                                                                 
>           • shard-dg2-set2: [164]PASS -> [165]ABORT ([166]Intel XE#4540) +1     
>             other test abort                                                    
>      • igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4: 
>                                                                                 
>           • shard-dg2-set2: [167]PASS -> [168]DMESG-WARN ([169]Intel XE#4212)   
>      • igt@kms_vrr@lobf:                                                        
>                                                                                 
>           • shard-bmg: NOTRUN -> [170]SKIP ([171]Intel XE#2168)                 
>      • igt@kms_writeback@writeback-fb-id:                                       
>                                                                                 
>           • shard-bmg: NOTRUN -> [172]SKIP ([173]Intel XE#756)                  
>      • igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:
>                                                                                 
>           • shard-lnl: [174]PASS -> [175]FAIL ([176]Intel XE#4278) +1 other     
>             test fail                                                           
>      • igt@xe_eudebug@basic-vm-bind-metadata-discovery:                         
>                                                                                 
>           • shard-bmg: NOTRUN -> [177]SKIP ([178]Intel XE#2905) +5 other        
>             tests skip                                                          
>      • igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:                     
>                                                                                 
>           • shard-dg2-set2: [179]PASS -> [180]SKIP ([181]Intel XE#1392) +3      
>             other tests skip                                                    
>      • igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:                        
>                                                                                 
>           • shard-bmg: NOTRUN -> [182]SKIP ([183]Intel XE#2322) +2 other        
>             tests skip                                                          
>      • igt@xe_exec_fault_mode@once-rebind-imm:                                  
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [184]SKIP ([185]Intel XE#288) +1 other    
>             test skip                                                           
>      • igt@xe_module_load@force-load:                                           
>                                                                                 
>           • shard-bmg: NOTRUN -> [186]SKIP ([187]Intel XE#2457)                 
>      • igt@xe_oa@oa-tlb-invalidate:                                             
>                                                                                 
>           • shard-bmg: NOTRUN -> [188]SKIP ([189]Intel XE#2248)                 
>      • igt@xe_oa@rc6-disable:                                                   
>                                                                                 
>           • shard-dg2-set2: NOTRUN -> [190]SKIP ([191]Intel XE#2541 /           
>             [192]Intel XE#3573)                                                 
>      • igt@xe_pm@s3-d3cold-basic-exec:                                          
>                                                                                 
>           • shard-bmg: NOTRUN -> [193]SKIP ([194]Intel XE#2284) +1 other test   
>             skip                                                                
>      • igt@xe_pm@s4-mocs:                                                       
>                                                                                 
>           • shard-bmg: NOTRUN -> [195]ABORT ([196]Intel XE#4268)                
>      • igt@xe_pm@vram-d3cold-threshold:                                         
>                                                                                 
>           • shard-bmg: NOTRUN -> [197]SKIP ([198]Intel XE#579)                  
>      • igt@xe_query@multigpu-query-topology-l3-bank-mask:                       
>                                                                                 
>           • shard-bmg: NOTRUN -> [199]SKIP ([200]Intel XE#944)                  
>      • igt@xe_sriov_flr@flr-twice:                                              
>                                                                                 
>           • shard-bmg: NOTRUN -> [201]SKIP ([202]Intel XE#4273)                 
>      • igt@xe_sriov_scheduling@equal-throughput:                                
>                                                                                 
>           • shard-bmg: NOTRUN -> [203]SKIP ([204]Intel XE#4351)                 
>                                                                                 
>     Possible fixes                                                              
>                                                                                 
>      • igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:                
>                                                                                 
>           • shard-bmg: [205]SKIP ([206]Intel XE#2314 / [207]Intel XE#2894) ->   
>             [208]PASS                                                           
>      • igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:          
>                                                                                 
>           • shard-dg2-set2: [209]INCOMPLETE ([210]Intel XE#3862) -> [211]PASS   
>             +1 other test pass                                                  
>      • igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:       
>                                                                                 
>           • shard-dg2-set2: [212]INCOMPLETE ([213]Intel XE#1727 / [214]Intel    
>             XE#3113 / [215]Intel XE#4522) -> [216]PASS                          
>      • igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:                          
>                                                                                 
>           • shard-dg2-set2: [217]SKIP ([218]Intel XE#309) -> [219]PASS +4       
>             other tests pass                                                    
>      • igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:                     
>                                                                                 
>           • shard-bmg: [220]SKIP ([221]Intel XE#2291) -> [222]PASS +2 other     
>             tests pass                                                          
>      • igt@kms_display_modes@extended-mode-basic:                               
>                                                                                 
>           • shard-bmg: [223]SKIP ([224]Intel XE#4302) -> [225]PASS              
>      • igt@kms_flip@2x-blocking-absolute-wf_vblank:                             
>                                                                                 
>           • shard-dg2-set2: [226]SKIP ([227]Intel XE#310) -> [228]PASS +2       
>             other tests pass                                                    
>      • igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4:     
>                                                                                 
>           • shard-dg2-set2: [229]FAIL ([230]Intel XE#301) -> [231]PASS          
>      • igt@kms_flip@2x-wf_vblank-ts-check-interruptible:                        
>                                                                                 
>           • shard-bmg: [232]SKIP ([233]Intel XE#2316) -> [234]PASS +5 other     
>             tests pass                                                          
>      • igt@kms_flip@basic-flip-vs-wf_vblank:                                    
>                                                                                 
>           • shard-adlp: [235]DMESG-WARN ([236]Intel XE#4173) -> [237]PASS +3    
>             other tests pass                                                    
>      • igt@kms_flip@flip-vs-suspend:                                            
>                                                                                 
>           • shard-adlp: [238]DMESG-WARN ([239]Intel XE#2953 / [240]Intel        
>             XE#4173) -> [241]PASS +1 other test pass                            
>      • igt@kms_flip@flip-vs-wf_vblank-interruptible:                            
>                                                                                 
>           • shard-lnl: [242]FAIL ([243]Intel XE#3098) -> [244]PASS +1 other     
>             test pass                                                           
>      • igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:            
>                                                                                 
>           • shard-dg2-set2: [245]SKIP ([246]Intel XE#656) -> [247]PASS +2       
>             other tests pass                                                    
>      • igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:                    
>                                                                                 
>           • shard-dg2-set2: [248]FAIL ([249]Intel XE#616) -> [250]PASS +1       
>             other test pass                                                     
>      • igt@kms_pm_dc@dc6-dpms:                                                  
>                                                                                 
>           • shard-lnl: [251]FAIL ([252]Intel XE#1430) -> [253]PASS              
>      • igt@kms_setmode@invalid-clone-single-crtc-stealing:                      
>                                                                                 
>           • shard-bmg: [254]SKIP ([255]Intel XE#1435) -> [256]PASS              
>      • igt@testdisplay:                                                         
>                                                                                 
>           • shard-dg2-set2: [257]ABORT ([258]Intel XE#2705 / [259]Intel         
>             XE#4540) -> [260]PASS                                               
>      • igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:                      
>                                                                                 
>           • shard-dg2-set2: [261]SKIP ([262]Intel XE#1392) -> [263]PASS +3      
>             other tests pass                                                    
>                                                                                 
>     Warnings                                                                    
>                                                                                 
>      • igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
>                                                                                 
>           • shard-dg2-set2: [264]SKIP ([265]Intel XE#787) -> [266]SKIP          
>             ([267]Intel XE#455 / [268]Intel XE#787) +15 other tests skip        
>      • igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:     
>                                                                                 
>           • shard-dg2-set2: [269]SKIP ([270]Intel XE#455 / [271]Intel XE#787)   
>             -> [272]SKIP ([273]Intel XE#787) +5 other tests skip                
>      • igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:                       
>                                                                                 
>           • shard-dg2-set2: [274]INCOMPLETE ([275]Intel XE#1727 / [276]Intel    
>             XE#2705 / [277]Intel XE#3113 / [278]Intel XE#4522) ->               
>             [279]INCOMPLETE ([280]Intel XE#1727 / [281]Intel XE#3113 /          
>             [282]Intel XE#3124)                                                 
>      • igt@kms_content_protection@legacy:                                       
>                                                                                 
>           • shard-dg2-set2: [283]FAIL ([284]Intel XE#1178) -> [285]SKIP         
>             ([286]Intel XE#455)                                                 
>      • igt@kms_content_protection@srm:                                          
>                                                                                 
>           • shard-bmg: [287]FAIL ([288]Intel XE#1178) -> [289]SKIP              
>             ([290]Intel XE#2341)                                                
>      • igt@kms_content_protection@uevent:                                       
>                                                                                 
>           • shard-dg2-set2: [291]SKIP ([292]Intel XE#455) -> [293]FAIL          
>             ([294]Intel XE#1188)                                                
>      • igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:                           
>                                                                                 
>           • shard-bmg: [295]DMESG-WARN ([296]Intel XE#877) -> [297]SKIP         
>             ([298]Intel XE#2291)                                                
>      • igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:                     
>                                                                                 
>           • shard-bmg: [299]SKIP ([300]Intel XE#2291) -> [301]DMESG-WARN        
>             ([302]Intel XE#877)                                                 
>      • igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:                    
>                                                                                 
>           • shard-bmg: [303]SKIP ([304]Intel XE#2316) -> [305]FAIL              
>             ([306]Intel XE#3321) +1 other test fail                             
>      • igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:    
>                                                                                 
>           • shard-bmg: [307]SKIP ([308]Intel XE#2312) -> [309]SKIP              
>             ([310]Intel XE#2311) +16 other tests skip                           
>      • igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:     
>                                                                                 
>           • shard-bmg: [311]SKIP ([312]Intel XE#4141) -> [313]SKIP              
>             ([314]Intel XE#2312) +8 other tests skip                            
>      • igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:            
>                                                                                 
>           • shard-bmg: [315]SKIP ([316]Intel XE#2312) -> [317]SKIP              
>             ([318]Intel XE#4141) +11 other tests skip                           
>      • igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc: 
>                                                                                 
>           • shard-dg2-set2: [319]SKIP ([320]Intel XE#651) -> [321]SKIP          
>             ([322]Intel XE#656) +13 other tests skip                            
>      • igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc: 
>                                                                                 
>           • shard-bmg: [323]SKIP ([324]Intel XE#2311) -> [325]SKIP              
>             ([326]Intel XE#2312) +19 other tests skip                           
>      • igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:       
>                                                                                 
>           • shard-dg2-set2: [327]SKIP ([328]Intel XE#656) -> [329]SKIP          
>             ([330]Intel XE#651) +11 other tests skip                            
>      • igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:       
>                                                                                 
>           • shard-bmg: [331]SKIP ([332]Intel XE#2313) -> [333]SKIP              
>             ([334]Intel XE#2312) +15 other tests skip                           
>      • igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:           
>                                                                                 
>           • shard-bmg: [335]SKIP ([336]Intel XE#2312) -> [337]SKIP              
>             ([338]Intel XE#2313) +15 other tests skip                           
>      • igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:     
>                                                                                 
>           • shard-dg2-set2: [339]SKIP ([340]Intel XE#653) -> [341]SKIP          
>             ([342]Intel XE#656) +9 other tests skip                             
>      • igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:            
>                                                                                 
>           • shard-dg2-set2: [343]SKIP ([344]Intel XE#656) -> [345]SKIP          
>             ([346]Intel XE#653) +8 other tests skip                             
>      • igt@kms_plane_scaling@intel-max-src-size:                                
>                                                                                 
>           • shard-dg2-set2: [347]ABORT ([348]Intel XE#4540) -> [349]ABORT       
>             ([350]Intel XE#2705 / [351]Intel XE#4540)                           
>      • igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:                
>                                                                                 
>           • shard-dg2-set2: [352]ABORT ([353]Intel XE#4540) -> [354]ABORT       
>             ([355]Intel XE#4502 / [356]Intel XE#4540)                           
>                                                                                 
> Build changes                                                                   
>                                                                                 
>      • Linux: xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e ->               
>        xe-pw-146307v2                                                           
>                                                                                 
>    IGT_8274: 8274                                                               
>    xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e:                            
>    c1366ff3173056083703df4cbc1b3d160393af8e                                     
>    xe-pw-146307v2: 146307v2                                                     
> 
> References
> 
>    Visible links
>    1. https://patchwork.freedesktop.org/series/146307/
>    2. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/index.html
>    3. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-432/igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a2-dp2.html
>    4. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-3.html
>    5. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-3.html
>    6. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613
>    7. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-4/igt@kms_big_fb@linear-64bpp-rotate-90.html
>    8. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>    9. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-4/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
>   10. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   11. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>   12. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>   13. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   14. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>   15. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>   16. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   17. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   18. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
>   19. https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   20. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2.html
>   21. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   22. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3.html
>   23. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   24. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   25. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-dp-4.html
>   26. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   27. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   28. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
>   29. https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   30. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html
>   31. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   32. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
>   33. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   34. https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   35. https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
>   36. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html
>   37. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
>   38. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
>   39. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
>   40. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-2/igt@kms_chamelium_color@ctm-red-to-blue.html
>   41. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   42. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
>   43. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   44. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-4/igt@kms_content_protection@content-type-change.html
>   45. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   46. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-2/igt@kms_content_protection@legacy.html
>   47. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   48. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-432/igt@kms_content_protection@srm@pipe-a-dp-2.html
>   49. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   50. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-463/igt@kms_content_protection@uevent@pipe-a-dp-4.html
>   51. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>   52. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
>   53. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   54. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
>   55. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   56. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
>   57. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   58. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>   59. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>   60. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   61. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
>   62. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
>   63. https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   64. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
>   65. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
>   66. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
>   67. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-mst.html
>   68. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   69. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-dg2-463/igt@kms_dp_link_training@non-uhbr-sst.html
>   70. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html
>   71. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   72. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
>   73. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>   74. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-4/igt@kms_feature_discovery@dp-mst.html
>   75. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
>   76. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-dg2-435/igt@kms_flip@2x-blocking-wf_vblank.html
>   77. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-432/igt@kms_flip@2x-blocking-wf_vblank.html
>   78. https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   79. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-dg2-463/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
>   80. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
>   81. https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   82. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
>   83. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   84. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
>   85. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
>   86. https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   87. https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>   88. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
>   89. https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>   90. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-bmg-2/igt@kms_flip@2x-nonexisting-fb.html
>   91. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html
>   92. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   93. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-lnl-4/igt@kms_flip@flip-vs-suspend.html
>   94. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-lnl-6/igt@kms_flip@flip-vs-suspend.html
>   95. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
>   96. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-valid-mode.html
>   97. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-valid-mode.html
>   98. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   99. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
>  100. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>  101. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>  102. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html
>  103. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>  104. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
>  105. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
>  106. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>  107. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html
>  108. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html
>  109. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>  110. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
>  111. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>  112. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
>  113. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
>  114. https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>  115. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
>  116. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>  117. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
>  118. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>  119. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
>  120. https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>  121. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
>  122. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>  123. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-4/igt@kms_hdr@invalid-hdr.html
>  124. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>  125. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-4/igt@kms_joiner@basic-max-non-joiner.html
>  126. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
>  127. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-4/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
>  128. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
>  129. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html
>  130. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>  131. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html
>  132. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>  133. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  134. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html
>  135. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>  136. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-464/igt@kms_pm_backlight@bad-brightness.html
>  137. https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>  138. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-2/igt@kms_pm_backlight@fade-with-suspend.html
>  139. https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>  140. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>  141. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>  142. https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>  143. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html
>  144. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>  145. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
>  146. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>  147. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-2/igt@kms_psr@psr2-sprite-blt.html
>  148. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>  149. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>  150. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-4/igt@kms_rotation_crc@bad-pixel-format.html
>  151. https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>  152. https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>  153. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full.html
>  154. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>  155. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html
>  156. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-lnl-6/igt@kms_setmode@basic@pipe-b-edp-1.html
>  157. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
>  158. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html
>  159. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html
>  160. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>  161. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc.html
>  162. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc.html
>  163. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  164. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-dg2-434/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html
>  165. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html
>  166. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540
>  167. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-dg2-434/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html
>  168. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html
>  169. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>  170. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-4/igt@kms_vrr@lobf.html
>  171. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>  172. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-4/igt@kms_writeback@writeback-fb-id.html
>  173. https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>  174. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-lnl-5/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html
>  175. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-lnl-2/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html
>  176. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278
>  177. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
>  178. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
>  179. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
>  180. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
>  181. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>  182. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
>  183. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>  184. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-464/igt@xe_exec_fault_mode@once-rebind-imm.html
>  185. https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>  186. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-6/igt@xe_module_load@force-load.html
>  187. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
>  188. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-2/igt@xe_oa@oa-tlb-invalidate.html
>  189. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
>  190. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-464/igt@xe_oa@rc6-disable.html
>  191. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>  192. https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>  193. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-4/igt@xe_pm@s3-d3cold-basic-exec.html
>  194. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>  195. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-6/igt@xe_pm@s4-mocs.html
>  196. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
>  197. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-4/igt@xe_pm@vram-d3cold-threshold.html
>  198. https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>  199. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-2/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
>  200. https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>  201. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-4/igt@xe_sriov_flr@flr-twice.html
>  202. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
>  203. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-2/igt@xe_sriov_scheduling@equal-throughput.html
>  204. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
>  205. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
>  206. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>  207. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>  208. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
>  209. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
>  210. https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
>  211. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
>  212. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
>  213. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>  214. https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>  215. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
>  216. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
>  217. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>  218. https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>  219. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>  220. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
>  221. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>  222. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
>  223. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
>  224. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
>  225. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-2/igt@kms_display_modes@extended-mode-basic.html
>  226. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
>  227. https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>  228. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-463/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
>  229. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html
>  230. https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>  231. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html
>  232. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
>  233. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>  234. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-2/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
>  235. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-adlp-6/igt@kms_flip@basic-flip-vs-wf_vblank.html
>  236. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>  237. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-adlp-8/igt@kms_flip@basic-flip-vs-wf_vblank.html
>  238. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-adlp-4/igt@kms_flip@flip-vs-suspend.html
>  239. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>  240. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>  241. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-adlp-9/igt@kms_flip@flip-vs-suspend.html
>  242. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-lnl-8/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
>  243. https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
>  244. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-lnl-3/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
>  245. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>  246. https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>  247. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>  248. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
>  249. https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>  250. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
>  251. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html
>  252. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
>  253. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
>  254. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
>  255. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>  256. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
>  257. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-dg2-463/igt@testdisplay.html
>  258. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>  259. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540
>  260. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-464/igt@testdisplay.html
>  261. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
>  262. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>  263. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
>  264. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
>  265. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  266. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
>  267. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  268. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  269. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
>  270. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  271. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  272. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
>  273. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  274. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>  275. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>  276. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>  277. https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>  278. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
>  279. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>  280. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>  281. https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>  282. https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
>  283. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-dg2-436/igt@kms_content_protection@legacy.html
>  284. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>  285. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-464/igt@kms_content_protection@legacy.html
>  286. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  287. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-bmg-2/igt@kms_content_protection@srm.html
>  288. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>  289. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-6/igt@kms_content_protection@srm.html
>  290. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>  291. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-dg2-464/igt@kms_content_protection@uevent.html
>  292. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  293. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-463/igt@kms_content_protection@uevent.html
>  294. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>  295. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
>  296. https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>  297. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
>  298. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>  299. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
>  300. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>  301. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
>  302. https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>  303. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
>  304. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>  305. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
>  306. https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>  307. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>  308. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>  309. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>  310. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>  311. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>  312. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>  313. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>  314. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>  315. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>  316. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>  317. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>  318. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>  319. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
>  320. https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>  321. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
>  322. https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>  323. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>  324. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>  325. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>  326. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>  327. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
>  328. https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>  329. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
>  330. https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>  331. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
>  332. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>  333. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
>  334. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>  335. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
>  336. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>  337. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
>  338. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>  339. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
>  340. https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>  341. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
>  342. https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>  343. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html
>  344. https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>  345. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html
>  346. https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>  347. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size.html
>  348. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540
>  349. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html
>  350. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>  351. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540
>  352. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2821-c1366ff3173056083703df4cbc1b3d160393af8e/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>  353. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540
>  354. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146307v2/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>  355. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4502
>  356. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540

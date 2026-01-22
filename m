Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7D3D6CFA1
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 19:33:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03B810EA6B;
	Thu, 22 Jan 2026 19:33:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QEmSe4lQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447BA10EA65
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 19:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769110437; x=1800646437;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4fW31Y8SZFTBP6ulqpXcRZnFzGBBS0LVzsXpmsFaOuU=;
 b=QEmSe4lQk74B3k4If01josXprltc1srk6vcS+FglWZYJdvS9c9ymwsup
 xU/+aQ+URn+LDnvsPkxlyyBkarKjpalW/peKFBsndVDF85dYNIEezBeKU
 aYOk+jia03roGClsJt61y60UJbXtMvdBEbLimKyKTURarNEYDq0wK3TZa
 t/uVNkEpy2iuB722cDg2ms2JPSPYE48WyB+MD1d42GD06BIDcxLwooOGz
 LAMmLcH0MIFBzllSCj0GVkhywJUV6Cv/X+MfBiQpDyzoXmSfzEPmqSRPe
 1gJaqa2aaTngA2Gm5Mrh/YULA5mqnfMdudLIBeCUd+vhA/eam30mpghLJ w==;
X-CSE-ConnectionGUID: I8haUJw3Q1Sf+5OyQF1fsw==
X-CSE-MsgGUID: g+Nenly0SEeaVYATYhgrqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70270885"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="70270885"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 11:33:56 -0800
X-CSE-ConnectionGUID: LuAwYdy5SlCswsjAexg8Lg==
X-CSE-MsgGUID: GTb9jDvuQhKVbQMGVSmasg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="211673008"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 11:33:56 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 11:33:54 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 22 Jan 2026 11:33:54 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 11:33:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JEL7uc0iewjuBuGiZ2w/5aJC6ru/ct5s671EJjKBsFj0BiKbkglC8r2UENrFK+Axmh6JmP0bG0zTtcycPNRxu3geX62K745/1FJZPX5Xl4s+NACPWm/SsXMbXQ5mK51ydeAkClfrNjeTwuMzjcuRsrHht6N++PiJuneJXzGjgwv5s1ZbHvrLAxldbdNkohsORQPPED/R57EQxr0x6zZ4TghYfWb3VJiDWHnqrZiO8ZaexmsWmkca5U+4iQenb8oL+Qg8CrhblbaSKmbpEV5RuGKuni0xfZ06dXsc0FP2Uqph7tyqS7YOgdAnc6nSDikUlgcZks4NQrjNjLN+AD8M+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fW31Y8SZFTBP6ulqpXcRZnFzGBBS0LVzsXpmsFaOuU=;
 b=u1lYm9U7DW8qKw/idpFJnaM6TaSnY+2ahjzN+RMCeRnZcU3tOwKqFJZr6PTysZ+bQya6VB2MXWHEX6wFtKHGVhKDWJVaaw/n+Uz4uyfouTV+CdVBzz1iS99vECY6Mhay4MpElT4LxlF/qfzwVavGjuly6mmULg1rc7i7KUoaad7imBlfYbCEZY9oTyrLhcMCGAXp8vHS4wAXPxFf7Xmoa6Zgp7ho+lUQBBylcKxOoPpqSe6twN/VtQeV1BNM6f9pdvdwd31CjIf6+90zgAbpg3oXKHh1Lkqn3lTdnMnYKSWkh2nkizvaeIm/TDXyd8Kmzh5rQIhzd5V4XqNKvorBXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ5PPFC0624F2CA.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::850) by DS7PR11MB6200.namprd11.prod.outlook.com
 (2603:10b6:8:98::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 19:33:52 +0000
Received: from SJ5PPFC0624F2CA.namprd11.prod.outlook.com
 ([fe80::88f4:becb:ece5:7e22]) by SJ5PPFC0624F2CA.namprd11.prod.outlook.com
 ([fe80::88f4:becb:ece5:7e22%6]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 19:33:52 +0000
From: "Mishra, Pallavi" <pallavi.mishra@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH v2] drm/xe/tests: Fix g2g_test_array indexing
Thread-Topic: [PATCH v2] drm/xe/tests: Fix g2g_test_array indexing
Thread-Index: AQHchn6tCwaQg8eEFkKnYUVJBWg9A7VdXNOAgAE2YpA=
Date: Thu, 22 Jan 2026 19:33:52 +0000
Message-ID: <SJ5PPFC0624F2CA292F70351251505F39D18297A@SJ5PPFC0624F2CA.namprd11.prod.outlook.com>
References: <20260116002529.951176-1-pallavi.mishra@intel.com>
 <84622a42-64c8-4712-bfe9-374e32cdd4b4@intel.com>
In-Reply-To: <84622a42-64c8-4712-bfe9-374e32cdd4b4@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ5PPFC0624F2CA:EE_|DS7PR11MB6200:EE_
x-ms-office365-filtering-correlation-id: 1a485cc0-5a3e-40da-0471-08de59ed2cb9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?TjM3NVVCbHJkSCtCRVF1VGV5TDY5K0NTbERXa2tkcTdLbm5GL1FYemxGcWFv?=
 =?utf-8?B?VmxpNitUaVd3L0RsQ2JFTW9SbThpdnNMenhwaEorSWVGS0EzL3Z6dzN6RnVq?=
 =?utf-8?B?YTE5OFB4MGNGbUU2R1ZPaCtUQWlXcytObE5uV1E3NlZhTHVieUdxV09VdFk5?=
 =?utf-8?B?Tnc4YWdlTFljazI2Mm5HNThuTGxmMjJob1MzQUlKWm5hODU1YWpSYkg1bjZX?=
 =?utf-8?B?SUQvMldoYUtSbFhGUHBUSVRLVlYvV0JCdHNnTkRRR0t5T1Vla1ZDZm9zTCtN?=
 =?utf-8?B?b1pMdkVibDBxdHZSSXZDS0ZITjBpL21xNU1YRVkyUnF6Z0VPOEhjY2wxcS9q?=
 =?utf-8?B?eGRuVlJNb1JSZ040bXBNYVZkRzduN1JTRlgxTmYycGdZNHNKLzV4K0d5Snpy?=
 =?utf-8?B?cXFvcU9hVjA2RWk3Tk42SjMwMSsrcksva3dJaGlvT1A4L1pKQWwwNGVPaGZV?=
 =?utf-8?B?OERxZEVpekN3a3pvcU93bVlHWGRGaE1EM0lzMmF5T20wUG90ZUNHYW5LVTFV?=
 =?utf-8?B?NURTOTBUMnF0WVZjdkwxdXNPYkdhRGRlNEFPMzhzVWJXRk42M1Z6WUNpUWFL?=
 =?utf-8?B?Y0l3bXZud2YvdG5rV0xzMENuQTc4aGQvbWh5MEVwVHo1Y3FOb2R4Y25DUklJ?=
 =?utf-8?B?UUgwVGtuSS9ZSmNzZVQ3ZWxWdUY1azRvQUxvVXpTUW5FL1lmL0d6ZU9naHlG?=
 =?utf-8?B?MlZob2Jrc0cyWkc0OU13QngxMFZFd21tejF1VldXT1RVUEw4N3lxWFgvU05m?=
 =?utf-8?B?VjRvK0JuVk1sTXhocHdtK1lseUlBSktub3RwTTZmUDBYaThxdi93QTVsbUdv?=
 =?utf-8?B?TW5lV3IxV1QxeEJGdzNUNCtjQnRjWDBTQXFYRTBndU51bHFNWVI2MW1xRTlH?=
 =?utf-8?B?MEJMdytkQUgvaVdnaURXWGRVcm85b2tzaGlOYWNNZkJsTHZqKyt3K01lN3Ns?=
 =?utf-8?B?SGZnY1M3anp5YUNUeGlkTUFyTFZtcDViSS92QlVOQkpwRTIrRzNvMG9Oc2w1?=
 =?utf-8?B?bVBKTmZTZUt2T2ZnVW1xNDA5R25HSzc5TzdYbE41c2tBV1pRZFNIYisvSHIz?=
 =?utf-8?B?ZndPampIdm1PVndjOVRyRUdUTVp5eUM2ZUcvSVVQeUNicktGdGJQWld1b0Fm?=
 =?utf-8?B?ZFBHTjNKSTRjNDZPSXR1UzFxdjhpM3ZsbVBNRTAxL1NsWUhwbjhZYWwzT0tP?=
 =?utf-8?B?aHBpNmw0d1R4T0h4SDFERFAxQ3ZzSE9sWVZFZUs3Vzh0aVZWeExFUEhxWmx5?=
 =?utf-8?B?eHIrQUwycmo0Q3pvU1lGZDBGUng1cE5MejZxUldhSzVYbzZjelFPYS9aS1N5?=
 =?utf-8?B?V2FTL0xuUTVvTWlpM1oxMFd0cGtSUGw1YTJLamZ1MXYwWWNLYVEzNis4QUVD?=
 =?utf-8?B?Kzd4U3hjTjVnNEpVYXdnb3Q0d0VyMzhNY3RTd1JxYWtSa1Q3MGxkcjVONzNL?=
 =?utf-8?B?dEV3ODdxUDU3a25SWWpoT2wrbXdHYVo2d2tnWG1GeHBhUHdWSWJNM1NpZm96?=
 =?utf-8?B?WjZOZWdEbjhndGxqc08yMU1ZZFJTNWpqMUhXNzdNbmhBQjVFaGxNVVBCOGd4?=
 =?utf-8?B?VCt5Qm40Qlp0NCs5Sm9IVDVYcm9FeDF3L3dOWS9ybGxQMWhsdEJvUTdoQUR1?=
 =?utf-8?B?ZFpsRHlWYW9DYVVsSDZscUhFZHRDTUxGaGROeW8rRS9NN2pNVTBUQ0E5NURm?=
 =?utf-8?B?cWpaQjBTYmdsemszVlpUZkpjemN0OXlLZGpaQzIxR2tQeFkvSW1ZZFg3WWZO?=
 =?utf-8?B?OVZ5ekh5ZDk3c1RiUUtXVHNSSy9iWVhJcnI2Ti9sdkxYb1BLdFVqNjVHa3VO?=
 =?utf-8?B?MHVJUExuVlE0cjJPV3Z6RllvSm44NVdHZm13b0tNdDd3dVJyNFhFQW9zRnVn?=
 =?utf-8?B?czZpUjh3Vmh2dG1BUTIzR2IvUnE2M0JEUWFpTjdwRWRYdDRHME1ySjNnVmpu?=
 =?utf-8?B?OG9ZeUFybW5OeHdMUS83MVJFa0NvbnlvSU9SdXR3ZFhoTFE5VDc0cC9VVFE5?=
 =?utf-8?B?UkxFRThuVnB3ekh6dURkMWxTTENiLzlWcno3dHJQaTVsem9hWWVBaGE4b2Za?=
 =?utf-8?B?WUs1c1FzWWFNUWIyWElyb1ltL25qazIyb0JOcW9zdEE5U2IwSERwRjFaWi9v?=
 =?utf-8?B?MGNOL1NsUUZzOTk1QkZBVDkxbEpiQ014Ymd5ODgxZ0hOYWNMSW9uVFNORUNv?=
 =?utf-8?Q?fr+SfzJIKtxVn+7JtJJTRGA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPFC0624F2CA.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bHNpbG94cGdxRHNHZGh6V1FpTlVGMzE4UHNMMU9VaDFzaHczY3A0ZzdUMDdC?=
 =?utf-8?B?aENTZU9vYlRiM3F0bUpiYVZQU1A2L3MrUVFTdGZPaytycC9tOHU2Z2dYYmlu?=
 =?utf-8?B?ZkpnY1NpUDc2Sy93MmFuaGljOTZucDZTQjc2RWVwQ25sUWxxd0VTc2FWb3dl?=
 =?utf-8?B?WGFuYnhhTHV1K050NmN2UEFxNUpCR3ZzUlQ4dmo1cUMrd0ExSGwzMjIvbzAw?=
 =?utf-8?B?MGo3Y0UzcEZHNjdOZk9BcHlWa0I5dGRzdUdpb0Rpa0s2UlBkVERYSmJ5YUZv?=
 =?utf-8?B?bFJydkVKWlFybEtpbVVVWFNGWW04cXJWR3AydXRrTGdYTU9udDFsNnRxSzR6?=
 =?utf-8?B?RmtLQXE4QStheVllMDZ5M0V5emsrN1RwdklUYlRJT2tCTXdpcDNuWndKdmV1?=
 =?utf-8?B?OEdOcmlRdzB2dXkvTVhPcnlLZEJNdVNicHBUbFBwSFc1aWI0ZUxEbTBiUVk2?=
 =?utf-8?B?aWl1cktTemd5K0puN081MGlvZmxFYlMrajhhVUlkaXc2anlxUVhqS1VnRmVP?=
 =?utf-8?B?NnlmUk1aRWNGa0JmaUVod09obk9DRHZlVzdOUUFqTTJqUXpXVlVSYkZoRXk5?=
 =?utf-8?B?eDVSb3NkYkpVd3I1YVBKVmwrV3VKOUdWSTBPNG9oQUJzMTJuM0sxQnp1MDdJ?=
 =?utf-8?B?WlFGajFBVmQ3VmU4cjB0NEMwdTNQUnlPQWsyQXdDTFhXOTQ1TWFYUE5nckRV?=
 =?utf-8?B?TDVhVnUwczZBZzhZd0RybjF1UlVNM3NWMFpBaFBhSUV1elBJRE1aNXRYQlND?=
 =?utf-8?B?bFZ3eDJSNHZ5ZWozcTNDYVl5VFUwNFVFTGxxbys5OXhlRlJWNzVzbytDeUw4?=
 =?utf-8?B?WUlzVDNSREdDUkJDMmdpUllYMDIxL2ZVZFQwUzV5Mi9TL205dzJ3dnZYTUFX?=
 =?utf-8?B?d2VjU3VVWStqT0dDckdNVjRUMXhZdzZUaVREOUFnY2lSM1d3WGxRcHZCOHhJ?=
 =?utf-8?B?VXpCZ2xNN05MakxjKzZWendCQnUxWHhMb0U5VFpScUo0OHJIVERaRFhXTFFI?=
 =?utf-8?B?U1U1dW82MGs0ZGR0UGtpYWMxaDJzUHY0YkNoSkRtak9iTEJUWU1nSDlrVTJl?=
 =?utf-8?B?TVVaQnRmRElVRDdkSmxpZEpwcTF5dVhta2pLVndZSys5UTI0c3FVMStVVmhj?=
 =?utf-8?B?cldwTnFXcUtOL0tpcjdDSDhzQTdLNzBxSTBxdjIzajk3Z2Y4bWY3Ykw4dGdu?=
 =?utf-8?B?SW9XSGVaazdZdlhWa3FSOWdEY0puMVhzVkNaMGpUNzVYZHdzN294UUJoYyt5?=
 =?utf-8?B?WEhkdEF4TlJ4VjZETUJBdTNNVXE5NVQ0K0xRejA4Ti92Mk1uTXFrTk9ac3N5?=
 =?utf-8?B?Uk13Nzg2dHV4UDhtVm1OMlRxcWhvU2MrM001ck9lcG53ZzNzNkRrKzJhV2VM?=
 =?utf-8?B?SjhadHVjTTNEMmhqNzRMNnE0Ym85SDZrMXYzMU1QMnBnL2xYMDZNZUpWdkZp?=
 =?utf-8?B?M1NWcEFTSDBWNHN4TERCWDc0ZzUzZklmVnlLejBJZnZFVXFNZ2Y5ekl1eWlW?=
 =?utf-8?B?eUpHMHgzTS96WmZFT0g1RDZGQ0xZR2gwQTMyZzIzdmgxWTlkRHZhNnBRdTlB?=
 =?utf-8?B?RWpvcWJVdjI2b0lwY3NxQ0tKVkFvSW9Vdkp6RjRRaWhlZDhweDE3dlpmMkRR?=
 =?utf-8?B?MVNKTThTRzZYb3F5L1BIOUJBZjNQcnNsNmRJamhMY01xeGFYT21WbU5iZTh2?=
 =?utf-8?B?bURSSi90V3BVS0RhSmFhTjhxWFlocUJkNkVYZm1xWUhDNHZtS3BCVlNiSllz?=
 =?utf-8?B?bHBMaXVhUU1NQmV4ZElrS3o0enMydS9vekNJQ0FuVnlvRkdNcVpoY2k2Tmx1?=
 =?utf-8?B?SFpNOFBvakk3ZE00dFRKTEpVSzRvUzM3SThnbTFiU1pON2dZbllLVisyeDJE?=
 =?utf-8?B?bjBnWFdxWnNOeXg4dy9ZcytBWm9VZzZ5T2I2YVYrVGpWZTRkQ3N5Um9lSUVq?=
 =?utf-8?B?aEZoWXN4SXRwRXdReTI0aGVHRnlPQTFQN2JXZUpEVjNGQnkyOGh5cStmWHJ4?=
 =?utf-8?B?WElkWTZWRXRjcFVuUHA2bkpYTjdvRnFLV21kNFMxVmkreGx3SC8ydUkxVUFX?=
 =?utf-8?B?MzBpRFQ3SnZ1dExUMGNqMVEwRjBCYTM1YnN0L3kyaVp6WWM1b003WXY5bFND?=
 =?utf-8?B?Q2EwUndMSnZYRmpqOTdnejIvQ1QvVU9Ec2RwckRhMUJ4SDA0eDhxcjNGWVE2?=
 =?utf-8?B?M3M3blM4RS9zaFozUWtQS1hMZXpaOXNMN2xhQ2h5MWc3aXNrcFpsaC9JWklX?=
 =?utf-8?B?TnA2QWFWeUdHSFl6MEs2NWVhWTVEcEJJbVhaYjVVV0pueHBxK25ndy82elFM?=
 =?utf-8?B?cTQwb2g0bEo4R2VsWGw4M0I5bFZaZUxhUnNqUTA1TU5hZWx4blFFQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPFC0624F2CA.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a485cc0-5a3e-40da-0471-08de59ed2cb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2026 19:33:52.5391 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DHRNjkpD7/iAxTsbpTNPyu4Lc1+poyPM8NJFinfjgwtfLajDYDg+jvv36g5UNqm7YfwGitZ4MsCAGqWPAqk7UBeFGZ82rM+tN4eUE2YcSAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6200
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2VyYW9sbyBTcHVyaW8s
IERhbmllbGUgPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+DQo+IFNlbnQ6IFdlZG5l
c2RheSwgSmFudWFyeSAyMSwgMjAyNiA0OjIwIFBNDQo+IFRvOiBNaXNocmEsIFBhbGxhdmkgPHBh
bGxhdmkubWlzaHJhQGludGVsLmNvbT47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
PiBDYzogVmlzaHdhbmF0aGFwdXJhLCBOaXJhbmphbmEgPG5pcmFuamFuYS52aXNod2FuYXRoYXB1
cmFAaW50ZWwuY29tPjsNCj4gU3VtbWVycywgU3R1YXJ0IDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5j
b20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIGRybS94ZS90ZXN0czogRml4IGcyZ190ZXN0
X2FycmF5IGluZGV4aW5nDQo+IA0KPiANCj4gDQo+IE9uIDEvMTUvMjAyNiA0OjI1IFBNLCBQYWxs
YXZpIE1pc2hyYSB3cm90ZToNCj4gPiBUaGUgRzJHIEtVbml0IHRlc3QgYWxsb2NhdGVzIGEgY29t
cGFjdCBOw5dOIG1hdHJpeCBzaXplZCBieSBndF9jb3VudA0KPiA+IGFuZCB2ZXJpZmllcyBlbnRy
aWVzIHVzaW5nIGRlbnNlIGluZGljZXM6IGlkeCA9IChqICogZ3RfY291bnQpICsgaQ0KPiA+DQo+
ID4gVGhlIHByb2R1Y2VyIHBhdGggY3VycmVudGx5IGNvbXB1dGVzIGlkeCB1c2luZw0KPiA+IGd0
LT5pbmZvLmlkLiBIb3dldmVyLCBndC0+aW5mby5pZCB2YWx1ZXMNCj4gPiBhcmUgbm90IGd1YXJh
bnRlZWQgdG8gYmUgY29udGlndW91cy4NCj4gPiBGb3IgZXhhbXBsZSwgd2l0aCBndF9jb3VudD0y
IGFuZCBJRHMgezAsM30sIHRoaXMgZm9ybXVsYSBwcm9kdWNlcw0KPiA+IGluZGljZXMgYmV5b25k
IHRoZSBhbGxvY2F0ZWQgcmFuZ2UsIGNhdXNpbmcgbWlzbWF0Y2hlcyBhbmQgcG90ZW50aWFsDQo+
ID4gb3V0LW9mLWJvdW5kcyBhY2Nlc3MuDQo+ID4NCj4gPiBVcGRhdGUgdGhlIHByb2R1Y2VyIHRv
IG1hcCBlYWNoIEdUIHRvIGEgZGVuc2UgaW5kZXggaW4gWzAuLmd0X2NvdW50LTFdDQo+ID4gYW5k
IGNvbXB1dGU6DQo+ID4gICAgICBpZHggPSAodHhfZGVuc2UgKiBndF9jb3VudCkgKyByeF9kZW5z
ZQ0KPiA+DQo+ID4gQWRkaXRpb25hbGx5LCBpbnRyb2R1Y2UgYW4gZXZlbnQtYmFzZWQgZGVsYXkg
aW4gZzJnX3Rlc3RfaW5fb3JkZXIoKSB0bw0KPiA+IGVuc3VyZSBvcmRlcmluZyBiZXR3ZWVuIHNl
bmRzLg0KPiA+DQo+ID4gdjI6IEFkZCBzaW5nbGUgaGVscGVyIGZ1bmN0aW9uIChEYW5pZWxlKQ0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGFsbGF2aSBNaXNocmEgPHBhbGxhdmkubWlzaHJhQGlu
dGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS94ZS90ZXN0cy94ZV9ndWNf
ZzJnX3Rlc3QuYyB8IDU2DQo+ICsrKysrKysrKysrKysrKysrKysrKy0NCj4gPiAgIDEgZmlsZSBj
aGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS90ZXN0cy94ZV9ndWNfZzJnX3Rlc3QuYw0KPiA+IGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3Rlc3RzL3hlX2d1Y19nMmdfdGVzdC5jDQo+ID4gaW5kZXggM2Iy
MTNmY2FlOTE2Li5lYzE4MDg2Yjk4ZDggMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3hlL3Rlc3RzL3hlX2d1Y19nMmdfdGVzdC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3Rlc3RzL3hlX2d1Y19nMmdfdGVzdC5jDQo+ID4gQEAgLTQ4LDYgKzQ4LDM4IEBAIHN0cnVjdCBn
MmdfdGVzdF9wYXlsb2FkICB7DQo+ID4gICAJdTMyIHNlcW5vOw0KPiA+ICAgfTsNCj4gPg0KPiA+
ICtzdGF0aWMgaW50IHNsb3RfaW5kZXhfZnJvbV9ndHMoc3RydWN0IHhlX2d0ICp0eF9ndCwgc3Ry
dWN0IHhlX2d0DQo+ID4gKypyeF9ndCkgew0KPiA+ICsJc3RydWN0IHhlX2RldmljZSAqeGUgPSBn
dF90b194ZSh0eF9ndCk7DQo+ID4gKwlpbnQgaWR4ID0gMCwgZm91bmQgPSAwLCBpZCwgdHhfaWR4
LCByeF9pZHg7DQo+ID4gKwlzdHJ1Y3QgeGVfZ3QgKmd0Ow0KPiA+ICsJc3RydWN0IGt1bml0ICp0
ZXN0ID0ga3VuaXRfZ2V0X2N1cnJlbnRfdGVzdCgpOw0KPiA+ICsNCj4gPiArCWZvciAoaWQgPSAw
OyBpZCA8IHhlLT5pbmZvLnRpbGVfY291bnQgKiB4ZS0+aW5mby5tYXhfZ3RfcGVyX3RpbGU7IGlk
KyspIHsNCj4gPiArCQlndCA9IHhlX2RldmljZV9nZXRfZ3QoeGUsIGlkKTsNCj4gPiArCQlpZiAo
IWd0KQ0KPiA+ICsJCQljb250aW51ZTsNCj4gPiArCQlpZiAoZ3QgPT0gdHhfZ3QpIHsNCj4gPiAr
CQkJdHhfaWR4ID0gaWR4Ow0KPiA+ICsJCQlmb3VuZCsrOw0KPiA+ICsJCX0NCj4gPiArCQlpZiAo
Z3QgPT0gcnhfZ3QpIHsNCj4gPiArCQkJcnhfaWR4ID0gaWR4Ow0KPiA+ICsJCQlmb3VuZCsrOw0K
PiA+ICsJCX0NCj4gPiArDQo+ID4gKwkJaWYgKGZvdW5kID09IDIpDQo+ID4gKwkJCWJyZWFrOw0K
PiA+ICsNCj4gPiArCQlpZHgrKzsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlpZiAoZm91bmQgIT0g
MikNCj4gPiArCQlLVU5JVF9GQUlMKHRlc3QsICJHVCBpbmRleCBub3QgZm91bmQiKTsNCj4gPiAr
DQo+ID4gKwlyZXR1cm4gKHR4X2lkeCAqIHhlLT5pbmZvLmd0X2NvdW50KSArIHJ4X2lkeDsgfQ0K
PiA+ICsNCj4gPiAgIHN0YXRpYyB2b2lkIGcyZ190ZXN0X3NlbmQoc3RydWN0IGt1bml0ICp0ZXN0
LCBzdHJ1Y3QgeGVfZ3VjICpndWMsDQo+ID4gICAJCQkgIHUzMiBmYXJfdGlsZSwgdTMyIGZhcl9k
ZXYsDQo+ID4gICAJCQkgIHN0cnVjdCBnMmdfdGVzdF9wYXlsb2FkICpwYXlsb2FkKSBAQCAtMTYz
LDcNCj4gKzE5NSw3IEBAIGludA0KPiA+IHhlX2d1Y19nMmdfdGVzdF9ub3RpZmljYXRpb24oc3Ry
dWN0IHhlX2d1YyAqZ3VjLCB1MzIgKm1zZywgdTMyIGxlbikNCj4gPiAgIAkJZ290byBkb25lOw0K
PiA+ICAgCX0NCj4gPg0KPiA+IC0JaWR4ID0gKHR4X2d0LT5pbmZvLmlkICogeGUtPmluZm8uZ3Rf
Y291bnQpICsgcnhfZ3QtPmluZm8uaWQ7DQo+ID4gKwlpZHggPSBzbG90X2luZGV4X2Zyb21fZ3Rz
KHR4X2d0LCByeF9ndCk7DQo+ID4NCj4gPiAgIAlpZiAoeGUtPmcyZ190ZXN0X2FycmF5W2lkeF0g
IT0gcGF5bG9hZC0+c2Vxbm8gLSAxKSB7DQo+ID4gICAJCXhlX2d0X2VycihyeF9ndCwgIkcyRzog
U2Vxbm8gbWlzbWF0Y2ggJWQgdnMgJWQgZm9yICVkOiVkIC0NCj4gPg0KPiA+ICVkOiVkIVxuIiwg
QEAgLTE4MCwxMyArMjEyLDE3IEBAIGludA0KPiB4ZV9ndWNfZzJnX3Rlc3Rfbm90aWZpY2F0aW9u
KHN0cnVjdCB4ZV9ndWMgKmd1YywgdTMyICptc2csIHUzMiBsZW4pDQo+ID4gICAJcmV0dXJuIHJl
dDsNCj4gPiAgIH0NCj4gPg0KPiA+ICsjZGVmaW5lIEcyR19XQUlUX1RJTUVPVVRfTVMgMTAwDQo+
ID4gKyNkZWZpbmUgRzJHX1dBSVRfUE9MTF9NUyAxDQo+ID4gKw0KPiA+ICAgLyoNCj4gPiAgICAq
IFNlbmQgdGhlIGdpdmVuIHNlcW5vIGZyb20gYWxsIEd1Q3MgdG8gYWxsIG90aGVyIEd1Q3MgaW4g
dGlsZS9HVCBvcmRlcg0KPiA+ICAgICovDQo+ID4gICBzdGF0aWMgdm9pZCBnMmdfdGVzdF9pbl9v
cmRlcihzdHJ1Y3Qga3VuaXQgKnRlc3QsIHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCB1MzINCj4gc2Vx
bm8pDQo+ID4gICB7DQo+ID4gICAJc3RydWN0IHhlX2d0ICpuZWFyX2d0LCAqZmFyX2d0Ow0KPiA+
IC0JaW50IGksIGo7DQo+ID4gKwlpbnQgaSwgaiwgd2FpdGVkOw0KPiA+ICsJdTMyIGlkeDsNCj4g
Pg0KPiA+ICAgCWZvcl9lYWNoX2d0KG5lYXJfZ3QsIHhlLCBpKSB7DQo+ID4gICAJCXUzMiBuZWFy
X3RpbGUgPSBndF90b190aWxlKG5lYXJfZ3QpLT5pZDsgQEAgLTIwNSw2ICsyNDEsMjINCj4gQEAN
Cj4gPiBzdGF0aWMgdm9pZCBnMmdfdGVzdF9pbl9vcmRlcihzdHJ1Y3Qga3VuaXQgKnRlc3QsIHN0
cnVjdCB4ZV9kZXZpY2UgKnhlLCB1MzINCj4gc2Vxbg0KPiA+ICAgCQkJcGF5bG9hZC5yeF9kZXYg
PSBmYXJfZGV2Ow0KPiA+ICAgCQkJcGF5bG9hZC5yeF90aWxlID0gZmFyX3RpbGU7DQo+ID4gICAJ
CQlwYXlsb2FkLnNlcW5vID0gc2Vxbm87DQo+ID4gKw0KPiA+ICsJCQkvKiBDYWxjdWxhdGUgaWR4
IGZvciBldmVudC1iYXNlZCB3YWl0ICovDQo+ID4gKwkJCWlkeCA9IHNsb3RfaW5kZXhfZnJvbV9n
dHMobmVhcl9ndCwgZmFyX2d0KTsNCj4gPiArCQkJd2FpdGVkID0gMDsNCj4gPiArDQo+ID4gKwkJ
CS8qIFdhaXQgZm9yIHByZXZpb3VzIHNlcW5vIHRvIGJlIGFja25vd2xlZGdlZA0KPiBiZWZvcmUg
c2VuZGluZyAqLw0KPiA+ICsJCQl3aGlsZSAoeGUtPmcyZ190ZXN0X2FycmF5W2lkeF0gIT0gKHNl
cW5vIC0gMSkpIHsNCj4gPiArCQkJCW1zbGVlcChHMkdfV0FJVF9QT0xMX01TKTsNCj4gPiArCQkJ
CXdhaXRlZCArPSBHMkdfV0FJVF9QT0xMX01TOw0KPiA+ICsJCQkJaWYgKHdhaXRlZCA+PSBHMkdf
V0FJVF9USU1FT1VUX01TKSB7DQo+ID4gKwkJCQkJa3VuaXRfaW5mbyh0ZXN0LCAiVGltZW91dCB3
YWl0aW5nISB0eA0KPiBndDogJWQsIHJ4IGd0OiAlZFxuIiwNCj4gPiArCQkJCQkJICAgbmVhcl9n
dC0+aW5mby5pZCwgZmFyX2d0LQ0KPiA+aW5mby5pZCk7DQo+IA0KPiBTb3JyeSBJIG1pc3NlZCB0
aGlzIG9uIHRoZSBwcmV2aW91cyByZXYsIGJ1dCBzaG91bGRuJ3QgdGhpcyBiZSBhIGZhaWx1cmU/
IElmIHdlDQo+IGRvbid0IGdldCBvbmUgb2YgdGhlIHByZXZpb3VzIG1lc3NhZ2VzIHRoZW4gc29t
ZXRoaW5nIGhhcyBnb25lIHdyb25nLg0KPiBUaGUgcGF0Y2ggbG9va3MgZ29vZCB0byBtZSBhcGFy
dCBmcm9tIHRoaXMuDQo+IA0KPiBEYW5pZWxlDQoNCkkgdGhpbmsgbWFya2luZyBhIGZhaWx1cmUg
YXQgdGhpcyBwb2ludCBtYXkgYmUgdG9vIGVhcmx5LiBTZXFubyBjaGVjayB2YWxpZGF0aW9uIGhh
cHBlbnMgbGF0ZXIgb24NCmluIGcyZ19ydW5fdGVzdCgpIGFuZCBhbHNvIGluIHhlX2d1Y19nMmdf
dGVzdF9ub3RpZmljYXRpb24oKS4gSWYgYW55IG5vdGlmaWNhdGlvbiBpcyBtaXNzZWQgb3Igb3V0
IG9mIG9yZGVyLCANCnRoZSB0ZXN0IHdpbGwgZmFpbCBhdCB0aGF0IHN0YWdlLg0KDQpQYWxsYXZp
DQo+IA0KPiA+ICsJCQkJCWJyZWFrOw0KPiA+ICsJCQkJfQ0KPiA+ICsJCQl9DQo+ID4gKw0KPiA+
ICAgCQkJZzJnX3Rlc3Rfc2VuZCh0ZXN0LCAmbmVhcl9ndC0+dWMuZ3VjLCBmYXJfdGlsZSwNCj4g
ZmFyX2RldiwgJnBheWxvYWQpOw0KPiA+ICAgCQl9DQo+ID4gICAJfQ0KDQo=

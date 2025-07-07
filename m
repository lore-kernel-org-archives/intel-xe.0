Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FA4C8303C
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 14:57:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F287210E4C9;
	Mon,  7 Jul 2025 14:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RYSV3Ii2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB33210E4C1
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 14:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751900224; x=1783436224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jzL3ogz9fbr55CZSGL1zA/ZNMLI5nwRifnh9hShsAMg=;
 b=RYSV3Ii21pgz9/q7ScsJtD5m5t4xH1MHB3wZOiqLlBD+h7YM0Vato9T3
 nUjTwk01/CPzn5bCT49GzdFFa4BISGRwWBsE8OnuAUdm8s0NHcg40r4Po
 tmcSU3ZHeTzP5mDMQA7QMxVCnZdH4fuOEd/OI4kuFYIOtharEJImnDmgX
 CMMkq0BTrxRsH9bo9LEQM/76kqsedr2Go6D7FKfA8G2SMEFwcs+/sn4Pp
 Xswi/YX6yqBAnXbflaBmShRwgFGKDNoRGhqnRGZdj7kn2fy3cg6SlU0Wv
 CPWMmAYngpoCGaIzO6+A1a8aEiwRkC4gQPEqOTQ2s3NvcCqUq8fctaGW7 g==;
X-CSE-ConnectionGUID: SW5R6ROYTjiDZZLINCjsdQ==
X-CSE-MsgGUID: RhAYq5u/S6yLQXY2AcR+kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="65577278"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="65577278"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 07:57:04 -0700
X-CSE-ConnectionGUID: 005BL8yaRWGglfli12FkQQ==
X-CSE-MsgGUID: 4k8F+NeaTtCTEYPEP8a7+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="159505125"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 07:57:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 07:57:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 07:57:03 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.50)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 07:57:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AShck8iID0mt8EUlpOZcDsyw8VMNcdJLjcyGW/2uI0qS+3paZ3o8tuMI4hI8+6/mr3JGpCrYKTDjfVnuIv73KzT9KInoyD1/T3RiARC6Ei6ssPkgFZt818gO7KLMzHhkZLUYg+LTe9irjYwnH83EZ3x7HmXgpkgue2dEXPibWu5y5JAHSXeKn3QNwVRO4qZdwCGwTSt7QwbVOnnQEO0BgjT8mJwjxA59xNywnBrcRt/+iO6XTf5MfokGIpP6tH93/TdPy2imzUtHVieRR0JdrgnOuNcUxWghZPNOgoAi7MLENaUjXPQ8bsDvZoVHE9wgsSmxIIZtGZ0zsDDdjF9rAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ck2MsvGwM84Ly4sZcqBwIjNeAwEvNXl3ulQenFkmqAk=;
 b=LSRrcUXqhwN717/iVJlYzG2+cZaAY2dFGQiUmeNsBWcU90gloq/1M9Od6edXiTVtOTf1VtbPXgs+6TSy7ZT9xuXoqVHMDg2aDO9w0Ea566q4+UIi9asyrxxwdTMjijWOEnfwt1hKXCSbUY6uc9zUa8efJGgcb5enQr2CCESDt6Ry6ME4eOZojIDfG9AJp228uJYmLQuUmZ2o0w4G1swbbwGj+XVlFsJrAOlxqOIiLfFSYwwIX2SWdKuUMK/eYeDx4rUo8OlXY/OLZ//WlrzYN3+jepzVjNEtCjIqNOByJTUWXA8cJjG85UYZPqMSTvHPx/edEqDgK5tw4/l1UaefYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SN7PR11MB7417.namprd11.prod.outlook.com (2603:10b6:806:345::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Mon, 7 Jul
 2025 14:56:26 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Mon, 7 Jul 2025
 14:56:26 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Jani
 Nikula" <jani.nikula@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v9 3/4] drm/xe: Move struct xe_vram_region to a dedicated
 header
Date: Mon, 7 Jul 2025 16:56:08 +0200
Message-ID: <20250707145609.3857467-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707145609.3857467-1-piotr.piorkowski@intel.com>
References: <20250707145609.3857467-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::28) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SN7PR11MB7417:EE_
X-MS-Office365-Filtering-Correlation-Id: f8e84f4a-dea3-4c5c-7707-08ddbd66729a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWhBWDFqY1VWc3hLVTRaekVjZUMxbFdYM1hTcDVZK0NDYkN2Yng4T01zWHE2?=
 =?utf-8?B?dGZlb2pTdWQ5NGtnVTREbmJwQ1VUa2VkamRLS0ZPMExWaWVOclB1VExaNWtj?=
 =?utf-8?B?YzBIcHBhSWM1ZFlObWFpdkNZa2xQN25pUXZEbWVvYzlsUjJpeUZJRUQ0UWRW?=
 =?utf-8?B?ZXZFOWFuMmtJQm5RUEE1cGNhb0NPZk9LbnRoZHRGc3BaQXA2aElrK2xFUTBE?=
 =?utf-8?B?M1gxR3h2djh1a1lheGtPYm9UK0FqYitiSm03VjFWWm50OWdvNWc2SERIRTN5?=
 =?utf-8?B?NTdpeUFnaEVqbG92bFFkY1FkbkphV1JiaDJCUzU3MUlUaXhjY2ZUTmwzSkl4?=
 =?utf-8?B?TUdlbzdhTjFDN3g3SFFQdWJnYWRMWDRobnU3NmlJV0dHMkMyYXFqbUl6SVBK?=
 =?utf-8?B?a1hLSFcyTWo3QlJFNkE3eDZCcERVdmdIcExSZGpuWVZpNzhYUENwUlJmUFNH?=
 =?utf-8?B?QzFFcjBXTG9Od3FPUndMRnlQOVhlVllFenBBNkU4TDM4a1RXZU9ZZnB0ZmQ5?=
 =?utf-8?B?dTc3enRCdlJBTkwzWVhSWHRVTFVYV29rUWc5Z1M0blpIb2tvbmQ0dVJiUG9L?=
 =?utf-8?B?cWZaRnJ6NUNKVnNCalVIZlgvV1hGbi9Ja3pFMnRTTjBZYVF3RUxkU2grNFR6?=
 =?utf-8?B?bFlWNWp1VytDNWZoSHdDV3pTY3VGa0xvT0k4cVhvTkJadUxHang2QWZvckIv?=
 =?utf-8?B?QzljZGpoWTRwcko3cWlHeUp4cVRtSTIva1JscnRBTkJLOU5sa1ozVCsvaUIz?=
 =?utf-8?B?NVRSRVZ1QXdGWWpWV1Z2N3R1MjF3MC9wclh0UGM3dUcvaXJWNmRtTHJXUHZG?=
 =?utf-8?B?ZG1tV1FWRURuYTdRbis5ajdPT2drSms2c1VNbzZxbWV2VlRvRi91WnhnbVg0?=
 =?utf-8?B?ejNaTlVVWGw4eEdEVG5EUFlTZFphSXlyQmxzMGFIYUhQTGk3L3BlR1VCZllY?=
 =?utf-8?B?eGkreHJqWFZnNXJUUitVN1dsRzcxTTZ2ZWNzZVlkc1JOdk9oK3FWMWp0S0ZB?=
 =?utf-8?B?cDZGNXpQVkNTOVlMaWNmZzg5MzJ0WEpqOWF5b1pPVmlxVjF1Zi9ZUHJOOU11?=
 =?utf-8?B?ejRsT2lVQkpQR05oTkVZV0M5eVlRNEdXWlVkZ3hGdllVN3pTVi9iYkU2YzZF?=
 =?utf-8?B?Zm04SU90UWNXanpUTVpkenBEcTFldWswbUlWSnlsRjY4RUt2RWJDTGFJV1lx?=
 =?utf-8?B?N1VKb3NuSDNaM0RsSFJGOEdEMHZHb2w3M2ZQeE5TYWJiL2FmQkR5SkR6OUVk?=
 =?utf-8?B?M2dldHpNN21ERVFoYXNjUStJV2tBNU9QZjltMHVNVHdkQWdTbDJYSkJQSzNJ?=
 =?utf-8?B?S3BXYWpnNmNOQkFOK2VsempieEdnanNwNHdDT1hxdVBuMURxaHljUlRMMWNJ?=
 =?utf-8?B?TVdNOGo4TlVXWUM0OHpVczdKV2cySHFqTHV5TEoxRHdDcXA2c2JJMkJldlh3?=
 =?utf-8?B?dFBjN2EwRHlkZWlwdHVDQnZLZk5TcERZWDJVbGZGa0R1R3pzaitJTit2c3l2?=
 =?utf-8?B?VzFIbm5PdWNsQlptS2kvaGRBOVEzRk4ydnNCSHBUcUlaN2pwQXFrdVlra2tP?=
 =?utf-8?B?UUxkbDRJS1U2WDhJaHdOQlJLKy9nSnJrS3phcmlpaGI4RjJMczlaQUREcW5p?=
 =?utf-8?B?MTN0S2RMcUEyeGN2d3NmVXJ1N1NSYmxFa3k1Z2tZcW1PckF2bHFDQnZHVVFx?=
 =?utf-8?B?TnZuQi9yNEUxcUNScDN4SERrT25lY2FhNGs3NVRWRmJEM0RVNmFtMnZudWlP?=
 =?utf-8?B?dE80QjZna2JhSGVGQWxBNUJlUTJpZHNBNUlUaktnYXFTN2pzTjQzUGtMUnZY?=
 =?utf-8?B?bFkvUHVjL2VsK2ZRN2g2dWpWNGFOK2F6bWYyRENTb3FLdkxNTGF4ZlZsN1Ry?=
 =?utf-8?B?aEtJcDFnclhjcjh4MmlmY1QxbTdOV1VQNHdQRDhNT0hzYVVML0V2NG82eWZC?=
 =?utf-8?Q?JuXKnfFMr60=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmZreW96aE8rbEEyYWlFbW1mNmJUNmFIWk5URFRyLzM4YVRhaEFVejQzUVpq?=
 =?utf-8?B?M2NGc2kwdTh0NFJQR1lGS3ZLOUMwZTJOVW5GdXhVTXRXYmx0OFlCRzA5STAx?=
 =?utf-8?B?SHhiR081VjQ5K0FUUVFPWUxMNDNOeGV0M2NCWEdCYnpFUXlVWXpjb1ZCdkt3?=
 =?utf-8?B?dTFMU2lXSmREQ2FSZlNrSiswTEZkS0VzN2JYZDRJMDNoUDRCUzRPRkhHSGFE?=
 =?utf-8?B?RUxnZHlOR01vOU9pNnNQeGhSOTNoM0RCdlNjYmRDaUdzUnBrQTMzSzk3blVn?=
 =?utf-8?B?TVZmT2VoODJKT2lJY0M4Yk5ISXZ5NE5LNUZUNFNNNDdnL051dkY0a1czTzZQ?=
 =?utf-8?B?b3c0SGdZS01DOW94TERoUTB6UXF6WG9CSlVtdFNMeitnSXJyNm16dUxPSCt3?=
 =?utf-8?B?R1d2cmtpRnoyazBIN3phRHpzSXZsQU1TYzZhOHp1K3c1Zzd1UnZFNjYzcWts?=
 =?utf-8?B?MDl5cXNBWTJCMkhESTZDUUgyaUswRmt5eGlqZDdHdjR6WE5ndlh4WHYzZS9m?=
 =?utf-8?B?MzQyQ0t5ZFJqYTQybFJvenJ0eVM4ZU55Mnl3UHRkU1NJQkNGVnhHbjc5eTlu?=
 =?utf-8?B?SE9sTldUWUNtUHhmQnIweDV2MWgyUDRrRnU4VDJLOGpESVJMK05zM2Y3N0o4?=
 =?utf-8?B?N1JiNFpONGRpNVpabVl2YXlJdy9nTDBrYnJtZHMxMXIzeWU5S2wwZUlZbG9F?=
 =?utf-8?B?MDJTR2VIREFBUnhUem5lZGNQSGQrODJCbW5XV3RUUDhHRXB0K3dneVIwUEVk?=
 =?utf-8?B?Si80TmtqdVYwNlVXYjdQM0xKL3VSNXpzQXkrVmlOQWgwa2U5N0tsc3BBZHcr?=
 =?utf-8?B?ZkZuYjllSzd1MmZoRDVmM1dvTnovaTdpVnNQaGVwVmJuK1NiZTRrSGtES0RS?=
 =?utf-8?B?MUtINWg4bXl0TVVVU0dyMGd3enV3RXNZYlVRTUZBZGU5R0gzRFVPclJCRDM3?=
 =?utf-8?B?M29GaUZ2VTFpMHVQaVBQWUljaTg1ck5tTnBJcVhrTUdFRm9MNmphS28zWXNp?=
 =?utf-8?B?bEx3dFN5V0lSMU5GQTVGRStIR3ZFa3A3Q3NEa095NndBZUtCTWF1SkF0M01l?=
 =?utf-8?B?c2tzNXEyY2ZFTEJ0MldZKzdUSjhybURCYXNQRnRNcW81UE5uR1VwNzRuc1VX?=
 =?utf-8?B?ZEZaVnR3Yy9lclFSZjgybytGTTRFL21WSHUrcGRHRTNMUFVGOFNmVURIbVQ4?=
 =?utf-8?B?WWI5Mm5yNDJUQlhBVHNCa29IRHo3cDJzQzJvc1hMZkk2Vjd4ZGpVOUVwODJQ?=
 =?utf-8?B?MDljbUpod2d1WWpYanp2WGFpemEzUzFJTVJvSVU0eWhwdEp0UXMxS2NWSmc3?=
 =?utf-8?B?a1BuUjY0QXQ5bXprZXNETkNjVWoySUgyeHJQMHNwa08zNjAxQjdXTU9DZGZ4?=
 =?utf-8?B?ZGM5TUhDdWdqT3ZjRlNMMHRzZzIzeGFCUHlzUXZsaFlCOHRSL0xGVWoyd0M3?=
 =?utf-8?B?VDIweDhPZVFVT2hkKzNocCtNS3dTaXJndDhza1J2VmN2M2RhcjVaMXBLYzAy?=
 =?utf-8?B?c0dQanpMRG0xUHk2cXgxRnd0T3hoa045VG93NTdlRHpJb1RhS3J3TVBVVlU4?=
 =?utf-8?B?VVNtR1lXR3ExbU8vdDNhMldTSkRSL2l0UktuUkRoVDc4VTVVQjhydXFzN3Fy?=
 =?utf-8?B?NEE0R2FVTENDNDZoaEs3Rk45TjhsVVphVFg4bG13OEtBRWc1K29DNVlDc3g1?=
 =?utf-8?B?elFMenVLYjRyTWNoSnRnSDI4c3FOU0tpc0F2RzVIRlNYYmxLRUZjUHp4emRq?=
 =?utf-8?B?Y0c3TDBaeDg0dHRvMjN0YW5DTVlNQnoycVVwSjM0R216Rkc4VDEreXlyY0pu?=
 =?utf-8?B?L2xiUUMwNSswc29rZkRNTDVTcTYxcDB4YjVOblMydlRoRFZuakxoVHRxd0FW?=
 =?utf-8?B?c3NRUkJEN3crUld5RmlJRGpraFZaVTAyZkQzMTVrWEdqQWR5YmpTdW5LYy9p?=
 =?utf-8?B?OWVuNUs1aW9HMzM4RzBhNTVrSFNYMkd0OWRXbXJMb2Z3a2V0YVhESUNUaHd1?=
 =?utf-8?B?Q2xMSzQrWUlLaVpHODBZVnpYYWxSeXU5MnYxSVZHU29JNGxqNEN3aFY5Wm9R?=
 =?utf-8?B?dlAvV1hyNDY5Y1FIT200Y2s4T0hHTFhrSE1uSFBVcnVYUWo1aStSTjNObEw3?=
 =?utf-8?B?N2ZJRDU3N2VYTFdCWi9ubTYzNUNjOFRmTk9pTlVzbktnUTE4WWNUY3ZSN25U?=
 =?utf-8?B?WUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8e84f4a-dea3-4c5c-7707-08ddbd66729a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 14:56:26.5077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GulToCUvvpJJMQlOysedcYUrFSB7KEiHxNTVVtqfjk569IgEI8W/GdBAaaosCSqsvyfRq60KRz1KYdpHE6DYV7Zi37iDy8YUCUtTaLJnv/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7417
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Let's move the xe_vram_region structure to a new header dedicated to VRAM
to improve modularity and avoid unnecessary dependencies when only
VRAM-related structures are needed.

v2: Fix build if CONFIG_DRM_XE_DEVMEM_MIRROR is enabled
v3: Fix build if CONFIG_DRM_XE_DISPLAY is enabled

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Suggested-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  1 +
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  1 +
 drivers/gpu/drm/xe/xe_bo.c                    |  1 +
 drivers/gpu/drm/xe/xe_bo_types.h              |  1 +
 drivers/gpu/drm/xe/xe_device.c                |  1 +
 drivers/gpu/drm/xe/xe_device_types.h          | 60 +--------------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  1 +
 drivers/gpu/drm/xe/xe_svm.c                   |  3 +-
 drivers/gpu/drm/xe/xe_tile.c                  |  1 +
 drivers/gpu/drm/xe/xe_tile.h                  | 11 ---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  1 +
 drivers/gpu/drm/xe/xe_vram.c                  |  1 +
 drivers/gpu/drm/xe/xe_vram_types.h            | 74 +++++++++++++++++++
 13 files changed, 86 insertions(+), 71 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vram_types.h

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 2187b2de64e1..f2cfba674899 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -16,6 +16,7 @@
 #include "xe_device.h"
 #include "xe_ggtt.h"
 #include "xe_pm.h"
+#include "xe_vram_types.h"
 
 static void
 write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_ofs,
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 873f4e18cb2a..11591c7cdc70 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -21,6 +21,7 @@
 #include "intel_plane.h"
 #include "intel_plane_initial.h"
 #include "xe_bo.h"
+#include "xe_vram_types.h"
 #include "xe_wa.h"
 
 #include <generated/xe_wa_oob.h>
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 7f8470b22dc9..a35a9e0dbfae 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -34,6 +34,7 @@
 #include "xe_trace_bo.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
+#include "xe_vram_types.h"
 
 const char *const xe_mem_type_to_name[TTM_NUM_MEM_TYPES]  = {
 	[XE_PL_SYSTEM] = "system",
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index ff560d82496f..57d34698139e 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -9,6 +9,7 @@
 #include <linux/iosys-map.h>
 
 #include <drm/drm_gpusvm.h>
+#include <drm/drm_pagemap.h>
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_placement.h>
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 19019b032c78..4bd0619574ff 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -63,6 +63,7 @@
 #include "xe_ttm_sys_mgr.h"
 #include "xe_vm.h"
 #include "xe_vram.h"
+#include "xe_vram_types.h"
 #include "xe_vsec.h"
 #include "xe_wait_user_fence.h"
 #include "xe_wa.h"
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index ece4bfcde477..55b068183f8c 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -10,7 +10,6 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
-#include <drm/drm_pagemap.h>
 #include <drm/ttm/ttm_device.h>
 
 #include "xe_devcoredump_types.h"
@@ -24,7 +23,6 @@
 #include "xe_sriov_types.h"
 #include "xe_step_types.h"
 #include "xe_survivability_mode_types.h"
-#include "xe_ttm_vram_mgr_types.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 #define TEST_VM_OPS_ERROR
@@ -36,6 +34,7 @@ struct intel_dg_nvm_dev;
 struct xe_ggtt;
 struct xe_pat_ops;
 struct xe_pxp;
+struct xe_vram;
 
 #define XE_BO_INVALID_OFFSET	LONG_MAX
 
@@ -68,63 +67,6 @@ struct xe_pxp;
 		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
 		 struct xe_tile * : (tile__)->xe)
 
-/**
- * struct xe_vram_region - memory region structure
- * This is used to describe a memory region in xe
- * device, such as HBM memory or CXL extension memory.
- */
-struct xe_vram_region {
-	/** @tile: Back pointer to tile */
-	struct xe_tile *tile;
-	/** @io_start: IO start address of this VRAM instance */
-	resource_size_t io_start;
-	/**
-	 * @io_size: IO size of this VRAM instance
-	 *
-	 * This represents how much of this VRAM we can access
-	 * via the CPU through the VRAM BAR. This can be smaller
-	 * than @usable_size, in which case only part of VRAM is CPU
-	 * accessible (typically the first 256M). This
-	 * configuration is known as small-bar.
-	 */
-	resource_size_t io_size;
-	/** @dpa_base: This memory regions's DPA (device physical address) base */
-	resource_size_t dpa_base;
-	/**
-	 * @usable_size: usable size of VRAM
-	 *
-	 * Usable size of VRAM excluding reserved portions
-	 * (e.g stolen mem)
-	 */
-	resource_size_t usable_size;
-	/**
-	 * @actual_physical_size: Actual VRAM size
-	 *
-	 * Actual VRAM size including reserved portions
-	 * (e.g stolen mem)
-	 */
-	resource_size_t actual_physical_size;
-	/** @mapping: pointer to VRAM mappable space */
-	void __iomem *mapping;
-	/** @ttm: VRAM TTM manager */
-	struct xe_ttm_vram_mgr ttm;
-#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
-	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
-	struct dev_pagemap pagemap;
-	/**
-	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
-	 * pages of this tile.
-	 */
-	struct drm_pagemap dpagemap;
-	/**
-	 * @hpa_base: base host physical address
-	 *
-	 * This is generated when remap device memory as ZONE_DEVICE
-	 */
-	resource_size_t hpa_base;
-#endif
-};
-
 /**
  * struct xe_mmio - register mmio structure
  *
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index e69a05126dae..275ab5f03291 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -33,6 +33,7 @@
 #include "xe_migrate.h"
 #include "xe_sriov.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram_types.h"
 #include "xe_wopcm.h"
 
 #define make_u64_from_u32(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index e6871734ffa9..ee015e3f5d9e 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -17,6 +17,7 @@
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vm.h"
 #include "xe_vm_types.h"
+#include "xe_vram_types.h"
 
 static bool xe_svm_range_in_vram(struct xe_svm_range *range)
 {
@@ -1006,7 +1007,7 @@ int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
 	xe_assert(tile_to_xe(tile), range->base.flags.migrate_devmem);
 	range_debug(range, "ALLOCATE VRAM");
 
-	dpagemap = xe_tile_local_pagemap(tile);
+	dpagemap = &tile->mem.vram->dpagemap;
 	return drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
 				       xe_svm_range_end(range),
 				       range->base.gpusvm->mm,
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 858ce0183aaa..bd2ff91a7d1c 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -20,6 +20,7 @@
 #include "xe_ttm_vram_mgr.h"
 #include "xe_wa.h"
 #include "xe_vram.h"
+#include "xe_vram_types.h"
 
 /**
  * DOC: Multi-tile Design
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index fb0473fa9098..8dd87ccb2aca 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -18,15 +18,4 @@ int xe_tile_alloc_vram(struct xe_tile *tile);
 
 void xe_tile_migrate_wait(struct xe_tile *tile);
 
-#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
-static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
-{
-	return &tile->mem.vram->dpagemap;
-}
-#else
-static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
-{
-	return NULL;
-}
-#endif
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 3de2df47959b..8f9b8a1d2c05 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -15,6 +15,7 @@
 #include "xe_gt.h"
 #include "xe_res_cursor.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram_types.h"
 
 static inline struct drm_buddy_block *
 xe_ttm_vram_mgr_first_block(struct list_head *list)
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 71f463f2c3be..35fd7f5d7cff 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -20,6 +20,7 @@
 #include "xe_module.h"
 #include "xe_sriov.h"
 #include "xe_vram.h"
+#include "xe_vram_types.h"
 
 #define BAR_SIZE_SHIFT 20
 
diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
new file mode 100644
index 000000000000..a01838236036
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vram_types.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_VRAM_TYPES_H_
+#define _XE_VRAM_TYPES_H_
+
+#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
+#include <drm/drm_pagemap.h>
+#endif
+
+#include "xe_ttm_vram_mgr_types.h"
+
+struct xe_tile;
+
+/**
+ * struct xe_vram_region - memory region structure
+ * This is used to describe a memory region in xe
+ * device, such as HBM memory or CXL extension memory.
+ */
+struct xe_vram_region {
+	/** @tile: Back pointer to tile */
+	struct xe_tile *tile;
+	/** @io_start: IO start address of this VRAM instance */
+	resource_size_t io_start;
+	/**
+	 * @io_size: IO size of this VRAM instance
+	 *
+	 * This represents how much of this VRAM we can access
+	 * via the CPU through the VRAM BAR. This can be smaller
+	 * than @usable_size, in which case only part of VRAM is CPU
+	 * accessible (typically the first 256M). This
+	 * configuration is known as small-bar.
+	 */
+	resource_size_t io_size;
+	/** @dpa_base: This memory regions's DPA (device physical address) base */
+	resource_size_t dpa_base;
+	/**
+	 * @usable_size: usable size of VRAM
+	 *
+	 * Usable size of VRAM excluding reserved portions
+	 * (e.g stolen mem)
+	 */
+	resource_size_t usable_size;
+	/**
+	 * @actual_physical_size: Actual VRAM size
+	 *
+	 * Actual VRAM size including reserved portions
+	 * (e.g stolen mem)
+	 */
+	resource_size_t actual_physical_size;
+	/** @mapping: pointer to VRAM mappable space */
+	void __iomem *mapping;
+	/** @ttm: VRAM TTM manager */
+	struct xe_ttm_vram_mgr ttm;
+#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
+	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
+	struct dev_pagemap pagemap;
+	/**
+	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
+	 * pages of this tile.
+	 */
+	struct drm_pagemap dpagemap;
+	/**
+	 * @hpa_base: base host physical address
+	 *
+	 * This is generated when remap device memory as ZONE_DEVICE
+	 */
+	resource_size_t hpa_base;
+#endif
+};
+
+#endif
-- 
2.34.1


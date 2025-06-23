Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0238C7115B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 10:45:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D79410E357;
	Mon, 23 Jun 2025 10:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LWNiNKTS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7466110E357
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 10:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750675556; x=1782211556;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QB6/JEDGKlHSauadTIccW2IZ3Olduk2Jt2V62cDg4l4=;
 b=LWNiNKTSDTgxKa+nFrVlly28cB2lNH6fh9Y+1oEe4W4CgKSLHjP14ImK
 HT+XnNbaT3+AxkMFjpGQmRb6j3pPyk6FqMPCjVAu9oxbe7TW9Oh1z7KMl
 pP1zMAtwcDZ7XLOH5HzpjGOERjTAgy7yOeH3Q4t1T2S3nwmRjCoNIbsFg
 Krn/RLwyT2/UFxpc7jFwnTuAnqLFXtumwagk1Pd/wHqU0M8oclEJUxpGu
 ywsTloFPgoxNRENhcoeCXEysP1B31zHV0zeQUs61f0v6tafjW9HXwNqd0
 uOtYH7BWkZl/SgjyU0cWYPnlosId0OowcbcZUgDuwG1k2JnBsPs2o0muO A==;
X-CSE-ConnectionGUID: HQbeL5BORXu9DecvpH5+vA==
X-CSE-MsgGUID: QOiI3z50TgedV0bCWMiaQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="55510482"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="55510482"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 03:45:56 -0700
X-CSE-ConnectionGUID: 6t5/anVPQ4Sw7aitt9hCvw==
X-CSE-MsgGUID: ciBHu7PmR0mHV/aZpv98Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="152082742"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 03:45:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 03:45:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 03:45:55 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.64)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 03:45:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AblaXIz8XQyQWAyoHgVzePoLj5c1bbKQELKC5JXf+eK5Mj3ylBOaASQOLzJWLnsdZ0Iu3FfKyxddmRl2djz0dhx0AP7KaZ+PiQR8ou6/3aW0cnBt9rPbJSbCkmSusHRiTKkZR87Vx7Dob4rYeIzxMj6U+XgmXbwj5jmsxdn5JRepP9/UuvEHNnVbNUPjC+Bd/W0V9MGSCqAZkMoGjiQduWDkYEO3pTCJ+clQrDa1E2fW9BT+WD8pwUze79YXt7N2ppxSg0X2esV4AnvQpYtFTA6RtQ7s20oxBbRUrTFB7iuNshm4XKXhaZHcHc/VViRwBqwgZ3itkgFvzFQr9vWrXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=akw1jaKS2U/RyWXsCVyKiz12x85S83lPnlO+2PBMcAo=;
 b=ur8VU2VN0lalvhggJSgryeUZ/5KCa+QQjG/OcEGYZex0PvvXM083OZabS2aTirAjCzvWyYIN1ryjNHO1DyI+hoBxUuBYI3jQRSW9zXV5ELV4NmEag+Gv2ISwAGyMjRFtTrV9r1ECU4M39RHQyfrIvzR98IELNfp6srXpe/wv8NrCZ4RoU3b7UHWxdBI8qmpvrccupt8LBzSdmvlzE2Ef9wUz0vysRKMjwJHisWkIPLTJvrVFD7CPSYsM8xRmYvQvgXLY846jhACdoQMRe/Kmq1D6uuH16SSFB3s+LH3KJWj24IfRykOtmi4SQxjfWc5Jp7uVSjsnid0dMrzR4NF6qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by IA4PR11MB9201.namprd11.prod.outlook.com (2603:10b6:208:561::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 10:45:25 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02%6]) with mapi id 15.20.8857.025; Mon, 23 Jun 2025
 10:45:25 +0000
Message-ID: <790f40b0-f9ec-44cc-8f99-d6c76d16be66@intel.com>
Date: Mon, 23 Jun 2025 13:45:19 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Support for mmap-ing mmio regions
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <koby.elbaz@intel.com>,
 <konstantin.sinyuk@intel.com>, <yaron.avizrat@intel.com>,
 <moti.haimovski@intel.com>, <didi.freiman@intel.com>
References: <20250609095938.16782-1-ilia.levi@intel.com>
 <aEcByyaKe82P91RT@lstrano-desk.jf.intel.com>
 <fd377581-4013-4139-aea2-9fb2578d2773@intel.com>
 <aEg/T1kv2/lJliuh@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <aEg/T1kv2/lJliuh@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TLZP290CA0009.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::18) To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|IA4PR11MB9201:EE_
X-MS-Office365-Filtering-Correlation-Id: c2c8948c-0e68-4f7e-646c-08ddb2430f64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHZUZUNrL0lDa05LRG13b2ZWQmQ3QzF2VlJnWEFnSkVDOE5nd04vRGRjMHBU?=
 =?utf-8?B?dUdiVWRIWXhmMDdPbDJFaEs4Um0rYTVJZGRaSDY2TzY2NHFzZHlRRCtOa1Jz?=
 =?utf-8?B?ZDZzOG9YYUJyU1ZUei9sRnExT1JFRlBYYk5EU0M4cSt2N0xjRXE2OWpqWFRp?=
 =?utf-8?B?NVAzSlRrUForeGxoVFFkUGpaRkZqZFdqQkdUWDJzaXJmbGZaVVNBbmRKMVNI?=
 =?utf-8?B?SlBLTDBJaGJMNUNZYm9QUkExUkc3aUorRmhJWnNLd2xxeVI3R1g3VStvOGRn?=
 =?utf-8?B?R0RTZGgwKzVQcFZZZGFacjZqeDY1TkNibDFQbDQrV0VOcWp5b2F0WUNXa3F2?=
 =?utf-8?B?eWxhSWtDOUFEdlU2UTJReFBRM3l4TkdnOTBta05pclhGTjNWckVYQjc4UmdF?=
 =?utf-8?B?ekJoY3dkMWlXS01BRmFjVkc1T2pIdmJlVmg4SFE0NkRxRGlmNnJQamlSSzA5?=
 =?utf-8?B?cERvaSt0cElCb3dudUVHWndmckVvQzJtRGpqMXhBeUxzeXhWVXNQa2JsRVBk?=
 =?utf-8?B?NG1GK3ExWVlNUTQ3T0dzZ1BqTDdnWHg2MVNSZkFGWGtrbzZTQ2szeXVFQ2xt?=
 =?utf-8?B?YXNwZVQvUmFxY0tieTFReEtPTmdESlp2THlHY0lRQk9GT0dETGZLT0FNRFlw?=
 =?utf-8?B?RkV6M1QvYzRXM200bmsxMVl5eW40Wk1wcjJpNWZyd08vUEVjS1NBdGN6dTJX?=
 =?utf-8?B?NmVEMDQ5MVhDMFpHN3g4Ky8xTnJYYkNEZWpvVEdWenpUYlJTYTBmYVZlL1Z0?=
 =?utf-8?B?bnhSdm53RFlRT28zb3hpdHZ2V1RzZGdDbjZsUmlmUFcxSjJhTGNUeGd0Uktp?=
 =?utf-8?B?ZGk2NUNnZWR0UTBvSVVkUTFjcTc5R2VsaDVlRXFOVjJBOHBCdFRNcFA4eDhh?=
 =?utf-8?B?OXJZdDRIeXJ0NlVUNCtaOFRkY0oraitJRW5NcG9kbitMVUpZR3dUVFFsdDBZ?=
 =?utf-8?B?V1h3M2lRMzU5TVF4ZHVyaDcySWlUVGdqR3FYOW1JVzUrcHo3RUVSYlFneGpM?=
 =?utf-8?B?T0dzS29SakxMK2QwQ1Uxcnc1S0FJTE9pWHU5YjU1T1UzcUNjNHl1dHlpUnVp?=
 =?utf-8?B?VFNPUXdkY3lBbGRGdWxDRWFKcSswbWhiK1Q4VVZIdlVYcmMvaHVPMkxXcEpM?=
 =?utf-8?B?SHgxV0RYcGlLMVZDVVlmcEZrTEZHR2FrbUxjTG9NdUwzc0FBRkdET2Z4TERw?=
 =?utf-8?B?Q1RpK2dWajFWa2ltakNHUkhaY054QytoWUQyT0RpZmx3bDBUTG03MmZqdzJG?=
 =?utf-8?B?eWZpbXVwWlM1UUNuVWJZZExqd1JId0F0Vm1uUlZjMjZ5aXp6K01XelFHSWFm?=
 =?utf-8?B?VllvWW9YZXIvRnF6c1VYNlhuNyttc05XZlpyc0FtWHhwdzJGa09LcHpVMXE4?=
 =?utf-8?B?STJCUEc0NWVuZkRZSUdQdGlSNjV3VUs5YWFUUmVsR2ZvbTZFajBOaENjays1?=
 =?utf-8?B?cXIwWEQ5eXNBUUtJMTlROS9RenNCWHZoZ3p1NEcxcVlUSFR4L0d2RytQWUlQ?=
 =?utf-8?B?SXZzdGJVOThCQjc5RDg2djNIVzNnL1BBZUxoR296U1FWU25Ecmd6cGlBNlBi?=
 =?utf-8?B?L2tNUzZZdnpXMk1CNURZM09YTWxzSk1MSlc5QTY0ZU9ZRzdzZGpRVGd1ZG51?=
 =?utf-8?B?b0NuSklpUEhnbnN1N25zN1EwdTFHRkF5UnpMb2xpQ04xU2cxdjNxTSt5YmY1?=
 =?utf-8?B?c0Fza044RHh2WEVXNzBjY2R3bkJJOGYzR0w4Ti9MdW1IWVdHZXpFdFZITXBJ?=
 =?utf-8?B?dG5hRmhmNzRYUkc0NmlGaytNRGxIOFFqc0RHQXVTOG1UWXIvT0k3dDVhYjhO?=
 =?utf-8?B?SjFENTVGalMxaVVSbzdYOFg3VWVrYUdvSTZkK0VtM1J5OGJDYktIV0ZwczZy?=
 =?utf-8?B?WlZ5eTdqUlFKMy9SOHhBVzh4QTlLems0Si80SWlQenJFOFdkaGJYdzQwaU93?=
 =?utf-8?Q?CrQw7SG+S30=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXdkMzl2QVdmL0E2UC9BMmNSSDFBT1IzOFhXNmhMU2tRTEE0ck9PTVphN0ZL?=
 =?utf-8?B?TnJRZWlBTUg4NU1EMTF6d3JFZ2k5eG1VSUFwV0NnVnc4cHM3MlcxdFRSS2hy?=
 =?utf-8?B?N09IaHM4MC9HTzFQSjFiM2NCa2ZLWlA5azBqMEdsRXppTDNIVHR0TFUzc0NP?=
 =?utf-8?B?QkZicmVSMWpqb0RTL2FRdzVTWFNZbXhoOE1XSFJFL0tBREw3N01RVUY0ZS8x?=
 =?utf-8?B?N2Jzb2Zyb05TbC8xbXJwVUFUcGtWaGx5bHl4RlhzWUNuMHZhdmFQT1Y5Yzdo?=
 =?utf-8?B?UStNUG1SNWZCcGVyeHBaeXpUVHo5RHFIeStVbnB2ZW1TODRaM3c3NlAxZi9M?=
 =?utf-8?B?WHM2eTlzcUhMcjkrblJCRVB3Q2Z5N3dWY3VDNksydDRNQk16SXE4RS93U3U3?=
 =?utf-8?B?bFJjc3NneEhlZVFhY04xZEE3NlNXSXBIR3pZVFRyeDNocTNadUhWV3lpUjE4?=
 =?utf-8?B?bVZISU1FNHg2WTN4WVQrQ0NKamRTVGFKK0NlMDBhcHRGd01rbEZ2dU9ldzFw?=
 =?utf-8?B?OURDa29tOEd5QjVmeEJmdHo4aEVyY3hBV2RLbFlFT3lDZnRZdTMzVWtzaXUx?=
 =?utf-8?B?eXVwNzhqMGJaelBSVnFoM0IvM3lvZ3M1SnFuc2Erc0ZkeHJVR1g2SUpXSEF3?=
 =?utf-8?B?bmVLbm1jWU9VQmEvSCt3cVlqdUZnWCtPcWx6S2FxREhYdUZTbWdHenp5KzMw?=
 =?utf-8?B?Wk5PbEJBKzdPV2dLeXh2UFNuSWdaVGxkYmFPZGsyVkNib2xJLzhqWnBrV0Rw?=
 =?utf-8?B?c1d6SGxiKzY0RzRtZnRQaWFZcVBiQ0dYRkRSOFRBNFBIS0FxdW15U2ptK1R2?=
 =?utf-8?B?cVJRemQxSXVlUGhPek5abTFzTFZSNUtCV1kwYkF3bHQ3eGJEY2VHZkljaFl4?=
 =?utf-8?B?UHFyMnlNSmMyNUJ5Wkd5Um9BN216VTRWcS9FaUZNeWppVStMb0NXbGxoREdH?=
 =?utf-8?B?U0owTHdlcGpLa2JQb2lBNmxyU0s3eTlkRkxXWGpCSERIL1J1bDB2K0RpTS9p?=
 =?utf-8?B?cmc1RjhCUFA4QVVaeVpSWGdNc2FHRVJrWVI2VFJOVlZSZ052N1FtMkVtM0VH?=
 =?utf-8?B?WHdlbnB4MVZLR2NoT09YaFNZTUJYalhjWUI3UGZUeU1lcnErcW10dDduYVJo?=
 =?utf-8?B?N2oyOHdyK1Q2azljdTBMSThtck1EenVVdDJ4d1M2OTIwYkJRanRpYm1qSjRP?=
 =?utf-8?B?WnNXaTBlQTI0cTB6WGd6WWJoSS9HdzJBbHYxaWlxVnl3b01ZRFdwUk9scVQx?=
 =?utf-8?B?MWJoeVZrN3EwQmJISGxTdThPd2JMYXRJbm5tZDRGbmJPVGZ2aUxiN3N1dkxQ?=
 =?utf-8?B?NFVMOG1yMTh5QmlSbS95QUY1ajROYlhEQzRZZW5wekk2TG10Z2ZIYUN2TDJs?=
 =?utf-8?B?Q1pxUmhRcU5GaWRFcU0yY3VmT2U4MnJNUEZkVFN1WXZVNUYyTVhYRXNLL1NL?=
 =?utf-8?B?dEdiaWpaK0tZKy9SN1gydlRja0FoMGJzQWRKVTV1Vmp5cTJDbnk4WEdWbWVx?=
 =?utf-8?B?SytYR3hvK2ZEbE5xM0F5SDg4T1paOStIZWd6R0NidmovNHNrSUJ5Vi9CVmE4?=
 =?utf-8?B?YmRhaFRjRElzTjA0L0djYlRJQXovTk5pRkE2UHVhS0RIWDdUVDVoa2owSmxG?=
 =?utf-8?B?bHlDWWJLN2pBazE4ZVVDbndJNU1DTlNJdVJYcGxleDRMalBQMVFGQ0laZzJX?=
 =?utf-8?B?SXUxRW4rZGJTQmxsQ2o4S2c4eklKQlNMZkV0d2kvR1JWQXhIMndhY1Z0b0JC?=
 =?utf-8?B?a3c2UTJkbzM2ajllNjRyYlVGTnY0MVFTaVJyc1lRak1NSEZnNHhHSkYxRGY1?=
 =?utf-8?B?UUdWY28rZkU1bENaWkJ2cGZQRGNwT3NqNkl5TnVxNEU1QXh6Ukg0WVJML0Y2?=
 =?utf-8?B?MXIvSkhhUDhkcXIzcTlBUy9uVlVLSUQyR3lSS3c0S3BNQmhGaWh4WU5pY01B?=
 =?utf-8?B?OGgwcVFKRVlraWhVdmlzcEw1YktvSkllMVFuMlVLc3J2RVFQb3QweTcwS2JX?=
 =?utf-8?B?aFFiOWV1RzBtRHpsU0xyMzJaM2YzeHRuaTdmUFJIOE9SYTZsYXd6TzdIUnpM?=
 =?utf-8?B?bk5MbFNnZDN5TlpERWkxNVVPS2lZbWxBSjArT0VrNENySGkwUHFMUElpQ293?=
 =?utf-8?Q?Veo9NAtKzFDUQkvZABC0nKvn4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c8948c-0e68-4f7e-646c-08ddb2430f64
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 10:45:24.9639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 98xx1kjuXpCexFm0nGZ7OaIPdaEB8KEiXeU6AmUgZkEdqZPA2+hPh0No/HrPQckPC8nt+27tCENvw2nQaW+XNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9201
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

On 10/06/2025 17:21, Matthew Brost wrote:
> On Tue, Jun 10, 2025 at 04:57:51PM +0300, Levi, Ilia wrote:
>> On 09/06/2025 18:46, Matthew Brost wrote:
>>> On Mon, Jun 09, 2025 at 12:59:38PM +0300, Ilia Levi wrote:
>>>> Allow the driver to expose hardware register spaces to userspace
>>>> through GEM objects with fake mmap offsets. This can be useful
>>>> for userspace-firmware communication, debugging, etc.
>>>>
>>>> v2: Minor doc fix (CI)
>>>>
>>>> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/xe/xe_device_types.h |  14 +++
>>>>  drivers/gpu/drm/xe/xe_mmio.c         | 142 +++++++++++++++++++++++++++
>>>>  drivers/gpu/drm/xe/xe_mmio.h         |   4 +
>>>>  3 files changed, 160 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>>> index ac27389ccb8b..78542de0d48d 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>> @@ -10,6 +10,7 @@
>>>>  
>>>>  #include <drm/drm_device.h>
>>>>  #include <drm/drm_file.h>
>>>> +#include <drm/drm_gem.h>
>>>>  #include <drm/drm_pagemap.h>
>>>>  #include <drm/ttm/ttm_device.h>
>>>>  
>>>> @@ -161,6 +162,19 @@ struct xe_mmio {
>>>>  	u32 adj_offset;
>>>>  };
>>>>  
>>>> +/**
>>>> + * struct xe_mmio_gem - GEM wrapper for xe_mmio
>>>> + *
>>>> + * A GEM object for exposing xe_mmio instance to userspace via mmap.
>>>> + */
>>>> +struct xe_mmio_gem {
>>>> +	/** @base: GEM object base */
>>>> +	struct drm_gem_object base;
>>>> +
>>>> +	/** @mmio: The MMIO region to expose */
>>>> +	struct xe_mmio mmio;
>>> Any reason not this is not a pointer to xe_mmio?
>>
>> Yes, I'd like to keep xe_mmio a lightweight object that could even be defined on the stack.
>> Here's an example of how this could be used:
>>
>> int foo_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>> {
>>     struct xe_mmio mmio = {0};
>>     struct xe_mmio_gem *gem;
>>
>>     xe_mmio_init(&mmio, xe_device_get_root_tile(xe), xe->mmio.regs +
>>                               SOME_HW_BLOCK_PCI_OFFSET, SOME_HW_BLOCK_SIZE);
>>
>>     gem = xe_mmio_gem_create(&mmio, file);
>>     / * store the gem somewhere, return drm_vma_node_offset_addr(&gem->base.vma_node) to the user */
>> }
>>
>> - Ilia
>>
>>
>>>> +};
>>>> +
>>>>  /**
>>>>   * struct xe_tile - hardware tile structure
>>>>   *
>>>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>>>> index 7357458bc0d2..6bfa915a9602 100644
>>>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>>>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>>>> @@ -408,3 +408,145 @@ int xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 va
>>>>  {
>>>>  	return __xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, false);
>>>>  }
>>>> +
>>>> +/**
>>>> + * DOC: Exposing MMIO regions to userspace
>>>> + *
>>>> + * In certain cases, the driver may allow userspace to mmap a portion of the hardware registers.
>>>> + *
>>>> + * This can be done as follows:
>>>> + * 1. Define an xe_mmio instance that represents this portion.
>>>> + * 2. Call xe_mmio_gem_create() to create a GEM object with an mmap-able fake offset.
>>>> + * 3. Use drm_vma_node_offset_addr() on the created GEM object to retrieve the fake offset.
>>>> + * 4. Provide the fake offset to userspace.
>>>> + * 5. Userspace can call mmap with the fake offset. The length provided to mmap
>>>> + *    must match the size of the xe_mmio instance.
>>>> + * 6. When the region is no longer needed, call xe_mmio_gem_destroy() to release the GEM object.
>>>> + *
>>>> + * Limitations: The exposed xe_mmio must be page-aligned with regards to its BAR offset and size.
>>>> + *
>>>> + * WARNING: Exposing MMIO regions to userspace can have security and stability implications.
>>>> + * Make sure not to expose any sensitive registers.
>>> This is no secondary issue, it is a primary one. There is no way we can
>>> expose entire PCIe MMIO register space to a non-root user (a root user
>>> itself can just mmap the PCIe MMIO bar bypassing the XeKMD if it wants
>>> btw).
>>>
>>> What is the requirement for this patch? I know on other PCIe devices
>>> I've worked on we had similar issues where we needed to expose a subset
>>> of the PCIe MMIO register space to user space for kernel bypass
>>> submission - everything we needed to expose in that case was 4k aligned
>>> + tied to a single process via a KMD config before mapping to user
>>> space. I suspect to do anything safely here, somethine similar needs to
>>> be done.
>>>
>>> Matt
>>
>> As you've figured out -  the idea is of course to expose small chunks (say 1 page)
>> that are allocated solely to a specific user. One use-case is direct submission in
>> upcoming platforms. I am checking 4K alignment in the patch. Not sure what
>> you mean about KMD config - xe_mmio_gem_create accepts a drm_file *.
> On the previous device I worked on we'd config some non-user exposed
> MMIO registers to tie the exposed user registers to specifc user process
> (e.g. we'd setup the PASID of the exposed submission queue). Not sure if
> something like is required on the upcoming device(s).
>
>> So the driver performs exposure of an MMIO region on behalf of the user and
>> only this user will be able to perform mmap. Do you think anything else is required
>> here?
> No, I think it makes sense now but personally I'd drop the reuse of
> xe_mmio and keep that as a heavy weight kernel object only used in
> xe_device, xe_tile, xe_gt, etc...
>
> Can you just pass in size / MMIO address (result of xe_mmio_phys_addr)
> to xe_mmio_gem_create? I think that would avoid a bit confusion.
>
> Matt


The usage of "small" xe_mmio's is actually something we do want in upcoming platforms.
But I agree that copying the xe_mmio into xe_mmio_gem is somewhat not intuitive (hence your
question about it not being a pointer before). How about leaving xe_mmio_gem_create signature as is, but storing only xe_mmio_phys_addr(mmio) in the xe_mmio_gem struct? I'll send out a revision with this change - hopefully it will make this less confusing.

- Ilia

>
>> - Ilia
>>
>>>> + */
>>>> +
>>>> +static void xe_mmio_gem_free(struct drm_gem_object *);
>>>> +static int xe_mmio_gem_mmap(struct drm_gem_object *, struct vm_area_struct *);
>>>> +
>>>> +static const struct vm_operations_struct vm_ops = {
>>>> +	.open = drm_gem_vm_open,
>>>> +	.close = drm_gem_vm_close,
>>>> +};
>>>> +
>>>> +static const struct drm_gem_object_funcs xe_mmio_gem_funcs = {
>>>> +	.free = xe_mmio_gem_free,
>>>> +	.mmap = xe_mmio_gem_mmap,
>>>> +	.vm_ops = &vm_ops,
>>>> +};
>>>> +
>>>> +static inline struct xe_mmio_gem *to_xe_mmio_gem(struct drm_gem_object *obj)
>>>> +{
>>>> +	return container_of(obj, struct xe_mmio_gem, base);
>>>> +}
>>>> +
>>>> +static inline phys_addr_t xe_mmio_phys_addr(struct xe_mmio *mmio)
>>>> +{
>>>> +	struct xe_device *xe = tile_to_xe(mmio->tile);
>>>> +
>>>> +	/*
>>>> +	 * All MMIO instances are currently on PCI BAR 0, so we can do the trick below.
>>>> +	 * In the future we may want to store the physical address in struct xe_mmio.
>>>> +	 */
>>>> +	return pci_resource_start(to_pci_dev(xe->drm.dev), GTTMMADR_BAR) +
>>>> +		(uintptr_t)(mmio->regs - xe->mmio.regs);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_mmio_gem_create - Expose an MMIO region to userspace
>>>> + * @mmio: xe_mmio instance
>>>> + * @file: DRM file descriptor
>>>> + *
>>>> + * This function creates a GEM object with an mmap-able fake offset that wraps
>>>> + * the provided xe_mmio instance.
>>>> + *
>>>> + * See: "Exposing MMIO regions to userspace"
>>>> + */
>>>> +struct xe_mmio_gem *
>>>> +xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file)
>>>> +{
>>>> +	struct xe_device *xe = tile_to_xe(mmio->tile);
>>>> +	size_t size = mmio->regs_size;
>>>> +	struct xe_mmio_gem *obj;
>>>> +	struct drm_gem_object *base;
>>>> +	int err;
>>>> +
>>>> +	if ((xe_mmio_phys_addr(mmio) % PAGE_SIZE != 0) || (size % PAGE_SIZE != 0))
>>>> +		return ERR_PTR(-EINVAL);
>>>> +
>>>> +	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
>>>> +	if (!obj)
>>>> +		return ERR_PTR(-ENOMEM);
>>>> +
>>>> +	base = &obj->base;
>>>> +	base->funcs = &xe_mmio_gem_funcs;
>>>> +	obj->mmio = *mmio;
>>>> +
>>>> +	drm_gem_private_object_init(&xe->drm, base, size);
>>>> +
>>>> +	err = drm_gem_create_mmap_offset(base);
>>>> +	if (err)
>>>> +		goto free_gem;
>>>> +
>>>> +	err = drm_vma_node_allow(&base->vma_node, file);
>>>> +	if (err)
>>>> +		goto free_gem;
>>>> +
>>>> +	return obj;
>>>> +
>>>> +free_gem:
>>>> +	xe_mmio_gem_free(base);
>>>> +	return ERR_PTR(err);
>>>> +}
>>>> +
>>>> +static void xe_mmio_gem_free(struct drm_gem_object *base)
>>>> +{
>>>> +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>>>> +
>>>> +	drm_gem_object_release(base);
>>>> +	kfree(obj);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_mmio_gem_destroy - Destroy the GEM object wrapping xe_mmio
>>>> + * @gem: the GEM object to destroy
>>>> + *
>>>> + * This function releases resources associated with the GEM object created by
>>>> + * xe_mmio_gem_create().
>>>> + *
>>>> + * See: "Exposing MMIO regions to userspace"
>>>> + */
>>>> +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem)
>>>> +{
>>>> +	xe_mmio_gem_free(&gem->base);
>>>> +}
>>>> +
>>>> +static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *vma)
>>>> +{
>>>> +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>>>> +	struct xe_mmio *mmio = &obj->mmio;
>>>> +
>>>> +	if (vma->vm_end - vma->vm_start != base->size)
>>>> +		return -EINVAL;
>>>> +
>>>> +	/*
>>>> +	 * Set vm_pgoff (used as a fake buffer offset by DRM) to 0 and map the
>>>> +	 * whole buffer from the start.
>>>> +	 */
>>>> +	vma->vm_pgoff = 0;
>>>> +	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
>>>> +
>>>> +	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
>>>> +		     VM_DONTCOPY | VM_NORESERVE);
>>>> +
>>>> +	return remap_pfn_range(vma, vma->vm_start, xe_mmio_phys_addr(mmio) >> PAGE_SHIFT,
>>>> +			       base->size, vma->vm_page_prot);
>>>> +}
>>>> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>>>> index c151ba569003..2990bbcef24d 100644
>>>> --- a/drivers/gpu/drm/xe/xe_mmio.h
>>>> +++ b/drivers/gpu/drm/xe/xe_mmio.h
>>>> @@ -8,6 +8,7 @@
>>>>  
>>>>  #include "xe_gt_types.h"
>>>>  
>>>> +struct drm_file;
>>>>  struct xe_device;
>>>>  struct xe_reg;
>>>>  
>>>> @@ -42,4 +43,7 @@ static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
>>>>  	return &xe->tiles[0].mmio;
>>>>  }
>>>>  
>>>> +struct xe_mmio_gem *xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file);
>>>> +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem);
>>>> +
>>>>  #endif
>>>> -- 
>>>> 2.43.0
>>>>


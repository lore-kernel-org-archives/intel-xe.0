Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46ED9CA0FE7
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 17:42:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102CC10E6A8;
	Tue, 26 Aug 2025 17:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="djTBbxUi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391A310E049;
 Tue, 26 Aug 2025 17:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756230165; x=1787766165;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=inDO7jaPVtzNStBY5/fWtCjBIMAaBOL5w/7SK8HWF4U=;
 b=djTBbxUiZSV5Eeh3Usj9cfABIrSMcYgjrveDYpTpGMbZQFS1LaHC+1T+
 nR8bb7lgTpQPy9lQOzijQPfSAvb+PJ3JAG3V0fkWVRWkj7Sm3MlBBU5MX
 RpvYYJ/7fejvjGIeRaCt5yS1ofkou9SjoxNwtf35nkHASx0EPYPe9fpSO
 UtN1QZ/zQap/yU+3TjmmJLtcviYZu5Ba+kbttUS/e1ysjRMnIBU1DiW9u
 yCaJGybwygYfnY0+lH9Y4Oh+c24VMPR8WU6Iq2JnjGB/7NyXuH5/Y7gNz
 c/aOuAw4wz8B8hvahMmXxKCPSPEXOLgbyUY6PDrYbhv4XT8BJUvBP/r22 w==;
X-CSE-ConnectionGUID: XCEsAS+3SrGk4z+VV+GlpA==
X-CSE-MsgGUID: Mg8rjX3IQGmvMFNUWN7noA==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="69190197"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="69190197"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 10:41:59 -0700
X-CSE-ConnectionGUID: 2TTUbn4FStazjTtg96UK3A==
X-CSE-MsgGUID: ejHX+VWFSnG9MfHhPBs3pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="168876566"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 10:41:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 10:41:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 Aug 2025 10:41:58 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.75)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 10:41:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bg6EHDnmAFJ6yJRPGS+0XhUjDeVtNo3y+ootswOB0BGFg9aEpTJsF71ZmgJQlKQ13qpT9HFCV0Gqix+b5O0YhJpThT8KLoqYRhnyyh6fJuirN4Alt63DeDa0OUaMXLvB5TrbyhdtdGJxM98zmfJi29vBcgiaMgFQq3kOloVDM+7IXQbEDL/h6vbKqmYr6VA3SfZdNUs5m7C1EFjg9CNjbnV0UmogLGIJfi+VXJJXVynqd3OPSzTjylK8lsw7idOlB6E1tL1CxUcxlTLJHyg5XFI1VCaN5NT0tqVfwOHEhFRQHnnoN/WT9qOTjWBW19eGQq4P6/ATcDPGS6I8+UTnFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/vRT/pAM2/qeIn7AHnOgfsHHU9JgyL84Ct8CYsqIss=;
 b=pwusLeLpMFDmj/fY3CCWNjNwJGwXZT9ksbWh1w/8stt5RQBUTDVr/cn7f/l9pY3DIiBzD3hfzfcjgS3RCVw/WIuMjcz6HlHJPHdptMfn6sjIHrYaBsdFXSkB1oiAzzdm59OUR/sGDvzJ1vfYMrl4ljl9U9qHo2C4K3JDMRKCx7cW9+PhLnIT6fh92JWG5Ki/xiAFTwPJjJ89uf/J8fc/yi0ILlUVwnnmyKOZpeo6UjiPMRT/6UI8rQS1DA4lIcbS0rIAuci45AXf7JkGCLmTYnuCujWHS5/TOplWwirZAbby338V0UwnJTsBG8Nvv2TIy0DrYjaYGaOFSzKHE4kzjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA1PR11MB6395.namprd11.prod.outlook.com (2603:10b6:208:3ac::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 17:41:55 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%6]) with mapi id 15.20.9052.014; Tue, 26 Aug 2025
 17:41:55 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <175590588319.263030.1119031491446742492@1538d3639d33>
References: <20250822002512.1129144-1-chaitanya.kumar.borah@intel.com>
 <175590588319.263030.1119031491446742492@1538d3639d33>
Subject: Re: =?utf-8?b?4pyX?= Xe.CI.Full: failure for drm/xe/wcl: Extend
 L3bank mask workaround
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Chaitanya Kumar Borah
 <chaitanya.kumar.borah@intel.com>
To: <I915-ci-infra@lists.freedesktop.org>
Date: Tue, 26 Aug 2025 14:41:51 -0300
Message-ID: <175623011140.28713.43785011266561275@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BYAPR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::23) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA1PR11MB6395:EE_
X-MS-Office365-Filtering-Correlation-Id: 018fa75a-9830-4afc-3c05-08dde4c7d92e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N21wcWxSUVY5NVpVWmRnU2lOK0RsVXVZcVhQSkliMTltM3hqRzFpMzliZEVo?=
 =?utf-8?B?RktlRUEvN2h5RFhyRXpmVkpiRTZsL1Q4MXhES2RrZFhLRjYxODRPVk1pZHdY?=
 =?utf-8?B?bmcrdlkrM256M01SQkJiUU5iWWZKQ2h1czhHLzBsc09YcWZMRk9VVUdMaXhz?=
 =?utf-8?B?bVhBSEZOcUs5ZkprQ3NRZ09id2RWV2h6dXdORjBqYi9RRVo0aVdaT0hPL0Zr?=
 =?utf-8?B?VjBoMmtiM3FzSDlwMkd3TUlKdkcvdnZOeWxwZE55TG5qTEhvM2Nld3BQWGwy?=
 =?utf-8?B?eVJMQW9ZWGNJNGVQVkNiNE1taUcydy9VWE50ZlRuQ09BZzY1cUNIREU3RXM4?=
 =?utf-8?B?U29KU2FGUy9hOCtTOXQ1SmwxLzdMbkhwbjBBNFJrZDBUT3FXMGZ2dkVpQnlU?=
 =?utf-8?B?QzFJQUJkRG5tTTF4eFJ3SVR0dmg1U0ZLajhBU1RFby9tbjZWaHVxbGxJdldo?=
 =?utf-8?B?WDlwc3hVb3g1S0doK2JiYUFlZThKVDM1a2IwUnBXVXNJUG1Uc3oyQnRKTTZP?=
 =?utf-8?B?TGVGNGF3Q1FrZUd6QzlucnVMQnhLYkxWcDFvMTRnMEJyaDhLMkprcDdSbkpy?=
 =?utf-8?B?blQ1dDhzWDNmajV1bjFYYXRrRVRMMC9nRWxSbFZqRlhEdmZMQ0V2Q3FRZGtu?=
 =?utf-8?B?OVVEWWFPUkp0aG9DMGppZGpVOFVvMXRBcm50djZFR0pUUWo3THpBUThRS0Zh?=
 =?utf-8?B?TDcyMDd3M2dZMXlUZ1FiL0NYWklZdDFpbjhRc3dxSFhOUVBrcXdkak1XejJK?=
 =?utf-8?B?V0p3OXhTWEthN0RtbmhDd1BtcFZaZjVUSEpkcGkvS0I1VVRyYlZJS085WjRQ?=
 =?utf-8?B?WVpEZUNaY2VUakQ0NWduWHVWZTM0dVlzeFh5OVgvZHdRcGVWOE4zL1A5c1pS?=
 =?utf-8?B?blE2UWMxcHNGK3hKdVB6ZTBrR3hJVVRidXdVUlBhb2tBT1E2dUJEcGJ5bDlQ?=
 =?utf-8?B?Mk9IemhRNGNsYm1aWUNaK0xWMjBpK1F1ZE5tcndGUzI4akVpU3hady9leUoz?=
 =?utf-8?B?MU5ZNDVIcjdnUEVpL2tXcHZrVEtta0MyWWpBNEJhUWFkRTF4bzR0SWFBZnp4?=
 =?utf-8?B?LzlKU1cvTFFRZ2Y0QlpFR1h1VW9iYjJyMVpGWHIvUms4YVIzb2RkVUl0SEpt?=
 =?utf-8?B?aXk1RHRKZ0VhSys5Q24rK2ozNHljM1FXNjFuK3kxMGwxRG9ubmpsYnBmYTdy?=
 =?utf-8?B?MitsbW0vMEx4WkRmakhmSXUxck9PVkJtaDN1TFFFdDdSNks4ZkFnMXYrdkNC?=
 =?utf-8?B?WGR5cDlZRXFvOGVKL0pKNU9LOStzU0RGaHhGUnZjdHpnbzB4UGQrYWRGVDVz?=
 =?utf-8?B?UVQ5clNIOFFWN3Z4ZG1yYUpGT3VtQ0xNRG1OaVhyc1N4OWV3TXEyVTFieVE5?=
 =?utf-8?B?aGJxMFlkVEl2ckhsem0zdUxJd3BYTUdmdm13cDc5U3k5cENlMXRoNGJWbkIy?=
 =?utf-8?B?ajVSdFEvL3l3ZERobytBK1VzMnp5czlSMHY5bHNJRDhGMm5GaUdvS29kU251?=
 =?utf-8?B?TXZYKyt1VE1GbW1ZV0Yxa28vQ1gzSEE4VThTcXBreURRNnoyTnlpQlZSeUlX?=
 =?utf-8?B?MzVhYjVvbTArRDNnOFJ5NGEyUkRzallQRUxKUU11VHB6TVVBTXBmZlhKSVJG?=
 =?utf-8?B?TkFYK1NWb0h6L0FuSHVQa1BHMnFvOVp3cWl2b09CWmNBQThzNFR0R3JycjBY?=
 =?utf-8?B?WVlrVGdKOWo4TFBLTFNIaVV6MzQzVlpQMkE5Tk56ejA3b2UvaHRabHNJdUdM?=
 =?utf-8?B?V1I2V0p4OWpuTlZYREdOVHRVUHpmaVY5U2dmanlBa2h0OVNxL0tsZTJITG8z?=
 =?utf-8?B?OVNIT3VndjdRV2pqbTFsMVhrT1lHbjVURExPZ1hmN1ZJeFk5QTlZMnNtK2JB?=
 =?utf-8?Q?4SMfhxkY+SD30?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUt1VmlpemZJRGhtdDZQUFNaRkdDRzY5Tmc5UzRVeXFVVzJiYm4yZ0FSaWRm?=
 =?utf-8?B?dVdWRnQvQTVGMUtvN1hqV2FpUW9iTFZZSnBXR1ltSHkrNHR3YmhpZGZjMDZW?=
 =?utf-8?B?OEZWdzdhei9QYkFsbVFPR0RKeTVOMVFidjRxK3g0MTI5Vzc3VlczNGluZTVQ?=
 =?utf-8?B?dVNCbnppMEdKc0tKY0VOanZkVERHK1BjZWJNbFRQQ01HNVJnVERJekpqYUg3?=
 =?utf-8?B?QkVCY2xVaXVXa2hIaVc2Y00zL2V2REdiZ2F2UWJDTG1KdlluZ2pGeVZCVkVY?=
 =?utf-8?B?U0lkZGQyVC9hZjZ3MmQ2K3h1RS9FOWN6b3pTVDlmMFlYSHhCUm1KL0dCRkFk?=
 =?utf-8?B?K0tBdXp0QXFYT1dJMGdnRmdFK2toWHJFTFVWVXlYTERIU2E2dUdneVlwNGU1?=
 =?utf-8?B?R1VQbFhiK0E3RU93ckZmc0duR0tlaWVOUkFabVB2VW5rV2Q1UkhtY1Vma1Z0?=
 =?utf-8?B?VThyOUR4b0h4eTBJV1IxeDNKelFDMXNUazNoOXNGbU8xb0F3Zy90dE12eGtE?=
 =?utf-8?B?UW95djVlaVdPYnlZenFTYXFyZTV1R1ZGT1dQWVVoa0tITlRDQTRZbWgyTFNj?=
 =?utf-8?B?OTMvQndCVFN1c1VMSjFMV05lWEk4c2tvSlFVVlRJUnJBSlQ1dlpXVlgydFFq?=
 =?utf-8?B?aVY0eTE3U1lDNmsyRUJDZjE3bjN0ODVvZEtHcC9UWWtaNzVsWFBPMVphSk5E?=
 =?utf-8?B?dGpxNTUzS1Y3ZC9oTzRtU1hseDBTeXcyWnpFU2RqSk4vdVVQV3RqNzJ5T21R?=
 =?utf-8?B?T3UwOHBTUk9pd3AvYkdVbk9RcElsVEU1QTJVUUZVc2JQSFdpRDQ2NFJBZUh1?=
 =?utf-8?B?TnYvL0ZyZWVOaHAzWlA0Q1BDOTViZWpOVGVUMzJYZXYySWhjV25QN24rcUJx?=
 =?utf-8?B?blZ5eGNPdUdhcjhRRUpzMmJDM1VSYSsvVFdvVlo3SEp4UFQybjE5enVGSmx4?=
 =?utf-8?B?ajZZT0o5Q29mc1Y4dUNXTHE3ZG1aUVJKaGpjT2VEQXphVklxTEpuUFU2alZL?=
 =?utf-8?B?OWZNQk1lTFhBVmY3bUQ0K0Rhb3RuTXJsMWtJZndjcU0zYUUxa25hY3NTMG9T?=
 =?utf-8?B?OW1Bc0hvSzZDQitjUlVwb2FHOElack1KbWNLZWhrUmNQeVhaRExnWUt0dEFV?=
 =?utf-8?B?ZWpRTDN3Y3dyYkNzZ0crMzNJK3pERWlzWXd4K1AxajE4RC9rNjU2OVZkajYv?=
 =?utf-8?B?RmFobkZFSDd1VXNQUStRSkhaakh6VnA2QmdzSGpaWUcrelRWNDFJZUlzb211?=
 =?utf-8?B?TmRGa2o3ZitOT0kyY0RZeDlDWmZLRWZzMHduZGFwMEF1dUcrUEkyUUQyanVU?=
 =?utf-8?B?OXZEZTEzdkJiVXFVVG1razExNUgyY0lwWlVxbkllR1p3OXVDRk9EeWtWSUhm?=
 =?utf-8?B?bWlLM2hxaG42dXpiTmlyR3pucjZCT1lubUR5THBlL1lEdnpKUEQydmRmWlAw?=
 =?utf-8?B?ci9nTVF5RG9BVDZSSncyamVyY1NBWDkvVFVHSWd0dXhCSGsvOHMyNmpTdG1D?=
 =?utf-8?B?VGZNbDBLeWMzSE9QbnF5U2phZy8welJ1OVVNYzRSdnlxQkhYUHpCTEJXT0My?=
 =?utf-8?B?SG82RlZGVWQ1SlVyMXkwOFNWb3U4REV1Ly8xK05VSitzZ2M0VjRhYzBOZ1Y3?=
 =?utf-8?B?Nmp0Nk1wN01Odkxmamk5RjAxQ0VlSDBIVUd6UWJrcjZtRU0zNE9SZEswMmk0?=
 =?utf-8?B?Z2k5NXA4dzNwZFFKaWs0S2kzWEZQdlJTeEVkZlVncndPWTBWYXltcHNpZEdM?=
 =?utf-8?B?N1JNdW8yZm03Q0I0aUh1YUcwNTlyNFdmL0E5M3V6SGZVY2FhMldQVWRkbWdL?=
 =?utf-8?B?dkc5ZTVNbnJ5STY5cVVYcHdpbElGZ0NudnZlZ1l6VXducjFia3Z4ekpMNzNW?=
 =?utf-8?B?dUFxdWJlVTdzU212dDl3RDNTa2tkcnRLYjUrQytiMHpVR3ZSL3BLUnBGUGNL?=
 =?utf-8?B?Y0hjbm1iYU5vVlZVN2llY1pJK01JcFRobHFoR1A3cEIyM25LZjRuWVZ3dHMr?=
 =?utf-8?B?M21ka3RyejN4L2YyK3VxdXVOZExEU1R1TEhOai9BdGF4YUhYNll2R0tyb0Vq?=
 =?utf-8?B?SXJYYzcwazFJRFZTTGp5QkZwTE5FUy9tN09zejZhdU44TzRySFVzLzkvL3hz?=
 =?utf-8?B?dXViWFlYTVQ1bDJOVWU3eEtHVVppUTJBSm5SUS9yOUUxTm5WVjNwei9qdjB2?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 018fa75a-9830-4afc-3c05-08dde4c7d92e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 17:41:55.1586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sXiq/ylhogIaIPjTcMwoipn0auG0hqbIPm2Sop0PqV6MozpptR1IEiXzEFzwc8t3TayZS5b8awNkiqSsVdBYkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6395
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

Quoting Patchwork (2025-08-22 20:38:03-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: drm/xe/wcl: Extend L3bank mask workaround
>URL   : https://patchwork.freedesktop.org/series/153323/
>State : failure
>
>=3D=3D Summary =3D=3D
>
>CI Bug Log - changes from xe-3597-cca87ca63e2f5b8a785dc59c23e526987530b27f=
_FULL -> xe-pw-153323v1_FULL
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with xe-pw-153323v1_FULL absolutely need =
to be
>  verified manually.
> =20
>  If you think the reported changes have nothing to do with the changes
>  introduced in xe-pw-153323v1_FULL, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in =
CI.
>
> =20
>
>Participating hosts (4 -> 4)
>------------------------------
>
>  No changes in participating hosts
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in xe-pw-1533=
23v1_FULL:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@xe_exec_balancer@many-cm-virtual-rebind:
>    - shard-adlp:         [PASS][1] -> [FAIL][2]
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3597-cca87ca63e2f5b8a=
785dc59c23e526987530b27f/shard-adlp-8/igt@xe_exec_balancer@many-cm-virtual-=
rebind.html
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153323v1/shard-adl=
p-4/igt@xe_exec_balancer@many-cm-virtual-rebind.html

Possibly related to
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5625 .

>
>  * igt@xe_exec_compute_mode@many-bindexecqueue-userptr:
>    - shard-adlp:         [PASS][3] -> [TIMEOUT][4]
>   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3597-cca87ca63e2f5b8a=
785dc59c23e526987530b27f/shard-adlp-8/igt@xe_exec_compute_mode@many-bindexe=
cqueue-userptr.html
>   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153323v1/shard-adl=
p-4/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html


Possibly related to
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5987 .

None of those are related to this patch.

--
Gustavo Sousa

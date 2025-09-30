Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A79CCA470
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 14:48:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A0410E5F2;
	Tue, 30 Sep 2025 14:48:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nOFpQI+V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C1A10E5F2
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 14:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759243698; x=1790779698;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=R2+ml10I9tVCH9heXkGAUto0gsXCf3a4IA0VB+b8PtI=;
 b=nOFpQI+V2ahwBAgqbKecHzJRkF7kox0WZD5fMFizFndjcCj90q7NX+bE
 rwU/bFnJ1sDvHpA6YG3Z+0J80rvYiMOOhY3J+Guy9gM7ZgjUPsE2054FD
 4kxDAvMWpSuBsaMyHefFVcvSysQAgGxLq3HcteGXg/UPGPjqIUySjA+Fi
 A9rTpbiLxyPEkrgI0FdvCHl2ibgo0LfN5IFn4HBWwFDnZRlPyE9qovLOj
 W8pk3mHF1yyoYckV7N6fOBA0/NLrt+mSu1jxpoJmexj6vnSgUZVK4vkVA
 QIJamo6nbsjZZBk4Lf5MgsP5SCuWs75bTQTkR6SphPiV/wI29RQwsgC3g A==;
X-CSE-ConnectionGUID: K6I8o1+2RSmoniC1sPs/Fg==
X-CSE-MsgGUID: OJ1ek/qTQauAyIiaSUCrkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72120074"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="72120074"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 07:48:18 -0700
X-CSE-ConnectionGUID: +bdIJ0mpQfabtmpMp6vpnA==
X-CSE-MsgGUID: 9mSK+3XATQ6xkRIWGeuwdw==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 07:48:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 07:47:46 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 07:47:46 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.32) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 07:47:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jr+X6d+Y2GajAi+2COpgsEyyFMh2BcPzjId7L37eVsPNNC+ddoS3Oj79asDtcfss0mCk8h/hQcEh6fXwB5ClGk4e78FsH7j60eRW0umgdhxHK69tZImUKt8k1XuXZaYIp7ZqxioXvA7rjSRh22mSR29dFy6zz3fNjnH70AwBCK+LdCLhqHad4Tcp9oQ3x72sSsv/2sHBDLnncFMsBtarHBHepKTca1ad2PcZD+k1WyeE2ytlOrtXoq2lyI26ERPv497k7w7N6T0KKmEwNs21EJqwMmu/bDD3FzoPVBCaSiBbD7X1dID5eNoTABSKq1zu4aehx2hsK1dAKhAXR36Byg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vKQ5sgNlvwgxDBHVr/GSUstlqOff53S+F5BhyTE3dc=;
 b=vR/hsHYlWlTAhet1GTmweQFNNGRuxPyBQPbygyD6whrNKvs98ludyxc+8zrzGU1MoHp9jb8OHOnur6LgEul5Hv3GxVsyrLgLX3VV8tFQ1w1UD8DmnGys3mu08/ofeql94ri9BaiCtPMKi8HL39bteFFIcs2hlZbPnZz3H7HH2pMTcPTOvhTI87qyfmDBZt+JiGMilL8mCD83sh6FX+IXokhy3i0OFh1zeT81AWZlSxkNghW/rch+9Bbnh39sP4TlJfz/L/2m0uUpHo9kPBQkWmIKgKuBFss4N5b1JgqRMqwFy8YVCxJweLcheVuYAcGuRuVPa25O8Yk5SC2KmKwgbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by IA3PR11MB9087.namprd11.prod.outlook.com (2603:10b6:208:57f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 14:47:41 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Tue, 30 Sep 2025
 14:47:41 +0000
Message-ID: <3d6f978c-0e7c-4ba5-8f22-2a2c99cee2c9@intel.com>
Date: Tue, 30 Sep 2025 16:47:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/36] drm/xe/vf: Make VF recovery run on per-GT worker
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-14-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250929025542.1486303-14-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::28) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|IA3PR11MB9087:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ac21faa-d2c2-4aba-a0f8-08de00304ed0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2JIdVpWeW90eE5vVkZHaURYTHIrcHFGTmtqT2NZSXB3WFNlWk96SjJVdFcr?=
 =?utf-8?B?OUVZWmZveGZEMEtIS3M1ZE1UYmpBbzBxY1JPck1tc2ViR1ZncisrWWEwdTVa?=
 =?utf-8?B?OEs2NnFKd2R2TnJ6ZkpjY1NwL3BBME5PWHRLYTRXM0hRTXNHTEdncDk5YmdM?=
 =?utf-8?B?bVVzL2kyV2dSSGdCRUUySlRZQVBVOVBvb1h4WlJmaGRTZVl2RWRhNHVsNTdn?=
 =?utf-8?B?dVNNMGdZV3hrb3VSbGd5TkpzSy9vUTdHamdCbmdwNFlBbjFXVkVoMHR1UFoy?=
 =?utf-8?B?SnlRbzZzNCtvTnNURVpteWVvL0RIWU12Kzc2cGtuVzJmWXhsTlVpUnVYeFNx?=
 =?utf-8?B?RmsyR0tSQWFMdWo0cGtJa0FhOUlrVkRqVkM5dE9MVlUzeHhDaVFDYkExWXBM?=
 =?utf-8?B?ZEJxWFFzNDY4VWo4bi92cllzWDJkTWlMWW5wNWltbkFSMFJUNGNqcHZHUmgv?=
 =?utf-8?B?Y1p2VmcrOUVmdll3bEZxMXIybTlmWnZBZE5oNlpFSlc3dzNBTGJtQVdWYzJ5?=
 =?utf-8?B?T3ZQcHJSWUFBOEJSNGFvSFR3T0JOcnZDTCtvSmpqNHNwbWNPVGJVUTNOK0hM?=
 =?utf-8?B?MG4zNjBseUQvOURsUURZeTBPQXhPU0p1ZWx6OWlpMFUvU2hoa3R3OG9uZDBz?=
 =?utf-8?B?bUwvUmxWVXNwMzJud0pHc0RHeU9hdXNJcnNKckx5T0pDMU1WdGRDQzlzZlRM?=
 =?utf-8?B?RnVJYUt3MWZidGZhQXJBL0plNmRhcXFCYlBuTnRuWEcrTVVUdVhpaGJHS0F4?=
 =?utf-8?B?M21uNWwxRXc4N2dvdmVwblBhZGIrQ2QxMnBYZ1l0anZoSmV1MWVObzhJdkFZ?=
 =?utf-8?B?WUdDSEovUEJlMnByLzE0YzJEdXlBTVV4cGxLd0FlUkErd2NQNlJGbDFrbjRk?=
 =?utf-8?B?VGI2aExqYmZrejd0cG1ST1V2YXlrRHpWa3l3TlZTOGkzYSsrV2V6VUlpYlo0?=
 =?utf-8?B?TU93RmZkSjlNTG41UmhKaGZHNVNxdzBTM05ZSUdPRlVOdjFaek1VS0E2dVAr?=
 =?utf-8?B?THFVaEtmMEEzYk5WdCtsVjlqUm9zQW51M1pKaWdRVDkyN0xTZ0dGQUVpZDE0?=
 =?utf-8?B?TllNaC9janplMWVJc2NvdVRLYkJzbHBqR3RHanRNOHNlMkN3VDNuZktPWEhQ?=
 =?utf-8?B?aGpwMUsxd0RHaWxBQ0dBeVVjWnFQWERPTGNDTmZBM1piajR0SlVlaWtsVFNv?=
 =?utf-8?B?dGNpcm9jV01VNzZTQ1VYS2Zpd01rTU5qWTdTdEZlcG9rWTAxa1ljOE1SQThT?=
 =?utf-8?B?WnR5bFZiS3NCZmw0WjBuRkpGTWxjaHc0RzZpNjl5YjMxblZjNmNEeGw4eEVj?=
 =?utf-8?B?WVJVNWhNNVV5SDBNNDJOQmR0ZjhjVGgzcExReXZETldZc2FiYTlhMlhwN1ZT?=
 =?utf-8?B?Y1R5ajhHbm5IQ0JHVDlCMUlXRWhxb2Vxb2tCNmNQbjBpaHZ2Wkg2T09WUTZW?=
 =?utf-8?B?dHFwOVBPb21GS3JmL083c2Q4cUl4Z1RUa0gwb0pOYnpBb1FlRHNaWHp3VEVG?=
 =?utf-8?B?dzBOV1Q4dG9hNXZweUcwQzR1NnJOMWQydDh5TlAxYjhrb21Ca01wR29OVElT?=
 =?utf-8?B?TDdRRXd2RjNFV2w4RUQ0Y2tlb0hCTUsydlpKSFZES1c4NVNBTnBPMmtQSWZT?=
 =?utf-8?B?N1BiVS9BMzlycDMvNlVqUUZrUXZRb0hKYjhYT3JqK1VYcVRnK2YrRE9DZW9V?=
 =?utf-8?B?aitJN1hMMjNzM3hMS3crZmY1RW85ZXZMVUJacFNvejVjcUtxbDhGakk1Y2Rv?=
 =?utf-8?B?OEZPcDZkR1NzZjhJbkR4aXp1QVEvUGR0STFuZ0h1bmxwZW5nVko4dlM0N0tQ?=
 =?utf-8?B?MThiVnA2TUZmWmxvaXh5OWRJRmNwUnkyQUFPRVVaMEY0OG55U0pwTGR6T2lT?=
 =?utf-8?B?MzJnL1BOcEp2KytaeDJhRnk1MUdUK1FSb1VsakxIYVQycDlhMFB4N1JGdmpX?=
 =?utf-8?Q?BkynjB0PdPmt31uD8N1d5jqWyjBo6INO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VllwdkhVQ09XYlo5ZWxUMXpFRTYyZG5LSnZWVVBuby9MR3FrZ3hnbkdwOExB?=
 =?utf-8?B?TEJGMVh1YXNOcTFzRHRTKy9UNmRiYnlJbFNURXF3MitRZ3llMWxzRzk5WUQr?=
 =?utf-8?B?VnYrTERaSEpsSXVwME1zb1hlZkVma3B2N1VXeEZLVWVNQkNKYUxjR1c5Mm0z?=
 =?utf-8?B?MFBQYlFBTWRWcEFYNDRWZ1BzZ1NzRVNHRSsxd2pNOGo2cHNzeWI3MGVNMnZn?=
 =?utf-8?B?OHJEU1BVcGNkVVVhNGl0a2JKL0M3eHhySm1sNFpzVzFPOEVGNWk4akdIMlZY?=
 =?utf-8?B?TjZkaTdQT2VudlEraWhvc1drbU9BZ2hSay83K3pmUjFGaVNsRm1mNFVZalVZ?=
 =?utf-8?B?ZUtrSSs3UnRKTWVCNUVOOFVHNkpvQ1REdHdLWFdPTnQ1NHAwMkhZb1lqeVRp?=
 =?utf-8?B?cG14RlBDTHJhRExzSDh5cG1WNTFPN3c5TklGN3VyOXpUanJqN29mcVdZOEF1?=
 =?utf-8?B?NVM2czM4Ymt6ZndWdmhsWFZrbVRvTHB6MEhEaEpIaHVpMlp5cUNmWlRxTVlD?=
 =?utf-8?B?dkxOck9BQ1BxcG9ZNTVrdytWL25VdWMwRkNVRTd2dG1hdXM0bW5WTk5SZ2VF?=
 =?utf-8?B?ZmhRbVg2VWxwVzdxWkdFMW52SUpDdWhnWHBJRDh2dXZNY0tjeUhFL2YwSUVt?=
 =?utf-8?B?QkVrSGJTeUJDOHcrUkhEbDFhaXRFUEdrTTVIcE14anYyUVlIVk54VHhNYjZh?=
 =?utf-8?B?QjZwQjNPME4ydmpqY2R5cm1pZEVFZXlQQ3NDM1VsMTEvQmUyWWFrSGtzZVNR?=
 =?utf-8?B?NmFQa0xqUElrdFhhanlmOCtlT211UGtvTnNEakdrbENudmNyckhNeFk0cFFT?=
 =?utf-8?B?ZWNMZ0NpRDd3UmdUQy9Qc3NTOVZyNE0zZkR4YlRBN1FMUk9YZlBwd2dJQzNh?=
 =?utf-8?B?amFxSHFXWlJpMGo5TXFTdjZPQWhiVEg1Rmk2bmVPZzNvUGdMVEt2eXJtaGZt?=
 =?utf-8?B?ZWRBTjZUem41OUxheFNkblB2RTJXN0ZIMW9nbmRuMk1DSWRCNzRySTRwVG5V?=
 =?utf-8?B?eHJ4aG9wbUE3WU4va3hDd0RJS285cDQzZXJIUkhMTS9wNWQ3TEkzNTdlMGt1?=
 =?utf-8?B?NklFUFV3SXdCMWNsQmJ6ZlFkdytXdHRxN2ZJc0xRNVJmSm5WaHRpTFJiSHJ4?=
 =?utf-8?B?aGthQmM2WlJHUUYvUy9BL1lzbXlGSXVTenNya015ajQxTFFaREsrT2hmYk11?=
 =?utf-8?B?Smc5NFUyTUdET2hJMy9ab01wcFNQRGpTWWt0L3lQSzdzbDFtVlZmeko2TjA5?=
 =?utf-8?B?TmhlYlZNNExXKzBaZ200NFNjM3lpc0MwQTZQakJYejRIdVFZZUsyRkNOSzFI?=
 =?utf-8?B?amJoR2ZwMWwyNk9ZWHZhNFEvZVBkRWlzNnVWcERaU3p3VWxpdlNDT25vYVkz?=
 =?utf-8?B?SG5rVk83djNDTHFRa0pXVzhUSndxQitLLzAzRFc0cDBhOHpZS3VDeUVXOEhX?=
 =?utf-8?B?MURlUzZqN1I5bWFzbDBvUHMxQWh6REpaTWMwNUNqaDVBclZyNkZyeWJGSGk4?=
 =?utf-8?B?cU1GR2RKRlRKV3hqUWZTZnN2S1pHZ1o4Rnp6WmZzV0FrdFJJd1ZuUDZDTkwz?=
 =?utf-8?B?SEdVWEJvQlllTndQUDdwdUhML1cwU1EyaUloS09lTzBWaE5pSTljdTlOdmlF?=
 =?utf-8?B?SytaUmhOTEY2NVpsemthbnpFcmdKK1lyYlhYd2RPQXBkYTZjQlFzaDdrTGZy?=
 =?utf-8?B?MGVaTzQvd09GZU5CaWtzb3dDcGxhb1V0alJkMzd1MWMyaHpRWlVIb2RNNHdR?=
 =?utf-8?B?eFVrZmY3cGRTRFJRSGN6WEtQNXBVZnZ5dnpKWXk5QTdzclc1Qk5tQktQdEoz?=
 =?utf-8?B?RTZwZUFYa0N3STZCZ0hrVlc1S2Z2U2ZvOFdnRGNIY0taemFkTGxmMzBwbDV2?=
 =?utf-8?B?WVQ3YXA3MysxTkE3WnVQazh3YXh2VVlvQzlSSjU0Rk1ZS0p1N25OWDBIbitq?=
 =?utf-8?B?alJrQ3pxcGlFb2hVSmlGdlpYTHB3UEZDamdQWkxncVhjWnVEb0tqWUhiL1ho?=
 =?utf-8?B?ZUJUQUQrNFNJbk9IMkJFRElnbkhNazBLUEEzZlpTV1hZQW1USEFBQi9OVDFV?=
 =?utf-8?B?R0lpVk9OU1dZZU5YdTVXV3ZpSjdqemFqcjZNU1RPTkFWN3FVM216QXJQWFdC?=
 =?utf-8?Q?6ngWHOxV17gmMP27ZLndHxJvj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ac21faa-d2c2-4aba-a0f8-08de00304ed0
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 14:47:41.5742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JW7/LR+962n97aioQcEQ10xRlHcMgm1U9GvM18gepmhogL+/RUicWF7Owz6htc9kP8fjwv5CHTf0R264OdbgaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9087
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


On 9/29/2025 4:55 AM, Matthew Brost wrote:
> VF recovery is a per-GT operation, so it makes sense to isolate it to a
> per-GT queue. Scheduling this operation on the same worker as the GT
> reset and TDR not only aligns with this design but also helps avoid race
> conditions, as those operations can also modify the queue state.
>
> v2:
>   - Fix lockdep splat (Adam)
>   - Use xe_sriov_vf_migration_supported helper
> v3:
>   - Drop xe_gt_sriov_ prefix for private functions (Michal)
>   - Drop message in xe_gt_sriov_vf_migration_init_early (Michal)
>   - Logic rework in vf_post_migration_notify_resfix_done (Michal)
>   - Rework init sequence layering (Michal)

One minor remark below, but other than that:

Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c                |   6 +
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 179 +++++++++++++++-
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |   3 +-
>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |   7 +
>   drivers/gpu/drm/xe/xe_sriov_vf.c          | 246 ----------------------
>   drivers/gpu/drm/xe/xe_sriov_vf.h          |   1 -
>   drivers/gpu/drm/xe/xe_sriov_vf_types.h    |   4 -
>   7 files changed, 182 insertions(+), 264 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 3e0ad7e5b5df..5f9ba4caf837 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -398,6 +398,12 @@ int xe_gt_init_early(struct xe_gt *gt)
>   			return err;
>   	}
>   
> +	if (IS_SRIOV_VF(gt_to_xe(gt))) {
> +		err = xe_gt_sriov_vf_init_early(gt);
> +		if (err)
> +			return err;
> +	}
> +
>   	xe_reg_sr_init(&gt->reg_sr, "GT", gt_to_xe(gt));
>   
>   	err = xe_wa_gt_init(gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 71309219a4b7..ae9df9c0876d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -25,11 +25,15 @@
>   #include "xe_guc.h"
>   #include "xe_guc_hxg_helpers.h"
>   #include "xe_guc_relay.h"
> +#include "xe_guc_submit.h"
> +#include "xe_irq.h"
>   #include "xe_lrc.h"
>   #include "xe_memirq.h"
>   #include "xe_mmio.h"
> +#include "xe_pm.h"
>   #include "xe_sriov.h"
>   #include "xe_sriov_vf.h"
> +#include "xe_tile_sriov_vf.h"
>   #include "xe_uc_fw.h"
>   #include "xe_wopcm.h"
>   
> @@ -308,13 +312,13 @@ static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
>   }
>   
>   /**
> - * xe_gt_sriov_vf_notify_resfix_done - Notify GuC about resource fixups apply completed.
> + * vf_notify_resfix_done - Notify GuC about resource fixups apply completed.
>    * @gt: the &xe_gt struct instance linked to target GuC
>    *
>    * Returns: 0 if the operation completed successfully, or a negative error
>    * code otherwise.
>    */
> -int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt)
> +static int vf_notify_resfix_done(struct xe_gt *gt)
>   {
>   	struct xe_guc *guc = &gt->uc.guc;
>   	int err;
> @@ -808,7 +812,7 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt)
>    * xe_gt_sriov_vf_default_lrcs_hwsp_rebase - Update GGTT references in HWSP of default LRCs.
>    * @gt: the &xe_gt struct instance
>    */
> -void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
> +static void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
>   {
>   	struct xe_hw_engine *hwe;
>   	enum xe_hw_engine_id id;
> @@ -817,6 +821,26 @@ void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
>   		xe_default_lrc_update_memirq_regs_with_address(hwe);
>   }
>   
> +static void vf_start_migration_recovery(struct xe_gt *gt)
> +{
> +	bool started;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	spin_lock(&gt->sriov.vf.migration.lock);
> +
> +	if (!gt->sriov.vf.migration.recovery_queued) {
> +		gt->sriov.vf.migration.recovery_queued = true;
> +		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
> +
> +		started = queue_work(gt->ordered_wq, &gt->sriov.vf.migration.worker);
> +		xe_gt_sriov_info(gt, "VF migration recovery %s\n", started ?
> +				 "scheduled" : "already in progress");
> +	}
> +
> +	spin_unlock(&gt->sriov.vf.migration.lock);
> +}
> +
>   /**
>    * xe_gt_sriov_vf_migrated_event_handler - Start a VF migration recovery,
>    *   or just mark that a GuC is ready for it.
> @@ -831,15 +855,8 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
>   	xe_gt_assert(gt, IS_SRIOV_VF(xe));
>   	xe_gt_assert(gt, xe_gt_sriov_vf_recovery_inprogress(gt));
>   
> -	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
> -	/*
> -	 * We need to be certain that if all flags were set, at least one
> -	 * thread will notice that and schedule the recovery.
> -	 */
> -	smp_mb__after_atomic();
> -
>   	xe_gt_sriov_info(gt, "ready for recovery after migration\n");
> -	xe_sriov_vf_start_migration_recovery(xe);
> +	vf_start_migration_recovery(gt);
>   }
>   
>   static bool vf_is_negotiated(struct xe_gt *gt, u16 major, u16 minor)
> @@ -1175,6 +1192,146 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
>   		   pf_version->major, pf_version->minor);
>   }
>   
> +static void vf_post_migration_shutdown(struct xe_gt *gt)
> +{
> +	int ret = 0;
> +
> +	spin_lock_irq(&gt->sriov.vf.migration.lock);
> +	gt->sriov.vf.migration.recovery_queued = false;
> +	spin_unlock_irq(&gt->sriov.vf.migration.lock);
> +
> +	xe_guc_submit_pause(&gt->uc.guc);
> +	ret |= xe_guc_submit_reset_block(&gt->uc.guc);
> +
> +	if (ret)
> +		xe_gt_sriov_info(gt, "migration recovery encountered ongoing reset\n");
> +}
> +
> +static size_t post_migration_scratch_size(struct xe_device *xe)
> +{
> +	return max(xe_lrc_reg_size(xe), LRC_WA_BB_SIZE);
> +}
> +
> +static int vf_post_migration_fixups(struct xe_gt *gt)
> +{
> +	s64 shift;
> +	void *buf;
> +	int err;
> +
> +	buf = kmalloc(post_migration_scratch_size(gt_to_xe(gt)), GFP_ATOMIC);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	err = xe_gt_sriov_vf_query_config(gt);
> +	if (err)
> +		goto out;
> +
> +	shift = xe_gt_sriov_vf_ggtt_shift(gt);
> +	if (shift) {
> +		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> +		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> +		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> +		if (err)
> +			goto out;
> +	}
> +
> +out:
> +	kfree(buf);
> +	return err;
> +}
> +
> +static void vf_post_migration_kickstart(struct xe_gt *gt)
> +{
> +	/*
> +	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
> +	 * must be working at this point, since the recovery did started,
> +	 * but the rest was not enabled using the procedure from spec.
> +	 */
> +	xe_irq_resume(gt_to_xe(gt));
> +
> +	xe_guc_submit_reset_unblock(&gt->uc.guc);
> +	xe_guc_submit_unpause(&gt->uc.guc);
> +}
> +
> +static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
> +{
> +	bool skip_resfix = false;
> +
> +	spin_lock_irq(&gt->sriov.vf.migration.lock);
> +	if (gt->sriov.vf.migration.recovery_queued) {
> +		skip_resfix = true;
> +		xe_gt_sriov_dbg(gt, "another recovery imminent, skipped some notifications\n");

Now as the recovery is per-GT, this message concerns one RESFIX_DONE 
notification only.

(though the message will disappear  anyway in the future, with double 
migration support)

-Tomasz

> +	} else {
> +		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, false);
> +	}
> +	spin_unlock_irq(&gt->sriov.vf.migration.lock);
> +
> +	if (skip_resfix)
> +		return -EAGAIN;
> +
> +	return vf_notify_resfix_done(gt);
> +}
> +
> +static void vf_post_migration_recovery(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int err;
> +
> +	xe_gt_sriov_dbg(gt, "migration recovery in progress\n");
> +
> +	xe_pm_runtime_get(xe);
> +	vf_post_migration_shutdown(gt);
> +
> +	if (!xe_sriov_vf_migration_supported(xe)) {
> +		xe_gt_sriov_err(gt, "migration is not supported\n");
> +		err = -ENOTRECOVERABLE;
> +		goto fail;
> +	}
> +
> +	err = vf_post_migration_fixups(gt);
> +	if (err)
> +		goto fail;
> +
> +	vf_post_migration_kickstart(gt);
> +	err = vf_post_migration_notify_resfix_done(gt);
> +	if (err && err != -EAGAIN)
> +		goto fail;
> +
> +	xe_pm_runtime_put(xe);
> +	xe_gt_sriov_notice(gt, "migration recovery ended\n");
> +	return;
> +fail:
> +	xe_pm_runtime_put(xe);
> +	xe_gt_sriov_err(gt, "migration recovery failed (%pe)\n", ERR_PTR(err));
> +	xe_device_declare_wedged(xe);
> +}
> +
> +static void migration_worker_func(struct work_struct *w)
> +{
> +	struct xe_gt *gt = container_of(w, struct xe_gt,
> +					sriov.vf.migration.worker);
> +
> +	vf_post_migration_recovery(gt);
> +}
> +
> +/**
> + * xe_gt_sriov_vf_init_early() - GT VF init early
> + * @gt: the &xe_gt
> + *
> + * Return 0 on success, errno on failure
> + */
> +int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
> +{
> +	if (!xe_sriov_vf_migration_supported(gt_to_xe(gt)))
> +		return 0;
> +
> +	init_rwsem(&gt->sriov.vf.self_config.lock);
> +	spin_lock_init(&gt->sriov.vf.migration.lock);
> +	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
> +
> +	return 0;
> +}
> +
>   /**
>    * xe_gt_sriov_vf_recovery_inprogress() - VF post migration recovery in progress
>    * @gt: the &xe_gt
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index bb5f8eace19b..0b0f2a30e67c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -21,10 +21,9 @@ void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
>   int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
>   int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>   int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
> -void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt);
> -int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>   void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>   
> +int xe_gt_sriov_vf_init_early(struct xe_gt *gt);
>   bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt);
>   
>   u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 7b10b8e1e10e..53680a2f188a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -8,6 +8,7 @@
>   
>   #include <linux/rwsem.h>
>   #include <linux/types.h>
> +#include <linux/workqueue.h>
>   #include "xe_uc_fw_types.h"
>   
>   /**
> @@ -53,6 +54,12 @@ struct xe_gt_sriov_vf_runtime {
>    * xe_gt_sriov_vf_migration - VF migration data.
>    */
>   struct xe_gt_sriov_vf_migration {
> +	/** @migration: VF migration recovery worker */
> +	struct work_struct worker;
> +	/** @lock: Protects recovery_queued */
> +	spinlock_t lock;
> +	/** @recovery_queued: VF post migration recovery in queued */
> +	bool recovery_queued;
>   	/** @recovery_inprogress: VF post migration recovery in progress */
>   	bool recovery_inprogress;
>   };
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index da064a1e7419..911d5720917b 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -6,21 +6,12 @@
>   #include <drm/drm_debugfs.h>
>   #include <drm/drm_managed.h>
>   
> -#include "xe_assert.h"
> -#include "xe_device.h"
>   #include "xe_gt.h"
> -#include "xe_gt_sriov_printk.h"
>   #include "xe_gt_sriov_vf.h"
>   #include "xe_guc.h"
> -#include "xe_guc_submit.h"
> -#include "xe_irq.h"
> -#include "xe_lrc.h"
> -#include "xe_pm.h"
> -#include "xe_sriov.h"
>   #include "xe_sriov_printk.h"
>   #include "xe_sriov_vf.h"
>   #include "xe_sriov_vf_ccs.h"
> -#include "xe_tile_sriov_vf.h"
>   
>   /**
>    * DOC: VF restore procedure in PF KMD and VF KMD
> @@ -158,8 +149,6 @@ static void vf_disable_migration(struct xe_device *xe, const char *fmt, ...)
>   	xe->sriov.vf.migration.enabled = false;
>   }
>   
> -static void migration_worker_func(struct work_struct *w);
> -
>   static void vf_migration_init_early(struct xe_device *xe)
>   {
>   	/*
> @@ -184,8 +173,6 @@ static void vf_migration_init_early(struct xe_device *xe)
>   						    guc_version.major, guc_version.minor);
>   	}
>   
> -	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
> -
>   	xe->sriov.vf.migration.enabled = true;
>   	xe_sriov_dbg(xe, "migration support enabled\n");
>   }
> @@ -196,242 +183,9 @@ static void vf_migration_init_early(struct xe_device *xe)
>    */
>   void xe_sriov_vf_init_early(struct xe_device *xe)
>   {
> -	struct xe_gt *gt;
> -	unsigned int id;
> -
> -	for_each_gt(gt, xe, id)
> -		init_rwsem(&gt->sriov.vf.self_config.lock);
> -
>   	vf_migration_init_early(xe);
>   }
>   
> -/**
> - * vf_post_migration_shutdown - Stop the driver activities after VF migration.
> - * @xe: the &xe_device struct instance
> - *
> - * After this VM is migrated and assigned to a new VF, it is running on a new
> - * hardware, and therefore many hardware-dependent states and related structures
> - * require fixups. Without fixups, the hardware cannot do any work, and therefore
> - * all GPU pipelines are stalled.
> - * Stop some of kernel activities to make the fixup process faster.
> - */
> -static void vf_post_migration_shutdown(struct xe_device *xe)
> -{
> -	struct xe_gt *gt;
> -	unsigned int id;
> -	int ret = 0;
> -
> -	for_each_gt(gt, xe, id) {
> -		xe_guc_submit_pause(&gt->uc.guc);
> -		ret |= xe_guc_submit_reset_block(&gt->uc.guc);
> -	}
> -
> -	if (ret)
> -		drm_info(&xe->drm, "migration recovery encountered ongoing reset\n");
> -}
> -
> -/**
> - * vf_post_migration_kickstart - Re-start the driver activities under new hardware.
> - * @xe: the &xe_device struct instance
> - *
> - * After we have finished with all post-migration fixups, restart the driver
> - * activities to continue feeding the GPU with workloads.
> - */
> -static void vf_post_migration_kickstart(struct xe_device *xe)
> -{
> -	struct xe_gt *gt;
> -	unsigned int id;
> -
> -	/*
> -	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
> -	 * must be working at this point, since the recovery did started,
> -	 * but the rest was not enabled using the procedure from spec.
> -	 */
> -	xe_irq_resume(xe);
> -
> -	for_each_gt(gt, xe, id) {
> -		xe_guc_submit_reset_unblock(&gt->uc.guc);
> -		xe_guc_submit_unpause(&gt->uc.guc);
> -	}
> -}
> -
> -static bool gt_vf_post_migration_needed(struct xe_gt *gt)
> -{
> -	return test_bit(gt->info.id, &gt_to_xe(gt)->sriov.vf.migration.gt_flags);
> -}
> -
> -/*
> - * Notify GuCs marked in flags about resource fixups apply finished.
> - * @xe: the &xe_device struct instance
> - * @gt_flags: flags marking to which GTs the notification shall be sent
> - */
> -static int vf_post_migration_notify_resfix_done(struct xe_device *xe, unsigned long gt_flags)
> -{
> -	struct xe_gt *gt;
> -	unsigned int id;
> -	int err = 0;
> -
> -	for_each_gt(gt, xe, id) {
> -		if (!test_bit(id, &gt_flags))
> -			continue;
> -		/* skip asking GuC for RESFIX exit if new recovery request arrived */
> -		if (gt_vf_post_migration_needed(gt))
> -			continue;
> -		err = xe_gt_sriov_vf_notify_resfix_done(gt);
> -		if (err)
> -			break;
> -		clear_bit(id, &gt_flags);
> -	}
> -
> -	if (gt_flags && !err)
> -		drm_dbg(&xe->drm, "another recovery imminent, skipped some notifications\n");
> -	return err;
> -}
> -
> -static int vf_get_next_migrated_gt_id(struct xe_device *xe)
> -{
> -	struct xe_gt *gt;
> -	unsigned int id;
> -
> -	for_each_gt(gt, xe, id) {
> -		if (test_and_clear_bit(id, &xe->sriov.vf.migration.gt_flags))
> -			return id;
> -	}
> -	return -1;
> -}
> -
> -static size_t post_migration_scratch_size(struct xe_device *xe)
> -{
> -	return max(xe_lrc_reg_size(xe), LRC_WA_BB_SIZE);
> -}
> -
> -/**
> - * Perform post-migration fixups on a single GT.
> - *
> - * After migration, GuC needs to be re-queried for VF configuration to check
> - * if it matches previous provisioning. Most of VF provisioning shall be the
> - * same, except GGTT range, since GGTT is not virtualized per-VF. If GGTT
> - * range has changed, we have to perform fixups - shift all GGTT references
> - * used anywhere within the driver. After the fixups in this function succeed,
> - * it is allowed to ask the GuC bound to this GT to continue normal operation.
> - *
> - * Returns: 0 if the operation completed successfully, or a negative error
> - * code otherwise.
> - */
> -static int gt_vf_post_migration_fixups(struct xe_gt *gt)
> -{
> -	s64 shift;
> -	void *buf;
> -	int err;
> -
> -	buf = kmalloc(post_migration_scratch_size(gt_to_xe(gt)), GFP_KERNEL);
> -	if (!buf)
> -		return -ENOMEM;
> -
> -	err = xe_gt_sriov_vf_query_config(gt);
> -	if (err)
> -		goto out;
> -
> -	shift = xe_gt_sriov_vf_ggtt_shift(gt);
> -	if (shift) {
> -		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> -		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> -		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> -		if (err)
> -			goto out;
> -	}
> -
> -out:
> -	kfree(buf);
> -	return err;
> -}
> -
> -static void vf_post_migration_recovery(struct xe_device *xe)
> -{
> -	unsigned long fixed_gts = 0;
> -	int id, err;
> -
> -	drm_dbg(&xe->drm, "migration recovery in progress\n");
> -	xe_pm_runtime_get(xe);
> -	vf_post_migration_shutdown(xe);
> -
> -	if (!xe_sriov_vf_migration_supported(xe)) {
> -		xe_sriov_err(xe, "migration is not supported\n");
> -		err = -ENOTRECOVERABLE;
> -		goto fail;
> -	}
> -
> -	while (id = vf_get_next_migrated_gt_id(xe), id >= 0) {
> -		struct xe_gt *gt = xe_device_get_gt(xe, id);
> -
> -		err = gt_vf_post_migration_fixups(gt);
> -		if (err)
> -			goto fail;
> -
> -		set_bit(id, &fixed_gts);
> -	}
> -
> -	vf_post_migration_kickstart(xe);
> -	err = vf_post_migration_notify_resfix_done(xe, fixed_gts);
> -	if (err)
> -		goto fail;
> -
> -	xe_pm_runtime_put(xe);
> -	drm_notice(&xe->drm, "migration recovery ended\n");
> -	return;
> -fail:
> -	xe_pm_runtime_put(xe);
> -	drm_err(&xe->drm, "migration recovery failed (%pe)\n", ERR_PTR(err));
> -	xe_device_declare_wedged(xe);
> -}
> -
> -static void migration_worker_func(struct work_struct *w)
> -{
> -	struct xe_device *xe = container_of(w, struct xe_device,
> -					    sriov.vf.migration.worker);
> -
> -	vf_post_migration_recovery(xe);
> -}
> -
> -/*
> - * Check if post-restore recovery is coming on any of GTs.
> - * @xe: the &xe_device struct instance
> - *
> - * Return: True if migration recovery worker will soon be running. Any worker currently
> - * executing does not affect the result.
> - */
> -static bool vf_ready_to_recovery_on_any_gts(struct xe_device *xe)
> -{
> -	struct xe_gt *gt;
> -	unsigned int id;
> -
> -	for_each_gt(gt, xe, id) {
> -		if (test_bit(id, &xe->sriov.vf.migration.gt_flags))
> -			return true;
> -	}
> -	return false;
> -}
> -
> -/**
> - * xe_sriov_vf_start_migration_recovery - Start VF migration recovery.
> - * @xe: the &xe_device to start recovery on
> - *
> - * This function shall be called only by VF.
> - */
> -void xe_sriov_vf_start_migration_recovery(struct xe_device *xe)
> -{
> -	bool started;
> -
> -	xe_assert(xe, IS_SRIOV_VF(xe));
> -
> -	if (!vf_ready_to_recovery_on_any_gts(xe))
> -		return;
> -
> -	started = queue_work(xe->sriov.wq, &xe->sriov.vf.migration.worker);
> -	drm_info(&xe->drm, "VF migration recovery %s\n", started ?
> -		 "scheduled" : "already in progress");
> -}
> -
>   /**
>    * xe_sriov_vf_init_late() - SR-IOV VF late initialization functions.
>    * @xe: the &xe_device to initialize
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
> index 9e752105ec2a..4df95266b261 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
> @@ -13,7 +13,6 @@ struct xe_device;
>   
>   void xe_sriov_vf_init_early(struct xe_device *xe);
>   int xe_sriov_vf_init_late(struct xe_device *xe);
> -void xe_sriov_vf_start_migration_recovery(struct xe_device *xe);
>   bool xe_sriov_vf_migration_supported(struct xe_device *xe);
>   void xe_sriov_vf_debugfs_register(struct xe_device *xe, struct dentry *root);
>   
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> index 426cc5841958..6a0fd0f5463e 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> @@ -33,10 +33,6 @@ struct xe_device_vf {
>   
>   	/** @migration: VF Migration state data */
>   	struct {
> -		/** @migration.worker: VF migration recovery worker */
> -		struct work_struct worker;
> -		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */
> -		unsigned long gt_flags;
>   		/**
>   		 * @migration.enabled: flag indicating if migration support
>   		 * was enabled or not due to missing prerequisites

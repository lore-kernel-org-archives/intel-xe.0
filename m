Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CCFC3600B
	for <intel-xe@archiver.kernel.org>; Mon, 31 Mar 2025 17:47:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6970A10E47C;
	Mon, 31 Mar 2025 17:47:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="htm0qiUX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F38C10E47C
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Mar 2025 17:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743443232; x=1774979232;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+zna55UwcmX6f0yvEB9klyuuOLBweuRxqRbqPLD0Wx8=;
 b=htm0qiUXNiLUH6MqFv7uDavpowLGIlt+ILOU6LsoEsBcuW7hoV9co9WO
 as7eQTILE1wOxI8ihBvH5/zZpLUnLhqeJbk4OtGJaFzpvS4c2OvyaIb6P
 05UpOoFUq8lMB5h07uEG34GekdYdmUjbqf8otW9+GdsP4JkVU3i6LVWc0
 xcxktYQpmQwPe+HZze8i4XxQZg4RCT2fyHxQrnCV6it5zfc8w6YvMzRyO
 qHQl8V7sgDp8JehZ3nycOnSyI4Q8zqbbt5G0YqNR33fVrtPpuBE4e0xBu
 9UicDlJvrGoZ6tznKP4zOV0/7d1lBuiaxsW+IgWRPxZmiMV6w55VpuCiN Q==;
X-CSE-ConnectionGUID: XajY/h2jQHqFNBHJg/2cQA==
X-CSE-MsgGUID: D/fI0DOjTN2w5zzQbxdkxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="54939830"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="54939830"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 10:47:12 -0700
X-CSE-ConnectionGUID: rp9KRojYT8qw7jeC5bEmTg==
X-CSE-MsgGUID: RXAkPWLjQQ+gIINzscNVDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="131372921"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Mar 2025 10:47:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 10:47:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 10:47:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 10:47:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m/8xIotixxaJ/33aGCVGBLvKovf6zux0+QGIONdaVtHAePh059OCcIOpX5ZxpSB+sivcW4NZuo5iDux5b/dsFXhPkfmiwvZ8oEEGE1XQlI5It5kCaTBi+MzGVlXWDb/T/gisfhLp74fFgOJTADGF/EvLjp8cMuzF0u802tdvw2TRFJ509CRCRcKNu5GBQf1UlVHiEflUve6w/L+V6qd4xRzT8mmREVz/u0uyvhR7119XLbq76EBsCQLfuFzYyIOTEaXgZxg5apE/ctePrRM+PvRcFo+OJMgzv955ZdUkXqjHuBkWr9f16Mg0YonLKR5hF8mmUWPNrCA6pPbgwgdfuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rudCz1U3CtGVhNZLe4dw1V2RStBPAStFu0rFZNorE/U=;
 b=AtC1+ouTx6k/EUwGvCDB08hofctr6epq8vw3IRBNlvG393hfHjwQufKGDnkpXNPlN7PV3Q9RvgJX1syEXwX8B9l0h25/i6o3c93OWMTB0cEdjCuLPxb/2y7PBg6BrsYzR3uDXr+2KyK7wSVWy4Ih01WduzsZTdTcQpOSm5ZaKVR/x7QqJhAarMoBJL4E5Si+B9Z45jd27SJto0SLCAoMiM8kH5fxjVSbaukjUc4U5yjhOsmu+rKtefe6KmPOyetqxrJy9R+RN6Yc33DcFr1/svZSU05Tnvt1BFtQzbHzQLQ45nrbgxUnuNH0V+Bh5/B7Qjitl9zUIv/rCG2Lpm+QSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH7PR11MB6055.namprd11.prod.outlook.com (2603:10b6:510:1d3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 17:47:08 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%2]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 17:47:08 +0000
Message-ID: <11e57850-f2d8-457b-9f13-d2676873dc9a@intel.com>
Date: Mon, 31 Mar 2025 10:47:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/xe/pmu: Add GT frequency events
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250328225330.1990303-1-vinay.belgaumkar@intel.com>
 <Z-rUZp_SQSFKAQBZ@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <Z-rUZp_SQSFKAQBZ@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0007.namprd07.prod.outlook.com
 (2603:10b6:a03:505::12) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|PH7PR11MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: d3c8d8ee-4ff9-43d0-6310-08dd707c0e79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjZySENNZ2R3RFM5YjZkL3E4Q1hLUDJlcGxkNXU3b2V1eGtya1hQUlhqQ1dQ?=
 =?utf-8?B?aGQ2S2FRU3dGZlVWa09EK0NYQ1B0ZW1vSmlUQWswblcwRFBsYktQKzh2MTNW?=
 =?utf-8?B?L3lvbEE4WHhpV01pelhNYlhFZ2ZEbmZyNnVtZnY2SG1sZXpOMnAvNGZESnph?=
 =?utf-8?B?UlVoenBwVHE5N080dGRJajZvbzBYYTAxMTg0OGNxamZmUzhYVHp5UEwxYnZ3?=
 =?utf-8?B?LzBCd2kxSWRVL1M1TjFicDhySEp5WDhBZE01cldOMDNWbXFTVlFGa0tCNjdu?=
 =?utf-8?B?RjhnQ3hvZHV1Rm82MjN0c2xhR24zb1pJN25lR2h3c0dNZGFpSXpFejE4aGxI?=
 =?utf-8?B?K2lYZHh1a0RXM2g4RkhyeGVuOSs1a3YrM25ScEVHcGtCY2pUM2t5MWZMWFlI?=
 =?utf-8?B?NmhHVGZ1ZWJyaDNOSVRDcVNDOVB4bFowaXg0OGlTakI1TUUxRTZqaHFacTlE?=
 =?utf-8?B?NklXMUdzMG9xLzJ5NEZGaEFKb2U0LzVnelpYdzRkWk93eDJkK0NIQXNxS2Qy?=
 =?utf-8?B?aUlsTzNsZEVENmRDVitZN1dxWitEYVpjeTVYbDFJNFp4VURFUzJxTlo0djA3?=
 =?utf-8?B?bXozR1gyeXF1VkNDUE5wbUlISUN3NXhPSXl4NG1NS3pVWEFTTmdPZEt0NGMx?=
 =?utf-8?B?UUNGOGFIRlU4Z0EzbVpWemlITld2RU5XZUdlbVdZV1o3b1FtUlRtVGNGcEh4?=
 =?utf-8?B?Z0I0SUNLNTlLSi9WYVBWMnNnRFhTbmx3KzlZV1VGeTljeDVMeTdTbmp0bS9i?=
 =?utf-8?B?Y05kajRzMVNZd1FCQk4zby9TWkdiY2EwTTh0Qnk1M0ZyeUtLWUZzYS9OWHRx?=
 =?utf-8?B?SlNRRHVKVlA0K1c1YkQvTU9WcHgrNnpBb053ZWdEOEFnMFJ0bTRRbFpEY0RQ?=
 =?utf-8?B?c2I4eVVPTFpXRWhBakxGVXVCenA5QnpBd3llUzJWSGpwRTAxV3BYcGlBdDQx?=
 =?utf-8?B?UmE2YWxjc1R1MVRyWGZYZ3VNQ2pocTg3WVBQN0c2ckh0cjh0R25xS2pzOWlX?=
 =?utf-8?B?UWFZU0l5NlFIVm9lME52S0lzUkk5a0hkVkRJR0Npc2dQWUNkRzY2cEdXazJW?=
 =?utf-8?B?UzVQRVVRdUJHRUxvUWg1UldDcnlyTTFIMTVyeEV2R21vTGRnNlFTL2ZQMmdO?=
 =?utf-8?B?bk5pc0JHV1hRNTh0M1ZZR2t2YjIvL3N1emg3S3JMQ282WGV4WnVGZk1paGl2?=
 =?utf-8?B?aGJOa2ZsREd1ek45MklVckcyamFhWTFnOGdZRjVFVE83ZjhlMTVwQ3hscUNW?=
 =?utf-8?B?TGRBakw0a1dwaUFYUXl4djZOczNoMENVWjA1ZDVFZ2dNeTQwblQxRTU2cDVM?=
 =?utf-8?B?UGt2eUpYSVh1cmFHcnNBTC9GWitUbEk2TmRBdHQ3ZjlxWjM2YnlLMGxBQnRI?=
 =?utf-8?B?SzJlYnIyL0tnNGlHOE5lUlBtT21rTk81QTJvcmJqVzRFcWVsS2d5cERCbDRy?=
 =?utf-8?B?VUVkWDVxWUYxTnlYUk4yUlJGa25EZ2xZeU9MUG1nMXlZRE1zUmN5Mi9OSXJi?=
 =?utf-8?B?elk1NjBUblZ4bWxjcHV6ckZKYlRtOWNsdWFxbGZYMkVudWphdkc5dU12Zm1a?=
 =?utf-8?B?Ri9nQTRYRlFIbm9ia3NvSDhEeURHOEs2M3JrZWhXaXMyU1RsSzZ0dHFxNVU1?=
 =?utf-8?B?NjBJVDYvQmtPWnQ2N3p4M3JBTm9LUTNIeEM0WUdFb1ZPMEw2Nko3UG9QUEhS?=
 =?utf-8?B?WlpXdUtSRFQrNUdLamdYQWpRN0t3ZzNSdldYNndVYVYwa1pCNzZMT2lnTWtT?=
 =?utf-8?B?Y0c1cjZwRVlqLzFvY0hTY3pHUzQzbE1WdzFvaW9uTStHWGRkUVhmTTlrZ2pi?=
 =?utf-8?B?WHY3UWVwYnAxUEVsdWVwTXNaRlpkZHdJVVgwdnZESThyT0MyZ2RWdVd1V2tR?=
 =?utf-8?Q?vOISnWdi1mqdG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDNXSEZtVlBRaHl4RkpHSnJsSHJiRlJjb0JhQXpMMHVWUU54RXpxMVBtTnYx?=
 =?utf-8?B?NUJld3YzbkNNRFBIQlRwVGEyRjZzOG9wRmxsaGZCMXA4RzEycUFHaVQ1TnBa?=
 =?utf-8?B?eTNHd0gwenJ3T2FsR1FTRTZRTk5ELzRsWXhqM2hiTHVUVnNqaTF0L1lGUnN2?=
 =?utf-8?B?dDNUU2RLWjhYdGhiUnFwampsWGxvZ0FUZzljdlZzUWluU1pnMnF2VEpyQnBZ?=
 =?utf-8?B?Skp2eDlyOFpHV3paemZKVlRvZnoxN3JLOGhqak9kK2x4RjQzSFJneDJwNnlI?=
 =?utf-8?B?QldNN3h1MHAvbmU4Rm4yaWJ3VnNqVW16UGN4WXQxb3B3QTRJWFlISXJlTWdh?=
 =?utf-8?B?WXd6bTBoNEFFekRwRGpaeE5SRk0yR2diWVRwZ0E1UVdzc2NmbTA3SnFGSUdz?=
 =?utf-8?B?MStLeis4U25ocFJoWEwrUDZ0NE5ROG91RDdZTklKYkVuWVpkMXhrUDJUR0ZW?=
 =?utf-8?B?TzdxbkZoVUN5T0pucWV4RlprOU9JeEZmNVpHclUrSXp4dXo0MFFQNjdmUUxP?=
 =?utf-8?B?R2NjQVo2YW5QUTl2RWZhQUt2UVRxQWRMRFBuUGtFaEVGRVZSd3BBTFFpamxQ?=
 =?utf-8?B?Q3FGUlBsSUpxRmdscDdTcE5xWGpJZzI3ZS9BR0FZV2hHMTZXandzeDd4T1Yy?=
 =?utf-8?B?bVdrYnpHYytjZkt1bG1Od0poZW9tcTJlV2ttSzRkOUpRZm5LcWM2WkZvbnpj?=
 =?utf-8?B?MTEyVmkzNXpzUkh0U3cyTkZIeGF4MXV3Z3JpRlcxbm92LzJUNTJNTFFDQlFK?=
 =?utf-8?B?RjZIVGZRamt4cDkzLzZTQ05BQ2g2VFFOTWYyN2lxODZxUW14Ky91Q2tSbFYy?=
 =?utf-8?B?OFMrM3N3SEhqcUVDdm1MdHdGWFJvajUzNWI0Q0lUczhSeEdqZnhHcFFSL2JB?=
 =?utf-8?B?cWFGZzVKR0Y3bkNJSXVDUVR1bjBSNVJKNkwvbUdqNjJQRnB5MEVIWjNldEpl?=
 =?utf-8?B?UTNwaGdGdmg0a1RLUjdsTDZkaS9UQ2tnTFYrTzBaUXVLQVlJczl6QnJxQzJa?=
 =?utf-8?B?akxDSFJ0K3FpMEEvOXppVlYwZkdiY1VIZzhxSzU2Rk51SGRKWTFPa0pmWFN4?=
 =?utf-8?B?OHFuc0lGdGR3U1R4L3kzY2VFMXR6RWRhUDlMSXhGNXJBZGNjMnJxU01YaHh2?=
 =?utf-8?B?UWx4azVMQ05nN211RlhuTyt2YTBsQVBkMVlLNm1ZZVVYU2YzRVdIOUpSQmxM?=
 =?utf-8?B?S2NtMzl5TUZEMFZxL3FRSVhHUDc2U2xXTGVrNTVmMlE5V3BiVGk3U0d3aUd0?=
 =?utf-8?B?WnZ4VU1zUG1XWkVvQlUrZEtLWjFVcnZtWTVWRmp3S1ZrWFlwZ1BvUzNCWFBa?=
 =?utf-8?B?NEZtRDNnc0pBeStSOFJQVEhnTFlvS0Zqb2IvTkdhSUh5Y1BkRkN2S3F3L0ZJ?=
 =?utf-8?B?NHh5VjZqNTA0NmtOTDBCQmhnQ3c1UjFZTWxXTzN4VUkzOC9ucEdkdmFUQVg5?=
 =?utf-8?B?MW0vbEE0cmpiWWR4TFdBSEhBMGxNR2tCN1JhN0lTQWpkcVFYdk9DRUpZQ0Nh?=
 =?utf-8?B?RENWUmlUOXBuLy9RNW5KVEU5V1VaZ0RTbGNEdzNFdXpWaWZmTDV4MGVzQlBE?=
 =?utf-8?B?SXFsMmloNDVML2J5R3B5bTArYmVoT0dLanlERWZreUdSdTNBT25iT0lPNnhR?=
 =?utf-8?B?ai95UXJPbUcwK0xhUEloaEx3SjM2YWdWZVV6K3NJa09XL2c4bHE5MGNmOFhJ?=
 =?utf-8?B?NHdHZlZZQmZmeDhYZy96VUUxVm5UU25HUUFKYnFYM094U1loUGZpalVLdnpT?=
 =?utf-8?B?TU10dXcvOVB1L3ZESVA2dnpVT0tjcGRxTFF4a2Y1N0RYNnNDaEZLdEtWL284?=
 =?utf-8?B?Nmk5YVpVQmF6eVo1bk1CMmN4TG1QaCtkMjJYL1pKS0lBMEROV0tZY29taENR?=
 =?utf-8?B?Zzh4dFhrZ3pFM1ZIOWplSGZFek10VlhDZFltMjgrZTk3alBKSUJIWVlJMENv?=
 =?utf-8?B?SWYzMlNFd2xTaktxQzE0Rzc0cGJLdjhsWDZQS1UvakNLNU9FdFF3YnhXS1E4?=
 =?utf-8?B?VEdqelNxOWIvVmtpaVVFMG5ZUG5PWFMzQWtSVWQ2emN0WUgwYkFrYmMxQmph?=
 =?utf-8?B?dkNjQmVjYTZVZGQ3VkRCdDVuRGFwQWEwRWZQN3cvTkE0OElvc3Qxbk5pY21n?=
 =?utf-8?B?MzFocXN4Zm5HWi9VZ3VsRzJsd3VlSU94a3FZbzNrNnF3TGdnQ0MrVUdlejgx?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3c8d8ee-4ff9-43d0-6310-08dd707c0e79
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 17:47:07.9241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0MasCgkMVFrkbBnrLyORGg7/FhsKmUvLdkv4lGqOLsB3hEafXEaD8hTxjURlouSCK6ylvqF/In9awxrhOVOMpgWzZLIDZOn1jRCyFHfsAsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6055
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


On 3/31/2025 10:44 AM, Rodrigo Vivi wrote:
> On Fri, Mar 28, 2025 at 03:53:30PM -0700, Vinay Belgaumkar wrote:
>> Define PMU events for GT frequency (actual and requested). The
>> instantaneous values for these frequencies will be displayed.
>>
>> Following PMU events are being added:
>>    xe_0000_00_02.0/gt-actual-frequency/              [Kernel PMU event]
>>    xe_0000_00_02.0/gt-requested-frequency/           [Kernel PMU event]
>>
>> Standard perf commands can be used to monitor GT frequency:
>>    $ perf stat -e xe_0000_00_02.0/gt-requested-frequency,gt=0/ -I1000
>>
>>    1.001229762       1483 Mhz  xe_0000_00_02.0/gt-requested-frequency,gt=0/
>>    2.006175406       1483 Mhz  xe_0000_00_02.0/gt-requested-frequency,gt=0/
>>
>> v2: Use locks while storing/reading samples, keep track of multiple
>> clients (Lucas) and other general cleanup.
>> v3: Review comments (Lucas) and use event counts instead of mask for
>> active events.
>> v4: Add freq events to event_param_valid method (Riana)
>> v5: Use instantaneous values instead of aggregating (Lucas)
>> v6: Obtain fwake at init for freq events as well and use non fwake
>> variant method for reading requested freq to avoid lockdep issues (Lucas)
>>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_pc.c | 15 +++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_pc.h |  1 +
>>   drivers/gpu/drm/xe/xe_pmu.c    | 40 +++++++++++++++++++++++++++++++---
>>   3 files changed, 53 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 85215313976c..f70762917aed 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -461,6 +461,21 @@ static u32 get_cur_freq(struct xe_gt *gt)
>>   	return decode_freq(freq);
>>   }
>>   
>> +/**
>> + * xe_guc_pc_get_cur_freq_fw - With fw held, get requested frequency
>> + * @pc: The GuC PC
>> + *
>> + * Returns: the requested frequency for that GT instance
>> + */
>> +u32 xe_guc_pc_get_cur_freq_fw(struct xe_guc_pc *pc)
>> +{
>> +	struct xe_gt *gt = pc_to_gt(pc);
>> +
>> +	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>> +
>> +	return get_cur_freq(gt);
>> +}
>> +
>>   /**
>>    * xe_guc_pc_get_cur_freq - Get Current requested frequency
>>    * @pc: The GuC PC
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
>> index 39102b79602f..0a2664d5c811 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>> @@ -22,6 +22,7 @@ void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
>>   
>>   u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc);
>>   int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq);
>> +u32 xe_guc_pc_get_cur_freq_fw(struct xe_guc_pc *pc);
>>   u32 xe_guc_pc_get_rp0_freq(struct xe_guc_pc *pc);
>>   u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc);
>>   u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc);
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> index fde4222675fd..835d21429b58 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -10,6 +10,7 @@
>>   #include "xe_force_wake.h"
>>   #include "xe_gt_idle.h"
>>   #include "xe_guc_engine_activity.h"
>> +#include "xe_guc_pc.h"
>>   #include "xe_hw_engine.h"
>>   #include "xe_pm.h"
>>   #include "xe_pmu.h"
>> @@ -84,6 +85,8 @@ static unsigned int config_to_gt_id(u64 config)
>>   #define XE_PMU_EVENT_GT_C6_RESIDENCY		0x01
>>   #define XE_PMU_EVENT_ENGINE_ACTIVE_TICKS	0x02
>>   #define XE_PMU_EVENT_ENGINE_TOTAL_TICKS		0x03
>> +#define XE_PMU_EVENT_GT_ACTUAL_FREQUENCY	0x04
>> +#define XE_PMU_EVENT_GT_REQUESTED_FREQUENCY	0x05
>>   
>>   static struct xe_gt *event_to_gt(struct perf_event *event)
>>   {
>> @@ -119,6 +122,14 @@ static bool is_engine_event(u64 config)
>>   		event_id == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
>>   }
>>   
>> +static bool is_gt_frequency_event(struct perf_event *event)
>> +{
>> +	uint32_t id = config_to_event_id(event->attr.config);
>> +
>> +	return (id == XE_PMU_EVENT_GT_ACTUAL_FREQUENCY) ||
>> +	       (id == XE_PMU_EVENT_GT_REQUESTED_FREQUENCY);
>> +}
>> +
>>   static bool event_gt_forcewake(struct perf_event *event)
>>   {
>>   	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>> @@ -126,7 +137,7 @@ static bool event_gt_forcewake(struct perf_event *event)
>>   	struct xe_gt *gt;
>>   	unsigned int *fw_ref;
>>   
>> -	if (!is_engine_event(config))
>> +	if (!is_engine_event(config) && !is_gt_frequency_event(event))
>>   		return true;
>>   
>>   	gt = xe_device_get_gt(xe, config_to_gt_id(config));
>> @@ -173,6 +184,8 @@ static bool event_param_valid(struct perf_event *event)
>>   
>>   	switch (config_to_event_id(config)) {
>>   	case XE_PMU_EVENT_GT_C6_RESIDENCY:
>> +	case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
>> +	case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
>>   		if (engine_class || engine_instance || function_id)
>>   			return false;
>>   		break;
>> @@ -190,6 +203,8 @@ static bool event_param_valid(struct perf_event *event)
>>   		}
>>   
>>   		break;
>> +	default:
>> +		return false;
> why do we now need this here?
> Doesn't it deserve a separate patch with explanation?

Sure. I had initially missed out adding the freq cases, and the switch 
just fell through since there was no default case.

Thanks,

Vinay.

>
>>   	}
>>   
>>   	return true;
>> @@ -288,6 +303,10 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>>   	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>>   	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>>   		return read_engine_events(gt, event);
>> +	case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
>> +		return xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
>> +	case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
>> +		return xe_guc_pc_get_cur_freq_fw(&gt->uc.guc.pc);
>>   	}
>>   
>>   	return 0;
>> @@ -303,7 +322,13 @@ static void xe_pmu_event_update(struct perf_event *event)
>>   		new = __xe_pmu_event_read(event);
>>   	} while (!local64_try_cmpxchg(&hwc->prev_count, &prev, new));
>>   
>> -	local64_add(new - prev, &event->count);
>> +	/* GT frequency is not a monotonically increasing counter, so record the
>> +	 * instantaneous value instead.
>> +	 */
>> +	if (is_gt_frequency_event(event))
>> +		local64_add(new, &event->count);
>> +	else
>> +		local64_add(new - prev, &event->count);
>>   }
>>   
>>   static void xe_pmu_event_read(struct perf_event *event)
>> @@ -443,6 +468,10 @@ static ssize_t event_attr_show(struct device *dev,
>>   XE_EVENT_ATTR_SIMPLE(gt-c6-residency, gt_c6_residency, XE_PMU_EVENT_GT_C6_RESIDENCY, "ms");
>>   XE_EVENT_ATTR_NOUNIT(engine-active-ticks, engine_active_ticks, XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
>>   XE_EVENT_ATTR_NOUNIT(engine-total-ticks, engine_total_ticks, XE_PMU_EVENT_ENGINE_TOTAL_TICKS);
>> +XE_EVENT_ATTR_SIMPLE(gt-actual-frequency, gt_actual_frequency,
>> +		     XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, "Mhz");
>> +XE_EVENT_ATTR_SIMPLE(gt-requested-frequency, gt_requested_frequency,
>> +		     XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, "Mhz");
>>   
>>   static struct attribute *pmu_empty_event_attrs[] = {
>>   	/* Empty - all events are added as groups with .attr_update() */
>> @@ -458,6 +487,8 @@ static const struct attribute_group *pmu_events_attr_update[] = {
>>   	&pmu_group_gt_c6_residency,
>>   	&pmu_group_engine_active_ticks,
>>   	&pmu_group_engine_total_ticks,
>> +	&pmu_group_gt_actual_frequency,
>> +	&pmu_group_gt_requested_frequency,
>>   	NULL,
>>   };
>>   
>> @@ -466,8 +497,11 @@ static void set_supported_events(struct xe_pmu *pmu)
>>   	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>>   	struct xe_gt *gt = xe_device_get_gt(xe, 0);
>>   
>> -	if (!xe->info.skip_guc_pc)
>> +	if (!xe->info.skip_guc_pc) {
>>   		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);
>> +		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_ACTUAL_FREQUENCY);
>> +		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_REQUESTED_FREQUENCY);
>> +	}
>>   
>>   	if (xe_guc_engine_activity_supported(&gt->uc.guc)) {
>>   		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
>> -- 
>> 2.38.1
>>

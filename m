Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47763CD8CB0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 17:46:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28F310E1E9;
	Thu, 13 Nov 2025 17:46:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oEArFd7r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F7A410E1E9
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 17:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763056015; x=1794592015;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=4t6Fv966srOYcbOOu310n4k4CdExU2+QutZqTNPrVxM=;
 b=oEArFd7rZHLfEWu4dMArK2rqUkPVymhk9G8z+IE+fvESB06pFCGv9p3c
 hNr4q+Q3DhLkqD5uGnWelo3W8HmHO7ODeyRfma4Pgq98S2y06evXXvSUY
 ITkQPGdf+oBUVCqlpX969xpsFD4rKSr43MPrFsKUbcuzvzAt7X9Q1nIFP
 xwDemJIlB2MPY7+NF3TrrgiPw5IpTj9sWc/DkynKj+yYaiiIdKPvFTDgY
 vpIpR0qVt3PSjKdpTTz8K25OLSDwZJ2OT/73OeUaC0GmWnXW7bC7SA2UZ
 ihZMeECUgwhQeWmCpVOX1+1HDyLnl6h6XZOfFewR9xybjsXOA1mN0qpwH A==;
X-CSE-ConnectionGUID: HWFgYy3uTHy4+JfmIfnXjA==
X-CSE-MsgGUID: gNMpLjSWTtOmHWA5T/X0Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="76606268"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="76606268"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 09:46:54 -0800
X-CSE-ConnectionGUID: a7H49Nc/TemWNPaZ+pO84Q==
X-CSE-MsgGUID: 4t04xIw4SwWIOul8bkFmmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="189383662"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 09:46:54 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 09:46:53 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 09:46:53 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.24) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 09:46:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wYiurKc9iqfEea09z8FopPfgaQ/FpVAQ6EIfdgjULb1BjQTpaDeF1noqu42RY++EdEIGc/6LQ4jVn43LwrNxzap4AczxXebZ0SFqXToOt9s8rT2qcqen3MzwTdhBxN5mh6ZUm9/vGJIz3SJWLqf/Z7ujXlOa+9C8Mt6lCIKwGBXCeDJQ4OZd2B4Xb+OQlubdvASoJbgvcS6pSrluchGl7YoFRyEXaU8bHI/CCWy+Kjl5UZz1tuJo9LOvQWCeZN4jSlZ2k7yCuoAVUOmbosZYutDq9gLWF361U1aVhOW+gRGN4VAPtjwpyRm8fNkGTRnDvSS7dL25h6i43NmX/Tad2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vv38EIliyNZN4ggmMDUQCRfedxiPemCLgUQaziRNAa0=;
 b=sKdCHHQpmtRNwmXOORzGHc1Cuvjq0Jsm6UcIC7Nfzu4SdXP/uxnbSXmQNQp93TBEPnrAbWM5B/bSbr5lHUOUJx4CGyehUJmHvkb6vkmaIiciZDzYHe9lRR3XIBFG/lGxDJS3ouKPWp4dlSRnSYzzwZDenRhu1+BvSs1sPCINdYyo3CjfV2RP2uNAeg3FGbgjqXoBjSyMHfb2kR9xRAJiM6SowHfWz4TjggmE0I9HZ2n/oVZBOfCO6S80CoeEKxwGEnr1Pv0OvD1X6z32T2z6YhVZmauUSdBxExvFhRQzAw1yzV7qBSn63Y06GbSChdOzjasCB6AdhVH6PQgGDRhuGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ5PPF66B2E927F.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::830) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 17:46:49 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 17:46:49 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110232017.1475869-52-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-52-matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 20/30] drm/xe/huc: Use scope-based forcewake
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 13 Nov 2025 14:46:28 -0300
Message-ID: <176305598801.3698.2660225780526873174@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR05CA0092.namprd05.prod.outlook.com
 (2603:10b6:a03:334::7) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ5PPF66B2E927F:EE_
X-MS-Office365-Filtering-Correlation-Id: fd147336-344c-4f88-5293-08de22dc9f0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTZhbjhtSkk2aHphRXZpUXhabWt3ZjNFRDA5THhWZnkvYldpdlZqekNwRm45?=
 =?utf-8?B?MEgydDd0bjBSS2FkWnRZaGMwQStnQTRLV0tJU1d4SGR6eU1BOVRvZzlGRUZq?=
 =?utf-8?B?Vm5PaU4wbU82VTYrNm80TUFBS2tQWWdXMDFSWnFjQkhtelhva09sRURPVVFp?=
 =?utf-8?B?RUVqM2lUWDNjVG9iRUl3RkhQb0R2bWJybzdBanhEay9zWUZxS2VGTjFVblM5?=
 =?utf-8?B?UE9kTnNiL1U2blptRHhRM0UzWE9reHE0b1ZXcndYUmhJMldmUkduSEJ2ZDU0?=
 =?utf-8?B?RjJrNVAyc2IycDdTSWJaQ1ZSNXN6TmhDUDFwMi8raEVHUDNUOGgweklFbWJ2?=
 =?utf-8?B?S1V6NDhpNEJCMTNzTm44MGx2bTVGNzdQM0hQbmhxd2U2ZGtpc201UFNmT0lR?=
 =?utf-8?B?cnVGUnJYb1c1VWNHZHlGaEs2T1VlRnYrQkVPZmRLZVVCVjFXTW9LSmliQzNS?=
 =?utf-8?B?YVRFN082bmhwRXg1dnpLWTdvYzA5WjFiK1JiZ3RsZTdrZjJ1K1ZESEFpQ2ll?=
 =?utf-8?B?ck9JR2pwd01oYzlHcVQrZzVoZ25ZaXh4NUcrN29WMjlFU2oyQ1M3dUh0Rkt2?=
 =?utf-8?B?VXBpRi93cVRqOEdDSURXWmYxWHVveFIwemhVSFJFQldaN3I3VDZtb1BweThy?=
 =?utf-8?B?c05MWm90TlROem9jWmx1WmhzUElsMENIdFU1aStBT3NyMFgwdFUyOU1oU3BG?=
 =?utf-8?B?M055OXZyTUh5dEVoMEtqck5aN0s5OXZEbmV1Y1pHN3JDNTZGL3RVSElZeUtp?=
 =?utf-8?B?UUtlTTdxVHFrT0pOYnRZUTlXRlprVGQzOC9SVmE1RlFCWm9UWE9zSC9TTnk2?=
 =?utf-8?B?a3Q2RkNiZzJuMmRlRlFHUVMzUCtSM1dzRzhvM1gwYzRrZEw2OVFlYld1czY0?=
 =?utf-8?B?N1hqWjl1dmlUSW1LcURRWjN0aDVZcUswN0FmdlMvUFY1Nm9ERURDQWNxQzZW?=
 =?utf-8?B?eHBjL21Nb3BZWDdIMEx0ODlSRFpROFltL2ZMM1NDTEVGVi92dzIxZWs5Wk1k?=
 =?utf-8?B?T2JWeEJVSkdzNmlVeFpSaXdDcytlOVFtTmhiZDhwOHo4WWVEWEJKQ0RZc1BU?=
 =?utf-8?B?NTV2dzNJQUYxV1ZKNVArQUxObTVTOVI0YjdSVTJqakZJbHFFWWhYTlo5RHdK?=
 =?utf-8?B?YStzaXFpNWkySXVXTjdhSEJhcW1mQ24xQkRnc25EWUdtMDZPRzU1TWxRT3Uw?=
 =?utf-8?B?OTFPMFRBOWo5TVFHTXhSVnJDVW5lNWh1anhVRDJpdVFCUVg1SHJuaUVJQ2Y4?=
 =?utf-8?B?RWcxSjdYV3JVc1JaSExWVnVlc1BSd1F4OEUrS2V5emNmNGxZSWJpQTBXV0pj?=
 =?utf-8?B?UVZTeUNwbld0cVdBTS9Ed0w2TjB5RVVEbURWM2Y2dFQ1ZVZCNno2U1Z6dVVn?=
 =?utf-8?B?M3BtTC9IU2xnekhhSHhlbHE2c2I4SE1GUldtQTVBYnZybjdwRk9QNmQrWmFR?=
 =?utf-8?B?L09NZC9aMk9OSVVybW95NEtKenpHcnFlWHNlWnZKOEVrYzkweTNNSUtxclFK?=
 =?utf-8?B?VnorTU16R1YwdW1EZWlOa3BLL0dWQnNJeFF5ZWt0TGJwby9QWUpYYlhKYmwv?=
 =?utf-8?B?cGJlZmlCUVFMbENhUStPZzlMa3VxamJwYkQzbzl5Syt1anUveFprTDZuTFZn?=
 =?utf-8?B?T2V6ZllYWmdNNHEvTjBwL0l4Sk1lZ0JxMkZaaUluSVM5UzJqTytDS1BlclZT?=
 =?utf-8?B?SHJHUEE1RUpGRDJ6MkdIaDNHdkpid2RIYVliaFpRL2R0b3ZaUzM1NHNPQUhT?=
 =?utf-8?B?OUFnRkcvWDJCZHNJMndRMURjeGdRcXgyaDFEa2NReWF4RW0yUlg0VVp4bXY0?=
 =?utf-8?B?Smc1OUlZeTNjQ2JCVmhnaGdRemtqc0lxNE16czdHeWVYZHJ0L2hVcVRMajBq?=
 =?utf-8?B?alVRZjBjVzZaV2JXQzZleVF3eGZIY2NnQ1pNRDNzYTFIZEljZlhoK3Iwamdq?=
 =?utf-8?Q?ClZ0gacxu1XoXhf0GXDiq55L0RvCwdfG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clBURDVyYXFLN1VLQkUwRldhOU5oN2l6S3R4bnpyZzEva1hRcXZoalJnNFRG?=
 =?utf-8?B?dExaZ0ZpaVJlbkJ5aXh3T0VkWGpEYUc1T2hoZEU0M05RNW1BcTdsdGVlZ2JR?=
 =?utf-8?B?RUg1bXREcDhHb24zR3l2Tzd1WnlnM2JyUzdoK2svZEI5RjBDbUYyS0VWM2xz?=
 =?utf-8?B?WUpYZ3kvNG5XYjVkRENxS3U4ODZqTE94VWVmZVZScjI0QVJuT3N5MWIrWXZU?=
 =?utf-8?B?Q2dValFnMEx0QndlTldLZUdnOXVQRU9vTDlQRkxmZTlMUUtQcDl2UFlhWTZZ?=
 =?utf-8?B?d1VlcDF0eDdDRU5kSXQycE1nUWNIdGZTVTAyRG94YzJPVWd2TFRxRDcxeFVz?=
 =?utf-8?B?Vm1POHFkUGt3aVJCQWJKWkNWdFhvdjBydXlCS09XaTQzc1paQ241WUJOT29t?=
 =?utf-8?B?YVBKMFRocmFMbTRiVGlvelQ2ZWVzQ3h1UGp1azNFbEJwTUlvb3pIZFpRMU1L?=
 =?utf-8?B?Q2ZuYWVIc0xQYmxCV2lmL3MrazFlYzNkdU4wWnJuUnFsNGVEVk1KMmhKY2xj?=
 =?utf-8?B?blJPTGJzNW44cCtHVU5Yb1FBSGJLTnM0dHhlSVJXU2RVTktyYVpmZ0Q3ZTdk?=
 =?utf-8?B?S2hRZ21OZTlsMlFxS0Ezb1N2eEczT3BDSm1acjBxOUtNY1ArNjA3MXZEdEU2?=
 =?utf-8?B?R0lDNUlyTWdVZzhGbkdzQVJOcXVrb2hEOWhmYTQ0NzkxVDhsN0phOHorY3hm?=
 =?utf-8?B?UlRySmhENTNWR1VqdGRscmVZYU4yazZ6LzBJS3Z0UDAxSENEcUM4RlV2QmdE?=
 =?utf-8?B?azZUMHgvQjdFdnQ2TUtVS3dWSlpXSy91MFpVVURrSUVnUHR1TGZpS3labjZ1?=
 =?utf-8?B?UVFyanpBbVlhQUM4UHY0aitxcmFYTDAwQmVhREQ0d3VnS0Zqdkh6dG9jZ3A3?=
 =?utf-8?B?VHJLQjJqczJ6aStqNzZ5aFIyb3BmY0M4OEQwVWdya2VsZkpHUHlzbW5LRzR5?=
 =?utf-8?B?SDIvWlRERGZJSUJ2TnFtVkF5TCtDN2VSN3Q1VzVPdm96ekhCQjRRYTVBNVFm?=
 =?utf-8?B?TGhwWmhkejB2Z0lPUW5xNXlkTUdpbGxFNWZ6b0VxM2xqZ01uSUU4aUV3TjdG?=
 =?utf-8?B?ejJmOXhhaXB2NVIyYkJBa2dxU3gwbS82Z1ZrQXFhMGZjKzQvSGoySnVmQ1pC?=
 =?utf-8?B?WDM5NkloSm4yTjFWa3JTR2trYUhpNHYyaXcrU3dzbGNvOEFsdzdJWWwvTmQ0?=
 =?utf-8?B?Wm83OG9zWmhjTjVaM2d6L3dsQWgwUTVQa1NKQ1h0VnVkVUhCOGQ4TER0VVdW?=
 =?utf-8?B?L2hIdTJ0SDI1RFIyWXdwRUZ0Z2U0dFdYV0h5ZjlOVFlXK3pRWEVxNkNVaXhE?=
 =?utf-8?B?QVJFb093K1pJN3lTMFIwUHU3ZngyTTdLWEh6UlUzcmdnSzY0MVZTcFZ4clN3?=
 =?utf-8?B?Y2ZzclBZUE9UVFpmKzdUdVVUbjZ6R2wwaHFSSFNkRjN4cW85eGhkSW82L3hD?=
 =?utf-8?B?ZjQ1RGtteEZqTjZwMFB0ZDdkQXVDdHI0QS9DMS9IWDBybVpJNHZMMVJINGhi?=
 =?utf-8?B?eEtWQVV2SWVQTElPZGdEZ0ZXNnpUYS92MWpGMHBjWFFSTzAxRWRtNmZsUnFE?=
 =?utf-8?B?azVaSEIrN3QzM0dZSktiRThQTWZBbHpWK04yRnFaZzR2THAwZjRCc1FZNGN5?=
 =?utf-8?B?QjdRak1KMzlTczlkNkxLeTRnVStQZVlaUkVmU25aSjR0UEpZbnl4RXVaeDUx?=
 =?utf-8?B?SlRDQ2s3SndUNnFZeEhPblNOdm1hVXhmOFNiQ2lyTjZVbFJ5VDdXR2F1ZFZ1?=
 =?utf-8?B?cVpNcTdEdGFkbm1FeVhwcnRsc1piTmFNRFB6cStpV2xPcUgxMXF1QTdTcHJq?=
 =?utf-8?B?aHZ3NUNsemFmTkI3TW1LcmFBYy9HMklmL05ac09NZVgyZWRzRTRuMDBjUHlH?=
 =?utf-8?B?SmFYRmZCUkwxN2Y4Y0FERGJIWmQwS1JTMSttdjE0WjN5VXBJWjVMdVR5VFhh?=
 =?utf-8?B?bm5LbjlMclA5QURIamhCQ0QrSm1xa3BRTWg4Ukt1dUtPemdoTk9HL2xNZzA4?=
 =?utf-8?B?T2djTjg5c3hTUEg4a0RYSHYzSm9BSWpnRTV6Q2JkcmdPZ1oyK0VjVjAzVHc2?=
 =?utf-8?B?NEd0SzBjeVFlVmc0REx6Yytvanc1VGEyZEpLVFBKOU1xbkhXd1R2R1IzUHFm?=
 =?utf-8?B?QS9US0M3Z2paa1BRWTJ3ODFHQU9sU1JMczM4VXc4eU9meklsZStvblF4TVQ0?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd147336-344c-4f88-5293-08de22dc9f0b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 17:46:49.1294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zcJ7NH8RFlKvuO2nFmwL8ppalJHYnoF4+QKVEF7xyGcNWO397O6s52BvfvXjbKHfE4/cf8ZxKoiCZYzfRkq0Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF66B2E927F
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

Quoting Matt Roper (2025-11-10 20:20:38-03:00)
>Use scope-based forcewake in the HuC code for a small simplification and
>consistency with other parts of the driver.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_huc.c | 7 ++-----
> 1 file changed, 2 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
>index 0a70c8924582..4212162913af 100644
>--- a/drivers/gpu/drm/xe/xe_huc.c
>+++ b/drivers/gpu/drm/xe/xe_huc.c
>@@ -300,19 +300,16 @@ void xe_huc_sanitize(struct xe_huc *huc)
> void xe_huc_print_info(struct xe_huc *huc, struct drm_printer *p)
> {
>         struct xe_gt *gt =3D huc_to_gt(huc);
>-        unsigned int fw_ref;
>=20
>         xe_uc_fw_print(&huc->fw, p);
>=20
>         if (!xe_uc_fw_is_enabled(&huc->fw))
>                 return;
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>-        if (!fw_ref)
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>+        if (!fw_ref.domains)
>                 return;
>=20
>         drm_printf(p, "\nHuC status: 0x%08x\n",
>                    xe_mmio_read32(&gt->mmio, HUC_KERNEL_LOAD_INFO));
>-
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
> }
>--=20
>2.51.1
>

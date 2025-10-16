Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166CDCCD183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 20:16:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2EE310E355;
	Thu, 16 Oct 2025 20:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gCJUaZW7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E0210E355
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 20:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760645772; x=1792181772;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=KvgGcKBShH/m4NnW23Mjh+3+fx2iUxfqiB0Jil4e4k4=;
 b=gCJUaZW7MSonNEm5bZ7fh1wI0EPf7xTXN/YW3DBrHcbYeJq7bLSbJKun
 KVrMGC225KKAK5GnF/ScwcW5EjPuWTlckqR3b2Mr0E0SW1MEZ80pVJ4ci
 wz27P+wMxWYqmJZUJ9kDnD8v6oaPWm8+3+46tZTRaGTJ68PmAOW8Q+2Mq
 3CmyyN89UgTNfI5FSafCtZkg90XvSTp3YACEDZa6iCOkSLnmL34gkc6Uj
 kPx0x+dQsAgnrThljhI8gWpkKDehgHly+XjJX/Lpl/5Naz2MHdjP7Orib
 4tHzPfIs3/BkLIy3qVvl1nAN3EPhVOdNAmeO7Hk/XPKDcuMncnUZUdkQp w==;
X-CSE-ConnectionGUID: XuYiJDIhSY6oNfMy6TaM3A==
X-CSE-MsgGUID: LRa5UcV7QIWjJ3oxMHXafg==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62999626"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="62999626"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 13:16:12 -0700
X-CSE-ConnectionGUID: l2nKldCwRQigx0jtOZJ/jQ==
X-CSE-MsgGUID: HKwPISCPTBeCjavhZDgSzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="206253283"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 13:16:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 13:16:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 13:16:12 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 13:16:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XUvEeF6HgLiAPYimBvhD1MY4tb4Uz0DKkVYk0T2MZLIZkvRS9EJJvR7kgJPLDkfeC1IER81rdfWxDK9mAumFPz5AXBzSSjwP7nkW8Ny0bQi/nuz1xDY7SbmeP9eJCbtpXMZo6Li4c6cEDH0T5ubw1lOcAeuS8P8AzmLLuSLOGDnW9/iOF+nBsCN+rQiVzetUjTLai3wxSic/XfpcV8p94+NVDwgoZbNi0QFW/Jh6pw8qfMXv34wjKSY6inn2WTJ/hvIhf4i9irU9wZT/pjRLJe+wXMVIZk5MKtcp4TTvBMVW5b5Jgwj2h8nhubrNBa4UUyZSKiHNgz+/yGnj5qtdeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y0YSpAupH1O5NnfUqJ45cJA4VnPWBdg2av1wAaPXo2Q=;
 b=UC33HmioKlss35tyhQU1Axn+UceiyZZblUDuEquGHkOVZrz7Nt30oXCbLNR/X8icrHlTM2QwmzlNyiIRKIbCyM3Kn92Q5S0zn5LidSpK6clMiILbFQ22jB/gKiMFgtxJk27k+Df+Sx75DPvosxxcSPhNYVJRpqEv9+4W8ydhc+qPnvtN354DRDSc7USKww+pvuB7436rsHC1y7fDxtVJvZeptq4s7/baIqTjymzmw3VNPNFIJMvLAu5Og10KsMJATpK2jK5kicpI0k/R8whf1a3qVZZ9iPB/PHqBdIxpf1W6zK6I5psPFf6m9VXLkiM1yjFc/atGTQduKhE6lZmPtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS4PPF6EA6DD735.namprd11.prod.outlook.com (2603:10b6:f:fc02::2d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 20:16:05 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9228.011; Thu, 16 Oct 2025
 20:16:05 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ise57wnkjlhka4eivz52xfrwnxfhxfcrhuifruqvarwzuosxuv@7ejlhrrnbkmb>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
 <20251015-xe3p-v2-16-b9189b3056a2@intel.com>
 <176061507440.3168.6260974313214537346@intel.com>
 <ise57wnkjlhka4eivz52xfrwnxfhxfcrhuifruqvarwzuosxuv@7ejlhrrnbkmb>
Subject: Re: [PATCH v2 16/22] drm/xe/xe3p_xpc: Add MCR steering
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Thu, 16 Oct 2025 17:16:01 -0300
Message-ID: <176064576184.2362.16093674347122378319@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR13CA0212.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::7) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS4PPF6EA6DD735:EE_
X-MS-Office365-Filtering-Correlation-Id: b7bb79f3-fdfd-4a08-305d-08de0cf0d608
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGhWN0hGc2xFcVo5MW1UQWVlVmNTOUs5U0twTXlyRmhLZGM4VHZaeEpkVFZ1?=
 =?utf-8?B?SmRGV2dHa3dNUXNDU0ZabjA5S04wNjNpaVFLNHlaOUQ1aHpLcXhUenRveFcx?=
 =?utf-8?B?M3JDblVDUkZQTDJkclkyOHhJbjg2SHVCNERtbTMrcmJuQ21PRlE5SVpneWEw?=
 =?utf-8?B?K2JCWnhUYXcvZE9jcU1INTZ1TkJLelJocUQ2ZFNyOEEyOUhMdGE5UHFIZzAv?=
 =?utf-8?B?QTRhczVVd0FMNVR5TFFpNGxFWEt0QkdVMm5BVHhndzlScDhtZkRvSWJPTEpM?=
 =?utf-8?B?eWYrSVp2SmxXcGZWZDhNaUs5RVhETk5DWC9CQVJ6TEwyUGQ0d1EwS25iR1Fx?=
 =?utf-8?B?L0VVRGphZjZDNTR3dmdKMCs3OHU4VStvQVJkZklOWU83R0pZUWRoQnJ0eE9B?=
 =?utf-8?B?TnlnSXZCZ1cvYlhYVGpPWWJ3bHp2MkZFdmNVMHIwS0ZTcVl0VDVJYWV1bkpW?=
 =?utf-8?B?NWtkdlNmekxrTlVHSUE2Vzc3RnFRNVU3UHZPRlQwNVNnUEVLRFJ5ak05OWZS?=
 =?utf-8?B?YkpiN3V2bDdTeTRTeVFNRXcwSGY0YVBpTlo3NXIxNFRlb0dtVWYxNytHR2o4?=
 =?utf-8?B?WGQ3bTBFTDRUVzZFR3JteTcveWxLL3F1QTZjM0pwYk53N25OWDVSNndDSm5Z?=
 =?utf-8?B?cnI1SUR6WXhUM2ZteHdvL29kbVk4dGdKajFkVHpPSm1HY0lQdEx1SEhOTnNk?=
 =?utf-8?B?MkdKTDR1OUhzaThrYlA3R2I2NFNITDBjbmV5K3ZQRFpBUzJ2b1EyNk4xOEV2?=
 =?utf-8?B?YXN2SmlaallZeFRpaGE2Rm1GWlZxUUYrTS9oT3pxTytRdGVEdlVYdjBhTnRY?=
 =?utf-8?B?eExJbDZpSWtEMmZyMWtJZUxPdlhHSGJMVDJ0SDJMeEd0OW53QW5WSmxsSUxp?=
 =?utf-8?B?ek9taGpaVmo2YVpTelNNUWUybWo3bmplNEwrZnhiL2dyYk5WRm0yWS9vQUky?=
 =?utf-8?B?dktENGFEeFMxbk5VcnlCUXhxeFhkN3JQRFRKQnpCOUx6NGVFalJDTHRuZVh4?=
 =?utf-8?B?RmFHWjM4cW5IM3k4OURlRmJSMktIbWhrMXRxSjlieXd4N0dOQlczNDBYVllF?=
 =?utf-8?B?NG1vWklXTERqcDZJTXhaL1hySjQwTG51b01WSkQ2aWc1blJjMG1FNWg2azNT?=
 =?utf-8?B?Wk83VTNUM0F0MGJwQXl3SllQWm5HbE50NS9PRlpjOENtd05aS2lrMVdaTjRP?=
 =?utf-8?B?Z2dwVHRtWlZ5TDVub3BmMmQrN2pEUVh3WmhsL2tBWVNZQWFKNFhiWjM2eEdl?=
 =?utf-8?B?NXNRMUlDTVFoWFI2cVdCeWYrUm5XMEVxL0V0ZjBpVklZVDBzZDRPemhmWW0x?=
 =?utf-8?B?cnFNYlRCQ3Yvb2xqbWYxS1BpU2xkSFA2ZGprY0oxMFJUcW9ZQ244WkhSWnJD?=
 =?utf-8?B?WGdhT3NLT3g1cjRaS2IyMDROUkIyTDhNeXozcXlCUGVGYU9yOVd5QjJyU0FH?=
 =?utf-8?B?eHZJM0twaDhVK3RZalJjOXN2Uk94OVJxd0xneXFtOXJaMFIvSU5yeUFDdkMy?=
 =?utf-8?B?STZFUG8ya2FnZk1JUmJzUURmTlBET0RTU25RVDVKbFNKenNhcXh6d1hsMk02?=
 =?utf-8?B?YSt5N1pPbDZkOTQreTVmeVBOQ1I4S0R0L0tweWJ6M2dycFlFcjdIRU1XcTBI?=
 =?utf-8?B?UFhJVlg3Q2JnNlF6QlBJVEtJaGNPUmFSRXVVMVhrVHBxMTU4SDhScmtPd0dl?=
 =?utf-8?B?WUlLSWdVS2xHU0tXclRGN1Z2d050RTYzK21TKzJqcCtDR3FwQ0pEOFBuWVN3?=
 =?utf-8?B?RHdwWE5DWndEb2k0aTY2ZEhockY0blJTeUtJWVF3MnErVjlkUGt4cFhCNU5M?=
 =?utf-8?B?VEEzSFI1d1I5WUI2RVlXRkx3Vk5GbEpGQjNPcnRJY2JURk9OQU5jY0d5RWZ3?=
 =?utf-8?B?UHpyY3QwcU1iZ2toQ1JIMXJWNk5SMmdnVDYvVEYvUVRSbHFZM3JFNXZUR3ZK?=
 =?utf-8?Q?pl9kujdzi5c2d2u1oQPBTqNzBhc9CghP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUFQRWIxZkIvd3Y2bHQwVlhHQ3A0NSsxaVFBdDB5bmpka0FZRlN6ZG9CRC93?=
 =?utf-8?B?YVZZVTRCRUh0eUlvS0ZFaUNTSkJBL1BKdThUMnp3ZURQUkI1dUREemFUdTR5?=
 =?utf-8?B?YnNoRS9OWk14eGwwQkFORk94NkZPVUlXT0F1Syt2NGNFbnhObExXNkhOVmht?=
 =?utf-8?B?MjV4SzI2dFNOMjZmT0o2Qk8xSXJWRHAzNlRDQTN1MFZVaXR0Qk9MamtTOGxS?=
 =?utf-8?B?UWJSWGc4cXo0ZzBwOUU4b2FWSmxzZHZjTmRwL2pyRTVpREFKVWZ0Rm5semlh?=
 =?utf-8?B?cFZjQ25xSkJMSXJuMHBvNjMzbllndmltOFhSZDhRc2RoOXRjb1hZN1d3Y2J1?=
 =?utf-8?B?aXIrZExpS0NRYnozYXJucmNGcVBxVjAwejAvYzNVdkEwSklvRUdKUjE3OTc4?=
 =?utf-8?B?N2NZenBxMFh2Znkrb0ZkL0RCcExsT2pEMm5XdUZKY1RvV1dDMDdibHIvakdI?=
 =?utf-8?B?cEZhZTBLTDBrUUdISTNENFNNNmVUKzN6TmtCYnBSVEdZalZYWDF4OW5CSWdi?=
 =?utf-8?B?WnZldGlRY0xWMVg5UlJTWHVYTVpvT3NOMDhIdVFwNE8wWFh2eXk4NThFWWhh?=
 =?utf-8?B?U0xySHp5VTJvQmwyRDB6Vmp2SEVkWWNwYkkrUGptU2ZPMHJlempoT2dkVkNp?=
 =?utf-8?B?WUlma1RYazVTL2x2WmViZDVRYTRLb3RhaDl4MnZwYUo1Z0VWN2ZLU3ZYc3ht?=
 =?utf-8?B?WmgwZ2tCeE0vNkxDeUhpR2F0cUlDYW9lQjRCOXVpZTQ2eVhsc1l2STF5Vjkr?=
 =?utf-8?B?bldZSjcyVVd0Z1JIZyt0ajhiVFRBWjZHc1NpYkJheWk5RkxIOExxTU1ZdzE0?=
 =?utf-8?B?VWlZdmI1MVl0K0N0ME9ZMDVYcHF2Tit0citKSkhheUtTM3ZrS3NCQkk5alN3?=
 =?utf-8?B?cld2TG9CblJCRGdVS3ZOU0loZkxYYTdMU21qQnB1R3hHQmMyanBYMlkzM1Zu?=
 =?utf-8?B?S0M2WUZYUFBiay9uWlJabmZKTnFZUkpIR2Z1ck14QkV4QnJ0N2h1OXhZcHNQ?=
 =?utf-8?B?RnJrYzFYL1YwR2tOZzRRVzVQSHdEKzQ5alhxRndRQU9YeUZpT2J3bGVWaEFL?=
 =?utf-8?B?VDYvRFdPdE9mNkxWL2wxdk81L2M1SkpwZnZycGx4MzdGOUpWWmFOWXhocktl?=
 =?utf-8?B?VDV6NFR4VjlRUGpabEI4MWFRWFlJTmtHaVBXcDdGYWZQWmRpWXhGSFZCT3dW?=
 =?utf-8?B?ejUyMW1kRENldG10Z2QwMWFWZ1VpblBNd3J4WkE5YzhmYXhrMkZuMGNaYzhp?=
 =?utf-8?B?RHFhdTBTZXRZeXlvT3pZWUNZY2ZBenR4UFNzUzVUWjFyZzRxZjNkQXBlM1Np?=
 =?utf-8?B?bTZpZjFleGgydVlkYXluTjI2SEI1MHBzNU0ycE5GYktxdkR2ZjZNaFVYZVhp?=
 =?utf-8?B?VlNRTkF6Y3Y4bVRMRUZMMVZsbFduLzBKejhOczQxV0l0N294K29hekNFejlo?=
 =?utf-8?B?SE1NZzZMTExtbzlWRThIcGppK0VwcG5xVmNWUFc2T3hrUUNNdDRjOUZDaHdS?=
 =?utf-8?B?aUVFVnlzMG9zOWlLTnZLOG52WkZoajdHQjdWNGI3OGJOTlhubEVXVGZFN3Nz?=
 =?utf-8?B?OFRXT096em9YbUt5MW1IZ0R4UHdtUERuZ25xd2tLU0U1MVFOeTdNUkRhUGRE?=
 =?utf-8?B?enYzY3JnVmM0ZnNSQ1BDc09XYjYzTjRGNFhYR2hWUlhWNjh1QjdrUnFqenpY?=
 =?utf-8?B?ME14U0tLV3ZmTmF6bjhwZUNGdElwMXQ3Q0JHR0Q1dDkwbWZiZnhaS3doRlRL?=
 =?utf-8?B?NUJvRUxyMmxBdDZmOEQxZDZ3WDY5ai9haFRtanIwQURDNnpvc0g3djlVMjcv?=
 =?utf-8?B?bVFlRCtvT0M1TlozZ2VZRU5ubk81Zk00aGUwNldhSXdiWi90Znl0VDdCNnVj?=
 =?utf-8?B?djlJZEhTcVRVOFhhVjJwcWZodUtJUUcvQlhmUWtQRlprNDVnUC9qWTI1cXVF?=
 =?utf-8?B?QlBxdmhqN1NQaVpFc00zblJnSU5odDZ5Q3JNVlJKS2s2N0RrU1RHNmlRN1RK?=
 =?utf-8?B?bUkxZC9ZdUsvaUdENlRoeTJJVVhpZzErRTFobTZScW9Cam1Ja0MzYUhUem1a?=
 =?utf-8?B?WWZnak5pZHBEQmx0MkdHZUtoQzlFM1JIcklVbUJ1NEN2eXRjWFJHY3dtOEd0?=
 =?utf-8?B?cVFjU0ZGb3c1U1EvQ05mSjcyTzlIcWNOUjJTVHRYQUxHNHRtdWI1c2tXcDR2?=
 =?utf-8?B?NVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7bb79f3-fdfd-4a08-305d-08de0cf0d608
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 20:16:05.7074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IRHaW3bjjSxGe/ZOW7e7EywC5CO0zeIKvndq5Xp8RN5hRFK6Ie727qbmkJuExGwaSLDYNBxUa8BIPmDK344X2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF6EA6DD735
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

Quoting Lucas De Marchi (2025-10-16 16:48:01-03:00)
>On Thu, Oct 16, 2025 at 08:44:34AM -0300, Gustavo Sousa wrote:
>>Quoting Lucas De Marchi (2025-10-15 19:06:31-03:00)
>>>From: Matt Roper <matthew.d.roper@intel.com>
>>>
>>>Xe3p_XPC's steering has a few changes from Xe3.  Aside from
>>>minor changes to the XeCore (the new name for what used to be "DSS") and
>>>INSTANCE0 tables, different rules apply to different subranges of type
>>>"GAM."  Certain GAM subranges require steering to grp/instance (0,0)
>>>(and thus use the INSTANCE0 table), while others require special
>>>steering to (1,0) instead.  Similarly, there are multiple classes of
>>>"PSMI" steering, with some requiring steering to (0,0) while others
>>>require (19,0).
>>>
>>>FIXME: There's an "L3BANK" range listed in the bspec that needs
>>>clarification.
>>
>>I think we also have a NODE range that is also missing termination
>>details.  I think a TODO/FIXME in the code for those two types of range
>>would help reminind ourselves about the need to complete the tables.
>
>Like this?

Yep, but with a few tweaks, noted below.

>
>
>| diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_m=
cr.c
>| index e5506ec28e147..f35d8a31c1079 100644
>| --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>| +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>| @@ -515,6 +515,12 @@ void xe_gt_mcr_init_early(struct xe_gt *gt)
>|                 }
>|         } else {
>|                 if (GRAPHICS_VERx100(xe) =3D=3D 3511) {
>| +                       /*
>| +                        * TODO: there are 2 ranges in bspec with missin=
g
>| +                        * termination: [0x00B000, 0x00B0FF] (NODE) and

The range [0x00D880, 0x00D8FF] is also tagged as NODE.

>| +                        * [0x00B100, 0x00B3FF] (L3BANK). Updated them h=
ere once


s/Updated/Update/


--
Gustavo Sousa

>| +                        * bspec is updated.
>| +                        */
>|                         gt->steering[DSS].ranges =3D xe3p_xpc_xecore_ste=
ering_table;
>|                         gt->steering[GAM1].ranges =3D xe3p_xpc_gam_grp1_=
steering_table;
>|                         gt->steering[INSTANCE0].ranges =3D xe3p_xpc_inst=
ance0_steering_table;
>
>>
>>For the ranges added in this patch, I checked and they match the Bspec,
>>so:
>>
>>Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
>
>thanks
>Lucas De Marchi
>
>>
>>>
>>>Bspec: 74418
>>>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>---
>>> drivers/gpu/drm/xe/xe_gt_mcr.c   | 56 +++++++++++++++++++++++++++++++++=
+++++--
>>> drivers/gpu/drm/xe/xe_gt_types.h | 15 +++++++++++
>>> 2 files changed, 69 insertions(+), 2 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_m=
cr.c
>>>index e1a2b38fc2a86..e5506ec28e147 100644
>>>--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>>>+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>>>@@ -169,6 +169,15 @@ static const struct xe_mmio_range xelpg_dss_steerin=
g_table[] =3D {
>>>         {},
>>> };
>>>
>>>+static const struct xe_mmio_range xe3p_xpc_xecore_steering_table[] =3D =
{
>>>+        { 0x008140, 0x00817F },         /* SLICE, XeCore, SLICE */
>>>+        { 0x009480, 0x00955F },         /* SLICE, XeCore */
>>>+        { 0x00D800, 0x00D87F },                /* SLICE */
>>>+        { 0x00DC00, 0x00E9FF },         /* SLICE, rsvd, XeCore, rsvd, X=
eCore, rsvd, XeCore */
>>>+        { 0x013000, 0x0135FF },         /* XeCore, SLICE */
>>>+        {},
>>>+};
>>>+
>>> static const struct xe_mmio_range xelpmp_oaddrm_steering_table[] =3D {
>>>         { 0x393200, 0x39323F },
>>>         { 0x393400, 0x3934FF },
>>>@@ -247,6 +256,30 @@ static const struct xe_mmio_range xe3lpm_instance0_=
steering_table[] =3D {
>>>         {},
>>> };
>>>
>>>+/*
>>>+ * Different "GAM" ranges have different rules; GAMWKRS, STLB, and GAMR=
EQSTRM
>>>+ * range subtypes need to be steered to (1,0), while all other GAM subt=
ypes
>>>+ * are steered to (0,0) and are included in the "INSTANCE0" table farth=
er
>>>+ * down.
>>>+ */
>>>+static const struct xe_mmio_range xe3p_xpc_gam_grp1_steering_table[] =
=3D {
>>>+        { 0x004000, 0x004AFF },                /* GAMREQSTRM, rsvd, STL=
B, GAMWKRS, GAMREQSTRM */
>>>+        { 0x00F100, 0x00FFFF },                /* GAMWKRS */
>>>+        {},
>>>+};
>>>+
>>>+static const struct xe_mmio_range xe3p_xpc_psmi_grp19_steering_table[] =
=3D {
>>>+        { 0x00B500, 0x00B5FF },
>>>+        {},
>>>+};
>>>+
>>>+static const struct xe_mmio_range xe3p_xpc_instance0_steering_table[] =
=3D {
>>>+        { 0x00B600, 0x00B6FF },                /* PSMI0 */
>>>+        { 0x00C800, 0x00CFFF },                /* GAMCTRL */
>>>+        { 0x00F000, 0x00F0FF },                /* GAMCTRL */
>>>+        {},
>>>+};
>>>+
>>> static void init_steering_l3bank(struct xe_gt *gt)
>>> {
>>>         struct xe_mmio *mmio =3D &gt->mmio;
>>>@@ -419,6 +452,18 @@ static void init_steering_sqidi_psmi(struct xe_gt *=
gt)
>>>         gt->steering[SQIDI_PSMI].instance_target =3D select & 0x1;
>>> }
>>>
>>>+static void init_steering_psmi(struct xe_gt *gt)
>>>+{
>>>+        gt->steering[PSMI19].group_target =3D 19;
>>>+        gt->steering[PSMI19].instance_target =3D 0;
>>>+}
>>>+
>>>+static void init_steering_gam1(struct xe_gt *gt)
>>>+{
>>>+        gt->steering[GAM1].group_target =3D 1;
>>>+        gt->steering[GAM1].instance_target =3D 0;
>>>+}
>>>+
>>> static const struct {
>>>         const char *name;
>>>         void (*init)(struct xe_gt *gt);
>>>@@ -426,9 +471,11 @@ static const struct {
>>>         [L3BANK] =3D        { "L3BANK",        init_steering_l3bank },
>>>         [MSLICE] =3D        { "MSLICE",        init_steering_mslice },
>>>         [LNCF] =3D        { "LNCF",        NULL }, /* initialized by ms=
lice init */
>>>-        [DSS] =3D                { "DSS",        init_steering_dss },
>>>+        [DSS] =3D                { "DSS / XeCore", init_steering_dss },
>>>         [OADDRM] =3D        { "OADDRM / GPMXMT", init_steering_oaddrm }=
,
>>>         [SQIDI_PSMI] =3D  { "SQIDI_PSMI", init_steering_sqidi_psmi },
>>>+        [PSMI19] =3D        { "PSMI[19]",        init_steering_psmi },
>>>+        [GAM1] =3D        { "GAMWKRS / STLB / GAMREQSTRM", init_steerin=
g_gam1 },
>>>         [INSTANCE0] =3D        { "INSTANCE 0",        NULL },
>>>         [IMPLICIT_STEERING] =3D { "IMPLICIT", NULL },
>>> };
>>>@@ -467,7 +514,12 @@ void xe_gt_mcr_init_early(struct xe_gt *gt)
>>>                         gt->steering[OADDRM].ranges =3D xelpmp_oaddrm_s=
teering_table;
>>>                 }
>>>         } else {
>>>-                if (GRAPHICS_VER(xe) >=3D 20) {
>>>+                if (GRAPHICS_VERx100(xe) =3D=3D 3511) {
>>>+                        gt->steering[DSS].ranges =3D xe3p_xpc_xecore_st=
eering_table;
>>>+                        gt->steering[GAM1].ranges =3D xe3p_xpc_gam_grp1=
_steering_table;
>>>+                        gt->steering[INSTANCE0].ranges =3D xe3p_xpc_ins=
tance0_steering_table;
>>>+                        gt->steering[PSMI19].ranges =3D xe3p_xpc_psmi_g=
rp19_steering_table;
>>>+                } else if (GRAPHICS_VER(xe) >=3D 20) {
>>>                         gt->steering[DSS].ranges =3D xe2lpg_dss_steerin=
g_table;
>>>                         gt->steering[SQIDI_PSMI].ranges =3D xe2lpg_sqid=
i_psmi_steering_table;
>>>                         gt->steering[INSTANCE0].ranges =3D xe2lpg_insta=
nce0_steering_table;
>>>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt=
_types.h
>>>index 8b5f604d7883a..d93faa1eedef8 100644
>>>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>>>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>>>@@ -72,6 +72,21 @@ enum xe_steering_type {
>>>         OADDRM,
>>>         SQIDI_PSMI,
>>>
>>>+        /*
>>>+         * The bspec lists multiple ranges as "PSMI," but the different
>>>+         * ranges with that label have different grpid steering values =
so we
>>>+         * treat them independently in code.  Note that the ranges with=
 grpid=3D0
>>>+         * are included in the INSTANCE0 group above.
>>>+         */
>>>+        PSMI19,
>>>+
>>>+        /*
>>>+         * Although most GAM ranges must be steered to (0,0) and thus u=
se the
>>>+         * INSTANCE0 type farther down, some platforms have special rul=
es
>>>+         * for specific subtypes that require steering to (1,0) instead=
.
>>>+         */
>>>+        GAM1,
>>>+
>>>         /*
>>>          * On some platforms there are multiple types of MCR registers =
that
>>>          * will always return a non-terminated value at instance (0, 0)=
.  We'll
>>>
>>>--
>>>2.51.0
>>>

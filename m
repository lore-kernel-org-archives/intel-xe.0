Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A03C36008
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 09:14:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBE610E682;
	Wed, 26 Mar 2025 09:14:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ke1IjMaA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2345C10E682
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Mar 2025 09:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742980492; x=1774516492;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3z46eYbz40ci3QNwxpUfrSF0GImh6k3q1GM0F5dmxAQ=;
 b=ke1IjMaAaccGo1+9C8/Q5JEho1dezD0LGQjey3QWGoIjFpGsQfV1FOrj
 hfKDUT6lHcRUORUTc2RTX/xy2XRFwEYCog1KC3mJl2ZQJXBadhAkUkzcV
 feBDktS6lh6CeWYaVHUnWvtqjTOiXi8AV17BSf2gtEHXsXipgqEMd32Hd
 hpzs1tlLXt/8mABoBMfJQ+R2V0ttqVlE1zH+2kwAO4wPzWrJ58e4OEISt
 7cGY8TPd1qv/n5K/NNLrKIEgDgoPj/8JXAcwQkUH27NgcA2VWEAF+R6tn
 oWWz3Tn8ge28OldcXIX25K9lfMtb/IDS2yGZcWmjkUWlTCGA3Zvwxn1mO g==;
X-CSE-ConnectionGUID: wmmTbyoNTrelzdeCzevayw==
X-CSE-MsgGUID: H5wevK1pTjW4H91uMh9Rog==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="48133400"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="48133400"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 02:14:51 -0700
X-CSE-ConnectionGUID: GbyAnj/4Sx6kAbvzljAJDQ==
X-CSE-MsgGUID: CCkiw1L8SYuPlolWhI6NtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="161902101"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2025 02:14:52 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Mar 2025 02:14:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 26 Mar 2025 02:14:51 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Mar 2025 02:14:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bxaHACSc2s4umObRLqZBtfL3EYeeBj5yeXW7HSz27Dp3SI6jcxv/XQOee2xnpIQW/3yfjPu9nv+AznMSTUE9HsZBvbpPDbmPHyOs73heVJ5YnNX1kqXSwF+WA4/ivSCNRAXIFaV9RvfbxwXImAD/PYqYkGuAHg0r/c0bPSZpDJ2mKW72cPUMqydIifCWbrTZe/+NmDXJBKBm6NaneWUOo0/VffrF12Pqcmnv+K5XmVK5cxEhfwm5PM5XQhtBn1bIkudYYv+zyHHbJaIRN7Nr2+SCCRhLieFGrPKQCJlibxZRPJRFHAGA2/afF2hnbCz6ixUho1GNm8eDANWuX4RCzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/WRiRBVf+BXJRMq047l9vHTnXXPMi1M8QO9PBu+MEA=;
 b=GgWkTEShMgxMpL3nZm0d3ctlRXdMWFMEw7Y26j3q5yPd32dmr0wd/WPBZFWCU432IOFslpINyBangzm/XNNKheduNm705CW3hDzoh/3OdjwbICe5MHhrAjRplECcmQvokCoEH4PSd6fy/gEXaK3Mx/ZPQZgjtlOqg26rnhxVy6u6/JqWpgbOC24+ubOMcAON5+g3KcES8148PFMNhtCra/jYbQTSChadHnRKj3aB18eBhsSsDU+Jj6F9QImvctAjdQ3Z+oH4ypCyPXMV5DyVscLsOjq3TuwlNbjnxqBdyQjQDdNdsjKnyNfK/hbD54Yt4woIlxPhcSr2RQvWrJjvtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA0PR11MB4766.namprd11.prod.outlook.com (2603:10b6:806:92::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 09:14:47 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 09:14:47 +0000
Message-ID: <53877f81-e3fa-446d-b663-55a3427cef27@intel.com>
Date: Wed, 26 Mar 2025 14:44:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add fault injection for xe_oa_alloc_regs
To: <nakshtra.goyal@intel.com>, <intel-xe@lists.freedesktop.org>,
 <ramadevi.gandi@intel.com>
CC: <francois.dugast@intel.com>
References: <20250227102339.2859726-1-nakshtra.goyal@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250227102339.2859726-1-nakshtra.goyal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0046.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::16) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SA0PR11MB4766:EE_
X-MS-Office365-Filtering-Correlation-Id: ff12ce25-24d9-48e4-9c89-08dd6c46a75a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlpMd25UYjNTNlQ4dFlvV2JVSG5ENjJnUjNrY2V0MDc4WmE2UUhpcUp3QUFP?=
 =?utf-8?B?aDV0SW0vSVowU3pFMkxHU01SckpNdW1acFFYQUZiUU8yYzh2UFRMc2M0a1NV?=
 =?utf-8?B?VDlOSWptYnF3eTJ6VFJIN1BGb2lVL29ELy91VkpiUmFtR3ZVek41RW5JZVQ1?=
 =?utf-8?B?eVA5MFROelFORlg4dERWLzZtb0dRZU96YUNpUGwwQTlwWW9sdVc1MzhQcWt5?=
 =?utf-8?B?WFo5YVFGR1g5c081eGhsTldzcmxpRnU4VjNHYUNRUkZ0YjVQL3ZNeCtIRXdE?=
 =?utf-8?B?UjZjZWEyd3BXZWZPVHRLRFZpc1VleGhzaEtQdEZQZFU2Nkdub0lxUlpXQXl3?=
 =?utf-8?B?VUFIOTdBNEVwbkFBaW5PK0FwWDV0NTVGVXpGd28rbmJ0QloxNm8wTTJqbW5K?=
 =?utf-8?B?ZkV1dXA3N0lPb2tPdmZWY25lMExsVlZrU3FaTittNWlDS1F5bXhEdEtRSUdi?=
 =?utf-8?B?bExiU1VPL0FJdnZkY1Q1YTdyQ3RJOU4ySnowejZtNFBmT1NTcFd5S1phSndO?=
 =?utf-8?B?a3JBZkx2YnIwZEJNRnU3OTU4SHlCUkNjUWw1WnFxRk1kRk1mcksvZEJ0RFZQ?=
 =?utf-8?B?N2l2RndST2dXWnlzNlNXaWxCSEs4UDBLQXdxME1VaCtST1d3eTl2UlczOHNN?=
 =?utf-8?B?eWFGditkdHBTdFMwa0JmTCszVHdVa3NjbUZKc0JrWlY5R2orZGt6c1A2VWM2?=
 =?utf-8?B?bUprYnhTRjFBTnh3NlU2NFNEczJpbzl1blR6b2hSa0UwQ1BZL2VPS0RkY2Fp?=
 =?utf-8?B?U1pVSzhFcHVuSXQ1WVhYRkJKNmRKdG9Hb0pSbEJGcUoveXN1SjZNQmlyQ0dP?=
 =?utf-8?B?aU1vU3JxWTZndnZVWnZrdzdnVHEzbjFCRTR0RFV1ai9oUjZYb2o5R09Pc1dh?=
 =?utf-8?B?cnJsYnd3K2tVMEtvN21CTVZzZ20zSTZydVBQSlJqMDVvR2NJaDROZGs3UGsw?=
 =?utf-8?B?R1J4ZXBmVFMyWXVuSW9vUlIzUEd2WTllaGtYUnpLOW1lQnVnZFlUOVh4VVhL?=
 =?utf-8?B?OVZjdFo3UWNSTi9DdjFzM2wzK0NGajM1M3VCT1B0NjEyYWN2NzRQQk1PMFNy?=
 =?utf-8?B?VXRzYmwyVG5zMG5xTUFKampXVVdtbDI4T1ZjZHFPdkovd3IvT1VzVCtPWko1?=
 =?utf-8?B?K3BVRFhaTDFHQVVsdm5XajRTUTN5UnNYcitreVBkbjJtZUN6Y29qd2p2ZzBV?=
 =?utf-8?B?cldTdnJQRmlTMlI2NkhsM1U2WGZONGMyT1JuNkpnbmdtaWYrQUM1eFpVb1RD?=
 =?utf-8?B?QkNMYXlSb3FweWZ5RTBzSG90MHh3TzdybFdsRWtpSFZZajE5SWRsTUltelND?=
 =?utf-8?B?OHorVC81WGVjcTRFUmY0Ly9ScnBGcVExaDFDeVNmYUErRzIwKzczazJvb25U?=
 =?utf-8?B?NFdIVER1a2FMUElIUkw5Zk9ZTjE2V0pvQStsSkd5QkQ1QlZld3I2TSszeWR2?=
 =?utf-8?B?aU42VktIL2ZDd3Vnempya2Q3eW9hQkVxVUJVdGNMM3BDNC9XVE5tRmZoWUYy?=
 =?utf-8?B?YTBIbXpqbUk2Z0VrNnpVbEExTnF3Y0pveW9oOVlDT1V4ZnBiMUZvc2xLdXlw?=
 =?utf-8?B?aXU4WHl3emIxVVRnZk1iWGdzZC9wNzdDUytqYTUrYTlHL2RUa3BjaEtqeDh5?=
 =?utf-8?B?cTBEbWpSSzVDNFRCVmhsOVc0RDEvRW5uQWhISncvZTZ5RXlWN2ErZ3orSzFY?=
 =?utf-8?B?dlliMjNITktiZ0gxT1I5YVAvT2gzZVNQYmpPM05TNWFOa1YvdDZlVUZOc0ha?=
 =?utf-8?B?TENoenFBcndWN29ZZGwwMmpSMytxclUyT2VOeGRiaitCRjdSMkYrelZkTm5y?=
 =?utf-8?B?SXpWRXpSMnZhSTdnd1d4QjJHcUZ1WUs2SEMvUjlRRDhMV1VNeWhCUUJLeUUx?=
 =?utf-8?B?KzdyWTNDTWI2eklpYVhaY2hmMVZ2Q3d0WE50cW9Mdmg3Zk5maHYxQy81eTFz?=
 =?utf-8?Q?tX3xQEvPmx8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1NGMDJuWkQzVXlxRFBrSVhDZERIVjB4RTZaZTArK29oWVNqbG1FTlg1TDIz?=
 =?utf-8?B?djF6Q0IwMTdLMmZsSEltZWNqek94NzRnMkl5RFVOdFlFZ0xPbkFrTW14c3p3?=
 =?utf-8?B?VS9XbENxZTM4YWxST1pOdWxXZyt3Q2h0MC9zQnhwUFFib0ZkWVF2MmNWeVpS?=
 =?utf-8?B?Nm8vbkduMkI5cHN6WUNiak8zWHEyaWxUeE4ydFBIMlJLWEtwdll3bU5CVjJG?=
 =?utf-8?B?VGhnSmpqbHRwLytCZ3ErSHFUVEZNeEtyaUQrRFRyT1ZWWitsVU16RW9GVTZt?=
 =?utf-8?B?YnhXdG1jc2NvNEducTh5bVo2blpHOWJtTEVqZGpURFdQSmRyS2Jla3RSV203?=
 =?utf-8?B?REpOZ3lNY2tvZXUwVkpib2swaTExUjVuYmFjcW5NT0xHR1U3cXJrcnlzaVkv?=
 =?utf-8?B?dytmY2RHb3VSc2JUQ2RXRnpLOHpNMmpGbURWejIyRHlHa21ROXBGTUJWOGdD?=
 =?utf-8?B?dzdIUVV0UGtvUGZFTkNMc05GQk1BZ28xTzlMMXNTUTE3N0taQ0NDMWpZaTYr?=
 =?utf-8?B?N2IvOXMwR1ByRlpYVjFtYy9XeHpJSU5kR1BSTjdzQ1hxWVJ6bmFKZzE0SFpJ?=
 =?utf-8?B?N2czKzJmc3JDZFZUYXlsVkg1VXdnL3N1TDkwUFhlYUZzc3FDU0NHazhzR0NN?=
 =?utf-8?B?NUIrRkVOMi9zZkpGNWdaZFlab0ZsZEQ4NU1sSHZHcGo3aXJKTnJIaFgvZ09E?=
 =?utf-8?B?Uk1Tem1tS0Q1cXd4TmE2WEd0QjU3T0Y1cUVsSmIwbGZkK0xrdUVFYWU4cnFV?=
 =?utf-8?B?YzlJRmxLSUIzU2U5WmpkcEdHVHNkU3EwM1g3ZGJidVBjdzk3VUFNc0s1WS9U?=
 =?utf-8?B?aHJKRXVVNERGVUZLMmdIK2FnL3cvVzR5TDYwaWdFRHpXVW5lTzNKNWtZMVN0?=
 =?utf-8?B?OUdzQTNvRHdZdXg1WXlqWDRhTGtQN0x4eXBqQmt5U2pWRElmdlhjcjhPTC9D?=
 =?utf-8?B?RHJhRjhKQmdSQmZnT3k1U2NnNmNyd2JFQkVYMGcwNVNPMEZobGw0TEJkNUF2?=
 =?utf-8?B?b21pd3A2OGVVYndrVWJacDlYdDVhWEsrZ2dncmsrMDBJaVZGK3NBNzF3RzFt?=
 =?utf-8?B?TDZDNmlFZFpSdVJtMm56a1Axa0hOSFNkM1I5c0R1TXcvcTlPUEdWUnFJdjhx?=
 =?utf-8?B?Ykl0cUdwSFJxOGhNb3FqTE1lbURTeG5OWVE2UUE3K2I0a3owQldPbG5WWEww?=
 =?utf-8?B?L1BXUU9lbmV5TVZZb0l1SThPZFFyYUVSOWQ2WVNjU1ZBTmRjK1JTS2Ryamg1?=
 =?utf-8?B?RHc4VythMTZXVUQ4TDJZMkpWdDdUZDJrc3ZRNG03RU0vRVJtVHNZK2N4QlJG?=
 =?utf-8?B?bEdMOTZQL2xmYWpVS1B5aStHdDg0anljY0xuSHBnTTgxNTl6V0VkTk1JcFNL?=
 =?utf-8?B?VDdxTjh4dTA5TVBFbklkU3VzVU1ZTlJsSUI2d3ZsYU1pN01kU2F1Z3ppTWhi?=
 =?utf-8?B?elk4MWEyQU9uNlhNakNCR2tURnNtZ3E5aVJ0a0pza3BVY2ZYN25yK3dxM1hL?=
 =?utf-8?B?dURQNzdLNncrK0tCR09RWFYvcHZBSmthMEFsL01waXFDRytYeGNGSlZ4eERz?=
 =?utf-8?B?VW1kNWVDOVpQcEdHNVFsZXdiUUdhYktxTmFrclRiMnpJMWI4M0laazVXdFBU?=
 =?utf-8?B?WHNVRGMyNEpHSUZVOHQzS2xDRGs1eXdncVl5MVRZQzVxdUdnbXkwUUxaemNs?=
 =?utf-8?B?QkVTMmJ4L3lUMUIvYmcwbjhaQTlBcGVPWmNJSVRaUUhQbzZMalZDdzRReXU5?=
 =?utf-8?B?YjNiRmRTRUZFZW8wNWp5dzlZeGNKZG1kaGZvamVkK1pRTmZFaHl4elcvK2Nh?=
 =?utf-8?B?NWV1aWFGTmhwQitGWS93SVIvQnJYR3dZWmJINlNYTG9hSEdJc2VUM3o0TVcv?=
 =?utf-8?B?cEhmYVZNWERqY2J2amFpR3RPVnV6b0ZpTWN3RS9Ia0ltOTIwTXo0bnc0OWlX?=
 =?utf-8?B?WHFyTXo3UGphUmQ4bU1wbFJ4azNGZFFGcTVWSlgybWhTbUJadk1jQXZ4aFZj?=
 =?utf-8?B?aFc4Q3hYMEo4MXNOd0E3SWtucUUvbTEzdTVqdGxmWHdTaFNIMHdCNzlSbXd3?=
 =?utf-8?B?T3JWR2FOMXp3alNYS2I1SDh6d21OaEx4TEFwZnpVRENCZEZvSy9CS1JxYzhh?=
 =?utf-8?B?SW42THZwdFgvSXFocnpHdjlEQ1VETmpla252ZjNQSzRocWI1Rjl1NTQ3UW5E?=
 =?utf-8?Q?7B2QBkHAvelPKSXTpobiJVU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff12ce25-24d9-48e4-9c89-08dd6c46a75a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 09:14:47.0781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N8gmUmXOJcAjmuCcG0OWLKsKU9WozhozuQSDI5y2sThzW6QlR6+dYcGDP+Ejw4JLKyB8Z7F5h/YTr8fyVT0vXE9evoS8MhrZ2VpSZImVUFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4766
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



On 27-02-2025 15:53, nakshtra.goyal@intel.com wrote:
> From: Nakshtra Goyal <nakshtra.goyal@intel.com>
> 
> Add fault injection for xe_oa_alloc_regs to allow it to fail while
> executing xe_oa_add_config_ioctl().
> This need to be added as it cannot be reached by injecting error through
> IOCTL arguments.
> 
> Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_oa.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index d89e6cabf5a5..b8704360f998 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -2231,6 +2231,7 @@ xe_oa_alloc_regs(struct xe_oa *oa, bool (*is_valid)(struct xe_oa *oa, u32 addr),
>   	kfree(oa_regs);
>   	return ERR_PTR(err);
>   }
> +ALLOW_ERROR_INJECTION(xe_oa_alloc_regs, ERRNO);
>   
>   static ssize_t show_dynamic_id(struct kobject *kobj,
>   			       struct kobj_attribute *attr,


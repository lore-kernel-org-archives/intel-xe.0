Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1CFD116F1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 16:52:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5279A10E42F;
	Mon,  1 Dec 2025 16:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j0+Gqzdj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021BF10E420
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 16:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764607934; x=1796143934;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YDWQj0IzJDQXJjSe13PtsnZMsbho2j0+2ucCZgRCbl0=;
 b=j0+Gqzdje8omDFaQEMphUwUKYD+63Uk93bge6NYRNHj9BEcvKEoQEi0t
 pdYMJn3oAGwKVdW16NlABEUXlDl+w5GbK+PKSx25G+e1Ge3q5x2v+WlEw
 c5qtJf2cLxio5TJJZWkBRN/9VaMyUAfUJgHej0pujvE/q97N5JvORy6ND
 IJ/KrID2xg+Q2WWnHyU7GPLJbEVMI1kZezV5Sc98KF5YzWDQwCjokWtGQ
 xKPvP/upjsSWtNuJcwY1TeTt+TKMlcz1lDaNAq1WYNaVqs6GdmMKPI1b3
 iCrbqJr0z5nUKszF7Ua8uBgcRBL2nByERHrWGQ1ajRc00iWTgKAYgaZpT A==;
X-CSE-ConnectionGUID: 4ApzRP87QEifrswAxxo40g==
X-CSE-MsgGUID: WWv8oOBQSZS871y/q1hPfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="69148029"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="69148029"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 08:52:14 -0800
X-CSE-ConnectionGUID: TQbQ2VxwQSmOvuYPHdhWAQ==
X-CSE-MsgGUID: JgX4JJX7SlWvV3FGjwiTFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="193777137"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 08:52:13 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 08:52:13 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 08:52:13 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 08:52:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hmn/lmG0Q1Tm0AF8L3xCn8kpr2mulHoDWyy/H0NhBFuRY2X1PbegyVHsiBhrOI4VZArBR16dJcvrxQ0hWbEBp1C90H58JQPiaMpNP3Cefx/9VMQZgdnxvpMEpl/PvN416Zmi1GlIKtgU1J96mRxjmGmPq+WwEFuGuCZH93QnzA0zTolSduOnj6QU5T7CcYQ7D75z6IaVaiMN2GY552oUzh+nkQK6NNiRg2J0inCY6Ct841TGLUmMva5FSEJA+Xc65VI2JiJPrRNCoq8irJU024re/MSwgn3e8v1Hwq7LelDrJZ7mpSeSGlBZRSpVU7Uwr5S+N8kkcRr7asOxLSt+2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HikzxTA1Do3T0/L5LWaz9WIxoW03PshJ7MWufYiD3Us=;
 b=fm18zYjmEZBm179l1OIeQBoYeEFq7ssE4jWOVQFoDgcpSP8MhZc/xizB9mVj2dQKhFG/2bjI3MylHGNefvw/nomVf3/eEnvSlAnHc6BhTtl/x3Gdv5MCb0ujqtlJz0GhIf2eSByPxv3+cBGEBC+G7L8QoYiP4ZTbUJc5+bGat1GFkV0t6lBwYMZ26VzAPIfKnarIV5wDo1sqOxApwjVhcobNIxwXjnbQimK1WVyrQwz002/cCND1VcXkH9V0RpOCHtlOSauJFE1/OEJU9itv4BM0xpVvd54lkpUILzXzvrBbBj23AaR1k9yuHhH8PFhV4NSw0iyBClL7HKcS/CTm9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH3PPFB9A266170.namprd11.prod.outlook.com (2603:10b6:518:1::d45)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 16:52:11 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 16:52:11 +0000
Message-ID: <39556226-b50d-43ab-9fa1-612cabac8d2a@intel.com>
Date: Mon, 1 Dec 2025 17:52:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] drm/xe/gt: Add engine masks for each class
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
 <20251127014507.2323746-13-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251127014507.2323746-13-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0058.eurprd03.prod.outlook.com
 (2603:10a6:803:118::47) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH3PPFB9A266170:EE_
X-MS-Office365-Filtering-Correlation-Id: 56d4e3be-b2c2-438f-9bb3-08de30f9f886
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnFVSUYzeWt1YzlHRFZIeDBzRTRtajM5STFoVVltNUduQXE3MHh0Z0hjRks2?=
 =?utf-8?B?alU1eDFvU3Ewb2V0YUJObWE0Z3E4MFA5TnhlUDBhcHkyQk1XQTgvb1JwNnhs?=
 =?utf-8?B?bjJJQlROb2NBR2ZtWU1XcEdnc1htd2ZlVlNjQlZFR1Bvamw0WTNSUUhBUlJF?=
 =?utf-8?B?QkFqTmFOR0lXZHpLREdjcXJUT2tUcVdML3FRSXQrZWR0Zlg1ektNVW9NNnYz?=
 =?utf-8?B?d0Z3bE1XcEExUkVBUXVCZ0loME1OZEtuUllOekl5RHdmVGRIcU5vQ1lzcFpm?=
 =?utf-8?B?eVpXeENpSVhUdHI3ZWRUdXNVdnh1bXAwSDFIUzBzSThNMUlUSnRhRFBlVWNB?=
 =?utf-8?B?cTA2UEtBV25PVkVOcWtYbDEwOGtQeDVndnZpZkR6Q1lSZ0JxN2tRcWZyVXVn?=
 =?utf-8?B?djlRV255VW4vOUpXUmRVWi9XQ0V0Lzk2WmxZdlVvNGYxTGhGNDFxNFZRSThN?=
 =?utf-8?B?UWovQUkzRnlKRjhyd3VFOXFERmpYREk1TjVLVi9qL0JWWnFGeGY0NE0zeEY4?=
 =?utf-8?B?SXFBaE92djRUMThGUVJqeDUzNnQzdTNtNXBvNzl6UEU2TlFaVVltb1hzNGF2?=
 =?utf-8?B?L3dzV3pweDV5ZVNYcWdLbE5leUtMNlc0LzFiQVVaUm1ZV2Y4U2FSWGpqQ2dK?=
 =?utf-8?B?bzZqVjY2WjFwdXUycTQyVms2OEJ4TUE2QStkOVhOUjZGNDlJcy9ISUxubzlq?=
 =?utf-8?B?azJhNG91VjdabTNkTlFXK2daNndhMjhWdHdwWmsvOE9PNFErd3lDNG03VFpZ?=
 =?utf-8?B?RHZSK29ZT3luRGlOWTFublh1WlBHZ2FNNEZOaC90WlVLQzUvbklTdUMxS1kz?=
 =?utf-8?B?aWRJdFZGajlvbzZWSEpsWWZITWN0WmFLdStHZEdTUE5BNEg0RjlZVHlkSVJ5?=
 =?utf-8?B?YjdiVlZFeVFMVXI0Z1R5ZWR0TndQNEhjQ1NNVndOcHM5SzhyeXJjaVJhd1ZO?=
 =?utf-8?B?Vi9LU0N2WUlxS054UHBhV0FjWDRva3d3MWpqaXFxNk9Ma3RxNVR6Rm9BZ3BO?=
 =?utf-8?B?eWRsQ09vUzkraUN1Z1RtMXpkdWdNTC9CY0RMbE9rdFpSekdQVFlkRWg1Zmp1?=
 =?utf-8?B?OEMrYW9XVksrbzVTSm9hWEtrcGRGem5hY1NzbUhybDZ0L0VpNVN3RUVQQitT?=
 =?utf-8?B?SmhCdVNFRXRkQVc1VmtrZ1ovZCtjRlVDQ3BXOGxHQmk2d2pvSUdmMDVvVUZO?=
 =?utf-8?B?b0ZDR2tGcjdIQWpEcFpEUk55bSsyN2FXeEJ2RjVmeXhuOWlsVndIR3pueG9H?=
 =?utf-8?B?OWNsU3J0T0tyeDc2REZOT2xUVzFyYmFTT2RFT3pTMEI3YnFFUEhUcUxKcito?=
 =?utf-8?B?VEZNWnNMM0d1WEhwQU9rN1dqM0NwV3BXUGh5L3lWQTVHemt2eTF4QUppMkZP?=
 =?utf-8?B?dVdlYy9TdC9qRGJXWGVyWkJVbFkzREdFWkI4b2lIOGZ4TUhmeTFRT1J1eERs?=
 =?utf-8?B?T3h6aElFSUowUThoVnRiQ3pZSUw2QXoxUTQyTkFYUlV3M2xyMHk5UmFzTjUr?=
 =?utf-8?B?WEwyM25XRlhFcUtXNmNqN2M5S0ltZ1puTHR5UkVTdCtIZnBFRmUxY3NBREtP?=
 =?utf-8?B?L3RRNmFYY0Q4QVVNZzdqckN0NE1UaHAwUjdqRjRudFJEUGdma3lncTFtT2pq?=
 =?utf-8?B?MjhERGNzQ1QwUkM5VG9pYmxTQTh4bUdYZTUzUk1RODlqWEVlQ3NsR2duaG1v?=
 =?utf-8?B?cXBsTVZPTnRrU1RKR00za2hoUy9VdFVSMG9scm1WeGpPQXpGSng1K05nQVQx?=
 =?utf-8?B?dDJUOHJqYlJsK0NETTRmOFVKWmlyTTFqVDhNRVNnbnQ1RG1KSVBLckNGbVVx?=
 =?utf-8?B?bjYyQ3M3eUp5dUdzSG5QcWdGdkhkS29QeHIyWkpRcFo0dlV0blZ5eTllRGk4?=
 =?utf-8?B?RVFtckVIQmJUTDdhZHJ5Wk9tSVBjRVNXQkdCbUFkTjZXK3hIbU0vK1JQcW5z?=
 =?utf-8?Q?FFKDLw0cDtBKSLun0k9HJYdE15cKPaX7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnFNdWVZOVhLVHJHeDlZcmxiTzdhUXdxeWJkRGJvOWsvWTJGRVlVZWRVMllj?=
 =?utf-8?B?cWEybGVYU3MxUStQbEtOY1Y4ckhQZ2ZPK1B5RTBpYk9HUGlkL3ZPUElXL0gy?=
 =?utf-8?B?WEM0bWpoN24wQnl3eXpuMVlyZ0YwVXBGaXRDWDJEWmxzQjBvRGpEN1RjKzlS?=
 =?utf-8?B?K1hXbXpEeUVnUHUvLzVNZ0FJUmh1N0Y0M1A3a0d0MmtLMWFQSHVvb3BBR3M5?=
 =?utf-8?B?NVlCUlViL3pzcTd4UWovblVhVU0zQ2REZFNjUWNWTDhkZ3ZrYzAvNzBYUlQ4?=
 =?utf-8?B?cXRSV1JmTC9FZ1dLbTVhWXdiOGlUYW55OVY0ZWJ6SWJlRXgrY0U0amlobXFN?=
 =?utf-8?B?cUoxbXF6RDduSXU5dTVPemUxZm1KNEhoNlF0WkZoSFovQi9VUlhZVFFjNWJz?=
 =?utf-8?B?VjVud2tYRHN6ZzBtZnQ4c29pOXd6NDBKUmFtdm5FajJvUHVFU0FjbFZKODRL?=
 =?utf-8?B?UHVqZ00yQlFKN29LUG1ROVZybHp0NE1kbkRrOG9SbStEQTlvRnJTajNqL3Z6?=
 =?utf-8?B?VnhLeTBzMHFNdGdlc3RQbWxzUjV2alJodmk3ZnJhTWhJQURVTGJSeG0yRGdI?=
 =?utf-8?B?amF6WGhEQzdubEdlcnpWSVJIdWxFZE44L216T0JwN2wvUG15TU5yeHJDYWtH?=
 =?utf-8?B?cUF1Qm4rUlRsNlhFNjBIcXNKbmFiaHBJYUtsTUwwZkoyT0RKdEF3N0djY1Jn?=
 =?utf-8?B?SXhhNkJWRGtsTEtzZEw2cmZ0b2h4TGpxZVJDMFVDWGJ6RVVEcFRNT2UwaENn?=
 =?utf-8?B?aXZFVUZwSlpmOG1BWmtTQUM4ZitYaDR6YWd3UFdIZExNdE1DS2NLTWlvQzNp?=
 =?utf-8?B?dTdSYVYxMzByTWJ1elZLbVpqL2NwK2hjRFU0YlFIUW85YTNzMHhiTWpJdE9E?=
 =?utf-8?B?N2hjUjNSc1dDYmZTcGd0RnVhMHR0L054YTVZWkZQUXYrcGc5aVBEd0ZLenM2?=
 =?utf-8?B?b2pzMElPWllWN1p1Y2VmaGhtWWVhUm02ejJ3RXJZQUlJNTNCWEEwYzJ0ekpk?=
 =?utf-8?B?SUdQSXU1NE5Rdzd6YWFmUFZ0TW0xWVNOT1VpNVVTTk1NSXJGQlhFZEs2elly?=
 =?utf-8?B?Nk8yWDc3T0xJS3IwTnE2ZlBvTlpPdzVVdlpXOVlyY0oyOWJDNVJsQ3VTbUhR?=
 =?utf-8?B?UDF4bnhNNDRlQzlSSnVqTnJlZmhJeWwrczFydUhUdWR5YzhabFlyREdXY29o?=
 =?utf-8?B?bkF3UG8vQWUvZ1puMEhzc3EzWUtmcmNTbDBISDkwblFGWjFWc2c4aCtZS2tI?=
 =?utf-8?B?NmhRZ2g4US83VG1vaWtrSWkwajRDbTlObmpVR25JN0NLR29Sa25hTFFjMzZY?=
 =?utf-8?B?aGJtUTAvVDN3dms5VzBsUVZ0RlVPREY4TEJYWkVBeDg4UkFJWlhYS0N1WCtQ?=
 =?utf-8?B?ZHJHQml2bTVFNWlFMEtwZGZMMytPMFJUNCtLUnB1SDQ5MkNMN3dKaHY3c2t4?=
 =?utf-8?B?ekNWZnZ4VTFkb3FkRkp6dGRhNldVVjhXcy8yMFZER2RJdnRjUlk4UVdyOFNr?=
 =?utf-8?B?MkxLMHlSVGYvbjZnekE4T2M2VzhxN0dsckFzU0tzTzRWbjRNeXQ5MCtycFR3?=
 =?utf-8?B?T2VrU2NvRzhvSXRjTUx0aVh3MC8vTC8rS2E3bmZiaWpldWc5VGNlUmxYc2I5?=
 =?utf-8?B?SC80ODFmMDI4ek1GRWozdlRVWnIyV0VRY2hSSHllczA4dEF2MlN6WjFoUytI?=
 =?utf-8?B?M1VpODJ2eEFIVTBaRWhHNzNWTkh5YjVTSGdCbjUzME1oWHRLdlN1UVRZdkJO?=
 =?utf-8?B?SUVESys3L2g3d0VOSWk5eFBvOFU2Z00vV3RUZ3E3ZGQ4VjZiaVlSUEZOaUZr?=
 =?utf-8?B?QjBlSkpET1M1R2tRMGszRU9lSHRTdGtQL1B6R1hjQUlIOWVydVZySUM5eTVt?=
 =?utf-8?B?dndDdVdIOWY3RFdnUWlvSmljd0lxNVVSY2Z3aks1L2I4dWovNVBIN1c1MktW?=
 =?utf-8?B?bEw1M21DRGc0SUdiMlJhTFRBZFlRNC9zQXZMcDJEZEV2OFg3dEl4LzhXb0dO?=
 =?utf-8?B?b1NYaFg5MFVsMVFYeU5TMFBiMFcyOWV0eXcyV3p4S2h4bGYwUmlqL2crL1pS?=
 =?utf-8?B?eWZlNngwUEJsT1lseDlPek5YNEpZSWw4RGxDdHpmTGJ5ZHNmaC9SekxXTEl5?=
 =?utf-8?B?TGkrMU9jbDk1Z3Z2bDFWdS95bUkxdTd5aXl1c0I2UkZxa1YzYkhQWXRzOVV3?=
 =?utf-8?B?a3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d4e3be-b2c2-438f-9bb3-08de30f9f886
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 16:52:11.2229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t0olhQETxqSTxDFE40mjZBIiq0DjFCj1P5Z8GJjcTvBBtQP0ZFwfgw3uz2JqP1bIFi07Zbl7w7uRq4ff+u1FocOnQBg1Ocfhd8703MI38Vg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFB9A266170
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



On 11/27/2025 2:45 AM, Daniele Ceraolo Spurio wrote:
> Follow up patches will need the engine masks for VCS and VECS engines.
> Since we already have a macro for the CCS engines, just extend the same
> approach to all classes.

but the problem is that this existing macro is already little confusing as we have:

	XE_HW_ENGINE_CCS_MASK
and
	CCS_MASK

where only former is a real engine mask, while latter is not masking anything

maybe we should rename the CCS_MASK to

	CCS_INSTANCES

and then extend that naming to

	RCS_INSTANCES
	VCS_INSTANCES
	...


> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.h | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 9d710049da45..e70789dfac6e 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -20,7 +20,14 @@
>  		for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \
>  			  xe_hw_engine_is_valid((hwe__)))
>  
> -#define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
> +#define __ENGINE_CLASS_MASK(gt, name) \
> +	(((gt)->info.engine_mask & XE_HW_ENGINE_##name##_MASK) >> XE_HW_ENGINE_##name##0)
> +
> +#define RCS_MASK(gt) __ENGINE_CLASS_MASK(gt, RCS)
> +#define VCS_MASK(gt) __ENGINE_CLASS_MASK(gt, VCS)
> +#define VECS_MASK(gt) __ENGINE_CLASS_MASK(gt, VECS)
> +#define CCS_MASK(gt) __ENGINE_CLASS_MASK(gt, CCS)
> +#define GSCCS_MASK(gt) __ENGINE_CLASS_MASK(gt, GSCCS)
>  
>  #define GT_VER(gt) ({ \
>  	typeof(gt) gt_ = (gt); \


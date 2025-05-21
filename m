Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26899C54E65
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 20:41:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB2DC10E038;
	Wed, 21 May 2025 20:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TAkZOpCX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66AC610E038
 for <intel-xe@lists.freedesktop.org>; Wed, 21 May 2025 20:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747860065; x=1779396065;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ejlvNaNxSDSEJ+2HMXvbnh2rmvc/WolrqDgH/iDOCMs=;
 b=TAkZOpCXf5MkDaabSMPRi7PK2GiI7g/vntaK83KMs0M1Hch6qN3TRGyW
 aFhDrlvy9sGJBLSdnIijPDG2E+AMMKi+48K3CC+s0W6niTDXh+v0f336o
 NwhaYH9pIxkz8uGPyIOTP2w7fdFadH4gh95/I/WqErc5qGLbxOipu1nOn
 2m5zjMIWA04Wh+L275bGkdFFimvC6QWQs9xGLcS0wnuiTXU1XT8ozSxW5
 LDd/aeHzpzkum8OyFxaqjWOQiXqYY25eKUMelQltkYjIsXvkQZzjKuws2
 k837pgG7dQjy/J3bR2xLCge1NU7MkxS7xexxoi3KXjw+oumiRnW9lUBK8 g==;
X-CSE-ConnectionGUID: DPxGUDS/QPmeLdBP2UJBpQ==
X-CSE-MsgGUID: FMwYLm9kRbG5FKqcqdItaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="37478194"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="37478194"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 13:41:04 -0700
X-CSE-ConnectionGUID: 1E+EVHN9S92a6fiW5kyUvA==
X-CSE-MsgGUID: CQYW0xcTT6yI1R3hnDRnCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="140767502"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 13:41:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 13:41:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 13:41:04 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 13:41:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QnOM7rNCclvzV/ZRpuk7rL5u/Suj1VpKrFGTXWNfHniAFy9QqySTpb6mkzWl3uv7feutTLXUqv9Fq7hmsTITJxpXO1KaktRIIKi08FEJg3bjBQN4MezAN1GiPDY7EmRE6hyFriirvlY+Qu299Wj6eYNyLuYkbxrzMZ4uMOcangRZRTwGFPw3n72WWXHwxtb/kn6f4ecXDPM+K/g2TZtGqL1Dcx1XMLQvVeGDy0Vl5p3PKWMkubBtqaKfndZajO2u+KB5JpRmkPrAoMsJhshIf9YBEMw+2CEqzdN5tDNU9z5der1zpQ8MG1DRquWZiR1CJ555NGl4+qC/1816TlFw2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rhRopBFSYcRQdf9/az6sYlXIfasgUZ3YIuvqOEF4JQ=;
 b=LJjy7DwTDBAzRc+IRgepqRP/7MTDFjGCR1yPRQEbgX7rAAhPlQFqoKy+OsOyP4P1BaVFoy2ldbN3Xn9tO+DDQxFRViCU9Z3vk0CIzITVup9zYpOCC/ZM/gxu5CgojQAuMlSs05GV1kbSSpCCZmCW8WrahioMBCH+TpGqHruDzaaxz03aNcZ9yhmqt5ZU9dOsXPJJFgM5EPFAzMgvgYbHBC7ZNW6Y3HskwgRz97UzGmVnwLM0hbkRJZloPV3+WCtOBxm7M24p2rq9SdX+te7z3MplaGueXTS6BdlpXiBfERAXObpVoCd3qw0BhPGhHTI54p9i/vp5wJmtyMOBHCyOrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM4PR11MB6067.namprd11.prod.outlook.com (2603:10b6:8:63::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 20:40:47 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%7]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 20:40:47 +0000
Message-ID: <5e392259-5efa-4e1b-8a9b-e4c50906bd02@intel.com>
Date: Wed, 21 May 2025 13:40:44 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/pxp: Clarify PXP queue creation behavior if
 PXP is not ready
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
References: <20250519233228.3754667-5-daniele.ceraolospurio@intel.com>
 <20250519233228.3754667-7-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250519233228.3754667-7-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0090.namprd03.prod.outlook.com
 (2603:10b6:303:b6::35) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM4PR11MB6067:EE_
X-MS-Office365-Filtering-Correlation-Id: 19ca5548-7aaf-4c71-c712-08dd98a7c3e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VHR2NHRFVWhuWlpEL3VDR2xtaHk5ZUpKQ016clFDQWFZa1BNeHowc2NmR3Bx?=
 =?utf-8?B?cXlVYjQxekR4ZXN4Rld0a00rSkpMNkZBcWJtVkEyTjJVUDBlbHZEVVFKVjZN?=
 =?utf-8?B?S1QvS3VZM1NsZ1pySUU4RE9CWk40QUdSNE1ZOXJHcExpdmhFVjNmTHdhUTln?=
 =?utf-8?B?YXVFTEcrZGwwekpXQnlpNWlaV0FqeDRlNVUzOXorV2p0M0FzS252Wmd0Zms5?=
 =?utf-8?B?VkFta25HcDRhZjluWndSbnV3bGhXaDh3Ui9jUjFKL0NiUC9mWW9DWXBTSmhR?=
 =?utf-8?B?c3Y1N3dpNTBXcVFLNDVRdCtRM0N4NmZZUEkxNS9ScjBKa014c2FKSFgyNEFF?=
 =?utf-8?B?NnhBOUZLSlMxQUlCYU1icTBDOGt5Q2dvNloyZ3JHZVE0MkZMS2U1aG00blo0?=
 =?utf-8?B?Ylg1MGptczJYSGZ2V044MUduLzVNb1ZPazdPUkFNNytidXBMNy9CelpWR0dW?=
 =?utf-8?B?aVozQTlEc1V2UC83VXN6MnE5cnVGOCtSUVR5eWQ0V3FMaGxkZURvRXZENU84?=
 =?utf-8?B?RVpWMU5UOU5YVS9GUUQybG5uRW5QN0VyQjlZRkR1eGs4VEppcStmZHBpM0JH?=
 =?utf-8?B?RzE4SFZ1L0FCM2h0dEhNMi9qUGU0b2hVUWNlM29KNmVCUktLOHBmWEpEVU1i?=
 =?utf-8?B?QzFmbTI3MjBRSWhoaTAvdkIvS0FrUXM0QXcvbFRPTlFtMVp3QWZpamZhQ2JU?=
 =?utf-8?B?dm9ZYzZCVC96TFlXWGwyWFBDay9oV3FmYUNvdVNHU0xteVFuNGdZaUIxY0pB?=
 =?utf-8?B?SlNQNndZS1FNTDJkT0NCYXB5ZDlxOHFqVjR3eUJBblBXSENZb29RUnZ3OERs?=
 =?utf-8?B?UkhRc1ljMDFiay9JOFhsSmhYbzdDTzFHeG5rSWhPdTRTU1RXdzJMbWQzd0E5?=
 =?utf-8?B?K2NQak5LUmNZcTh5ZUNNcnJNenpJV3dTakRIM3dKdnVFZnU0YTI5c1NKMSts?=
 =?utf-8?B?Tk1vWTg4N3JlRm13c1VtWWJqTkwwejZhdG9yVHVYM1ZpY1VReTcrTFpGSFpm?=
 =?utf-8?B?MHoyM0tQNXNjMjlkeWd0Q3h5ZnpweDJZSXptR0JJdGt0WEJpVUtIOGN3VENL?=
 =?utf-8?B?b2pOWEVUSkJWUDFKSkdubldyZVhzN1ZpajlHaWpXOTdyLzBGRU1Ic3NhNjN1?=
 =?utf-8?B?SGJmcjF5YVVFRG41cmpWQVZHK2QrVk5EYWdDUjJ2MkNQdnJYWC9tTU9Mckdh?=
 =?utf-8?B?RWRuV3FNOUtkRnN5MlJzMU1IMmR3dDhDVitaQjc0RExwVGE5ZkNzVENrc3hX?=
 =?utf-8?B?QXZhZjVXVEx6L2dXZ0Y2QkNpbzVvNHR1U1RGMWxMTExObzNwNDBNRlZhWjE0?=
 =?utf-8?B?Q3h4dEQxWU54T3ZyR1M0TndiVHZkNUl2am9RbW1ydER2NU1JdUNjdFFyd3Qz?=
 =?utf-8?B?dzArMWhZSkJTRXhoTzdyWFJTeHA5QzRKcUdoTXBiQVg5cXRma0pRUjU4bmtr?=
 =?utf-8?B?S2xlNTY4MFlCWGQ3TnVsYTIvSTNXTE5YelY4OGZKalYxVkFzRG9QcmxFOTFp?=
 =?utf-8?B?M1dacW1nbGltRFJ4QzB5TkVYWUFEZGROdE1XakxvOUR6YkQ4S3A0SUdVekp5?=
 =?utf-8?B?RjlQbDFkZ2JnalR3aHpjWlhzN3BXOC9QQjJJMFF4Vk9KM3EwRmZVMzBOUlBR?=
 =?utf-8?B?eGs2Y1BzRGtydzQwaW44RTNYL2YvN0YwQjVZMldnYWVaUlF3QUpjcUpaNGdw?=
 =?utf-8?B?TWtqbEZtUU4wRktUWVVUZElKakpRL0h3NDRCOHhOTUd3cmtXUGR2TEJkWUYv?=
 =?utf-8?B?dEdzRnJmTG9rVTZPQTFScEZGSkxxcHpaZFdsMDJkUUIzUXBXdDVEWVA2K1hJ?=
 =?utf-8?B?bmtaUXRva281YXRwZGF6YjNIMitZNjZZWmVFK1RCTStWcjFkYWpEejdrWjAr?=
 =?utf-8?B?cTBQMWR2K2J4UWRJTnJReVNpSWVNamRmUlpFaUZUL3dsY1pZMGM3ZFI2L2xJ?=
 =?utf-8?Q?5mw//u7Iv2I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0hsWWNNUnpzT1JlS3N5aUdVUUFaeXdoNmYya01xOG1GdXFPc0taQ3M1b01h?=
 =?utf-8?B?NTNKL0VPbkN0aTByTElndnVqNnRlSVZDdzdaV3pkbXFtdzU0Vjk5bzBOQ01Z?=
 =?utf-8?B?bkIxQ3BQVTUzV0dScnluOER0eVZ5dkZBemd4cmhYMmRUbWxwcEh5bFE0cjBE?=
 =?utf-8?B?NkJMb3UvZ3FvUkphWlpJT3dlaUgzUFJtdGUwUlRybUdRQldXRDVPdm9vcEcy?=
 =?utf-8?B?MEdrVEhwL2FCd0ErZC9OYjExMU9YS1c4RWJwNmZEUUFWUlBMTzVHSlQyK2VW?=
 =?utf-8?B?QmNHaXJzYU05OWozTmR6MTVTOWlIMjhpRXh4Z0xGcmxkcDd6Ym9jSExVQ3RS?=
 =?utf-8?B?am1RREZpdjlWYjhVMHFhTHJjUUlEMG5JQ3JDV2tCMmRWSEllR3NrdnNMRnAz?=
 =?utf-8?B?ZmNXVjJob0o3OXFVSnFteHFqaTdUMzE3cGtocHphTVhtWTFnc0ttbEtqcWht?=
 =?utf-8?B?dFFHVEZoWDMzUHBxVTcyQUxoMXV2VlZqS0RBdHZ2TVVEOHkxd0tvalk2cXg0?=
 =?utf-8?B?MEhuWUFLT0FNazF5cVlXZnBUa3RITUVuZytPcWkvdzNKcjlmcDNjamp4Qlly?=
 =?utf-8?B?L1dTaG04MmxPVDdZSi8veW44cnV1VkdiTzJLY2RDbEtTQnNWaDIyV1dpdXdo?=
 =?utf-8?B?a3hhT1pyY1ZoclBuOXZzOE5NRFJFeXBrL2NpWGNrSXFwVTJNM3Zmc013bExF?=
 =?utf-8?B?OWNWdWl4Nlg3ZzNUOThrS0tMczVQQ2tYTnpydlk4ZEVOWEtvb3V2SWkzb2xT?=
 =?utf-8?B?RmE3aGQvTVBjT3B6aWRwT3ZhdzlqY3l3QmhjbnZvd1Nkakh5NUZTbFlCNC9i?=
 =?utf-8?B?aDlyV1NBeGVxaFgwWVJ6MVoyeWJlblEveElxY0hXL0ltcEhOeC9haC9vVFhs?=
 =?utf-8?B?amYraHNGMGZGZnhhTE1OUGNwZG53SnlIZk9NYmdvRG1lb1M0RkdMd2kva2NX?=
 =?utf-8?B?ZHJIekpSbkJ2Rm9iMW1DMWxuR2Q3aTRKczhkV2VWSDBWZ1hmb3JUenVnSVdy?=
 =?utf-8?B?ZTRWazB2aTAwSDdjYkpXai9GTWVuc2tlOEZPR0FrMlIrSlh6NVh3RklPZjl0?=
 =?utf-8?B?eVZzNEV0ZTVsUDJxMTBtTXZLbE9jeTlyZENRTXI4OXQvTnRrSm0rNk4vRlBB?=
 =?utf-8?B?anZaVXNuWlNtNXQvdWZ3WmpNS0Y4aHg2K0luQjJzWWFEWXQ1QXA4R0I1WDRX?=
 =?utf-8?B?WkdKbVY1VUt6aW92OU92ZE83eFozbUthSnBpbUY5blhLcVRLeExEUG5NdFRI?=
 =?utf-8?B?RWgyUkZnNTJELzFSTHpZVDlmZi9nWmFjL25PMGNGQ1RUUkZuVHNIQ2NvUnpt?=
 =?utf-8?B?WjVHdncrQmQ5bHc2ejZ6NEFXTTBnVkxkNnZXK0lWcDFZQzV5U1pkaGVJSG1k?=
 =?utf-8?B?dEtOVC8yTzBiSmR6MmtsaS9nNG81SDZEb2tKUzBralZKZExMOWpIVkdDY093?=
 =?utf-8?B?QmpnNmR2SWNNZnhTRW53M3phRlY0cmNteThsbWRnYVdvbmdGTStidUM2VENn?=
 =?utf-8?B?eDhkVWttM1ZteEd6aEllbE83aE9lR3owbEhnZ0tNdm8wYnRmOEJxTmpIRFFK?=
 =?utf-8?B?Q0IzWm1nMUJ5K001TWl1QitjbGV2V1U2ckZwUnBCZS9qMDlyc1ljMHBPcDNl?=
 =?utf-8?B?dWlWTGU4TWlsalBiU0FYRlJQci9NUXVxRHhCQUNtM2o4YzFyRzRJWkhaRUdY?=
 =?utf-8?B?K1hOOS9QbVpyR0lOVkVIZmJzRW1GckVWZHJPL1lpWlBReGdjQmdObWhRZm84?=
 =?utf-8?B?VS8zOGNoc3lGa3JqQ3hrQUo0TnVPM0k3bUdhbll4OHY2NGRWN2E2cm8raW05?=
 =?utf-8?B?SFBIRE1zRkl4L0pxWmphdDZWaGFTTldaNnp3SUx0cTdCand1SVRRVDZhL2o4?=
 =?utf-8?B?emlmcmprbld2OWs2RGkwQ2FpcldGaHE4VUhRSzNoL2JsNDdRTEk1QWxWcUpJ?=
 =?utf-8?B?a2RlZllrbWY0QlJRN2NwamdvbCtwQ0VmWC91SUM4RlowQXhMZ0VMS2lnUldG?=
 =?utf-8?B?akNYL1VBLzUxQTBRTmVsTDBFWmV6eExOdHUzaGc0b0p6QnVHVTV5OWJQVml3?=
 =?utf-8?B?aFNMYWMvY2ZCcnBQbnNhT1NmZm02NHNENTNvSmhTaFRFYmMxZ0lyUkMzYmJq?=
 =?utf-8?B?RnpkSFVKZiticzFhT3JDSXlsNVFHd1A2TlJnVTNjc0FqbjJQYUxGQi8vUk95?=
 =?utf-8?B?UlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19ca5548-7aaf-4c71-c712-08dd98a7c3e2
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 20:40:47.2111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F2cJARwne76EgSg8xvlFjMJj+zxU8PetBGtgBle/RTwr2tmLtOk5rGrOEPfVucvG0S4CebM0n6rNM8CvR9oLChakM3ByOaeHp5MWYW0cEpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6067
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

On 5/19/2025 4:32 PM, Daniele Ceraolo Spurio wrote:
> The expected flow of operations when using PXP is to query the PXP
> status and wait for it to transition to "ready" before attempting to
> create an exec_queue. This flow is followed by the Mesa driver, but
> there is no guarantee that an incorrectly coded (or malicious) app
> will not attempt to create the queue first without querying the status.
> Therefore, we need to clarify what the expected behavior of the queue
> creation ioctl is in this scenario.
>
> Currently, the ioctl always fails with an -EBUSY code no matter the
> error, but for consistency it is better to distinguish between "failed
> to init" (-EIO) and "not ready" (-EBUSY), the same way the query ioctl
> does. Note that, while this is a change in the return code of an ioctl,
> the behavior of the ioctl in this particular corner case was not clearly
> spec'd, so no one should have been relying on it (and we know that Mesa,
> which is the only known userspace for this, didn't).
>
> Fixes: 72d479601d67 ("drm/xe/pxp/uapi: Add userspace and LRC support for PXP-using queues")
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/xe_pxp.c | 8 ++++++--
>   include/uapi/drm/xe_drm.h   | 5 +++++
>   2 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
> index 454ea7dc08ac..b5bc15f436fa 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.c
> +++ b/drivers/gpu/drm/xe/xe_pxp.c
> @@ -541,10 +541,14 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
>   	 */
>   	xe_pm_runtime_get(pxp->xe);
>   
> -	if (!pxp_prerequisites_done(pxp)) {
> -		ret = -EBUSY;
> +	/* get_readiness_status() returns 0 for in-progress and 1 for done */
> +	ret = xe_pxp_get_readiness_status(pxp);
> +	if (ret <= 0) {
> +		if (!ret)
> +			ret = -EBUSY;
>   		goto out;
>   	}
> +	ret = 0;
>   
>   wait_for_idle:
>   	/*
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 9c08738c3b91..2708eb73c590 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1210,6 +1210,11 @@ struct drm_xe_vm_bind {
>    *    there is no need to explicitly set that. When a queue of type
>    *    %DRM_XE_PXP_TYPE_HWDRM is created, the PXP default HWDRM session
>    *    (%XE_PXP_HWDRM_DEFAULT_SESSION) will be started, if isn't already running.
> + *    The user is expected to query the PXP status via the query ioctl (see
> + *    %DRM_XE_DEVICE_QUERY_PXP_STATUS) and to wait for PXP to be ready before
> + *    attempting to create a queue with this property. If a queue is created
> + *    before PXP is ready, the ioctl will return -EBUSY if init is still in
> + *    progress or -EIO if init failed.
>    *    Given that going into a power-saving state kills PXP HWDRM sessions,
>    *    runtime PM will be blocked while queues of this type are alive.
>    *    All PXP queues will be killed if a PXP invalidation event occurs.


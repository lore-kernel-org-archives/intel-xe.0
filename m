Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20433C3DA7F
	for <intel-xe@archiver.kernel.org>; Fri,  2 Aug 2024 18:25:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4B010E0CE;
	Fri,  2 Aug 2024 18:25:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aj8UG327";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1619F10E0CE
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Aug 2024 18:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722623104; x=1754159104;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=kl11ep3wg2b6D0pe/ykgijl8enFivCe79ynlFGRnxTw=;
 b=aj8UG327UgbvIqPvGTCNTkzi+K1oqvOf0unHDv+f1rp1WmI9zuYGzJvK
 ZmBx0ItzsWCkj1DbRIhYNsBMLxtna5Rw0E+4yOgCN9FIGFech1cUjjaw9
 azs1iGs464wijQGrYd6MK+RgcsWvmnM0gS8nVkJLMZAB1vsDkdDPiG5LE
 cqBhebWxAeeV0/Jcls+DJujoWrORwDRSt+PY/5x2a4ISpC6hQW2DmrRKh
 HhJxcIXNioS+jQGxjlImrOisvlu6xAtR+KlmFdHaO4teZVNKzBq5Cg5rm
 s3OpvSOCRONOOxumyNkeSo4KTt1+yruuit19u3nRsA1EO9MwSJzZktcUu g==;
X-CSE-ConnectionGUID: 5hwkHXO6QUeF260+jX9rOQ==
X-CSE-MsgGUID: sdfvAihHQraRLUDuxI0eGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="31233273"
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; d="scan'208";a="31233273"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 11:25:03 -0700
X-CSE-ConnectionGUID: 4LJT4uidQx6DxajhSsfq2w==
X-CSE-MsgGUID: 3a0WCBrWTGWEtGQxfl5s7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; d="scan'208";a="86085704"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Aug 2024 11:25:03 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 2 Aug 2024 11:25:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 2 Aug 2024 11:25:01 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 2 Aug 2024 11:25:01 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 2 Aug 2024 11:25:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aP/jTJ+4BPQL8VoFyd8Vd0r1zVIq5zr0+T822vIovVVVBSzhWRtP9Z1FCP5HPyicbZdR3US2OD2U2vijVmEDOQwJ+0cSjKtTFkOaXOWwk1B6w50aXtz8ep7BBN5QrezSxLVseP0XJrcymMD/2xfG9qcWVxTy7nCfWr7pOJ/6UjovdjTZsNYiYc58HefV3FUR5tlnLPJlE1oKVGFMFIXrnnY09a+AVb5SAcxV9QIMBRY2nqbVyRlMFK/lXJ0cGIomFP5UO2ZJiGCQYEFXNlf1idDKKzAQNO+ZB/hfv5/Hm6DkRC5Fxs6rekfppwbJow49uahbz8wnfP8+89G81cUlIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ea/571JEFxjGIee71KrGpg3ItAYSBuxUiNwUVYcnvE0=;
 b=g4wCZ85N54rCo630YcYRg+/HtGTRCK6M1TMqPdFyQVMiU0RrWZaT7m1/tZGvEgU9L/CUanHoiKQQw9QPn1eI/UcsMrTFPOPnv0IFEHHJmmVvCph9L7qxRkoB82zUDIiStmAAnwB/NtwezcdjueHnlQmT3gdSF5n5yfp1egzxFmnJ1XnGTLNqiRszyOvLi94hl5zLr5gd2Hj+qrk5hcIquZBb9oQybonEQVINQlIoGjgEzbLMIimq65xPEhll5oXbe+Z2SjgYTDyRYHvlsvn1XOOs5pCLeaUuHHMWpC+VD7yoY+zd8ELkHTJk67gKfaFrggeZr8Xh3mZBsv0m+lOh1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DM4PR11MB7183.namprd11.prod.outlook.com (2603:10b6:8:111::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Fri, 2 Aug
 2024 18:24:53 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.7828.021; Fri, 2 Aug 2024
 18:24:53 +0000
Message-ID: <95e92605-e070-4ca1-91c6-6790b91788f8@intel.com>
Date: Fri, 2 Aug 2024 11:24:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/xe/guc: Release GuC v70.29.2 for BMG
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240801224241.3050352-1-julia.filipchuk@intel.com>
 <20240801224241.3050352-4-julia.filipchuk@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20240801224241.3050352-4-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0268.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::33) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DM4PR11MB7183:EE_
X-MS-Office365-Filtering-Correlation-Id: a0889007-f953-49db-6d7e-08dcb320672f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUlJRlM2cXRGdStzNWVibDhoYVZrbzBuMkcvSkJtY2RBMG5IVnpZTkw1dkls?=
 =?utf-8?B?dkNHRVl5OXEwZnBSdDM1cHpYR1N2WHcwRkczYmlWZzRoTS81Z1pLRHV0Zi8x?=
 =?utf-8?B?WjlzUGhLVmtpOGg0aFBUdm9pNGswT3BtWmFLVmNNaFRYUklxQkt5TEttZVBj?=
 =?utf-8?B?aVQxZUNGdkVqQjUrbERKREd2VlBSaEt5SWl5TWRLSlJaU3F1M1p6dTNhRHY4?=
 =?utf-8?B?aWsyRmQ2K2I4ODJRbkVheWgrNU13WTRMdnN2WElFZzhnNkVMZkxkZDZ3QXRK?=
 =?utf-8?B?Uk1qeVQ0SVFGNVk3bEwxNkI1MkVWZXZHaC9SaXRpMHNtKytsK0dROTE5cTJR?=
 =?utf-8?B?QlNSakpxZzRXcSt1dFkxKzJKV2k4M2ZrNzhyYStSYlNlKzBHWWg0bUc2MTFI?=
 =?utf-8?B?SXoyYjNMc1B1OXRxYkRKNFhsRnNRVnk1OFNXclBrclRaRTYrb2FDdDFkZFJD?=
 =?utf-8?B?SmNrOU1rODBQRktubkkwN1VsUjJjN3Y3WEZsNUoraC9LdUxpZmp2RXdBbGNN?=
 =?utf-8?B?azdlYU9na2ZvRUNHVEVyQjFqNlJZV2lLcVA3bThmUWJxZERWVlFlRkV5WGZs?=
 =?utf-8?B?NEJHTktCMy8wSXByRkNOS2Rkc0Zmd2RyV2tvc1dCc1JtSncrTzV0b3U3Z2Z4?=
 =?utf-8?B?dTFuVS91bUpyRTVrVjZ3U0tpVTI3YVgzSjJOT080TUFUZUYyckZ0OC9SZWMr?=
 =?utf-8?B?S0ozR0VXRU0zcWgzbDk2NitLNWZ4MDJQVzAzVnJTc1hFWFlYTDBsVVBCOUFP?=
 =?utf-8?B?S1VPK0pEU2d2NVgrb2tkMzZEU2ppRHhXUXh0bVpNMjY5ZC9ScHErdnNSNzdq?=
 =?utf-8?B?bE9kaDFFQmdIRjBjM0tLRU1YK1NyaVY1N0YrcnVsV0JiWnJMY3pFTWpEMWRz?=
 =?utf-8?B?TE9VYlgreU4vczZseGZTT0tuU2xodEsreERKZEVDYzBoeUlDTy8rVEtXSElt?=
 =?utf-8?B?bmhNQmU3NjFrTHhkMWFYNXdtdmhjNUw3ZGRCWmhTTVpFdmd2U3NhNE1nY2Nn?=
 =?utf-8?B?WmR6bDFyWkZHR1lKTlY2MUFkanBFRDdiRUQzYVh3VHRwM2hWVW5XV29tcVlS?=
 =?utf-8?B?d29MVFZ1OEdVaUZseHhOR0FmNkxka25tRzV3MEwxdVdyTkRxbDF3VEZNdnNF?=
 =?utf-8?B?S0hMZUFnd3FGOU1rK2NTbjFHZ2crbFRBMUJKK2xaa2FxcVZYeW5SdnVmcUJj?=
 =?utf-8?B?N0FQaTVkaTk2K2pESldMbzRSQ01IZmZxbDZDeWRYbSsxcUxZYXYreUJETExO?=
 =?utf-8?B?S0FQRFEyaDJGZENpZjQxZmFlZ2s0QVhNeFo4ZnJKWUk1K1hyODBSdjdnNGFD?=
 =?utf-8?B?NHB5Yk9lalJKQkx4NEdkdUw5K3cwSFpjelJ0eE5walFVdnJ0OGErYUwyd0Fa?=
 =?utf-8?B?akhlSk1SQWhaMnVSM2ZoTENUdEhCMy9YelVyWE9XU0RBNHdTdzg4TmJWaGlB?=
 =?utf-8?B?SDFrb0lkS1lMdVp3VU5ZSk0wOWJtdytDd2ViRmY5UWhNanhvZld2YVE0N3NJ?=
 =?utf-8?B?WVVRYmJFUE1wOTJiVWd0bXlPTkhTUFNCZ2YyU3ZaWENKUlBmUFcwVHc0U3RT?=
 =?utf-8?B?TFNWdW8rYm9VbnVrTE1INmdPTVk5eENIaVhDMHdUN1RzcWwyN295RENNLzhO?=
 =?utf-8?B?MithOEI2Mm15UEJpaXBOU3FwclpTR3FXNC9hSVlXQ1hkdHk4MFNKUjZiY0Yw?=
 =?utf-8?B?NHRyN2Voekk4WnZlYWVNeTM3QWVuV3pYb1RUK3F4SkJ5RGEvWmpYMTlHbi8y?=
 =?utf-8?B?ZE84blhOTGo1YzBFSG52YXBoS2VlejQ2WllNL1ZBTkVRa1g1bVM1aWpic2ZR?=
 =?utf-8?B?MXduZ3R3QUdERWVnZURRZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlJQd1hQNHBkNVE5eE5RRDl0VE1LWGxqTWhpSjdpN2NDTm1zQXJGUGJJWldr?=
 =?utf-8?B?SHU1dS9jLzVaQkt4RGRDK3NXVWZvREhsNnlGTjRRYkRSdHhtdFNqK3dIVXNt?=
 =?utf-8?B?ZytpZWlGYjk5VnVVRjVaY0ErcmdWeVNMWThVZHJGa1lBU2dZYVkvSDVEUWlW?=
 =?utf-8?B?NDFpbGpSelFqRHBIODRIdHVnVnlUdThrUlhCekltUG9XazhLREo1K3Vla2hx?=
 =?utf-8?B?QW93MlpEdXRXTVErOEk2VHMrNGNWRTJqd3NEaWpyS1A3dGRJdmN1aGNtT3Y3?=
 =?utf-8?B?R1JqSmF6WEtLNVNMbXUzbzJleVJzd0VoMWdJS25ENkJLRmU0R1hFdDRXNU1m?=
 =?utf-8?B?SkVkaUxlMERQK0FRejRGa0JNQVcwWWlkRVhLWXpYQ3NxWFlUSTMyTHM1V0hB?=
 =?utf-8?B?MGxiaFhhc1Z0d2toc2RUNXc0WnFiQnpyd1lvZElYTjhtL2d1UWg5dVdqL0ZZ?=
 =?utf-8?B?MklNcXFVZlJ3NkdJemU5MVF0Z25RaEpCcDVjRHhXdWdwRHRYQm9JTHJBVjZY?=
 =?utf-8?B?aS9TTWtjTENSRnZibHdBRTZHNElwUnZXUmFndlkzbFFkWXZDaThHdFhZVTRU?=
 =?utf-8?B?d05LbTFPQlNsUjUrNDV3NkU0blRXTFhVbFBGOVJIWnZ2ZVU4c3k2TEw0T05G?=
 =?utf-8?B?eGdKWXdWODNKRTBDczBhbUNzTi9UWHZvb2hBS0paa2Y2b2FBODUvU2FYOXBZ?=
 =?utf-8?B?cHhXQURnRzZuSjcxSVoxS2Z4VEJWendHZm83MWFvR3kydU9BSURRYysrbDY5?=
 =?utf-8?B?UEM1ZktoYW5obUEyZzNrS0FxdTFHMmpyRmJiMFAvSlorcnVYNTdTWG5lYndD?=
 =?utf-8?B?TmJwVzZsTmtyMkxZRFJkbXJycHVaNUx2VUJGc3huelVRd3E3R09IOEZkeE1W?=
 =?utf-8?B?RkpPRnhhbXpuUWJkblY2Mlg1ekRVNW91eWxZbDdRSWxBMTNSUStMV3FkTExm?=
 =?utf-8?B?bXR6T0ErMktJbFFKN3h2RmJzREJWUnBzZGRYSzZKVGV0Rm1nNldzUlVicmVN?=
 =?utf-8?B?Y3piU0wyYkh1RzVneDNtZ0Nna3l6QjczcHphWW12MGVXRGZURldzSER1NG1O?=
 =?utf-8?B?eGhDQTlQSTh5NDZqQVkvb0lKckZqZ01qMDRqTmZid2MyVE5rUHYyYjc2Y04x?=
 =?utf-8?B?VUpJNEQrS0d1bExzU0Z4b1N5Y0VsSElIL3BaS1VxRjRXdzBUMFZ1aHNxQ3d5?=
 =?utf-8?B?M3pxZzNpMGJRdFFxdGpLYjZTY0U3UmJiK05GN0NTb25IcVU3TjVnbi8xak1t?=
 =?utf-8?B?eWJXb0xTeGJGNWM2Nk9wTzdhK1VXZFlncDNDRkhwUXdVUldaNWF3c3hQaVdZ?=
 =?utf-8?B?RTZhTjA2Y0lLN3dIY2E4MzhyUGsxZFp1dTk5Wk5lRHlYNElhclBmWEFIcXZO?=
 =?utf-8?B?OE16N0dCcUxNejFESXNYTlhEdFVXdXVSUDd1bml5Sll5VEhFeC9JeU1KejU5?=
 =?utf-8?B?eitoRktzdENJV2ZCM3NScTBraVdNaVNUdTlIUFZJZmhjRDd5aHQ0RDNWQTlY?=
 =?utf-8?B?SlNhcmwvcEsrVEs0YjVFZjhyajQ2VTY3aGR3OWgzTEtmNWhpMkt3K2M2Q0t4?=
 =?utf-8?B?b2FKTWxmVDBKYS8razlOaThVL2YxRWFxUUgyL1dPMEtYenFLQktaS2ZONml3?=
 =?utf-8?B?QjhQWUE4cjFzRmRRREdUenA0NFMwbUFtd0tIV1R1Q2VOVThSOG01bDZNUEpi?=
 =?utf-8?B?akRkcHBLS3dKYkoyemJjMGlIb2xzcnBFVitYazRheUVMNy9xU3pBdktqS0tk?=
 =?utf-8?B?K1Ivc0ZTTnM4MU95cndTTEVqQTdZenVxVmRNb2x5SzZRZGp1TjZLK1JSU253?=
 =?utf-8?B?QnhHWFBXSVBFYzQ1Y2dhRm42dmViaWJqNzZhMnRSd1JWSUtIWkljdG1Td0xu?=
 =?utf-8?B?ZTlFSzhwVjlaZ1poRVhuTGZSVm1MT2ErbGdvcWsrWjBBSHdTcXBNb3cwYWdD?=
 =?utf-8?B?UkhLSDlnWUNHZ1haOGQ2eGpJMDhMdDlhM0xKbjN3NzErOEVSQVV0MnNGN3R4?=
 =?utf-8?B?c3NiS29jOTJScDUrOTVZNXdxeWdKbFFGYUFlblRmL1o1YUlOZ25pMGZVK1pU?=
 =?utf-8?B?KzQzdWJ2VDJ3MmNYSkxXUXBzL1hnVTBVUlA2RTVLK0RmaTVlY0NYOFJ1TUZl?=
 =?utf-8?B?WWhVRFRoaGNLVWIzMjFKVXlTRjY4dXQxakw5YzBRVmpWdCtzbnlyQi93aXJ3?=
 =?utf-8?Q?LtL69EB7VuT/76INKGbCY5M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0889007-f953-49db-6d7e-08dcb320672f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 18:24:53.2240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YvYW4VHSKRmOd0LoE9SGlb8j0AbVuy3rzPhSdadVuyEhSOo3l7CvySLIEURFSpQs+oSJkkDzvYKAsmrI7Fl04IISF3w6waTkhzN3yxGNpOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7183
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

"Release" in the commit title is a bit of a misdirection, because this 
patch does not release any GuC, we just define it. Maybe just 
s/Release/Define/ ?
With that (or a similar reword):

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

On 8/1/2024 3:42 PM, Julia Filipchuk wrote:
> UAPI version 1.13.4
>
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index fe1b97d3d2a0..05a3c5b80b5b 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -106,6 +106,7 @@ struct fw_blobs_by_type {
>   };
>   
>   #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
> +	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
>   	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
>   	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
>   	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 29, 2))	\


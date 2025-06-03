Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F80C5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 20:23:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7140D10E916;
	Tue,  3 Jun 2025 20:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f9o5cYjD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D4610E916
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 20:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748982238; x=1780518238;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nnNQNRptv1f3iEQaM1pqdTGse5e5RS2r5/ugyzkHmy0=;
 b=f9o5cYjDgZWjG85JMeYYN1jAHmwLu14oNhOCbSqPMjATUty/jCQUZHG2
 FGkqxwKbHJGx1b7iyTKELUqBQNrB0crSnJQXLhvg3iukwOUOC4GuAjvon
 RyfWXXmu8A1yntEwl5TKJC+hTbm4KphSRbsMbTk5LJzMgsTvSD3ddB3r/
 W8eQobRM4HklwD1JioFQQyQ7XXIN5phdauWMBVi09J6SwNs9+CYJmeIig
 HG9dTXYYPKkI6yVmJgN/S1p4sM7LxwWcuNZosGtq51Afedd42nONIVpyd
 Uc3bqCVWtHCn2UxSs34lmImATfgT1okri1AmQb2fdNXNGn/3UR/36R8cI w==;
X-CSE-ConnectionGUID: 1Ww8Qbq8RCGlspFV/420Fg==
X-CSE-MsgGUID: 695Un99BT2+NKmYAIjr/rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="51040175"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="51040175"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 13:23:57 -0700
X-CSE-ConnectionGUID: LvrzG+doQaG8/U/t0BbGlA==
X-CSE-MsgGUID: NWAW320pQL2sphuLMW3nFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="145939236"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 13:23:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 13:23:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 13:23:56 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.80)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 13:23:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nytFzUa7wlfs22cIX7rWhUwPQtQHc0qyX74zlKBe3eenqVWjZY/3U+fKZoAucgVP930KbAgMsSYwvLelc3g+9H5mlp9dyYCScpu2D4gY5T1C5dczA5TMXj4pLvJYHEEfW0UlMgXieFhVSgFtJ9IJFYN7HKY8YLMDqtoQOV32Bo0e0m4Er+ek3QUIVrSZJbSy11/cFEIGxuwPgwZVFuX++Qobz84wBcUCnr6lS0bS8LAaBJ6VouN7oBEXxVvDAw7S96lXrPU/Og95OtFz/g86OPITf9aHcgKk5XLsm4tuNbjjM7rWgAI9febGwkqmkrGZ2FwqW43+FXGDTHgNmdckFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i025TdE7PDzr3zvqOuuzoo3ivXciMH+DEp2vjYNqka4=;
 b=KN4X2dHP/nIILlwez9g8y9MaI6V21BAwZmypqpOw30W+bZre15buIWAuXB6b0oSebxmuT7xZ8D7D0ixBvzvHSxjUBMFmeJ+OBg9vsJMklI9p9rsI80yf+cVyfHovIYy6xQn1CZWgareTV0GCeb+pAj6OvsWQKqXV1HID4ugorv7ASbmU9/f+fdWuIj4OdTIk5hnsE88IrojZeuHQfq09O+xoIy3Z+GgLmJilN7VHw6so3AZ+FxbpB2qTudo0t1iUa9ZcmIbPumH6YJZiq1k+VENbDMkxVHAMAksF76d7fNV1DUBs+eHQPqEP30KoLBU8rZGrpS6zpvV7Y23mbe5ZoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by PH8PR11MB7071.namprd11.prod.outlook.com (2603:10b6:510:215::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 3 Jun
 2025 20:23:39 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%5]) with mapi id 15.20.8769.025; Tue, 3 Jun 2025
 20:23:39 +0000
Message-ID: <9d4860ea-97f8-426f-a5a0-e6cc13f62221@intel.com>
Date: Tue, 3 Jun 2025 22:23:35 +0200
User-Agent: Mozilla Thunderbird
From: "Lis, Tomasz" <tomasz.lis@intel.com>
Subject: Re: [PATCH v3 5/7] drm/xe/vf: Rebase HWSP of all contexts after
 migration
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>
References: <20250519231925.3196154-1-tomasz.lis@intel.com>
 <20250519231925.3196154-6-tomasz.lis@intel.com>
 <l3qqejzjkimx5kssccsxx7vhoc3to3jow4wisskvx2cuivumhw@vzcpwqz3xbxl>
Content-Language: en-US
In-Reply-To: <l3qqejzjkimx5kssccsxx7vhoc3to3jow4wisskvx2cuivumhw@vzcpwqz3xbxl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR03CA0071.eurprd03.prod.outlook.com
 (2603:10a6:803:50::42) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|PH8PR11MB7071:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a0e1979-bf94-4d65-acdf-08dda2dc861c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ai92WWtRWnJIQXhFOXpsUi82Vk5NQVAwS2hwNUVKYktZSXVLVGpsQVhQbzJY?=
 =?utf-8?B?SDl1N1dYN0JmZk1RZ3VpODduempPVCs2MkY2WkM5NkUxZklZOHZBRkI5RE82?=
 =?utf-8?B?L1JScWNtdUsrc2phZ2dhNFdkWmpRdTcwK3lramFmTTliUzRKRW1jVFhKdlRP?=
 =?utf-8?B?VGl4VjZzMWVKUzR6NkpFcnh2VHdCVzIwREVVbkxQMGdFT1hYVUl5ekxCZ3Jo?=
 =?utf-8?B?em1VQ1M3Unl1RDRaYU9DSVNHTEtndnQ3K2ZKL3NXeGJ3UjlQS2E0bkpERjBR?=
 =?utf-8?B?V09CSXAyMkE0Q0loa3U1UHZ5bDU0MWtRUVBlYzNkemNaT3VBenRCMjV0c0Rn?=
 =?utf-8?B?eDdnYXhXYXgxU1pLbmovN1U1UC9MUzNjSTdjR1NoQ3FZc0tjN1JVRXVLZFJV?=
 =?utf-8?B?ZkRXZnpUR3FUZDk1RGVZOHViNFRpMnNwcnhzSk9YSUZ4ZVl4V1E1ZGNFVHIv?=
 =?utf-8?B?K2tya2s3Yy93YkE4L29KcHNMWi9CRUVhREpsdHZCL2ozdDdkbzZWdEdzUmsv?=
 =?utf-8?B?WnNHR0FQN2xJNkw2WXhLam9ydG5neEk0SGJwTENnMEtCdTl0eS83ZG53RTZI?=
 =?utf-8?B?NGVFZVJjT0E4MzZVdEFpRUJOUVRnNUxpR24vWmRrN3dDNlRTbE91dGw5V3FT?=
 =?utf-8?B?Q1J4ZUg0YllyYmpoZ3dRT1granBBUEtLTHRuTndwV2I0eUd4Qk0zZDh2MWZj?=
 =?utf-8?B?SmMxMW14VWoybUx3V2QrVitDV3V4MlhUNGxCS0JYbXRhZVNKWWk3c1NaRUll?=
 =?utf-8?B?bThCcHkwTDhKZFFuUndMU21VRDRIdFY2aDkyNWdkOHNuSTZjSWJoMHNrMkpN?=
 =?utf-8?B?NDN6VXlSMDFGL01uWEhGL0szaTlGaVc4WFhlTTdxZCtHNDZrTkkzbmkzWFR6?=
 =?utf-8?B?MjU3dTYzd0VhbHk5SW5PWFJKekJkTWg5d3ZjVlJkbHFNSzRsU0t3bmtSOVM3?=
 =?utf-8?B?bmFHTERPTndSTXVZNmRFREg4UWlDc0p2YjFyM2JSMDBqYTJTZmNyYmg4MTdn?=
 =?utf-8?B?eDJTT3J4R3pZbFdsdWVXQVpBNHdmZU5RYlVjWTAraURVNWxSY3VES29xUzMw?=
 =?utf-8?B?NWhwUXlKV2d3cTJBWHorbjdGckRXdVpSZEUreVl0bnB5ZmlhSFNIbEozUVI0?=
 =?utf-8?B?cyswbmtVL3c5QnhiZEFDcFo2V0MwVjVIOC9veUhmRlB5aUd6NXBGNXZPU0ZU?=
 =?utf-8?B?V1BUZC9zVDVZM3dnYVNJUElwT3dQTkd3Q1RkZWdtUDA3WnhZOTVicXZNMkZL?=
 =?utf-8?B?a2NTMkw0S1piWHUxM1p1NzFIWXFDRnZPMWN2MHFzRzdwUEpPYmkwYjFyY3hr?=
 =?utf-8?B?L2M5bG45bVNPeUQ1ZVNOai9XcWNzN2JvOTAweGpPdndHcUZ0RVZHdmx1eXhH?=
 =?utf-8?B?QUlmZlg3bDh2U0xmZ2h4S1h1SVl4NzUwNVV4WjZJbmZveUdhS3pjUDUzWGVG?=
 =?utf-8?B?SlZaQVc1bFZlQ2lBVWdXODBOUUZ1UkNMWWdKM2hsL2ZZeVlwbW9WNzlOY2t4?=
 =?utf-8?B?cXVsOVBPbTRRMldnNUY0K01qdzRXRzdWUyswS2xjNDZqNm9xMm1aSDhldCsr?=
 =?utf-8?B?bHhvYncrQUVKN0s3aDBjcTBCR3FuQzVublJ4UnYyNG41NzBFQ0syYWRQOEN5?=
 =?utf-8?B?Rzc5eWpxL3FvSHB6QmtkenJOMDB3UC9ISmREeVlic1RFWUd0dDlzM3FKODlx?=
 =?utf-8?B?ZmYzZWRNQkEyelVxZ1o5anR6LzRYSXRXWVQ4ajgxRThxYXJQTi8xTFFlM2Ur?=
 =?utf-8?B?OEhMd00yNkk4cTRWbGtTcms1VmNHSk5ENVJFYlpNNTFYSGdDOHBERnVmMzls?=
 =?utf-8?B?NnJtU1VHbHJtZmFOVVduTU9aVFhvYmdFM29JMmdENlJyanplZkQwaE9SVDNP?=
 =?utf-8?B?YkJSU3ZUQThmcTJyU2dxVEFMdVRkYWV3SDEzSFpseVhWWTFCSFhYazZoNENt?=
 =?utf-8?Q?8ODOkJst8/k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlVXVjl3RlJjeWYzUUNEdHBVVVRIcjBuaStMSS9EYm4vNGNtQnpYeWdudFRh?=
 =?utf-8?B?M1o0UUFRd1hBWlY5S3FsWlk0NFJyb0Zoa2dBdnBiVC9QV2VYVzZYd0R2WVZR?=
 =?utf-8?B?YXpGV3VIdVMrMUtOaXRISm4yK1lxSmloaTNGeHBkVWxJQjFLc0tQS0xVOTRp?=
 =?utf-8?B?UjV1OVdQVHQySUNTeXBVbkhGWUJVSC9TV3JVUzdxb0ZsQ0dQbVdvOHB2ZFlL?=
 =?utf-8?B?dFRmUDlTVzhJeHdnYXI1N0oxZ1dJMTlMT3ZCaTJkNzFXMkVpY2FLSUV1SGxP?=
 =?utf-8?B?Unk0bS9MdTFTM3p6OWFIaCtzeEgyckRqSFdHRUYrRTluZ25UZ3NUdks3QWlp?=
 =?utf-8?B?S3hDT21rUnp6RCswRHg5UG1qdjJEWnJ3d2J3MGprZUk4MGdwbHprTlFiNzQv?=
 =?utf-8?B?L3FjeStFNlQ0VDUyNC85OVREcStNVm1IY1R3SzNsSWM4aVV5WXpDN1pWYTVF?=
 =?utf-8?B?QThqQ0NFS3hzc04rLzJQa2thQlFrSmtZdHJxWmNPelNMSDFtVlZVTFFCUlRO?=
 =?utf-8?B?cFlicVdyTDdJeno3d3pqSUtzR0k0MCtsUEF1SEVyL1VuSWlTTGVoeXNVZzBw?=
 =?utf-8?B?TDRGVW1TbWV0WHRBQm0rVCtwYWpUdmpRWWU5NVZXSXNqczFMT3J0SGlrbGdW?=
 =?utf-8?B?T3BUVU5YbGtYZEpVK3ZNSHU0UENvbVJXMWJ5bGpyZmxxR2o5OHA0SHBJNFdU?=
 =?utf-8?B?SFdTMUhlNEFjUndIWmNKMlkvcnUvdW02MGhYUGxiS3IwdkY3TVgrRFI5ZzZ1?=
 =?utf-8?B?ZytNNXBTVlBqdEwzYlVRM0gxOHU2UEdGK1J0Ry8xUUR2ZGxKOHpncUxhb3pn?=
 =?utf-8?B?YmdzSTNKYjBpZzNMczhDVTEzSGUrQ3ZqNGl5Qm5tdzJ5S0FKVVhBd1M1ZnBY?=
 =?utf-8?B?L0o2SVFmdFppZjRyajBiQUkxcjY1R1RlNDJqUVBGVUZ5NjBYcXRkZjcrcExs?=
 =?utf-8?B?RlVLQzgxOStHc2RMRTA1elJQZjdQVjY3UjZhdThWRzVvM0Y2aSt3Z0tpNzlV?=
 =?utf-8?B?VkVQWWRBWHJubHdPSDdidE5NUjV4WkpvNkFaUDJJdXUwN253eVk0WHlrMmpL?=
 =?utf-8?B?ZnFXWWl6RjRwWUxTZzErWVFTbU1iWExlK3JHR1ZIS01rdXVxN2VGVGpOUkdU?=
 =?utf-8?B?bSt0eE8wRC9jWVBIRVlYOFdJbTZXMXdQTFVhbHlPN2Q3V1YxOXRac1lQOWFW?=
 =?utf-8?B?U1VGU0N1czBMOUNVR2EzTm0xekRscXphbWlNZEJRTWlHcmZKL3JKak1hdTRW?=
 =?utf-8?B?eTc0amovSGRjK3IxZWJsQ3BzZ2Z1QjlSNDRYaWM0bmZXN1JldzZEbEpaTTF5?=
 =?utf-8?B?ck1NMFg1T2duVDE3dnM4N3FhZFdqSVlMdmVXd054UkROZHU0QkFYRG9pang5?=
 =?utf-8?B?WGFzT3RGelJnVHBLYkJwenVpOFo0amVuRXYraWNQdStNWmtMUUxlSWZXZTls?=
 =?utf-8?B?MGlzWktKRUhsVU5mSDVWTmJZTjVaRElUNFRPRHM1amJZMjFrRXlXVWlsWVJE?=
 =?utf-8?B?UmFJT1dlaTlFWFZhWFhsK0ZCWkJ3R3NnRXlETlBDNUNObUV2TllpSzdsYkQ3?=
 =?utf-8?B?dzRUOHFoQlcxQkdMamFxR2c3NlRJKzlrYmZSbEFiSFVxcnU1NDNsLzRIUkFW?=
 =?utf-8?B?eitqT2NlSmVxbG1XenFjRDNJaXgzL3dIRlZWWWZnTUR1YzFOSEhiWGpOeTFu?=
 =?utf-8?B?WFZ6SFRuZTdSYTNteml4QTN1cEVUM3k2S1NYdFJ6YmZPSjc0Y1ZjYTQ5N2Y1?=
 =?utf-8?B?QmpqV0NtaDAzVDlZVkRSK0dHdmViTlIzWG1HeWtuZkx0QTE5NnFTd1NWSVFO?=
 =?utf-8?B?UkVCNFRGMlRVb01ITDF2WVIxSXRjMXprZ0tGeGtWUmpoeDlUM25SZTYwdks2?=
 =?utf-8?B?STkwcmNiODZyN21BZGMwVCt0eFBRNU5aL28zeFl4VjFHZHhvYVZvNW11S3FG?=
 =?utf-8?B?STFIYnN4VnZnNmFzT3VMN0VtaUEwWjNZRmFrcXIvVHlIdEZsN08wcmJVdUhU?=
 =?utf-8?B?bmhnVHRtR1pNZGZSQW9YYnZNMGZVSmtZaEI2bWM4dDJNYm9Qc0hIMGFEQkJN?=
 =?utf-8?B?K2c3a0lYZ3U5SGtObmtlL1lHRnpDNGN5Y1h3MTIyRjBNZWFmdU1yRVgvTVhF?=
 =?utf-8?Q?Pcrn12kfOztczIqYgtbGOuCfO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a0e1979-bf94-4d65-acdf-08dda2dc861c
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 20:23:38.6307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QI8KTkHLHFxUK/rvNMiSOEJUXXyc/1aHl3yi99fWuAbxojo+SrHESemvw/nxGaYHiwpLM17KPHRlpxhYrNaVEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7071
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


On 28.05.2025 14:49, Michał Winiarski wrote:
> On Tue, May 20, 2025 at 01:19:23AM +0200, Tomasz Lis wrote:
>> All contexts require an update due to GGTT range shift, as that
>> affects their HWSP.
>>
>> The HW status page of a context contains GGTT references, which
>> need to be shifted to a new range (or re-computed using the
>> previously updated vma nodes). The references include ring start
>> address and indirect state address.
>>
>> v2: move some functions to better matched files
>> v3: Add missing kerneldocs
>>
>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>> Cc: Michal Wajdeczko<michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_exec_queue.c | 13 +++++++++++++
>>   drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
>>   drivers/gpu/drm/xe/xe_guc_submit.c | 16 ++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_submit.h |  2 ++
>>   drivers/gpu/drm/xe/xe_lrc.c        | 16 ++++++++++++++++
>>   drivers/gpu/drm/xe/xe_lrc.h        |  1 +
>>   drivers/gpu/drm/xe/xe_sriov_vf.c   | 17 +++++++++++++++--
>>   7 files changed, 65 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index ce78cee5dec6..d696c8410a32 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -1041,3 +1041,16 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
>>   
>>   	return err;
>>   }
>> +
>> +/**
>> + * xe_exec_queue_contexts_hwsp_rebase - Re-compute GGTT references
>> + *   within all LRCs of a queue.
> Formatting. Extra space here. Note that similar thing happens in other
> patches, please correct it there as well.
will remove.
> BTW... It doesn't look like this file is included anywhere in the
> documentation. Or am I just missing something?

Do you men the Sphinx-generated docs?

Doesn't these only include functions which are placed somewhere in the 
TOC tree, like by having "DOC:" chapter defined at the beginning of the 
file?

-Tomasz

> Other than that - LGTM.
>
> -Michał
>
>> + * @q: the &xe_exec_queue struct instance containing target LRCs
>> + */
>> +void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < q->width; ++i)
>> +		xe_lrc_update_hwctx_regs_with_address(q->lrc[i]);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
>> index 17bc50a7f05a..1d399a33c5c0 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>> @@ -90,4 +90,6 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
>>   				      struct xe_vm *vm);
>>   void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
>>   
>> +void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q);
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 69ccfb2e1cff..990f3265c7ad 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -2424,3 +2424,19 @@ void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p)
>>   		guc_exec_queue_print(q, p);
>>   	mutex_unlock(&guc->submission_state.lock);
>>   }
>> +
>> +/**
>> + * xe_guc_contexts_hwsp_rebase - Re-compute GGTT references within all
>> + *   exec queues registered to given GuC.
>> + * @guc: the &xe_guc struct instance
>> + */
>> +void xe_guc_contexts_hwsp_rebase(struct xe_guc *guc)
>> +{
>> +	struct xe_exec_queue *q;
>> +	unsigned long index;
>> +
>> +	mutex_lock(&guc->submission_state.lock);
>> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
>> +		xe_exec_queue_contexts_hwsp_rebase(q);
>> +	mutex_unlock(&guc->submission_state.lock);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
>> index 2c2d2936440d..2cc44298465f 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
>> @@ -44,4 +44,6 @@ void
>>   xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *snapshot);
>>   void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
>>   
>> +void xe_guc_contexts_hwsp_rebase(struct xe_guc *guc);
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index 61a2e87990a9..525565480aef 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -1184,6 +1184,22 @@ void xe_lrc_destroy(struct kref *ref)
>>   	kfree(lrc);
>>   }
>>   
>> +/**
>> + * xe_lrc_update_hwctx_regs_with_address - Re-compute GGTT references within given LRC.
>> + * @lrc: the &xe_lrc struct instance
>> + */
>> +void xe_lrc_update_hwctx_regs_with_address(struct xe_lrc *lrc)
>> +{
>> +	if (xe_lrc_has_indirect_ring_state(lrc)) {
>> +		xe_lrc_write_ctx_reg(lrc, CTX_INDIRECT_RING_STATE,
>> +				     __xe_lrc_indirect_ring_ggtt_addr(lrc));
>> +
>> +		xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_START,
>> +					      __xe_lrc_ring_ggtt_addr(lrc));
>> +	} else
>> +		xe_lrc_write_ctx_reg(lrc, CTX_RING_START, __xe_lrc_ring_ggtt_addr(lrc));
>> +}
>> +
>>   void xe_lrc_set_ring_tail(struct xe_lrc *lrc, u32 tail)
>>   {
>>   	if (xe_lrc_has_indirect_ring_state(lrc))
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>> index eb6e8de8c939..e7a99cfd0abe 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.h
>> +++ b/drivers/gpu/drm/xe/xe_lrc.h
>> @@ -88,6 +88,7 @@ bool xe_lrc_ring_is_idle(struct xe_lrc *lrc);
>>   u32 xe_lrc_indirect_ring_ggtt_addr(struct xe_lrc *lrc);
>>   u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc);
>>   u32 *xe_lrc_regs(struct xe_lrc *lrc);
>> +void xe_lrc_update_hwctx_regs_with_address(struct xe_lrc *lrc);
>>   
>>   u32 xe_lrc_read_ctx_reg(struct xe_lrc *lrc, int reg_nr);
>>   void xe_lrc_write_ctx_reg(struct xe_lrc *lrc, int reg_nr, u32 val);
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index 82b3dd57de73..0f0d1a97ae1d 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -7,12 +7,14 @@
>>   
>>   #include "xe_assert.h"
>>   #include "xe_device.h"
>> +#include "xe_exec_queue_types.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_sriov_printk.h"
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_guc_ct.h"
>>   #include "xe_guc_submit.h"
>>   #include "xe_irq.h"
>> +#include "xe_lrc.h"
>>   #include "xe_pm.h"
>>   #include "xe_sriov.h"
>>   #include "xe_sriov_printk.h"
>> @@ -223,6 +225,15 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
>>   	return ret;
>>   }
>>   
>> +static void vf_post_migration_fixup_contexts(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +
>> +	for_each_gt(gt, xe, id)
>> +		xe_guc_contexts_hwsp_rebase(&gt->uc.guc);
>> +}
>> +
>>   static void vf_post_migration_fixup_ctb(struct xe_device *xe)
>>   {
>>   	struct xe_gt *gt;
>> @@ -303,9 +314,11 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>>   		goto fail;
>>   
>>   	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
>> -	/* FIXME: add the recovery steps */
>> -	if (need_fixups)
>> +	if (need_fixups) {
>> +		vf_post_migration_fixup_contexts(xe);
>> +		/* FIXME: add the recovery steps */
>>   		vf_post_migration_fixup_ctb(xe);
>> +	}
>>   
>>   	vf_post_migration_kickstart(xe);
>>   	vf_post_migration_notify_resfix_done(xe);
>> -- 
>> 2.25.1
>>

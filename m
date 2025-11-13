Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CEDECD5BD1
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 18:09:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68C610E90F;
	Thu, 13 Nov 2025 18:09:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="luNb3qGz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0A710E90F
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 18:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763057389; x=1794593389;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=ZmoMUa7pTmsC35KUQNA6NvmjXuBqenTarIoj9vkasp0=;
 b=luNb3qGzSY4h+jjNnmN2iPh0eUDSWGVWN+dE2zitWGFMRATRSjXZt8cb
 xoA0gM2tD8W7jvSxL/bNShk/a9MhJODqHxfuk+5E6usOqRPao3O6UK+r3
 DLC+vM9mLpBP7hbvRU22yE8v7J5+LHp53kdQa0hmYevurKS/+njGc1hNc
 2ufN1oqei2/xBQfmvZJqtR61hjUXp1PGthO+br7xA9pPLMlvrh/HvDGEH
 SBhLi77vRT/6nSVCPEHhyeUhVtpYj9iRUG54t0JlKwWFgQa6t2Y+UNOM+
 O0dJU3rmm9IQe67cb/O68nkiwGdAaDnCtil7bYLw0LdbXNeGBdgloyYku Q==;
X-CSE-ConnectionGUID: Xo63Hm7sRwykjHnj25D5tg==
X-CSE-MsgGUID: c9uwsJquTGSAeM0vdCcoXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="52712818"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="52712818"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 10:09:48 -0800
X-CSE-ConnectionGUID: qW+Gahe/QxaXil94ZbvL0A==
X-CSE-MsgGUID: xV4DFGmJTLCB4J5G9jWZzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="189576013"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 10:09:48 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 10:09:47 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 10:09:47 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.29) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 10:09:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N6hujVFtG3f7fdElxmml/wQ/KIJtb4N7zRh9BTFmni0d52qe3HW8hO1lAg3EDwP752p6ve8L9kPFJGsZXGDj33h59KF1UFFVmDVtF3gZYhDs5WukFVsMU1AEDKD40lLTw4djWXXI4EQ6Qi2DA4JON0mkezgmkJEnxzNVf6q8Q7GDeRAGSxh7APt9N0O6aw2By7U6KPVGSsiOwIPz65v8RELiFpUDA6SAIzU2vtUIdTSiitbGFFIEAJT7SpNBywV/DPWwSD67X4LYu0O8RFshqh4Q5UxqUFZbCjFp8tTXGCwt2xnRqeA4rPbAv2HkF0pQdx9FLwmIIZ0kJG1yvfsgcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/LpWuPmixhWtBrFhQg8G0BxiL5ia+4hCxfipkw/Vng=;
 b=LEq5YUfRcQiD26R5q3LOr3PzqxgqWcfSNTPh6gKoaK7cTFnMt89OL98F3gUXG6qR9/Wt9d9WYaIEAshlqO4zNARMt4UWG5i9JTILwPSRJAYl+f7nnKt4hsRCRsD7Q4QQVpzkZ0wd7MeHxDAbD/nDp1DDRguvzTVLHD8Aeq5IU0wE77SlZJU+EcryDc4VxM9Gu2AfXrWLkSXPyr3YOzLOlggn7QmJQKpjglanG4uoYv064PZs85XlflPg2ZL+oL6nKP5nUtxf7FW3UjLHSnQZnMhQyc0MMf4DBuPBsUXSjh5M7TICdey3LUm6JZnsYxrVLmjmxkKgC7pM4n5lsIS7xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS4PPF2D9C959A2.namprd11.prod.outlook.com (2603:10b6:f:fc02::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 18:09:45 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 18:09:45 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110232017.1475869-59-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-59-matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 27/30] drm/xe/sriov: Use scope-based runtime PM
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 13 Nov 2025 15:09:23 -0300
Message-ID: <176305736390.3698.4781739702760713469@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BY1P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::11) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS4PPF2D9C959A2:EE_
X-MS-Office365-Filtering-Correlation-Id: 79598efc-4372-4b1c-64e4-08de22dfd361
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M04yZkR6cGJGR3E5aHlGOWhwK1hVMGMzT2dVUzNFUkJIWjNEbXlyK0RoMWJH?=
 =?utf-8?B?WHFGK0FabXduVk9GTDRVUTdiajZ1bTEzcC93OWFqeG56MzBPSjZ5L1RMNHZx?=
 =?utf-8?B?MS8zMDNtamZwellwNCtWYUJBY1hQSnY5dTNybjIzSElXbGdNTGdBQ29iaHJa?=
 =?utf-8?B?MCtubGdkTVRpTzJHWm1KZVp6RThJdTJrQVJMdmduWEhXTk81MW1UWWxvZEtP?=
 =?utf-8?B?cjBta2FZdFIzUGZROVYrTk5OUWNPR3pRVVVlQ2Z5WnhyWlJkMXd0U05URWdt?=
 =?utf-8?B?QklUbjlvWDUxWFpVYmFObVhuYk5yMGpSVzhMQW1zQjNCTnNyQXZkK0hyY0I2?=
 =?utf-8?B?ZGc3UC9pMEEyRWNQNlBDSzJ4RUZFbi9WSHE1d1QxKzVqSktMWjRMR1loWm5Z?=
 =?utf-8?B?cnVBQ21XN3ZtQXA3eC9QUGE0dVo1anl6cFVaUmc3QURxazF2WVJVNEVqeFRN?=
 =?utf-8?B?VEtFaldTM3NERXc3VGUvMkZhRkYvR25GTmZUMmlZY05oZU4yS2R5TnBDSE04?=
 =?utf-8?B?WWp6NWJtQXdpQlhnYjZhVG5zeEltaVJBUTBhSWVrT3M3V3cvMEtZRDZkZUNQ?=
 =?utf-8?B?UlBINXZzQ2RwY0NXWkdTWG5zWjV5eU8wMUdiTWRoVm5NNFFUWEVSS2Q4dE5M?=
 =?utf-8?B?M2xxL2VLc3pydkU0Ymk5bzVQeC9TWXVHbENhYXc0Ym91R2dlbU55dklyR2Yz?=
 =?utf-8?B?Sjh5WGdhTVZVSE1rRDgzeGFSSVZLdDNPcy9tUitBcmlwRkRJK012U3NtVEZO?=
 =?utf-8?B?b2wyc1hocUVacldORWxuZzhpZkhqNklucVBvUFo1MmphMFpPSkc0S2JKR0FJ?=
 =?utf-8?B?dUpEclJhNnZsUUJBMEVWUko3eWp0WU9HYTEydXF2aDUya3ZlTkJiN2pyNS9J?=
 =?utf-8?B?eU1LcGdMdzBETFNkN2ZSMVlWSlVqVnFTQU1pcmRZelhmVXpLRW8vTTF3Q3lC?=
 =?utf-8?B?SUJpalBmNi84VklGQXVMM3NuNjZNWFNpZkF2bEp0QnJWUk90aDBqVm9qU3l5?=
 =?utf-8?B?NmlQNmt6dytuTnFhMHAxTS8xQmgvUmI1cUFBRmJ1ZlBNYjRQMWhEeFQxTGsr?=
 =?utf-8?B?TzBDWVJ3WEc5dTFuL1RJNkdRQVVjOEZZTVNoeC92a20rODNmOWJBdFhxZjQ0?=
 =?utf-8?B?KzUrdVhqUUZSS2lxVkJhMzhFamd5Yzl1eGtzR0dVWGJXSVpSZndJR3BtcVB1?=
 =?utf-8?B?UUFGMVUvdTVSTTJRang0djRLNzBTRzJUOVJhdi8veVNMKysxc2J3aUNZb0FV?=
 =?utf-8?B?QWtaWnV3RGJpU2wvVE44dEE1ZStZNUdyTWNUZFMvREJjbVA0cjZiM2ZyZ0NY?=
 =?utf-8?B?TzV3NE83MC9DRUJmUVdMMHdEUzRVREZDNWc5KzlYMVcrWmRaZmo2MUF5TWVJ?=
 =?utf-8?B?V2pZekJzdFRuZkc4VEloZmY5NmNZaU5TVU5CU1kzS1UwbDFuNGtyZ1NvVUk2?=
 =?utf-8?B?WjBCQWRTaWpUU0hDZ2Y1L2I0YzBHVHZBK0lDRTgvNEV1K2lFeXRqZFhRSTR3?=
 =?utf-8?B?TVVEdVJRZkI1TzU2UHFwU1U3SlhGNURoVTJmSG1hU0VlM0phZDRDSDNHdkpX?=
 =?utf-8?B?R2hZQktSRmluM29HWi93ZE5LT3VvVjhXS1pLdFp6cGllOUI3RHRkd1JyZkJ5?=
 =?utf-8?B?YmVwOFBKbWY0OXBocWRwRXp4NG44NmxLbjhRSnl1djVjWkNFNXNBZmE1LytP?=
 =?utf-8?B?WkI4UjV6bzltd3lJaVd2Y0lrR3d1bW15TjY5YXFaQkcxMFQzaWNEcU9iNHhP?=
 =?utf-8?B?U0prSDRtL0lmU25Tcm9hR0xENHY0QmRnRTRETnBDbHBKTWkzTkRSMExSWHFM?=
 =?utf-8?B?ZWpsM2FLek9wUkdwcW51UlZWbkhucTVWanlxMmpCN1FQamxEMzczMSt0K3dT?=
 =?utf-8?B?UktGNlhLTTlxQTlDYnpIQXhBRHpRL0FEcWw5cXk0Ym81dHZRTzJoYmMwMVF6?=
 =?utf-8?Q?marfKgWXAKinD3w4Zc4RuX/k4Htl3VaL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1ZGSU5EekpqSy9MSzBUd0svOVZJVm5xdFdTUmhtenJPK2xXNmdOcm9KUkpx?=
 =?utf-8?B?b2F5dDcvU250dnpwVUpsZHZrcDR5dE42VlV1NGFSd3RvWVFYMzVlY2Zudk5h?=
 =?utf-8?B?STdYREREU3BRRVJqaEYwTmllYnY2VU1GWGpFbzUza3pMOUVtN3B0WER0NUVM?=
 =?utf-8?B?K3NiTzJMTy9hMXRKUG1RL09IVWVEcjZVT090NmVORVZTejBKeDZVbXFvbXdh?=
 =?utf-8?B?K2Urc0tYK0VleTVJa053M2xuc0RzWjB4blppQWV1NHZPSlh0ZXMwcFNwVmtW?=
 =?utf-8?B?S0pWQThJdkJleHNIMW9FU3RDR3BtdHBnUmpOcW5na2RQTjJJTE5CNVRtblZw?=
 =?utf-8?B?R1p2UGNjNmhkYXBKWVZMQ2UzN21HWEw0ajg4UEVDaTZQeDJ6R0ZZVXhkOUtT?=
 =?utf-8?B?bi8rRXpTYzR3UXhPazg4NGxmUUFQUHE0SE5aS3RDZXROSXk2WkdEMjhHNTVk?=
 =?utf-8?B?dDVEYmt1S256ODF3UjEyYnRwUEIwcXJGbUZ5Y1ZzTzBhOHdHU01oc2lmL0VB?=
 =?utf-8?B?emExSkIxNG5iUk9BeDRNV3V0blh3WDZ3SUxXbmpJbk5FVndPQ0dLQTlsWWpQ?=
 =?utf-8?B?QlBOTTZmdEpyN214STdtcUlaVkRMVkxhWllGdFZLamQ5aXRmdTNvVkFVekZN?=
 =?utf-8?B?UGIxVTdWSGFoVnF3TW9xTEc1Zm9sbmhGUC9INkZZQVdNejdwMkdTTSt0UDlB?=
 =?utf-8?B?WnVzNWNnWjVvRlRzVVVxT1BURzloQkRJV1hZb2JKVW1EZEtYNlFOckNEdmZM?=
 =?utf-8?B?V3Q2MmZKVHlPeXdmZyt2RWNhQjNjYStZN242a2ZuZU1PRzdocml3YitHd1c1?=
 =?utf-8?B?bG5QdlFMTXdpajhHOHA1RFpnZWhCNDZYT2o5dXp2OExPMHNibGJyR2kyWEt5?=
 =?utf-8?B?OGhGNkZiT29MMWxuMEpnRnZnWmdHUytjaDZBaDltZHpVb0NWT0FrY1ZSTmta?=
 =?utf-8?B?NEVmWEh1OFozTENxa3ZkaVlyd2VNQjZ2YndhS29lSk9zeTI2RWQxQTZTcHhz?=
 =?utf-8?B?VFpuNlFZSVF0SHg2NkJyWWtiMEl2YnRGMXgzWVFQeUdqYTV6Tmtpa0pkYjJi?=
 =?utf-8?B?WlhkcXpuTE1iRnY3WFNKTzBoQ0lBSTJOdys3eTFoZ3lZUUwxbHlDaEY3R3FZ?=
 =?utf-8?B?am81aGx6TFgxT1JpVURNSENET0hTb0VHb2FSYXJDdnhCbUw3allEZ0RvNFB3?=
 =?utf-8?B?d045eGk1MGhVRDd6YlNldHo2UVVVaWFhR0tyOWJCTVR5WWpnLzIzQVEvVXBZ?=
 =?utf-8?B?QkFrbVVqWW1lcEFrZFg5N3QwZnVkSFNqWXFkRmtRMFI3SlExaVE3Y3MrSldT?=
 =?utf-8?B?WWFhSFVlT2dtdlpUenY0R1NKcFRuZU5QRFVLNW9seDlpalYxL2dIdmFVU0NW?=
 =?utf-8?B?L1NWR0J6ME55UjE0ZXFjdjlkZmRPMFNMRkFHeGsvNjdxR01LSkozcmFaR2N4?=
 =?utf-8?B?TmpQWGdhLzYyd3lweWhDNEdsVnNCYU90ZURGVTU4UWIvWENZemJSdWk2RkVu?=
 =?utf-8?B?N2JrcTcrRWI1djZZa3ZDVzBYWmlhMTZRQTFKKzJvM3pRMkFIYWRwVGVRNFJP?=
 =?utf-8?B?L0p0WW9ndzNNb242Y1RVdHFKUno2UUZ6a2F0YkVLdzhiQW12ZTdzays0VFhR?=
 =?utf-8?B?QWZTc3pOQ0ZLM3lpdy9JNFZXekVGOXVOVXlJVU1oUW1heFZvdG53NDlITE95?=
 =?utf-8?B?eFFPdEMva252U25xSzhFMXVrazRUNnZZWjdCS2lDMGtsTVo2eHVia0ptckdz?=
 =?utf-8?B?bnB0VUx5d3BmNkpsYSs2aVFhZUNnZWo5UldJK1BOR1R5ZlJ0bnZtSithMGpp?=
 =?utf-8?B?c0NNY2ZXbXNWVGlobitnSWdjMlZhc0hma1FxRG15V3AxMkJrN25TeS9oZWVl?=
 =?utf-8?B?cDh5R0lOQ21nUCt1Z2xPaGhRVUc1cVBJb0NCTXlZekd1L1dRa01Wc3JWRURK?=
 =?utf-8?B?bWEzU09ZaXNnQW1kQnNHRGRNVnpOdm1ocW13UVYvZEc1YnpPZVpuZTAzVC9R?=
 =?utf-8?B?QTVWQnBlK2oxQjZWb2FJQzU4Y082Yzl0WnoxTkh3d2NqbmN4cjBaZlIrelFH?=
 =?utf-8?B?Z0JKaUE4cURSQ2REVUMrRUc1ckh3bVNPUGs5NDJHRURPWGFqQUI2YW10NDBD?=
 =?utf-8?B?cVNJV0xmaGVlMW5FT2ZkMDJuT3hGbS9hNE1PNWdqeGZMYlh0dGZWMFplU2xM?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79598efc-4372-4b1c-64e4-08de22dfd361
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 18:09:45.3766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3+/LMe40g0JnF1a18hQHHnTpz16+oYd5bMz/yAjqmZjpnWkTt5QDYqAVjXJM5o4V2AK41tBMb5s2WZvRhICsCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2D9C959A2
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

Quoting Matt Roper (2025-11-10 20:20:45-03:00)
>Use scope-based runtime power management in the SRIOV code for
>consistency with other parts of the driver.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

I think we can drop variable ret in functions:

* xe_pci_sriov_configure()
* xe_sriov_dev_attr_store()
* xe_sriov_vf_attr_store()

With that,

  Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_pci_sriov.c             | 3 +--
> drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      | 6 ++----
> drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c        | 6 ++----
> drivers/gpu/drm/xe/xe_sriov_vf_ccs.c          | 5 +----
> drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c | 3 +--
> 5 files changed, 7 insertions(+), 16 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci=
_sriov.c
>index d0fcde66a774..4b16748fe2ed 100644
>--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
>+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
>@@ -212,12 +212,11 @@ int xe_pci_sriov_configure(struct pci_dev *pdev, int=
 num_vfs)
>         if (num_vfs && pci_num_vf(pdev))
>                 return -EBUSY;
>=20
>-        xe_pm_runtime_get(xe);
>+        guard(xe_pm_runtime)(xe);
>         if (num_vfs > 0)
>                 ret =3D pf_enable_vfs(xe, num_vfs);
>         else
>                 ret =3D pf_disable_vfs(xe);
>-        xe_pm_runtime_put(xe);
>=20
>         return ret;
> }
>diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe=
/xe_sriov_pf_debugfs.c
>index a81aa05c5532..21eafe333cb5 100644
>--- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
>@@ -69,9 +69,8 @@ static ssize_t from_file_write_to_xe_call(struct file *f=
ile, const char __user *
>         if (ret < 0)
>                 return ret;
>         if (yes) {
>-                xe_pm_runtime_get(xe);
>+                guard(xe_pm_runtime)(xe);
>                 ret =3D call(xe);
>-                xe_pm_runtime_put(xe);
>         }
>         if (ret < 0)
>                 return ret;
>@@ -157,9 +156,8 @@ static ssize_t from_file_write_to_vf_call(struct file =
*file, const char __user *
>         if (ret < 0)
>                 return ret;
>         if (yes) {
>-                xe_pm_runtime_get(xe);
>+                guard(xe_pm_runtime)(xe);
>                 ret =3D call(xe, vfid);
>-                xe_pm_runtime_put(xe);
>         }
>         if (ret < 0)
>                 return ret;
>diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/x=
e_sriov_pf_sysfs.c
>index c0b767ac735c..f0777976335c 100644
>--- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
>@@ -394,9 +394,8 @@ static ssize_t xe_sriov_dev_attr_store(struct kobject =
*kobj, struct attribute *a
>         if (!vattr->store)
>                 return -EPERM;
>=20
>-        xe_pm_runtime_get(xe);
>+        guard(xe_pm_runtime)(xe);
>         ret =3D xe_sriov_pf_wait_ready(xe) ?: vattr->store(xe, buf, count=
);
>-        xe_pm_runtime_put(xe);
>=20
>         return ret;
> }
>@@ -430,9 +429,8 @@ static ssize_t xe_sriov_vf_attr_store(struct kobject *=
kobj, struct attribute *at
>         if (!vattr->store)
>                 return -EPERM;
>=20
>-        xe_pm_runtime_get(xe);
>+        guard(xe_pm_runtime)(xe);
>         ret =3D xe_sriov_pf_wait_ready(xe) ?: vattr->store(xe, vfid, buf,=
 count);
>-        xe_pm_runtime_get(xe);
>=20
>         return ret;
> }
>diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_=
sriov_vf_ccs.c
>index 797a4b866226..e1cdc46ad710 100644
>--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>@@ -463,8 +463,7 @@ void xe_sriov_vf_ccs_print(struct xe_device *xe, struc=
t drm_printer *p)
>         if (!IS_VF_CCS_READY(xe))
>                 return;
>=20
>-        xe_pm_runtime_get(xe);
>-
>+        guard(xe_pm_runtime)(xe);
>         for_each_ccs_rw_ctx(ctx_id) {
>                 bb_pool =3D xe->sriov.vf.ccs.contexts[ctx_id].mem.ccs_bb_=
pool;
>                 if (!bb_pool)
>@@ -475,6 +474,4 @@ void xe_sriov_vf_ccs_print(struct xe_device *xe, struc=
t drm_printer *p)
>                 drm_suballoc_dump_debug_info(&bb_pool->base, p, xe_sa_man=
ager_gpu_addr(bb_pool));
>                 drm_puts(p, "\n");
>         }
>-
>-        xe_pm_runtime_put(xe);
> }
>diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c b/drivers/gpu/d=
rm/xe/xe_tile_sriov_pf_debugfs.c
>index f3f478f14ff5..7f97db2f89bb 100644
>--- a/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
>@@ -141,12 +141,11 @@ static int NAME##_set(void *data, u64 val)          =
                              \
>         if (val > (TYPE)~0ull)                                           =
             \
>                 return -EOVERFLOW;                                       =
         \
>                                                                          =
       \
>-        xe_pm_runtime_get(xe);                                           =
             \
>+        guard(xe_pm_runtime)(xe);                                        =
        \
>         err =3D xe_sriov_pf_wait_ready(xe) ?:                            =
            \
>               xe_gt_sriov_pf_config_set_##CONFIG(gt, vfid, val);         =
       \
>         if (!err)                                                        =
        \
>                 xe_sriov_pf_provision_set_custom_mode(xe);               =
         \
>-        xe_pm_runtime_put(xe);                                           =
             \
>                                                                          =
       \
>         return err;                                                      =
          \
> }                                                                        =
        \
>--=20
>2.51.1
>

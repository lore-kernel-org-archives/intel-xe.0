Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD59C8303C
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 22:09:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17E110E0A6;
	Wed,  2 Jul 2025 22:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AlgFFmuG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D55F210E0A6
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 22:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751494179; x=1783030179;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qfuriuqDpUlskhsH8yubXfPlBVG7igTU+Tdr6DAU5Xc=;
 b=AlgFFmuGI1c+phGRxfE4FkZEM3fT9EZ1h1oSDJUM+JigVifmwtR+UUem
 rc6BSBlq3dG+dIzW5QFlS/YwnnpJjtHs3y24pZJej1bdygYgWDgB+Tv5T
 LsSB7Bj4+eFgjmCLxghDqaycfzwToO/pBwIzK+yrhOFomLucP6+AAr0GT
 t4VsHO3iFwq/FdF3zhOYzLTm+cMpWlsA19BPSz4zbmtSt12s0eKXP47+w
 BrFIlA9sP7NDxpLZZApJUcFoYcSUxSvvR/43JCySqTlRI7a9wq4BB5iyw
 iGkFOFeJzfi5bjjKxItCs+4azZ3MW5hAr33AQpe6prpYES+oOMjdDJXvI Q==;
X-CSE-ConnectionGUID: /duFYVTfSca3DvKDhnwHPw==
X-CSE-MsgGUID: s0yBAbMJTVq+18NUfZS08w==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="65154510"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="65154510"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 15:09:39 -0700
X-CSE-ConnectionGUID: d8Jg+tcXSXeMeIGCdILtaA==
X-CSE-MsgGUID: wSjf1ofcQZWZ0skL2/lACQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="158763054"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 15:09:39 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 15:09:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 15:09:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.85)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 15:09:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lS6i3uXX/ZCo1s5/XfIechmFyq3f+EhJ6CSoSKqsPFoKLRXUKd9dUfUYKRr55OAnpPSYIYFC0dKOw1+aZyhr4bXmrwmz7iiaEgaaeAL5blmV9/0jewNZdE8D0giYyso1oHKBBnDPa6Eui1Q9jJJqC6RWmOodSZcoNpzsrCIQUpnroOYYpgobmg80ggx8yZx9gNew6fCaP4BNLj9iSYnPZGyT5WhDnsmMG08o+q7Q8Fq04oU1hib6aGFvXJFcH3R9BlYXW0rSelcIEwY/3OuhlvmJUtAlu3XvGLPguREPeJ1fcWIQfgiduIGnLvyvONxdvqUhMQXfwym833qQJ1jSAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQQB1+r0NqykZC4YiyNLhxz9nnt17/CW58xCZQ0yNpA=;
 b=WyXLxk4TrW6Q5n8W/oQ2ehCIOPYo92NrQQBruCJlcbzEn1ncepcJhBsfLl7RDSLvSt3LnoJAv58Y6/H8tevacWwQyJqGytJix3FI2di76YiPWfDosK/QR5VzS+CDSVABkSJpX1xvu+1lQFtulOGSf+2BU6FqdS+UmVaqIyjOoD7gFQiwE8BTcUqS0RC2xQPddWE758RFxVDyZiasWBFjCz/gmGwRJrdtaebL/HOJXeVUs/I30geDX+KQlF0mcv6hj43k0hfTu0zagWScHzZCXKpVz6Kgi7R0a3RFXev+GhLP799Ji0lyh1tFx2cKwFqDfIOUAaUZ0V121wat1qLLOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by PH7PR11MB7148.namprd11.prod.outlook.com
 (2603:10b6:510:1ef::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Wed, 2 Jul
 2025 22:09:22 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::7ac3:745d:bc52:83e8]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::7ac3:745d:bc52:83e8%4]) with mapi id 15.20.8835.023; Wed, 2 Jul 2025
 22:09:22 +0000
Date: Wed, 2 Jul 2025 15:09:19 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>,
 <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v5 1/6] drm/xe: add xe_device_wa infrastructure
Message-ID: <aGWuD5F4Vqmj7MJc@msatwood-mobl>
References: <20250702193036.1417416-1-matthew.s.atwood@intel.com>
 <20250702193036.1417416-2-matthew.s.atwood@intel.com>
 <svdso2kdn3bgu5gu43lbwj7bnzqd6hsbqzmbxpuydvqocvwjan@pj4pyj36kir4>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <svdso2kdn3bgu5gu43lbwj7bnzqd6hsbqzmbxpuydvqocvwjan@pj4pyj36kir4>
X-ClientProxiedBy: MW4PR02CA0015.namprd02.prod.outlook.com
 (2603:10b6:303:16d::6) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|PH7PR11MB7148:EE_
X-MS-Office365-Filtering-Correlation-Id: 38890b62-44cc-4da8-6a99-08ddb9b51957
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TDJtZCtXVWVIbGVvem5uQWRCMXEyQW1QcDJWa3VwU0xKMTd2Mkk5bVlrZ2pZ?=
 =?utf-8?B?UUgvQnlLTVhRUWtYYVRZeU9OYktPd2ZNd013TzRJVnpUTmtEQThlK2IvNUc4?=
 =?utf-8?B?SlJia1YrWTBpQXh6YW5tcVVOMmRBZXp1TFNSTXJIalI3cTdqelh0cEEwd09l?=
 =?utf-8?B?WDI1ZXMyMU5Zd1krTjVKR0ZmWWpFWWZlM3hKTW5kNW5XWC9SbXBjOFkrZCtk?=
 =?utf-8?B?ZXhGTkZkcjA5ZU9zSndJV0pCdzgyTHkzUU1uRHJpU1p1WFlxVlFab0RhNEtX?=
 =?utf-8?B?cGpHWnczZVozOXRLc2Y4WkNGeXJFM2tXWGc4c3VQVGZiYVFmRnM0SnNNY08w?=
 =?utf-8?B?eGlaS1g0NW13ZjlhSVE2R2FoeXcvWk8xTXZKeVMwU0oxMGdKTzRNWUFyVkR3?=
 =?utf-8?B?TmJuMW1lOXBacUJLOEgwc1BQcFhtNTlHQktzbis4VldEWkdQYyswNXdJdGJz?=
 =?utf-8?B?Y2RLc1RLZDBSWUhORjZwQktjeWd0VUhJblFKSWUrLzg2c3hzcVBvaUI4YkdX?=
 =?utf-8?B?UXN5ODM3alpYaklINVBybVpPV29TbGJNR1VlelErRjVUK2tQMlIvNitDMHg0?=
 =?utf-8?B?WHJBRmZhS29VSkUrY29aRHg0djFBQlVuRzRZaGhLc0o5bWdwWkFxT2o4U3lR?=
 =?utf-8?B?bFpBbzYrVGFpQ01TQmZ5NE1PK2d0bGdhNm9XWEYvby9DK1kwbjVHekFVS1FG?=
 =?utf-8?B?THZ1dnFXWkJ4REFLTk1uaER5WkpYSk83RVpINWNBa3FjRlZsazlQS3hlQkJt?=
 =?utf-8?B?MldaSjFtTkZGQndHQmFMZzRFaUpra1ZZNkJkT0FDTldlV1lTR2hBTUtNaGdS?=
 =?utf-8?B?Skl4R2d4bDhEV3dXZDZZU2VzeHBnekg4Z1lzVW9NTEhEMWpZajhuVG9QUnlu?=
 =?utf-8?B?TkNzMG96T0ExaUxHaVFvZXVkYmpaT3dibXBUTEd5OGJkM0RYRmxoMHVQMDlX?=
 =?utf-8?B?SlNIZzBhRFVXQkMrRWVINWhkZkc1QW04Q2x0aFlhbjBwRGlFQzEyL2FMRFl4?=
 =?utf-8?B?cnlIODFENTdiS2E2VXAvTVlKZ2gyUStrUllEdEdQdTFrN2JlUUxLbjliUnMx?=
 =?utf-8?B?ZW1DTGdzN0U1YTRNcmxKWXBFMy84UkJya3JUWXUrV0tzYUJBYXVwQnRmTjdF?=
 =?utf-8?B?M3g0SElObXl4SWhGbmxlSzBJdG5DRzl6VWx2Sy9kK1RQc2NIc05vb0k1T0Zq?=
 =?utf-8?B?WlFidjRPdXZjTUNBeW13OUVOLzh5K1daaGt5Ny9hZGkvN3BOamFTMmtnYmN3?=
 =?utf-8?B?YkU1VVlxUlpxUDBNcmJFN05icW9WdytYVGpUQ0FjRHluMUFtVWEvU29rdlpH?=
 =?utf-8?B?OXB1NFpGckU5bm95a1U3RnA5ZFd5Z04xTkZoSVhEV3FEOC9EemVxUVUzY29o?=
 =?utf-8?B?bndkdjNvN2l5QzJaVVJYcWo0TUY1S2NVeFUwT09aU1FNT09PeTg0aiswRlkx?=
 =?utf-8?B?QWVETkE3UnR6aWlKbmljNXBSVEdHSlhXcVJlclBaUGYvWjc3Y3RRRVlPNk5C?=
 =?utf-8?B?ZUMwSjYzRzF3QlVoa2xrRXNKOWhrQ1NCZXd0bVhzUVYza2IvSWVYdW1FdXRC?=
 =?utf-8?B?SHJUOXRrWGkyRVJJbGZRbXQ0QUVXVXlKQU1VVm1QUTVtZ0xLSk90S0doU2lI?=
 =?utf-8?B?RXJaendCMlczV0MvOE4wQ0hNRUM3VVprbytaYm9acmhMQTBUQjVaNnhna1NM?=
 =?utf-8?B?L1FiblYzRGVTazF2Zk5lUWo5UGpIYVF0K3J5K3d0b0poRnkwNVJIQWxyV0Rn?=
 =?utf-8?B?NlZPcW5tVXBpeUkyclIrRXFRZE1OUE5hblZldzRManJhR2ZWYnVERXV0YUo2?=
 =?utf-8?B?OXBJM3VkcnhiMUZQY094bTZiL0h2bzhNcytJeVpZaFpZZ3ZkUnlUSDh2eEd4?=
 =?utf-8?B?R3g5L0xVaHBiaTBMS1NadGZjVWNDN3RwV1hUdjdjclF5MjdlR25KR2xtRnQ5?=
 =?utf-8?Q?6xPwwmBYrSc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3hsMHRXeVZtME0zNmlDYk90VFoyK3N0NHRVZCtqenA2anFTZTJsUmxEVXAx?=
 =?utf-8?B?UTJiMUFWVFVObXFsQWhIeUpibnpIbFBFbmJ3bHNQVk9IeURHY3J2SnBzZzV3?=
 =?utf-8?B?WW9BdWZvUjlSSTZtWTZZYVhyLzcrZk5hVmxILzEwQTJsUDZEdFRXcDNjK0VZ?=
 =?utf-8?B?ZzRiblZBKzVJS1BTSlV2QWQyV1ZyZHE1Y3duT3ZLdWhxbkwwRmVFMnJITVJN?=
 =?utf-8?B?bEJkb1I5RUNrVmw4UUp5NlBJaUFoY1d1U0Z6VzgzUXhibkxURlRUcEFST1h0?=
 =?utf-8?B?bHpyTy8xQko3VC9BYU1zWGIzZTVzZlZKSDJiRjdqd0VWclVVbkRiV2xpd2ZZ?=
 =?utf-8?B?WVMwaTFIVnhoYXZyQmpaOHdnRGs3Wnc5elh3akRmUHhhdDVlYzdralFGd0Y5?=
 =?utf-8?B?YTFZL0VKVXhLYmVGQVdudlZuTlNuVTdRbmZiZjNUQUtiSk5lUis0Z3ZXQjJk?=
 =?utf-8?B?eStYd2d6ZFVTTUk2QisyTmFmd3J1NDQwZnhvVk91S1VlWTQza09NQUUrcmpY?=
 =?utf-8?B?ekhtYjRkYUNHRlluUEVlY243Tk5HYjBIWHlKNjFBUCtkNFJ0aEdWckp4QmdZ?=
 =?utf-8?B?NVFDcVRDYzdaOG54aHZNMXhERWFHd0s4U0p3b0JiQmdLWUtHWEU1WkpFYU5H?=
 =?utf-8?B?dE13OFNraW5NTFRRZnp3d3JnYVV3M0MxR1lhcmVPcGVESkoxZzlCYkdnQU52?=
 =?utf-8?B?RVduVlEyNitoYWNzSzBERmRjbUtvbnVaWUlHUk5xMWZtekIzSnFCZEpnRTFa?=
 =?utf-8?B?b1V0dTBaaUxadjFuNlhkTUEyRG1GQ0ppWnp1RjRrbk9CZ0pLYUNwTmFZVTNJ?=
 =?utf-8?B?ZmVBTFdvQkNJM1FxbXVXSldid0hGd2NmUHRmRmdWWURoeHd2eGhkOWE3WnA4?=
 =?utf-8?B?ZHFkSmNPai9VR3Fpd2k2VC9qT01pWWt0aldyMUIxR0t5ZmJLUEVjZlQ5WFly?=
 =?utf-8?B?b3dOMDI4Mmd1akR4VExkSHN2QlppSHVKTFI1OWZzOGZkQ3JSdTJkdUk1dWVC?=
 =?utf-8?B?U0U1TFM2WTk1QzlkVWlnVjAyUWd1UENtRERtaUdRWXg4Z2hIcDNnR1VpMkMr?=
 =?utf-8?B?UkcvbUFXT3V5WWNlSnFIcFNkU1dBMUdEck9KMm5temYvSXExaGlyQ2xqUGFx?=
 =?utf-8?B?ci9qL0s2K0cyM01udCtJVkRTTTV5Q3lZdHJBbWZiSzVWY0x0RUJUYXRWZ1pV?=
 =?utf-8?B?amF6djFwMnBuRnAyZzIyWVdsay9IS1hicTlWRlBZZUFxbDlySERYT2VzK05G?=
 =?utf-8?B?R3JKSEtzd2psS3BzMEUzNGdCd2hZKzJYMG9ic2x5UGNycjRrTElkWlhHSU5j?=
 =?utf-8?B?eDRHL2hpOWgzV0t5MnJwZmVvcG5INDBvRXlMc09aVlpabzR4YzhZVUEzMXhT?=
 =?utf-8?B?N0paT25tUk9QbzZYOEZjU3VGZnlhVjVSZEtKUFdLSFNIclgrdTJjSWh1aDl4?=
 =?utf-8?B?eGN3Z20vdTUzWVFPVzZhMnpwR3RGelArNVJKRFFacWptQndtdWtuR3FzNDV3?=
 =?utf-8?B?MlUxanhaV3VpeHlHN1h0RFBJZUI2WlZjU2pHS1VtZStzdnJWVVlEaUdWMms5?=
 =?utf-8?B?L2JCTGdhdThCTzR2Qmt4bzErbzZHYnNDZXRleWdmZlpaVzJQRllaN201OXlp?=
 =?utf-8?B?em5wM3BVd0R6L2JJcE52ZFdVTDlyK1kxV2wyNEV4TmY1TGxPZ2tJR3FqTDZH?=
 =?utf-8?B?N0FjQklvS1RoanJ3T3phc0l0bXEzeC90M0g5SGZrQkRBVmZBa2N6V3MrdzBa?=
 =?utf-8?B?dW04enluVU92c3BPYWduQVBEaXIrNjNLMDhqNGFFeVdTL3pRdWdXeDZSME5R?=
 =?utf-8?B?TUMrWGkrdWM1b3FISC9udlNsdWN6bXpkbnZMaXgwWktQY1RZalNEcTliL3A0?=
 =?utf-8?B?VEsyZUtJTVFkQ2MwMENEdGE4UnRJOStnQkNwOWtwWjN0YWhZS040U3dkQ3p0?=
 =?utf-8?B?eVdFelFkQ1dOa3o0Yk8zTmkvNVZ4UktVbWxCVm12dkQ5dXhNK0VaTXI0T1Vk?=
 =?utf-8?B?NTlRdzNxYWoyalo2VmJ3M1lEY3VZbWtwa1NOWEJJVzA3a1ZZb294bmU5L1g0?=
 =?utf-8?B?TStnTk85Ri9OVmFUUGFONEZsUDVLYndlRkNrTDEzc0hkNlJhekhFa3NYT1hr?=
 =?utf-8?B?MGpkMmllZHZnUm5vSWpxbno4WHJWWUVML3MraG5pem1UT2Rxb1czNlFnMmhk?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38890b62-44cc-4da8-6a99-08ddb9b51957
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 22:09:22.3567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6lj0b8zSZswN9C88MBMfA0wmyh9PqV249MxTLahgX1ePrAu1Ru7y0iOAwLMHFTeKI2R1nWerPAQ81L2Q5ibeFHyipe9bKlz2yKWRLayqwgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7148
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

On Wed, Jul 02, 2025 at 04:57:34PM -0500, Lucas De Marchi wrote:
> On Wed, Jul 02, 2025 at 12:30:31PM -0700, Matt Atwood wrote:
> > There are some workarounds that must be applied before gt init,
> > wa_150154044425 for example. Instead of sprinkling them conditionally
> > throughout the driver as we did for i915 generate an oob.rules file
> > reusing the RTP infrastructure to make these easier to track.
> > 
> > v2: rename xe_soc_wa to xe_device_wa
> > v5: derive prefix from argument rather then hard coding the values.
> > 
> > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > ---
> > drivers/gpu/drm/xe/Makefile               | 11 ++++++-
> > drivers/gpu/drm/xe/xe_device_wa_oob.rules |  0
> > drivers/gpu/drm/xe/xe_gen_wa_oob.c        | 38 ++++++++++++++++++-----
> > 3 files changed, 41 insertions(+), 8 deletions(-)
> > create mode 100644 drivers/gpu/drm/xe/xe_device_wa_oob.rules
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 1d97e5b63f4e..48d4aa9d4ecc 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -21,6 +21,15 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
> > 		 $(src)/xe_wa_oob.rules
> > 	$(call cmd,wa_oob)
> > 
> > +generated_device_oob := $(obj)/generated/xe_device_wa_oob.c $(obj)/generated/xe_device_wa_oob.h
> > +quiet_cmd_device_wa_oob = GEN     $(notdir $(generated_device_oob))
> > +      cmd_device_wa_oob = mkdir -p $(@D); $^ $(generated_device_oob)
> > +$(obj)/generated/%_device_wa_oob.c $(obj)/generated/%_device_wa_oob.h: $(obj)/xe_gen_wa_oob \
> > +		 $(src)/xe_device_wa_oob.rules
> > +	$(call cmd,device_wa_oob)
> > +
> > +
> > +
> 
> drop these several newlines.
Ack
> 
> > # Please keep these build lists sorted!
> > 
> > # core driver code
> > @@ -340,4 +349,4 @@ $(obj)/%.hdrtest: $(src)/%.h FORCE
> > 	$(call if_changed_dep,hdrtest)
> > 
> > uses_generated_oob := $(addprefix $(obj)/, $(xe-y))
> > -$(uses_generated_oob): $(obj)/generated/xe_wa_oob.h
> > +$(uses_generated_oob): $(obj)/generated/xe_wa_oob.h $(obj)/generated/xe_device_wa_oob.h
> > diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> > new file mode 100644
> > index 000000000000..e69de29bb2d1
> > diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> > index ed9183599e31..341840926f60 100644
> > --- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> > +++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> 
> All the changes in this files should be a prep commit: they can be done
> regardless of having device_wa_oob
So split out the make file change in addition? or move the makefile
changes to the following commit?
> 
> > @@ -18,8 +18,8 @@
> > 	" *\n" \
> > 	" * This file was generated from rules: %s\n" \
> > 	" */\n" \
> > -	"#ifndef _GENERATED_XE_WA_OOB_\n" \
> > -	"#define _GENERATED_XE_WA_OOB_\n" \
> > +	"#ifndef _GENERATED_%s_\n" \
> > +	"#define _GENERATED_%s_\n" \
> > 	"\n" \
> > 	"enum {\n"
> > 
> > @@ -52,7 +52,7 @@ static char *strip(char *line, size_t linelen)
> > }
> > 
> > #define MAX_LINE_LEN 4096
> > -static int parse(FILE *input, FILE *csource, FILE *cheader)
> > +static int parse(FILE *input, FILE *csource, FILE *cheader, char *prefix)
> > {
> > 	char line[MAX_LINE_LEN + 1];
> > 	char *name, *prev_name = NULL, *rules;
> > @@ -96,7 +96,7 @@ static int parse(FILE *input, FILE *csource, FILE *cheader)
> > 		}
> > 
> > 		if (name) {
> > -			fprintf(cheader, "\tXE_WA_OOB_%s = %u,\n", name, idx);
> > +			fprintf(cheader, "\t%s_%s = %u,\n", prefix, name, idx);
> > 
> > 			/* Close previous entry before starting a new one */
> > 			if (idx)
> > @@ -118,7 +118,26 @@ static int parse(FILE *input, FILE *csource, FILE *cheader)
> > 	if (idx)
> > 		fprintf(csource, ") },\n");
> > 
> > -	fprintf(cheader, "\t_XE_WA_OOB_COUNT = %u\n", idx);
> > +	fprintf(cheader, "\t_%s_COUNT = %u\n", prefix, idx);
> > +
> > +	return 0;
> > +}
> > +
> > +static int fn_to_prefix(const char *fn, char *prefix, size_t size)
> > +{
> > +	if (!strncpy(prefix, fn, size - 1))
> > +		return -ENAMETOOLONG;
> 
> I didn't suggest using strncpy(). If you do, then you need to adjust the
> error handling. There are 2 problems here:
Ack.
>
> 1) strncpy() doesn't return NULL on error. See CAVEATS section
>    in strncpy(3) or strlcpy(3) that also documents strncpy and its
>    return value:
> 
> 
>    strcpy(3)
>    strcat(3)
>    strncpy(3)
>    strncat(3)
>           The dst pointer, which is useless.
> 
> 2) prefix is on the stack in the caller, so it doesn't necessarily
>    ends with '\0'. So even if you copied at most size - 1, the last
>    char may not be 0 and you will have an infinity loop below.
> 
> Those 2 could be fixed by doing this instead:
> 
> diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> index 341840926f602..ed550dca5f439 100644
> --- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> +++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> @@ -125,7 +125,7 @@ static int parse(FILE *input, FILE *csource, FILE *cheader, char *prefix)
>  static int fn_to_prefix(const char *fn, char *prefix, size_t size)
>  {
> -	if (!strncpy(prefix, fn, size - 1))
> +	if (strlcpy(prefix, basename(fn), size) >= size)
>  		return -ENAMETOOLONG;
>  	for (char *p = prefix; *p; p++) {
> @@ -168,8 +168,10 @@ int main(int argc, const char *argv[])
>  		return 1;
>  	}
> -	if (fn_to_prefix(basename(args[ARGS_CHEADER].fn), prefix, sizeof(prefix)) < 0)
> +	if (fn_to_prefix(args[ARGS_CHEADER].fn, prefix, sizeof(prefix)) < 0) {
> +		fprintf(stderr, "ERROR: invalid header name: %s\n", args[ARGS_CHEADER].fn);
>  		return 1;
> +	}
>  	for (int i = 0; i < _ARGS_COUNT; i++) {
>  		args[i].f = fopen(args[i].fn, args[i].mode);
> 
> did you find any issue with strlcpy? I think it's available on all
> toolchains, but maybe we need the workaround by including tools/include/linux/string.h
> I tried the diff above locally and it worked for me though.
strlcpy isnt currently supported in the distribution recommended for
simulation (ubuntu 22.04). Using this would cause team members that are
using recommended distro for simulations unable to build the kernel.
> 
> Lucas De Marchi
MattA
> 
> > +
> > +	for (char *p = prefix; *p; p++) {
> > +		switch (*p) {
> > +		case '.':
> > +			*p = '\0';
> > +			return 0;
> > +		default:
> > +			*p = toupper(*p);
> > +			break;
> > +		}
> > +	}
> > 
> > 	return 0;
> > }
> > @@ -141,6 +160,7 @@ int main(int argc, const char *argv[])
> > 		[ARGS_CHEADER] = { .fn = argv[3], .mode = "w" },
> > 	};
> > 	int ret = 1;
> > +	char prefix[128];
> > 
> > 	if (argc < 3) {
> > 		fprintf(stderr, "ERROR: wrong arguments\n");
> > @@ -148,6 +168,9 @@ int main(int argc, const char *argv[])
> > 		return 1;
> > 	}
> > 
> > +	if (fn_to_prefix(basename(args[ARGS_CHEADER].fn), prefix, sizeof(prefix)) < 0)
> > +		return 1;
> > +
> > 	for (int i = 0; i < _ARGS_COUNT; i++) {
> > 		args[i].f = fopen(args[i].fn, args[i].mode);
> > 		if (!args[i].f) {
> > @@ -157,9 +180,10 @@ int main(int argc, const char *argv[])
> > 		}
> > 	}
> > 
> > -	fprintf(args[ARGS_CHEADER].f, HEADER, args[ARGS_INPUT].fn);
> > +	fprintf(args[ARGS_CHEADER].f, HEADER, args[ARGS_INPUT].fn, prefix, prefix);
> > +
> > 	ret = parse(args[ARGS_INPUT].f, args[ARGS_CSOURCE].f,
> > -		    args[ARGS_CHEADER].f);
> > +		    args[ARGS_CHEADER].f, prefix);
> > 	if (!ret)
> > 		fprintf(args[ARGS_CHEADER].f, FOOTER);
> > 
> > -- 
> > 2.49.0
> > 

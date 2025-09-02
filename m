Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EF7CA1005
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 09:59:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B7310E1C3;
	Tue,  2 Sep 2025 09:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hy0Y1Qx1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A7010E14F
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 09:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756807195; x=1788343195;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hidzpTwKttggphy4ljzvJbmhVYUfK1taM6ACCYJKqiA=;
 b=Hy0Y1Qx1sXRkUsknO0TyjGBYkrAJOivjqmYfRBlif0FkINWahEWqjHNu
 gtNu54gC868U3vMFEejOpro4sdk0KCghasag9oBHhNdZ14FAZlakeJOIp
 Zx9D/1dH+bQ6ST2W7IVTTI6IKzmRv1OfHfcmmYYCzKEAk+qRm8MLqT5+W
 5MpkuGTkBfyMXXHTdsZH/IlOL5SnzfP0164SbULICW+rkGZeOLnNw55sM
 XUW2Kx9qYrEOula0x0ynzjqBi7pN6Gs0PLiDy5INtp7K9r8f8N+TvBd4u
 IVtEI6dfhvLbF04x2BCJ3z/TjK0DPImKiGrY+rCTT64AqPisKOYVrV9s/ A==;
X-CSE-ConnectionGUID: zIyEB2vhSROfg+0UArNEBg==
X-CSE-MsgGUID: sYb4F1GXTYiEVzYe8bv18Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="76516154"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="76516154"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 02:59:54 -0700
X-CSE-ConnectionGUID: 2ZSy4ZvFRJazz8/tqTG0wg==
X-CSE-MsgGUID: zt1XD07UTgC6Lnk6rvQDdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="202167729"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 02:59:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 02:59:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 02:59:54 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.88)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 02:59:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QnAikRqa269EAPQV8UOW/bmXv93tIyAiztBoKJ9O5/Fz4B9lp5bs/vrEKtVS+lOJEpngFn/tm2ErAZcFro+jLsROnM+057bohmTnxt/tarfbKgdQODw8JiodA+kbFlBZ/xmoRQBafEwtgJzO8AlRXCkacb2+Y2jSKPfOj751cNBuBd5bWcZal2eTv5HB0xiBcj4WXyRiRQuKqL43eL1Sls0h4r4lbgh5tLN8R0sX4js2OK2OvfYGE57a4+AE7WcKRCfufHL8XBoCC5JRLgM59UXnF0LGeObpZkOtt4L4aCpoPfZOvTGwzSIFe+/yE3dexrqW6SfESzw4c+gUSACvfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3K1AB81hT6KNQPUlIMVP9InlbM3WuIlYTBbATWVZj0=;
 b=OKPmIPOeLSaKBSJxCpGFBFK0mA+osdBYRz1VlAvJxr4NqmTP43FelMNBqXC8jdLow/ImwfRkQqOabZMk5Ag+MRo99wz3qEJkCPdmXsgDPvXRqvfVpTKghMGOUCdfwZHe2eEMxRKSfSyHK3zSv2lTouvubzZTCRjw++jFi9Aq6N5EpWdHBcnOW5axWMi2+8ugW+g9U61lytfpYCCsBMMdNPxnIsUQScGuHXG3eU/kvSYKdi5mGarQ8zpnGf0x4mLz9wrue2KcEH4bCyb/iOjYbBTMyd0di1a9WU7dSA8Hw1Sw3P5zNGff79i18RJ3EqzPqrQQSGlj92yK/8wdMXQcrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by LV4PR11MB9490.namprd11.prod.outlook.com (2603:10b6:408:2e1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 09:59:52 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 09:59:52 +0000
Message-ID: <872954cc-c72b-4970-93f5-19bd4523247c@intel.com>
Date: Tue, 2 Sep 2025 11:59:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] drm/xe/vf: Enable CCS save/restore only on supported
 GUC versions
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Andi Shyti
 <andi.shyti@kernel.org>
References: <20250902093254.16554-2-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250902093254.16554-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0210.eurprd08.prod.outlook.com
 (2603:10a6:802:15::19) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|LV4PR11MB9490:EE_
X-MS-Office365-Filtering-Correlation-Id: e96b28ed-8a22-49d8-abcf-08ddea0775ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTc5WjQ5ZFNHQkJ2MFpzc0prM3VoRW9UQlVOeEs4ekFYTHJSRkxvLzExVGNq?=
 =?utf-8?B?VmNoY2RWUWtrWkFuY1RsUlpRWU9KK2xkU3BxRm5jaEtQNlhVQWt0ZkhpRHRR?=
 =?utf-8?B?UGV4MU5QY0hFUjd0ZmFRR2NFRC9tOTVCM0RJemVSOW5KbWk0MU9HZ3R3WFlE?=
 =?utf-8?B?S0RDZWN1YmNTQ0ZsS2I0MnBUSjUxeXBIZnFucXJCeDZpZSt6U0RtMjlZZFlm?=
 =?utf-8?B?MzJ5aGVqeHJWcFJxVUtZM3NKK3FHY2hiVFhsUS8vWkFXcFRwZmErUmR6Rmpj?=
 =?utf-8?B?bXdpY2VJVzRwMWkxQkNKeCsxbEkxd1F5MEdNUkhBM1dPcWJTeW5kcmczQ1hO?=
 =?utf-8?B?ZEw1c2crMHEvdVcxOHo5VVZNZDlmSFpsaU9pS0ZOc1BpQ0pRUFdXWjNJVlVO?=
 =?utf-8?B?Q3JYbUlHbEFXeGd6V1ZsclRKTzJkZGpvakJQVXo1QVBZTUk5dlFkSXp6dWYr?=
 =?utf-8?B?d2dOOGhESkpWZ2lCRXQ0YktUQjI1MGVpc2lZejdIMEtkc0IrT25RQVVObndZ?=
 =?utf-8?B?eG5UV3JFZWE1dVhuQmtTbkRMUy80OTB5cUJaRUFkZHBuNHAwdVZMdEE1dWVS?=
 =?utf-8?B?OE9tZW9VRS8yc1VRdkQ5NkFYTFhldFJLWC9lOWsrN3A1YWQ0MkVNUkVBS2du?=
 =?utf-8?B?aGhDazJLb0djczJVWHVOY1hEN3NJN3pOdWRmTThDcHE0L0FKZUttcGJCcWlI?=
 =?utf-8?B?RHp1ZVhDaEpkMDZUNys1UFRiQ3dQOVB6dzhRMmlvcm9KZTlsWFYwVk00QUNR?=
 =?utf-8?B?cXZMb3FFUU1TRkNRSzVpQUZGaFFpdEdoZ2RuTXF6QnFGNVBkQWp0ZDZXd1Ew?=
 =?utf-8?B?bGNkZjB1c1FFRTdJYi9pRUJIUE9tY1JoeWh4N3ZLM1h0K2g1MjZieDFMOEVm?=
 =?utf-8?B?M0NEeVg2V1djT20wNEZEZHFDQWtxSndsTGkyc3FMY2xuR0RldTRiLzBQMy9W?=
 =?utf-8?B?Yy9MS21EWWkvUG52cVdPajVNeGpISWNPZ1NpdHordVFKR1ZxYlB0L25ZT1Vu?=
 =?utf-8?B?ZGprcmdkZzJTWWtTc2d3cXJ1cWQ3cWZkNXV4dmJ1cjJlOEdlNkhnaHRDdnp3?=
 =?utf-8?B?Zjk2Rnd5cGpQY3RiYy9lY1lkZDBOMmtvUURBVnNFV2pWQS96NkNoMHNyVllE?=
 =?utf-8?B?QnhVUUxXVVQxbWw3VmYwQmxmK0dJNEhLNExDenc3UlA0QVhTeEdXTUllRTRG?=
 =?utf-8?B?TUYzdlZUUWVUdWpmWnNHY1NaY1VycSszQkorRG5NK2VibFVxeWtFUmlSVTFy?=
 =?utf-8?B?K2lIeHhoRGJVVjJhZ2hqV0tDK3VsVHk2YkcyUExjR0JEb3czNk1wcTlWUExQ?=
 =?utf-8?B?Z1ZhTk90ZEpTYS9ZSXJGb2c0aFhiM1owMzJ0eGI2eWxiNHRZOG5ZaGg1dXp0?=
 =?utf-8?B?MUUvQjhBeXg2U3JyN2k4Y25rUDhQRFh2SmxpdWF1cmU2b1l3Z2xjaks3VkZR?=
 =?utf-8?B?TUJlU2hlZDBLNmdOd1gralVra3IzbnhrWFV3RU00UWJzcVlxcU5ZL21zaDRV?=
 =?utf-8?B?UjZkcGptb3psR2x2Wkg4dUVHVEwyUWs3ZnlEUk9JSU9MSzZ6bHRsZUlqZmZC?=
 =?utf-8?B?K09EUkJlL1FMVjlIV1gxLzhpU2w0cDRtaDkxTGkwdExsZU1EazgwbTRDcXZ4?=
 =?utf-8?B?K3dEc0J3Ly9WUWlCYkVicDVYUm1CdnJkTHFUdnVRcm12SnFvVEdCTm9GYWJQ?=
 =?utf-8?B?Sk1wYUhjUlhFWnZGbUNJZGFablRrQnUyamVNMzBKNWVrNTlSV1RBS0pNblIx?=
 =?utf-8?B?aExuNXF2cE5qOUtBdWVTaHdSb1IzV29NM3FEeUZEUDhJTTIrYm55WkY5UGdB?=
 =?utf-8?B?RGFxY3pkNytYTmZPd3YxaXlHaWhEcWF4MnVHQU1CclczNTdmemdBYS9NMEUz?=
 =?utf-8?B?Rk1DOTJmLzJKVmtKM0lYNkEyOUwweHl1cXUwbzVyY1RHMUErR2xkK3B2MG5i?=
 =?utf-8?Q?EmTIELZ6aXQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEVxc0ErbU1CU0dMN3EzaWx6OGxYYVR6YnY0TjAvNm5QZ2tZaUVXSncrb3Ft?=
 =?utf-8?B?OUdodG1kbXE0d3ZJSVE1d0ZqdDlheTlIZTM3bWpXR0xiV3NvY1ZZNGtHb1Jw?=
 =?utf-8?B?QVB5YlBXOHZjVUJWR3ludjVKeXVmbTllNzhyYUFDNUljcklqc2k3VlRvZFpB?=
 =?utf-8?B?Tk1XZFZZL0xzZFppRUZYSzRmTUlXV0VvZU13YVZ6THd5UEFJajZUQXp3TXpC?=
 =?utf-8?B?ZVNqYjdJVmFKdWUvd1k0M3o0c09Dd0R2VXQ2RTJ2OFd2RDVKck1hdXMvc3pj?=
 =?utf-8?B?aGxGTkw5aWUvT0ZlcXQ2VlBIekp5ZUZyTlJmR29uVC9TSUpZOExpaXRoNUY0?=
 =?utf-8?B?bXJreEExM2g3OU1NQ3RKOUhjM2FMWEFrYmgxaHNQRDZ4cmtGM0xwekplV2dM?=
 =?utf-8?B?bFVEV0t5UWUvNDRHbHhOanRYdlRvZ1VqNExDdVRyUlF0RHJQd2svQXVCRE0y?=
 =?utf-8?B?Z3ZrRkhFUUhyY1ZwQ2hnTWd0L1hBMnN1d0VzKzVxQnhmaThWNTJjUlp1Z3VV?=
 =?utf-8?B?U2dTTkJqWXQxRU1uU0FhcGxQbGxqcmNva2gzR1hIMHNPQVF4aGlaTXU2a0pi?=
 =?utf-8?B?Tk8vTW85UVdvTzdyOTg0QzRCZ2JESTRvekRSUStqNWtrSmMrQjVxWGZlWnlD?=
 =?utf-8?B?cTZ6RnJmR0VlY2MwdFFlYnZBS3J6V3JxNHVTbHNLRy9RL1UvcDFIa3Nibk5M?=
 =?utf-8?B?UVJSaTltSUo3eGp5M2g5TXpCYWVkWUJnOS9UMU5ZT0lQaDNEVTZSSkdBbzBF?=
 =?utf-8?B?MHlIdGhobTRXUTBJaEJLaUxGOENFZUFuKzZKWi8rSEV4cW1QV20xNlQ4YlRM?=
 =?utf-8?B?QzNkK0U4cHJ3dGlpTi9LMW0xdi9mSHlnZGNvZEoxODBxZFpBMk1yb2NqaFNl?=
 =?utf-8?B?ak50eS81UzlkeE8reTdDUlE2dXV1VWduTDc3V1ZZUkovRlJ1aHREMEhzbG5k?=
 =?utf-8?B?ekZqK2dBOG5vUnlTOUY2SzNhVkZGMTFQMHkxdzFHNEdFK1JTWUUvdyttOHlE?=
 =?utf-8?B?UHBiaHpXS0ZXdTZ3b080RnpMd21oam81Tmkrd3NzYUtqdTRHM0t3MTNqMlpH?=
 =?utf-8?B?UHhDSWJWWStYdkVUckFqQ2ZLUEhOOVNmRGdVcXZobk5CVWdTMk9zM1czUjg4?=
 =?utf-8?B?QU9tZnFneGJmWHhFMDV4Q3J6STlrNDNack5DaVROdnZ0TW1oOUV1eDdoVm9B?=
 =?utf-8?B?TmVENVltSkEwU1VodUdObXQ4YUhFdzNDR25GK2VNU09UcVhlb0FzNWdaR2RJ?=
 =?utf-8?B?dWRJNzZsNzZ6b2ZiYkQ1dTcxanU1SEpmbkNnWE1xd0lyWG1aTndWeGUxMmVt?=
 =?utf-8?B?amp3cmcvdzlSaFZZQS9oc1JYY25XclMvRlFSL3oxNXBQNFhtQSsrekE1WXBr?=
 =?utf-8?B?K1RTaEhNcUtTL2ZDNTJaNUJaaGhRWHltTEVZd3pGYlZOUUdvUnljanUyQjdv?=
 =?utf-8?B?YkRNRUdaY3ZmQjUzRkd0dDZwL2VEUGd4aWJVWUZmdHR1L3p3eTVjQVNmTEgy?=
 =?utf-8?B?VG50TVR1NDlGejg4NjdHZ2pNREpoVUNiZ0xaMk9LR3pkWXRCTWNzU2FBVExY?=
 =?utf-8?B?MUNkaEhlYmUxQ1RsY0VOWVRWOE4yM20rOXRyWGo1S0ZyV2pJVWpnb2NCWTVP?=
 =?utf-8?B?M1h6QnhITm9Od1NvUTZuTkJ6bXlVOFlQbXVRY2dUdUVQZ2V6SVlpcDRKUE9M?=
 =?utf-8?B?TGhrWDFCam1lbWFBbFZBSGZydVVXek56bUoxS2s2enJ0dmpaVFlsUVd1OEFm?=
 =?utf-8?B?SEM5WTdGRFpNbEdmcVdHOHNhd2xNQngxanpOMWlia3A1SGxRb1FuV1pKaXps?=
 =?utf-8?B?eTA2aFpIeGJYWE8xN1pKOTdxMDIydzA5dy9ETDdZWXRvaitvd0I5dDJmaGEr?=
 =?utf-8?B?WUd3UW44R21sQ0pUeFI0R0pFYVdpMUlQSnZJMVMxSGtaNks1Z2hqL3VtVUN2?=
 =?utf-8?B?RnprRmM4RVlEK0I0MytEZWlZUFVraHRBNzdZaU9pSU5yV1pJOGZsMytsOXlj?=
 =?utf-8?B?dmVMNzZyWDRLeDQyUVJoMW5tMVVmcHorYnk4dWEyVUJEb2tuWWRWZW5zQ2VW?=
 =?utf-8?B?eHBYYU9JRzd3cm1YRXJUNHVUZmVSSkdYTjBlWWxqaFVQdEdJZEMza0pNdHpN?=
 =?utf-8?B?dTRtdWlkUC95akplck9QYlgyV3Z1UjRJRFFhU2l3SHdMYzVvdDBlLzduR0NE?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e96b28ed-8a22-49d8-abcf-08ddea0775ed
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 09:59:52.3022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sdtlKeqvf8zWo2GeCfqPbxF6QAQJ/kSGKaqeQnj1krHSgiuLvG22ts4Y0aNAJzEGaIkZsX2gsmzQe4dawgJmiLw/2CZ8nPuqI2b+wQvTIIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9490
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



On 9/2/2025 11:32 AM, Satyanarayana K V P wrote:
> CCS save/restore is supported starting with GuC 70.48.0 (compatibility
> version 1.23.0). Gate the feature on the GuC firmware version and keep it
> disabled on older or unsupported versions.
> 
> Fixes: f3009272ff2e ("drm/xe/vf: Create contexts for CCS read write")
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Andi Shyti <andi.shyti@kernel.org>
> 
> ---
> V7 -> V8:
> - Fixed review comments (Michal)
> 
> V6 -> V7:
> - Fixed review comments (Michal)
> 
> V5 -> V6:
> - Fixed issues reported by patchwork.
> 
> V4 -> V5:
> - Fixed issues reported by patchwork.
> 
> V3 -> V4:
> - Fixed review comments (Michal, Andi)
> 
> V2 -> V3:
> - Fixed review comments (Michal)
> 
> V1 -> V2:
> - Fixed review comments (Michal)
> ---
>  drivers/gpu/drm/xe/xe_device.c         |  2 +-
>  drivers/gpu/drm/xe/xe_sriov.c          | 14 ++--
>  drivers/gpu/drm/xe/xe_sriov.h          |  2 +-
>  drivers/gpu/drm/xe/xe_sriov_vf.c       | 88 +++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_sriov_vf.h       |  4 ++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c   |  5 +-
>  drivers/gpu/drm/xe/xe_sriov_vf_types.h |  5 ++
>  7 files changed, 96 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 9e4773a17ef8..9e2952c9c06a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -950,7 +950,7 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_vsec_init(xe);
>  
> -	err = xe_sriov_late_init(xe);
> +	err = xe_sriov_init_late(xe);
>  	if (err)
>  		goto err_unregister_display;
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> index 87911fb4eea7..7d2d6de2aabf 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -160,19 +160,15 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t size)
>  }
>  
>  /**
> - * xe_sriov_late_init() - SR-IOV late initialization functions.
> + * xe_sriov_init_late() - SR-IOV late initialization functions.
>   * @xe: the &xe_device to initialize
>   *
> - * On VF this function will initialize code for CCS migration.
> - *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_sriov_late_init(struct xe_device *xe)
> +int xe_sriov_init_late(struct xe_device *xe)

for the record:

in general such renames should be done separately, but now
it's OK since this function was introduced by f3009272ff2e

>  {
> -	int err = 0;
> -
> -	if (IS_VF_CCS_INIT_NEEDED(xe))
> -		err = xe_sriov_vf_ccs_init(xe);
> +	if (IS_SRIOV_VF(xe))
> +		return xe_sriov_vf_init_late(xe);
>  
> -	return err;
> +	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
> index 0e0c1abf2d14..6db45df55615 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.h
> +++ b/drivers/gpu/drm/xe/xe_sriov.h
> @@ -18,7 +18,7 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t len);
>  void xe_sriov_probe_early(struct xe_device *xe);
>  void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);
>  int xe_sriov_init(struct xe_device *xe);
> -int xe_sriov_late_init(struct xe_device *xe);
> +int xe_sriov_init_late(struct xe_device *xe);
>  
>  static inline enum xe_sriov_mode xe_device_sriov_mode(const struct xe_device *xe)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 5de81f213d83..b5764caa607b 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -10,6 +10,7 @@
>  #include "xe_gt.h"
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_gt_sriov_vf.h"
> +#include "xe_guc.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_submit.h"
>  #include "xe_irq.h"
> @@ -18,6 +19,7 @@
>  #include "xe_sriov.h"
>  #include "xe_sriov_printk.h"
>  #include "xe_sriov_vf.h"
> +#include "xe_sriov_vf_ccs.h"
>  #include "xe_tile_sriov_vf.h"
>  
>  /**
> @@ -127,16 +129,67 @@
>   *      |                               |                               |
>   */
>  
> -static bool vf_migration_supported(struct xe_device *xe)
> +/**
> + * xe_sriov_vf_migration_supported - Report whether SR-IOV VF migration is
> + * supported or not.
> + * @xe: the &xe_device to check
> + *
> + * Returns: true if VF migration is supported, false otherwise.
> + */
> +bool xe_sriov_vf_migration_supported(struct xe_device *xe)
> +{
> +	xe_assert(xe, IS_SRIOV_VF(xe));
> +	return xe->sriov.vf.migration.enabled;
> +}
> +
> +static void vf_disable_migration(struct xe_device *xe, const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list va_args;
> +
> +	xe_assert(xe, IS_SRIOV_VF(xe));
> +
> +	va_start(va_args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va  = &va_args;
> +	xe_sriov_notice(xe, "migration disabled: %pV\n", &vaf);
> +	va_end(va_args);
> +
> +	xe->sriov.vf.migration.enabled = false;
> +}
> +
> +static void migration_worker_func(struct work_struct *w);
> +
> +static void vf_migration_init_early(struct xe_device *xe)
>  {
>  	/*
>  	 * TODO: Add conditions to allow specific platforms, when they're
>  	 * supported at production quality.
>  	 */
> -	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
> -}
> +	if (!IS_ENABLED(CONFIG_DRM_XE_DEBUG))
> +		return vf_disable_migration(xe,
> +					    "experimental feature not available on production builds");
> +
> +	if (GRAPHICS_VER(xe) < 20)
> +		return vf_disable_migration(xe, "requires gfx version >= 20, but only %u found",
> +					    GRAPHICS_VER(xe));
> +
> +	if (!IS_DGFX(xe)) {
> +		struct xe_uc_fw_version guc_version;
> +
> +		xe_gt_sriov_vf_guc_versions(xe_device_get_gt(xe, 0), NULL, &guc_version);
> +		if (MAKE_GUC_VER(guc_version.major, guc_version.minor, guc_version.patch) <

nit: it could be simpler if done with MAKE_GUC_VER_STRUCT

> +		    MAKE_GUC_VER(1, 23, 0))
> +			return vf_disable_migration(xe,
> +						    "CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
> +						    guc_version.major, guc_version.minor);
> +	}
>  
> -static void migration_worker_func(struct work_struct *w);
> +	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
> +
> +	xe->sriov.vf.migration.enabled = true;
> +	xe_sriov_dbg(xe, "migration support enabled\n");
> +}
>  
>  /**
>   * xe_sriov_vf_init_early - Initialize SR-IOV VF specific data.
> @@ -144,10 +197,7 @@ static void migration_worker_func(struct work_struct *w);
>   */
>  void xe_sriov_vf_init_early(struct xe_device *xe)
>  {
> -	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
> -
> -	if (!vf_migration_supported(xe))
> -		xe_sriov_info(xe, "migration not supported by this module version\n");
> +	vf_migration_init_early(xe);
>  }
>  
>  /**
> @@ -302,8 +352,8 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>  	xe_pm_runtime_get(xe);
>  	vf_post_migration_shutdown(xe);
>  
> -	if (!vf_migration_supported(xe)) {
> -		xe_sriov_err(xe, "migration not supported by this module version\n");
> +	if (!xe_sriov_vf_migration_supported(xe)) {
> +		xe_sriov_err(xe, "migration is not supported\n");
>  		err = -ENOTRECOVERABLE;
>  		goto fail;
>  	}
> @@ -378,3 +428,21 @@ void xe_sriov_vf_start_migration_recovery(struct xe_device *xe)
>  	drm_info(&xe->drm, "VF migration recovery %s\n", started ?
>  		 "scheduled" : "already in progress");
>  }
> +
> +/**
> + * xe_sriov_vf_init_late() - SR-IOV VF late initialization functions.
> + * @xe: the &xe_device to initialize
> + *
> + * This function initializes code for CCS migration.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vf_init_late(struct xe_device *xe)
> +{
> +	int err = 0;
> +
> +	if (xe_sriov_vf_migration_supported(xe))
> +		err = xe_sriov_vf_ccs_init(xe);
> +
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
> index 7b8622cff2b7..3bf3364799ad 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
> @@ -6,9 +6,13 @@
>  #ifndef _XE_SRIOV_VF_H_
>  #define _XE_SRIOV_VF_H_
>  
> +#include <linux/types.h>
> +
>  struct xe_device;
>  
>  void xe_sriov_vf_init_early(struct xe_device *xe);
> +int xe_sriov_vf_init_late(struct xe_device *xe);
>  void xe_sriov_vf_start_migration_recovery(struct xe_device *xe);
> +bool xe_sriov_vf_migration_supported(struct xe_device *xe);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index 4872e43eb440..908590fa79d4 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -264,9 +264,8 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  	u32 flags;
>  	int err;
>  
> -	xe_assert(xe, IS_SRIOV_VF(xe));
> -	xe_assert(xe, !IS_DGFX(xe));
> -	xe_assert(xe, xe_device_has_flat_ccs(xe));
> +	if (!IS_VF_CCS_INIT_NEEDED(xe))
> +		return 0;
>  
>  	for_each_ccs_rw_ctx(ctx_id) {
>  		ctx = &tile->sriov.vf.ccs[ctx_id];
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> index 24a873c50c49..2c94d1f92187 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> @@ -35,6 +35,11 @@ struct xe_device_vf {
>  		struct work_struct worker;
>  		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */
>  		unsigned long gt_flags;
> +		/**
> +		 * @migration.enabled: flag indicating if migration support
> +		 * was enabled or not due to missing prerequisites
> +		 */
> +		bool enabled;
>  	} migration;
>  
>  	/** @ccs: VF CCS state data */

one nit, but otherwise LGTM, so if CI is happy:

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>



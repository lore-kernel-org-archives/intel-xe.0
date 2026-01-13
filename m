Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDA7D2F344
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 16:42:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CDDB10E518;
	Tue, 13 Jan 2026 16:42:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="klgqy0GJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9719A10E51C
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 16:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768322570; x=1799858570;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GVbM7TovfyXY44sXB9GckoRQJ6DULN9E5KfRV6Qg8DI=;
 b=klgqy0GJBf1LFvW0clEdVsZ1BoFx+n8Ajx0ZPiDv9t9ENLzr9lSqyKjC
 h4tHsyXRAOFEQuCd3/r6DasPb5wHGNeeDL7g7PNLnmsHyW4wSrvE+ZD+I
 wUTGkXDgNNmo+BJYlu9eI8NAvQozWLYMGi1CcgaWkLvT97+oyPYOV2EFf
 pvz1DDffQzKSfJaLYn59B9vsk+O12rcEsKZutIABxAe/mOm1y+C7IQAYz
 5nPvg7Hmx9NA48IxBL7PgHDPlKINNYYZIcG86c7OBzhFjPXE5ir029hhx
 ilcQ9G176uPFrwKWZBE31z0vgYYWi/nwnZL0Rz5/5VpehzbgWMoX3Lt1D A==;
X-CSE-ConnectionGUID: hKV9QBWeSsOfdh7DjwClEA==
X-CSE-MsgGUID: j9S0Ej0yQUGRvKjm3nAHjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69667676"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69667676"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 08:42:49 -0800
X-CSE-ConnectionGUID: KceWpqY2SfaCjRcGPR4CvQ==
X-CSE-MsgGUID: nu03+7rpRx+ShodQxXeJag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="241943322"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 08:42:49 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 08:42:48 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 08:42:48 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 08:42:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=txCC4pqGmbGBkcYvkO+RjPEStl33zpP1PSaQYyAw4d5K1tz+erb2tyxGaz+Ec5Pi1ge1ItPHuNuTXQ3USvIqTd2e8tO3mOxSLLhlhdr5Kkrp5zXz83Vn3NcXn50Q9CJ02kkTs35Y16UMBdY9/F2Vq7DoGTF1lYpzKm4DLXHJFvfQZyZdNDSlwdnxy7u1KiyMew0T/OFivt4gxJdjXsdqQFANNJRQ4T42qsKv9rVHAN4Kt+Qo9LeuWonn2AdjD8JV0tFc5L8tpikZpk3rRWZvkkYSUQxiqfPeneJRIUD4G6sNqg3C8d1ILVJUdVGWOe29WSgcdH37XaynAeOI4i5AnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmp2WB2kUuvZOckFM/y59vsSVZlUU53K3KtPoyB1WhE=;
 b=eGd24gdXrbgiMx1o3wwjxky4suytn5aJMV4SfhMemFAfLzwiOax6eWOD6XlvfdBnN+W9nRykNZMp1K7Z9XerJ/dud4YtgC0i3NMypnJ7BwMOtnQiNIsNRDBdmB/sx8H1BP6k3H+8aWBMeXbImJuE/Ine6O6Ek+iqFcjIT3/gyBQxELiPcHnVSZOGVLDaRtdTZd4McP4K8IOcdk3J8qK4qq0Jsu3Pfsihuv+QTZt4Ma9G87YwVURfdrZ62EDk5+kL5ZkySnnwIICVygB0diVpWrfixa8cFmUHKIMJdCrVZDetjAwPYX1WMgml6DtjqBBcwD6WdMQAumd55hmR6cIL1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by DS7PR11MB7887.namprd11.prod.outlook.com (2603:10b6:8:e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 16:42:45 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%6]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 16:42:45 +0000
Message-ID: <df27979a-cda9-4ac6-8090-92419834b737@intel.com>
Date: Tue, 13 Jan 2026 08:42:43 -0800
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/guc?=
 =?UTF-8?Q?=3A_Recommend_GuC_v70=2E55=2E3_for_BMG=2C_PTL?=
To: <intel-xe@lists.freedesktop.org>
References: <20260112180809.1474677-9-julia.filipchuk@intel.com>
 <176825926565.147986.10487189943479831807@a3b018990fe9>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <176825926565.147986.10487189943479831807@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0193.namprd03.prod.outlook.com
 (2603:10b6:303:b8::18) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|DS7PR11MB7887:EE_
X-MS-Office365-Filtering-Correlation-Id: d7c57f6b-dca1-475e-b532-08de52c2c761
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ty96VkJURGRrd3dIVjRtRGNBeUpteUYvd1hFOWwva0F2NnZPNDlKZ1BDaXp3?=
 =?utf-8?B?bkd4WitUQTdYdlM0MjZPMm5oaW12TXZGTHM1eXc4SmQ1d1ZCM3BvajBCSzkz?=
 =?utf-8?B?WUNhZWpqMm5CZ3hlWEhySURzMlg2S3N4SlNaNnphRGpGczkrVVB0ZmJlVm02?=
 =?utf-8?B?VDJGMFVHK0I2VVEzU2lnQ05lZVZVbGs3QW1tUnd1RWdWVzFwWnh1N1JmLzgv?=
 =?utf-8?B?MXVDRlVCYzcvMFNJa1ZmaVdGMURySUsza0kyUGhNMW1NMGt6cHJNcmMyUkZa?=
 =?utf-8?B?dTB0cEVHRkZJd0h0QUkyeWxXaG12dThRaFBPaHgxUExFaEZXdGtXNjVvaGRH?=
 =?utf-8?B?L056SUFoNW93eUZTU0VlMVJLZElDb2JnQlJ1RW1FbHJuTC9oVnRiZ0R2NVls?=
 =?utf-8?B?dEVEM2FoU2NZL2JGTVBqT1ZwMGxITmhYcU93SEFET3plbEpYTE1NL1NIeUR4?=
 =?utf-8?B?cnU2MmtHTmR0UVd4NXJ1aXEwa3FmSzYvOGRhQkRSeDdMK1lJK1laWkl2UXdq?=
 =?utf-8?B?WEpHUGt3K1Z6RlM2bUhGZFFaNVFLQWNUVGJDTlZsRkpiTjlGNjZVcWJzcmdn?=
 =?utf-8?B?N0loaUg5MUwrcEUwTHNWc1Q3SzBzNDk1TVo0bXlsRXVnTXRNbks5cmhja1ZH?=
 =?utf-8?B?TFdoQ1lnc1VlZ09nMnFzYXJuSFNhQkFiSk1Manl5djlTcHB1empML2dRT05S?=
 =?utf-8?B?bU4xOUNjK0lKOENESWxwVGltc1BET2RiaXFOaEd6K3VDQkJxOUZlb0R5azB1?=
 =?utf-8?B?TW9xWmNHYWtlUFl1ZzNIbkxjdzYvUU9nNjJFSTJRQjk2YktNRDJ0RWpoV0dR?=
 =?utf-8?B?U1dKVEJ0UTBmLzVJNzl1SThBV21ZL01RZkVrUE42Y2s2akF1aDJQZDZBRDda?=
 =?utf-8?B?Rno4QXRCbEJTWWs2OXZWRkpFZU9OV0JqVVZhaDhQTEFlTWt4NmFYcTIySm5N?=
 =?utf-8?B?NW44a3JmRXFHRlllRzY2VHNTU0tqbTJzLzh1SWhjTE9qcG9GeEwvWVp2MlVV?=
 =?utf-8?B?Z1Z4OVp6aXBKanpJQitBTXhrK25VVTR3SldFQTNFZlBwS25yendlSUZHeWVX?=
 =?utf-8?B?M1MzeHIzL2d4a3hxNWF2SzhEdmhCNlRzWE5ZTWF0UE1nVWZ5RjRZVEhqR1ZJ?=
 =?utf-8?B?THJuZXRtKzZJaUo5dWFnT1gyMEl2YTBXalRZL3ZmSXFxYzd4R2lvTjFtVENl?=
 =?utf-8?B?cDdldCt5NjI1ZmljR1cwak4yL2I2bVU0UTRxNEtESEdEbnJuaUYrdlljeWVk?=
 =?utf-8?B?eEZlWjRDS3VwbXovLytrQ2tsaGJ4dXlIdEEvanhadWtFRXMzU0NRYUJFa3VW?=
 =?utf-8?B?UXJmMUNVaEhaYjRUMWR0ZnJMYnBWK2hJRGFYUlJGbWJORE5XUmFiNldhbDV4?=
 =?utf-8?B?VVJvYmxzWDRUOStiNlVac3R4aVFsRmJTV3ZWalJKOHQzVjlOWWNnY2o5b3Fu?=
 =?utf-8?B?OVBsUDFYM3NkTS9OL0hkU3hvZG8rVmh5RWtYNW1NMDcvOWhXNmRGamt5d1NK?=
 =?utf-8?B?TVBxbHF0TTZCS08zU3FSK2ExK2NSUDBFQ3NZSldDRXRlTThaL0lwR3dsN0Nq?=
 =?utf-8?B?emUrNldLQVpDZTJCTCs1U3lrT1E5VnQ2SlcyZmpsbDU4U2dWa3V6WjZiMTlp?=
 =?utf-8?B?ZGlHM1ZPWjNVaGxTUTNSajNmNTBZWnRKZDQyclNoMWFuRGlFM2F0RkRPVDhB?=
 =?utf-8?B?RlFzWXV4MjN5NjJwN2M4WmJhK2JoUWNXMStGeThScTBuSnh6VzVoajErVXlK?=
 =?utf-8?B?b1dhdkRSc1pCeDliVzJYUjBEL1BQa0hjVmdEUEdSdWxGVnJVR3R4ZStXVmtJ?=
 =?utf-8?B?LzdQSmYxWXYvQU4wd2hSRkFGblR0WSs2ZHA1Q25ncDcyalYzMmIrcFlod3Ar?=
 =?utf-8?B?akxOU0MwaktqNjRYZ05UNzVzMVVNNG1reWlBSFJUYnR5cXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3doNnJBOWVSZjIxK2UxRy83UnFqZ0VLdWxXK2hkbXFscGVqbDEyTG9la0Jm?=
 =?utf-8?B?UUlsVmRuL05hQkFjMGdEMmZKVlRCLzZZTUJHVElDVE5ocTBjaVJSeFpyais5?=
 =?utf-8?B?NWJEM1dKOGN4WUlMamsrek9lRmQ0TlZEUGI1RS9RZ1VlS2piMFJaVFNBM0FK?=
 =?utf-8?B?ZlFmcGlnUDZXTFFEN0gwUVkzbHNyUC94bjJIYTFYVzRJTWIvN1BBN0tYZVBk?=
 =?utf-8?B?dnErcHRpaDlHYjNzcitHMFM1UUg5R2w0d2swaHpiMGtDWWRZcURiMzFzVXIz?=
 =?utf-8?B?MmVmMlVxd1hsVkIvUk9DQ0tMdXlPVm5sWWhrOE52YjhXL3FocC9YcEp5VVNX?=
 =?utf-8?B?eWpWWFR6Q0xYMWlnZVNHUFJid00xUnBXNWlmMm1LdnJUUTkwTmpUVVhUSHBI?=
 =?utf-8?B?UVVTaWhnYkxoakszZVNEaHgzZmgwOTVMVzV6WWl0Z3lRZ3VXaUhGeUhEYmxP?=
 =?utf-8?B?M01OMmVtME11eDdabXk1eFZZN0cyMVdLdnZrR2svRjMvc0k3Mjd0ZFFiV1gz?=
 =?utf-8?B?Z1ZJSExXdjJNMzRqb0JtSk1nOE55RnVTQStLVUNzdHZhcEpKS2dFcS9JV3Fw?=
 =?utf-8?B?dEpERDFRYW1rY1BoRnZCMkk4VUxYUkUydGljMVBvUEpBNWxBNWk0WGFoRVVN?=
 =?utf-8?B?d0J2TUhwWHJqeEYwMThlblN0VlF4U0xEVHhQTHl4MjZDWGZmazNiYVRtUTNv?=
 =?utf-8?B?ZXp4bmdCRDVrRDMzNnRtR3ZxSW5iMHl1bWVyQjN5b0JZL0dPVExjWHBBSURi?=
 =?utf-8?B?RDQ3a3JiU05uQkdxNTMvQjBWQk1SRlk4Ym9oNHNQRDVKaFFwVGlpajZQKzhP?=
 =?utf-8?B?RTRTYzMzVm1ETmQvaTRWR2JCbjYyZklqbXhWSW1uL1pHM3NQNndUQWc1bSsx?=
 =?utf-8?B?ZW9RVjNibjllUjIwSEJlV1ByTHU1eUltVmdQNW14b1VhZUQyNzdrRWFtY2xI?=
 =?utf-8?B?LzRPUmJKeUZ0azE4c2VqRFJPbEhpNGxKTGpnUUF1bjNrNXlSUnhPTksrMHpQ?=
 =?utf-8?B?T1hwWGk5WDhoTnQ0cFIvOHBCaHhhQ3pnamxpcGJBUGsvalFTMG50NXFxWEo1?=
 =?utf-8?B?Q0p2WmsrVVg3eW00VHJtSnZ6bDdwZVZ3MjNNZndQSkdPU1FrOXlNN2JqQytL?=
 =?utf-8?B?Smp6Sy9iblFUL21HT2pFM0dYL1hScmkzY1VqMCtXVEpwZk0xVDVkVU5MTHIx?=
 =?utf-8?B?NmIzT2xMcWtsVW03MGRnUDdKWlF2TkJ6YS9TRE1DbmY4M0lNalVIaktqbkNQ?=
 =?utf-8?B?bEdpMUk2RHpsM3dqMkdiZ1pnSkxtYWNBM3E3bGFUc1dmLzhjcnBPTCtSOEtO?=
 =?utf-8?B?bmZjSVRxMjFDNUtIZDdUMER3MzJCN0lUbjhJZTRMK3VHeGhKOGk0c04vcFBa?=
 =?utf-8?B?UUtXZ3BSUzBKQnJ1Nlk4ZXU3NUZiR1J2Qld2ZFVRRGVnNmZBWXlsUVRkUnVk?=
 =?utf-8?B?U2U1eGxWc1RsaU01WGNvWnZuZWtDdDVsME9BQXNwU3p0NFg5emNQb1lmVWNC?=
 =?utf-8?B?VFNjcmRqRGNKaXh4Z0h3M2lwaHVtd0kxbDhjRDEyL0o0aGpUMVoxV09RSitX?=
 =?utf-8?B?amErei9PODJGVGR5UWsxcjZxTm4xOGppNWNlVk1hWGlVbmh3UmErUnllaVZF?=
 =?utf-8?B?U2V1TUVtQUErMmMxV2E4WU9aR2JSaEdNei92dHI1NmJsWHB1UC84ZVlQV2dE?=
 =?utf-8?B?T2krb1RZSkZ0RUtFQkU0eklqZE9aWVhyMkd6Rm9DQUJUa0VFbHRlOW1vL05M?=
 =?utf-8?B?Z1BzS1VYdTJNbEttNlFOVk1uOFZUcXpjUENsbVM3dkNhQWVnUHFCdDFEV1Ur?=
 =?utf-8?B?MERvajdqVUF2Y092UEhiVXQrVW9QSlNtWUdXVytvakxIdXIremdTWDZqVDBD?=
 =?utf-8?B?NlgvY3ZTbTlheFdHUXhpWVc1eG8xdjBQdHlMcyt5WUg0M1hnNjd0THFadmwz?=
 =?utf-8?B?TjNES0c2Yk9DYTdISVRGTk5DekRIRmpWRVpUbS8zbnlNSFZhb1VXYnBraGFQ?=
 =?utf-8?B?cktIcFA2a3dBblMzZkdYRHZ5U3hIbXhCMlM0d2RaU2VXdkFyOW10alZrMWZL?=
 =?utf-8?B?K2NUMzRPaWwxZnhibGlmTmNBb3BubUxMQVU2ZlNaSXk1UkdpUTZ2MEhmbFE0?=
 =?utf-8?B?ejlmNjJOaS8xc0tPTDIydlpQZ2hHRGl2THVONFMvYktmcXAyenBVcjdVL1I0?=
 =?utf-8?B?MlQydHRKRXBEOThWUmlQUlR2STBhTE5ONGR3NVZYY0xPVnNSVDZvTFJIcGZM?=
 =?utf-8?B?enp3SXZqZkdHU1lkMGpTcG55SU1NZXlWMzV3UkRuYUZtWUs5YjFMVkRhQkN0?=
 =?utf-8?B?dFdYRitHTCt0bnFLTWNNQ3Q3RmJYc3E1QW42dEwrNXc2K0xvajdibEV5SnA0?=
 =?utf-8?Q?Y0bjzl3nJSgdHorU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c57f6b-dca1-475e-b532-08de52c2c761
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 16:42:45.7314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g1qAco/xA0UB0xeYyIwbOzSXHr7pE/RdtYcSAFVeG0GaZdA4BqsRSfJQjE4yjv200oRlEAZmUkMHesvEqJDz5R5RUBqsgWeR4svcFo4S09Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7887
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

On 1/12/2026 3:07 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/guc: Recommend GuC v70.55.3 for BMG, PTL
> URL   : https://patchwork.freedesktop.org/series/159975/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4368-e9383891a008f23b432b7b3c4ca2d7dd0f49824d_FULL -> xe-pw-159975v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-159975v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-159975v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-159975v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>     - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4368-e9383891a008f23b432b7b3c4ca2d7dd0f49824d/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159975v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
Failure seems unrelated. System looks stopped after this test.
> 
>   * igt@kms_flip@flip-vs-expired-vblank:
>     - shard-bmg:          [PASS][3] -> [FAIL][4] +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4368-e9383891a008f23b432b7b3c4ca2d7dd0f49824d/shard-bmg-10/igt@kms_flip@flip-vs-expired-vblank.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159975v1/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank.html
Failure unrelated. Timing exceeded on kms-flip test.
> 
>   * igt@xe_pmu@engine-activity-suspend:
>     - shard-bmg:          [PASS][5] -> [DMESG-WARN][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4368-e9383891a008f23b432b7b3c4ca2d7dd0f49824d/shard-bmg-10/igt@xe_pmu@engine-activity-suspend.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159975v1/shard-bmg-9/igt@xe_pmu@engine-activity-suspend.html
Failure seems unrelated.

Warning present related to missing fan firmware.
> <3> [389.062310] xe 0000:03:00.0: [drm] *ERROR* Load fan_control firmware failed with err -25

Test fails with ENOMEM. Seems to be resource constrained.
> <7> [390.908320] xe 0000:03:00.0: [drm:xe_pci_sriov_configure [xe]] PF: enabling 2 VFs
> <6> [390.958532] xe 0000:03:00.0: [drm] PF: Tile0: GT0: VF1..VF2 provisioned with 1073741824 (1.00 GiB) GGTT
> <6> [390.966513] xe 0000:03:00.0: [drm] PF: Tile0: GT0: VF1..VF2 provisioned with 6310330368 (5.88 GiB) LMEM
> <6> [390.966911] xe 0000:03:00.0: [drm] PF: Tile0: GT0: VF1..VF2 provisioned with 16384 GuC context IDs
> <6> [390.967130] xe 0000:03:00.0: [drm] PF: Tile0: GT0: VF1..VF2 provisioned with 64 GuC doorbell IDs
> <6> [390.967713] xe 0000:03:00.0: [drm] PF: Tile0: GT1: VF1..VF2 provisioned with 16384 GuC context IDs
> <6> [390.968341] xe 0000:03:00.0: [drm] PF: Tile0: GT1: VF1..VF2 provisioned with 64 GuC doorbell IDs
> <3> [390.968347] xe 0000:03:00.0: not enough MMIO resources for SR-IOV
> <5> [391.018719] xe 0000:03:00.0: [drm] PF: Failed to enable 2 VFs (-ENOMEM)
> <7> [391.048855] xe 0000:03:00.0: [drm:drm_client_dev_restore] fbdev: ret=0



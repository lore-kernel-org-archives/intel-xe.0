Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0699D216A3
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 15:52:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618BC10E998;
	Thu,  4 Dec 2025 15:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XdItTtSk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBB110E204
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Dec 2025 15:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764863569; x=1796399569;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p+Gt7cfKyIT1QximP1/vFGPpO2rTOxnyZh+pE9CshWo=;
 b=XdItTtSkj9ldhUHk60YBrTVRGz5gzVrRdF7P/Dfs9TpSYFHol8hX1FyF
 QH8mbdBOwrpc6BZxqAbC0oiCBiQWbklvYngQwvxAUwcuQAkLAyR3slhCQ
 JOb6pL3HOVbCYlPj0W/9Ko5tdE7Ja+9JK2oK+TfNmYLTIyPLctkarCK77
 46W78/evZz74TOGPgNDuuXCpIPwaK/SBbMbvE8+s3MBL8auq6Gc4C5PLj
 q7ingcBTJM93BQPDSLS7w87SFs7mSijUxd9/+AJhaejj4fUU8KGOD8p22
 npQxqLmocpzEV9MVDBe8dF5wAMeQV+nCzkYyXElpMgPHokfe7Vjjc5CVy g==;
X-CSE-ConnectionGUID: KvyWKaQwQjGciNu5q/HjoA==
X-CSE-MsgGUID: BLhFdDEZQgCip3VfH2I7bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="70505009"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="70505009"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 07:52:48 -0800
X-CSE-ConnectionGUID: Ks2T/GGqQZaI3hYF4DocSg==
X-CSE-MsgGUID: ktGO11hxTf6k8X7I0E5TcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="225681005"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 07:52:47 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 07:52:46 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 07:52:46 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 07:52:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0KOKBjE71YnxXJi++49U5dZSZKfUwRInjMxNMElopNLkROhoVqC4pu8pwK5KzXwSnPVA6AeqKI5nJK9eZrSiuS1nJZ3cjOGYRJ03eKCPAEFB0Jkht46v+WwHcmZKhfRTZ2171PWfeFm8uHdqALkAfxq+7YXDlNqsSVkyfzCof8E5j2yXYAaLP5NIXWEDFIJvsgG5f5NEJSMCbqL95F91XVZWYxfpjNa36uJ+7Nr25ZUn+51hf/14pZK1Dju0/bkpwaIz98JswLRTPy8nRdWqyT79XnV9tY2oHP2aX6rYAN173++R2xZHz3/6R1wbxxKYhTBB4Y2DNce+jWQ2EV7Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+z4Yjn+E7QYSOD9WLdvZWRuFsVtHKjFNrUTOYLxAP9g=;
 b=tHgbfzDO0ISSAzNGwZkcKDCAuDAE4fNYmt7G8PK+GHVsGSussyeHOj5qv/mLk3sNyfHAWfy/EH+yH6LfLspllMb9wWgyaYLi1psManhwKq06MaIh+9cOFpvGNmilZiSg3Sfh7fwLkKLp2LzJEsrQvGD84mzEMIrvveGqWxVtsj4feO0G9zp5WrD4sH07F5wbwrdjCNHfEfP8Y7g90gp12xDvVQ/kmh2RDMZtF2/C1plP8OinH02Nm9hC9VUKRuql4iM2WxdcYBhNYqq5F43FUY+iSMDrRpnGFa7EtGmV08I3j4LQE9gq9HJvh6lbw+za2Elpp2zuWIIqOS8DJZQs1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by IA1PR11MB6513.namprd11.prod.outlook.com (2603:10b6:208:3a3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 15:52:43 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 15:52:43 +0000
Message-ID: <be890da4-07a1-4abe-bf9e-8abd7e5ca40e@intel.com>
Date: Thu, 4 Dec 2025 21:22:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] drm/xe/soc_remapper: Add system controller config
 for SoC remapper
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <ashutosh.dixit@intel.com>, <anoop.c.vijay@intel.com>
References: <20251203004800.1993258-5-umesh.nerlige.ramappa@intel.com>
 <20251203004800.1993258-8-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20251203004800.1993258-8-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0202.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::9) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|IA1PR11MB6513:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f07847b-e8b1-434f-915c-08de334d2948
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlFiTDV2QmFJNHBQS3RCUFBRUXpvdlNWRENGMjFOY1lyVVVaeVpBOStQZjdI?=
 =?utf-8?B?Q0RkVTI5RTYrVFRxUUw5QTZhMmpqSGhUQXBrb0FKQU5nZlA5dndtSnFSeHhi?=
 =?utf-8?B?UVdLYUZMb29HcFBha1JHRHVka0dNOGxMUUpCQzRkTHBSOHVTYllBQ2s5aHEx?=
 =?utf-8?B?RnRTS292OHBVc000WW14WTkyM0hCaDUxRHg0RGlDVEEySVZKL214SmVDa2pl?=
 =?utf-8?B?VGxGSXNUSXY5SmpwTHNKWEZ4Vm9Ed0JOZU83UjZwc0I1bGMzbUwvZXNrOUh3?=
 =?utf-8?B?SHZZSVF0Wk1neW5hU2xqcTZZU3A3ZzVONXNWTm9QeExVdmc0MWZWRnBzai9x?=
 =?utf-8?B?M2NoQXZ4enhrWUFPMlZFamZoTTRuMVpyTEhEZkUzS2xhSEg0NWRKa2YrZE90?=
 =?utf-8?B?Z2lqdWpSK3QzUmExcEVJNWVCUEJlM3JydUtkZlZBZjA4T3RqUTRPRmEzT3FC?=
 =?utf-8?B?SnloWVNZTWt0NjdxOFhhd1lBdThKUlUzdUhETnZhL2I1bTF5SnhWcEp5alhn?=
 =?utf-8?B?V0trdVFLWEVyTFQrZUNNM0QvMlZsb2xIRlFydThzQUpCYklkOW5RQWdBWU9L?=
 =?utf-8?B?MEF2QXgzdUo5TS9CNlNUWXJqTzJVbGhXWlR4SU5xcmVOdldYKzNab2VvSWJk?=
 =?utf-8?B?ekFSelkrTndrUEtZSHg4bUtidkpRK212RWlUS3NldHlxejIydUlJZ3l6UWRy?=
 =?utf-8?B?cFdOZ2tRWi9abFI0OGxoTHBQaFIzVFI2anBrTVNsT2lHZHJCbHJBaDBKdFlI?=
 =?utf-8?B?aXl6VlpKeDBnRkxkeDhaQ3B1U1hVQ25FRkJ5WVdkVnFNWWRoazlEQnFuWDZ5?=
 =?utf-8?B?WTBvM3hGSDZDUTFnN2FwSjJsMzNmS1RXS2swUGlTcTV4SGRFcDFBdmNicXNz?=
 =?utf-8?B?a0Z6RW12bDhtVDcvQ2wySGVCVFBGN1o0N3ljYXZUTitITGVubENuOEVtMTZz?=
 =?utf-8?B?Mk5SUFNGMnR5S0tNUlJYK2VNQlc4TUdlOGlkclJlMWlCWnQzQmNWL2p3b3pl?=
 =?utf-8?B?MHgxZHRMVnNRYUIzZ2UyVEMvNWZtSDFHU25hZUJwUnh0S280VVJFVWxTU29G?=
 =?utf-8?B?eEM4azdKNC9kQ0VncHMxbG9xSTEzQjF6WTJadGMzQ0NUOVNiaEQ0WHRYYWRh?=
 =?utf-8?B?YUxaYzJlVzMrbkpUblJwaXk5RE1tVGZHNlVNK3cvZk9iQ3pZRFFYcUFuT21D?=
 =?utf-8?B?QktTeExielRMaThkYjZlV2xPRDhMWTNqVUk2bFpkSnd2TzJ6U1pWeEhhT3pM?=
 =?utf-8?B?NDQ1MFV3ekUvUlBuYVNiVy9vWXU3bjRGTlBTOHVDKy9zaldUeWpEMnNWU0xl?=
 =?utf-8?B?VDM5RW42UGtsbEZSMFdhUkNobXp1Y0U4eEZRYVZKQjF3emcraGhVTXB6MHNB?=
 =?utf-8?B?OENySTBSTVhmSzJmd1F4aWREcUNjYUM1aWlyVVdqMmlGZXh2eHZQVGMycC9B?=
 =?utf-8?B?UTJNZ0lWbHUwVTdTc1ZNZ3hROGM2R0tNbjFoSmlkbU5TamNkU2VwVXpaNGI4?=
 =?utf-8?B?d2RRLzhRalppY2JacjdPdnVva200aWxYQ2R6aHpOZE5kNFFiV0VKSXZHNi9a?=
 =?utf-8?B?blZ5bG93cVdMTElERmNtWnEvWkcyczZDNmZSWml4R1lPN3N6SGRic2FaeXdn?=
 =?utf-8?B?UUdkelZMelVzc3lmemFNMS9vd21uMHVWNjJqWjBSWk9QRGY5aFcrZHQyUVVV?=
 =?utf-8?B?Ym83a0JLcDliUzdiRlUzZW9jQnJFRllZSGNPUzlUV2cxTFRrdEl3R2ZmdEJR?=
 =?utf-8?B?R3hQSnEwUVVoMXlvcHp4R1lKOEZDRm16alVBcE5NNGl3cGdBT2lPN2dWSTRi?=
 =?utf-8?B?OG9sRis1VUIyalFtMWppOXpwcm5WaExkSWJvbFRiTW8rVzBGWXdPZitIVEhq?=
 =?utf-8?B?TStzTUdrUE5wRFdWVXhNbWs0cm1QUW9qTmR0NURzNzhzOGRlYndIa1ZtY3Js?=
 =?utf-8?Q?RE7yM22j2XYMW/uPcH9bClMcBmbwvZxs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bThUNlZGTWt4OThTTWJpQ0pRbkZnbkRGUlU3QlBCWTJHWHVIWDd3NDF0elZU?=
 =?utf-8?B?dGxIOGNrTmpoOGloNURGNUczTCsvY3pjL1JvRDl3dVZKL2ozN0J5SitOMGZE?=
 =?utf-8?B?TUtEeDBmeWk5cFdpV2JDblFHWUZFbUl5MElZNFR1c0tIN0tHS1VNZkRTaURY?=
 =?utf-8?B?dng3Z2lRYlc2dUZhUmQwd25WWlBudWpqb2VJMU9VenBmbis5azg3NHFCR3J0?=
 =?utf-8?B?bEp5V1RmbDFSR1JMbGxkMEpyV3Y0N052dS9mMHRHK1hUS0J4bmdaQ282aDNl?=
 =?utf-8?B?MHQvZ0s4WDRFeSs4UkRUUmtyclUwa3NQRzBKRmx1NGM4M2RMSlVsZ0xRSVZs?=
 =?utf-8?B?ai8yclhpS0lpbXBrL1pqOEVZd3VEL0NuL2UwOWlRYVVRUnhPV09hU2ltc3hT?=
 =?utf-8?B?L0FYQmVnc3BTbllYQjVibUwvbWk3Y2E3UEEvdks1UXZMdDdBdXFPS0x2VjRU?=
 =?utf-8?B?bE8vbDFDamxzRnN2aTVDSW1MSWlxNkVTemU3OVJpNWpSZzY0WVBqaktGQ2Zo?=
 =?utf-8?B?TzBpTll5TDhvUTRBK0JEQUhEN0pmZy93d05idlBjeW5JbWVDZGJyblRCZXhH?=
 =?utf-8?B?a1VGMEpkS1pJZFg4UXhuRDZwWWpZOVFDeUd5NXFrSkNoaU1JTGJmMVpvNDhE?=
 =?utf-8?B?d2RtMDYxR2lTRmpuaHVMTzZMaUk1a2M3MEN0dzk1cXRwSDVGeGtSM2dtZS8v?=
 =?utf-8?B?cm15ckN2S25pd2ZyNjY1cWdtR1RTMVBib1I1R2E3QzYyVFd0RTFiRm83VTRa?=
 =?utf-8?B?Wmwvb1lvOW9OdWo5SjhmU2hGcnRNN29pdy9ZKzFTNXV4bmVZY0JMQ0lsM1JY?=
 =?utf-8?B?WkRhc3FCNjl2aDJZeFNBWk9oVWRZTlZIWW9lUW5xY2dPRlBrTXljVk04MS9I?=
 =?utf-8?B?TnJLNW9tZEMxeUk2bXNFR25BUDdrZlNEZjFWTzNpek1tOW9yOG1oTWJuOGdj?=
 =?utf-8?B?d0xrdXU3c3VQZkZWNG9lNnAzenZ3a1pBbC9mUG82RkMrWnhMMFpGT3V5RHZy?=
 =?utf-8?B?TmlEQUwvcUEzcVp4dERKRGVFWFp1SzZVMStmdEV5dmhPcllycnZvdks3NHVT?=
 =?utf-8?B?VlNOSktISXUxQnRVeVpKRGZ6R3ZQLzd4VzZReE1QRytpWVovSUNtTUhmWVZP?=
 =?utf-8?B?QzdIK3dHd3RsNVJqeVZwTmIzaFhpVGFJV2xtZ1RFbzVER1FLS200M0pnMUJR?=
 =?utf-8?B?MGd3Zmo1bXVZdlkwTHk2cksxVVV2UmF3Z3FKbjZkUlRpdVNPeHBuWDdXMG1K?=
 =?utf-8?B?T3VIRVpsY1RucWJQSSthRVJXT2M0QjB0WXhvKzNDcDJhbmxaZUFGUVYxMFFo?=
 =?utf-8?B?RjZwTGpRdnlXNTJvdGcyMEtxNUdDcGg3WVVIMzBwSkwrNUpXZWdLVzhNcjhh?=
 =?utf-8?B?MWd3WXFjZW1HYzJLOTZIejV6ampRKzZFaFNkWDFTWjY4WERHNUJiOGF4TmxW?=
 =?utf-8?B?Z1hqR0V1NEdpMWRWWC9QTGtIMnkzczBxbGZOamVCRTdiNUl5ZDRIMmpwR3Zv?=
 =?utf-8?B?MWVRK2h3dzk5N0x0azE0a3kxUVQwS3kzZmlVVVVRcjdqNkRyMXpJMk5BUzJR?=
 =?utf-8?B?SGNHUWNHU3pxd1cvSUZSbWY2U05YWFJIbjRwVGh4U25KRDg5b0MzeHB2dnRR?=
 =?utf-8?B?bm15T2o0WGh5UUZqUVNJeldHQ0xtU3RYendIa2JyN2lKeWs1b0ExMG9EYUhx?=
 =?utf-8?B?ZkhLL3VKZ1lTaVJwM2VWYXlqS1hMOUd5aUtMcU5YTWh4Ty9tQUlzaGk3cTBt?=
 =?utf-8?B?OW8rWGRtSEsxdHhYdXJBcDBVaklPVWhSM2o5aktUd2FrQnpZOVA5OUxXUEtS?=
 =?utf-8?B?NktoUXR1UWM2VU56U0Q3U2xmMVpBWmtjRGRRZnpoKy9YVEpuaTBsMGN0dklk?=
 =?utf-8?B?Ty9JSEFIUzE0V05JRm5jNGI5WWtOOXVVbFBXd25rVkE1Wm42MzZid1QzMlpJ?=
 =?utf-8?B?Y010eGdDSk9qWG1Cc2NISmVMK0s0YXMwcjhhQ0l6NGNpL0ZjTmJ2VGlURGhL?=
 =?utf-8?B?TFYwaVl0K2w2V080dVhsMUpTRmVZVU5xT3ZwaEFSTC9OMHZCQzhNdkZJZU54?=
 =?utf-8?B?VjlzcjBJeXBqVE5VUUFGYzBHeThDaC9rZDVnelBJNStHZjg2UEEvejA1MTJy?=
 =?utf-8?B?REVoTXdONUFIMEtJY0ZvRU1YM3RpOHR0Tnh1cUVEMm9xNEdLRERxS0p3emlD?=
 =?utf-8?B?N1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f07847b-e8b1-434f-915c-08de334d2948
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 15:52:43.4720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rfzFtS/88tnDm/czHOk6gRcVGQG4nYS+v0CwQygACh847ccjCmOMkkFKcLkqWjGRAQ/9lmxo0dj0nwMjv43Hww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6513
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


On 03-12-2025 06:18, Umesh Nerlige Ramappa wrote:
> Define system controller config bits and helpers for SoC remapper.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
> v2: (Badal)
> - Add kernel doc for function
> ---
>   drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h |  1 +
>   drivers/gpu/drm/xe/xe_soc_remapper.c           | 13 +++++++++++++
>   drivers/gpu/drm/xe/xe_soc_remapper.h           |  1 +
>   3 files changed, 15 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h b/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
> index 9edf234227a9..be0eb37e73ad 100644
> --- a/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
> @@ -9,5 +9,6 @@
>   
>   #define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
>   #define   SG_REMAP_TELEM_MASK		REG_GENMASK(31, 24)
> +#define   SG_REMAP_SYSCTRL_MASK		REG_GENMASK(23, 16)
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.c b/drivers/gpu/drm/xe/xe_soc_remapper.c
> index d28fd9f3c253..273e34c4183a 100644
> --- a/drivers/gpu/drm/xe/xe_soc_remapper.c
> +++ b/drivers/gpu/drm/xe/xe_soc_remapper.c
> @@ -27,6 +27,19 @@ void xe_soc_remapper_set_telem_region(struct xe_device *xe, u32 index)
>   				   REG_FIELD_PREP(SG_REMAP_TELEM_MASK, index));
>   }
>   
> +/**
> + * xe_soc_remapper_set_sysctrl_region() - Select the system controller function
> + * @xe: Pointer to xe device.
> + * @index: Index of the function to be accessed.
> + *
> + * Selects a specific system controller function based on the index passed.
> + */
> +void xe_soc_remapper_set_sysctrl_region(struct xe_device *xe, u32 index)
> +{
> +	

Protect access using has flag on unsupported platform.

Thanks,
Badal

> xe_soc_remapper_set_region(xe, SG_REMAP_INDEX1, SG_REMAP_SYSCTRL_MASK,
> +				   REG_FIELD_PREP(SG_REMAP_SYSCTRL_MASK, index));
> +}
> +
>   /**
>    * xe_soc_remapper_init() - Initialize SoC remapper
>    * @xe: Pointer to xe device.
> diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.h b/drivers/gpu/drm/xe/xe_soc_remapper.h
> index c7bee284405b..137c9f6f3bbe 100644
> --- a/drivers/gpu/drm/xe/xe_soc_remapper.h
> +++ b/drivers/gpu/drm/xe/xe_soc_remapper.h
> @@ -10,5 +10,6 @@
>   
>   int xe_soc_remapper_init(struct xe_device *xe);
>   void xe_soc_remapper_set_telem_region(struct xe_device *xe, u32 index);
> +void xe_soc_remapper_set_sysctrl_region(struct xe_device *xe, u32 index);
>   
>   #endif

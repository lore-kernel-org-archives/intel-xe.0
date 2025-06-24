Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60EDC77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 09:37:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E6E10E54A;
	Tue, 24 Jun 2025 09:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S6Cr6xPx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C4710E54A
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 09:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750757869; x=1782293869;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=uKTXoWTskxZKvUXVDdver82kNKDuY8QaRdHr0LC+Wz0=;
 b=S6Cr6xPxG09EHh7Ara+5dAzRWVLdqfCkDx2GQ3mZB8VXs27fXCPm4nwV
 K5kowEA1SBL0FAipCM3gmrqcNxxrLA+dopjGLpOaT5lz2/LAYFIQ1BRtt
 /qpyU8b3NWBu+bgp2OwgtCnhIAPpE1ms9zhGZtMatF4MactTdFYtWVFsV
 Nqcc4LJ2eH5fy5oF4Dgfqbi/paXWk+EtyXhoWQxAXlWNQkTz4LcX2MN8q
 eLGTmXSsyaqRdYs5cercLIdHapSc+gvWizF2tKfdF8NII8vvvwMiRZfuQ
 DLjbdJlsxqzYEo651YrhHGeul7dSQDV43A6AI2iicxtXw+yVYNzcTK2l0 w==;
X-CSE-ConnectionGUID: Ps9ZeQrzSVStbOZUYnfcHQ==
X-CSE-MsgGUID: HiqSb3LHQiWboV6c+FgF1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52219569"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208,217";a="52219569"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:37:49 -0700
X-CSE-ConnectionGUID: usbSw4E2Q2OM1F2xIJrtsg==
X-CSE-MsgGUID: tu4y9WqNQeSOoLGf+Mdk1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
 d="scan'208,217";a="189061998"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:37:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 02:37:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 02:37:47 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.42) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 02:37:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KaB5FshXCxgZv4KOGlSCxQAK0TBC4iTp2PWvw+wMBP2XfWBE/9/BuAUinrlBjN1ibdMF0Pw/T5U6nvYcBMkPiddNC3+NUhkHOeWunWYpLyD4I496xT6ozH9PBxevbbmXK1J+3dcKezsUTCRO5itE8+ZxnFZPpFrc2wUU7Y+oe/4BdU7A2BBAKFHz53Vy72Ky2qEjDEkbZuqXUzx1eaOlKWnswa+QV6aS/ZKIjT3fuOQWu19iXGLPeDaQsCASWU46I4NmAEoB1QK+grZ1984bqBf2KddXphlUDQBEPte+Q4adEgHlx98BQQVT14tK8adUxhZpyd7wDKGHl2u2QZ8jng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14K+6L51TK3rtXK2ATDUz/EYIDemkLZ4yjPh1FHo4mI=;
 b=OPqhfFEK24+/YKahY4nCwBNS28SMV4ZyuwOPu3VJV0/uabNw0UTDHimTSaiG2KjI6toIZT1XWJE3g9x8vxvZV46L6pUOLbzQUgZhvretHh9RE2NPYV9j8eVgU0I2fTBPlKYYG1ReZM5npWpH39EOHBQsLEpLTsbxXf4EAXzZX2PdkESpc0/bb62xgJiqcY9kvvvUBUNcoGuXIR/xp7PLaAWGmS7jla5bzDoQ0O5RPKg53RqY1A8mw4eLhjyeSb3VgpuSt1mMIRYtpn+eAkyHOe9CdBAQEF5zk838QkjXYaLTqGW3plC6zybSMat6kLyPSWbn3tO803P2yslF8sI4Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by IA1PR11MB7870.namprd11.prod.outlook.com (2603:10b6:208:3f8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 09:37:31 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 09:37:31 +0000
Content-Type: multipart/alternative;
 boundary="------------Awo0SdSgtVnptmq68UVzQW82"
Message-ID: <560c4e8f-0c0c-4045-a522-ac663d145984@intel.com>
Date: Tue, 24 Jun 2025 15:07:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] drm/xe/vf: Attach and detach CCS copy commands
 with BO
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, "Winiarski, Michal" <michal.winiarski@intel.com>,
 "Lis, Tomasz" <tomasz.lis@intel.com>
References: <20250619080459.27731-1-satyanarayana.k.v.p@intel.com>
 <20250619080459.27731-3-satyanarayana.k.v.p@intel.com>
 <aFWLbiiMQ8ZnIL2x@lstrano-desk.jf.intel.com>
 <aFnKJ5HGBrSjz9x2@lstrano-desk.jf.intel.com>
 <LV3PR11MB8695FE036F1B93E821901DBEF978A@LV3PR11MB8695.namprd11.prod.outlook.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <LV3PR11MB8695FE036F1B93E821901DBEF978A@LV3PR11MB8695.namprd11.prod.outlook.com>
X-ClientProxiedBy: MA0PR01CA0054.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::6) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|IA1PR11MB7870:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ad292e4-8245-42a2-4b16-08ddb302bd9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXd3MnBDd3VPV2NuWnQ0STNZMGw1c25tTk5MTlNHU2tHNkRjUFFZUEw1ZThy?=
 =?utf-8?B?SklZR0dIWVh5dFNRK1NzTHBBV2dra1hkK0ZMNmNhemduRkE3QlNXOEl6bVlJ?=
 =?utf-8?B?NFhaM21DT2VOM3hkQ0d2ZmNXOEtzeWZxa2x4czlULzZZYnVFK2FTN0s1ZHN4?=
 =?utf-8?B?NVdLeU9GZmRRUnBKdGhMNlJ6WDFjR2ZiYXpXRVpyeVhXamZoMWJ5QlRPVENh?=
 =?utf-8?B?clhEYVdibXFrNUhMbDRtOTdhNWVTek1ZcU9KZ0pMb2xFbnlFN0U0TkZ4UllO?=
 =?utf-8?B?aE55Z2VCdkJsVVVlTUV2aVNzZjg3MFVQSnlHSXZjeFhhMWt1dCtoeTdBU2ZM?=
 =?utf-8?B?dVZZaUxpM3RjS2FkeUhEN2RzWm5xU05HVEIxL1ZKVUFMYS9Ycjd0MEdQVSsz?=
 =?utf-8?B?SjZUN3c3Zk9KZCtHWGM1RUdNb1hHVU9MbzNzdDA2WDdHc3lwNmZYcU5wWEti?=
 =?utf-8?B?eEt4aGdUZWxveWpPZVdFcmh6bDl6Qk50QXRWMThJek96clFUMlgyMndlOTkr?=
 =?utf-8?B?Q29IWVRBL2M2TDVDbUhqUnp4QXhBRHpaM1JDdXVKOHNNRFlPKzJ4a2h1RlVN?=
 =?utf-8?B?WFV5MGR1NlpxcWVPRkFxNC9VaERzL2ZJL3pTMTdNWW9VcE5McHQ3cFU3NFZh?=
 =?utf-8?B?R0dDaVBHVXFXTkloNms0SHJadTVENW5IMkp2ckZnejgzNUg1MWFHZ0h2ZWdM?=
 =?utf-8?B?dndSRTJMT1V1ODRuQkVMaEF6SnVPa0hJQVZmVGtjbWVqYkZBaWtiMmY1VXhu?=
 =?utf-8?B?UGl2Q2toc1EzMm4xdDBvYzErTzVzRksxcGNMaDBEK0VQOVJnanRUblN6UUlv?=
 =?utf-8?B?L2paM2RjdElVUk5SbTU0QThRZ3NOQjIvb09hQ0xjS1c0aXJCOEp0TERiTndC?=
 =?utf-8?B?aWFwYTQ0d2FKMDN3RzNkRmVlWE1zNzZFczVoNTROVm5vNi8rZVFBU3dDSjZO?=
 =?utf-8?B?dEZQWWx5cFo0Z2gzRGdOUStiQWdicHV1NGFsVHNRYXluT1MzMzRiL2RZMnRK?=
 =?utf-8?B?cExDYkZxR2FRWUYwQTZwd3dmQmNzK01ramg0NUlXQmJOR0JXWnVpb28xZk0x?=
 =?utf-8?B?NWtoSytlMkN4Y3c2MlpCNzNCSXhsY290RnpaUEVDZzJwamUyZ2tWcUFZaWdB?=
 =?utf-8?B?VnF5QXlvWklwNmFpSDRjR0JGVFQ1TkpSeWdad2ZzSXhGZWlzWFFKczIrTmto?=
 =?utf-8?B?ajlmZGgrQVQ1S1FzRERQMEx3V0J4QlVaR2ZXTnFycjliV1NQZWJYL1I1akVX?=
 =?utf-8?B?bndyamZ0MnBPOFgwU24zRURvR1J0eWVmOEQ5N1pGZ3lwd1lONmN2bDdqc0Vx?=
 =?utf-8?B?VEgzY2IwOHdENCtqWEFISmxId0lVczN2b2Rrb0VzZTYyaUpsUllFVmhYSHlH?=
 =?utf-8?B?eksycmpLT2JUWThDV1pKRVJVa3p1U3NrbGlaR3RHNTI2dHFrcStULzQ4Z0ZC?=
 =?utf-8?B?Sy9EdlhHa0RKclFkWnJ1dERpYXJLOWZKRmdoVi9RL1kxNlEvaUZhckNHVHJZ?=
 =?utf-8?B?STc4ZXhNVUFDdFg5Qm1UUzViNmJCTE5aYTBpRjZpdDRETzZMR3BITkwrSVVv?=
 =?utf-8?B?Kzc3dk12akRrd0tNbTY5K0JmaXF4M0xHMWNvTGJ5L0VrUUV0VHhrQkJBQ2xR?=
 =?utf-8?B?K1I4MWpJT05ISUpzcFp6aUFxMFBMUGZRZ2ZBR1l6MkVaUFBIV3R5SmFUa29z?=
 =?utf-8?B?NUlyWTdwdnRkYm9xZlI2dzRIQ21jclVpL0NPTVRjVzlOQThJcEtNZ21nOWJJ?=
 =?utf-8?B?a1ZraTh5NWVjTVVLRVVxL1llM090RjNZU05HcXFvdjA5TGllNkdXd25SNmsz?=
 =?utf-8?B?K1NIcE1PN245eUJVVHNib0VHdTNVVm9RVGhocS9ENGFEd2wxNFUwSHFXWGFW?=
 =?utf-8?B?eHFBNVV6VWt1OUY3eGp3c0p3eGhSemVuSjNPNDlUcXhBRlVnNHk2d080Q3dK?=
 =?utf-8?Q?0Q+lerQT6r0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUd2NVplWW1WODV6VDR6K3NiWjJvRXJlTytJR0cwUzJTS2JnZjA3TWFQck5H?=
 =?utf-8?B?bmY5KzRZQnFFWUpiemQyc1VnaEJIL1J1a2xGUEZPVEFIV2poMUpydlZNOFM0?=
 =?utf-8?B?YzZWQmRia3FhT0FXeUtLTENlMVprZTVLbzRHMnJISmJqbmgzN1RkczhsZWtz?=
 =?utf-8?B?dE8xZU56R1RJZysrWENqMTBxbHEyTDgwVzFZNTJaSTZtSnMzUCtYM0xQT3lh?=
 =?utf-8?B?M21Va3pnVjMvTmdDY21ldjJYQW9Jb0hMZ2dWTUM2WjdaUGtVdUUrQ2l2cDF0?=
 =?utf-8?B?Y3pTOTJUejVTQUY1YkZGVUY5b0xGSEw4c3FZZGNheXZEVDhucWRtaUF6VHVl?=
 =?utf-8?B?TzNJU001aFF6QW1zQ3lDSU5hZCszYzY5anRMRkRxMEwwSGtLWDV5Q3lSWGNs?=
 =?utf-8?B?ZTNyVFM1ZC9UaiszYjc4clByUlJUaGZ4SHFPejhhSGMvd1dKZ1p4OUU1MlFq?=
 =?utf-8?B?MUlUYjd2RlAvTGhNRVNkOUE5Yk5TdW1qUE1XYVBjQ0hnWm9nMWxWTC9oSXBL?=
 =?utf-8?B?L1VtdjAycWFWWVV6aUpQT3dZYWlQQTNxQklSUnppbjVwcmFrNTNnR1lqODRX?=
 =?utf-8?B?OVpLNXFQaFl6bFplT3VvWWNONnRtTlRqV1E1K2wvdVFmeUU1RzMvekVLaHQv?=
 =?utf-8?B?bSswUXR5aUJqQjc2ZStnMUYrK21FWUEzLzF6UkdLQ0NqSDNaaThpbnprR0VQ?=
 =?utf-8?B?VU43UE5hVlJ4a0x0d3lHOTJaTy92ODFJWG4wYldFZS8rQVRTTmNzRCtXOHNz?=
 =?utf-8?B?U2lzNmtxVkFxNEpKNmRUKzllRTNrcWl2M3EvQlFyYzRCNHh6a0ZqMXR1aVNJ?=
 =?utf-8?B?YzVHZWIvU0VzMmllamVTcFdnLzJQakZZQW83dlFaUzV5eDRHZUdQTE5kZWhv?=
 =?utf-8?B?RG5wRmpHaDJkMlR3Mk12eG1KUHVZM0tqdmpLdkkzWFArVnRTTFZ4QkZaK2Ra?=
 =?utf-8?B?TXRQdDZRZFVwbWNYelRUOXh4MTNyOTY0T3NOMjlwcDVjcXhVM2VubTFDeUJX?=
 =?utf-8?B?eVBXQldnYms4ZGZRN2ZaVVBVTm1ELzd3SWFWSS9NRlhTTm9VcjR4ZStpdEF6?=
 =?utf-8?B?RGZQaXRhcnpNam5aZXV5ZmtiMlJEaE1udWhCa3ZZVUJzRUVodnR6azFWZFQ4?=
 =?utf-8?B?djd3VTBoTlp6OHFVTVVJTUJUTzhWcUF5anV5ZFcyTDR4ei9rTFJnejljZXIx?=
 =?utf-8?B?ekJnaHlscnpOSUF4UGhQcEI1eWlYWG11VStad2tVR2k0cHZ6T3ZlSjRQa0tj?=
 =?utf-8?B?RmJsSmVHK0JpckhDN0dzNEhLcWxVVnRWVnR4MndSVjVZYzk0MDFTM2pzTG94?=
 =?utf-8?B?ZVFSellBbjhncXYrWHZUYjBEclFZNTRGbkNyK0FDREN5YmhDamRNMzc2WEw4?=
 =?utf-8?B?Mnp5WHZBbEVtSTQ0NjF5bHNraXM0ZlJpekJtb1hWT2c4L2UvRllWczh2Qkor?=
 =?utf-8?B?Si8vbVBQajhZTzd3UUlOcHVpOXVPcXdJRmFhcnZCbXdvd1Bsa1R6Y3ltWVM0?=
 =?utf-8?B?SWNtamFZNDhMMVFYblNhNCtCOGZDMWRvMTU3cVRZdkxSVFNwOXdWbUZ2WTJs?=
 =?utf-8?B?VW04Mk5vVWZaNitDZ29kb1hlNkQrdTVsUXZtd0EzRnJsd3EyRUtjb05MYXh6?=
 =?utf-8?B?cDRkSWdDazlCRXcrdlM5bjFTUjhqdmlMRHh2cDFtQTF3UUxUT0ZUWitveW0x?=
 =?utf-8?B?dGVObUJkbXlPWCszMXluQS93cy9IeFVsZWNFU3pSc2xaR0tmNGZnV3hkazBO?=
 =?utf-8?B?TzBNR056a2IyMXhLVmN5UlFrc0JMMXFKaFRYa2d1eVBpM2Fib1NPdXMzTUNl?=
 =?utf-8?B?Zkl3S2ZrUE42Wm5zTDZTZ2pRSTVrYWd2clJadS8vTHRRMGhMakIxTkU2N1M4?=
 =?utf-8?B?NHNuZXQ2VEtXR1VlRThxc1dyamd4bjJqeURqZDNPV1FOMUtDaGVUR2NESzdt?=
 =?utf-8?B?R0RIeFZjaUxteDVXbnZNeFNWa3NadjZ0NWxTYy9yQWZROHgzU1lkU2FjazFt?=
 =?utf-8?B?aFdkR0NVUi85VlV3NW1SSkc4MHozQ1RXby9ZY21NbzZYdEpMSWtETFM0YmtE?=
 =?utf-8?B?VjE2VEZzZkFaaW50Ujhndnp6ZnY1U1FYV1JFeldERXM5R1h5dmVFUEx3enpI?=
 =?utf-8?B?M29mUm5FVW5yOFB3ZW9GWTlnaFVxQUt3MFFMMEJIL1kwc2JQRTY0VUZDeW5x?=
 =?utf-8?B?ZGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad292e4-8245-42a2-4b16-08ddb302bd9e
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 09:37:31.2758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JW1m/dP7iI1vTYRlpqdiymnNaPwSOLblT5hUqSi3eYkgl9ekrQlb0DxdldZh45lkQ3hk+n1vh4LJfa9xgPBwgM+C5v5eSzv5leKDCBXYZ9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7870
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

--------------Awo0SdSgtVnptmq68UVzQW82
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 24-06-2025 10:28, K V P, Satyanarayana wrote:
> Hi.
>> -----Original Message-----
>> From: Brost, Matthew<matthew.brost@intel.com>
>> Sent: Tuesday, June 24, 2025 3:12 AM
>> To: K V P, Satyanarayana<satyanarayana.k.v.p@intel.com>
>> Cc:intel-xe@lists.freedesktop.org; Wajdeczko, Michal
>> <Michal.Wajdeczko@intel.com>; Auld, Matthew<matthew.auld@intel.com>;
>> Winiarski, Michal<michal.winiarski@intel.com>; Lis, Tomasz
>> <tomasz.lis@intel.com>
>> Subject: Re: [PATCH v8 2/3] drm/xe/vf: Attach and detach CCS copy
>> commands with BO
>>
>> On Fri, Jun 20, 2025 at 09:25:18AM -0700, Matthew Brost wrote:
>>> On Thu, Jun 19, 2025 at 01:34:58PM +0530, Satyanarayana K V P wrote:
>>>> Attach CCS read/write copy commands to BO for old and new mem types
>> as
>>>> NULL -> tt or system -> tt.
>>>> Detach the CCS read/write copy commands from BO while deleting ttm bo
>>>> from xe_ttm_bo_delete_mem_notify().
>>>>
>>>> Signed-off-by: Satyanarayana K V P<satyanarayana.k.v.p@intel.com>
>>>> Cc: Michal Wajdeczko<michal.wajdeczko@intel.com>
>>>> Cc: Matthew Brost<matthew.brost@intel.com>
>>>> Cc: Matthew Auld<matthew.auld@intel.com>
>>>> Cc: Michał Winiarski<michal.winiarski@intel.com>
>>>> ---
>>>> Cc: Tomasz Lis<tomasz.lis@intel.com>
>>>>
>>>> V7 -> V8:
>>>> - Removed xe_bb_ccs_realloc() and created a single BB by calculating the
>>>> BB size first and then emitting the commands. (Matthew Brost)
>>>> - Added xe_assert() if BB is not NULL in xe_sriov_vf_ccs_attach_bo().
>>>>
>>>> V6 -> V7:
>>>> - Created xe_bb_ccs_realloc() to create a single BB instead of maintaining
>>>> a list. (Matthew Brost)
>>>>
>>>> V5 -> V6:
>>>> - Removed dead code from xe_migrate_ccs_rw_copy() function. (Matthew
>> Brost)
>>>> V4 -> V5:
>>>> - Create a list of BBs for the given BO and fixed memory leak while
>>>> detaching BOs. (Matthew Brost).
>>>> - Fixed review comments (Matthew Brost & Matthew Auld).
>>>> - Yet to cleanup xe_migrate_ccs_rw_copy() function.
>>>>
>>>> V3 -> V4:
>>>> - Fixed issues reported by patchworks.
>>>>
>>>> V2 -> V3:
>>>> - Attach and detach functions check for IS_VF_CCS_READY().
>>>>
>>>> V1 -> V2:
>>>> - Fixed review comments.
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_bb.c                 |  35 ++++++
>>>>   drivers/gpu/drm/xe/xe_bb.h                 |   3 +
>>>>   drivers/gpu/drm/xe/xe_bo.c                 |  23 ++++
>>>>   drivers/gpu/drm/xe/xe_bo_types.h           |   3 +
>>>>   drivers/gpu/drm/xe/xe_migrate.c            | 130 +++++++++++++++++++++
>>>>   drivers/gpu/drm/xe/xe_migrate.h            |   6 +
>>>>   drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       |  72 ++++++++++++
>>>>   drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |   3 +
>>>>   drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |   8 ++
>>>>   9 files changed, 283 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
>>>> index 9570672fce33..533352dc892f 100644
>>>> --- a/drivers/gpu/drm/xe/xe_bb.c
>>>> +++ b/drivers/gpu/drm/xe/xe_bb.c
>>>> @@ -60,6 +60,41 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32
>> dwords, bool usm)
>>>>   	return ERR_PTR(err);
>>>>   }
>>>>
>>>> +struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
>>>> +			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
>>>> +{
>>>> +	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
>>>> +	struct xe_tile *tile = gt_to_tile(gt);
>>>> +	struct xe_sa_manager *bb_pool;
>>>> +	int err;
>>>> +
>>>> +	if (!bb)
>>>> +		return ERR_PTR(-ENOMEM);
>>>> +	/*
>>>> +	 * We need to allocate space for the requested number of dwords &
>>>> +	 * one additional MI_BATCH_BUFFER_END dword. Since the whole SA
>>>> +	 * is submitted to HW, we need to make sure that the last instruction
>>>> +	 * is not over written when the last chunk of SA is allocated for BB.
>>>> +	 * So, this extra DW acts as a guard here.
>>>> +	 */
>>>> +
>>>> +	bb_pool = tile->sriov.vf.ccs[ctx_id].mem.ccs_bb_pool;
>>>> +	bb->bo = xe_sa_bo_new(bb_pool, 4 * (dwords + 1));
>>>> +
>>>> +	if (IS_ERR(bb->bo)) {
>>>> +		err = PTR_ERR(bb->bo);
>>>> +		goto err;
>>>> +	}
>>>> +
>>>> +	bb->cs = xe_sa_bo_cpu_addr(bb->bo);
>>>> +	bb->len = 0;
>>>> +
>>>> +	return bb;
>>>> +err:
>>>> +	kfree(bb);
>>>> +	return ERR_PTR(err);
>>>> +}
>>>> +
>>>>   static struct xe_sched_job *
>>>>   __xe_bb_create_job(struct xe_exec_queue *q, struct xe_bb *bb, u64
>> *addr)
>>>>   {
>>>> diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
>>>> index fafacd73dcc3..32c9c4c5d2be 100644
>>>> --- a/drivers/gpu/drm/xe/xe_bb.h
>>>> +++ b/drivers/gpu/drm/xe/xe_bb.h
>>>> @@ -13,8 +13,11 @@ struct dma_fence;
>>>>   struct xe_gt;
>>>>   struct xe_exec_queue;
>>>>   struct xe_sched_job;
>>>> +enum xe_sriov_vf_ccs_rw_ctxs;
>>>>
>>>>   struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 size, bool usm);
>>>> +struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
>>>> +			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
>>>>   struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
>>>>   				      struct xe_bb *bb);
>>>>   struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue
>> *q,
>>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>>> index 4e39188a021a..beaf8544bf08 100644
>>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>>> @@ -31,6 +31,7 @@
>>>>   #include "xe_pxp.h"
>>>>   #include "xe_res_cursor.h"
>>>>   #include "xe_shrinker.h"
>>>> +#include "xe_sriov_vf_ccs.h"
>>>>   #include "xe_trace_bo.h"
>>>>   #include "xe_ttm_stolen_mgr.h"
>>>>   #include "xe_vm.h"
>>>> @@ -947,6 +948,20 @@ static int xe_bo_move(struct ttm_buffer_object
>> *ttm_bo, bool evict,
>>>>   	dma_fence_put(fence);
>>>>   	xe_pm_runtime_put(xe);
>>>>
>>>> +	/*
>>>> +	 * CCS meta data is migrated from TT -> SMEM. So, let us detach the
>>>> +	 * BBs from BO as it is no longer needed.
>>>> +	 */
>>>> +	if (IS_VF_CCS_BB_VALID(xe, bo) && old_mem_type == XE_PL_TT &&
>>>> +	    new_mem->mem_type == XE_PL_SYSTEM)
>>>> +		xe_sriov_vf_ccs_detach_bo(bo);
>>>> +
>>>> +	if (IS_SRIOV_VF(xe) &&
>>>> +	    ((move_lacks_source && new_mem->mem_type == XE_PL_TT) ||
>>>> +	     (old_mem_type == XE_PL_SYSTEM && new_mem->mem_type ==
>> XE_PL_TT)) &&
>>>> +	    handle_system_ccs)
>>>> +		ret = xe_sriov_vf_ccs_attach_bo(bo);
>>>> +
>>> You don't check the 'ret' value of xe_sriov_vf_ccs_attach_bo. That seems be
>> an oversight.

The error is returned to the caller after this. So, not checked explicitly.

>>>>   out:
>>>>   	if ((!ttm_bo->resource || ttm_bo->resource->mem_type ==
>> XE_PL_SYSTEM) &&
>>>>   	    ttm_bo->ttm) {
>>>> @@ -957,6 +972,9 @@ static int xe_bo_move(struct ttm_buffer_object
>> *ttm_bo, bool evict,
>>>>   		if (timeout < 0)
>>>>   			ret = timeout;
>>>>
>>>> +		if (IS_VF_CCS_BB_VALID(xe, bo))
>>>> +			xe_sriov_vf_ccs_detach_bo(bo);
>>>> +
>>>>   		xe_tt_unmap_sg(xe, ttm_bo->ttm);
>>>>   	}
>>>>
>>>> @@ -1483,9 +1501,14 @@ static void xe_ttm_bo_release_notify(struct
>> ttm_buffer_object *ttm_bo)
>>>>   static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object
>> *ttm_bo)
>>>>   {
>>>> +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
>>>> +
>>>>   	if (!xe_bo_is_xe_bo(ttm_bo))
>>>>   		return;
>>>>
>>>> +	if (IS_VF_CCS_BB_VALID(ttm_to_xe_device(ttm_bo->bdev), bo))
>>>> +		xe_sriov_vf_ccs_detach_bo(bo);
>>>> +
>>>>   	/*
>>>>   	 * Object is idle and about to be destroyed. Release the
>>>>   	 * dma-buf attachment.
>>>> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h
>> b/drivers/gpu/drm/xe/xe_bo_types.h
>>>> index eb5e83c5f233..642e519fcfd1 100644
>>>> --- a/drivers/gpu/drm/xe/xe_bo_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
>>>> @@ -78,6 +78,9 @@ struct xe_bo {
>>>>   	/** @ccs_cleared */
>>>>   	bool ccs_cleared;
>>>>
>>>> +	/** @bb_ccs_rw: BB instructions of CCS read/write. Valid only for VF
>> */
>>>> +	struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
>>>> +
>>>>   	/**
>>>>   	 * @cpu_caching: CPU caching mode. Currently only used for
>> userspace
>>>>   	 * objects. Exceptions are system memory on DGFX, which is always
>>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
>> b/drivers/gpu/drm/xe/xe_migrate.c
>>>> index 8f8e9fdfb2a8..c730b34071ad 100644
>>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>>>> @@ -940,6 +940,136 @@ struct dma_fence *xe_migrate_copy(struct
>> xe_migrate *m,
>>>>   	return fence;
>>>>   }
>>>>
>>>> +/**
>>>> + * xe_migrate_ccs_rw_copy() - Copy content of TTM resources.
>>>> + * @m: The migration context.
>>>> + * @src_bo: The buffer object @src is currently bound to.
>>>> + * @read_write : Creates BB commands for CCS read/write.
>>>> + *
>>>> + * Creates batch buffer instructions to copy CCS metadata from CCS pool
>> to
>>>> + * memory and vice versa.
>>>> + *
>>>> + * This function should only be called for IGPU.
>>>> + *
>>>> + * Return: 0 if successful, negative error code on failure.
>>>> + */
>>>> +int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
>>>> +			   struct xe_bo *src_bo,
>>>> +			   enum xe_sriov_vf_ccs_rw_ctxs read_write)
>>>> +
>>>> +{
>>>> +	bool src_is_pltt = read_write == XE_SRIOV_VF_CCS_WRITE_CTX;
>>>> +	bool dst_is_pltt = read_write == XE_SRIOV_VF_CCS_READ_CTX;
>>>> +	struct ttm_resource *src = src_bo->ttm.resource;
>>>> +	struct xe_gt *gt = m->tile->primary_gt;
>>>> +	u32 batch_size, batch_size_allocated;
>>>> +	struct xe_device *xe = gt_to_xe(gt);
>>>> +	struct xe_res_cursor src_it, ccs_it;
>>>> +	u64 size = src_bo->size;
>>>> +	struct xe_bb *bb = NULL;
>>>> +	u64 src_L0, src_L0_ofs;
>>>> +	u32 src_L0_pt;
>>>> +	int err;
>>>> +
>>>> +	xe_res_first_sg(xe_bo_sg(src_bo), 0, size, &src_it);
>>>> +
>>>> +	xe_res_first_sg(xe_bo_sg(src_bo), xe_bo_ccs_pages_start(src_bo),
>>>> +			PAGE_ALIGN(xe_device_ccs_bytes(xe, size)),
>>>> +			&ccs_it);
>>>> +
>>>> +	/* Calculate Batch buffer size */
>>>> +	batch_size = 0;
>>>> +	while (size) {
>>>> +		batch_size += 6; /* Flush + 2 NOP */
>>>> +		u64 ccs_ofs, ccs_size;
>>>> +		u32 ccs_pt;
>>>> +
>>>> +		u32 avail_pts = max_mem_transfer_per_pass(xe) /
>> LEVEL0_PAGE_TABLE_ENCODE_SIZE;
>>>> +
>>>> +		src_L0 = min_t(u64, max_mem_transfer_per_pass(xe), size);
>>>> +
>>>> +		batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
>>>> +					      &src_L0_ofs, &src_L0_pt, 0, 0,
>>>> +					      avail_pts);
>>>> +
>>>> +		ccs_size = xe_device_ccs_bytes(xe, src_L0);
>>>> +		batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size,
>> &ccs_ofs,
>>>> +					      &ccs_pt, 0, avail_pts, avail_pts);
>>>> +		xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
>>>> +
>>>> +		/* Add copy commands size here */
>>>> +		batch_size += EMIT_COPY_CCS_DW;
>>>> +
>>>> +		size -= src_L0;
>>>> +	}
>>>> +
>>>> +	bb = xe_bb_ccs_new(gt, batch_size, read_write);
>>>> +	if (IS_ERR(bb)) {
>>>> +		drm_err(&xe->drm, "BB allocation failed.\n");
>>>> +		err = PTR_ERR(bb);
>>>> +		goto err_ret;
>>>> +	}
>>>> +
>>>> +	batch_size_allocated = batch_size;
>>>> +	size = src_bo->size;
>>>> +	batch_size = 0;
>>>> +
>>>> +	/*
>>>> +	 * Emit PTE and copy commands here.
>>>> +	 * The CCS copy command can only support limited size. If the size to
>> be
>>>> +	 * copied is more than the limit, divide copy into chunks. So, calculate
>>>> +	 * sizes here again before copy command is emitted.
>>>> +	 */
>>>> +	while (size) {
>>>> +		batch_size += 6; /* Flush + 2 NOP */
>>>> +		u32 flush_flags = 0;
>>>> +		u64 ccs_ofs, ccs_size;
>>>> +		u32 ccs_pt;
>>>> +
>>>> +		u32 avail_pts = max_mem_transfer_per_pass(xe) /
>> LEVEL0_PAGE_TABLE_ENCODE_SIZE;
>>>> +
>>>> +		src_L0 = xe_migrate_res_sizes(m, &src_it);
>>>> +
>>>> +		batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
>>>> +					      &src_L0_ofs, &src_L0_pt, 0, 0,
>>>> +					      avail_pts);
>>>> +
>>>> +		ccs_size = xe_device_ccs_bytes(xe, src_L0);
>>>> +		batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size,
>> &ccs_ofs,
>>>> +					      &ccs_pt, 0, avail_pts, avail_pts);
>>>> +		xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
>>>> +		batch_size += EMIT_COPY_CCS_DW;
>>>> +
>>>> +		emit_pte(m, bb, src_L0_pt, false, true, &src_it, src_L0, src);
>>>> +
>>>> +		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
>>>> +
>>>> +		bb->cs[bb->len++] = MI_FLUSH_DW | MI_INVALIDATE_TLB |
>> MI_FLUSH_DW_OP_STOREDW |
>>>> +					MI_FLUSH_IMM_DW;
>>>> +		bb->cs[bb->len++] = MI_NOOP;
>>>> +		bb->cs[bb->len++] = MI_NOOP;
>>>> +
>>>> +		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs,
>> src_is_pltt,
>>>> +						  src_L0_ofs, dst_is_pltt,
>>>> +						  src_L0, ccs_ofs, true);
>>>> +
>>>> +		bb->cs[bb->len++] = MI_FLUSH_DW | MI_INVALIDATE_TLB |
>> MI_FLUSH_DW_OP_STOREDW |
>>>> +					MI_FLUSH_IMM_DW | flush_flags;
>> Missed this - you don't need MI_INVALIDATE_TLB here, just after emitting
>> the PTEs. I believe that should speedup this copy a little too.
>>
> This works out if we are using different VMs. Since we are using same VM for all BOs, I was suggested
> To add MI_INVALIDATE_TLB after each BB to avoid any caching issues.
> Correct me if I am wrong.
> - Satya.
>> This also looks wrong in emit_migration_job_gen12 too. Going to follow
>> up on this now.
>>
>> Matt

Removed MI_INVALIDATE_TLB after emitting PTEs and kept after copy command.

>>
>>>> +		bb->cs[bb->len++] = MI_NOOP;
>>>> +		bb->cs[bb->len++] = MI_NOOP;
>>>> +
>>>> +		size -= src_L0;
>>>> +	}
>>>> +
>>>> +	xe_assert(xe, (batch_size_allocated == bb->len));
>>>> +	src_bo->bb_ccs[read_write] = bb;
>>>> +
>>>> +	return 0;
>>>> +
>>>> +err_ret:
>>>> +	return err;
>>>> +}
>>>> +
>>>>   static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64
>> src_ofs,
>>>>   				 u32 size, u32 pitch)
>>>>   {
>>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.h
>> b/drivers/gpu/drm/xe/xe_migrate.h
>>>> index fb9839c1bae0..96b0449e7edb 100644
>>>> --- a/drivers/gpu/drm/xe/xe_migrate.h
>>>> +++ b/drivers/gpu/drm/xe/xe_migrate.h
>>>> @@ -24,6 +24,8 @@ struct xe_vm;
>>>>   struct xe_vm_pgtable_update;
>>>>   struct xe_vma;
>>>>
>>>> +enum xe_sriov_vf_ccs_rw_ctxs;
>>>> +
>>>>   /**
>>>>    * struct xe_migrate_pt_update_ops - Callbacks for the
>>>>    * xe_migrate_update_pgtables() function.
>>>> @@ -112,6 +114,10 @@ struct dma_fence *xe_migrate_copy(struct
>> xe_migrate *m,
>>>>   				  struct ttm_resource *dst,
>>>>   				  bool copy_only_ccs);
>>>>
>>>> +int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
>>>> +			   struct xe_bo *src_bo,
>>>> +			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
>>>> +
>>>>   int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>>>>   			     unsigned long offset, void *buf, int len,
>>>>   			     int write);
>>>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>> b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>>>> index ff5ad472eb96..242a3da1ef27 100644
>>>> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>>>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>>>> @@ -5,6 +5,7 @@
>>>>
>>>>   #include "instructions/xe_mi_commands.h"
>>>>   #include "instructions/xe_gpu_commands.h"
>>>> +#include "xe_bb.h"
>>>>   #include "xe_bo.h"
>>>>   #include "xe_device.h"
>>>>   #include "xe_migrate.h"
>>>> @@ -208,3 +209,74 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>>>>   err_ret:
>>>>   	return err;
>>>>   }
>>>> +
>>>> +/**
>>>> + * xe_sriov_vf_ccs_attach_bo - Insert CCS read write commands in the BO.
>>>> + * @bo: the &buffer object to which batch buffer commands will be
>> added.
>>>> + *
>>>> + * This function shall be called only by VF. It inserts the PTEs and copy
>>>> + * command instructions in the BO by calling xe_migrate_ccs_rw_copy()
>>>> + * function.
>>>> + *
>>>> + * Returns: 0 if successful, negative error code on failure.
>>>> + */
>>>> +int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
>>>> +{
>>>> +	struct xe_device *xe = xe_bo_device(bo);
>>>> +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
>>>> +	struct xe_migrate *migrate;
>>>> +	struct xe_tile *tile;
>>>> +	struct xe_bb *bb;
>>>> +	int tile_id;
>>>> +	int err = 0;
>>>> +
>>>> +	if (!IS_VF_CCS_READY(xe))
>>>> +		return 0;
>>>> +
>>>> +	for_each_tile(tile, xe, tile_id) {
>>> Same comment as patch 1, I'd avoid for_each_tile and rather use
>>> xe_device_get_root_tile.
>>>
>>>> +		for_each_ccs_rw_ctx(ctx_id) {
>>>> +			bb = bo->bb_ccs[ctx_id];
>>>> +			/* bb should be NULL here. Assert if not NULL */
>>>> +			xe_assert(xe, !bb);
>>>> +
>>>> +			migrate = tile->sriov.vf.ccs[ctx_id].migrate;
>>>> +			err = xe_migrate_ccs_rw_copy(migrate, bo, ctx_id);
>>>> +		}
>>>> +	}
>>>> +	return err;
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_sriov_vf_ccs_detach_bo - Remove CCS read write commands from
>> the BO.
>>>> + * @bo: the &buffer object from which batch buffer commands will be
>> removed.
>>>> + *
>>>> + * This function shall be called only by VF. It removes the PTEs and copy
>>>> + * command instructions from the BO. Make sure to update the BB with
>> MI_NOOP
>>>> + * before freeing.
>>>> + *
>>>> + * Returns: 0 if successful.
>>>> + */
>>>> +int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
>>>> +{
>>>> +	struct xe_device *xe = xe_bo_device(bo);
>>>> +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
>>>> +	struct xe_bb *bb;
>>>> +	struct xe_tile *tile;
>>>> +	int tile_id;
>>>> +
>>>> +	if (!IS_VF_CCS_READY(xe))
>>>> +		return 0;
>>>> +
>>>> +	for_each_tile(tile, xe, tile_id) {
>>> Same here.
>>>
>>> Matt
Fixed in new version.
>>>> +		for_each_ccs_rw_ctx(ctx_id) {
>>>> +			bb = bo->bb_ccs[ctx_id];
>>>> +			if (!bb)
>>>> +				continue;
>>>> +
>>>> +			memset(bb->cs, MI_NOOP, bb->len * sizeof(u32));
>>>> +			xe_bb_free(bb, NULL);
>>>> +			bo->bb_ccs[ctx_id] = NULL;
>>>> +		}
>>>> +	}
>>>> +	return 0;
>>>> +}
>>>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
>> b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
>>>> index 5df9ba028d14..5d5e4bd25904 100644
>>>> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
>>>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
>>>> @@ -7,7 +7,10 @@
>>>>   #define _XE_SRIOV_VF_CCS_H_
>>>>
>>>>   struct xe_device;
>>>> +struct xe_bo;
>>>>
>>>>   int xe_sriov_vf_ccs_init(struct xe_device *xe);
>>>> +int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
>>>> +int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
>>>>
>>>>   #endif
>>>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
>> b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
>>>> index 6dc279d206ec..e240f3fd18af 100644
>>>> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
>>>> @@ -27,6 +27,14 @@ enum xe_sriov_vf_ccs_rw_ctxs {
>>>>   	XE_SRIOV_VF_CCS_CTX_COUNT
>>>>   };
>>>>
>>>> +#define IS_VF_CCS_BB_VALID(xe, bo) ({ \
>>>> +		struct xe_device *___xe = (xe); \
>>>> +		struct xe_bo *___bo = (bo); \
>>>> +		IS_SRIOV_VF(___xe) && \
>>>> +		___bo->bb_ccs[XE_SRIOV_VF_CCS_READ_CTX] && \
>>>> +		___bo->bb_ccs[XE_SRIOV_VF_CCS_WRITE_CTX]; \
>>>> +		})
>>>> +
>>>>   struct xe_migrate;
>>>>   struct xe_sa_manager;
>>>>
>>>> --
>>>> 2.43.0
>>>>
--------------Awo0SdSgtVnptmq68UVzQW82
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 24-06-2025 10:28, K V P,
      Satyanarayana wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:LV3PR11MB8695FE036F1B93E821901DBEF978A@LV3PR11MB8695.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">Hi.
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">-----Original Message-----
From: Brost, Matthew <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Sent: Tuesday, June 24, 2025 3:12 AM
To: K V P, Satyanarayana <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>; Wajdeczko, Michal
<a class="moz-txt-link-rfc2396E" href="mailto:Michal.Wajdeczko@intel.com">&lt;Michal.Wajdeczko@intel.com&gt;</a>; Auld, Matthew <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>;
Winiarski, Michal <a class="moz-txt-link-rfc2396E" href="mailto:michal.winiarski@intel.com">&lt;michal.winiarski@intel.com&gt;</a>; Lis, Tomasz
<a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
Subject: Re: [PATCH v8 2/3] drm/xe/vf: Attach and detach CCS copy
commands with BO

On Fri, Jun 20, 2025 at 09:25:18AM -0700, Matthew Brost wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On Thu, Jun 19, 2025 at 01:34:58PM +0530, Satyanarayana K V P wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Attach CCS read/write copy commands to BO for old and new mem types
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">as
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">NULL -&gt; tt or system -&gt; tt.
Detach the CCS read/write copy commands from BO while deleting ttm bo
from xe_ttm_bo_delete_mem_notify().

Signed-off-by: Satyanarayana K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a>
Cc: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Cc: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Michał Winiarski <a class="moz-txt-link-rfc2396E" href="mailto:michal.winiarski@intel.com">&lt;michal.winiarski@intel.com&gt;</a>
---
Cc: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>

V7 -&gt; V8:
- Removed xe_bb_ccs_realloc() and created a single BB by calculating the
BB size first and then emitting the commands. (Matthew Brost)
- Added xe_assert() if BB is not NULL in xe_sriov_vf_ccs_attach_bo().

V6 -&gt; V7:
- Created xe_bb_ccs_realloc() to create a single BB instead of maintaining
a list. (Matthew Brost)

V5 -&gt; V6:
- Removed dead code from xe_migrate_ccs_rw_copy() function. (Matthew
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Brost)
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">
V4 -&gt; V5:
- Create a list of BBs for the given BO and fixed memory leak while
detaching BOs. (Matthew Brost).
- Fixed review comments (Matthew Brost &amp; Matthew Auld).
- Yet to cleanup xe_migrate_ccs_rw_copy() function.

V3 -&gt; V4:
- Fixed issues reported by patchworks.

V2 -&gt; V3:
- Attach and detach functions check for IS_VF_CCS_READY().

V1 -&gt; V2:
- Fixed review comments.
---
 drivers/gpu/drm/xe/xe_bb.c                 |  35 ++++++
 drivers/gpu/drm/xe/xe_bb.h                 |   3 +
 drivers/gpu/drm/xe/xe_bo.c                 |  23 ++++
 drivers/gpu/drm/xe/xe_bo_types.h           |   3 +
 drivers/gpu/drm/xe/xe_migrate.c            | 130 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h            |   6 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       |  72 ++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |   3 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |   8 ++
 9 files changed, 283 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index 9570672fce33..533352dc892f 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -60,6 +60,41 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">dwords, bool usm)
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre"> 	return ERR_PTR(err);
 }

+struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
+			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
+{
+	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_sa_manager *bb_pool;
+	int err;
+
+	if (!bb)
+		return ERR_PTR(-ENOMEM);
+	/*
+	 * We need to allocate space for the requested number of dwords &amp;
+	 * one additional MI_BATCH_BUFFER_END dword. Since the whole SA
+	 * is submitted to HW, we need to make sure that the last instruction
+	 * is not over written when the last chunk of SA is allocated for BB.
+	 * So, this extra DW acts as a guard here.
+	 */
+
+	bb_pool = tile-&gt;sriov.vf.ccs[ctx_id].mem.ccs_bb_pool;
+	bb-&gt;bo = xe_sa_bo_new(bb_pool, 4 * (dwords + 1));
+
+	if (IS_ERR(bb-&gt;bo)) {
+		err = PTR_ERR(bb-&gt;bo);
+		goto err;
+	}
+
+	bb-&gt;cs = xe_sa_bo_cpu_addr(bb-&gt;bo);
+	bb-&gt;len = 0;
+
+	return bb;
+err:
+	kfree(bb);
+	return ERR_PTR(err);
+}
+
 static struct xe_sched_job *
 __xe_bb_create_job(struct xe_exec_queue *q, struct xe_bb *bb, u64
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">*addr)
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre"> {
diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
index fafacd73dcc3..32c9c4c5d2be 100644
--- a/drivers/gpu/drm/xe/xe_bb.h
+++ b/drivers/gpu/drm/xe/xe_bb.h
@@ -13,8 +13,11 @@ struct dma_fence;
 struct xe_gt;
 struct xe_exec_queue;
 struct xe_sched_job;
+enum xe_sriov_vf_ccs_rw_ctxs;

 struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 size, bool usm);
+struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
+			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
 struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
 				      struct xe_bb *bb);
 struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">*q,
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4e39188a021a..beaf8544bf08 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -31,6 +31,7 @@
 #include &quot;xe_pxp.h&quot;
 #include &quot;xe_res_cursor.h&quot;
 #include &quot;xe_shrinker.h&quot;
+#include &quot;xe_sriov_vf_ccs.h&quot;
 #include &quot;xe_trace_bo.h&quot;
 #include &quot;xe_ttm_stolen_mgr.h&quot;
 #include &quot;xe_vm.h&quot;
@@ -947,6 +948,20 @@ static int xe_bo_move(struct ttm_buffer_object
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">*ttm_bo, bool evict,
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre"> 	dma_fence_put(fence);
 	xe_pm_runtime_put(xe);

+	/*
+	 * CCS meta data is migrated from TT -&gt; SMEM. So, let us detach the
+	 * BBs from BO as it is no longer needed.
+	 */
+	if (IS_VF_CCS_BB_VALID(xe, bo) &amp;&amp; old_mem_type == XE_PL_TT &amp;&amp;
+	    new_mem-&gt;mem_type == XE_PL_SYSTEM)
+		xe_sriov_vf_ccs_detach_bo(bo);
+
+	if (IS_SRIOV_VF(xe) &amp;&amp;
+	    ((move_lacks_source &amp;&amp; new_mem-&gt;mem_type == XE_PL_TT) ||
+	     (old_mem_type == XE_PL_SYSTEM &amp;&amp; new_mem-&gt;mem_type ==
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">XE_PL_TT)) &amp;&amp;
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+	    handle_system_ccs)
+		ret = xe_sriov_vf_ccs_attach_bo(bo);
+
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">
You don't check the 'ret' value of xe_sriov_vf_ccs_attach_bo. That seems be
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">an oversight.</pre>
      </blockquote>
    </blockquote>
    <p>The error is returned to the caller after this. So, not checked
      explicitly.</p>
    <blockquote type="cite" cite="mid:LV3PR11MB8695FE036F1B93E821901DBEF978A@LV3PR11MB8695.namprd11.prod.outlook.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre"> out:
 	if ((!ttm_bo-&gt;resource || ttm_bo-&gt;resource-&gt;mem_type ==
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">XE_PL_SYSTEM) &amp;&amp;
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre"> 	    ttm_bo-&gt;ttm) {
@@ -957,6 +972,9 @@ static int xe_bo_move(struct ttm_buffer_object
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">*ttm_bo, bool evict,
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre"> 		if (timeout &lt; 0)
 			ret = timeout;

+		if (IS_VF_CCS_BB_VALID(xe, bo))
+			xe_sriov_vf_ccs_detach_bo(bo);
+
 		xe_tt_unmap_sg(xe, ttm_bo-&gt;ttm);
 	}

@@ -1483,9 +1501,14 @@ static void xe_ttm_bo_release_notify(struct
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">ttm_buffer_object *ttm_bo)
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">
 static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">*ttm_bo)
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre"> {
+	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
+
 	if (!xe_bo_is_xe_bo(ttm_bo))
 		return;

+	if (IS_VF_CCS_BB_VALID(ttm_to_xe_device(ttm_bo-&gt;bdev), bo))
+		xe_sriov_vf_ccs_detach_bo(bo);
+
 	/*
 	 * Object is idle and about to be destroyed. Release the
 	 * dma-buf attachment.
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">b/drivers/gpu/drm/xe/xe_bo_types.h
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">index eb5e83c5f233..642e519fcfd1 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -78,6 +78,9 @@ struct xe_bo {
 	/** @ccs_cleared */
 	bool ccs_cleared;

+	/** @bb_ccs_rw: BB instructions of CCS read/write. Valid only for VF
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">*/
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+	struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
+
 	/**
 	 * @cpu_caching: CPU caching mode. Currently only used for
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">userspace
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre"> 	 * objects. Exceptions are system memory on DGFX, which is always
diff --git a/drivers/gpu/drm/xe/xe_migrate.c
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">b/drivers/gpu/drm/xe/xe_migrate.c
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">index 8f8e9fdfb2a8..c730b34071ad 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -940,6 +940,136 @@ struct dma_fence *xe_migrate_copy(struct
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">xe_migrate *m,
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre"> 	return fence;
 }

+/**
+ * xe_migrate_ccs_rw_copy() - Copy content of TTM resources.
+ * @m: The migration context.
+ * @src_bo: The buffer object @src is currently bound to.
+ * @read_write : Creates BB commands for CCS read/write.
+ *
+ * Creates batch buffer instructions to copy CCS metadata from CCS pool
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">to
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+ * memory and vice versa.
+ *
+ * This function should only be called for IGPU.
+ *
+ * Return: 0 if successful, negative error code on failure.
+ */
+int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
+			   struct xe_bo *src_bo,
+			   enum xe_sriov_vf_ccs_rw_ctxs read_write)
+
+{
+	bool src_is_pltt = read_write == XE_SRIOV_VF_CCS_WRITE_CTX;
+	bool dst_is_pltt = read_write == XE_SRIOV_VF_CCS_READ_CTX;
+	struct ttm_resource *src = src_bo-&gt;ttm.resource;
+	struct xe_gt *gt = m-&gt;tile-&gt;primary_gt;
+	u32 batch_size, batch_size_allocated;
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_res_cursor src_it, ccs_it;
+	u64 size = src_bo-&gt;size;
+	struct xe_bb *bb = NULL;
+	u64 src_L0, src_L0_ofs;
+	u32 src_L0_pt;
+	int err;
+
+	xe_res_first_sg(xe_bo_sg(src_bo), 0, size, &amp;src_it);
+
+	xe_res_first_sg(xe_bo_sg(src_bo), xe_bo_ccs_pages_start(src_bo),
+			PAGE_ALIGN(xe_device_ccs_bytes(xe, size)),
+			&amp;ccs_it);
+
+	/* Calculate Batch buffer size */
+	batch_size = 0;
+	while (size) {
+		batch_size += 6; /* Flush + 2 NOP */
+		u64 ccs_ofs, ccs_size;
+		u32 ccs_pt;
+
+		u32 avail_pts = max_mem_transfer_per_pass(xe) /
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">LEVEL0_PAGE_TABLE_ENCODE_SIZE;
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+
+		src_L0 = min_t(u64, max_mem_transfer_per_pass(xe), size);
+
+		batch_size += pte_update_size(m, false, src, &amp;src_it, &amp;src_L0,
+					      &amp;src_L0_ofs, &amp;src_L0_pt, 0, 0,
+					      avail_pts);
+
+		ccs_size = xe_device_ccs_bytes(xe, src_L0);
+		batch_size += pte_update_size(m, 0, NULL, &amp;ccs_it, &amp;ccs_size,
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">&amp;ccs_ofs,
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+					      &amp;ccs_pt, 0, avail_pts, avail_pts);
+		xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
+
+		/* Add copy commands size here */
+		batch_size += EMIT_COPY_CCS_DW;
+
+		size -= src_L0;
+	}
+
+	bb = xe_bb_ccs_new(gt, batch_size, read_write);
+	if (IS_ERR(bb)) {
+		drm_err(&amp;xe-&gt;drm, &quot;BB allocation failed.\n&quot;);
+		err = PTR_ERR(bb);
+		goto err_ret;
+	}
+
+	batch_size_allocated = batch_size;
+	size = src_bo-&gt;size;
+	batch_size = 0;
+
+	/*
+	 * Emit PTE and copy commands here.
+	 * The CCS copy command can only support limited size. If the size to
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">be
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+	 * copied is more than the limit, divide copy into chunks. So, calculate
+	 * sizes here again before copy command is emitted.
+	 */
+	while (size) {
+		batch_size += 6; /* Flush + 2 NOP */
+		u32 flush_flags = 0;
+		u64 ccs_ofs, ccs_size;
+		u32 ccs_pt;
+
+		u32 avail_pts = max_mem_transfer_per_pass(xe) /
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">LEVEL0_PAGE_TABLE_ENCODE_SIZE;
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+
+		src_L0 = xe_migrate_res_sizes(m, &amp;src_it);
+
+		batch_size += pte_update_size(m, false, src, &amp;src_it, &amp;src_L0,
+					      &amp;src_L0_ofs, &amp;src_L0_pt, 0, 0,
+					      avail_pts);
+
+		ccs_size = xe_device_ccs_bytes(xe, src_L0);
+		batch_size += pte_update_size(m, 0, NULL, &amp;ccs_it, &amp;ccs_size,
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">&amp;ccs_ofs,
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+					      &amp;ccs_pt, 0, avail_pts, avail_pts);
+		xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
+		batch_size += EMIT_COPY_CCS_DW;
+
+		emit_pte(m, bb, src_L0_pt, false, true, &amp;src_it, src_L0, src);
+
+		emit_pte(m, bb, ccs_pt, false, false, &amp;ccs_it, ccs_size, src);
+
+		bb-&gt;cs[bb-&gt;len++] = MI_FLUSH_DW | MI_INVALIDATE_TLB |
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">MI_FLUSH_DW_OP_STOREDW |
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+					MI_FLUSH_IMM_DW;
+		bb-&gt;cs[bb-&gt;len++] = MI_NOOP;
+		bb-&gt;cs[bb-&gt;len++] = MI_NOOP;
+
+		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs,
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">src_is_pltt,
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+						  src_L0_ofs, dst_is_pltt,
+						  src_L0, ccs_ofs, true);
+
+		bb-&gt;cs[bb-&gt;len++] = MI_FLUSH_DW | MI_INVALIDATE_TLB |
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">MI_FLUSH_DW_OP_STOREDW |
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+					MI_FLUSH_IMM_DW | flush_flags;
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Missed this - you don't need MI_INVALIDATE_TLB here, just after emitting
the PTEs. I believe that should speedup this copy a little too.

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">This works out if we are using different VMs. Since we are using same VM for all BOs, I was suggested 
To add MI_INVALIDATE_TLB after each BB to avoid any caching issues.
Correct me if I am wrong.
- Satya.
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">This also looks wrong in emit_migration_job_gen12 too. Going to follow
up on this now.

Matt</pre>
      </blockquote>
    </blockquote>
    <p>Removed&nbsp;<span style="white-space: pre-wrap">MI_INVALIDATE_TLB  after emitting PTEs and kept after copy command.</span></p>
    <blockquote type="cite" cite="mid:LV3PR11MB8695FE036F1B93E821901DBEF978A@LV3PR11MB8695.namprd11.prod.outlook.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">

</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+		bb-&gt;cs[bb-&gt;len++] = MI_NOOP;
+		bb-&gt;cs[bb-&gt;len++] = MI_NOOP;
+
+		size -= src_L0;
+	}
+
+	xe_assert(xe, (batch_size_allocated == bb-&gt;len));
+	src_bo-&gt;bb_ccs[read_write] = bb;
+
+	return 0;
+
+err_ret:
+	return err;
+}
+
 static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">src_ofs,
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre"> 				 u32 size, u32 pitch)
 {
diff --git a/drivers/gpu/drm/xe/xe_migrate.h
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">b/drivers/gpu/drm/xe/xe_migrate.h
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">index fb9839c1bae0..96b0449e7edb 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -24,6 +24,8 @@ struct xe_vm;
 struct xe_vm_pgtable_update;
 struct xe_vma;

+enum xe_sriov_vf_ccs_rw_ctxs;
+
 /**
  * struct xe_migrate_pt_update_ops - Callbacks for the
  * xe_migrate_update_pgtables() function.
@@ -112,6 +114,10 @@ struct dma_fence *xe_migrate_copy(struct
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">xe_migrate *m,
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre"> 				  struct ttm_resource *dst,
 				  bool copy_only_ccs);

+int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
+			   struct xe_bo *src_bo,
+			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
+
 int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 			     unsigned long offset, void *buf, int len,
 			     int write);
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">index ff5ad472eb96..242a3da1ef27 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -5,6 +5,7 @@

 #include &quot;instructions/xe_mi_commands.h&quot;
 #include &quot;instructions/xe_gpu_commands.h&quot;
+#include &quot;xe_bb.h&quot;
 #include &quot;xe_bo.h&quot;
 #include &quot;xe_device.h&quot;
 #include &quot;xe_migrate.h&quot;
@@ -208,3 +209,74 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
 err_ret:
 	return err;
 }
+
+/**
+ * xe_sriov_vf_ccs_attach_bo - Insert CCS read write commands in the BO.
+ * @bo: the &amp;buffer object to which batch buffer commands will be
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">added.
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+ *
+ * This function shall be called only by VF. It inserts the PTEs and copy
+ * command instructions in the BO by calling xe_migrate_ccs_rw_copy()
+ * function.
+ *
+ * Returns: 0 if successful, negative error code on failure.
+ */
+int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
+{
+	struct xe_device *xe = xe_bo_device(bo);
+	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
+	struct xe_migrate *migrate;
+	struct xe_tile *tile;
+	struct xe_bb *bb;
+	int tile_id;
+	int err = 0;
+
+	if (!IS_VF_CCS_READY(xe))
+		return 0;
+
+	for_each_tile(tile, xe, tile_id) {
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">
Same comment as patch 1, I'd avoid for_each_tile and rather use
xe_device_get_root_tile.

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+		for_each_ccs_rw_ctx(ctx_id) {
+			bb = bo-&gt;bb_ccs[ctx_id];
+			/* bb should be NULL here. Assert if not NULL */
+			xe_assert(xe, !bb);
+
+			migrate = tile-&gt;sriov.vf.ccs[ctx_id].migrate;
+			err = xe_migrate_ccs_rw_copy(migrate, bo, ctx_id);
+		}
+	}
+	return err;
+}
+
+/**
+ * xe_sriov_vf_ccs_detach_bo - Remove CCS read write commands from
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">the BO.
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+ * @bo: the &amp;buffer object from which batch buffer commands will be
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">removed.
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+ *
+ * This function shall be called only by VF. It removes the PTEs and copy
+ * command instructions from the BO. Make sure to update the BB with
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">MI_NOOP
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+ * before freeing.
+ *
+ * Returns: 0 if successful.
+ */
+int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
+{
+	struct xe_device *xe = xe_bo_device(bo);
+	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
+	struct xe_bb *bb;
+	struct xe_tile *tile;
+	int tile_id;
+
+	if (!IS_VF_CCS_READY(xe))
+		return 0;
+
+	for_each_tile(tile, xe, tile_id) {
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">
Same here.

Matt
</pre>
        </blockquote>
      </blockquote>
    </blockquote>
    Fixed in new version.
    <blockquote type="cite" cite="mid:LV3PR11MB8695FE036F1B93E821901DBEF978A@LV3PR11MB8695.namprd11.prod.outlook.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+		for_each_ccs_rw_ctx(ctx_id) {
+			bb = bo-&gt;bb_ccs[ctx_id];
+			if (!bb)
+				continue;
+
+			memset(bb-&gt;cs, MI_NOOP, bb-&gt;len * sizeof(u32));
+			xe_bb_free(bb, NULL);
+			bo-&gt;bb_ccs[ctx_id] = NULL;
+		}
+	}
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">index 5df9ba028d14..5d5e4bd25904 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
@@ -7,7 +7,10 @@
 #define _XE_SRIOV_VF_CCS_H_

 struct xe_device;
+struct xe_bo;

 int xe_sriov_vf_ccs_init(struct xe_device *xe);
+int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
+int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);

 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">index 6dc279d206ec..e240f3fd18af 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
@@ -27,6 +27,14 @@ enum xe_sriov_vf_ccs_rw_ctxs {
 	XE_SRIOV_VF_CCS_CTX_COUNT
 };

+#define IS_VF_CCS_BB_VALID(xe, bo) ({ \
+		struct xe_device *___xe = (xe); \
+		struct xe_bo *___bo = (bo); \
+		IS_SRIOV_VF(___xe) &amp;&amp; \
+		___bo-&gt;bb_ccs[XE_SRIOV_VF_CCS_READ_CTX] &amp;&amp; \
+		___bo-&gt;bb_ccs[XE_SRIOV_VF_CCS_WRITE_CTX]; \
+		})
+
 struct xe_migrate;
 struct xe_sa_manager;

--
2.43.0

</pre>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------Awo0SdSgtVnptmq68UVzQW82--

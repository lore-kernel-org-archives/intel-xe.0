Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50746606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 08:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OJ/aq2Qe
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169ED10E51B;
	Thu, 29 Oct 2026 08:28:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD7B10E51B
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 08:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793262479; x=1824798479;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nV40oa1pu3JGfxNIsHik3NCi3z9NPO+v7mv7wClzOss=;
 b=OJ/aq2QeJ1nByfPdlnBmpQAhKZRwAYeJLGz6XXmbOihN8I2M5ipzirHS
 L1bf1xCg5e49NFsYT+7E882T4o8pW0xVbHJYk+cTBIjtvMQ0eGap5krm8
 Tljy/MzP3Ue7krED38zec/SoMEXoJmn2AilXUAiEZA8+DFm1DmCIm7kZO
 fAO7NC+/FXT2YDoOvyHPrSLIDnjf21gQWiebI9PRWrtIjgmShKsGxYM5k
 3tPKXxXOurrP078Gw+BU6dwDGYZpj25fDgDru7dl8/FxB21bFyXOroJ9P
 7Gcihq0tS4TAwig+zfYWDHR4Yd45AXsjIqQQz0fNYE7ZJMwBJrU6FKzcY w==;
X-CSE-ConnectionGUID: vQ0tG4nDSneah3zeZUIhMg==
X-CSE-MsgGUID: TGTR32+VTKu5UxA9Nc7mug==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1891363"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1891363"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 01:27:58 -0700
X-CSE-ConnectionGUID: 76ssiIfbSZGR3uYOtW4QyQ==
X-CSE-MsgGUID: 2WBuQmliRoC60ChspTPVtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5086872"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 01:27:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:27:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 01:27:57 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.9) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:27:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PAzLfdhk65OSKkgiqx5m3YudDU22ccVNVbF0p86MauGKfEScmaxK8dU1DvYkkafxAHqkSCWg7tTTAy9Ma0imlxaZulm1LpwpOhORrSgRRLPXzQ6tQaXNW1JXsWbFsnQAKoEm9zRc+0Vnk7zlPK8FtJP/etUbONP+cgHk0v7Cy/0+v4bdzUzWgwCbvTb6Y54PzaA8ZKwlDKcKUKye0SyqkyEZ5N07JkqQn0T1eHIE9KDU8G267ACB7xNLGvT3y9VcBhKqeHKD5pKqMZNvOtw+/ixSbXEtdh31oP33SMJdRlLwxDsegv8TeGMCvvlB+WpU+Pe1V4UBcpC3bbMbjtA7XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W813kN5ISFlimqUYfpV1yuLiafeUqxqpadKaWnWdNz4=;
 b=ekJxU5EWfRwWifiriTg//bCkonXWghHme/zN4wkwCJlZJtPcMNBP622a5j+UYwKjBzjG9hoyA19ccbb4LB1ck8HDwBHXZP//lESC0vucgmo+uqiNrqjqYvb5cM9VyY+SLh1U3lFeTt+1QJb03NMwZHIrnlNNPSO74AlPSZZVdD4DKCaucr5cAetD9Lnk896ColJAw8zEI8HIdN2U6HNL0TRISX7YjF2AQ3JZFK+o0xhxgb7FtsB+I0unQ2wWOxo1Sqy6cFd5eqV3p7rCqFNspklSHWSWdNUz2FH/9Hu2il9BoFF6CaORlm8rAIBXY6HcfNf2lphatWcYMAjE3RwOew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.8; Thu, 29 Oct 2026 08:27:55 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 08:27:55 +0000
Message-ID: <102e3a37-d369-47ed-8f0e-4f94d9bdc2c5@intel.com>
Date: Thu, 29 Oct 2026 13:57:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] drm/xe/ras: Treat non-fatal PCIe errors as
 recovered
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
 <20261026060459.771448-16-riana.tauro@intel.com>
 <23cd61ac-7247-4a1a-b517-dd2486963f2b@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <23cd61ac-7247-4a1a-b517-dd2486963f2b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB8200:EE_
X-MS-Office365-Filtering-Correlation-Id: c1ea3bd1-9488-4775-af3a-08df359687ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|22082099003|18002099003|56012099006|4143699003|11063799006|261021121427099003|261028144727099003|261021123027099003|261022105027099003|10067099003|261026121527099003|261009223027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: RSn871V8g0n8yPz0RKy9w/Nf+tD+B8fidRlTKBYaMRWZ6xZpB0XT/ZisvaeRdGEaFogZk87GiPIi4WNfx/wTZ7ksPKdMx/y66hF/oEUNEzEuR+tO1pUCRks589P5z4Xzpema4VFXYs/rqitxoFIz3YHdaKXUtVJsSEeetj84FtbmnM6Ek4VEEZr2p9NKfjCSP+SF815OkqPOvvU/00oeab9h09Qx7rh22uTzQrfaU7vkCnTwbpxOPKdAlauWpoP7AOdml6fWeesroDtsRxDIprSlN1FyiRaWSJQM02A8HkC48VVrrcfd4dzfEJvAW/Bv/sN0AAVSG9qrW/bOlDQOMc069cTI1FQZPXV7vN+7MU30yonmxDUw3hf5xYcCgcsO7eYE1xT/mTn+nVJVmWoY5xjM3mVfPjaHGnWvcXIjPpKXUpujSMECkyeG2rONPGUWq1mgNG/DRU0107fTLNektRmKG2B0NayatoJf0y2hIBjnvYRxh0vJbCBiCEjbV4g1L2LD1+pmSOLHFFs+SHNA8H8KtgBTiZaRAdRrslHt5PeUq3naF1vyRz5g5OiD1sISZZEmDW75ftYsTaQywcK578UhCtH2zxSlyMd6T6f4EAufNyoJtuq8BJeDP2OS1x9Q6csXc/sUHvp1CKAL3jZ1PIJC1ciGUmSH2YJoMztvSwQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(261021121427099003)(261028144727099003)(261021123027099003)(261022105027099003)(10067099003)(261026121527099003)(261009223027099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L21JL3k1VXJEU2p6RWJJNTU2QkVaVXJJM3FRbEhHNTF4Z2hWQ2wrL2ZxK3Fl?=
 =?utf-8?B?cHI2S1ZTOVpLeE9LUjZtWlN2UUxVNi9WWmpURGZVMURHQzBJeHBIcEFLbkNj?=
 =?utf-8?B?a0dWMitQb3RidGowTXBXRW5jSnRvdTYxbTd4bEQ5RDdaY202TnBIbDBFZXI5?=
 =?utf-8?B?aE0vTlVHUHcyVlkwUEVLVm4zMUdwY0pJS2YzbStNRzlCMzR0RTdvbXpCMWQ1?=
 =?utf-8?B?SldzdEdEYU5aKzh1OGJVaVM4UWkzb0NPK053RGdYYzZtcmxROFRQUTZyc0h0?=
 =?utf-8?B?ejRmN2hhMDU1ckFNREhrRjA5Q1dlYkJsZHNZRTA3T1ZmMDlWY0dXZG1yVEo2?=
 =?utf-8?B?NExGeVdBalQ3RXNaMFlvNUNITUE2RzNtbUdSSFdCV0txTHFaaUJWQ2xJOHhK?=
 =?utf-8?B?aHg2ZDV5ekJQV0ljdW9SVkxWcjNMK3B5VEdLQ0VqS1lVSHo4ZkdpMnRRdysy?=
 =?utf-8?B?dmJpczVmM3M0b2hqbzFjYjRwa3FUQ3dZbjZhdlQvcTZnZk45eVhkbC95dHJT?=
 =?utf-8?B?TysrT093b3dqb0pUT1NybHp6djV5TVdEVXJlcGFrcVpKRFlCLzNOeGt0UVA1?=
 =?utf-8?B?OWJQdFhyeVBFTkFxOGk5YnM1R0F2Qm5zdWpSTzdKWVpEamI1RjJnTkVSakJG?=
 =?utf-8?B?YktwV3RSOEsyZWZqZVQxd2d1WUpTOXBzc1MwaEZrZ3kyeC9JSlY2TlR2WXFF?=
 =?utf-8?B?QllGeWh5OXUyOHFSeC80VktLdDNtb3dZMjhLZGFVblg5L3pwSVIzV1hnNDZl?=
 =?utf-8?B?N1RocFlCV1M1eXo0TExGdkxCRi9Gdkxtc0xTRkpzTmt6UnhLcnU3MVhrWDV4?=
 =?utf-8?B?TXVlenM5RmcrVGVjdHFUa1FkRko2N0ZHSzJkSjRvNTE0YzdNQ0VqMjQzMmlF?=
 =?utf-8?B?aSt3UTl6R0FIQ2MzQ2FiNEk5QmM4MHRZM05UaCtXRG0rSjBiWlVsTGtGQTZo?=
 =?utf-8?B?dXQ3QWpJSFk4c25JN2x4b09manB2UVRJNnlWUHN2WDhWNENSVlNSR1I3eEUv?=
 =?utf-8?B?Mi9udGdwQnFWVUlQcXFxYWFmMGtKRG9oV0dORlRBYjNrcnZNUU1SRmtxbk1l?=
 =?utf-8?B?REdrWFMzWUpaRkJUa2xEUzNrQ1g3QnVqOEJFaGFEakg1S0RLVndQaXpnWWpl?=
 =?utf-8?B?emVKSk0wUUhXTmlKOXQ5cG9pbDRQSndtQS9zckwyTGo3SXMrdU9XMCtka1lU?=
 =?utf-8?B?cU5RRkYvOWFtUzVNcW5GbzdObG1JTTdVdi96ZmI4d0tYN3pMK2FSclA3ditt?=
 =?utf-8?B?ei9YQVp0K3pBR0k5OXNJV0p2MS9qbjJkR3RyT2ZnS3pkdGgxR2J3Q3dWTWxj?=
 =?utf-8?B?SExDMnF3dzI2SVdiQ1pZVGJPVCszWXk4eUxLMkNBNnNmVFhiNU1VYndMMm9G?=
 =?utf-8?B?OFdjMzY2STV6azZCK2M3K3kyendlUjFTMTJFa1pmYnhOaGdYT2QrbklxWThs?=
 =?utf-8?B?MTZnYXBwZllDU1NsM0dRN0FuRFI2b0s4UU5BYmhMRHI3eXYwdlAyWnFTRkZJ?=
 =?utf-8?B?SFpCOHZFb05iS2Vta3ZMTmRYMEJNMExYMXBmdzloMXZreUU2Q1NCZ2VjdVR5?=
 =?utf-8?B?SUJQVnhNdjZYNmFUK0taMVpaeW13T0kzSHdkWnRaT1lrUllyMWlWc1RrcWhr?=
 =?utf-8?B?MWF5Z0plVnlXNkptVk1BemNqWXZtc3U2WkxBbzNvV09rYzVJU3F4Yjg2RWVK?=
 =?utf-8?B?Vm1zeU1RS1hTOE9MN1k1dFRLUzlxREVpUHdnbHVLOVVGRmJ0aVZ0NWlwQTAz?=
 =?utf-8?B?aVN0QmdpTy9vZmlUQXYrRm1sWEZ2dUVocUI1RWJUSnZ5Z0c1Rk1rTk1Sczlm?=
 =?utf-8?B?bnRmby9wbkI3RzRIdEdkd250SDU2M0lUNmQ4T0RBd0xQYzB5bVd6bVlkaGZJ?=
 =?utf-8?B?UjB2MURhRDk2bHhpS2drVTlNWCtucStIMUFGclExb0VmZzllSnhseFYrWHVX?=
 =?utf-8?B?eElVVzFyZnI1ZVRqaWNyZnVaVTE4UVYyWllSMm5tRkovTWFKdE1vZ3FQaDN4?=
 =?utf-8?B?STd4MHoyUVA4R3QvVnd5L3VxbGlDeFliV0RLbFRQWDFBeW5XdGhRNHlOM2Yw?=
 =?utf-8?B?SmtIaEFQUlVVRW55SGtPT0w4bTg1WTQ0dlAwcEpPcGhjQ0NaeVVkdVV4a1Ro?=
 =?utf-8?B?Z1pXOUxocTB0ZE9FS3dvWWVRbjVNRFdXclBMcVFRMHhYZ0loOW1abWduSElw?=
 =?utf-8?B?Q0g5TGE5TGxmVkJFQmdsRzZUNjhRL0VuQ2V0cDhZQnV1c0Zvc2FGYjVKK1FV?=
 =?utf-8?B?SHJyY2tGcHo0djFrYTlpaTZnclF5aXFnVDUyd0pmWE9QbHhEeVpkRVVibkZ4?=
 =?utf-8?B?SDR4cnBLNldKYUVNeE5EbEpESFRpMVBrUndyZk15enZ1Z2d2cUV5UT09?=
X-Exchange-RoutingPolicyChecked: jJyovpQdU+2geabos7BcyKraPHcsqJ7O3+T8T4Oie1A5cWXHk82gNZhKXxV58sBD4XX3tm5r9FmD2TZurw8+OP87WF6QeDqvc7DKk5oWphMXk3S/rmg7ITzoNkKsAZG5Q/bbViD8Fzy1UrNIrTxIQq7IVtFtSNQcVUewUa3zb1282L+l5sgjg2U8LP6H16Zlu2uV7mcU8QYgl39epsz+W7ELpa+4kzCT5i8TLp14lxfS9P6c3KOz0fblxBb6E1CuJsE0ktf/Lm0d5iZfWjJxYWnlAouxoRHNJSVRUYDAH/iJfom5moPNxJoI+Yjbwv3CSFqUtipx8Ij/0mOXLBWruQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c1ea3bd1-9488-4775-af3a-08df359687ca
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 08:27:55.0624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KY0wT8Q9Iz6CBTKNlfMme7OoDYIHhmPVe3CaidMDkkWzGW8/8HenzzAo4YJVkIIyvMXoB28/Re3kvCBWgT5dwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8200
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 28-10-2026 14:54, Mallesh, Koujalagi wrote:
>
> On 26-10-2026 11:35 am, Riana Tauro wrote:
>> On systems lacking RAS capability, only PCIe errors are reported, via
>> AER, not device errors. Non-fatal PCIe errors reported at the Upstream
>> Switch Port (USP) have no impact on link or device state, so treat
>> them as recovered without requiring a secondary bus reset (SBR).
>>
>> Fixes: 25913a062cd4 ("drm/xe/xe_ras: Add support for uncorrectable 
>> core-compute errors")
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index e6a0ee468b17..2b1a7cb01b0d 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -747,7 +747,7 @@ enum xe_ras_recovery_action 
>> xe_ras_process_errors(struct xe_device *xe)
>>       }
>>         if (!xe->info.has_sysctrl)
>> -        return XE_RAS_RECOVERY_ACTION_RESET;
>
> Initially we see Non-fatal PCIe errors reporting via USP required SBR, 
> however what is rationale behind,  not required SBR now?

This was a miss from my end. I have added the details in the commit message.
If you see pcie port driver also, it doesn't reset for pcie bus errors.

I can split this patch out of this series too as it's not related.

Thanks
Riana

>
> Thanks,
>
> -/Mallesh
>
>> +        return XE_RAS_RECOVERY_ACTION_RECOVERED;
>>         BUILD_BUG_ON(BITS_PER_TYPE(sent) < XE_RAS_COMP_MAX);
>>       /* Default action */

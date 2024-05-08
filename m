Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B0BC19F4F
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 17:25:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6620B113135;
	Wed,  8 May 2024 17:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ush2bMPa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C94C113135;
 Wed,  8 May 2024 17:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715189122; x=1746725122;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hmKJUJAnv6gFQBiH6/M/1eJj3ZR5wjzz8yaf1Qe1fS4=;
 b=Ush2bMPajQiBIF9qIRzhJD9ACPzD50ZWpL7eLPvzNGdqB60q0l5CyKxl
 q5Qhj8xJ6BtdBnj4fr6SGNcamzuAJoaERk03taFKnH12/iB36nR10O6Md
 jNVtb4+hxK2Aw/l3JN42IfHVwciL3wIgJUTgmV8B2QLOApg9Qrj9ot/bV
 KRV6b6jjv6GCsySW9MeqUyFcvtyxeIfXSahcayMtYxQisdxJPjelGkClZ
 zy/Y58vLFLMErlgUzYW09d0Gz8xBWjQBAUx+3oawF26EBs2iGDkNm6xCT
 +ICygcDalqt4FuRzVHy+B5vO2lZo9B95Bko51p2CDa0yN0oHh49ld8aZZ Q==;
X-CSE-ConnectionGUID: oohWbD0tR9eBA3adf874xA==
X-CSE-MsgGUID: xBOwcyCTT0aPFIxbKySJNw==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="14876902"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="14876902"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 10:25:21 -0700
X-CSE-ConnectionGUID: XikuB+ymQxSyWJDtTZ7xyg==
X-CSE-MsgGUID: e3nUb5DNRsCJfxF1Gtg2/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="52164061"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 10:25:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 10:25:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 10:25:19 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 10:25:19 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 10:25:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J77rwsED904U+YBD7SmnBhXpqojjkbuHqOMwoNdqRVtQgoKsGbvU9QewYwTnev4dAWmWRALmr2yykoZMSkCg9qXvqJap6BLBMoAxmUwkpH0VUwl6YWM0H0zf7zvyFEg8xOwyUQredZGYzMXX5DLHARVWyCZgOAj1tPrWaqWob3VN02QM17M7A59GAl+Yz/2lCz2wm7cA0ZBHbglmnIYfxYiZfGO1VxiHjtfQjO8sXfCtgjwIxZHwI4DzDziIqojTRWqt4YBkFYclT/LE/oB8eDdp5tABO8n1GGmB9+1Vm/Kuck0r+eF4K7MY5eW+xBDg+17ZjK1QS91NlEO9buBRAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hmKJUJAnv6gFQBiH6/M/1eJj3ZR5wjzz8yaf1Qe1fS4=;
 b=N/V1ut8o5FDKWxFHBBUhymaoIknYjtA2cdVnAUxFayEcaP0w/NDo8kP9tvkPHgNqGBNaqWAci1jtFT5fo8mps5ixYhtcXSNiSElKgKAR24if2RgNjxTLH83YG44DgUuWwTahDY1qVQmXwmcbcTTZOUrnSDST83BWTgl1XY1OABGs4LPU5lCGcygH/j5sgp6MmVKvVx64NtpKOCb61UQbCsh+T9ptjlkCr/+OCpO9doMMVZJJwbS7SDH6cg0GuUwfvOf9x+nKXGQYE329Th6CAem4T+tp8rGI1pGdElCNsDJu8jKOGd+esEZebDyRnkuKF6N85oegGBREVhedQrxcTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by MW4PR11MB6737.namprd11.prod.outlook.com (2603:10b6:303:20d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Wed, 8 May
 2024 17:25:15 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1604:d970:ed05:4729]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1604:d970:ed05:4729%7]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 17:25:15 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH V3 i-g-t] tests/xe_exec_threads: Make hang tests reset
 domain aware
Thread-Topic: [PATCH V3 i-g-t] tests/xe_exec_threads: Make hang tests reset
 domain aware
Thread-Index: AQHaiylWg/M0mvseZkeTo9puFWC+WrF/9WmAgA3MDwA=
Date: Wed, 8 May 2024 17:25:15 +0000
Message-ID: <SJ1PR11MB6204E841D58F5803C517A7A381E52@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240410094052.1033721-1-tejas.upadhyay@intel.com>
 <1eade99f-7964-490c-81b4-417c5429716b@intel.com>
In-Reply-To: <1eade99f-7964-490c-81b4-417c5429716b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: matthew.brost@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|MW4PR11MB6737:EE_
x-ms-office365-filtering-correlation-id: 2923282a-b040-4eea-7f6f-08dc6f83d35c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?cTMvdmtQRllvcFVpTlFOeFRHMHRxYmRVaG1ZUGIxMENZRGNCd2FvTXg4eVk5?=
 =?utf-8?B?YUpxZEhucXVSRm9MemxGRGQ1aUowMjlGUTBkaTlERFRRUTJ6VmZiVWk1UmVt?=
 =?utf-8?B?dkx4R3YwbzdxWXZuVitDZ2pDUTg3MDFDSDR3QVZBZUxDalRnT1lLeVI2cEEw?=
 =?utf-8?B?MFFvK1dhekdQUlNvMXVsamJjR3lrSXNSNys5RlhyY3Y5QlZwRGV5aHRaNm93?=
 =?utf-8?B?aTdyYlkzNThza2oyUEpVazdiWTdSM01Sbk9DQVdPY21uZjBDQVNKeFJxblBn?=
 =?utf-8?B?cElmZHhMWGJWVFkwNHlhdzQzMXFYUFlQM0RzL1hVQ3Nrd1dIZE1GVzN0N3pV?=
 =?utf-8?B?OEZHNkNVWGZCbW5PbmdxRlZDakkrTGZXUXp6S1JOSWk5alJJUzhDc0Fkdllp?=
 =?utf-8?B?N2g4Z2JBYjVuM1JmYmxoWWR2NmNQZXNxa1duM3dPcHB2RW5pdmxGdDFRYksy?=
 =?utf-8?B?VU9wZXdhOFk5THFNTis2TVAyRFA4andBS1RSWHVraGJPYTZzZHlFR24vYTRU?=
 =?utf-8?B?bDJEbEViWmdIbmRoc1prRVZRZ2gxOHFnUmZ4UjZDb0dIM3kvSTdkNTlhYTVi?=
 =?utf-8?B?dzZkL2JuSlE1Ky9QeVlBckVOTnV3UlNoSHBsOVZ3RDVtczNJZUpYUXFYL05B?=
 =?utf-8?B?UG4zSU5SN3JuY2poMklQV0ZRaTVtV2hxVEtzSm5xd09uQTFnTzY4bDViWFFr?=
 =?utf-8?B?dlVzTjNFc0N1V0NWTzloODlDTFdHdGc4WWRoTVYyNVpHdGs3Z0JlYVBPUllS?=
 =?utf-8?B?Tk1EcGQ3cXpkbVI3dWp3V2ZicEdSZVJYVm1DSmhTZjJ2ejRkMkRHRmQ3MG1q?=
 =?utf-8?B?UmlBVGVzeHE0eUs3ckRJbXgzeTluZjlPWW9xMTd3U0ZLRDdZQmxkTjcxZnpJ?=
 =?utf-8?B?VTVqZlhPTitNcHVQZGlFUEpIS1Fza2xuQmc0eVJtYWZoVzN4Z2RzK0xydlRj?=
 =?utf-8?B?WTUxemUyL3hTK2hVQlhTUnV0dlM4TjhGWCt2QnRrSzZPdmpGZDZ0c3pRRFJH?=
 =?utf-8?B?Mklweng0TTYvRlcxUlRDb1o5SERScWMxYVVBK3VYczBxNlRGYzZHUlFPb3Fi?=
 =?utf-8?B?aGZPd1Noc2RObDZUdDFXdzduRWxoOWFUVWtEdUVZNUpCYzBDOXhrb1Z6TUlx?=
 =?utf-8?B?ZEZGVzlFc1Axay9acGNTbWJwcmthYXRheEVHditCYmhyT2tHRE1Id2dYNW5R?=
 =?utf-8?B?VE9pLzgwcVA4Zlp0eEkyQzU3YmNLc3ZhMHJRTHFiZk9EdjJ5dHEzaFFNLy9z?=
 =?utf-8?B?TzI3Vzh5dUtLZkdBaTRNbnJhZ2ppbzA3SjFPQUsyUmFqdW00blQ5bWY0azNi?=
 =?utf-8?B?N1F6Z0lsZHp3VlM1LzF3V3NlV3F4TXA3cXVYYjVDOEZBSG5keGhEc0Z0ZW5X?=
 =?utf-8?B?VnBiaEFESURwVWdXZ2lveTJDY2lqRzVuSElUd00rUVBETFZheklrWm1scUpP?=
 =?utf-8?B?dDB2ZTNacFF1OExhcFVISExSMjlkZVQxYy9DaTE3dHBzRWhUZFFGcVY3R2hG?=
 =?utf-8?B?UzZJeHR5YkJVM3dYUmNPelUrRkVOeXlialFsWWQ0OGhRR2pGNGVuRDFRZHZN?=
 =?utf-8?B?aFVydjlId1ZlNjZzd2drNXd4T29aNUt3R0poaGZseEczSm1xbEZxVzZpS2tO?=
 =?utf-8?B?cXp4UHVBL1l0ajMxV1lWeVduV2FnRGxXUzJrMVIxMzJNWXV0VUIveXpja1pk?=
 =?utf-8?B?ekdjL00xd0pDSDZOL1VoU2hJVDZFcS9IMWk0Sk4rWmNPSDlqRmdTcTJvWmJK?=
 =?utf-8?B?VjVoaDQyTmtIOFE3OHJuR0RlOXJ0d0tXTGxoaXRUZnJmZCtmNUNqRzFnZmxo?=
 =?utf-8?B?Mm5EN3FrTzVsQzhVNHFuZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?LzM1RXUzZ1dOL1VXWEZodFVkbFV3VldKWEhmVFk3R1gwN0h2bjBSZXFNdnRD?=
 =?utf-8?B?SVphT1lFRnZxYklLVjFTRXA5d2dYWUtjRllKZlFNelNvYWRCTGhnZHFmQzh4?=
 =?utf-8?B?Vk9qOXVQandlMys2WnNiNkNrVUVRTUhTcW5qL0dyODNXNkVqOVRRbDcyK2Rm?=
 =?utf-8?B?TFNOMVZwLzhPU2xKbTFDcmRWRVluQ2xLN1JPaEZRWE56NVROalhpdTdpZnJp?=
 =?utf-8?B?OHl1Tm9xQkV1dTZWdVVCN3I5SmxLZmpGZDFFWElSeWNHSFVKSC9aM3lkTkU0?=
 =?utf-8?B?cG9kaEVidm5ZWkIxVmwzYlQrelVpUHJnVE9rTlZ2Uzl5MFBYamVPUE0yb01p?=
 =?utf-8?B?bXpxdFFacUhLamJ0a2dkN0RwM2txSTVqSk1tNTNVU2Q1SkZEcG1YdHYvcmlJ?=
 =?utf-8?B?NmIzUWlObXpiemdJR0M3T1paZGpmQi9LcXdid0IwRG1sbTllcFpqbUR0bXVY?=
 =?utf-8?B?THVwVm42ODJKc1ZYNTlrL2xqVkFzdDNsdGVSaTU2YmJBU0lJLzJOb2J5UXNv?=
 =?utf-8?B?am9WSG0zNEtwMGx2WXVhb1pOaml1VUpKMEtIRjIrOE9zSnN4K05kalhVRXlB?=
 =?utf-8?B?NUIraUlWM3JzMmVkNldJZlJMOW5MbkQvTW5wWW5YbDVXcVVLOWlQUndxL1hn?=
 =?utf-8?B?b2NuNU5Nd0tkMytFb2dNTWtqS3VRV29JMG9WdVMwdC8rcHcrUzlEdmlGS0ov?=
 =?utf-8?B?d2pPYVpNbGhaYW4vUWpWVGprUmFpVjBWSEtubnNmdG1XSDgxM3RRTE1CZnJk?=
 =?utf-8?B?NlNuWXhram5GV2RZVmJKaVlwR1Fjem5UNXZHK1pzcmJoeTVsUm4vbFZicHEv?=
 =?utf-8?B?M3UwSU4rTjhyN1B0d1lCcTV0bVFVdXZIckRrdEtMRTJ1V21ETnM4TVZaUG1z?=
 =?utf-8?B?L1dwMGMxYmU4ZlFzSHh2TkoxZmowbll4Z085ZXRQazNXRzNDMWtNMm44MWNT?=
 =?utf-8?B?akNVMFJ5akJIb1hlTUpnYThVeWVwbU11NW1xcDZld1piT3UwM1VFdW9TVEQ5?=
 =?utf-8?B?TDh3MTdUbGR5K0NVNWtnVmpCWTdZYlRleWtVRElXWkt1UkU4dnNJemFENXhv?=
 =?utf-8?B?NU9uSFpvUThFc3NmSTBpdExvc3Q0MUJJSFYyRDByc3VoRUdhSDByeTArUUpN?=
 =?utf-8?B?V3ZPK1ozMVBoQm9aaVlNN3QrZkJ4clBtNW9vRXV6Q2lXZGlKdzJRV2ZHcDlE?=
 =?utf-8?B?Q2hCaXU4ZG1jaUN4MVRrNi9XUEV1eDhmcTBLT2IvWWpvMTd0V054SmFJaWFE?=
 =?utf-8?B?YTZJK2NUN1FpdmZsL2pzaGJZR0cxc2pDUnA0cjEzV0swMUxNc3dDRmZyUnZB?=
 =?utf-8?B?bXh2ZTJKbTFTQ1RRK3FxR1ptclFSSmE4N0ZOUnRGdDhVb2xCYjl0MlBlbkNV?=
 =?utf-8?B?R29DV25yNXhoNTArL0Z5TG1uczV4YTlnKzZRMkxOVjlESlgreVYzSEtWRlM5?=
 =?utf-8?B?TEhhNFJST0M0UGZLUGhBdngzWWo3MXJnZXViREZXRkx0V3pFOEpkR29IckVB?=
 =?utf-8?B?YklrNGpzWVhIRGZTT0N5OEs2aXllcUJKT2QvNHNXQmJCZnBKUjd1STBjUG5l?=
 =?utf-8?B?THVydkxMendwL2FicEZxNEZlQWFYVHZLc3ZEclFLZkdtZVArbWNQUlhyaGVU?=
 =?utf-8?B?Wkp6d1hTOVZYRThjZzZRNFFiaTQ3NVpuWGN2MkhsOGZQT0doQ245MUN6UERr?=
 =?utf-8?B?ZWhocnRNOU9adEpuNlh4M29haEFoZVdrbzlVeVZyZnZxRXRReWZLL04yRC85?=
 =?utf-8?B?ZHVWVzM5MkNzQUxDcHV4Qjd5UFZib2YwY3RCV1VIT3dJR0JSMmpaUXNwb3JZ?=
 =?utf-8?B?cC9rUk8wcThEeGo0enJmYk0rSm5CQnVMRWl6NWZtRFIvOHJ6S2NMdnZLWStZ?=
 =?utf-8?B?dHRnVTh3RkVUMm1rNHA0ZVBkQm9sWHNTSmYzajFXRE1vajlnYkVISXN3T1F6?=
 =?utf-8?B?RDlxV3pIM1BPenZ5bFU5NHlBK1lwQzAzaTBEZWZ2NlI0VDlpL1FUWDlRRmhZ?=
 =?utf-8?B?Wk9vWnBwVjc2bHhQbUE3TXoyTGJDd0FRcEQrbUpvN3B2dGRWSGtlZU5FdzNx?=
 =?utf-8?B?Y0ZrZC9jMzZlRTNQOFZIWEU5d3NZeGU3MzgxN2psMllIWVVaeDk5UUFNclNO?=
 =?utf-8?B?NHZ2bVE5a1V2bm9wVngvZ1cxTVNRYU9JZ0pLcVl5OUhwSkNiMDBlTGVtRHRO?=
 =?utf-8?Q?aZr3aeGPO3xH4DxRmqe3HbU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2923282a-b040-4eea-7f6f-08dc6f83d35c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2024 17:25:15.7166 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PwtIg4resoHMECvi+FS2sRwgyr02MMxAAwFuk7IGq1KvOBFsOfKHBtUq4QRKdSpERe9ZxkL5ByYUMqIUTMNWBQ0PQxqtDVOgUmXFCPs+GrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6737
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGFycmlzb24sIEpvaG4g
QyA8am9obi5jLmhhcnJpc29uQGludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgQXByaWwgMzAs
IDIwMjQgNDowOCBBTQ0KPiBUbzogVXBhZGh5YXksIFRlamFzIDx0ZWphcy51cGFkaHlheUBpbnRl
bC5jb20+OyBpZ3QtDQo+IGRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IGludGVsLXhl
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgQnJvc3QsIE1hdHRoZXcNCj4gPG1hdHRoZXcuYnJvc3RA
aW50ZWwuY29tPjsgRGUgTWFyY2hpLCBMdWNhcyA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0K
PiBTdWJqZWN0OiBSZTogW1BBVENIIFYzIGktZy10XSB0ZXN0cy94ZV9leGVjX3RocmVhZHM6IE1h
a2UgaGFuZyB0ZXN0cyByZXNldA0KPiBkb21haW4gYXdhcmUNCj4gDQo+IE9uIDQvMTAvMjAyNCAw
Mjo0MCwgVGVqYXMgVXBhZGh5YXkgd3JvdGU6DQo+ID4gUkNTL0NDUyBhcmUgZGVwZW5kZW50IGVu
Z2luZXMgYXMgdGhleSBhcmUgc2hhcmluZyByZXNldCBkb21haW4uDQo+ID4gV2hlbmV2ZXIgdGhl
cmUgaXMgcmVzZXQgZnJvbSBDQ1MsIGFsbCB0aGUgZXhlYyBxdWV1ZXMgcnVubmluZyBvbiBSQ1MN
Cj4gPiBhcmUgdmljdGltaXNlZCBtYWlubHkgb24gTHVuYXJsYWtlLg0KPiA+DQo+ID4gTGV0cyBz
a2lwIHBhcmFsbGVsIGV4ZWN1dGlvbiBvbiBDQ1Mgd2l0aCBSQ1MuDQo+IEJ1dCB3aHk/IEluIGEg
cmVhbC13b3JsZCBzY2VuYXJpbywgdGhpcyBzaG91bGQgbm90IGhhcHBlbi4NCj4gDQo+IEFzIHBl
ciBlYXJsaWVyIGNvbW1lbnRzLCBiZWZvcmUgY2hhbmdpbmcgdGhlIHRlc3Qgd2UgbmVlZCB0byB1
bmRlcnN0YW5kDQo+IG1vcmUgYWJvdXQgd2hhdCBpcyBhY3R1YWxseSBoYXBwZW5pbmcgYW5kIHdo
eS4gVGhlIHByZXZpb3VzIGRlc2NyaXB0aW9ucyBvZg0KPiB3aGF0IGlzIGZhaWxpbmcgYW5kIG9u
IHdoYXQgcGxhdGZvcm1zIGRvIG5vdCBtYWtlIHNlbnNlLg0KPiANCj4gQWxzbywgdGhlIHJlcXVl
c3QgZm9yIG1vcmUgZXhwbGFuYXRpb24gd2FzIG5vdCBqdXN0IGZvciB0aGUgZW1haWwgZGlzY3Vz
c2lvbg0KPiBidXQgdG8gYWN0dWFsbHkgYWRkIHRoYXQgZGVzY3JpcHRpb24gaW50byB0aGUgdGVz
dC4gSSBldmVuIGV4cGxpY2l0bHkgYXNrZWQgZm9yDQo+IHRoYXQgaW4gb25lIG9mIHRoZSByZXZp
ZXcgZW1haWxzLiBUaGUgeGVfZXhlY190aHJlYWRzIGV4ZWN1dGFibGUgcmVwb3J0cyAxMTQNCj4g
c2VwYXJhdGUgc3VidGVzdHMsIG5vbmUgb2Ygd2hpY2ggaGFzIGFueSBkb2N1bWVudGF0aW9uIGF0
IGFsbC4gVGhlDQo+IGNvbW1lbnRzIHdpdGhpbiB0aGUgY29kZSBiYXNpY2FsbHkgY29tZSBkb3du
IHRvIHNheWluZyAnd2FpdCBmb3INCj4gY29tcGxldGlvbicgaW1tZWRpYXRlbHkgYmVmb3JlIHdh
aXRpbmcuDQo+IA0KPiBBdCBvbmUgcG9pbnQgTWF0dGhldyBCcm9zdCBzdGF0ZWQ6DQo+ICA+IElm
IHRoZSBIQU5HIGZsYWcgaXMgc2V0LCAxIG9mIHRoZSBleGVjIHF1ZXVlIHBlciB0aHJlYWQgd2ls
bCBpbnNlcnQgYSAgPiBub24tDQo+IHByZWVtcHRhYmxlIHNwaW5uZXIuIEl0IGlzIGV4cGVjdGVk
IHRoZSBHdUMgd2lsbCByZXNldCB0aGlzIGV4ZWMgID4gcXVldWUgb25seS4NCj4gQ3Jvc3MgQ0NT
IC8gUkNTIHJlc2V0cyB3aWxsIGJyZWFrIHRoaXMgYXMgb25lIG9mIHRoZSAgPiAnZ29vZCcgZXhl
YyBxdWV1ZXMgZnJvbQ0KPiBhbm90aGVyIHRocmVhZCBjb3VsZCBhbHNvIGJlIHJlc2V0Lg0KPiAN
Cj4gVG8gd2hpY2ggbXkgcmVwbGF5IHdhcyB0aGF0IGlmIG9ubHkgb25lIHNwaW5uZXIgaXMgbm9u
LXByZS1lbXB0aWJsZSB0aGVuIGFsbA0KPiB0aGUgb3RoZXIgc3Bpbm5lcnMgc2hvdWxkIGdldCBh
dXRvbWF0aWNhbGx5IHN3aXRjaGVkIG91dCBwcmlvciB0byB0aGUgcmVzZXQNCj4gYmVpbmcgdHJp
Z2dlcmVkIGFuZCBzaG91bGQgdGhlcmVmb3JlIG5vdCBiZSBraWxsZWQuIFRoZSAnZ29vZCcNCj4g
cXVldWVzIHNob3VsZCBzdXJ2aXZlIGFuZCBiZSB0b3RhbGx5IG9ibGl2aW91cyB0byB0aGUgcmVz
ZXQgb2NjdXJyaW5nLg0KDQpBcyBmYXIgYXMgSSBhbSBzZWVpbmcgdGVzdCBjb2RlLCBlYWNoIHNw
aW5uZXIgdGhhdCBpcyBjcmVhdGVkIGlzIG5vbi1wcmVlbXB0aWJsZSBpbiB0aGlzIHRlc3QuIFNv
IGFsbCBzcGlubmVycyB3aWxsIG5vdCBnZXQgYXV0b21hdGljYWxseSBzd2l0Y2hlZCBvdXQgcHJp
b3IgdG8gcmVzZXQgYW5kIGhlbmNlIHdlIHdpbGwgc2VlIHRlc3QgZmFpbHVyZSBhcyAnZ29vZCcg
cXVldWVzIHdpbGwgYWxzbyBub3Qgc3Vydml2ZSBvbiByZXNldC4gQEJyb3N0LCBNYXR0aGV3IHBs
ZWFzZSBoZWxwIHRvIGNvbmZpcm0gYmVoYXZpb3VyLiBXZSBuZWVkIHRoaXMgdG8gbW92ZSBmdXJ0
aGVyIHRvd2FyZHMgZmluYWwgc29sdXRpb24uDQoNClRoYW5rcywNClRlamFzICANCj4gDQo+IFNv
IGVpdGhlciB0aGUgYWJvdmUgZGVzY3JpcHRpb24gaXMgaW5hY2N1cmF0ZSBhbmQgYWxsIHRoZSBz
cGlubmVycyBhcmUgYWN0dWFsbHkNCj4gbm9uLXByZS1lbXB0aWJsZS4gSW4gd2hpY2ggY2FzZSwg
aWYgdGhhdCBpcyBub3QgdGhlIGludGVudGlvbiBvZiB0aGUgdGVzdCB0aGVuDQo+IHRoZSBjb3Jy
ZWN0IGZpeCBpcyB0byBtYWtlIHRoZW0gcHJlLWVtcHRpYmxlIGFuZCBpdCBzaG91bGQgdGhlbiBw
YXNzLiBPciBpZiB0aGUNCj4gZGVzY3JpcHRpb24gaXMgYWNjdXJhdGUsIHRoZW4gdGhlIHRlc3Qg
aXMgY29ycmVjdGx5IGZhaWxpbmcgYmVjYXVzZSBpdCBoYXMgZm91bmQgYQ0KPiBidWcgd2hpY2gg
bmVlZHMgdG8gYmUgZml4ZWQuDQo+IEVpdGhlciB3YXksIHRoZSBjb3JyZWN0IHNvbHV0aW9uIGlz
IG5vdCB0byBzaW1wbHkgc2tpcCB0aGUgZmFpbGluZyBjYXNlIGFuZCBoaWRlIGl0DQo+IHVuZGVy
IHRoZSBydWcuDQo+IA0KPiBKb2huLg0KPiANCj4gDQo+ID4NCj4gPiBJdCBoZWxwcyBpbiBmaXhp
bmcgZm9sbG93aW5nIGVycm9yczoNCj4gPiAxLiBUZXN0IGFzc2VydGlvbiBmYWlsdXJlIGZ1bmN0
aW9uIHRlc3RfbGVnYWN5X21vZGUsIGZpbGUsIEZhaWxlZA0KPiA+IGFzc2VydGlvbjogZGF0YVtp
XS5kYXRhID09IDB4YzBmZmVlDQo+ID4NCj4gPiAyLlRlc3QgYXNzZXJ0aW9uIGZhaWx1cmUgZnVu
Y3Rpb24geGVfZXhlYywgZmlsZSAuLi9saWIveGUveGVfaW9jdGwuYywNCj4gPiBGYWlsZWQgYXNz
ZXJ0aW9uOiBfX3hlX2V4ZWMoZmQsIGV4ZWMpID09IDAsIGVycm9yOiAtMTI1ICE9IDANCj4gPg0K
PiA+IFYzOg0KPiA+ICAgIC0gQ2hlY2sgdmljdGltaXphdGlvbiByZXNldCBkb21haW4gd2lzZSBp
cnJlc3BlY3RpdmUgb2YgcGxhdGZvcm0gLQ0KPiA+IEx1Y2FzL01hdHRSDQo+ID4gVjI6DQo+ID4g
ICAgLSBBZGQgZXJyb3IgZGV0YWlscw0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogVGVqYXMgVXBh
ZGh5YXkgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgIHRlc3RzL2lu
dGVsL3hlX2V4ZWNfdGhyZWFkcy5jIHwgNDMNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZXhlY190aHJlYWRz
LmMNCj4gPiBiL3Rlc3RzL2ludGVsL3hlX2V4ZWNfdGhyZWFkcy5jIGluZGV4IDgwODM5ODBmOS4u
MjRlYWMzOWRlIDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX2V4ZWNfdGhyZWFkcy5j
DQo+ID4gKysrIGIvdGVzdHMvaW50ZWwveGVfZXhlY190aHJlYWRzLmMNCj4gPiBAQCAtNzEwLDYg
KzcxMCwyNCBAQCBzdGF0aWMgdm9pZCAqdGhyZWFkKHZvaWQgKmRhdGEpDQo+ID4gICAJcmV0dXJu
IE5VTEw7DQo+ID4gICB9DQo+ID4NCj4gPiArc3RhdGljIGJvb2wgaXNfZW5naW5lX2NvbnRleHRz
X3ZpY3RpbWl6ZWQoX191MTYgZWNsYXNzLCB1bnNpZ25lZCBpbnQgZmxhZ3MsDQo+ID4gKwkJCQkJ
ICBib29sIGhhc19yY3MsIGJvb2wgbXVsdGlfY2NzLA0KPiA+ICsJCQkJCSAgYm9vbCAqY2NzMF9j
cmVhdGVkKQ0KPiA+ICt7DQo+ID4gKwlpZiAoIShlY2xhc3MgPT0gRFJNX1hFX0VOR0lORV9DTEFT
U19DT01QVVRFICYmIGZsYWdzICYgSEFORykpDQo+ID4gKwkJcmV0dXJuIGZhbHNlOw0KPiA+ICsJ
aWYgKGhhc19yY3MpIHsNCj4gPiArCQlyZXR1cm4gdHJ1ZTsNCj4gPiArCX0gZWxzZSBpZiAobXVs
dGlfY2NzKSB7DQo+ID4gKwkJLyogSW4gY2FzZSBvZiBtdWx0aSBjY3MsIGFsbG93IG9ubHkgMSBj
Y3MgdG8gcnVuIEhBTkcgdGVzdCovDQo+ID4gKwkJaWYgKCpjY3MwX2NyZWF0ZWQpDQo+ID4gKwkJ
CXJldHVybiB0cnVlOw0KPiA+ICsJCSpjY3MwX2NyZWF0ZWQgPSB0cnVlOw0KPiA+ICsJfQ0KPiA+
ICsNCj4gPiArCXJldHVybiBmYWxzZTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgIC8qKg0KPiA+ICAg
ICogU1VCVEVTVDogdGhyZWFkcy0lcw0KPiA+ICAgICogRGVzY3JpcHRpb246IFJ1biB0aHJlYWRz
ICVhcmdbMV0gdGVzdCB3aXRoIG11bHRpIHRocmVhZHMgQEANCj4gPiAtOTU1LDkgKzk3MywyMCBA
QCBzdGF0aWMgdm9pZCB0aHJlYWRzKGludCBmZCwgaW50IGZsYWdzKQ0KPiA+ICAgCWJvb2wgZ28g
PSBmYWxzZTsNCj4gPiAgIAlpbnQgbl90aHJlYWRzID0gMDsNCj4gPiAgIAlpbnQgZ3Q7DQo+ID4g
Kwlib29sIGhhc19yY3MgPSBmYWxzZTsNCj4gPiArCWJvb2wgbXVsdGlfY2NzID0gZmFsc2UsIGhh
c19jY3MgPSBmYWxzZSwgY2NzMF9jcmVhdGVkID0gZmFsc2U7DQo+ID4NCj4gPiAtCXhlX2Zvcl9l
YWNoX2VuZ2luZShmZCwgaHdlKQ0KPiA+ICsJeGVfZm9yX2VhY2hfZW5naW5lKGZkLCBod2UpIHsN
Cj4gPiArCQlpZiAoaHdlLT5lbmdpbmVfY2xhc3MgPT0gRFJNX1hFX0VOR0lORV9DTEFTU19SRU5E
RVIpIHsNCj4gPiArCQkJaGFzX3JjcyA9IHRydWU7DQo+ID4gKwkJfSBlbHNlIGlmIChod2UtPmVu
Z2luZV9jbGFzcyA9PQ0KPiBEUk1fWEVfRU5HSU5FX0NMQVNTX0NPTVBVVEUpIHsNCj4gPiArCQkJ
aWYgKGhhc19jY3MpDQo+ID4gKwkJCQltdWx0aV9jY3MgPSB0cnVlOw0KPiA+ICsJCQllbHNlDQo+
ID4gKwkJCQloYXNfY2NzID0gdHJ1ZTsNCj4gPiArCQl9DQo+ID4gICAJCSsrbl9lbmdpbmVzOw0K
PiA+ICsJfQ0KPiA+DQo+ID4gICAJaWYgKGZsYWdzICYgQkFMQU5DRVIpIHsNCj4gPiAgIAkJeGVf
Zm9yX2VhY2hfZ3QoZmQsIGd0KQ0KPiA+IEBAIC05OTAsNiArMTAxOSwxOCBAQCBzdGF0aWMgdm9p
ZCB0aHJlYWRzKGludCBmZCwgaW50IGZsYWdzKQ0KPiA+ICAgCX0NCj4gPg0KPiA+ICAgCXhlX2Zv
cl9lYWNoX2VuZ2luZShmZCwgaHdlKSB7DQo+ID4gKwkJLyogUkNTL0NDUyBzaGFyaW5nIHJlc2V0
IGRvbWFpbiBoZW5jZSBkZXBlbmRlbnQgZW5naW5lcy4NCj4gPiArCQkgKiBXaGVuIENDUyBpcyBk
b2luZyByZXNldCwgYWxsIHRoZSBjb250ZXh0cyBvZiBSQ1MgYXJlDQo+ID4gKwkJICogdmljdGlt
aXplZC4gQWxzbyBpbiBjYXNlIG9mIG11bHRpcGxlIENDUyBpbnN0YW5jZXMNCj4gPiArCQkgKiBj
b250ZXh0cyBydW5uaW5nIG9uIG90aGVyIENDUyBlbmdpbmUgYXJlIHZpY3RpbWl6ZWQuDQo+ID4g
KwkJICogc28gc2tpcCB0aGUgY29tcHV0ZSBlbmdpbmUgYXZvaWRpbmcgcGFyYWxsZWwgZXhlY3V0
aW9uDQo+ID4gKwkJICogd2l0aCBSQ1MgYW5kIG90aGVyIENDUy4NCj4gPiArCQkgKi8NCj4gPiAr
CQlpZiAoaXNfZW5naW5lX2NvbnRleHRzX3ZpY3RpbWl6ZWQoaHdlLT5lbmdpbmVfY2xhc3MsIGZs
YWdzLA0KPiA+ICsJCQkJCQkgIGhhc19yY3MsIG11bHRpX2NjcywNCj4gPiArCQkJCQkJICAmY2Nz
MF9jcmVhdGVkKSkNCj4gPiArCQkJY29udGludWU7DQo+ID4gKw0KPiA+ICAgCQl0aHJlYWRzX2Rh
dGFbaV0ubXV0ZXggPSAmbXV0ZXg7DQo+ID4gICAJCXRocmVhZHNfZGF0YVtpXS5jb25kID0gJmNv
bmQ7DQo+ID4gICAjZGVmaW5lIEFERFJFU1NfU0hJRlQJMzkNCg0K

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCD3CD484C
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 21:48:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23A310E7AD;
	Wed, 12 Nov 2025 21:48:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PZs1lW4/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F213D10E7AD
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Nov 2025 21:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762984117; x=1794520117;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:date:message-id:mime-version;
 bh=dM/GuAfQlY6lZXgrMx+x/EZaYQuQ2rRVerQY8nnhSmw=;
 b=PZs1lW4/aJPIVe7mWZLoYl/++zbFr2UELgSsVjdwDt/Tykb/HhCVbyET
 BUgHRnnqUA/ZT2J47lQLd3u0KcREnYAovI0hIXJR1Wf9qsEhi5ym5eEwc
 /EV/iJoj4+qCstZBSj++rbWjYFc+gTXQ6ERKcaxoo49P8TZ3/b7/TSweb
 iB9ozyyNRZsdie6uqK3R/zXs8sOCp8+/m8IJxrkIES25iC8VPU/A7D3FO
 2p1cRKYILmPLBjA/P/YQzKo7FoaObe/qiUB1zKWge1w3WuKcShHj/oE6h
 4Bj0pJZKHi22Mwf30Y6kvhVJUpxdNjEXQP62lP/xkwTZ/FxK5bZqWDjT3 A==;
X-CSE-ConnectionGUID: /aYeVwlnRUGX/0ZrBHv3Vg==
X-CSE-MsgGUID: KM0VhD/1T4OydoOHQkKtlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="52620883"
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="52620883"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 13:48:37 -0800
X-CSE-ConnectionGUID: uPdtq3TxQv2rYYh7238vTA==
X-CSE-MsgGUID: m09CASABTpmjoeq98pZeSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="189610450"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 13:48:36 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 13:48:36 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 13:48:36 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.9) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 13:48:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OkTjg3XZ0JeTJOCLou/oiQGyJq8Vh1y9DNbB6NW7rcoV5CGnD0Z+thkbcngY5oQESxJEZ0bGn44Ule4ym2w5Id+oss6EQAEnBE280FsAdfnQRGK8iCkLGjgURrkzamWSoIBZjLRmroLLv4qZFuFbwR4gu0RkNyLtqa9nGoSttC8VPa++2ZnBuUJJ2Xqy+/Khu2LAX+Vcma25P1b0Cri+UXWup5uKmJ2LcLOBBirffV8MMSiXadKBBJwyla39xQLlUN9NfF7JS+wsBHtSlUibDMzj9cQbf6keWoQafrBeX1IvSeB+VPYfYCoJrSLT30aLkARIS3YzPCsmDfk6GNDFnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYjKb10wdGV3tfHw8dVPKb72Tu1DZ2xo/VISNlZoLTI=;
 b=spdQAvDd59Ptx4ERr3yd0fn9Bi69y3KG9k9pIctKtaxCdHLdcPdx0FlL/iM+Ii3+eD0049pMXdXwOHEKWC37+zQoENyDyvd5b1Yc4pSzQcMVMbFNPLfo5j23qiV1WT7NVcGLAFQzdeC46NmvbzCxdO4LPHQoOQ15M0QM8Lqzbw0PVUn+mtMgIuniAcmMGptL77qQP23UyN53PVM0J7YedxTh2NCAlY2Pnxso5oQmPDkZmDR5f/y6Ah+y8qEs0++gGmuipNIL69NYj+MbqjQO/lRBugIVuq9DCQAkE/oapvtDH8nSHL2VfGtzW6+G2WxjxpVVjofigJgpIh+Zzf++mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8280.namprd11.prod.outlook.com (2603:10b6:806:25d::21)
 by CH0PR11MB8086.namprd11.prod.outlook.com (2603:10b6:610:190::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 21:48:30 +0000
Received: from SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::13a:4240:8d73:3c88]) by SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::13a:4240:8d73:3c88%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 21:48:30 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e29041b1-9a0a-4c3d-b761-9c345a0098fa@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-37-matthew.d.roper@intel.com>
 <e29041b1-9a0a-4c3d-b761-9c345a0098fa@intel.com>
Subject: Re: [PATCH v2 05/30] drm/xe/pm: Add scope-based cleanup helper for
 runtime PM
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Wed, 12 Nov 2025 18:48:16 -0300
Message-ID: <176298409614.3698.13103653590637000357@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BY5PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:a03:180::19) To SA1PR11MB8280.namprd11.prod.outlook.com
 (2603:10b6:806:25d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8280:EE_|CH0PR11MB8086:EE_
X-MS-Office365-Filtering-Correlation-Id: 48bd9d52-0002-4cc8-9689-08de22353812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TDQzeHdLMkZYQzFQNXY0Q1lBbE5RcmtYS3lYU1N6WitUSG5zbHdHSVA4cENi?=
 =?utf-8?B?dGVIbmovdDU2SVNPT2JGZjhPc0dFTThZNGRVWTg2MVRwVEdwUGowcXNsUzJs?=
 =?utf-8?B?NWNXUWZJNHp0QmViejJBYTJ3S3lha1VHdXdTMEFKZjZzY3g3N1lORE9vY1J1?=
 =?utf-8?B?ckhnVHluZHNBYnhsS1hRaDZDb05wQjkvdFBBbWY1dUtrK1lyRmFqWWRQcTZs?=
 =?utf-8?B?L3BNZ0Z1ZFdoSUppVWx3THF3TzNpKzcreFdHRlAwYUZxeHdQMHVZcno4YnVw?=
 =?utf-8?B?V1dRNGdsa0ZacmxiTWVlR3RwbEY1Wjg5c05FdDIrNTE0MnVrUUFFYVgvYVc2?=
 =?utf-8?B?aG8wMmhoTDN5VE5tc2lLZWtTcFplTm8xc3ZDaGlXaE1rbFNXUUFvRnlETVpY?=
 =?utf-8?B?eE8rMHpOeW9qWUloSlluSXU3MzdKanMvYXlOenBMYTdYNnBoekdCK2hzNXlh?=
 =?utf-8?B?SjJIUUI0eEU3TjlneG1zYWIrcWw1c0pWMnEzMWNFY0l0UlFveStnZ2NPU0Zp?=
 =?utf-8?B?dGp3QUphVmhXYnNlcVJ4Vy84cFFJWFA0ZVF2U2p4ZjVBWWdvdDFraTRaTlNZ?=
 =?utf-8?B?bHRqc3VFZDdyZE1BNG5VY1ZnbXRXOEZNZEEvU1FYYzM2dXJrVXBoT3ZrSURD?=
 =?utf-8?B?WmNHZWhRSWxqUFZTN1V4a1lPWlNRWmoxMEhlb2tXWkovZlNKZmJMeHhSN3ZC?=
 =?utf-8?B?Z2RJb2xhbVJuTk56OXh3NUdqNEF6b3prQy90NmtxUGF6T2xvNmpQbmpycXk1?=
 =?utf-8?B?dnMyeXJKcFd4cksrYXZQNjcybEUxNmc5dVFseXZrdkVtY05Bdkc5bjBuZ3By?=
 =?utf-8?B?Ty9DRnVoUVVuZ1M5ZHlvZzFpdjE3ZkcvcEhjdUh3VWpwcmFPQm1sOUxPWWVS?=
 =?utf-8?B?WVBCVGNGUmdYQ0MyVVY0cXZTZDkvUlZ2SGVISG1sY1pUN0ZZdmZiNis4bmxK?=
 =?utf-8?B?WUlWNGhsZGJGVkd1L3drNi95bGJHWklqRmlOdXM4dUgrcnZvL0daNzVTNzVv?=
 =?utf-8?B?TjE3d2ZtczBaWFVld0JBQ2U3MTNWTXVERVNtelhpTTVPcnNFZlhFL3BVcnAz?=
 =?utf-8?B?d2VNNEd4Mk8yUWxGSlVUVW0yM0dXcVNtc2R4TmVUV1NmVlBSS0plWnIxdGx5?=
 =?utf-8?B?YUNNVnBZdEpvaWppVnp1MGlDWmJQWC9VWEJXUk16VG12dTg2LzNERFBTYWJK?=
 =?utf-8?B?RWgxVHpZNzZEUE1DYkJYaW13K0dMR3liOS9mRVZiZDBWTW9wT3dJZ3AxV002?=
 =?utf-8?B?UUVsbjZWZmFIT25kODZNMkFUZHFuNEExelZKY2pXMGlDZmxTVUFDc1UrS2xT?=
 =?utf-8?B?ZUorazArUkNBc0NRK3FaZTZPUU5ZbnJVME5kSVdub3p3UHRacVdYL1lJRHlL?=
 =?utf-8?B?VEVKRGd4WWYvNTh6cE5Sa05wQXVsbVRZV01HMDNsZHBYaGxnd0ZPNEtFN2RW?=
 =?utf-8?B?TGFsWnI4RndHUE1wT3h2VTBPdDIvSWczVlg3YXc3NFJEN0NMUktjU2pONXVT?=
 =?utf-8?B?S2kvSno2VHJmNENPMXRGYXVDVmlqTytaMGQwS1VERzA5NlhQMkVBL1p5MWVp?=
 =?utf-8?B?aU5LSVhNbU4rL2Yza0E1L1BoTTdMZ0gxdDBvQ1BHb3h3aWd6em5YUGw2b3Z6?=
 =?utf-8?B?QXl4MnB3SmdnSnVjMVk3K0cvQ3RJaERoaytBUFUvZWZ6aSs5VGIrL3lpQWJp?=
 =?utf-8?B?WWxPYTBZN1Z2a1ROOHVwMmxYYmcyeC9PVnZxY3pTbWJkUUtRTXZmVGVVVmd3?=
 =?utf-8?B?WThYWGxjM0ZtSGVjelBaa0pQZzZPWUM1OVh3RDlCdndUZktwYk1BMUVKOERE?=
 =?utf-8?B?cmR5N0x1L2JaSGFyU3A0TElvQ1JpWnk0ZWh3c1hvVU84YndSalFLcm5rMi9W?=
 =?utf-8?B?WGxYZjAyZ2xWcUp3K3lWWE1QRnV5N2hGQVIxVHBtS2wycUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8280.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0ZZY0R5cytTRUMxTlFWQU43RGJEdmdHeDgyQmV0V2l0cnVFUXRsQTZMeWJL?=
 =?utf-8?B?bjRvSjBqbW9xWVc0Vlgvd2ozczhGUys0THcxNU1vSHc5SEV0QlJxSVRSNmNl?=
 =?utf-8?B?TkJib2JpOTRzNDdJMDNHVHhhMUpzamRUZ1JycDVXNnRFcWNob3JheU93M0Qx?=
 =?utf-8?B?elZZYW9VUjFLcElhMU5VdmtTWXAwMVJJTngrNENSUW5qdENickhHSWdCRDNr?=
 =?utf-8?B?NkYxYmw4aDlIeC9ZQ1RXSDBvdGRJYW5hOHNZZUltV1E5QTlZZkZLTGswc2U5?=
 =?utf-8?B?RFZrMDgvRFZMYW5pb0J4V2xENE81eldwMkpveWpvZW9zT1Q5am9sTDEyTUhF?=
 =?utf-8?B?cjNiTGREamlmb2lJdWd6S2NPb2YxM1g1bUtURWlPSnhPZHIyYThPQllmTE16?=
 =?utf-8?B?OU1sZkFIOWVXT1JmOGp0M0d2OEcwSGZyNHZ5eTRnSlpwTU5rOW4vTUFyNWRJ?=
 =?utf-8?B?dkU2SnBQeGZFYlhxZndEdkNhQVNaVThjbWxyVkxqb1V1WTdzQVozOGc3aXE5?=
 =?utf-8?B?d1BJeFE0TzZzTy9xTnVML1hYUFlXZmtkT3ZGNmJTblRNbmdXRzEwODFDTkJD?=
 =?utf-8?B?aHRIbGpIMkJ5S0ZQS2VkNnB4ME9uQlkyRms2Ykdwa0hIODJmNnZTSGFBSlJu?=
 =?utf-8?B?N3BpRW9NdVV1SlhabnBleXdERkp1cm5FTmRseWhCKzd2aG9KVzM2ZkVubHB3?=
 =?utf-8?B?WFQzVXRhcVJoT3dRRlVvYmNvVkZHKzVYVEMyNThLTkl2YmRQcGxIQ3pkb2pT?=
 =?utf-8?B?bys5UXhKa09ta3p6bnI1WlVvY1dmNFFWSmVJbGt5RHp2YXlLK3RTWGc5SnZa?=
 =?utf-8?B?aUdvVUxZWGF4UHFjSDF0bW9FRllBYmo4djB0MnVGQlpTdURrK0ZoVVA2bEY2?=
 =?utf-8?B?M1ZPZ0c0RWVYem1qL3Z4Z3dvTWNuNWhmYk9BdnJ3dHo3QW1VbUV4cmpjcGZ2?=
 =?utf-8?B?NnV0Wjl6SnJocm5rTDluaUJRU2hJeGRkcjZvdUFMVEc4WlR2ZzZwWWp2Uzlr?=
 =?utf-8?B?dG0zbEJmUnJhK0NKeGRORmh3RmVxUWM4eDN4dThaUk1XNmFpMmJ4K011NFFr?=
 =?utf-8?B?dnJ1N21DUWIrVUplcHRsYURPZHJxZGd5eTg1R1hBczJkV1l0QWwybWNEVXJQ?=
 =?utf-8?B?RTQ4VWdCMGxoU1NPZUp2cUNVcnppZHFXd1FuY24xRlpVd2IzV1ZkempMWU9o?=
 =?utf-8?B?MjRBT3g2YS8weGVoenAwNFo5blUwbEkwd1pxK1M3b3o0MXhJWTFWLzRMSm5i?=
 =?utf-8?B?TmhsUU9VL0swaTBKZzJuaDhDaldsdE5GOGpraERORE1PSUJuT29vTStMNGFE?=
 =?utf-8?B?U0c3RllGbDBQN2VCbUxoaVVEYWlyaFZnb0c5YVJ3RW9NQjc3dFY1dHcyZG9C?=
 =?utf-8?B?dFcvNDg5Zmw4ZzlJQ3RmQTkrNXNneFN3c29sd0Q3NU1YY1BPY2lHd3FYOG9y?=
 =?utf-8?B?bXlzUGxFVEhBV2l0NlZ1bEZtYU9tWXYvaEZnVUxKWlhmNGwxNlZyTVlsbHhy?=
 =?utf-8?B?Wk5yZDU2RERmV3dBTmVMNjhyL3NZRkVoV1NPZk9EODNGTncweXplS3MwVTZx?=
 =?utf-8?B?bnliMTh5NTJ2czlxZmpKdjJjYmFBSERBWWZSSFNwNy82QWlxRlNBNWFtOU1v?=
 =?utf-8?B?ZkpRVHU3YTFwa2FzRDZWaW5DS2FXN2lOWTNrOEJhRlBjRTZUVmlnL2hVbFFP?=
 =?utf-8?B?N2I2TnljSlcxNTVWSzUvZWl3MVNzQmRIZkRKeUFRL2tOQTUzRURSdXVMeVhI?=
 =?utf-8?B?YkJUMmRrTVNGRGR0VTFlZ2V2bGhnWVVsbG5kektjTnVESVlUUXlJYzVoRUto?=
 =?utf-8?B?RHo3SWpyZy9ZVHJlVVRVNFZlbkZGWEFqZWVicTVTTFVnKy9pbGhBZXlTYkdz?=
 =?utf-8?B?QXM2RmN0bmlpajMzQjA1Y2h3UEtuSy80S0lCTERDL0NReDNldDhvVnVsajRp?=
 =?utf-8?B?ZlZJYXk2MUV6ZDZnWDA1eFdBV0pLT3JNNDBSV0FBWk1JNW1URnpiTUlWd1Jm?=
 =?utf-8?B?b1FiajI4MG9lNFBGbmV0WnBaZTJTOGJlL0JJVzl0Zzg5aDQzbE14ZTlBYzN2?=
 =?utf-8?B?enRXc2FUdDNFVHBkdW1waTdmTzhPYnl3czV1L1RYWHBZQ3hweE14anMvbFN0?=
 =?utf-8?B?YUcvMlJ1d2hYYktySFl0YlNZVGp0WnlScXVaWmpUMGJ2cklPUnNOZGVhallL?=
 =?utf-8?B?VUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48bd9d52-0002-4cc8-9689-08de22353812
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8280.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 21:48:30.3798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b9k8r6i5mNBHQoxCBayE5a3Wrv5jeoVJUOAueYwkYlqVKYfO0vLFZg39Q20Y7ns2sW1JHqDhdDYZTUZ3LDbaSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8086
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

Quoting Michal Wajdeczko (2025-11-12 16:53:46-03:00)
>
>
>On 11/11/2025 12:20 AM, Matt Roper wrote:
>> Add a scope-based helpers for runtime PM that may be used to simplify
>> cleanup logic and potentially avoid goto-based cleanup.
>>=20
>> For example, using
>>=20
>>         guard(xe_pm_runtime)(xe);
>>=20
>
>for the record:
>
>last year [1] use of DEFINE_GUARD for our RPM was considered almost as API=
 abuse ;)
>but now [2] [3] it is used exactly for such scenarios
>
>[1] https://patchwork.freedesktop.org/patch/599366/?series=3D134955&rev=3D=
1
>[2] https://elixir.bootlin.com/linux/v6.18-rc5/source/include/linux/pm_run=
time.h#L617
>[3] https://elixir.bootlin.com/linux/v6.18-rc5/source/drivers/tty/serial/8=
250/8250.h#L191

If something breaks in the future, we are not the only ones to be
blamed? :-)

Maybe we should ask for an ack from people maintaining
include/linux/cleanup.h?

>
>> will get runtime PM and cause a corresponding put to occur automatically
>> when the current scope is exited.  'xe_pm_runtime_noresume' can be used
>> as a guard replacement for the corresponding 'noresume' variant.
>> There's also an xe_pm_runtime_ioctl conditional guard that can be used
>> as a replacement for xe_runtime_ioctl():
>>=20
>>         ACQUIRE(xe_pm_runtime_ioctl, pm)(xe);
>>         if ((ret =3D ACQUIRE_ERR(xe_pm_runtime_ioctl, &pm)) < 0)
>>                 /* failed */
>>=20
>> In a few rare cases (such as gt_reset_worker()) we need to ensure that
>> runtime PM is dropped when the function is exited by any means
>> (including error paths), but the function does not need to acquire
>> runtime PM because that has already been done earlier by a different
>> function.  For these special cases, an 'xe_pm_runtime_release_only'
>> guard can be used to handle the release without doing an acquisition.
>>=20
>> These guards will be used in future patches to eliminate some of our
>> goto-based cleanup.
>>=20
>> v2:
>>  - Specify success condition for xe_pm runtime_ioctl as _RET >=3D 0 so
>>    that positive values will be properly identified as success and
>>    trigger destructor cleanup properly.
>>=20
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_pm.h | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>=20
>> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
>> index f7f89a18b6fc..6b27039e7b2d 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.h
>> +++ b/drivers/gpu/drm/xe/xe_pm.h
>> @@ -6,6 +6,7 @@
>>  #ifndef _XE_PM_H_
>>  #define _XE_PM_H_
>> =20
>> +#include <linux/cleanup.h>
>>  #include <linux/pm_runtime.h>
>> =20
>>  #define DEFAULT_VRAM_THRESHOLD 300 /* in MB */
>> @@ -37,4 +38,20 @@ int xe_pm_block_on_suspend(struct xe_device *xe);
>>  void xe_pm_might_block_on_suspend(void);
>>  int xe_pm_module_init(void);
>> =20
>> +static inline void __xe_pm_runtime_noop(struct xe_device *xe) {}
>> +
>> +DEFINE_GUARD(xe_pm_runtime, struct xe_device *,
>> +             xe_pm_runtime_get(_T), xe_pm_runtime_put(_T))
>> +DEFINE_GUARD(xe_pm_runtime_noresume, struct xe_device *,
>> +             xe_pm_runtime_get_noresume(_T), xe_pm_runtime_put(_T))
>> +DEFINE_GUARD_COND(xe_pm_runtime, _ioctl, xe_pm_runtime_get_ioctl(_T), _=
RET >=3D 0)

It would also be good to document about these in the kerneldoc for the
get variants.

--
Gustavo Sousa

>> +
>> +/*
>> + * Used when a function needs to release runtime PM in all possible cas=
es
>> + * and error paths, but the wakeref was already acquired by a different
>> + * function (i.e., get() has already happened so only a put() is needed=
).
>> + */
>> +DEFINE_GUARD(xe_pm_runtime_release_only, struct xe_device *,
>> +             __xe_pm_runtime_noop(_T), xe_pm_runtime_put(_T));
>
>maybe instead defining the noop() helper, we can just skip this param:
>
>DEFINE_GUARD(xe_pm_runtime_release_only, struct xe_device *, , xe_pm_runti=
me_put(_T));
>
>> +
>>  #endif
>
>either way,
>
>Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>

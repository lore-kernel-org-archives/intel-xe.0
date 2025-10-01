Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481B1CCA470
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 08:03:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0EC10E69E;
	Wed,  1 Oct 2025 08:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NOTD2H2p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8AF310E69E
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Oct 2025 08:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759305823; x=1790841823;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=G2UNVBSYks0XdtyXdYCkBsNSTg/29tX0GQaqsKQacMY=;
 b=NOTD2H2p9IHJESgnmYVFwOa8yYF1i3qEDvmtwBv/VRPgfxBvEvvb/T5B
 w0d8vEaEKZkArCk3TFaYt14r3NePZ7HTr3uhuJWZhi6ycUOsXzNzqUBGm
 Z2zpcQ4Gfjxk9QpTCIMxF36Y1XSjwRtRxnltpKMLY/StH69I+CKHp3GpB
 T2CkEenV/pfUGBnXWTeqWY76RrWq2Ouve6Ojxzgsrh+U+29oaiAxgHiTC
 UiiDDhK5e5OmAOL2MXuttotiNgUe0zuBMcip2gdnpRhzslTABHD1KZaGb
 S8uT47o+YFXP0NrSP9OOfmEIl10t2atpBYpKhqAD245A8WRlDUUsVUwzQ g==;
X-CSE-ConnectionGUID: Lz0OELd9SrePVm2CEvFZaQ==
X-CSE-MsgGUID: HyOHEnIRQAW2FrKXczWLuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="72997342"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="72997342"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 01:03:42 -0700
X-CSE-ConnectionGUID: CIT68gPrSuqMoAO/NNsFjQ==
X-CSE-MsgGUID: c/H+7FkVTqmlhbNMg2ADhQ==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 01:03:40 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 01:03:39 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 01:03:39 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.68) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 01:03:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZaKzDWDvgxgLXlDgAD2fzcPHRDNd5XC7pfB6jkybZkcLn3mTnsfqG39EkyRyUTT7t147g7AYc1QM4UmenHYS5oe//uke/xMUJLHbJa8zzl8PYI2vVldmy69SmctrRoWhJ7EVrnNqDBL6oTYhMlgaLbku3bA4kEFCE5HuGGNrGtEem2wHUsrQ4ZvwksT+9CLWQ+a4P6iNvDXPvvF9KGuhhOGCMmUb3Hm6GBjoQxuzqaptECD/5M5uJF5XzmHKQYnmp14oAQiQCagBtCTW2QCv/hM4Al2ITuLOKhPKoefuQvVMghrYLR3R3FCVaM95pnCxEMIYvZ/j324SEDlU+ZillA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZXNqTgdXT8WCm86Myh0QpVv3UzKopUPD/V6ZRX19/c=;
 b=nRsMGoCR3hxpEGp+/DXy6YPjInhFQWa0H0G56RUCtrZW0vdLKrQpGP13UnMLx+Nw+qKPmnQPUlS6sxtdfo0U6lfPMgJLv9E9vltnPhahMcGZGfezb3cqYfSZxn5uarlcsLR2LPCa48Rv/Dwft/JPZ6hTWML1XXA+lc4Mhpf2B0ANbTOZ+Fa1nNka/NFZmuou1eGqa2P5Q6Qt33Fw+PXou426fhX8XPjESNydMwcsMFI+UvdojO/c3Mq76eqpt70qc61t0ikU3hou6yPu5M2RQrTeL45aJqM9vY6RWFMoov6JXLVYSTwpMB4nfVB91p+PfcyauUflfHMHhUNWV7j+rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS7PR11MB8825.namprd11.prod.outlook.com (2603:10b6:8:255::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 08:03:37 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 08:03:37 +0000
Message-ID: <b5ccedeb-5b93-4fb3-8256-090b6954d5d2@intel.com>
Date: Wed, 1 Oct 2025 10:03:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/xe/pf: Add top level functions to control VFs
To: Matthew Brost <matthew.brost@intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250930233525.201263-1-michal.wajdeczko@intel.com>
 <20250930233525.201263-2-michal.wajdeczko@intel.com>
 <aNzZgNIIAgd6OBzn@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aNzZgNIIAgd6OBzn@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0092.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::33) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS7PR11MB8825:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e1cff91-a264-4ec0-2384-08de00c1067f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rm4vWDFDdGl6dVVHKzVVTVBrQlVjOWh2WFY4OWQrcXJiMHVPdE14RmZhaWVF?=
 =?utf-8?B?SS9OYjhzaU92bDgrZkoxM1RHY0JibGFhVUd1MHJOUS9QNlExejZRRFZwSWJK?=
 =?utf-8?B?TTlvTEJEY0VGdjExVHJUbURUUmpGK3NnUmpOQUt4NGRsOUhVcWdLYWwxdUkx?=
 =?utf-8?B?S29YTDFDa25ncC9FWkhHS0h2aEU1K2xCS2ZMMG5sQTJRaDducUMvZTdEa2Vu?=
 =?utf-8?B?Z0tML01RWUdNcWZYTnNEZWNUN2pJTk5zYnZpVkVuTG11MGJON2VqeFpPZVR2?=
 =?utf-8?B?emJWdDVEbzQ4cnRkVXJLa2UyanRGT1BUSmxKMkJ2RUVwU3lhdks4UWU3MVZ1?=
 =?utf-8?B?TC9RRGdhQjZSSjRPTEs4eGFDc3hSdTc1NG53MFdPZkVQMVdvQkI4Smk1TlBL?=
 =?utf-8?B?ckZjdVFkNDNQRUh2L0xnM1VkWStwRm92NWtuWU94N0pyVDkvZ0VJWXNkQXZG?=
 =?utf-8?B?Snp6MTBxYU4wUkRxdzJyYzBKbUtpYnBralA0djhWUlZDWGJtVXJnaDQ1U3hX?=
 =?utf-8?B?aHVOR0pKVHo0WWpVY09oRUVUVEV3NG9DRk02OUxFcXVvSDFLeG1NN0ZKRVhn?=
 =?utf-8?B?V2REVGNBQklVOEM1RzhKQktBTUFRbytVdWxtdnlXSStVQU9ESnlVTmlSU2kv?=
 =?utf-8?B?MGZ1Uk5DN0FtYk16cjIrbkg5bXluTnE5OWZ2MWZxd0d3MjQ0L0JKV3NtMU8z?=
 =?utf-8?B?M1ZtblRFME9CRTA3U0xpeU03QmF1dGpSZUpHb2QrNmM5MWsrUkFLUnRaU0Ro?=
 =?utf-8?B?dGMyT09OVEYrRGlSMEtIOUR2bU9wejNnT3I0cVZTWTNFb1Z1RWQ3UkhNSXNZ?=
 =?utf-8?B?VGdVYUNmUmdFZDJEdEtubXhISjd2UmFyNU9rNmtKWitpbWp1Qko1U0ZNTm9J?=
 =?utf-8?B?Z1ZlOUhjZTF3ME5NZWpaWUNCRkF6Z01PR2FPbVM3TTR4MEdGYTRjYjU3NzNM?=
 =?utf-8?B?b0VDcG0xcGxVcDRyU1hwNTV4cG5wYStOOUk3M1FWenp2a3RmQmtOS1FxNThi?=
 =?utf-8?B?cXdwYnI4RGlrNlFwTzdtalI5TU1KbUJYYitldURaTVZUZDgzZXhkM3RJZ0tG?=
 =?utf-8?B?QVNxQWNabXo0ZUV3eWxkRW82N2VCSGQ5ZC9FK0V3cEt4ZnUwZTR3c0VPaExl?=
 =?utf-8?B?U3NxZVNKOFM5T1MwNmJKOGJ3M3lNcTQyVUpNalg2L0Q3Tm1HTkh5MTJVU0g1?=
 =?utf-8?B?VXdRRlJuT0ovanE2dEp5RTZHT2R5RGxjUVZqczJjd2VPTU1TODNtTmpWVVUy?=
 =?utf-8?B?Q0tnUitEVVBvM0ttbW5tUGNqYU80cGJDTzZtSUh6UkE0R2hVNGRNS2hpOVdU?=
 =?utf-8?B?MWtBVTQvS3YrUmRhckhOenpnbGcrOTVxSXczeUxMblJPWFIxTzdWdWhqUjdz?=
 =?utf-8?B?YXUvV2FVcjB3cFZvR1YzTTRkU1B3NUhoZGx6cVI4UnNlZWNhTloxb2w2SXIz?=
 =?utf-8?B?RGVKMFZaZitadm1jUW85Z1RKMzl5cjNjWVZOU0svNUh1WDZCZmI4ZXROa1VW?=
 =?utf-8?B?VVBIbTlLajFMZkdxWnhEZ1dFcmtXbWJYeGZ3Vmo4UmVZekdGRzlRdENpWGZP?=
 =?utf-8?B?aXNwTDc0R0tJSmVvNHFZL3NoKzlDdXlRWG54QXRxeFdQQTNuVkxUK1ZjNXZy?=
 =?utf-8?B?Yk1LOE5POEI0eHY2K0hhVFgvWVlzTGdlK3pldFJxU0FDdjdHMGJoKzQ2Q1Fy?=
 =?utf-8?B?ZGU3eGE4ZGN4WFUvSEZWc1VVVVg5VDAreFBGanZVY3BwOFJ2KzNibm5IZ0Rj?=
 =?utf-8?B?aStPMGRNcVhoQWE2L2FmK2ZhRFB2aVlRbjMyTEoyOThMNmZIUFJDSnQ3eHFr?=
 =?utf-8?B?bWFtSTRkT0l2dHJzcjl3R054eEN2akNpcU9qWUZnZ0ZzVWw5VmpoMjF3dytZ?=
 =?utf-8?B?UDE3UUg4L2pVZGFCYjNBaEFEVjJDbTZvekcrVEoyVEhSdnRBdDJidGUxV0Rm?=
 =?utf-8?Q?Fpo99xm8AX6GwNWqfbP4HsaL+U4a1j3S?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWNvVkVzaWcwMFlydFBDSVNSL3AzVGRsMk9zTGtsZ2hFblg4ZVZSSkREcnFj?=
 =?utf-8?B?T1B1cjRyeURBRnNOTnZxSlRKazUxTGRETFN4YW9WLzVpRVpCajlTS2kxam1q?=
 =?utf-8?B?SzNwOURiSm42eEZiTGtaK2o1dDRaTVVQbnk2Vjl6OEhpREFPS2dPdkp3RGxF?=
 =?utf-8?B?Y3hnc2Q2Q3JkbXMydTFQRTdyREVlTjlHelp5SmJlMEdEWVp3QmhPcXBoN20w?=
 =?utf-8?B?UjB0eGVkK094S1czaVJEQXdxbkhZKzUvblpRaHV2YVZOMWtCNDIzMTNSQytX?=
 =?utf-8?B?eXd2aDV1emt2WWwwU0dqbWVZZEI1TDB0UGxvTktjSEtnUlVrOG5maGt2MzZn?=
 =?utf-8?B?cSt3TnJJM0puelJ3eUF3aWhFRDJTY2VqcS9ibGFkdVErdUxvck1jeitJZXRU?=
 =?utf-8?B?NkQzQkhxeUVOcDZiQ0ZnSlhPZUNuemdYdWdxRjYxbHpBejlkcWUxVngxOFpU?=
 =?utf-8?B?NmpNaXUyUVlpbmZ0andIL2MwTmJ6UjdHQ2FUNml1ais2MWYwNlhROUs0cmdv?=
 =?utf-8?B?TEx5bVBJUktOV3o5S1poWWdoamtXNlFwbGpzTm5sVnJIV1RqOFk3Tzd3MzRK?=
 =?utf-8?B?WWxYZ3dLemxPYm95VElIWnlwd3FPRGprSExQVm5HZ0pnVFcwUENvczNYZXUy?=
 =?utf-8?B?SkNZNVJIT0d3bVpUUm5hMTVKMW15OTJob3dLUkFqMjhnTnFhVmE1UkZDbDlU?=
 =?utf-8?B?WjFocHB4RXhLclJMcTVLVURGSnpHbjBBWnZQYkFKYWFHREw4VXU5Vi9UVFRO?=
 =?utf-8?B?TlErakM0RlFZaG1mdDRFOTZ5czhJUGZaeTNTZEI0azNucytKYTNWWEZVMjNE?=
 =?utf-8?B?YUFKK1c5a0lwSVV5MndERzVhMDE4VUFRbnIyMmpiaEs4Q3NhcVBDV0VFVGov?=
 =?utf-8?B?ZTQ5UG5UdVRjNUUwY3pZd1p2YWVQT2JJQU1vM0xnSWxWSC9jYVJ6YVJBL3NV?=
 =?utf-8?B?Vy9TaVNtY3l4ZkMrQlJYd01ZV3UwZnF2eUxsZTZYRlphRHcwaVlKclI0RDFN?=
 =?utf-8?B?MldLNFkrU0NYb1BpS29WS0tudVVmMVlvdVdoRk9WWnNSKzJrSkhkK3RaNU5R?=
 =?utf-8?B?dnRxcXRoaUZqcXRkYXBmN3kzd0VDN1N2SXBOa0ptUXhDckxkR0xwU0lqZ3d3?=
 =?utf-8?B?WitTTU52ZTlKRlNtcGxYcWZxRUdVOG5qOXpXa3RYYlVTQzUyNGdOOW9vajlr?=
 =?utf-8?B?ZlZPb09LYnpQYlpIRUxKWi8rTHpqb3dmU1lwbUM0bVU3WHRrelNzWGFlNGlH?=
 =?utf-8?B?d015MS91OFg2NlZ0MlBvTlZZNHZ2NHpETjd2U0tEOW1QNWUvWEJOMjRnQy93?=
 =?utf-8?B?TnpQcWJIbWJmV1FyZ1djSUE1RjJqSUdIaVlteFdZR05PRXpaWnhrL1pxYzZU?=
 =?utf-8?B?V3VCNGkrRzRQbXlNRDhqZ1FvaW9rNnZyUHpLdktGS1JlUWpjb0RscHh0SWRG?=
 =?utf-8?B?d2lqekk1Nk1TRlZJdk8yaDNqK1NMa0JvenNUazJxTzkxR0NKeEcvd3d3UnVp?=
 =?utf-8?B?TzZjQUd5QkxiSExLd2V4TElJNkl0Q0Vwa2xaNjFYVGtFc1ZGMjlDMUkxY0hy?=
 =?utf-8?B?RjlKNkozNUltRjR0cUxaOU0vTkk1NysxSGQ2RnV1NHVpWU1yWWM5eDQvSjIr?=
 =?utf-8?B?anR2bm9kM3ErcFFyQ0VXZ3Bybzd3YitFSU1kRzBicHdSamRqV25TS0Faczd0?=
 =?utf-8?B?QkJZcmpBNDdEQWVnTzBnNTV1bUZocjdQanFEaytSdXpNTkFDY0pwK1ZIQzZz?=
 =?utf-8?B?ZEVabTF3TmtyKy9wR0IyZFgyNFZPNzlPaFVaT3gzNjd5bldFUlAzN2VJRkxV?=
 =?utf-8?B?V1NUZGRwc3lmekxNYjJFam9sbmo2TDhrbWUzVlI2aDBlNVFIeXZWNE9helJh?=
 =?utf-8?B?d2hiNkpHdnkwSUlLUHdmZy9GaUp2dmJUaHhBdFlFOU1DR0FVd3d2WWVWSXVy?=
 =?utf-8?B?Mi93ODV6dlo1SzVuYUMrbmdVSy8rNC85SlM2UFBHaVcxOGxaZnlnUmZyVHEr?=
 =?utf-8?B?ems4OXMzR1NKY29GK3JkaUlvbUljTm5CQ1JLcllsWTdPcUhtSnNKRVlaMGdG?=
 =?utf-8?B?dUlIK3hTZnJxYzljQjVCelB1d0lFamdpVUlneU9OLzJzaXFaY3lxSVBKdysz?=
 =?utf-8?B?K3BEYlRnYmZZbmk2U2cxZTFWamlNVEExK1M0Rzd4SHVYaE5RT3k4SXNqU3cr?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e1cff91-a264-4ec0-2384-08de00c1067f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 08:03:37.2287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hnDmNzcyCGi3f6ohTlSlRgvsKAJnwWySbIo3nMReF4plDhNxAFjRuVyyfmEhY9KuSkNfrbic2j3831FXYx1Twjuh95RNlYFG47LlHsnxuXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8825
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



On 10/1/2025 9:34 AM, Matthew Brost wrote:
> On Wed, Oct 01, 2025 at 01:35:19AM +0200, Michal Wajdeczko wrote:
>> We already have control functions that we use to control the VF
>> state on the per-GT basis, but that is low level detail from the
>> user point of view, who rather expects VF-level functions.
>>
>> For now add simple functions that just iterate over all GTs and
>> call per-GT control function. We will soon allow to use some of
>> them from the user facing interfaces like debugfs.
>>
> 
> Will the VFIO driver hook into the level control like xe_sriov_pf_control.c?
> 

it should, but likely through a small glue layer that will convert
from pci_dev to xe_device

+ Michal to confirm





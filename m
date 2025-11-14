Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0A7CE7B0E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 13:41:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0CE210EA6D;
	Fri, 14 Nov 2025 13:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CqvbJG0L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F15B10EA6D
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 13:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763127665; x=1794663665;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=vrL18ZEzUaoOtPKq0LO472wC5HLAi2gP+EZLXS+gSuA=;
 b=CqvbJG0LjoZcrBK11wIlwDy12a0QPDLm4JQwwvAObqUPhE4j0xaIsovz
 DUeZHKclzOJA3WAZ6xvpg7aCSAoG/gjRmE/bGbNgXx77k35bVJmB7I3WW
 V89d08imkC5Fl0KW0YTZl+RaVIyamx16NaT4ncqhoyHb7fU1paw5t3sOf
 7nM71aF9ZrysRvUZ0RPEyo1VJiP/kVIiYzas281XSIqAtV4l+1/4w/788
 AS+2OCrE5aUnUlG4cTPTJTRpVe6gOhUZA6uRlDPaWQQ4pNm3FQTDZB0Cv
 KzfbFNIi3FBCZRARi+MTzuM6LKzTSli5Yt4Ec9Fa0msDOKEnFh99RccTr A==;
X-CSE-ConnectionGUID: YRtVzI1GQ428vVwid1nz8g==
X-CSE-MsgGUID: DUzA5ZUOTY+EQqs8cWvOhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="87867471"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="87867471"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 05:41:05 -0800
X-CSE-ConnectionGUID: FRuHpZtvT4mjYK/t4OSitQ==
X-CSE-MsgGUID: fY0V9DG9QYKHSV6Q7JrnRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="189978071"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 05:41:04 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 05:41:03 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 05:41:03 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.17) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 05:41:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HHOdq/jhgVfN7szYUY6wD2I0IN/JR3tXIqT7DM3JdUI3NdzwE0/s3U9AeAsgzcWZwaeuVx81ABFRMIsH60YHRIlMBZoItrXWGKRApU/xPgQQO25njgdpBIBt1ghb6oGVjmL82++5Q6GJQ/6hYXMZTxKrtnGGTlMdvjtLM4uqOXzaQty7lKoN+75OgdWFz8hHKTK91ap2kWtfLIRJwyiyo2X9xHTHhGhDzz2npVzN2gpi5DQFXmQPxEW32ggy72CxCmdx4G7LXaz3theYVF3DDeUhPt8rMLTXdxqyvevlznIRSA5jiXdj2l8iBJYJDW5dMuqlKseq/SelKLAXduUZOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4JCrvyD0kA+T6+/KSDBX4ClJTIKNm1YQDFtF9Ba7rlE=;
 b=LAtxeyEDF9ghjvNaKHar2xrv2yBsCmHfysaAikcTLCT8MRsvj0IqL/J7Q9MaCo/l3XkYxoYB6dPpIS3DPfxw3y4FOLvhe+dd12fvk5wUdETVVPdwHqW2uQOR86LiNhOulcD3LqVzf+/SghChEyBs5V4+WCdGYY1EuPbsnfbCib6W9rNCq05jVkq4LIdOWdv69MZyPK1C7GUXiRmilyG5VuOh1n1Skk3SgscTuB5qZIh4LBerwsG01Hfw2I19ghu0jFTT56l/l7bQOJxdygyCxkKeIi4fu9GAiwegM6XZZhb6XkrZTcCFo0ddYvevlbLNEkEVZJrn1/o7l3/NX/AN7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.17; Fri, 14 Nov 2025 13:41:02 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 13:41:01 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lukasz Laguna <lukasz.laguna@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH] drm/xe/pf: Fix kernel-doc warning in migration_save_consume
Date: Fri, 14 Nov 2025 14:40:30 +0100
Message-ID: <20251114134030.1795947-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::24) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CO1PR11MB5073:EE_
X-MS-Office365-Filtering-Correlation-Id: 954ec25a-c9b4-4682-eba7-08de23837348
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3Y3MVRsZzBCUEtnZ1BrN0dmQUwvWTZBbU5tSmRpQ0tFU1FTUjdYZHJXUzhK?=
 =?utf-8?B?KzIrVkcrNFdBTDNXc3ZTc0RDNTdKUVZrYTlBVlBnNzgrYWQyWGthTkprYkN3?=
 =?utf-8?B?QWo2TkdhNm5LN25ObXNsb3BBcWlkdXhScVo2NWtSRmlDVnJyTjVEMHhHSjRp?=
 =?utf-8?B?azk5Q2xTWUd4MDJFaWt5NVhwQWsxZm9KUmRiZEtuN2NTZHhkTVUxYi9scVNT?=
 =?utf-8?B?ZUxnRGdCMElJZEJDUlVLeU9yelFpbUdjQWsyN2xhSTkvQVNVN1NNdG03Njlo?=
 =?utf-8?B?cEZ2UXBpWjZUL2NlS2ZneEFZZ2h1VkN6OWtDZk44N0lZVHg0L21aOUZvUS9n?=
 =?utf-8?B?K2xUUUxRTFVhL2oyS3N4eTUwb0tHaUhTbEh5TEdjb2I0blZvUlB2blA3blVK?=
 =?utf-8?B?SCsyYjRZckpmZmVsZEpRUGxOeUNOUkVYYmlkcUh1QlZzdXhsbkd0KzE2Uk15?=
 =?utf-8?B?Y2I1c0dJMG44cng4REFFYXdRVHU0VVk5UW1kV01VRm91QVArZlZYQWxpQzBk?=
 =?utf-8?B?czVKOWorVTYxckZabFQ5RWZLK2pSUnBBY2NGbGJTb2NOdG9SZStJcmEzTTEv?=
 =?utf-8?B?eHAwS0xvbWEwaExwY3JHbGR0SDZHRzBaSnQxTkJuZ3YwdUc1TEFhd2JqNkF5?=
 =?utf-8?B?V2hFOHFJK3Z3L0lBVDEwK2NuTUZZTUdINmx5NlcyTUg1NHpVUElQMzVLblc5?=
 =?utf-8?B?MW4zUUpsRlJCY2syNTYwUkNoOTF3QVdYQitxK2Qyc2c1cERKTWRGK1A3dDE5?=
 =?utf-8?B?U1lVRGo3bEVJV3ZNL2Rpb3d3TS80YnF4U21nSzBLSjVWYjk1V1p2WHJpamJs?=
 =?utf-8?B?UkE2UVlzYS9GYmZsYmR3aDhPU0lBTHNROWRjZUZDSk16V1ZlRFdweUZHNmto?=
 =?utf-8?B?L0JUNmg3UzdiUG03bHhkVUFzSFJpbHlNbVBsYkhqTjJWRFBuVEhZMnN4Yk5F?=
 =?utf-8?B?WUdDdmVLam83Rk8ySTVwak04V2NYRkpWamQ1Mnp3ampkTzhmbi9jeE5VOEJO?=
 =?utf-8?B?Z2Z4M1c4MFVUQkR2WWd2bTRGL3VhUzI2amZpNjZxOUVsWTBPL1pSalg2OTUw?=
 =?utf-8?B?TjZTSzF2Q0dGQ3ovb2EycmZhL1ZkeGtQRXRyWCt1cEwvdlZ2aWlkakxkVmFO?=
 =?utf-8?B?Q2crVVczcHdqWW1jUlhaQW45VG5oUzlOUVpKVit1eG9iR3A1bXVSK1hDWi92?=
 =?utf-8?B?MHRvZi9KY1FNcWh0RTJXTC9ZSGlhRmVYWUdxV1ExR0gxazZsZmVCMU9KUVVE?=
 =?utf-8?B?NkttQUVoS1VFRW03dVFtUWg3MlEyUG0xWlZDZ0U4WlYybTI0LzFUais2M21s?=
 =?utf-8?B?Z0dGdktCVTgzVTB2T1hvWHZIRlYwSlR4bmh6VGxuaVQyRWM5K3dtdkc0N0FX?=
 =?utf-8?B?czl6UlYwRnVaMW5TRExCbUFZbkpibk43K0ZZZmN1N1lVSmJyNEVadjVwbVJt?=
 =?utf-8?B?WmExV09VVGp4RVBQWDgvYUU2cDVzOUtnUnNlVjB4cDYyekZKTTFUUVBCZXhv?=
 =?utf-8?B?S0VHT0FjaTdya0NQUHByUEhLMGQ4UnFlbFpLOUJZNTBIazk1K2hvZGp6d1NI?=
 =?utf-8?B?NXZqdmNIZ01IU0F1ZUh6VG5OWnZuc1h1SGNZejMvaHp2bUFZbGpOcWgxQW52?=
 =?utf-8?B?cER6blZqUFVPdFg5ZkNNeGoxeU12Zy9GdGZSV1dYdVlnNVJRUm5uZkw0Skhj?=
 =?utf-8?B?VjdGSUJ4TkJBTTk2bk1WT3RUVXcxSFl0aXdjc2RydU54SFk0aFVjRGpOL1dv?=
 =?utf-8?B?WmZRR2JHNkwwaVhuSnRacDJjQXlSaWN3SG5YS3k1eHdwRXNvYVgvMWNzaWNi?=
 =?utf-8?B?N0hsOEo1MFYxSFdTZjdTTUdVeC91T1MveTIrVEx1UitvaHVtYXAyQi83OWFq?=
 =?utf-8?B?ZEZaWUQ3aW5hMTM3N2pjL1RvSGYwREdrYmtJUVBGV3g5WDRYMlZsQWZXODZu?=
 =?utf-8?Q?MvEreEiHPIk7ibKazIcIMaiIcUAt72r5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjRPQk8yTk1CVTE0eTJIdkl3Y3A0ODk1T3VuWk5MWVFmcGp4c3lFelQrd1F1?=
 =?utf-8?B?UjhwMnQ5ZnNHTDNoNXRmeW85Z1lEdEZrdmx4cWpGT0tWSlRaNDMyNDVBMHpD?=
 =?utf-8?B?U3FwYXQzU3hEODZEbjZ2UkRnTHl2amgxcERTaHhpZVA0VlpEUTAzeEEyaE01?=
 =?utf-8?B?RUt2ZEsydGo3elFKL3Bnb0hPRm50bjRpbVBDTm4rSzdadmtUMlc0WWcwZEdo?=
 =?utf-8?B?Q2ZBRS8xQ3kvMnVmVUdtTzhlQmJ2ZytGVVB6aEROZ25MT0NlMW1RSC9XL2ZF?=
 =?utf-8?B?b0srVUNuWCs1Y2lRSnNtYjZYZHZKWmhGYWZVWUZqNjNBT3dCQW1SdS9mQjR6?=
 =?utf-8?B?QStyeHR1TEZpT1dDdldnTm92S284SUxWWWdaeEx6MEtvZEZndDlweFZ1bGVn?=
 =?utf-8?B?RktQYXd2SmpMUFBiYVc1Mkk2Qno2aEhpSVdFZWNxQ2k4MmtpU25XM2UrdUdP?=
 =?utf-8?B?bmF1ZEZkdHY5cXpFYi9xdGF3SUFmUFJzSmsxRDZpWE5DWlZTN1hEQnQ1SGRp?=
 =?utf-8?B?bHc5aUZlZ3lmYTZGNTh4c2RvRkN0anpSd2FadHNaUDM0cFVQcVllQzNoQlVB?=
 =?utf-8?B?L2kxUWw2TUVwbzVJNHhVQ2lDVTN3eEJFbUVSM1hETEVDRDVsdHBjRDN6cDRw?=
 =?utf-8?B?OUlYUk9IRVZJZlM4bnY0WVJaUVphRnRIc0xLN3l6NkxXU0x6QUVRT0RkYXow?=
 =?utf-8?B?dittUjZSYjFMWjEvTTZZWG11QXltdjROOW5BUTR6a2R3KysyR2xsRXhvZ3Aw?=
 =?utf-8?B?bnAwdXBYTFRUZTZBNVlBQ0lQZlZ3TFpBd09jOGVHNkFTMlN2UmFrLzF1ZDFw?=
 =?utf-8?B?TmtlTEFndWd4SDBFY3ZySUQvNHlFSXhnZFgrclRFVUZFbjcySXB5c1kzdUlB?=
 =?utf-8?B?ZEwrL05GTldPWmc0UkpJSlpDWVZIeTY0SGd4Ulo0a3NiVEV0TURMbDk2MkpJ?=
 =?utf-8?B?UjVGQ2g1bUFETUZsakFUTmcydFNMbFl1YmN6VlExVWtoclRrOVhJbEJMZXhW?=
 =?utf-8?B?NlljMFlzajhBMUJyYWc5TDJlK0ZSUGxmSGtpVGNTMHFlcDNTY290dVB5ZE5T?=
 =?utf-8?B?bmtQSkhiRGxWTUxIblBYcHFRT1YybWVuVklaeU5FR1lDNFZHbEhzQys3QW1U?=
 =?utf-8?B?MHpweHNHOENkSUhMcTR0dkI3UW1nUEZpVUk0bTVZUXFpNG4rdldCdTVaLzJO?=
 =?utf-8?B?eDRISzh1cFJJaDlXbGoxWXNDSkdQRHdqYWlFeE9ScGltS0ozaEZJb2FGSXZS?=
 =?utf-8?B?T2w2WldseGMrUnhMUjg3ckF6VzJaR1YyVWY2NlV0bGlWbmNBV1lXUDY4bUZV?=
 =?utf-8?B?dW9VRWJIakFrM2pzQi9OaFNiZ212dEV4VkxxS0QzdWdvRGpkdkM5Q0grWHdq?=
 =?utf-8?B?bStkb09hQ3NBbXBELzFaNm1wRXN1N2xKc0YzOWFNMnNCc3ArTTlkTlJPeUlI?=
 =?utf-8?B?Ry9LRzRpdkdLOTJZTmwyNTY2VHkvRWRBVEszc2RPUTcyY2s5d1I4ZXpLSlU1?=
 =?utf-8?B?VW53QndvUXJkS0doVUNLVlgyZmZ0ajcraVJEWG53MFRIR2VwcmZoWjFMYlNW?=
 =?utf-8?B?MFd6TzVqUENwelVUTWs0cUtSZHA4OS9tU3FPWW02bW5CTFBFSU5IdE1XVndk?=
 =?utf-8?B?K0k4OWZDZ1huS1U5R2RtWXNSdUVzdG56UWdsWWM1TXRHSHl2SEc0eTlubW9D?=
 =?utf-8?B?Y00vcXV4T2pCNTl3OUYrZTFTSnR1QW92TFd1Z1RwK251RHhOVS85R3ZqUmhn?=
 =?utf-8?B?dWs4NnkvcHRhcDR2NWgxdFI3UWRGODlLQUNYTU1WOWE2U05NdS9oQjBVczFi?=
 =?utf-8?B?Ykx6SC83OHV6UkVOR0t0WXZEODFxNkpxVzhVd2ZPTURxeWJzNkw2S09UcEhq?=
 =?utf-8?B?RnVReDVXSVlxMHpPSXJCc1o4aW5iUURpRmRLa2szSWVZR3YvSEtZV1JKNEFC?=
 =?utf-8?B?Rzk4MmRSVkZjYU0zcTJiWEg1UzRYRVlBTnRhdExhYTlCQ082bnhtNmJxZ050?=
 =?utf-8?B?eWFzdzNWaHhBYUhzSXdPQWRObFY1MU4rd0xVT0c2b1Z4dC96YU1LWjBEdjRr?=
 =?utf-8?B?bTlTTWR0dkx4VUtWeEtHd3ltRFM5akdDYmt5akJzUGVTc292am4zYjEzZXNN?=
 =?utf-8?B?eHlERUw1QnhyMFZEMXNaQ0dRWDI1akhmN2crdGFmbk1iQmJxZFE0T29Zd3pT?=
 =?utf-8?B?V3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 954ec25a-c9b4-4682-eba7-08de23837348
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 13:41:01.6265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D1dN/0DO4OHuZMXfjWFiNx3XTzU9l59UMZDz8j2ZdVHPBW3jCuL7Hf9ArDEJJFhnSPTbBIuiq5GV1Agf5uAmTS7DMsr4ESNN+33sN8392YA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5073
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

The kernel-doc for xe_sriov_pf_migration_save_consume() contained
multiple "Return:" sections, causing a warning.
Fix it by removing the extra line.

Fixes: 67df4a5cbc583 ("drm/xe/pf: Add data structures and handlers for migration rings")
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
index aefc6d81c2552..c10873b6acb34 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
@@ -170,8 +170,6 @@ pf_migration_consume(struct xe_device *xe, unsigned int vfid)
  * Return: Pointer to &xe_sriov_packet on success,
  *	   NULL if ring is empty and no more migration data is expected,
  *	   ERR_PTR value in case of error.
- *
- * Return: 0 on success or a negative error code on failure.
  */
 struct xe_sriov_packet *
 xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid)
-- 
2.51.2


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E43AC7EE30
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 08:45:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEE110E337;
	Wed,  2 Jul 2025 08:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JgUyVsZ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A80D10E31D
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 08:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751445947; x=1782981947;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=pwDmS5Q7WL+TQ7iCufHelxZa9PFWAcnBd6frk3egy88=;
 b=JgUyVsZ8mWZCXw4LRSrkdKubhBGpyEfD4WMpEIIMi7SXkzl6mc0hjJJ2
 lJZ3YtA82MyM2J7MpqkieDD1Tw5XpAl+mtsNfk1wmgK5pifuOLbhMMPuC
 O1za/CnmDiUiJOR2KGkF3ze/ysA1oE8BKD7QQKaRC2N6jmjTthmwrnoYz
 OzYsiRM9HhOs6urrX+WsEzxbT68drmIVfgnqGYRTsLOWg2oOYIhqoeokv
 WaRImzl82SDdCzJNtZAooxIkp5F0Y1THH+qF23TBinSCzrs6osYmqvdtR
 AKY1XxtDdrWecQ0pkejt5erzA6/BcxqbY6d5F60hjdiOdh7yn3RSalddA g==;
X-CSE-ConnectionGUID: GQMVpvSCRAOAFiaGU6wz9g==
X-CSE-MsgGUID: zG/QAagLQVCjzilcWKHmsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="52963499"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="52963499"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 01:45:45 -0700
X-CSE-ConnectionGUID: lmWJFclfTJmI6BZnkdrwLw==
X-CSE-MsgGUID: W5xd91ogTm2R9j+iBH9D+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="153643631"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 01:45:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 01:45:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 01:45:40 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.67)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 01:45:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R7AKbFJ/Y69G9+NvHrGvLfFrYZjOmOjfadqtOKS8Qnz0exjy2dSSvdHrNq9L6chpBUGS+W/5QkGLZCKFtoA6MGrsOjisemL4XLwRaJU8d4Qndl93lrFwU7Z7fzeSsCxH6f75wvmWT9GcWWrnB5LWQ1qJ+0EdY06AbTtkOo3WMTymXMOJm2Di3U91SW+LzxnqqL+/OCMlwcc/9tM0jd2FdDuQSBLvATM5Rd0wcVadg4MwCJT7/wXDWWD6ae61tdTRPWNxLI7MHkRnSlxR3/Bcv8m92HyOM9i7f45NyNIZsReayh9/mLu/7dtlfqkdiULUH1V8gv1EXmR9Rc0+/aP+KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+nm5uGx/oU9AFJbhn//p4tZihpnpzlNit5WVSiX2hY=;
 b=EBKEpUoqLBvmkKeSO5smo1hagEUrSpMXJqOgQGrredJdrXhRLkh4GhDnQ3BN6ucs3S6S0xwCZecq4ZFt1eYXhl5lUGt0Xy2rXdhwh5SirZQ4BmBlnFEFyWRN0MN7Pol1twgRSpbz5JZ6Y6e0XwhwfE7gBikBiY4Wqgs/0YkzXghSecLCS39x/JRQinsSG+n13H2khw948178ZhIlW1ArxrItpENvamqgN6D4JZchKQtsr1N2psg/1DrtNSC7WFTShNTz7Eq2xSSSg9RZKWoNGFKqGEcwBKlmehBVx10thh4kR63xTuv8DZwZdpxU9E1Wv0+I2v9Tpec/r+GgtxWgJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by LV3PR11MB8482.namprd11.prod.outlook.com (2603:10b6:408:1bb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Wed, 2 Jul
 2025 08:45:11 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Wed, 2 Jul 2025
 08:45:11 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Stuart
 Summers" <stuart.summers@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v8 4/4] drm/xe: Unify the initialization of VRAM regions
Date: Wed, 2 Jul 2025 10:44:24 +0200
Message-ID: <20250702084424.3609863-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702084424.3609863-1-piotr.piorkowski@intel.com>
References: <20250702084424.3609863-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::23) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|LV3PR11MB8482:EE_
X-MS-Office365-Filtering-Correlation-Id: 78bb1cc9-f059-422c-cd7d-08ddb944c13f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1NJa2JzeVRhNTloQmVsWkdWRXFrSGtqK3UrdWt4TjhVN1dmSXpwZ25qa1A3?=
 =?utf-8?B?Y0pjNWhFWTFYcExIbHdvK0VST3JLR2RLeUlXdmRVa0xiL3ZmV0JaTGZpSlpk?=
 =?utf-8?B?WWxoRkdacTFCMllPR21DN2dBcEtxV0Z2TGpLZ1VtZEcvMlBOcitUWXVoVjZo?=
 =?utf-8?B?UTlTeCt4VlpWaVo1VEJtazdTdkpLbjlKM0RQako5RzBXajd3aXJ6a1dPUFcx?=
 =?utf-8?B?b3lZelFlTEVrSVV0T2J2VGZkeTh3SFhzYlQwRWlxS2FCWUxkcEI3cFJ1dURW?=
 =?utf-8?B?NGNvVmwyd3laNjNZZjA1NnVCaTNmbzhGdVptYUxXNWJMcDdzWGp1QkxlcTFa?=
 =?utf-8?B?QlhPWGptdng2VjBFYnBueXNKbGN1aEhTeVRrbld1RWJZWGhyUjhZdU4zdXQx?=
 =?utf-8?B?L2tZTFEzVlB6Y0RPOTFsaks4OUZSMi9tUmtHQ3Q3S2NvYXJwa0Myb2pzWkZj?=
 =?utf-8?B?Y3h0U0w5QzI2YTN3a1JFajU1TWxrcjJtbTNPNGNweERReXgwWGFURVZpWlFK?=
 =?utf-8?B?dVBBK1ZvNkZQMmdpTTJ3ZVVNRkFyWm9YWTkyL3RuOHpsVDBvVzh0ZDMxcllP?=
 =?utf-8?B?Q0FJTzhsdm1naGt2eXFzOTZZOUJzNmt3b3cyakI5TlhEQUdPR2hZZFpBb3Yv?=
 =?utf-8?B?a0xvWGtNd1IrZUxmSldhNHpCbTU5bk9udG82N0dvNTZ1a05NZFcwaXpPbzNT?=
 =?utf-8?B?SklzN2dMcEZ6aWZzWit4bEQ5ZFA4Q3lIOFl0QnVUQnV5ZWRjR0NCSVp3VVk2?=
 =?utf-8?B?Nk8xbnNvNWdmN1VMemFXZy8xeTI1d29wb09qc1hHRU5lSjY3eDF6RUhtRS9D?=
 =?utf-8?B?RlBVUFB2RmovbWpmU2hMcTlrUU9ob2prQ015NmZaNjEyNlc1dGpXVXZGT2M5?=
 =?utf-8?B?MlJNYU40bm9XSm0xQ2JxY0NRRzI5Y1JWeVRlVi9tN1YrYTg5VEJhWTA5YjVr?=
 =?utf-8?B?VjFUTGhIdEpEdU5iM0hTdDRtV3lUWEZpUHJFdGh6cXNEZi9wYlNPWmIyN2xl?=
 =?utf-8?B?ck01cVQ4OFoxOFVEZ21TZDErSzN1Zzd4aGlKNThKQUZoZk91dDNPeHA3RGo4?=
 =?utf-8?B?QmpjK2NQY3N3R0VwOUJjbEMvdVdYNkdLc1ZrWHJSOGpvQkozd2l0eVRnd0hl?=
 =?utf-8?B?dkxibmkyMTdqQ3dTQzRyNFZ4MFd6YmVsakwwY2h3OUZqWkg1aEpzbmtIL0Q5?=
 =?utf-8?B?L1VlVjl6cnpoN2hNdUVhVDFJQ1g5MkprM0Y4N1E1VTY2VHlUYTQwYWZsT3lt?=
 =?utf-8?B?MStwZjhqNTdtZzlDeDRWbkhxV29Ea1lBWFFHaEZNbTVROXRPVkdRVjErMTM5?=
 =?utf-8?B?K09vZjVtU1BqRXJkenNkL0puTzJKSnp3dkhaLzhjL3p2dkJaL0RJeE9yTGJy?=
 =?utf-8?B?empoOUJZck93eTdhdVB4Q1FtOFhoZ2pxVXUrMDN4dVE5V2UySENyTmt3OVRD?=
 =?utf-8?B?Ykt6RFZsMURHdWpZV3lrRmNqMzhWR3djNkZQem1EWmxQbFZadHdoNmVlVnhQ?=
 =?utf-8?B?TVZoejBKSVl6TXcrVE80YUtYN0wxd1RBMWxoOGxzMnBSUVhRd3dZMHlIaDll?=
 =?utf-8?B?YjduOE10eUQrUzhhdXpUbE5NczlxUXlSbFd3KzJMTS9HRjFwb1ZxV0pnQjR0?=
 =?utf-8?B?NEFlWkVjWkhta1NrZlpYSkNQbG5DTVVWT1d5aDlJU3p6aE03UWNsSCtiREd1?=
 =?utf-8?B?WGJrWmRGU1krSHp2UEFFUjFLR0xUcndrUmo0bHRsdExRRzhBSUdnTWRPRm42?=
 =?utf-8?B?OEN1dWxndmNmeEtFTElSQXlPWkw2NXJLamE1czE0ZDZEaTBRRlU0a1dUTlVC?=
 =?utf-8?B?NkRTd3UvWFAwa1VleVlQeklyNkEvWDZTMkdNaFVRVXNYRnVsVGhNcTJmL05T?=
 =?utf-8?B?YW0rQmRRcG5aSlVTeGlPZDlYRWRuSUs1R0trWFJYNnZLUlkzMUtZYzNWTHJQ?=
 =?utf-8?Q?sOtg37peaLE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elQyV0dzcklnVThhQWF1SWhWbnlVYXEzRkNwbjNQMHZOZXhBZWlhK3kwYm1X?=
 =?utf-8?B?emZBUnp5andqOXJwSXdtbEtDVEtndDJuQ05kaHBvYzZla2ZDMmR4VStjZ3NI?=
 =?utf-8?B?bjhxbElrVzAvbE8yUUJ0VXVKYmhmdHZNMU9CM09rTWFkMnlOcXYxV1R6S2lG?=
 =?utf-8?B?Znl5T1dURWtOTVNZMVVuY2VlRFBCM2kxczlvT2hIRnpJZUFyS0o1K3h3Wm5l?=
 =?utf-8?B?MVJyRkZud01KcUMvNlduR201TUFXd3I0Um4zN3BNNWl1dkhFajdhV21MM1Bo?=
 =?utf-8?B?SFNIb3ljeTd5S0VuSjIzaVZlYzNtYmtFL3plckg5dzFOZU96T1BZMzk1Szgr?=
 =?utf-8?B?L0FDMjBjNzJlTTYrT01ibXVQUVA5TXI3S2dZMUIvRmlCTi8vSmM3WFBDMmdS?=
 =?utf-8?B?cWorRFlPbi9NTzJqalM5M0V4TE9TdEZibVc1R1RkMDVpaVE3aE5QRDBxai9D?=
 =?utf-8?B?K2YvZlN4aTZWYXFUYzl4QzdWZGNEMStKQTV5WW43eUFrNURxVHRWSGFmRWI3?=
 =?utf-8?B?cW5qRGJVbVRQd0F3YVhpMi9yMHBMQnhZRVRIdlk5UjMzdlpEM3JVYmxxTUJW?=
 =?utf-8?B?Vit1ZXk4VTk1QkQ0OWxpaGM4dXFOR21jbGF4TWFPaTc4WC9DemkvSk5MV0pQ?=
 =?utf-8?B?Q01LbjlCdGZMUzUzRTExU1pleTI3TEJWSjJST09FTithTzJvWDF0M1NKOE1r?=
 =?utf-8?B?RVV3VU5nSERZZGUvTmhQM2VkOUZTRDNaNW8yWHBuQ0NKRzMrbDVrSVUxT1Rr?=
 =?utf-8?B?N3Nhc2NyV1QzK1BuSHl4RVZ6RWVJS004ck5ESG51UXpORmZCYWlHam5nT2Uv?=
 =?utf-8?B?QllWV0xvUDBuN1J3SnMybGxOWVJCVE53RDBmR012aytFaWozWndOc0lidFM2?=
 =?utf-8?B?VmNXMElpV283SUZCODQ0VW04d01zeThKODIxaUZrUmxzK3FxaWp1Q1JGQm1C?=
 =?utf-8?B?SmFpUjRRaERLMVkvMEEycmZTb0VFUmc1WEFJYVFCSXA3cDN0UDZqZnZiU1gr?=
 =?utf-8?B?bjd3Vi9RbEZKNHM5dmVNdzVuQUpaOFZIcmFiVU1UNzJuZjBTanBpSzBxU2hl?=
 =?utf-8?B?L2dwMXRNMEcvV25GMXJDMW9lR2RXNHpLTXRJTWRoeUV3eEVMVG1FL2xYb0RB?=
 =?utf-8?B?QVhFRXBDZ1k5UzJJa1N5bE9ic2tNWjBiMjRnR29KT0h1eU10bXZPMURkM29V?=
 =?utf-8?B?b09XcFlwSmVpVVAxaU9QNTQxMERlbXBaeHRBSHJEaFRjNkVFRTRtSFkvaCtn?=
 =?utf-8?B?Nm95dGFFQ2JUb3phczZYNEVyQkU0ZUVKMWVZV0UvVW9telljak01RHZpTjNv?=
 =?utf-8?B?ZDdpOC9XeVV5WTZUS1Y0Znd5WDY3VmdxZkVIdUJUUmd3d3VaV0VkcGorTFp1?=
 =?utf-8?B?ckxjQ0lGd0xsOTRzUE5laTZnc1hPc3Nqd1QzcysvaWxvT2pKazBGN3hiVzk5?=
 =?utf-8?B?ZFBzanU2ZzQyNXJTcDVyWUszMktkMWFRUWFNdW0vSkhLb0o4SlA1ZUJINkpW?=
 =?utf-8?B?cm9tWWsvYTRKelpoNWtWcVptbjliRWtMTnVDTWRqWmtSN2tJNDhxVTkxMHE4?=
 =?utf-8?B?dzArNHVtTGdrUThLTC9IN0ttRDZLZmd6TE9KN3IzL2NCZ1RhMXR1cndPb1li?=
 =?utf-8?B?ZS84YzVCenhwZTczcGhPakxUUXIvMWRMRFFOZ01TVklTM05QRlFoS0Q5Ti84?=
 =?utf-8?B?SFBaSVUzT1E2NzFXZ2JTVlNsSS9UUDdzQ3g0VzdvU3dTWDRVZ1M4K1lydkJm?=
 =?utf-8?B?YyticlFlVHhMQTA0OFNuT0VGTE1ZTExVdWJVd25mVi80Zy9oY2c4WTZ3TjVt?=
 =?utf-8?B?cE5ka0FyWS93WHMrUUtOQzhyaTNwMmFpdXhsRURRM3dLaWVnUWZhazk4bExL?=
 =?utf-8?B?Rm1DMi9xUG9hN3lLVUFTSGJ4bnYvZlNtTVlXNVA4TjA4UVozM2VRM0p3SHMx?=
 =?utf-8?B?Tm9CeVVobm9IYlorUzVaV3dtMWM1NVZEREVpSGJXalpxTWVFSGJlVDV6b0RI?=
 =?utf-8?B?dHl2K0tUYktpMTlheDNGK05obVBMRitlTEJwVGhMLzR2K3NDY0x3OHI3ZXRa?=
 =?utf-8?B?ZkR1cXQ1dTBqZ3pNZlVwdDdCVTdnNmh4Z1MyMUR6MmtDcGFpa0V1dWRyNUds?=
 =?utf-8?B?Nm5NYTN5RTUrRTlTdHRJekthN1J3azJFbk1Rc2pCZUV4WCs1aFU0Q3BJd1Uy?=
 =?utf-8?B?L3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78bb1cc9-f059-422c-cd7d-08ddb944c13f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 08:45:10.9476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pYYPt4scAyFB1GpoY/UvyI0a4CKV8hke5achOTwjdwMIab5foK8C8I6SwGfF1Tn3iLjJq1KxSkNAXqGkmRXaMDKTo/30Xx1pRM4m/DKOhVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8482
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Currently in the drivers we have defined VRAM regions per device and per
tile. Initialization of these regions is done in two completely different
ways. To simplify the logic of the code and make it easier to add new
regions in the future, let's unify the way we initialize VRAM regions.

v2:
- fix doc comments in struct xe_vram_region
- remove unnecessary includes (Jani)
v3:
- move code from xe_vram_init_regions_managers to xe_tile_init_noalloc
  (Matthew)
- replace ioremap_wc to devm_ioremap_wc for mapping VRAM BAR
  (Matthew)
- Replace the tile id parameter with vram region in the xe_pf_begin
  function.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  13 ++-
 drivers/gpu/drm/xe/xe_query.c        |   3 +-
 drivers/gpu/drm/xe/xe_tile.c         |  37 +++----
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  16 ++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |   3 +-
 drivers/gpu/drm/xe/xe_vram.c         | 149 ++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_vram.h         |   2 +
 drivers/gpu/drm/xe/xe_vram_types.h   |   8 ++
 8 files changed, 134 insertions(+), 97 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 3522865c67c9..9cb50e0ed9f5 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -23,6 +23,7 @@
 #include "xe_svm.h"
 #include "xe_trace_bo.h"
 #include "xe_vm.h"
+#include "xe_vram_types.h"
 
 struct pagefault {
 	u64 page_addr;
@@ -74,7 +75,7 @@ static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
 }
 
 static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
-		       bool atomic, unsigned int id)
+		       bool atomic, struct xe_vram_region *vram)
 {
 	struct xe_bo *bo = xe_vma_bo(vma);
 	struct xe_vm *vm = xe_vma_vm(vma);
@@ -84,14 +85,16 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 	if (err)
 		return err;
 
-	if (atomic && IS_DGFX(vm->xe)) {
+	if (atomic && vram) {
+		xe_assert(vm->xe, IS_DGFX(vm->xe));
+
 		if (xe_vma_is_userptr(vma)) {
 			err = -EACCES;
 			return err;
 		}
 
 		/* Migrate to VRAM, move should invalidate the VMA first */
-		err = xe_bo_migrate(bo, XE_PL_VRAM0 + id);
+		err = xe_bo_migrate(bo, vram->placement);
 		if (err)
 			return err;
 	} else if (bo) {
@@ -138,7 +141,7 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
 	/* Lock VM and BOs dma-resv */
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
-		err = xe_pf_begin(&exec, vma, atomic, tile->id);
+		err = xe_pf_begin(&exec, vma, atomic, tile->mem.vram);
 		drm_exec_retry_on_contention(&exec);
 		if (xe_vm_validate_should_retry(&exec, err, &end))
 			err = -EAGAIN;
@@ -572,7 +575,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 	/* Lock VM and BOs dma-resv */
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
-		ret = xe_pf_begin(&exec, vma, true, tile->id);
+		ret = xe_pf_begin(&exec, vma, true, tile->mem.vram);
 		drm_exec_retry_on_contention(&exec);
 		if (ret)
 			break;
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index ba9b7482605c..f02987753779 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -27,6 +27,7 @@
 #include "xe_oa.h"
 #include "xe_pxp.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram_types.h"
 #include "xe_wa.h"
 
 static const u16 xe_to_user_engine_class[] = {
@@ -409,7 +410,7 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 			gt_list->gt_list[id].near_mem_regions = 0x1;
 		else
 			gt_list->gt_list[id].near_mem_regions =
-				BIT(gt_to_tile(gt)->id) << 1;
+				BIT(gt_to_tile(gt)->mem.vram->id) << 1;
 		gt_list->gt_list[id].far_mem_regions = xe->info.mem_region_mask ^
 			gt_list->gt_list[id].near_mem_regions;
 
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index bd2ff91a7d1c..68b84111f26b 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -7,6 +7,7 @@
 
 #include <drm/drm_managed.h>
 
+#include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
@@ -114,11 +115,9 @@ int xe_tile_alloc_vram(struct xe_tile *tile)
 	if (!IS_DGFX(xe))
 		return 0;
 
-	vram = drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
-	if (!vram)
-		return -ENOMEM;
-
-	vram->tile = tile;
+	vram = xe_vram_region_alloc(xe, tile->id, XE_PL_VRAM0 + tile->id);
+	if (IS_ERR(vram))
+		return PTR_ERR(vram);
 	tile->mem.vram = vram;
 
 	return 0;
@@ -156,21 +155,6 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
 }
 ALLOW_ERROR_INJECTION(xe_tile_init_early, ERRNO); /* See xe_pci_probe() */
 
-static int tile_ttm_mgr_init(struct xe_tile *tile)
-{
-	struct xe_device *xe = tile_to_xe(tile);
-	int err;
-
-	if (tile->mem.vram) {
-		err = xe_ttm_vram_mgr_init(tile, &tile->mem.vram->ttm);
-		if (err)
-			return err;
-		xe->info.mem_region_mask |= BIT(tile->id) << 1;
-	}
-
-	return 0;
-}
-
 /**
  * xe_tile_init_noalloc - Init tile up to the point where allocations can happen.
  * @tile: The tile to initialize.
@@ -188,17 +172,20 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
 int xe_tile_init_noalloc(struct xe_tile *tile)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	int err;
-
-	err = tile_ttm_mgr_init(tile);
-	if (err)
-		return err;
 
 	xe_wa_apply_tile_workarounds(tile);
 
 	if (xe->info.has_usm && IS_DGFX(xe))
 		xe_devm_add(tile, tile->mem.vram);
 
+	if (IS_DGFX(xe) && !ttm_resource_manager_used(&tile->mem.vram->ttm.manager)) {
+		int err = xe_ttm_vram_mgr_init(xe, tile->mem.vram);
+
+		if (err)
+			return err;
+		xe->info.mem_region_mask |= BIT(tile->mem.vram->id) << 1;
+	}
+
 	return xe_tile_sysfs_init(tile);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 8f9b8a1d2c05..9175b4a2214b 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -338,12 +338,18 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 	return drmm_add_action_or_reset(&xe->drm, ttm_vram_mgr_fini, mgr);
 }
 
-int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
+/**
+ * xe_ttm_vram_mgr_init - initialize TTM VRAM region
+ * @xe: pointer to Xe device
+ * @vram: pointer to xe_vram_region that contains the memory region attributes
+ *
+ * Initialize the Xe TTM for given @vram region using the given parameters.
+ *
+ * Returns 0 for success, negative error code otherwise.
+ */
+int xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_vram_region *vram)
 {
-	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_vram_region *vram = tile->mem.vram;
-
-	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
+	return __xe_ttm_vram_mgr_init(xe, &vram->ttm, vram->placement,
 				      xe_vram_region_usable_size(vram),
 				      xe_vram_region_io_size(vram),
 				      PAGE_SIZE);
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
index cc76050e376d..87b7fae5edba 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
@@ -11,11 +11,12 @@
 enum dma_data_direction;
 struct xe_device;
 struct xe_tile;
+struct xe_vram_region;
 
 int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 			   u32 mem_type, u64 size, u64 io_size,
 			   u64 default_page_size);
-int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr);
+int xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_vram_region *vram);
 int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 			      struct ttm_resource *res,
 			      u64 offset, u64 length,
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 35fd7f5d7cff..002059b2dbdb 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -19,6 +19,7 @@
 #include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_sriov.h"
+#include "xe_ttm_vram_mgr.h"
 #include "xe_vram.h"
 #include "xe_vram_types.h"
 
@@ -137,7 +138,7 @@ static bool resource_is_valid(struct pci_dev *pdev, int bar)
 	return true;
 }
 
-static int determine_lmem_bar_size(struct xe_device *xe)
+static int determine_lmem_bar_size(struct xe_device *xe, struct xe_vram_region *lmem_bar)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
@@ -148,17 +149,16 @@ static int determine_lmem_bar_size(struct xe_device *xe)
 
 	resize_vram_bar(xe);
 
-	xe->mem.vram->io_start = pci_resource_start(pdev, LMEM_BAR);
-	xe->mem.vram->io_size = pci_resource_len(pdev, LMEM_BAR);
-	if (!xe->mem.vram->io_size)
+	lmem_bar->io_start = pci_resource_start(pdev, LMEM_BAR);
+	lmem_bar->io_size = pci_resource_len(pdev, LMEM_BAR);
+	if (!lmem_bar->io_size)
 		return -EIO;
 
 	/* XXX: Need to change when xe link code is ready */
-	xe->mem.vram->dpa_base = 0;
+	lmem_bar->dpa_base = 0;
 
 	/* set up a map to the total memory area. */
-	xe->mem.vram->mapping = devm_ioremap_wc(&pdev->dev, xe->mem.vram->io_start,
-						xe->mem.vram->io_size);
+	lmem_bar->mapping = devm_ioremap_wc(&pdev->dev, lmem_bar->io_start, lmem_bar->io_size);
 
 	return 0;
 }
@@ -286,6 +286,65 @@ static void vram_fini(void *arg)
 		tile->mem.vram->mapping = NULL;
 }
 
+struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement)
+{
+	struct xe_vram_region *vram;
+	struct drm_device *drm = &xe->drm;
+
+	xe_assert(xe, id < xe->info.tile_count);
+
+	vram = drmm_kzalloc(drm, sizeof(*vram), GFP_KERNEL);
+	if (!vram)
+		return NULL;
+
+	vram->id = id;
+	vram->placement = placement;
+	vram->tile = &xe->tiles[id];
+
+	return vram;
+}
+
+static void print_vram_region_info(struct xe_device *xe, struct xe_vram_region *vram)
+{
+	struct drm_device *drm = &xe->drm;
+
+	if (vram->io_size < vram->usable_size)
+		drm_info(drm, "Small BAR device\n");
+
+	drm_info(drm,
+		 "VRAM[%u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
+		 vram->id, &vram->actual_physical_size, &vram->usable_size, &vram->io_size);
+	drm_info(drm, "VRAM[%u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
+		 vram->id, &vram->dpa_base, vram->dpa_base + (u64)vram->actual_physical_size,
+		 &vram->io_start, vram->io_start + (u64)vram->io_size);
+}
+
+static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
+			    struct xe_vram_region *lmem_bar, u64 offset, u64 usable_size,
+			    u64 region_size, resource_size_t remain_io_size)
+{
+	/* Check if VRAM region is already initialized */
+	if (vram->mapping)
+		return 0;
+
+	vram->actual_physical_size = region_size;
+	vram->io_start = lmem_bar->io_start + offset;
+	vram->io_size = min_t(u64, usable_size, remain_io_size);
+
+	if (!vram->io_size) {
+		drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
+		return -ENODEV;
+	}
+
+	vram->dpa_base = lmem_bar->dpa_base + offset;
+	vram->mapping = lmem_bar->mapping + offset;
+	vram->usable_size = usable_size;
+
+	print_vram_region_info(xe, vram);
+
+	return 0;
+}
+
 /**
  * xe_vram_probe() - Probe VRAM configuration
  * @xe: the &xe_device
@@ -297,82 +356,52 @@ static void vram_fini(void *arg)
 int xe_vram_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
-	resource_size_t io_size;
+	struct xe_vram_region lmem_bar;
+	resource_size_t remain_io_size;
 	u64 available_size = 0;
 	u64 total_size = 0;
-	u64 tile_offset;
-	u64 tile_size;
-	u64 vram_size;
 	int err;
 	u8 id;
 
 	if (!IS_DGFX(xe))
 		return 0;
 
-	/* Get the size of the root tile's vram for later accessibility comparison */
-	tile = xe_device_get_root_tile(xe);
-	err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
-	if (err)
-		return err;
-
-	err = determine_lmem_bar_size(xe);
+	err = determine_lmem_bar_size(xe, &lmem_bar);
 	if (err)
 		return err;
+	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &lmem_bar.io_start, &lmem_bar.io_size);
 
-	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
-		 &xe->mem.vram->io_size);
+	remain_io_size = lmem_bar.io_size;
 
-	io_size = xe->mem.vram->io_size;
-
-	/* tile specific ranges */
 	for_each_tile(tile, xe, id) {
-		err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
+		u64 region_size;
+		u64 usable_size;
+		u64 tile_offset;
+
+		err = tile_vram_size(tile, &usable_size, &region_size, &tile_offset);
 		if (err)
 			return err;
 
-		tile->mem.vram->actual_physical_size = tile_size;
-		tile->mem.vram->io_start = xe->mem.vram->io_start + tile_offset;
-		tile->mem.vram->io_size = min_t(u64, vram_size, io_size);
+		total_size += region_size;
+		available_size += usable_size;
 
-		if (!tile->mem.vram->io_size) {
-			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
-			return -ENODEV;
-		}
+		err = vram_region_init(xe, tile->mem.vram, &lmem_bar, tile_offset, usable_size,
+				       region_size, remain_io_size);
+		if (err)
+			return err;
 
-		tile->mem.vram->dpa_base = xe->mem.vram->dpa_base + tile_offset;
-		tile->mem.vram->usable_size = vram_size;
-		tile->mem.vram->mapping = xe->mem.vram->mapping + tile_offset;
-
-		if (tile->mem.vram->io_size < tile->mem.vram->usable_size)
-			drm_info(&xe->drm, "Small BAR device\n");
-		drm_info(&xe->drm,
-			 "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
-			 id, tile->id, &tile->mem.vram->actual_physical_size,
-			 &tile->mem.vram->usable_size, &tile->mem.vram->io_size);
-		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
-			 id, tile->id, &tile->mem.vram->dpa_base,
-			 tile->mem.vram->dpa_base + (u64)tile->mem.vram->actual_physical_size,
-			 &tile->mem.vram->io_start,
-			 tile->mem.vram->io_start + (u64)tile->mem.vram->io_size);
-
-		/* calculate total size using tile size to get the correct HW sizing */
-		total_size += tile_size;
-		available_size += vram_size;
-
-		if (total_size > xe->mem.vram->io_size) {
+		if (total_size > lmem_bar.io_size) {
 			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
-				 &total_size, &xe->mem.vram->io_size);
+				 &total_size, &lmem_bar.io_size);
 		}
 
-		io_size -= min_t(u64, tile_size, io_size);
+		remain_io_size -= min_t(u64, tile->mem.vram->actual_physical_size, remain_io_size);
 	}
 
-	xe->mem.vram->actual_physical_size = total_size;
-
-	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
-		 &xe->mem.vram->actual_physical_size);
-	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
-		 &available_size);
+	err = vram_region_init(xe, xe->mem.vram, &lmem_bar, 0, available_size, total_size,
+			       lmem_bar.io_size);
+	if (err)
+		return err;
 
 	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index d4bf1f9c2a72..72860f714fc6 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -13,6 +13,8 @@ struct xe_vram_region;
 
 int xe_vram_probe(struct xe_device *xe);
 
+struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement);
+
 resource_size_t xe_vram_region_io_start(const struct xe_vram_region *vram);
 resource_size_t xe_vram_region_io_size(const struct xe_vram_region *vram);
 resource_size_t xe_vram_region_dpa_base(const struct xe_vram_region *vram);
diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
index a01838236036..6f36bd93c953 100644
--- a/drivers/gpu/drm/xe/xe_vram_types.h
+++ b/drivers/gpu/drm/xe/xe_vram_types.h
@@ -23,6 +23,12 @@ struct xe_vram_region {
 	/** @tile: Back pointer to tile */
 	struct xe_tile *tile;
 	/** @io_start: IO start address of this VRAM instance */
+	/**
+	 * @id: VRAM region instance id
+	 *
+	 * The value should be unique for VRAM region.
+	 */
+	u8 id;
 	resource_size_t io_start;
 	/**
 	 * @io_size: IO size of this VRAM instance
@@ -54,6 +60,8 @@ struct xe_vram_region {
 	void __iomem *mapping;
 	/** @ttm: VRAM TTM manager */
 	struct xe_ttm_vram_mgr ttm;
+	/** @placement: TTM placement dedicated for this region */
+	u32 placement;
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
 	struct dev_pagemap pagemap;
-- 
2.34.1


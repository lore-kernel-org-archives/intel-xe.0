Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B840ED12669
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 18:36:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7268710E68A;
	Tue,  2 Dec 2025 18:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q4+XpKIC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3E410E68A
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 18:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764700583; x=1796236583;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=0/7JBId93qSFaaCd9EFuuZ5x3YujxBGu9JZ7ZH/ddKY=;
 b=Q4+XpKICJUpTGIAMO/5wt4XYucp9YmNYqdD4OXRA1jKfWBrvQwT8Ygz+
 hoCJkkrE7PHvls66Sm/RnvstXcATN9gsBUpUxTPok9KPSY40hThYwzjvW
 IvO1YxaJ3bLf+Vsjv4kek63EOgdijaYvkb2g8w6HvDIxuzs3BjU77VQC0
 VC2hYnmwEoOivBJRB+fexsd0EvAGQ1akBQfgo4iQE7aGLSFxR8VSXAaKS
 sXzQf/Sk1g9QTMy6d99iHzWic5RQMRdOzY0UyhVdbPsATeDsv0hvSTY43
 IrxTPZIV74eAqkFycpzQQh0ZmRMD5t3bjYdlSPoifV85loi40eOCtgHXt Q==;
X-CSE-ConnectionGUID: VdwA7ROETvmUXmJL4H2RdQ==
X-CSE-MsgGUID: ZCPCsbslTsqUU6XFyC8Qgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66755454"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66755454"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:36:22 -0800
X-CSE-ConnectionGUID: +7P5SlpPTpGGFm2QzYYsaA==
X-CSE-MsgGUID: rOkll0/zRnqprMMpH2Vxlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="231790802"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:36:23 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 10:36:21 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 10:36:21 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 10:36:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2nA1zjd/P7rvvM/4KEkRfCTU++z7qGdnHI1iU0D3/LYoF8S9olcQ3URpN4mDa2xT6GBgVSk1cbSvB81H6f/s+tuoN5HQO9oQZufPEJtqgSdm8PBvnYr8NXnAeI2CY1gUweaOslG7Mi+/uNOtMxB+ELKKCHcSdXcs/4psTz0dfQCgDdxK8xQfoiyL2h1mdNWnwbOcrGEJkceBRF/grq+hMIoUZhMZAjg2Vqx9ZFuRw3VIPLmqDVsNEPVT5R3w6xupBtB4jOkRbX4MRxg9ra+VfUcpO7VoSKADQM+gM0l8bW1pF/gArwIuwYf11ZjgPvdeSScjLjWH8d+1u8Z6aENVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/7JBId93qSFaaCd9EFuuZ5x3YujxBGu9JZ7ZH/ddKY=;
 b=l1HVoYkSl4nqy6hu/hB0qnoon2PB4KspyqHZxmtlTlgWZ78r6AqQh05KsH7LQrt7iEqiXRFDItCnXfz41yM9oDmeKZ6mm6oro7Mu9MZXpFaPm5BbX5F+4AluqTrrJK1IzUQ4CPhCHIBxlmhZfMOSETVNrADfPkV/32lkjqjvm7ZZz/JI44Tpcotjm4evS7C3ofKs/jUfZdX8nqtDHOh05WDuoXM2kDffUZUlMz81SC9xmEjVRNVVLgwZr4csTTjwPUypFKJY/qWxYAsPOT9N9iHvqgYaEYCRsyylmXhFnGSIXI4TnhlcfvCKcItKQ1hudj97kGDUbWVAYY/J0fWKuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH7PR11MB7145.namprd11.prod.outlook.com (2603:10b6:510:1ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 18:36:19 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 18:36:19 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Yadav, 
 Arvind" <arvind.yadav@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Mishra, Pallavi"
 <pallavi.mishra@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC v2 0/9] drm/xe/madvise: Add support for purgeable buffer
 objects
Thread-Topic: [RFC v2 0/9] drm/xe/madvise: Add support for purgeable buffer
 objects
Thread-Index: AQHcYobnp6xAzw1Sx0+580+HNdnQurUOr7WA
Date: Tue, 2 Dec 2025 18:36:18 +0000
Message-ID: <499329ff1aa2c3caeeb6bcc27bf47e83c84c247a.camel@intel.com>
References: <20251201055309.854074-1-arvind.yadav@intel.com>
In-Reply-To: <20251201055309.854074-1-arvind.yadav@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH7PR11MB7145:EE_
x-ms-office365-filtering-correlation-id: 30d11574-7851-4cd5-0a63-08de31d1af3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?SGVKYjQrRGJZb1QraVpsVEhGUmovd2JGbTV0UWs1V3B2bUxOTzI2REx5WmRX?=
 =?utf-8?B?cHc2d3ZpM1oxakR5WnFMNTQzYUpYd2RQeWZrVHZPcWRpOGZmYm42Zm1TeTNO?=
 =?utf-8?B?b2l1N0t0Vko1cCtoUzl3RThJWm9EVGFCdEpjank4S2xpbTRhc1AvREdyT1d4?=
 =?utf-8?B?SXpra0loZm9FM0JnbDNaSHRVSmJ1dnk5c3NOZXRvV2xuQ1M2Z0pDWTdmU1c3?=
 =?utf-8?B?QWdGRk9EcmhUNGY4MlVpeG84N1BKRHVnRVpaN1FJWVlkdWM0NHFjd2pRdENq?=
 =?utf-8?B?N3UyZ1hPdllVQTVNenZPbFd3YWwwT1FEYUs4ZlV5dGRUcEtlUjJURWw5cGNQ?=
 =?utf-8?B?OENYeHZFR3htVU1rMHFzRllsSVpkUDFRcyt1czZueFB0aGs1RWJ1L3pXZm1W?=
 =?utf-8?B?bjY2ditPVERBU2g5WnFyVzZvOSswOTJrdGVXTHkzcGFYemdYU2VoNjUyRVo2?=
 =?utf-8?B?Q3lQRXJKMmFsWTdhUmVXWGVJbGs2RGlKR2ZML2J1YzNlTDBKU0I2WWVXN0Rv?=
 =?utf-8?B?WWtOemFTVUlmcHBvems1c1R3YURIR3dSL0UxalgwQ3VnME1EbllmTDRzWlVO?=
 =?utf-8?B?RERIZUFuVmkwb2NVMWl1cEtXbHQ5c09JZXlLNHV0cjl5anRvWXV1RWc2azhX?=
 =?utf-8?B?dmxNZFNiRDZTeTZXeHVxNWt4RjVRMmRtNHRIWUxXdTBDZ1VkaS82V0JnYlJm?=
 =?utf-8?B?SG42WmUrQXJvekl3alBTaGxnUXN4WDd5UlVtdGF0WFRDUVQrcE9OWkNIUmVM?=
 =?utf-8?B?eC91T0RWemIra2duc3Zvc0Fva1NnREZ2ZXEwVVFOaERCeVRQYVZvU29BU0lN?=
 =?utf-8?B?SU5mekFIYlZ1TkVYV2p4T2NRUEdQMmlFclA5c0hULy9DVU5JWWhodDZyNDFQ?=
 =?utf-8?B?U09jRS9xc2dpT2k5MjljZ3NUWTlqWTNSK2RjR0hKdHBOVkFJSU5BSTdaVmFw?=
 =?utf-8?B?aW0rR0lZZTI2T1Z5SGFPU2tuQTlIbWJSY1ZkcFRSSWFnMWhuaGRiMzhTWGFw?=
 =?utf-8?B?aGI3KzBPREJHemFNaHRxQTNyYWhOVmVySk1UVHNYMkI0eEN2Yit4bDhtRnNq?=
 =?utf-8?B?dUU5bnlDNEQrd21kV3FvWDNxSElrRVpDeHc2cEhpSUhtNE5leE5wdkk2Q3Y3?=
 =?utf-8?B?cnBrYUFrc2VNSmo1MUV6VWNTaFVMSndyaWxDUWtHUmpsd0hIdXBXNHoyaUVw?=
 =?utf-8?B?WlVPdHUxbllLYWFVRVlVWlZySEdhdmRPcDMwYW9LY0w4SE5TM213alEyckV4?=
 =?utf-8?B?VkxidkE1YWZqVGdOMXFxZXZzcHovMUl0ejFCeWhPRitLVEJQQlVGbTByRW5z?=
 =?utf-8?B?MmU3bzB0VE1YM1NNVnZCcE1HdHhQa0xWOTE2aHF0dHNmZGlaTTc1MXRFM3F5?=
 =?utf-8?B?RnBTL2lud1htQnpxMDlRL2RsajNaQVd0UWNpMUNqRzFlQVRRVGtZTmZ1bjVK?=
 =?utf-8?B?NGVkL2V1T2NwSVZuTVcxZDZFWWNDcjM5STZ1bmpiNFAxZnlYVVpYTC9XMVVo?=
 =?utf-8?B?RmpON1BRQVYwVlBmd0xpT1ZHNUVpU0htckdCaEMzZUl1TTdvOFJWVmFXaG51?=
 =?utf-8?B?SFBFcHhSTnJZZHFHM0h3eGtuNnNWOUVYNXNVamx5dTNLYURiaHIwckN2VGdt?=
 =?utf-8?B?eWVzdEZLY2w0WENKUkp1L3cvTDhwVnZBaHZGWlNLSklCSkZZZ1RjZWd0YllH?=
 =?utf-8?B?aWIvRHQ1ZFlvN1BVRHNiYlg1dWt0d3VSS1dWS2dTMVVJemdpaE1zNjZXMmNX?=
 =?utf-8?B?OHA4MlpBcnhHaEd6aEJQWVNGUHhFS3ZpMytZTldxUDd1VDZBeDZzd0xjenZ2?=
 =?utf-8?B?OWIyR0RmSmZwWm9GUXpDSlo4Z3V6aUx2eVNlSG8rdGVTanp6bHlZdUVPU1h5?=
 =?utf-8?B?ekRJbEYvRDlhekVvMmZWSk9WeVd2cHdqbGNPL3IxaVQyT2QwdTJzRWFISTBs?=
 =?utf-8?B?dHRCODFFYXlMaFkxdVJUZEkzdncrUmp3OFpjdDFJT05kcHdIdFhwWC9yY0xN?=
 =?utf-8?B?NTVhRzc3OWlST0hIQzdHWVNkOUM4akQrTkM0YzRjUnAvYldHOEtQdk9Ielkz?=
 =?utf-8?Q?aBmdze?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUJIdENXVStBc2xWQWM0ZzNNTzNuU2MwU1ZBejBCYXRSMlNLdGNOWXp6TTNv?=
 =?utf-8?B?dDFuVExzTEVGZW1wRnFZcFo5MEZtblVacllXMUtYQWZaVmhVVEVOd1BLYnZN?=
 =?utf-8?B?SEJCd3AxL0JFVFFnSlBQN0hURzhqU2VrclYyQ0c4dXRyN0JyRXM0enpLMFV0?=
 =?utf-8?B?RkNVenFnWUxOckQrSjIvekNMN2dWeERiZWVFWFM5MWFWQlg3L0EybndBTUNO?=
 =?utf-8?B?dzF1N2orYnNGVEpKSjR6L1Zsa1lXSHRnM1FyZ282b2NYZC9VUWJERmFyVXV5?=
 =?utf-8?B?VlVCNzl4T1pkWGtXMFBNVkpVeW1MWWlYbFUrUk5GMHZPaDZyOG5hY1FiTloz?=
 =?utf-8?B?cXZLQUFXQU9Ya2JBcW5heXpQVVVjNk40bkdteHdTWlVBSDd0T1ZWZmZuMGdN?=
 =?utf-8?B?VnFmOXFURjgxam1CUnZ6eXA0M3g0WmVieEZIMHhSVHpKRDVVNml6TkN1Y29r?=
 =?utf-8?B?aFhCMnU4OTd3Z1c0SVB4R1JkanlndmhZeFNhbVpKVjMza3BSb1Q1eTBiM09q?=
 =?utf-8?B?YVdVbTI5YUFGWDVhaFE0bHpxblAvZlNENGtqRjlORkZDdWhqY21lY3dkbU92?=
 =?utf-8?B?RFVwMWhPa1UzSWU4TDlDL0FtUk5GQjJmcXVoSWd3ZzB4SFU1VGx4K1hIMldo?=
 =?utf-8?B?OFJEVlpENWg0RmhCZHg2UlpxSDRDT05vZWtLU1pjZEJNQlZHcUo3VEtiSXlC?=
 =?utf-8?B?eE5LcDRLV2lxeXJVd1l3b2R3ZGNPdlovSnpJaGN2N2I0VGZac3RsYWt1NVdl?=
 =?utf-8?B?MkJpeGFISU1jUWdxVXJST0xPMm5XZnVMQzV6VEE4bHNvZWZlNHozcDFLZC9a?=
 =?utf-8?B?elROcGZLZzhGTktqU2R1QkE4UlNna082L2JCcWRBbXdmRWlhWEZsZURRZDFK?=
 =?utf-8?B?ZEhhUEhOb2lEbEk1U0dFN2ErUGhkcEdibGpOUDRGU05rQW4ycFlBSDhhWVFY?=
 =?utf-8?B?L1cyQ2tmYzdMeSt6eTJJaHZiWUhMNm5IcENMVy96UDJaMlRLQVV1akY0MmJY?=
 =?utf-8?B?a0w4QUVvRVA4eGo4TGc3OEhzVFFJd293NUJNOXErMVIxNG1udFcrQnpHT2Rn?=
 =?utf-8?B?d3JBQ0pkdzAvTW5Bem9Hbkw0Nk9OMFZJcjNOQUszVk4wWGlWRzZNQTRxWVI0?=
 =?utf-8?B?ZHAyTjZKa3JLZXpKY1Nvcm5FTXBaUUxlWHZpOXhOYlZVRjVMd0NxSjJDOFJH?=
 =?utf-8?B?YStRdHpGMkdDbkRaVVJjQWFxVC9iWWMzWlZKSnBGMVZyVjd2VmJhN1JrdWZm?=
 =?utf-8?B?MUhib0U4cDdJM1RRZVpoeTlkQkNaVkxhK0syai9tYiszeXI4dUV0M09PdGJp?=
 =?utf-8?B?VnN5alJsMnNUblZDRjM4REZDQ09qMkVoeUFFRXppb3RvbkFFb2w4dFB5RlQ1?=
 =?utf-8?B?R2xpNkVhUkVPeTd1dnl2UVZVWXVRS2xFd2l6RHZiYzJkdktTZDJvZkxocytN?=
 =?utf-8?B?cWNUOVREbnYyL1BLNkNYQXdIYkg0UnQ2b09rczV6M1JMR2s0Znl3MTVSV2lS?=
 =?utf-8?B?Umg5eVJGeEs2SGRhUFhRVFZ1RzBUQlg5RnFDcHZFZEc4Z2FGNjQrVjRFNkZt?=
 =?utf-8?B?TG8zcTdMMnVSbXg1RHVZWklQUmo0Nkt3UE9Ra3g2NnNYSzVGeENCbkJsYUZs?=
 =?utf-8?B?T28rNlBxQUxDeFFrZ0VwRE45Y0NtYTR3ZXFMYTFyYWwvSEtGMDdKWEVTS05M?=
 =?utf-8?B?U3pOUkRvZlgvLzFPV0pXUDFjNTFyeDFXUk1vd0ZsSU0xb1liWEVSWUhTNmtr?=
 =?utf-8?B?WEhRaHZKaTlZYU1ZTU9DTXlBbW00U0hyV1B2a1pXSHRjZjFaT01mMm8wVVZx?=
 =?utf-8?B?dG1VTFVJRjAzTFdqa08zdXVnS3JmYjR2Ymw1RWFISUxWOStDempkWGhER1pp?=
 =?utf-8?B?SHpSNngrRmdOdThKVE9wREJQc1FDQ2NEdXY0cUxIa1A0TktkTXlFTDJ6eHBh?=
 =?utf-8?B?ZjVLOWpibThUdG5DWjdDQ0hnSXlvVFFSVVB6ZVgwLzZFNUxHbzllbEszcldF?=
 =?utf-8?B?eVJybGVTOWsyT0lhSVJad2ZVejByQ0tqaUJobDFUbmhIb3VZellkNFpHamJS?=
 =?utf-8?B?NURpTWwxeHVVOGN3bnVrcXNnY21Cd2ZIeDV5dnJDWXFXU240Qmt3ZW45djdo?=
 =?utf-8?Q?geAj3S8sTIUEOzU8J/KIlmw79?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B9699B727EC03E4083D94A98EFC97D41@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30d11574-7851-4cd5-0a63-08de31d1af3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 18:36:18.9962 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EGJqgYpzw3MiG0bPdjKImCKRBlzCuPA0Jr9vDXB9e37TXtP2RekOLN79khAr+SnPAoN8SXkRH7LYEaH+G7ouCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7145
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

T24gTW9uLCAyMDI1LTEyLTAxIGF0IDExOjIwICswNTMwLCBBcnZpbmQgWWFkYXYgd3JvdGU6DQo+
IFRoaXMgcGF0Y2ggc2VyaWVzIGludHJvZHVjZXMgY29tcHJlaGVuc2l2ZSBzdXBwb3J0IGZvciBw
dXJnZWFibGUNCj4gYnVmZmVyIG9iamVjdHMNCj4gaW4gdGhlIFhlIGRyaXZlciwgZW5hYmxpbmcg
dXNlcnNwYWNlIHRvIHByb3ZpZGUgbWVtb3J5IHVzYWdlIGhpbnRzDQo+IGZvciBiZXR0ZXINCj4g
bWVtb3J5IG1hbmFnZW1lbnQgdW5kZXIgc3lzdGVtIHByZXNzdXJlLg0KPiANCj4gT3ZlcnZpZXc6
DQo+IA0KPiBQdXJnZWFibGUgbWVtb3J5IGFsbG93cyBhcHBsaWNhdGlvbnMgdG8gbWFyayBidWZm
ZXIgb2JqZWN0cyBhcyAibm90DQo+IGN1cnJlbnRseQ0KPiBuZWVkZWQiIChET05UTkVFRCksIG1h
a2luZyB0aGVtIGVsaWdpYmxlIGZvciBrZXJuZWwgcmVjbGFtYXRpb24NCj4gZHVyaW5nIG1lbW9y
eQ0KPiBwcmVzc3VyZS4gVGhpcyBoZWxwcyBwcmV2ZW50IE9PTSBjb25kaXRpb25zIGFuZCBlbmFi
bGVzIG1vcmUNCj4gZWZmaWNpZW50IEdQVQ0KPiBtZW1vcnkgdXRpbGl6YXRpb24gZm9yIHdvcmts
b2FkcyB3aXRoIHRlbXBvcmFyeSBvciByZWdlbmVyYXRhYmxlIGRhdGENCj4gKGNhY2hlcywNCj4g
aW50ZXJtZWRpYXRlIHJlc3VsdHMsIGRlY29kZWQgZnJhbWVzLCBldGMuKS4NCj4gDQo+IFB1cmdl
YWJsZSBCTyBMaWZlY3ljbGU6DQo+IDEuIFdJTExORUVEIChkZWZhdWx0KTogQk8gYWN0aXZlbHkg
bmVlZGVkLCBrZXJuZWwgcHJlc2VydmVzIGJhY2tpbmcNCj4gc3RvcmUNCj4gMi4gRE9OVE5FRUQg
KHVzZXIgaGludCk6IEJPIGNvbnRlbnRzIGRpc2NhcmRhYmxlLCBlbGlnaWJsZSBmb3INCj4gcHVy
Z2luZw0KPiAzLiBQVVJHRUQgKGtlcm5lbCBhY3Rpb24pOiBCYWNraW5nIHN0b3JlIHJlY2xhaW1l
ZCBkdXJpbmcgbWVtb3J5DQo+IHByZXNzdXJlDQo+IA0KPiBLZXkgRGVzaWduIFByaW5jaXBsZXM6
DQo+IMKgIC0gaTkxNSBjb21wYXRpYmlsaXR5OiAiT25jZSBwdXJnZWQsIGFsd2F5cyBwdXJnZWQi
IHNlbWFudGljcyAtDQo+IHB1cmdlZCBCT3MNCj4gwqDCoMKgwqAgcmVtYWluIHBlcm1hbmVudGx5
IGludmFsaWQgYW5kIG11c3QgYmUgZGVzdHJveWVkL3JlY3JlYXRlZA0KPiDCoCAtIFNhZmV0eSBm
aXJzdDogT25seSBub24tc2hhcmVkIEJPcyBjYW4gYmUgbWFya2VkIERPTlRORUVEIHRvDQo+IHBy
ZXZlbnQNCj4gwqDCoMKgIG11bHRpLXByb2Nlc3MgZGF0YSBjb3JydXB0aW9uDQo+IMKgIC0gTXVs
dGlwbGUgcHJvdGVjdGlvbiBsYXllcnM6IFZhbGlkYXRpb24gaW4gbWFkdmlzZSwgVk0gYmluZCwg
bW1hcCwNCj4gYW5kDQo+IMKgwqDCoCBmYXVsdCBoYW5kbGVycw0KPiDCoCAtIEFzeW5jIFRMQiBp
bnZhbGlkYXRpb246IFVzZXMgeGVfYm9fdHJpZ2dlcl9yZWJpbmQoKSBmb3Igbm9uLQ0KPiBibG9j
a2luZw0KPiDCoMKgwqAgR1BVIG1hcHBpbmcgaW52YWxpZGF0aW9uDQo+IMKgIC0gU2NyYXRjaCBQ
VEUgc3VwcG9ydDogRmF1bHQtbW9kZSBWTXMgdXNlIHNjcmF0Y2ggcGFnZXMgZm9yIHNhZmUNCj4g
emVybyByZWFkcw0KPiDCoMKgwqAgb24gcHVyZ2VkIEJPIGFjY2Vzcw0KPiANCj4gRXJyb3IgSGFu
ZGxpbmc6DQo+IMKgIC0gQ1BVIGFjY2VzcyAobW1hcCk6IFJldHVybnMgVk1fRkFVTFRfU0lHQlVT
IChTSUdCVVMgc2lnbmFsIHRvDQo+IHByb2Nlc3MpDQo+IMKgIC0gR1BVIGFjY2VzcyAobm9uLXNj
cmF0Y2ggVk0pOiBQYWdlIGZhdWx0IGZhaWxzIHdpdGggLUVBQ0NFUywgR1BVDQo+IGNvbnRleHQg
cmVzZXQNCj4gwqAgLSBHUFUgYWNjZXNzIChzY3JhdGNoIFZNKTogUGFnZSBmYXVsdCBzdWNjZWVk
cywgcmViaW5kcyB3aXRoDQo+IHNjcmF0Y2ggUFRFcw0KPiDCoCAtIFZNX0JJTkQgb3BlcmF0aW9u
czogTUFQL1BSRUZFVENIIHJlamVjdGVkIHdpdGggLUVJTlZBTA0KPiDCoCAtIE1tYXAgb2Zmc2V0
IGlvY3RsOiBSZWplY3RlZCB3aXRoIC1FSU5WQUwgZm9yIGVhcmx5IGVycm9yDQo+IGRldGVjdGlv
bg0KDQp1QVBJIGFuZCBvdmVyYWwgdGhpcyBsZ3RtLCBwbGVhc2UgbGV0IG1lIGtub3cgd2hlbiB5
b3UgdGhpbmsgdGhpcyBpcw0KcmVhZHkgdG8gYmUgaW1wbGVtZW50ZWQgb24gTWVzYSBzaWRlLg0K
DQo+IA0KPiB2MiBDaGFuZ2VzOg0KPiDCoCAtIFJlb3JkZXJlZCBwYXRjaGVzOiBNb3ZlZCBzaGFy
ZWQgQk8gaGVscGVyIGJlZm9yZSBtYWluDQo+IGltcGxlbWVudGF0aW9uIGZvcg0KPiDCoMKgwqAg
cHJvcGVyIGRlcGVuZGVuY3kgb3JkZXINCj4gwqAgLSBGaXhlZCByZWZlcmVuY2UgY291bnRpbmcg
aW4gbW1hcCBvZmZzZXQgdmFsaWRhdGlvbiAodXNlDQo+IGRybV9nZW1fb2JqZWN0X3B1dCkNCj4g
wqAgLSBSZW1vdmVkIGluY29ycmVjdCBjbGFpbXMgYWJvdXQgbWFkdmlzZShXSUxMTkVFRCkgcmVz
dG9yaW5nIHB1cmdlZA0KPiBCT3MNCj4gwqAgLSBGaXhlZCBlcnJvciBjb2RlIGRvY3VtZW50YXRp
b24gaW5jb25zaXN0ZW5jaWVzDQo+IMKgIC0gSW5pdGlhbGl6ZSBwdXJnZV9zdGF0ZV92YWwgZmll
bGRzIHRvIHByZXZlbnQga2VybmVsIG1lbW9yeSBsZWFrcw0KPiDCoCAtIFVzZSB4ZV9ib190cmln
Z2VyX3JlYmluZCgpIGZvciBhc3luYyBUTEIgaW52YWxpZGF0aW9uIChUaG9tYXMNCj4gSGVsbHN0
csO2bSkNCj4gwqAgLSBBZGQgTlVMTCByZWJpbmQgd2l0aCBzY3JhdGNoIFBURXMgZm9yIGZhdWx0
IG1vZGUgKFRob21hcw0KPiBIZWxsc3Ryw7ZtKQ0KPiDCoCAtIEltcGxlbWVudCBpOTE1LWNvbXBh
dGlibGUgcmV0YWluZWQgZmllbGQgbG9naWMgKFRob21hcyBIZWxsc3Ryw7ZtKQ0KPiDCoCAtIFNr
aXAgQk8gdmFsaWRhdGlvbiBmb3IgcHVyZ2VkIEJPcyBpbiBwYWdlIGZhdWx0IGhhbmRsZXIgKGNy
YXNoDQo+IGZpeCkNCj4gwqAgLSBBZGQgc2NyYXRjaCBWTSBjaGVjayBpbiBwYWdlIGZhdWx0IHBh
dGggKG5vbi1zY3JhdGNoIFZNcyBmYWlsDQo+IGZhdWx0KSANCj4gwqANCj4gDQo+IEFydmluZCBZ
YWRhdiAoNyk6DQo+IMKgIGRybS94ZS9ibzogQWRkIHB1cmdlYWJsZSBibyBzdGF0ZSB0cmFja2lu
ZyBhbmQgZmllbGQgbWFkdiB0byB4ZV9ibw0KPiDCoCBkcm0veGUvYm86IFByZXZlbnQgcHVyZ2lu
ZyBvZiBzaGFyZWQgYnVmZmVyIG9iamVjdHMNCj4gwqAgZHJtL3hlL21hZHZpc2U6IEltcGxlbWVu
dCBwdXJnZWFibGUgYnVmZmVyIG9iamVjdCBzdXBwb3J0DQo+IMKgIGRybS94ZS9ibzogSGFuZGxl
IENQVSBmYXVsdHMgb24gcHVyZ2VkIGJ1ZmZlciBvYmplY3RzDQo+IMKgIGRybS94ZS9ibzogUHJl
dmVudCBtbWFwIG9mIHB1cmdlZCBidWZmZXIgb2JqZWN0cw0KPiDCoCBkcm0veGUvdm06IFByZXZl
bnQgYmluZGluZyBvZiBwdXJnZWQgYnVmZmVyIG9iamVjdHMNCj4gwqAgZHJtL3hlOiBBZGQgc3Vw
cG9ydCBmb3IgcXVlcnlpbmcgcHVyZ2VhYmxlIEJPIHN0YXRlcw0KPiANCj4gSGltYWwgUHJhc2Fk
IEdoaW1pcmF5ICgyKToNCj4gwqAgZHJtL3hlL3VhcGk6IEFkZCBVQVBJIHN1cHBvcnQgZm9yIHB1
cmdlYWJsZSBidWZmZXIgb2JqZWN0cw0KPiDCoCBkcm0veGUvdWFwaTogQWRkIFVBUEkgZm9yIHB1
cmdlYWJsZSBibyBzdGF0ZSB0byBtYWR2aXNlIHF1ZXJ5DQo+IHJlc3BvbnNlDQo+IA0KPiDCoGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA5MiArKysrKysr
KysrKysrKysrKysrKysrKystLQ0KPiAtLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5o
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA1NyArKysrKysrKysrKysrKysrKw0KPiDCoGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ib190eXBlcy5owqDCoMKgwqAgfMKgIDMgKw0KPiDCoGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndF9wYWdlZmF1bHQuYyB8IDE5ICsrKysrKw0KPiDCoGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9wdC5jwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMyArKystDQo+IMKgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3ZtLmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEyICsrKysNCj4gwqBkcml2
ZXJzL2dwdS9kcm0veGUveGVfdm1fbWFkdmlzZS5jwqDCoCB8IDc2ICsrKysrKysrKysrKysrKysr
KysrKysrDQo+IMKgaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfCA1MCArKysrKysrKysrKysrKy0NCj4gwqA4IGZpbGVzIGNoYW5nZWQsIDMwOCBpbnNlcnRp
b25zKCspLCAxNCBkZWxldGlvbnMoLSkNCg==

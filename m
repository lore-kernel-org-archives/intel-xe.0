Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6C1C021A4
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 17:24:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A434F10EB56;
	Thu, 13 Feb 2025 17:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DkdmB5Lp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1414510EB56
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 17:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739467457; x=1771003457;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Rd5bLodHPOI+nGERcrkSHeampwo6yhK5dTn8G3Vl3Oc=;
 b=DkdmB5LpZ9MJkPI4b33jjHgWp8vZlz0W+XrVsIEk1sDanCYWpf6qKfZa
 35uee3iMLFoZzno0mTCGitC7lqZ1YSAB9eymEJ16i3Vg2Awl8qspQrSEK
 cI8EWGYkViRwm/Y26WkrTnzKHOY1NJ5HgS6z8URqRcpmVgJCtQC2UNeSD
 2iiWG9BXLDYuB8ItCROksmHpKH9BtXuRzFxx/ckU54aJhXQhqN1sIQFsX
 xIrHFfAR1RkCMcnVWZzOgBp+SDsGaeiyNsA1WdtIPy9/50D6ROHcLJLj8
 LAnj08bmHGnw374bnw0+NtGWbgcwwWAxT0/AJRv1hH0EFjUednHEO0ePK Q==;
X-CSE-ConnectionGUID: XuC5f6o2S6WcP0nQgXdt2g==
X-CSE-MsgGUID: 6ncn9xcqQaaDzOi8ckIUBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="65538064"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="65538064"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 09:24:14 -0800
X-CSE-ConnectionGUID: H7dU5pE0Som8PIclShY74A==
X-CSE-MsgGUID: yjxC5fMqQ8yil9Okr/RWQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="136434347"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 09:24:13 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 13 Feb 2025 09:24:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 09:24:12 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 09:24:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PvfhEJTATmDMfZcoBmhwge8NoCScouevGY58PKrTq9OlFMvg7dPWWZGUXrPPFuQ+1IH1aJtP9EHBdLrg/I1kSNE7dfUxac0YqflJIVMc40rstsD0+gppeFqDZrLXf1cDRXx1kRhHvGnZXlppkw92nSQ4ARIaBXl9oho/L7t8tF2nj9PUXexygKazwd9LUsZ2WEIm1j7YnGVNsjpTc8bUnQcRbkZ4kU2DaQqnaPhTqjqUXcvJ0RfGGdfVz9+KZAZySbJNMjrjHZ7zfoYKsd9EBAwpp5PqRR4GnjkVAwP0truwm148pqQ9qdlnEG9FZI2ZgC/Ea38qje+DZ9fK0j+6ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OqQALxagd5fU7hLYSGROd6qQwhXMse3LLIEziBNYJDM=;
 b=PrNpAKiuvO6RDaQNAeV+8K077aYINbVdqCVPXg58rBkk3RbNxaSSH3BfW3wq6iuinTzFSvmShXcHuj3TwNwFf0wCFXn1TCyHXv+KPpnj+S88msQconvYS+e84s2sHQeG0cyr8fLhVMtlVoRdSFhKdxW8C9htfTmP2VFoJFHtWsOHml8SM3NV7FWaS7vdB0qJrhcHcEFOnN78WCNzOwrhqig/DJs2OlPRjjWhRKTJ5CwkX7zdxWR6Xkw/v9odtop2TzWLczlW/PDXEYKFLAhnd+/5/i+mXizI2h8va8ewnFE1qkjgOnhzPGIcMXElNaPh6Zu0Epf3vebXgyupaEJMIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SA1PR11MB8256.namprd11.prod.outlook.com (2603:10b6:806:253::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.15; Thu, 13 Feb
 2025 17:23:29 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.8445.008; Thu, 13 Feb 2025
 17:23:29 +0000
Message-ID: <1cf17877-18ae-4cd0-8be5-9a5abd46c58d@intel.com>
Date: Thu, 13 Feb 2025 09:23:26 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pxp: Don't kill queues while holding the spinlock
To: Dan Carpenter <dan.carpenter@linaro.org>, Matthew Brost
 <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison <John.C.Harrison@intel.com>
References: <20250213004032.2059861-1-daniele.ceraolospurio@intel.com>
 <Z61KX8koy/aFnvOy@lstrano-desk.jf.intel.com>
 <aff30f31-6f1c-4086-b059-d8c1246bfdb2@stanley.mountain>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <aff30f31-6f1c-4086-b059-d8c1246bfdb2@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0242.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::7) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SA1PR11MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: c4f96f01-0b92-4805-8f6e-08dd4c5321af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1NHbkU1WEgyK1BCOG02NzY2UlVZSWhqL0hRelZBN3NBNEhvbFJYU1dqcDB4?=
 =?utf-8?B?WENLbWFmS3QzU3dhMWlFSVZ0Z3dGeGNCaEp2STZwampucG8rS090MVNXOVB2?=
 =?utf-8?B?eitwemJ2N3gxNDZXV2FNZDV1N2l2b0p6WFNiYXgrcVV2UWl5aE85WU4xa0dF?=
 =?utf-8?B?ek1vTGdzNGJXZWtNcHAra20rSXdnaDNvS0ZkdHNtaVNpbm82V1ptajN2cFFr?=
 =?utf-8?B?K3dwTE5VVnUxQVhRWnBXTFFlQjhYUTRUTmhBZlI0NGJzK1J4dldGSFBac2V4?=
 =?utf-8?B?Q3JTUXFSVkZiMUJ2ZUhrSHB3TVJ2T0pXQ2hzNG9aNC9wL1Buc09NU1lyS3dY?=
 =?utf-8?B?Q0p4eW1oOUR3a1IxQzUvNWFNc3FTOE5RSUwvZTVyOVhQa3F5VHlRNnBFV04r?=
 =?utf-8?B?VkpXZHpXL1dDamtLbXFxRzYwZldWelRYV0hkSHpCYnUwTVh4UlBNOHdja2o2?=
 =?utf-8?B?eEVtakNoTG01Vm1ydzhWdTZIMWRKQjFaUDRJUXU5ZFc4Q2gza0VYZjZnNzhZ?=
 =?utf-8?B?V25DR045dXpvdDExalpsNVlxQ1JxeUR1SE4wWlFMdm5hOE9ZZE5pMGlvUFdo?=
 =?utf-8?B?ZkJIRmdwcC9XM3RzaTcwN0tiUUp0U2RjdU1pK1ROQjdtdDRNay9EVjZtenFw?=
 =?utf-8?B?dWRtcDJFNTlBSkEwdXZpWVlQV2lSVlJrQW94T1B1eVhBUG9ocVBxZnpIWE9v?=
 =?utf-8?B?UVpwcWdnd1VVSGUzZ1Y4UDBXS3h2dmg2dUVxTURycDd6OWxxcldpMlZ2ZlhD?=
 =?utf-8?B?eHppdm9YcHoyaHlhUVJoUkxYRW03aG44QWMvd1VNWThtdDk3UXg5RnBqdzJT?=
 =?utf-8?B?R1Y2ajB2M3J0RHoxTlFaN1ZReHFuMXBZeTh2UW5DeXNLUWxKay9senhqSy91?=
 =?utf-8?B?cnVOd3lvYjk4NUdLeFpZcWdEREhRM2xNb05VN3VZT3Nxd0ljVDFVN1g5L3la?=
 =?utf-8?B?NysxWCtyMWwxTzJvbW42ZzR3Q2RVK0J6OURjVlQ5L1d0dVNwakZCUUh3RDlh?=
 =?utf-8?B?VitXalFWREc1NE5HWU5VVjFhc0JTZGg0Sll2RStIMExPcFlHTE1qUnVEdDhy?=
 =?utf-8?B?bXoyTU1odVd4eTVTeXhmTDlMVlYreXhFeDM1MjBLbnF5Q1MxYUlYUkJWSzVq?=
 =?utf-8?B?YTZROExWUUFRazlVZElnMjRESXlnT0NKeGJCeVl5R0U4TG1mS0k1UHlyQkxz?=
 =?utf-8?B?RWZhTFVMdE42ME95UVg5cCtaRndMKzZHQkZlZzh1MVA0K0Q0ckwvSmNFdmlS?=
 =?utf-8?B?cDY0YjB5d2tJZDE1UFdRWC84MmczSlQrZEdNL3pYdkNjYzduaHVIWTFxbkNC?=
 =?utf-8?B?OVNxVkJKWVpBTXVXT09Zc3M1REMyQXEzRk04TzkzOFY3YlAvREhxeXFDWkdB?=
 =?utf-8?B?ZEJXUm8xekhlbVpLSDc5ZFJkNG8valF0eFNGWk01N3V6eTJrRkJUaTdlUWtq?=
 =?utf-8?B?WEozMEdBWGVYLzBkRG5SdENGQ1Zza0thcG1ZM0lpc2NHZm1HR0c2dElUNFVr?=
 =?utf-8?B?YzRzYXlOTENZb2NPUTdVMnI4Mk5uSEpZNFNINWIrdXZTb2dnSERQUHFCVjhl?=
 =?utf-8?B?ZUlLV0NET052TklWYjlRWUxEQW1wMHZJYVdhS1pPM1kvUU1QVnFwcHpZQzQ1?=
 =?utf-8?B?azhaY1dXZ09JbXd0L0hrZEdxNGt2ZWVjdjNTajYzdjlreXY0N0pobzVYSW1y?=
 =?utf-8?B?cm9MSDhmdmtvYlhVMnhaVlUyRzMvNkZLbk1RTE02b0dOT0FzU3BEbmJXT1Z2?=
 =?utf-8?B?RzlZZXh3SThlcnU1VDdWekRFT3NJY1RNTS9ybTlPWWVNOGxnaERDTnlFWno1?=
 =?utf-8?B?N3BFMmEvd1RKa0FhU3J5TjgzSk03OVBUampJcnVmak4rRzRrNnZaV00rQ1Y2?=
 =?utf-8?Q?gESiYCnaxLH2I?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0FJbjJPOHJNYVN0bjV1bVEzUktvRGJoZVhpVVFGRzg5L2xvVGNFRy9CQ3g5?=
 =?utf-8?B?Tld1aU5qYllHbmQvVEcrSGcvYjhiQ1FNOUtRUGt5bXJNWUJZR2oxZVpydGND?=
 =?utf-8?B?ZXJMbVNuMXZMcHh6eE52czlvUis0Rzloc25qM3lPVzRwVDkwR29kWDBUYWFs?=
 =?utf-8?B?WVBxV2NrWkkrdit1Y2dQcG1SdDR0Q3VFajAzbUhjcFBrM2tPV2E1Vkd2SDZB?=
 =?utf-8?B?NmJHU3VVUG1lQjJqSkFUeTlTdWdHQWxmVUd2OW5PU2k0d1Q1Mk91QnU5a29h?=
 =?utf-8?B?WHdrUXV6QkZGamRTb1BnY2p5TVZVU2dIVHAxUTI5ZUdJTUVkc09LTENLM250?=
 =?utf-8?B?Q3A2LzF3SzdIVTBuRFowTnVUbXB3YS9KN2NRYm1jNU80UTdwSGZzM0VuWFA0?=
 =?utf-8?B?SVRqdlpYSjJ6ek5ybFhaTlg5ZVJKMkNTQzZCMmNwZUx3WVVybFNtdHovSWZX?=
 =?utf-8?B?ejAyWXlCaWMrTzhkQjg3UlhPVjI5MzVvWmFOREtiK2Y5UTNIam9IbmhqbUda?=
 =?utf-8?B?a3pvUHYwSDZNNEtROXFzZmV2WVprNXUvWUdyOW91cmNaZWFTcWZvOU5wbHJT?=
 =?utf-8?B?Ty81Vlh5NklySnpwQkdPRnM0d1dnQlNNRnl5WU8ybjhLYWEvL1IzaHhtSkcr?=
 =?utf-8?B?TmJIQVNoRCt1ZXd3QmNFM0lXMUN1Q3FjdkJkQUtoKzMrelViOGFCd2szTkhx?=
 =?utf-8?B?Y1RqdHNjL21seUJqeEJwdHpGZnRhZUR1QjZqYnh0T1VJMENuUmxSRWptS3gz?=
 =?utf-8?B?anVIbldmM2FuOUZzcmVVYUxTeVF0eXdsc1gzcHUxTEU5Zjh4RnVuajBQVmZv?=
 =?utf-8?B?ZisveGRLYlFGdVRsZmllS1JKR1hSakxMQmpwK25xTUlHN1lEVjdpc2ZSZnhv?=
 =?utf-8?B?NHd4RG14UXNEZDlvS0U5d2lzOFZhU1RyaERnT0NFUElnRGtla2VVS2s5L29z?=
 =?utf-8?B?T1BaTDZIVGxFM2YvZDhtdTdZb2ZhZk1reUYwTkRqd2tZejN3NWFkZ3kzclJT?=
 =?utf-8?B?ejJnYVpNVHA0TWZBRi9uWjFMTkVNR1NZU2hRQkduYVJDRjYrdHFsQjFxQU1a?=
 =?utf-8?B?SDh4d2U0ZWc5Y0ZYMW14Q25PalJrNmdWRmovazJRbGcvSi96bEhzZFN0bklX?=
 =?utf-8?B?cko2QXVKZUpGSkM0b0FOVGh3TC9rTVRHcXJhamRPTzV0dmc2elFSMjF3V0VD?=
 =?utf-8?B?RFNmUFJybmFLSURzK0gzMmpKempNc2lxZjNPc25ZZjhyY2FYMVUwdXZMNnZm?=
 =?utf-8?B?Q29oZERSNkNSditVMHBMNUVHYzI2UkVoc0tFc0d4Z3JSbmdYZ2NLTHJmYXdM?=
 =?utf-8?B?bEpqNmV2N1VMUzNneVF5U05HT1k2dzNmcytWYkwzV0hpaXg3eE1KK1hvOEw3?=
 =?utf-8?B?cTNhUlVQa3RZRW9FUVFQOE9hWDRGUHYrT0VUUXdqRkVHajNPWVlDZTYwR2or?=
 =?utf-8?B?T0M2aXdQeXphNXJ3TEtRM0FQamRRSmJLM0s2djBXblNjRFRudzZFZGZ2RXJ0?=
 =?utf-8?B?TGFPT3hMdXFJYlp2U0MzSWNFTUJDQThoRndjQklPRHZRbHNENk52cS9QODR6?=
 =?utf-8?B?bFBiOGVCRHF2TFVzMjhYS2F1QUpHRTk3a2ZXY1Z4SmxmRzh0TkR3ZXJTOGVu?=
 =?utf-8?B?Z3J5U2tnMEU1T3Vpc1dqdXBxWTZiYXRwVlZ2cjNHblhYWWsrV0VGU2RrVCtx?=
 =?utf-8?B?dnNuSG81cDc2QjlpaFpuUGpOSllnaDd3UG1EQzlzU2Y3T2RDeU02Yzdjb01a?=
 =?utf-8?B?bUNsUnZsK0dZMWdER3VyVnN1Z2NIcEFDd1l3b0NWLzM1alN2TkVNY0x1TG43?=
 =?utf-8?B?RDl2VWZvbFo3K0E2NDNIQW5xbHlCU1N3ZUNQVUkvc0NvQTVUMGVPcWtpd2Rl?=
 =?utf-8?B?Nk5TdWJvVjdTWDFaSi82TXczdVdNRWZkQlZOL3ZsaURjUWtLV0pYbmxmb3RJ?=
 =?utf-8?B?T1NKaXhzdEV3OVJWcVlyQWgwUWZHQ2ErNzBpeHJJQlMrdU1Md1pCOVZyK3Zr?=
 =?utf-8?B?bmsvM3E5eGVwSHhlVHljS2M0cGpaVDQ2T3FZV3BoaGlnSk9GcHBldFk1ZG9w?=
 =?utf-8?B?ZjY4YW9KSHFDZks0ekxpRy95dG1VRDVvckNkSHFZTGNnU0trMDAvSitZdk5m?=
 =?utf-8?B?d1Z6WmlYQUR6S1MrNFhtK25IR2JVODlPU2wvTkVBLzFxVVVGTlM5RDI2R3o5?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f96f01-0b92-4805-8f6e-08dd4c5321af
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 17:23:28.9088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3hPAEQjmHR/2yKurauF4LmA5AtQ0t7mQsmJzpUs7osBhPuq9c3UGTCiqVFl2HpwntQ0y+Lto9H84X/ehAzdFfimu/HUYw9vO7KeqH5oPTIs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8256
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



On 2/12/2025 10:42 PM, Dan Carpenter wrote:
> On Wed, Feb 12, 2025 at 05:26:55PM -0800, Matthew Brost wrote:
>> On Wed, Feb 12, 2025 at 04:40:32PM -0800, Daniele Ceraolo Spurio wrote:
>>> xe_exec_queue_kill can sleep, so we can't call it from under the lock.
>>> We can instead move the queues to a separate list and then kill them all
>>> after we release the lock.
>>>
>>> Since being in the list is used to track whether RPM cleanup is needed,
>>> we can no longer defer that to queue_destroy, so we perform it
>>> immediately instead.
>>>
>>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>>> Fixes: f8caa80154c4 ("drm/xe/pxp: Add PXP queue tracking and session start")
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Patch LGTM but can this actually happen though? i.e. Can or do we enable
>> PXP on LR queues?
>>
> This isn't really an answer to your question, but when I reported this
> bug I didn't notice the if (xe_vm_in_preempt_fence_mode()) check in
> xe_vm_remove_compute_exec_queue().  So it's possible that this was a
> false positive?

We currently don't have a use-case where we need a vm in 
preempt_fence_mode for a queue that uses PXP, but I didn't block the 
combination because there is a chance we might want to use it in the 
future (compute PXP is supported by the HW, even if we don't currently 
support it in Xe), so a user can still set things up that way.

>
>> Also as a follow should be add a might_sleep() to xe_exec_queue_kill to
>> catch this type of bug immediately?
> There is a might_sleep() in down_write().  If this is a real bug that
> would have caught it.  The problem is that people don't generally test
> with CONFIG_DEBUG_ATOMIC_SLEEP so the might_sleep() calls are turned off.

We do have CONFIG_DEBUG_ATOMIC_SLEEP enabled in CI (and I have it 
locally since I use the CI config), but since PXP + preempt_fence_mode 
is not an expected use-case we don't have any tests that cover that 
combination, so we return early from that 
xe_vm_remove_compute_exec_queue() and don't hit the 
down_write/might_sleep. I'll see if I can add a test to cover it, as 
there might be other issues I've missed.
Also, I don't think it'd be right to add a might_sleep at the top of the 
exec_queue_kill() function either, because if a caller is sure that 
xe_vm_in_preempt_fence_mode() is false they should be allowed to 
call exec_queue_kill() from atomic context.

Thanks,
Daniele

>
> regards,
> dan carpenter
>


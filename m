Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60775C3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 18:02:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C97F10E825;
	Tue, 20 Aug 2024 18:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kZcOUSTL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC1810E825
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 18:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724176950; x=1755712950;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=skWWmCGx0+ymFIWohIp6OrF0PXXQudoE2IM6EJLQY/w=;
 b=kZcOUSTL16fKJvQDF6SaYzfrwxZqydtDePWe0WDggfkpoBpEC6PV7MzM
 1pi7YhqeZyt8IsJPAPpEdrK5aHCQ/q5cWCZ4LfpfOniJ2CEjn2HICzzlw
 QFk9Hb10RlMJLOqlwWoUlULYrN/nayHgqOjZ0HBmZIks3YPIFJ3oUuM+X
 cOVGAuZ6z7HOIJVTD+oFcBVWzkQyImzziwvhDP6XIQ87GyTgwVb2m5sHJ
 JVIRYplEAGbV9R7jUVqCe5rFahtvnSBiny6iDEJwa4ibN7e95Oh5tlWHb
 Mss0m3q6625nKmF1SdqlAHcZLWa/j4JUJqVfizy8CjMYnjRSPENJULtsf g==;
X-CSE-ConnectionGUID: s9HilA0xSWmUheNxfHcO3Q==
X-CSE-MsgGUID: eS2Z/PriRxKpRqacL224ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="39955596"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="39955596"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 11:02:30 -0700
X-CSE-ConnectionGUID: NmJbodulSlCu0DfuvEpDEw==
X-CSE-MsgGUID: f3LQZXeJQt+BR4/FtyJ+Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="65656683"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 11:02:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 11:02:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 11:02:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 11:02:29 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 11:02:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KghFQe7U3tlnQzZQmBfKw4xZETlUNPO9e1x0VU1z8tXCaROyQPECMglqqQmCN53jV8Ms7Toc5i2iPW7swKMYgQVVvrRAPoGEwyaAXetcC7TjzHGtqOzM/GT3WKVKwPEJ0/gyURWK6Q/8xKGZGPtcaUbvUnA1SnIU4k/N2P/w51SHlv4nxC2H1aDZoD2ou7PHNX2a9CiyvZqzqBUs/HA+rlODb7rARFgr8NGKUquHtCj7kTfA4cTl6QikjBje2C4yI0NQE3AuoFgowAIiKdQC9Fx0eovStTp7Nwcc+KfV+tyHhYXfc9Eg8/jBVzzVw9ARCIKTpHL6QR6C8pQv3j/Cvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/a1YHqKmR8hGMZGHf7ZBaO47iTjHFMwQSh0tFS7kpIM=;
 b=WnFYeO4PCzPOX6+PH6cqVeJeZmv78uOxhR/ArBH+FAtivFVCPN6LosONlcwPGnEo+GQltHwfo+sbeos4hU21hKhUxLUEe8yQV/b8eezwD6SFnKtHcFkLBEgslkh9CPVvPNcaF1jv1mLawwH7fqbuFVPHrvwj/Y4xsDDLnwpGQfRSr0O+u0tHj8H3ET19dha4uGt15JJqw1gHFZ/g2EUnDrlMWTGeSOC88dvv95EIXnDQNytXeLtY/ig0zrWyqQsJ99mUjUtVInhY7TqCdzSvwdJKUijjZzISjj63gfnD5NmEtGa+ZyYr5MjSy33tNwY9MiQXKWo3BJXSaKl/wpapMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by CO1PR11MB4818.namprd11.prod.outlook.com (2603:10b6:303:93::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Tue, 20 Aug
 2024 18:02:25 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848%6]) with mapi id 15.20.7897.014; Tue, 20 Aug 2024
 18:02:25 +0000
Message-ID: <3722c495-1518-4896-b434-6240925abcfb@intel.com>
Date: Tue, 20 Aug 2024 11:02:24 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] drm/xe: Drop warn on xe_guc_pc_gucrc_disable in
 guc pc fini
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240820172958.1095143-1-matthew.brost@intel.com>
 <20240820172958.1095143-4-matthew.brost@intel.com>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <20240820172958.1095143-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0016.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::29) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|CO1PR11MB4818:EE_
X-MS-Office365-Filtering-Correlation-Id: 6deb4b52-af15-4f26-9b32-08dcc1423f73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LzBlV2gwQTNpeXVMUVoxbTNlVGtpazd4elo0VkQ5UDRyTHFVUXRhTVF3dlJK?=
 =?utf-8?B?WEJhK2doUDdLTG01dUt6cCtWeEpnWldBakFMZkxRQnlTOWpTRlIrYTRQSDFu?=
 =?utf-8?B?SVFibGtMdUl0OXZIWFR5T2dPVDhaWTBkSXlqWGlZS3BacEk5dEF5QjMzaDc4?=
 =?utf-8?B?TUFKVDNtdHJqbWlJRUZlQmlCb0xyNkM4TWp5VC9CZE9rMm1JWC9pRUZ1SVFH?=
 =?utf-8?B?dWQ3blhQTk5pSzlEdWl5RW5iQkVmNVpNWm90dm03bHhQalNuMmlIZE8xa2Vx?=
 =?utf-8?B?YXhqWERaV2JLeml1eWlIdS85V3d6SlpJQWdTYktJcHFRcE9PQThqZlJOam9j?=
 =?utf-8?B?eWZsczF3Y0N0Rlh3ODI2Rmh6NEZjVWdjMVlOT2dzaFVXRkprTWtERGR6VUI0?=
 =?utf-8?B?YzhKT21OaWRaRkZiSEMrVnp3QmtxNTRQUHdYcG0zZXlLZ29VUUhMaUw1UUsw?=
 =?utf-8?B?aUlVL2w0ZzBEbVlvck5SOFFETG5ESHlrM3JSYm9ranNFNUsrK3k5RElOUTdo?=
 =?utf-8?B?UnV6Q3RYbTV3QjhnRmlDbUZuZXpkcXMrY2tMa3J3ZmQ5eUdPaW8rZ3dmQ01T?=
 =?utf-8?B?emMzOVlOeWd2RWtuMjZsN0E3d3VGZkQrT1RidWRKREhLNXM2VmNOZ1lrZTEx?=
 =?utf-8?B?RUd2OFZ1WmNma2U5dXBFUktnM1dMbk00djlSdVI5SlkzaHp3eEc0alB6Z2lY?=
 =?utf-8?B?dFRSYTg0Q3ZmQ1pTRTlPZTZac3U3U2FxS0hkWFV6cDdZWlUwOTFUc2hEV29i?=
 =?utf-8?B?NUhJck5KeUJqR0F5M2FCUm9DbDNtUHU0NHZKaU9OblNXK0FKMVVxYU9oYndk?=
 =?utf-8?B?N3M1d3RBTXBuVVhjQUVJRituRk5BeEVWdFpQOG9CeG5EYUUzZUhSMG9vams3?=
 =?utf-8?B?RXh6YldIR29YeHlLTk9ONFBmOGZLQ2JTMzExZ1lSUTBNRHpYSnlIMTVpNmNo?=
 =?utf-8?B?MmlrSjA4d3dobXNjbXJvSnNpY1lFcVBDSGx6Tm1NbGYvaStka1kzQlozUkYr?=
 =?utf-8?B?ZzR6VlFDMWNWeDI1Yzd6ZU9xc0dTQnpxZCtyeUIzQUtXaFBrRHgvSjBhdjVI?=
 =?utf-8?B?ZHplMWNrVzJXL3FPUFZQVnp5T1BwTTRVbDhHR3pUQTRzU1JuQ3M0MDdtTFBL?=
 =?utf-8?B?eXZ1UWFZdDNaS3hsNmtkempHcWdERzNxM1hWRUowTkNiUTZvdlc2Qjgxa3pP?=
 =?utf-8?B?R1dUaDc4enBrUEVERFhpQWpSMUdGU2V4RWRZOE0vc0poMm0xTXdJc0JZd1V2?=
 =?utf-8?B?UmRPdCtucVo5ZlA1b3V4UmRvMGdFaEdyN1pxOFVRUjluL2dYUzEzUnpWS1pJ?=
 =?utf-8?B?VW9EOVVuVkxVM2xRK2NCNWJVaHQ2djhTVzhYUURCNEhhZUhzaG9LV1kzeGQ0?=
 =?utf-8?B?aG1LMmVza0ZWaHludjRnU3p6THBGNDlNZlBNM0I4aWJ5OGJvNVk3V0w4M3VJ?=
 =?utf-8?B?eHpVdW14c0dwUEpmYXlldXNrREZwK1QyY0ZsUlR6WW5TRHkwM2tQN05hZ0h2?=
 =?utf-8?B?TE5YWEN5VzJiVFZoL3NCRTRVSVBMb0w2bTdLWGRrb096Vm45dk5SYThKeVhz?=
 =?utf-8?B?VXQ0QnB1VWV1MWRmZXB0ZUMxZ2didXpVZEtRKzFrVUJ0MTJtdlM4MHNXck9D?=
 =?utf-8?B?dVNCNlJMVlUyOWxPVjJDTVhLMGVHd1ZlUFk0ZXlPTE10dk1IT2hCUzhWNDJx?=
 =?utf-8?B?dGFvSFlCWTQ1NVZoYWF1QmJQZHZMaG92Zk4wMUNYaWhSMEFjN3BKWkM4SWk4?=
 =?utf-8?B?YXQ1ZExwL2NIVmlhOTczWGx5ZEtEbEpQVzlBdGJoWmJVVFBBN2NHYlhlczYy?=
 =?utf-8?B?djRmL3l5Z25DNFordFVhQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTVUTFhzWVVEWmdvdmhDRldnVi9TSXlpRkR0N1MxUEN0T2R4cm1RS1QwczRM?=
 =?utf-8?B?bEo0VlZiNFdLTGMrUEpBSVU2eUE3WFBZcVlHOHhpYTlWd3R5akx1dGEyWWxJ?=
 =?utf-8?B?czVoL1BNcTZVd0RkWGgvY2p6a2prQ1F3NGJyVC80ZExNeEt1Sk5YTHo1eUI1?=
 =?utf-8?B?ZE5yTjJhT3Z6dlhaVFhub0JXeWdNV3UyNVJucFlrd1phT2VBb3JtckhSRDB3?=
 =?utf-8?B?OTQ0cUpDR1NtQW5ocC8zR1ZDZzhNVlhNbUI5Qlg2emtZZklWYUpqRlFvQlR5?=
 =?utf-8?B?cmxMQ3dBM1lFU3BYVjREZEZDaitrQjlXRmt4Mi8vVk5uVnoyaE4vamt1VUtw?=
 =?utf-8?B?VjBWQmgvSGVWT1NoTlo1UEVHMXZNRFJmdFEyOEtyKzRrdGVuclBZQU1SemtH?=
 =?utf-8?B?aHJMQkUyUjZhbUx1RGkwMFN6R05GSEF2WHozcnUwZ0N1a3RiQ21Sc2p5dGEx?=
 =?utf-8?B?OFdoM2FHUldKSHR4dFFhQmYrVmxRNU03VUt0SWNGSldwZEN2c05qWFNEbWlk?=
 =?utf-8?B?VUxPVE1Qck0yMGphdXpyMXZ1RFNvUFB5a0RWN3VxU2MxazNlV2FwOVBDRUQy?=
 =?utf-8?B?V1VNMHd6dUtzalArWlovZTI2dDZBbWFXN0xqNVljUmZRNHY1RDFKYTBlZDc1?=
 =?utf-8?B?V29hMFpPVHY4dkpKOHZ3aWJCOWZZQmFKQThKL2FCV0lKWjlGTWVhY1NvUHhO?=
 =?utf-8?B?MFFJb3c5TFUrNU05T2NGZHIrYnkvak4yVHhJbGUxZ1hEazhmVWtUWGZDVFpL?=
 =?utf-8?B?RFQ2bnN4eGxQU3BEVGpkU3RqZGovQmM2c2RpRHA5UUhydkpYS3RsR3NmdFFH?=
 =?utf-8?B?ZzFNYVQvNklTa0MrS1o5UlcyYVppODVqTXRqVDJDOTBndjhZKzA4N2lZK2V2?=
 =?utf-8?B?L0pXWmpZMXlHZGlIdW9MS25pV3UvcWxNZE5OZWxxb1lscVZTTGlMdHFKT1dw?=
 =?utf-8?B?RjRHaExYZkFFT0xudGhicE9FekVqTHpLNWVtcFVlUFpKUC8rcWZOQUhibEE1?=
 =?utf-8?B?Q201UlpNRGdhb2JHMTNiT0JaSTFMNGxwbklWZEd2cE5OSkN2TTg1UzZUUmtn?=
 =?utf-8?B?ejE4c1ZiWmtZQU9zSElvL2VPQnV1Tk11UEJ2SHV3ZjhSQlNIaXBWcUZSL0hL?=
 =?utf-8?B?Ti93N3JDcS9NMjBmZnAwN0dIUHQyMEFGQzZUeUFvcHhEVnpNOUhza1Y1TE1i?=
 =?utf-8?B?UXBxanIza0JJc0R4Q3haZUZOV25Rb0FXeDRlWmwrMWJNTWhJV1dudVpOcWc1?=
 =?utf-8?B?NVpHNityTHFsamZHdHVaZlVkTVRBaDI1cTAzVEFGK0c2VDF6aFdBcG9FV0p0?=
 =?utf-8?B?dWpGRWcvNVNWUkgxczZZK3M0WTI1ZnkyMEZRM1UyaUFtVkJXdThQS1hTa2sr?=
 =?utf-8?B?c1FBOGdVQitHQTJGVE1UWXFXY0lPV1k3Sy9TYnVuNFFHSXhRTXpqUXFESGNy?=
 =?utf-8?B?dllqN3VIaUJBMmdLdnFxWlhOMENFTi9EcDQ3ekt4WDZJMUpIY2ZGeHJxSkpU?=
 =?utf-8?B?YS9EVnRsb0ZQZXNLc2lieDNJRzNOMHJZTjhKWitUUlVvY1AvUEhFdDROTnM1?=
 =?utf-8?B?VkVWZDQxV3A3aGYxeE5LNTB2UjNQUFhYRE1BcHVORzdHSnJkRW1Mc1BPay96?=
 =?utf-8?B?dlV5ejE0VXJQZWoreGRYd29HQ1ovN3NBWS8zb2oxNlVpbXF2bUk2TzRDZHAr?=
 =?utf-8?B?UkZUdS9UQUY1VFdUbFgvNUt3ak1CS0t6TVFyUlhvT3piQ3BVdFlSZ2tpa1N6?=
 =?utf-8?B?VGh5N2paNmowdHgyaWp6VHJnbGl4c1krYVRncEM1Q1Y1anB0MTlxSVFZcjVX?=
 =?utf-8?B?Yjk2NmcrMFNJS0FLSVNGMGlSbDFHdWE2NUFDVWpwWW1kemRCMmJOM29sVy9s?=
 =?utf-8?B?dkRLZW5CcWFiMHZCdGN6NWZGcnFEbEozdkx6SGVnNG9IaDdNUytRQ1h0NG9W?=
 =?utf-8?B?MFlxd2ROS2MxOVB0a2JYeCt1N1BDUjdIVG5IbDkwbEYxTEg3VDBlTE0xdjla?=
 =?utf-8?B?aGZYZFlLYjg2THFranN4bmFVSlVuVVNaMkJJMVQ2dkdTR0c0OWJCenRFQkxW?=
 =?utf-8?B?SjRJaUlFWUxWcXVYbUdCd0lRRTErQmpNWFg3UTdCNm9ZMXZtUUMwWTlYMTdp?=
 =?utf-8?B?YUUrc2hEUXk0cFVkRVZ5bi9GNFpEUFNmU2JiQ0pKNE0va0lTTzByelFOS09D?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6deb4b52-af15-4f26-9b32-08dcc1423f73
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 18:02:25.7778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oFByiVWBSLzkkIAxVRlNw+Ci5cC3z3TTrBVIhimtWLu2qdlmkfdYnXlwxe2a0uTMFMpNPR7ch7PeGY4PR7ag31jNyZ9J9q2WiR5RnAIjYjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4818
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


On 8/20/2024 10:29 AM, Matthew Brost wrote:
> Not a big deal if CT is down as driver is unloading, no need to warn.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_pc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 32e93a8127d4..def503abeed5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -1042,7 +1042,7 @@ static void xe_guc_pc_fini_hw(void *arg)
>   		return;
>   
>   	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
> -	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
> +	xe_guc_pc_gucrc_disable(pc);
>   	XE_WARN_ON(xe_guc_pc_stop(pc));
>   
>   	/* Bind requested freq to mert_freq_cap before unload */

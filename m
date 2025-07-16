Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A43C83F22
	for <intel-xe@archiver.kernel.org>; Wed, 16 Jul 2025 18:33:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D8DC10E3A5;
	Wed, 16 Jul 2025 18:33:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jryhQMO7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D569910E3A5
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Jul 2025 18:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752690779; x=1784226779;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xgOCQH6aCFCUzRpKLXiRtq3mJnoRp/iW7uciumfNQK0=;
 b=jryhQMO7XiqAHwGf+wd9vBKJaAHQBZueGLaTC1Ya00iujl6prru9oA97
 IDiGJ1Ni+pzkfJfaz32VWvhqPD0yZbUJamWTluALN+fHZi++SDCx7LuBM
 b70P/OnFU+bL1fgtgINzNX4cPl9js/3sm8OEvSN7WBQ2C37U+lEvNrFZE
 Qct4Sok+f5211VKiE024699hA8kjyui3XJQwXsl4XWTzdgy/VTurfz5u6
 IiBYznwa0NYooJjf6hu6p8mRmcUil5FiBWGV2rfZUXeoUfc4wZIJSnKVw
 KafZxf61mLhGS3PPToDgIAtIyYg/PeNvsE7xljA/l/JHlBOSzp7bO5Qp7 A==;
X-CSE-ConnectionGUID: ZpjoBG8pQku3KD8S5xGzwA==
X-CSE-MsgGUID: oXOheiSAQN+dsTLPYWAOOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54821343"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="54821343"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 11:32:59 -0700
X-CSE-ConnectionGUID: roUnprG9RHmj6N661qrjlg==
X-CSE-MsgGUID: 7Z/LFNyHQJmUvPAbLkXQlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="158129357"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 11:32:58 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 11:32:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 16 Jul 2025 11:32:57 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.43)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 11:32:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y2nHKfsJh+dOZZmGSsx3A5dgzXWiVwgfH0IPC1O0G+pvFSMT25Hn9uqdWdwhAntump+oRk/V9EnHK/MHsHfJXvNl4ZTISyxJBd26BKgxwY1g/1IMUEjDUrqsa4z2BKSYlPBG6otBLkr56KNZTCtf2c9oGZe0Z3A0hUwWCZk/s3A67R8HyLW0GSL1gfsnb6MVyUA3/nmIgIZRXwvwWYZOgh5NUjcdqE9NeWjTj1TF+xVG/5CjGYzp7Ad0BBjswklgVA+Yh+6Ovm1gP0vSTua3DeFrNRxiLCW/szjo7hRaGdNEmac2waaK00EmvVqVVF9e0OyDkHAYOL9NiBe919cNQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNxpS82W5XITJ54E09DWox15yAiwXO+wlCrWoNVF4z0=;
 b=jQupgQvxHGARinm1y0r/93daynXPGDk5xeQvgwW80bZIIFefUTrUunEEwjPOoqkf0uuLnDGBcWkSmVRlhGqpn1aKOl1bwfNzZVgj1+1xyCXrrC9hHq2R6cXoouUZ8E2qwufPECcYIwzvB6b+Wx/npHVe7NYE6cr2NMyfPThg3i6zoZcbffM64efYhSljxWUVFce+4xAQPqmUHHB2+qWG87C8gMJiHJUfAUcerLgyYwGxiLHhnW2czxChVWVq6lp+gUJ6EY3z+05UMjuGeSJeV1lxIpgEkURb22xxRD5L7teLFmzOZFnEURJL8LuL8nuiK5nnACKvqUKwLJxLwQpqyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW4PR11MB7127.namprd11.prod.outlook.com (2603:10b6:303:221::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Wed, 16 Jul
 2025 18:32:55 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%6]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 18:32:55 +0000
Date: Wed, 16 Jul 2025 20:32:51 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?utf-8?Q?Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
Subject: Re: [PATCH v6 6/9] drm/xe/vf: Rebase MEMIRQ structures for all
 contexts after migration
Message-ID: <72lodafuq7gqnogeslpouyz2fvkid5zkdbvaollijeqeezopta@47bvtuczrj7d>
References: <20250704210228.825843-1-tomasz.lis@intel.com>
 <20250704210228.825843-7-tomasz.lis@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704210228.825843-7-tomasz.lis@intel.com>
X-ClientProxiedBy: WA0P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::21) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MW4PR11MB7127:EE_
X-MS-Office365-Filtering-Correlation-Id: 44fcf261-60d7-4f10-a770-08ddc4972de6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MStDWk83NlEydkMzbzV6TTRZbnJyZUxGU0E3ZXRyMXlvM1BkclJkVVBUd29Z?=
 =?utf-8?B?SGJMUFJwcVhrUHBXTFlSYWpIeHdDN0pFVVZIU3JaK1h1QjRoL29hVnhhMGE0?=
 =?utf-8?B?WlIzSnpxK1Y3T2NGQ3ZzQUFYbVhYNGR1SC9JQ0p1ZGN2NTlaYWo0ZlpvREtU?=
 =?utf-8?B?RWFHdW41VjFEcFpmcTFMemxtU0FHVjdTN0Y1dFpVaGUwVENSRnJPc2hIbDdi?=
 =?utf-8?B?TUlieGttUHFaSlhxRzJMWVpDQ0prQVhjVDV5V01mZVZ3cjZJZEZRRHQrVkdp?=
 =?utf-8?B?UU42N2JGenBONkZkRFd6Y1B3NmhNckxlVzVMYitEN0RtNjJkb081VHFBdHZo?=
 =?utf-8?B?QUthck9oMUUvM09oTU9aellhdWQxTXd2TTl0Z284Z3ZXK0V0Y3B0NUYxc0Ji?=
 =?utf-8?B?VUdRcm1BK1I4Ukd1ZHd0SU1QK21mZ3hGM2Urd1lQU2lIeUVQVFh6M3ZNTkNx?=
 =?utf-8?B?TEhjZ09zYzVDV1dxeWY0c3BvcDkvdUIzTWFJVzF3TncyeWpjQVBCMkpZcG95?=
 =?utf-8?B?Yy84cW9VQWo0MnNuc3dFNFFQUk16a3BWSkdTSngvbWV0SHJmUjQrNTByTDlI?=
 =?utf-8?B?Y3BrTGEvODNGSWtLSmtTUlBlL1pDL2Q4NnQ3WmV3OUVNVFFKZ2RMM3QrTDBR?=
 =?utf-8?B?T2J0OE94ZzB4VmRhbDlUa1hycVRvOFp5cldIRHJpN1h4aGw0eDEyMzc3MSsy?=
 =?utf-8?B?c2RNMkU4MmZ4U0NLcUJyaVhwSXFVTGJ6RVlWYnhSYmF2MTlVem5Ib09WcmJN?=
 =?utf-8?B?UEFiY29YUzFIaFI4djVkVGhjRVBjamY2WXJaVW04R1JQcmJ1L01nR09ZZFlL?=
 =?utf-8?B?R2w0Ty96Y3R6U1lpLzNlc0U5ZkkzeUVPbCtKczBUM21FaVMrZHhlVzFDejhr?=
 =?utf-8?B?RXU2citEcWFUcUk3eWxWWmdHMU54YnVoaUJZeUR1aU50UnZ6RTA2bDE5K2lw?=
 =?utf-8?B?elZUL3ZKSnovZUNCRHYzeG14UHpxaE5ZaWUvVzFlaVdYSXlZOGQva1paOGY1?=
 =?utf-8?B?NGphK2dnTDBqYUpMeGpzUGhXaEkzZWpsdkZWTldXNDRhZ2RvR2ZyNTRlN2ll?=
 =?utf-8?B?aVp0alU2Q1Q4VklkR0VSelhXU2F4RjRNYjJYRXVDWFR3S1JhZ1NoaEVmSGlE?=
 =?utf-8?B?ZGdsaFM5RCtmaXJPU1J1eFB3MXRLWStVVDFoTW53Vk1KNW0xTUswQ3lZdWxT?=
 =?utf-8?B?c1NnVnhmMDJUL3RKdVQ5UStvWUF1VVI1dFN1RSsweUpHMUVaTTcrQlpNS3NM?=
 =?utf-8?B?T2ZFWU1Tcm1XQldiZlZDM3Z3aGVWUXoxM0xoMjZhQnpYRkRTNFJab3FnWFk0?=
 =?utf-8?B?M3BOY0dUUU9aMzJuei80VXRTRTc0cFdLSlh1SVRVSi9tSDdPY2dwSG5SdGhj?=
 =?utf-8?B?cWxOaTN5ZVE5L1Z3Mm9tak1vZ3FYWUIwSXZNTGpVcGNCYjV6YzBYTlV4MkJh?=
 =?utf-8?B?ZWIzMmphOEp1RU1DUTBsRVRUMzVLM295UHFGajZwMm83TFBocWIrR2V4dkh3?=
 =?utf-8?B?OFZzMW5wZHZHZld5SHBnMHRwcHVPcnBSRzNuM3hqQWIyV0RvRmRXUW9EUDNu?=
 =?utf-8?B?YVlLY2s4T0d4WHlnL1FpLzhMd2twbFVGUENEeWVCYXpydmtXNXFzOG9Md2ZN?=
 =?utf-8?B?T3hWSVBvNmRYTkpGdnJVaU4zM041VzRycHFPRkF1cEFmUVFtZHlpb29yQU9o?=
 =?utf-8?B?bXNUcWF4U2IyajNnSGZUb1plYWxPWEtYWG9VMGpuZGlhNjhmTEFsdzJlMVVN?=
 =?utf-8?B?TlMydnFtczh2VWtXNThqRi9FZ1BLaHZ4emxEM1l4RStLcDZiMXh2UDBnUnBE?=
 =?utf-8?B?QUs3Q1NSdUhWVlVRcTM2OXpQUFBEamhZSUZPdFZVZUxLVThwWkVGNHczcThW?=
 =?utf-8?B?ZTI4SFExWS8yVXJFY2taUHBoYTdqYmJRajJWaXFLNWtlS0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YitUSS9yaWNrek51dmtWTWluaGtmTklaYmszT2hpZkdEM2l4UmhaT3FKNm9k?=
 =?utf-8?B?N0tpbE5yZTdXRUNHcjNRMUdaSzFtelRLbEdvb3hJS0t0Umw4ckFSMU1KZTRz?=
 =?utf-8?B?TGM3K05TeFY0QzY5dzMrQkJSbFhqVEJLQXd0dzBuQnNDNWVSYlZKTlZxRXJ5?=
 =?utf-8?B?QlBGdTk1emZFYlVKekFSV0NwOUhpNnExOWxhcXBOR3FZZDVDMStZcHd1Q08v?=
 =?utf-8?B?bTBUQ0g2UkdHMk82TjdKTEgzbm82Q0R3RVdPS2dWdmZpc0t0czVudmVFQnph?=
 =?utf-8?B?NlErcFYzOWtCbzBMbG8zZ2xNNW1DUGpTeThSbWdnUE45VGVTUUswcytNVVhF?=
 =?utf-8?B?Q0hENE9xZGo4ZFp1VTdnMUR1OC9NRGRybWlnVkM2YVUrQU5BQ1hHRWgwYmxt?=
 =?utf-8?B?R1k5RnlDeUZ6U3J5eGpIN0dxVGpjaGx1RHBCeCtxQ1JiZCtTOU1OdE53eHE1?=
 =?utf-8?B?dXN5TWgyRG1ReXRKd1cyOGxLK2RINkdZNXBxdmc3UFc3MVluMlhFdVdoV2JX?=
 =?utf-8?B?ZTFDYS9CWVI5ejJvNXJGVWEvd1RpUDR6dHBwUjlTRy9QS00xeGsraDZlSm9s?=
 =?utf-8?B?aTUrd2RxbEEvQzJGcjZOWm84N3JKQ3ZYNmcxZzM4ZnhMQVRmaEdhSmpiZGdv?=
 =?utf-8?B?TndEN1BoUnlIQVY3L1RNM0RtVmJZSzdTalg3eFhmdjArVnIvSHVHQzlkTDh2?=
 =?utf-8?B?bGRXeDlWWVdJQ2htcXZkOE9zVWRjckpwdjJQTmRhQUwvbVFRYXNJemV0aFFH?=
 =?utf-8?B?Wks3TkZldk9FajJyQ2w1ekxGOU1BbDA3R3Y5c1VNZzBMVlBwejBGem5oaC9C?=
 =?utf-8?B?ZVE0TFlRa0h0SVNDbnE0T1dBaXpjNEdKdVJPL2FJTEJWV0NhZGdtdm51MGVW?=
 =?utf-8?B?d1RVVCs2Y2R5VWd5TlBNQkVudlhSZkg2SWtlL3JVM0c1MG8yRWdHbFZEcTZl?=
 =?utf-8?B?ZWkvWHlwd0hRSkxCZXN5VFhmcnBNdVF5ZnNpZGJST0pEQnNOUG5kVEZ6bytu?=
 =?utf-8?B?U0hvQkY0VXNnS0p4M3p4YjZaWjUwS3J5dENpc2NyYjBHT01HclJVb2dVYUEr?=
 =?utf-8?B?ZzdTZStNM0llTVJIT3RpVDVXNGVkUDZSYS9yR0k1S3JZQ00wcHVCakhmdTky?=
 =?utf-8?B?ZHM4dWlwcU1haTF6T1VhdmVHWmRVd1VWVWk5N0U3aHhOWkF6VHU0Y3YybSty?=
 =?utf-8?B?Z1A5eUhDdHU0SjJkWDlVd1VEZHZST2NzMERzblVYMHMwVUVmVmczT0VybnE4?=
 =?utf-8?B?QXU0UkRYODI0SjZVVjBUN2NsU3RLWGdxQktSa2JkQjl0YkIxQ3J6Y3c4c2U4?=
 =?utf-8?B?K0NGVm5WRDBjakFTSHQ4N0Q1ak5YSjNtS3dtUElaekpYZGVtZ0xSZHFwdTdC?=
 =?utf-8?B?Y2paZ0pRVE8yMXc1OTdvNXpkQlRxZHRQa0I4RWphTHhvNDRxQnB5aWxQRklM?=
 =?utf-8?B?amY0UWdTaWdPMm9NY0ZwT1Z6NWllNHRaVlpsaHpjUjlOdjZweElqVFBza1RZ?=
 =?utf-8?B?LzREVUE5eDZqeWNxNzJNUldMS1FCMlM3Q2J0MlhaVFI2ZzFlZE9uTFFpK3Uv?=
 =?utf-8?B?OVJzSlJtZHcrcXNPdXUwdnppRkREbHcwR29JTEF5VTRsVW4vMVJINjNuUWRy?=
 =?utf-8?B?NUtrNnppeFdnME9tWjRNb0RsZlBIWDduTXQ5aU5KcTQ4NXdjcnBIWk4vMEY4?=
 =?utf-8?B?MU9vazhUZE9KYkZiSGpyUEltd25wVUd4eXRpOXZxMEthSE5VbDZEZmNBbkVI?=
 =?utf-8?B?Wkw1UkdFdjhXOEZpalRhMmFRYkhjQ0hVYVExK0tTU0FHSFJvUEJpb2FsSmMr?=
 =?utf-8?B?cVlXSytrT3VIZjRDTVRESzlLN0FUekJNMmY2aW0zcnAvdTE5V3RXbkFJTFpk?=
 =?utf-8?B?b0cxZ3lOenc4SU9tTjN3YWFZYXIxZERuV0tmdU9VTFBsRDNUV2NXUWQ3a3hj?=
 =?utf-8?B?MWNscmxPQnV3YXAxWGpVZVNjdzJhb29idFU3elZCWUVNU2crR1JMMFF6YTZ5?=
 =?utf-8?B?cnNBMm5aVW1hVnBFdDB4U1o0K25ONzloOG92N2UrUGRwNVppYnZSRTNvaDI3?=
 =?utf-8?B?OVd0Z2ZBYUh1Zy9sSzRCd0plZEZCUzgwZ2dBaEVmTTRlRmhtSXdWRjVhTHZR?=
 =?utf-8?B?OFdTKzBkT3RKTzNKTUhpdGIzMUgxNVFHdi80THU0Zk9zWVlSTWMwZHcxMWtO?=
 =?utf-8?B?dHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44fcf261-60d7-4f10-a770-08ddc4972de6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 18:32:54.9426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6MK7ZYYlpJOiAaFqjucO+58w6zg8XHrvjmmu+4TysOPyqGwBeyrkP4tIs7zw+y+Piuy1EjsJltYVYlMwV/7w0OcpTSlWtBKCbUbN7K+/2/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7127
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

On Fri, Jul 04, 2025 at 11:02:25PM +0200, Tomasz Lis wrote:
> All contexts require an update of state data, as the data includes
> GGTT references to memirq-related buffers.
> 
> Default contexts need these references updated as well, because they
> are not refreshed when a new context is created from them.
> 
> The way we write to vram requires scratch buffer to be used
> before the whole block is memcopied. Since using kalloc() within
> specific recovery functions would lead to unintended relations
> between locks, we are allocating the buffer earlier, before
> any locks are taken. The same buffer will be used for other steps
> of the recovery.
> 
> v2: Update addresses by xe_lrc_write_ctx_reg() rather than
>   set_memory_based_intr()
> v3: Renamed parameter, reordered parameters in some functs
> v4: Check if have MEMIRQ, move `xe_gt*` funct to proper file
> v5: Revert back to requiring scratch buffer, but allocate it
>   earlier this time
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michal Winiarski <michal.winiarski@intel.com>
> Acked-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com> (v3)
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c  |  7 ++--
>  drivers/gpu/drm/xe/xe_exec_queue.h  |  2 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 14 ++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
>  drivers/gpu/drm/xe/xe_guc_submit.c  |  5 +--
>  drivers/gpu/drm/xe/xe_guc_submit.h  |  2 +-
>  drivers/gpu/drm/xe/xe_lrc.c         | 52 +++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_lrc.h         |  4 +++
>  drivers/gpu/drm/xe/xe_sriov_vf.c    | 20 +++++++++--
>  9 files changed, 97 insertions(+), 10 deletions(-)
> 

[...]

> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 54a6218e48b0..43ac73e432d4 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -13,6 +13,7 @@
>  #include "xe_guc_ct.h"
>  #include "xe_guc_submit.h"
>  #include "xe_irq.h"
> +#include "xe_lrc.h"
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_printk.h"
> @@ -244,6 +245,11 @@ static int vf_get_next_migrated_gt_id(struct xe_device *xe)
>  	return -1;
>  }
>  
> +static size_t post_migration_scratch_size(struct xe_device *xe)
> +{
> +	return xe_lrc_reg_size(xe);
> +}
> +
>  /**
>   * Perform post-migration fixups on a single GT.
>   *
> @@ -260,19 +266,29 @@ static int vf_get_next_migrated_gt_id(struct xe_device *xe)
>  static int gt_vf_post_migration_fixups(struct xe_gt *gt)
>  {
>  	s64 shift;
> +	void *buf;
>  	int err;
>  
> +	buf = kmalloc(post_migration_scratch_size(gt_to_xe(gt)), GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +

I would suggest allocating this temporary buffer at the place where it's
actually needed, rather than dragging this top-level allocation through
the entire call-stack. Yes, when done this way we can reuse it, no, the
reuse doesn't really give us anything, as the buffer is small, and
kmalloc is relatively fast.

Other than that - LGTM.

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

>  	err = xe_gt_sriov_vf_query_config(gt);
> -	if (err)
> +	if (err) {
> +		kfree(buf);
>  		return err;
> +	}
>  
>  	shift = xe_gt_sriov_vf_ggtt_shift(gt);
>  	if (shift) {
>  		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> -		xe_guc_contexts_hwsp_rebase(&gt->uc.guc);
> +		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> +		xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
>  		/* FIXME: add the recovery steps */
>  		xe_guc_ct_fixup_messages_with_ggtt(&gt->uc.guc.ct, shift);
>  	}
> +
> +	kfree(buf);
>  	return 0;
>  }
>  
> -- 
> 2.25.1
> 

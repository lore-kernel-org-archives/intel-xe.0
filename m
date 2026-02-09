Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D6FE7E0C0
	for <intel-xe@archiver.kernel.org>; Mon,  9 Feb 2026 10:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D6010E3BF;
	Mon,  9 Feb 2026 10:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U1yebTI+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D67310E3BC
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Feb 2026 10:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770632237; x=1802168237;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fjgi/V56kg4gMLrS4ZGnPf/JH6cDCXBJaMCn3V98KQw=;
 b=U1yebTI+yGk7lRQ6AYK6Jou2FQz3klWnCZUxs6IeyVdAKdLXxuSMwkeV
 rnaXkyU/UkpXJnuhHCyXfHT2zoYfmp4TUc34lvJhPC2PY9h/uKZu0gfjt
 eURSNgRgcuSjGfCdbYUhCzFHSRxGSayn4HpIrCkT55bBm7fOToajjUXUD
 w7P55E67SjPzFMycnp1JgkO81FmoQUvLV1/gEYpQqkvgIfBPqIe7wLUFv
 XYdDMoj0txjRT3MH/x0AGdNT2/4J7fJCIhzSbanYTeNQys5ILZFPmUVg3
 cHU11TQ+NhUMFMRodA4mbt+3fqfQ77HZ749ibHkN89EvqHIOv7ph84AVH g==;
X-CSE-ConnectionGUID: wVUlMoHOQkOqh68ehCGOiQ==
X-CSE-MsgGUID: yzQo5lFBTfOqkdx/93Cc9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="70946974"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="70946974"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 02:17:17 -0800
X-CSE-ConnectionGUID: AiVMlgtORC2X/BKHLxWgGA==
X-CSE-MsgGUID: 7/hlM7MATqiyeehe9C6CCg==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 02:17:17 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 02:17:16 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 02:17:16 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.12) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 02:17:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=evmAhk7gYBYw4V+uBmA1k9e3U1+wz4IJ+YM55kHxsMZex/eOEXcmYt65DzjdDxb51TtAfbfHZcY6OmKxe9YifjVTCPX6cv0XI3SUofIjyAc/nwbGZ6xLSgdabo1rWdAuXOrNlzV647pmIjv6H0fPrdxRqJzcwYORZ+H/N5gLYhHSLRGzbMdOzybYtZM4TSSc/Eemb/OtoSEk6uxOCRsW6Gv7ZTY2LXVnk5edCwXz5U4Vlrr6col9Cf2trEthOa7CTODXTwVcCPOqEQF/8EZzEv1V7Td+MbNpEb5HHqSqOUhUs7AoCVSf+4J1pL36/M2aNG71PK1WuSnolf5Z/+sqjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+u9QZBHaDisKMbsq1Yq9QzNYv9+VPC2NW0ns9BhL9A=;
 b=fbImtdZJdqM1HXU8LNr/1XCPq+MOdP5Kd8K8wCPxbVUZcxEUUOnd+053FtdFXACRDvpdCloQvJdLmnYUGMv3mmptzBALrcI+9Uqw8uT1IcKT0V2pG1g9wAGdSR942rGQwZroyTCWVcueC59WqIF1KawyRkR1f2+lFJH+E+fMiOf7NBusov4i9MRyJs4ALMAu8CESUbwPx4A3V3uWptMiAqLNcZGh+ZNMJ1PTEMpdhvpJnOB6ke5oyuylRwzip5Z0nAXq1koOydo3tB4qWjj6pCwarBtNtEI2sj9lmdowKa51UjI+2ThQz88WunGYg/bqt8OcLl+tOLMmr44gbJU1jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by DM4PR11MB6454.namprd11.prod.outlook.com (2603:10b6:8:b8::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.18; Mon, 9 Feb 2026 10:17:14 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 10:17:14 +0000
Date: Mon, 9 Feb 2026 15:47:06 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Alexander Usyskin
 <alexander.usyskin@intel.com>, Shuicheng Lin <shuicheng.lin@intel.com>,
 "Soham Purkait" <soham.purkait@intel.com>
Subject: Re: [PATCH v2] drm/xe/cri: Add check to verify if CSC is a PCIe
 endpoint
Message-ID: <aYm0IjRHxghW8sfs@bvivekan-mob1>
References: <20260202165351.2020699-2-balasubramani.vivekanandan@intel.com>
 <debe7ede-51ac-490d-8e3d-ac10a69a591f@intel.com>
 <aYH8IOX_kv2_7xxz@bvivekan-mob1>
 <aYH9op_pHZE7YcV-@black.igk.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <aYH9op_pHZE7YcV-@black.igk.intel.com>
X-ClientProxiedBy: MA5P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::11) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|DM4PR11MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f5516aa-ee89-475a-2392-08de67c4651f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0F5R2t1aTVpdy9mNEpvZlhia3dEK3Y1ckRXZmdDcnJnU0ROemthV3RlNk8y?=
 =?utf-8?B?d0FZcE1XSzV4WFFrakNuUzZMOE5MWkZxVURVVG9mb2FlY0NRVklIQm1Ed1Bk?=
 =?utf-8?B?Z2xqTXU3cjFZaVZtajRKMlpsdlNuUmFyUG5SalFEWVExQ2NHSnI4aHVNSEVV?=
 =?utf-8?B?STlySDFHeGNQUTRYakphbmVJdHpBYjlGZmhqS1o1Ym0xc1NjNXZmTUFoT2Zj?=
 =?utf-8?B?SFR6Uzdrbi9xVEN5b2ZYYzM0VjRwTHdVWHlESzdMRUJmU09tQnVNK2FvaUxu?=
 =?utf-8?B?MDZrengybHlSNXJVN0pQd0J0SU1xdW5TMVJSQzRMUVlUN085WmFXb0lUTkh5?=
 =?utf-8?B?dXg5ZER6dllFWHFKYVRLclVuU3RYMnNUYjFsSVhJcE1PdEJValBSN0VXU0hj?=
 =?utf-8?B?bUZpbE1Ba0cxWk16K3l2TzFaOXZNR1RJUmM2ZEwvR2haRCtXMEsyMU1lb1hj?=
 =?utf-8?B?ZzZrRHVZaDBsN3RDdXVTNHRQeHA0TUR1cnBtamtHak1oaHF4Q2pqdkJXbnhW?=
 =?utf-8?B?ZFVSTEk2dk9QUExLeHdiRDdMZUpkVTR5ZEZOYUZ0ODVKNnluMnc3YmhEWmVM?=
 =?utf-8?B?dXc4MDdEaGJ6ZHhiRTNieVpnZ3FaVTh0dG5naTFxZnZFaFAraFpCLzBZTkRS?=
 =?utf-8?B?WGxVOXc3M2tIcGZIaUd0R1gydzVjVk8rd01ndllqaHdCdDRIRWJ3MmtPdlVh?=
 =?utf-8?B?bCtvdjFWSDdiQlp1Q3A4RXhKVUFmSUt1YWdZN0cwWHVhbkpya3VTd0NITXdz?=
 =?utf-8?B?TUtPc1RJeGhPZWUyRm5FckhoNHNiV2V6QWpwNU5IMGRSYkZnQ3NoaEtmNi8x?=
 =?utf-8?B?V2k5b3JQZ0JoSFIwWC9uaUFOcDgyUkdpdHQwaE1jekJnZm9pR2cxOVJaRE9I?=
 =?utf-8?B?Zks5VFJnMVV4YzlZc29BeVlsMkJKSXh6aDBlRXdiN3VVZWVreTVPdmlGd2sz?=
 =?utf-8?B?aTk4S3Y1TXZtQUNPczcxVEhoMzl3WUYzbnpCSDJReGNYOWIvbHJvMk5wUEJU?=
 =?utf-8?B?QmpNV0VSK09jV1lKbGNhMFBhR1BIM21NaDZ2YmVJZ3BTSmtvdWthb3JTVUp5?=
 =?utf-8?B?RDBpQW9seFdIcVV4UTJEUVRuTEZWMUpFbG8vL09GNFA2bzZTRVdzY1BIUk90?=
 =?utf-8?B?bTF1eVVLbGhYUkxCZko4c05vK3RvMUhHT0k1cWNiZXh5ZVJrSWtVM1IzaVBH?=
 =?utf-8?B?YUZzVlZlSDdBOWU1cmNyOURZMzJvdnVVMWRyOHFHcWduZ2pSN2pWeXNOY1di?=
 =?utf-8?B?SFYvdG9rVWpLQzdId0RNWHpNK0lmQmNITGtvSkkzazQxblhZVGs1ZTU0ZzVs?=
 =?utf-8?B?YkovcU82S2N4a3hvYWNPZXNPVlVVM1VzNnVXSVlmdWp1eGRpWXpzbmVOVE1G?=
 =?utf-8?B?WVU2bVVDWDZQWUVWQ1JZeTdDVnMrWGw3d041UEpVTUoySWY4a0NPZ0IvdkhB?=
 =?utf-8?B?MVJnWmZUSnYwNDFTU3RtaUs4M3hhSkRYeDd1UEhwSHgwazhUN3VuR3pvNHlY?=
 =?utf-8?B?ekw0bVlQeVV1bkRIR0xpTW1GZVJJOVpaU0V5NDZjKzlwVGdDRFQ5endrS0Mr?=
 =?utf-8?B?eENvNFJkSUFWTXM3MGRsZWxEaTZaQ21yd0d2NEZiMDR4azlldkpvKzlleVU2?=
 =?utf-8?B?azNocG5RYi9CcVY2K0owcEtXTWw1QVE5cjBMMnl6blVPWi9BcWk3SktFcTJ1?=
 =?utf-8?B?Q0dRdXFSa2J1Q0txczhwa2JoSHp1eXlxaDJPNDJwVFhyR0lpS3BZZ0o0eldW?=
 =?utf-8?B?UWdYTGRQVkZTNktxam5URDMxQmVjRTE5b1c5SW5jeXBCVnFLYU5zNjJQaEdu?=
 =?utf-8?B?czRrZ2V6SXFPWUxIUHdJbnRBc2haMUIzKyt2c3NPWmU0eGgrc0tHc0h2bWNo?=
 =?utf-8?B?Z0taT0dzVCtHWUNLMnIyODVnMUR5eEN1eG12bEVqaTV4RU5WaVpXbjlhSVNW?=
 =?utf-8?B?TThMQ05Cc0Iyd21kOEpTUjNybkdXTGhtMFZGM1Q1S294b0pkZ3EzRUx1d0xy?=
 =?utf-8?B?ZVlYWFpyM0E3TzZYSU1IbGxpS0d5emNDZUJOdzhCUUM4andrL1JGV3VrUDBU?=
 =?utf-8?B?TmpaVi96Lzc3dW9HQ09jbFBrMURFaGhNRWh1RU93UXdnM1hkMVhkQXc2T1hk?=
 =?utf-8?Q?dtf0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUEwM2VOWTlhd0VhUTB2cGcwSlpNWjExMTNTTkl4bm9ZYlZxSmRTT0R1akpJ?=
 =?utf-8?B?YXJlU3o0NXYzTUI5dUVYOWRVcXpsSUNMM0lZYnNJdFE0aXRlbXExTTVBRXRP?=
 =?utf-8?B?d3ZkalBialI4R0IxVU9MU0dHQmZ4azg4TWVveWQ0bXNnbVcwYU1BYXcvSmFU?=
 =?utf-8?B?MEZsc2RndTBMQmo3ZlFrbFBycmRQZFdUekI5Q0tXVi82b2pMUjB6d2phTjE0?=
 =?utf-8?B?VXY2Zmt6VzR3OEF3RmdtVjdTc1pRSnpRNHRkMXJOenIxeG5jbWZSUWt4Rm9l?=
 =?utf-8?B?UDFkYUNjSXJtdGozZzNSRFdnOCtEdE91WkcyMTI4Mkxja0ZZcHBzeWIvSmx5?=
 =?utf-8?B?dU5HUmloSzVGM2lNclNYdlp3VFQ3bGdUQVBGUnFWVHJYYWxWanBsV0VlT0Fp?=
 =?utf-8?B?dEo2Y2ZSUmZZTkJka3Q2T1ZVRER2S256VHdma1ZiRWRLeVZ5WHEzazJjNms5?=
 =?utf-8?B?NXNQaU90cy9WekhIK0RCS20xQ3g1MzR0S2M0L05BRzFvSFhaN1RmNXFqSUJj?=
 =?utf-8?B?dkxxZmphZVJ0KzM0N2pDaHdkMkM5Q01DK3MyMUt2RlVHeXlhZjNYOXQ3VkRq?=
 =?utf-8?B?Yi9LT1pkcTBtc0NCNUpRRjRxSFpCUmdId1FhTnZJYU53ZVZ6dUxNdXV3QUkx?=
 =?utf-8?B?dlBEeHlQcHdQaCsxdWIrM3c0RjhGYzFXalEySkdyaUl6bnRaZkFCZk9XaGZ6?=
 =?utf-8?B?QS9POUJKQ1NJb05PaC9yYllTOWxGd21aVkRVeVNLbTV6dkoxdmVvOHczaU0y?=
 =?utf-8?B?NmJpTVZFblRHM2daMVFLc0d2aHNVemw0elFuakRjb1pCa3JMc1VMMCtaSTFJ?=
 =?utf-8?B?U0d5NGl5U2d6NTNvMmFZaGxvZFZibnEwTUdaNXdaaUxnQysrTHhjK1dabVJ2?=
 =?utf-8?B?T2gwWS9pNzhHa2x2OTZMMkVOT1ZtZ2hRbXBDamV6S0txN241TDZ0VURQQ3Vr?=
 =?utf-8?B?TGI3UldIMUY1b1Bsd2FqQ290Nis3K3lKOTBEUkpTRzBwN1hJM09nUCtXZkda?=
 =?utf-8?B?VUY1aHNldGpZb1B3Rkd3b05kMGJ6M3dMNVAzSzhNWm9ra2FyU25jYkhzZ2FG?=
 =?utf-8?B?TUwwRlAzZVZ3Z2FSRTVJRUhFbmRnczYycHVFSDFsRzZoVEphNE4vMFA3ZkV0?=
 =?utf-8?B?VUFoWlhOa2ZrK2hxanBJcWNWQnlEQXcwaFRLbUZUZXNGcnVWOTlvTXNJWXlK?=
 =?utf-8?B?MGljNFM5VGFtTXI1MFFsYVRNdytIU2JlUzdJMUhyTE1YaEVCT0k3MkxEQmtZ?=
 =?utf-8?B?OTg0K3VrMUJWeWI2aUY1TWhLNzNhVUd3WTRiZ3N3WktDVWU3aHVrbWFVaDVI?=
 =?utf-8?B?THN3YTJ6ZStsRnRZbjNzWmdXNEo2NnhoYzJmb29SNGx1dU1ERkxMT2NQY2hi?=
 =?utf-8?B?M3JyR3l0V2YyTE1uZm9pZUtmQytLbXlqdnNrdzEwWFNVLzlQTXB3RG0zblZD?=
 =?utf-8?B?WGJBejlWU1k5NjFRYzFTMHFUMDZiMy9FTE9IclNZLzBhR2xvc2tCQXZESjJ0?=
 =?utf-8?B?YnlNRjYxVGwxQmZiLzBjVDB3bTJXdzd1LzJ6ckNXcndmUjQwUUQrOGM2aGVh?=
 =?utf-8?B?UVVSMlpERkFGSzkyalpQNjh3NDBaaUNFeGxKTXArZnpmRE8rN1NwRU9Qa3JN?=
 =?utf-8?B?TkhKc0lvYWJJK0RHcElkUW9LSFhmR1JiTUw4ZW1kRnloYXpXSkh1TUE5TzJy?=
 =?utf-8?B?N3FiVVR2WlZTSHB6UnJtOHlmL1E5L2xoNENtMjNyYnJNdEt1bmdnaVN0dE5N?=
 =?utf-8?B?NE9UMG1SS1hscTk4NHdUdDBYcTNrZlNYdndab2R0aC96enpsNFJHMnlDNkNq?=
 =?utf-8?B?L2VlZFR0RmpxeFByODEzWjBRNldvK1oyMng5a2htNzFpUk5TbkNTR3pQWVcr?=
 =?utf-8?B?SXFqYkhSTW9Cbk5Dbk5BdFFoSDJRRTVqU3lXRFN5Z0ErVzMreS90V2JqWURC?=
 =?utf-8?B?Z2J3UFpEZHVTeVFRTVhiMEhTakt3UnIyNUNYNS9vMlJSaEx3UUcrdUM3bms4?=
 =?utf-8?B?TnJVNmNkSnF0N0xuTmZ1SWFOQ2hUcmlTTlJKVFJRZXFqQjk5ZC9ld0RxT1pD?=
 =?utf-8?B?OVQyRU0xWVAyMlIyWUROSTE3MytOWHNJcE1hb3B5cEdvT2EyMUlYLytVTm90?=
 =?utf-8?B?YUVPcFRmcDYyNkNnOHFSZ3BHd0M1ZTZLSDhzYnZxTEZGRG1ORkkzZjdoQU9z?=
 =?utf-8?B?U1A4cVlPK2JKSUpyN3hGMllBOWptSVBjR3BQNEpXeG41dzJNRm1IVHdleFJZ?=
 =?utf-8?B?RkorY2dBenZOOC9CWUMreFRESWU0U1l3N245VzJIeHhHRXR3U3JySXpJYXdP?=
 =?utf-8?B?UEdJMC9hUVJHZEF2L3ViQ2ZnVnprSE1jR3BqbXZGSHlQaGZxSmMxZkh6dWNO?=
 =?utf-8?Q?EBjJ2bOuEVeS6Msl1yLTaUGaOydmOZCBjV4vT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f5516aa-ee89-475a-2392-08de67c4651f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 10:17:14.2508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mv5ZsrGHYjelWqMvfWF1M+hI069pP7LoIqzt8AfJo9SgRuu6GKC39vayF0VIlMlh6em/z/rMqhWe5gAHrApIi036v21qIdrlYKgyYnbLKU3rVLThyvkZqGbQy+i/mNwp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6454
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

On 03.02.2026 14:52, Raag Jadav wrote:
> On Tue, Feb 03, 2026 at 07:16:08PM +0530, Vivekanandan, Balasubramani wrote:
> > On 02.02.2026 23:37, Michal Wajdeczko wrote:
> > > On 2/2/2026 5:53 PM, Balasubramani Vivekanandan wrote:
> > > > From: Soham Purkait <soham.purkait@intel.com>
> > > > 
> > > > Add check to verify if CSC is a PCIe endpoint via pcode mailbox
> > > > during xe modprobe. If this mode is not supported, an auxiliary
> > > > child device for the MEI driver is created as a fallback flow.
> 
> ...
> 
> > > > diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> > > > index 85cc7478b787..391a98c8b5fb 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> > > > +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> > > > @@ -35,6 +35,7 @@
> > > >  #define     DGFX_GET_INIT_STATUS	0x0
> > > >  #define     DGFX_INIT_STATUS_COMPLETE	0x1
> > > >  #define     DGFX_LINK_DOWNGRADE_STATUS	REG_BIT(31)
> > > > +#define     DGFX_CSC_PCIE_DEVICE_STATUS 0x3
> > > 
> > > shouldn't this defined using REG_GENMASK ?
> > 
> > No, it is a value of 3 not a bitmask.
> 
> Then perhaps it should be in ascending order after DGFX_INIT_STATUS_COMPLETE?

I find the convention followed here is the macros are defined in the
increasing order of the pcode subcommand value. Return values from the
subcommand are defined between the subcommands with an indent. I will
format this code block to match that in the new revision.

Regards,
Bala

> 
> Raag

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A18FC02198
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 16:59:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C44110E090;
	Wed, 12 Feb 2025 16:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJBUqVuJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5670010E00B;
 Wed, 12 Feb 2025 16:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739379595; x=1770915595;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=FTxp7QRtjx7Y4w5KUCV0B1Jc51yYZCK7Y0iy1nGXtzI=;
 b=AJBUqVuJE7Nh2pDGK3RiWR0miFjYwI7OsDjoXYiQGJejWQDuorsgeAHF
 JZlEu2DtupJK1K/cu4R6+3tFVa9MAxMZ1//ievwJJDLmCh8HwtLaL238/
 iWkPTmvjk0e4cUnSqRTHXYtiywnTygzWVGzv1GZsxZDwQcr2iXBBeDx9g
 i6lTEw8z/F3uPRUgHdhkSfETckAw2up2gw8B7DVG0O//x6OSiCQhUFOuv
 ZDQhhVp1BRcdjSaSD+lnhb9btQLBgqkanT2728G8kkmnRfKJR6YGBp+QC
 tVVeIBCSFU/fBL/Yv3AcqBMmbG4zwSUa5fWBQWTJYO84bzJju07qK8NHH g==;
X-CSE-ConnectionGUID: nKMxAOBrQLSicJcSKLlapQ==
X-CSE-MsgGUID: dQrhkaB7SxamKFziF16eoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39932153"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="39932153"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 08:59:53 -0800
X-CSE-ConnectionGUID: TlJoQK/0R6KbXnKUa244/Q==
X-CSE-MsgGUID: RxPSHmXYSWyxBhvWN5thfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="143722527"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 08:59:54 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 12 Feb 2025 08:59:53 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 08:59:53 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 08:59:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UpKjTtSgHoeRfmazO3FDCD8EP7cS9iOe453ctx+Wp5yNBsVvglr3zYaSLP2+Jwy9WAcyzy4igvpxAZpJbIENmunczUxr+NwdgVApVTkxP6spusytyBR5M5WsubxtSZoXBpmEIqeqj6InsYwR5iod+bTBuTu4HzcgHpjGI+UM0IeRMnUgORw5SQwcITLGYZsAUbiq/9E5xr+5ZlRmzpteWsgS1wPa5/RIqgcMKqBUf5tfmvFxw654jHbkG1+SrXPJqaLf3BJPpv02r3+L2GtJ/qZsUYTkyDm0PPWqNhlsbgCNf9EX5fFTjw7U1syaD6H+K8+mKaAjXSIuaN/wr4Y+aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TI490EWnv/SKJCnatd43mZrvzliuoU6iYHT88F4h78s=;
 b=mjGdU5fmm2+U8L2Z96bOp1xd5UlwnugJBQ79sauGtUZpecUry0ZxC7wXjqrW1DXEXMvGj3aTsvP9yy4C5R0s0Q9xd8TL+wTjGAn3Du7IevphCV7P0A0vBBpuZAA4yB3N+hUjTxdhIKoG8e4HqDYO/a32NDuP1e1msZaVKQFw33IaLHeMdhFTAejoQdcGnpAUyQxTBWqwRI41KYYVKdobX8zvbErO/hBD/FpKj7tZf7O9XAzGaYtbzx2apAVhpCaOvItlLH+F/rPzLIMZNThZDc5oltC06b7nRKVVnzprLb7I0hVLS4sjWzki3Lq0lCUvsuha45MQdJyIwKSJP+Zweg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 12 Feb
 2025 16:59:50 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.8445.008; Wed, 12 Feb 2025
 16:59:50 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <173937676007.1347988.12791820742293922574@b555e5b46a47>
References: <20250212132658.323640-1-gustavo.sousa@intel.com>
 <173937676007.1347988.12791820742293922574@b555e5b46a47>
Subject: Re: =?utf-8?b?4pyX?= Xe.CI.BAT: failure for Improve type-safety on
 POWER_DOMAIN_*() macros
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
To: <I915-ci-infra@lists.freedesktop.org>
Date: Wed, 12 Feb 2025 13:59:05 -0300
Message-ID: <173937954545.145254.15387044598135714895@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR04CA0044.namprd04.prod.outlook.com
 (2603:10b6:303:6a::19) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA1PR11MB6098:EE_
X-MS-Office365-Filtering-Correlation-Id: 512dbafe-e5a1-4e48-45de-08dd4b8692ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dEN1R3FLelF5WWtGYWZ6a0ZYK3dVM0RJRjd1OXQxSGVIZXN5MndienlKQi9r?=
 =?utf-8?B?SisyL2NDVDcxNVhUcnFYU0tERVR2aFAybnozMW5ZRVdWOFVtSkF1cXNNblc0?=
 =?utf-8?B?RUEvS0N3NmZrTmhVSGtjVHJSTEFDL3VOZzArcDhCMERYZ2dPV01JWGxHTGxF?=
 =?utf-8?B?T0FMNlRYUDRUNldhclVkdVE5Q2Fad0dvcm5tLzlOZXJxNW91S085aDhMZXNQ?=
 =?utf-8?B?czNnQWJ3dG8xRTduQmhxT0V1UkRjVlg0UWM4OFJ6Q1p4WjIwUUZzSktPcDFS?=
 =?utf-8?B?V01KaUYzeFNTQVk5dTV5c1phOFEwZEcyK04wWWVIdXQvKzJuNXc0RHhuLzE4?=
 =?utf-8?B?Y1diREVHbjFqdGw5VHdQOGJ3bnEyeFJjcFhIZ3g0MWJqQW1KbVBwSFVWbnVo?=
 =?utf-8?B?d3Q4VmFVaGcybVZjQTZEcG9ibExFc1h0bGJHWElSK2FrbFFHdkVzblo4TDhX?=
 =?utf-8?B?Vm5qeUlVNGVVYkNLYXQ2YnIxTWNjZ1c2WlllSkY2K294dlFuUEhFY0U1VWZS?=
 =?utf-8?B?MWo5Smk1amNRU21UZEp2UWhsdnl3K1FrZWFQVVFrK3NtMXk4Q0xCZjVtWkxP?=
 =?utf-8?B?THVNNnQra2dKRUdFWDFQSjJ6Q09nSXQwZTdQRllqQXc2WmVTNGs0czlDUHo0?=
 =?utf-8?B?cFRTYU00UnJFMDlGQTMrMldIb3B1M2dxSkZHSGFtMzlGbnhXS3NNSDc0OEto?=
 =?utf-8?B?SDdRdUpRSmpzUVB6cHZEREVPRDE3b0poeDFSbnpVajF3WnBVVndEM2lFSzZT?=
 =?utf-8?B?NmFWRWlYemo2QmVjQnI0OXBLZVJ6cEZBMGVUV1NzTkE2enRYaU5YNStjWm9X?=
 =?utf-8?B?TVA4eWcya0ZIRHJDN1ZBRWZ1S2V6bkZDN3R4VkdTdkNKRTdZNzZ6Ynp4UjdD?=
 =?utf-8?B?a3RQUzZkV2c0aE8yU1VSVTViL3QrNXVRdVJZM0ZXUExmckloSTFTMVAyeEgr?=
 =?utf-8?B?ZzJzMXNHUG53VmJjblh5RkRLQ1hZbnRHUFlubkJUVU1MZTJ1THVNNlJwSjlx?=
 =?utf-8?B?ZzgvK3Q5RUlNK1VOeUVLb2RnblJHWklGKytSZXNFTFhvZzBlTm5iRFd5Mk1D?=
 =?utf-8?B?K1RkNTVHQmFjR1JCTnJQclB1cGgxUTJNYmRwMkVYaEk4RGc1OGx3SExkU0dr?=
 =?utf-8?B?M2tqNWQxTUpKUmtNNWs4ci9hMWhjd3VDeDJVeGF2dkdQK2ZOWEpBV21ZQ293?=
 =?utf-8?B?Slo0U0JKMnpHY213UVpvOFJvMi92QTdvRDIwemFMSHo2K1dWK0NIcWpQV3Z2?=
 =?utf-8?B?S2Nxb1I3dWM3WmZSNUYyZExibTF3SS9Oa1FYbjFscldVdEk2MkEvd3lPK1Jr?=
 =?utf-8?B?OGxZckg2L0JKUGZwTW5hMVo3elBPN3B4czRGajZSMHJjNGlybFlhUEYwSERD?=
 =?utf-8?B?NnF4dzRSYnZ0S0NCYWlpVnZMMFp4dXVWc2s5bnpEd2piVm5PR2l5ci93Mkxj?=
 =?utf-8?B?YlE3Y3hRSEl0OVRFS3FKSEdXb1ZEWVpXY2NvRXBvMzNrSGwyQ1UrZnVidTFj?=
 =?utf-8?B?V21FWUo5Vjc5QmhESlJQNStwRG43RWlGN2cwc3loeml6d2RxQmVoNXJscWFu?=
 =?utf-8?B?Zm5jMHhka3R2OFRSbkFFRGRzNjlsbDNFWTc2alhpaHNLeC9RNVlQOFUzeUdE?=
 =?utf-8?B?K3ZCZEt5VXpYOG1qVk45aWV3dFN2czEzdjVrbmdCRmxydlZRQWg2TktiaENX?=
 =?utf-8?B?QlpDQ3Y1L05RdlBvNUN0U1hST3R4Y0pzRDh4MGtpaFhQdjdmVnphRXg3Zzln?=
 =?utf-8?B?R2dXc2xWZzJjUCtQd3BROURQUy95Rzc1a09iVnhJZlZWd1YwdE80bXNmNUtH?=
 =?utf-8?B?MkF5RkNybWp4dXZUTE5Wdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWk3M3l0aFdQQzBYY2t5V0RBU2dqUk1JcVg5cTJTaExYUFhmampFcU1pN0c1?=
 =?utf-8?B?VU1LTVNxSTEvd2hlMER3a0J3Y1c2cUVEVDJmVXFzdXo5cXY0SW82a1M0MjNK?=
 =?utf-8?B?WXdLRmlHMmFkWDJ5TU50NzE0UjlkOHFNYUgzNW1ZWUVuOFkvV0s0Skd5Zzdw?=
 =?utf-8?B?TW5yRHMrSzI4NUJ2M3l3TVdZckRGWnRPdW5mYmF6REVTTk1TUFd4UUZlQUpK?=
 =?utf-8?B?ZjZ6NWtIZEU5OTBwOHZ3TkVlQ1gvZXplbEcyVEpiSTZHVjg2b0VhVlpHS2w0?=
 =?utf-8?B?Ly90a3JGQ2NyS1M5djJwbVM1UXpTRXFxWFVHSjZPRE1pVC9LdENzd2RQQVJL?=
 =?utf-8?B?dzNlMkVLL1dnNlRuVlBGM1FDSlBUR05xT3N3ZXZiMCswZWpzRjMwY2g0WFpC?=
 =?utf-8?B?R3NORExvQ1I3R1JFM09EUVhlcXNwcnk1b21rMHRxU2g5TGp2bVY5Nk1IMWJJ?=
 =?utf-8?B?MnZmU2ZtZmFndWNjWjNmbi9GMVp6M24xcTN5OHpmK0I1Q0J1UEZSdjJkMlFl?=
 =?utf-8?B?c25JQU82SnlMaXVkZE5SSDhQNEk2cHJxR1pyYkdRS2dlVTc4djhPdDE2SzFR?=
 =?utf-8?B?bEFQUzRmVFExVGZvRk4wYy85SGhWYW9ncjRSMjU2cXFTaDhneER1TXBpUCtH?=
 =?utf-8?B?cGkvQlhsdGN2Y2RmWkdjbmZLWU5lTzAzeXNiSC8xMnkvdmg0ODNCZm1GVDZz?=
 =?utf-8?B?K0Y3Qzl0a1hPaE1PcUxpSWNxakl5TjRoMGs0bnBzcXd2NHZnb05xclN6dGJY?=
 =?utf-8?B?R2owOVM2NE5uSWRNbWZINE9BVW9PZkZRRlNhSVBMQ2ZTQkE3OGhtQVZFNVBJ?=
 =?utf-8?B?UTlPN2NvRmNnTGZIYU9wNk9oS1pyR1N2RWJVaXl5QTdBeWdPb2NSZFBLVjN1?=
 =?utf-8?B?RERUNzdkNk40Y0xLejBPN0owSVE5T2NqQ0lSb3c5MFZHRGtRNWUwVHlzcFBD?=
 =?utf-8?B?eW5UcmxxMFlXYTluUXhhbnFsczVDaytkOC9IbzJOdnVRMWlzT0d6N2pZRy9q?=
 =?utf-8?B?Ykk2VENUTk9xQUpYQTZTbzEyTklDUVZWdDRJdjlRNWNlZHRDYWIwMEZPWVJl?=
 =?utf-8?B?SWc4bG4wTVhYQWQyVGxnZStRUnhlNEowQnVFWllxSVpqQXBLbGlPN3YyR3oz?=
 =?utf-8?B?ak1yYUF3Ti9zYUJndS8yZUlDZ0ZmVk82ZWJrMXQ2bEhNdFc4TjMvL3hMQnBx?=
 =?utf-8?B?NEZKVUt4NmpOVXFqTE1QMDYwMThqdFlObWVlWVU5VlBpRU1kNFlTM2piQnRT?=
 =?utf-8?B?UmR0SlJRalpNUE5iM0QxNVcrcWpwL3ZzZnZsa09UN0N5aTNkRGRiQzVVUTJz?=
 =?utf-8?B?cjlZejYzWVM5bHU1YnJ5azBZY3JHVlRJNVJZcGNMc0t0YnRwTC91S2x5N2py?=
 =?utf-8?B?a3hHTzRDZ09rN1Znakw2OGZ3MVRHY2ZIWWY2MnZoVEFKRHRQUWNXUE52L3ov?=
 =?utf-8?B?cDJVQTdMNitGa1F6SnIyaE0xcm9nb0hGS20vUFMwSk0xbTkvb3Vob0U3S0pH?=
 =?utf-8?B?YUdZSWV1YzUzS3pja0lxVFJWVjRkaEdITzNRcTZwazRnNkczSzg4dWdjaWNZ?=
 =?utf-8?B?bTJJK3d6cmtSaXpjeEVndDBXaXptd1NFOFdSazlmejJrbjdMRHJEYWY0eGVy?=
 =?utf-8?B?SmI0dDVsdjQvOUpWL0R2L2xmOWV2UUN3RWxVTy9maGlRSmF5V3ZpVERHSDRz?=
 =?utf-8?B?Z05naGZhQmpxZFUxeExlTC9Lc05wcDBuVE12YTFRNG5NNkx0NTdWTmduZ0Jx?=
 =?utf-8?B?cTZ1dmhTUEx2cTl5cldLdmRPaWVRVThEYzBrZDgyeldEd2pMYnM0dVA2VlBv?=
 =?utf-8?B?ZUFuaUNVL2VCdklaSFB4RnI1WU9GeVRDU3ZsYllISXZzS3RiVHBYTXFMbVVY?=
 =?utf-8?B?Z0dSYW1BaThrQkkxOUpiTU5OTVRQTCtiWndiM0tqUGhhejFpSTBMdHd2VFRm?=
 =?utf-8?B?MkdXWEJYQ1NvdUhxZ3BwWVRUc1NYMzhKWXg4alJwYkMwdk02N25xbDhKMm1t?=
 =?utf-8?B?MEpEbUN5bU5vcmErWkRpd2k0dDMzNHhvRytlTm5kSGlWaCtDSS9KdjVHUjdP?=
 =?utf-8?B?UXU2emxVSk0rL3pjQUl3TFk2TmJtRlo5ZmxIN1RWZ2FTV2VXdDFLVm1tM0RC?=
 =?utf-8?B?T0twb0x6V0dKTHJoSjgxWHJ2dWd5YjEra203UGJYWGZvclF1OEc2aWZTbDNn?=
 =?utf-8?B?Tmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 512dbafe-e5a1-4e48-45de-08dd4b8692ce
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 16:59:50.3363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o3eMCmAExuwQSpT3uxHZTqGqsl36egYHUw6cMntpZDh09cu2ZA2ZtwKyD1o/xbHiJgm/UMhHkOIDVDqpf3NcSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6098
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

Quoting Patchwork (2025-02-12 13:12:40-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: Improve type-safety on POWER_DOMAIN_*() macros
>URL   : https://patchwork.freedesktop.org/series/144727/
>State : failure
>
>=3D=3D Summary =3D=3D
>
>CI Bug Log - changes from xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb906=
_BAT -> xe-pw-144727v1_BAT
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with xe-pw-144727v1_BAT absolutely need t=
o be
>  verified manually.
> =20
>  If you think the reported changes have nothing to do with the changes
>  introduced in xe-pw-144727v1_BAT, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in =
CI.
>
> =20
>
>Participating hosts (9 -> 8)
>------------------------------
>
>  Missing    (1): bat-adlp-vm=20
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in xe-pw-1447=
27v1_BAT:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@fbdev@info:
>    - bat-bmg-1:          [PASS][1] -> [TIMEOUT][2]
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2647-a05c910166dda7fc=
8b510e5c9771c3bed3fbb906/bat-bmg-1/igt@fbdev@info.html
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v1/bat-bmg-1=
/igt@fbdev@info.html


Hi CI Team,

The changes in this series are non-functional. This failure should not
be related to this series.

Could you re-report, please?

--
Gustavo Sousa

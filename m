Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCC3CD98C6
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 18:26:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C47210E147;
	Thu, 13 Nov 2025 18:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kGhGFT1x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540D910E147
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 18:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763058366; x=1794594366;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=QbaU95QyuMOyNfXanDuktcohKlulJNlHuyUt8HtubaM=;
 b=kGhGFT1xGc5pY9ltFLEYAJVwFL6UetQDitS9E5xJZEY8+SU4hQ3NTKau
 DyjfTK6afvc2Lh6b+aQLcqnFZUVcgPoUSuIDowI/SYS/1DGm+s4IcWjdi
 aR3Q+QNiopXgvAn1OwDBGji2TFhr1WBz3z93fQ5sWsc4UbbqIJuQ+oeOH
 mFiUwoIPNjYrIRO4CIXR3P5t7oTRBpmqTsaXYpjsQLdbcL+AZoTlHem1Z
 uuNPwcmydUeTqIGVWI8HndNvFV03AnN+S4SKpvofUIQ5OBGWCdh9qdYkc
 WSHPNTuIZS/avI9vjDvHKRmgau6uHLqqnh7yakhll67Ko+3S11GTKS3IX Q==;
X-CSE-ConnectionGUID: 5U578l3NRs+HFUM6Hj2jTg==
X-CSE-MsgGUID: 7ZbIqnh7S7GCZb9SUPm0rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65244399"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="65244399"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 10:26:06 -0800
X-CSE-ConnectionGUID: EH+kjJUqSTanumV3CRZXEA==
X-CSE-MsgGUID: WneET2BfRfasZY65iWlPLA==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 10:26:06 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 10:26:05 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 10:26:05 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 10:26:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hDXyDAVEBEEL0Sr1K0dcWEH1bPe0nOgSEkQ/7sN7Jf39SFSaufnPbwyrTq/wgfVWby+HIxzuIgPcuPqnwglT2pQvsfTkj+d/BK3ix+0NacCQNeiDB1kubUWFjOSxvxIvCzJHrWPewFPojcaZ4Zh9KVb4vaM80G+Rbp2wKrrFZwFlksiSTcn9QzGqSTojcUgkboRA4s9UhKzjdrP4tjpr0khVBId3E/zjBGg4POWptOpwQKENjw3q+MhJS1A5zxgWrfDEKHNIpT5APJ6WAgvuy9rdrPVVWVHr+DcZI9V6//BdUmxkXXu+QPe5WerqNHw99B2iLcxZM24ZZQtemM1SRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSxzVVV8C3r9rPGSwN1dvOnqxh7f4HMsOLWnDHLGhxk=;
 b=cIZ0PZ+ORAl183FtLdJvtQJRGlGlWkgeV/hYbXhxtRa29oYATohWVqYCnai+A3WYtTB4k6cpNV4TrLsB0Zc7i2+p5OSzuq7xMHoUKZwY7qMXp86JiHT0oexNOsQ4D3KuJKruG12+Rfu65JXflnMrihLM9f7Jd5tQQKAEHX2DsjgYkGciyWvdHs8lfYXoena6MlLkUWXDNcozO5kvujbRTbwv4ufIDkUziYe8GdBg+jCtWTWnXufNNGfEZ9VcAZJZ+7HWwMV6GxLhq5MFzUK+DtFNMWRWmwdR9sTauDveFQ6Igh0/RPQB1S/XgzSUpfXRNODFVvxpDZyVaSdxxVSxPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS4PPF1DFB73954.namprd11.prod.outlook.com (2603:10b6:f:fc02::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 18:26:02 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 18:26:02 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110232017.1475869-61-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-61-matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 29/30] drm/xe/sysfs: Use scope-based runtime power
 management
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 13 Nov 2025 15:25:40 -0300
Message-ID: <176305834030.3698.9234090232327711230@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BYAPR07CA0102.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::43) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS4PPF1DFB73954:EE_
X-MS-Office365-Filtering-Correlation-Id: d6c904f6-5c09-4c5f-771b-08de22e219a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ui80dEZxODhmbW91Z3l0RTV4eE5sRlc2L08wbTlENFpjMkVFczhqTklyTGsx?=
 =?utf-8?B?cjgxUHQrdWszamgrRVBBZmV6cHp2ZWNpSGcwVkhDcllET05qZ1JnOFIzS3lm?=
 =?utf-8?B?dGRYQUg2eHdvVFNwWjI4T05sTEI2WE53QTFlN0FnRGtQd3Nwc2NWNXRsdGdx?=
 =?utf-8?B?YWppQ21BdzNUdGFCTnpqdUliUHhvTnV1TUt4b0pPaG1WUU5Hazc1aUtBdjJR?=
 =?utf-8?B?bytrNUszVHB0b0tGM1hUUC9xeEJrcDJsYk9GTWRYTWJQMDkwbStNelpoQ0V4?=
 =?utf-8?B?RVg0SmFvZGlONWxaYk1Rb3l0U3kycVJMVkNLci9EbWdvc0VZUzY2aWVuQm1y?=
 =?utf-8?B?b0hocEkrOHM5eGxoczhDWURQRzVGd0VMUE5hRnNxMkk1K3U0blNoMERzUEZ6?=
 =?utf-8?B?Nk1MMmgza2pmUXI4cTNHR0FFQU9tSzFyVm1SN0JkeTN4SFEwWERPUWJaSUNr?=
 =?utf-8?B?Z0k5Rm1oZm9QRUFtQXJSQVdBZFV6cXZBZ09yQ09adTk0UTVxMEVhNDkrQXFC?=
 =?utf-8?B?c2UvdHMydUlPRG1jU21nYmNrdnlrOER3RHJIZ2QveGMvY0dZRnl2aWRRL3ZG?=
 =?utf-8?B?REJQb3owUXR6SlczZkJ6WHdkT2R3SlJZT3o2T2xaTWR0N3R0R0lNamFGZ2lK?=
 =?utf-8?B?TDBEc2Y1bWJBWDM3WkZGK2l3ME9Ma3YxU2Q1Mis5ck1wODFTb2xWV3B0K2w1?=
 =?utf-8?B?aDFNQ25yODZqeDZBRlBTYlZJTlFWY0F6VWZnd2FsZE5JN1Ixci9lV0dldTR5?=
 =?utf-8?B?VmNMRmJCQThpU1ZTaTdpR1ZUM3c5SjgxMThBajFWWmRkaGJjaml5UXU2aGJQ?=
 =?utf-8?B?V2hiNndLUW9EbmE3ckJiZVkyWmtpc1NwZEpnQnRmSy85c0NBRHpZQWdydTNa?=
 =?utf-8?B?SjNWeXc1OFF0UGxTbEI3Q3NaL3Y3cm1mK0pVclM1bC9wL0liTlQ3VGQwZEtq?=
 =?utf-8?B?eFNSYmtzblBta1dwdXRSaWRwZlpETkpEbEhUWEFVVWNhV2hpZlRnNHlxT3E5?=
 =?utf-8?B?amI2SWcrZHJrR21WVEpjYlp2MUtmWUV0QWFnYTJtK3orMVh2SS9Ec0FyeEk3?=
 =?utf-8?B?TG1PTHVqVUdTalZrNXNrQ09PRzNnbDZ3bmtZMStPa2NYZTlPSUJDNHlVZmpp?=
 =?utf-8?B?Vmk3WForVUFnL0pyY3hXK2hSQ1NuTFlmbGJxb01vSFczczJGV0ZGSE9hUHVH?=
 =?utf-8?B?TGhteWt0dDEzL0ZRS1ltZ3VnKytzRm1FeEYzL3I5U1BQSDg2Z2g4TkhONlVz?=
 =?utf-8?B?TisrTXU5NHFXVmJQOEx3Q1BRcFZTcDIxVkFRS0ZwcnZjT3FVYXRyUnR0RVIx?=
 =?utf-8?B?cjdMenN3UGtLSklBdm1LMHlacUNJK2t4ZmRWd2NncGIzQXpwYTBMRy91U1Qv?=
 =?utf-8?B?d0pMNGt3NU9qMUEyUCt0NEQzRXBaR2o0NmJQOURZK3pqZVVJSHN6OTFFeFMy?=
 =?utf-8?B?Nk1XY2hpNVhYVWgvWDVXZ0hMUFg4Tmp4TDNMTU9oMUM3dnplbUhTaFBJU1Nz?=
 =?utf-8?B?VDIvY0I1aTNYd25MV3huNXllbUVXL29pbnUzeUNBM0F3S3MzZXZGcGRvSTVl?=
 =?utf-8?B?WkY4Vm9kUXN3dC83d0FRQmxIcEtyeG1HRzNzRWxKMWRHSWV6cXlyU0hieTNO?=
 =?utf-8?B?TGhxTXpCVE03U3RsVEZFdGhiK2pjQXpPQ1ovOVQ5SHU5cGVsb0s1amp2R3c5?=
 =?utf-8?B?aXY5cE0waEszNW1jNTNTaFlXREJzR1ljT210WmtwWTM0QmZ1b2IrUyt6c0hY?=
 =?utf-8?B?aGpUNjNwQ0lZRzVvczY2am41bThXL3hOaXlnUFhLY3BwTTNvaEh6UHErTlBW?=
 =?utf-8?B?UjlFYkoxSGRaREVrQ2pyb2xMRm8zSTR2emlXd0FmNHd3TDBTaHBGbUNUWDFN?=
 =?utf-8?B?NVNvTGFSVXF1QWRQbHNLRENuMDdIa0pVSlF1OVdBY0lCQkUzUTRVNkVYZERU?=
 =?utf-8?Q?rc00vWsjtlHaezPyjm3GhPKLURjOx1I6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWRQUlJRczljV3RYV1cwbjV6c3VGcnlOZXpYSVRmcm5aWjNWQkNLdENoelFl?=
 =?utf-8?B?T0RzVHFjUDhnZktjdVQvcGJock5sR1MvZVd0d3NqWmJFVFErOG43eE5KZlNS?=
 =?utf-8?B?Sm82NzJkQXgxNUlPSFk1VHpRUlNKVkUwSm1LV21pT2RWWXM3MzVpaFRWQ1ov?=
 =?utf-8?B?dnVMUllRTzA3SlNSQXNhcE1hQ1dKeDFIZzVRWFlQOGpHU2tRMmVMcWFQK01z?=
 =?utf-8?B?QUljSDNaa3BHL24xdEpHbG03U0VaNzJJaUdBT3hZZmRRaXlKRnIzZllDazFG?=
 =?utf-8?B?L1JYa1o0QjJyd21tejIyUXhEY2U2Umo0Ui9MOEhuQWZwT3dyTklETFpqSGdC?=
 =?utf-8?B?eFBXb2NnZ0M1elJ6WFdPZFJzN29VSS90VlNWdis2RENkaWtwb2NYVjZycmNm?=
 =?utf-8?B?Mnp4VDVxNEZkcnJGNG9icnp3TTBDSitURnErc2dUSmxJSzN5UHpidGNsSGY1?=
 =?utf-8?B?eG9ETW9YSVRxVnRYUjJxZExMTytHV2FJeHFnUDQwNVEzQXpFOXZzSVlHNmJE?=
 =?utf-8?B?ZmtTK2IzbVZwTDlwN1ZaeXN5NGlIWU1lTkFlbnAvZi94Sm0xRDRESTA2YXdM?=
 =?utf-8?B?Ui9iUDRkUXRaUTFHVGVhR1FJUHdQcGppVXFWZlRIWFYra0NVa1l4dEV1UzA0?=
 =?utf-8?B?Vnp1K0dYQld1NU9wYmozbVF5ZWRKVWgweVdhZ3lyOENhOG9xM2ZsSkZZMHIw?=
 =?utf-8?B?R0E4M2R2cUdsM1lvdm1kblRwWjByWUxtOGRpTEs2d1Nramt4T0hhdnZndXdq?=
 =?utf-8?B?RlN6MWE0Q2pYdDdWN3pQRmQ1NU5ZNUxWc2VnQS9RTk9sNUF0Smhzby9CU0Z3?=
 =?utf-8?B?TnhlMHJKRXpNOExBZzFPL1dGQ3FyMWJSR3d3VHpXRGJDbzh1bWdYQi9vckQy?=
 =?utf-8?B?Mkg5MmFkU1IwdWQyekwzWGYwdW1ONW02SmJJTEtvSTFDdk4vS1AzZlEwZ2J5?=
 =?utf-8?B?VmJIUzhmS2FWU2RKc1ZzamEwYzNCSTFrdUF4S0x6NVpFbTdyVEZJdFRoSExO?=
 =?utf-8?B?OXBmV3NzcTdMU3NTYlc5L1IvVTBsNTNsK0ZLT2llMlUxamVYd091cDdIc2Ix?=
 =?utf-8?B?dEMya2dYcGVsU0VVRmpVQThLSG9hK1ViV2RZUTBOY3dWbHhWdjAzcTNibXRW?=
 =?utf-8?B?enJDay9PU2VkNWVKanBxbUlUVkgwZ3JWL014L2UvZmc0bEtDYXJXZVY0WVRW?=
 =?utf-8?B?SjlPQXVCNzFZNlJxQmFjYmNKYmxQZldEWERDMmRpSXNtMVUxdVdPK3VBa2p4?=
 =?utf-8?B?eFhMMzFEbjIyc0VkOE92UEQ0Y09PWURMdDlUaFZlai9aVGk5ZDdvSVR1TVhE?=
 =?utf-8?B?Ulc0QmUxQ3MzdWdZZ3d5bzlXb0pxTzV4RllrSTArSjlGZTRaQ0dIVVd4cjhz?=
 =?utf-8?B?OW9rbTZTbkNmY0hRMG9BMCtvVnV3VHd1dzNvTFhmL1JWY2tremI2ZFdmNlZ4?=
 =?utf-8?B?amJTM2YxMjhsUUdCS0RMVTNKNHd1eEU2NXBLYzBUK2dOb1FDWjNRYzVkUzRv?=
 =?utf-8?B?ZzZjYVc4U25pY3dWN1dURVEwQlR2bktaV3hWVzNldVdXY2J4Mm8vK1MrYTRJ?=
 =?utf-8?B?UmRHc2Y0K29VbG83WEFCRUNVOUVkZXlmYzlkQi8yeVVkSGVLTklXZ1pna2VB?=
 =?utf-8?B?NnhyT3FsTEs5U0x5dERLSm05WVhpTFEwZ2JWajlXWDNJZlB6TW5aT0o0TzNq?=
 =?utf-8?B?cnc3SERSckgzd2FoTXlKNU9adUdKeitsNGt2NnJXUW1PME54R2NpYjhxMXFF?=
 =?utf-8?B?V2hGVHN4d0lPNDVPMXRyZG5pS2FQNWRNSFhEblgzdHJ3T3NQNU9RQkN0d2Fw?=
 =?utf-8?B?VVp1dGhmOGZlNTRmaWV2dFp1TDNuVTdwOTdQRDZZMXI5cTUxL2NndkczWkNz?=
 =?utf-8?B?dUl0NnkyWlR6SEpzUWs4eGZGWUxSSllxS05zWk96OW1kWSt4RmF1d0ErUm1j?=
 =?utf-8?B?UTJmdGRuTC9hRWk5UFdTdEtEcFQ3T1lZcUtRUUl3TnNXc0JJRXk5V0RtcHgy?=
 =?utf-8?B?M2h1N0tjS3dwWEI0Z3FNWWIvaWVwY1ZEbUpsOHlqRkNRNHpPYlhickV6OHZE?=
 =?utf-8?B?NlBFVWpjbDB3TUxqOFF5cHBweDJ6ZEg0Mk01NWtvdDFYZElIbTZvYXJmMWJI?=
 =?utf-8?B?NFZqbEdQSkN0OEE1Qm1wL3pSQzdibDN5Y0lLelVJeXEyN2o3Q2xySXVNc2hk?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c904f6-5c09-4c5f-771b-08de22e219a0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 18:26:02.5145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wbL3gFXdZaNHpXuxlXdxa+tZNSPBtVdWNPlnF2jHtClhaJKjbg4y8nd6h+X328Llba5/NeJ/Tj0WR7T/8wN9SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF1DFB73954
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

Quoting Matt Roper (2025-11-10 20:20:47-03:00)
>Switch sysfs to use scope-based runtime power management to slightly
>simplify the code.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_device_sysfs.c          | 33 ++++++++-----------
> drivers/gpu/drm/xe/xe_gt_freq.c               | 27 +++++----------
> drivers/gpu/drm/xe/xe_gt_throttle.c           |  3 +-
> drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c |  6 ++--
> 4 files changed, 25 insertions(+), 44 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_=
device_sysfs.c
>index ec9c06b06fb5..a73e0e957cb0 100644
>--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>@@ -57,9 +57,8 @@ vram_d3cold_threshold_store(struct device *dev, struct d=
evice_attribute *attr,
>=20
>         drm_dbg(&xe->drm, "vram_d3cold_threshold: %u\n", vram_d3cold_thre=
shold);
>=20
>-        xe_pm_runtime_get(xe);
>+        guard(xe_pm_runtime)(xe);
>         ret =3D xe_pm_set_vram_threshold(xe, vram_d3cold_threshold);
>-        xe_pm_runtime_put(xe);
>=20
>         return ret ?: count;
> }
>@@ -84,33 +83,31 @@ lb_fan_control_version_show(struct device *dev, struct=
 device_attribute *attr, c
>         u16 major =3D 0, minor =3D 0, hotfix =3D 0, build =3D 0;
>         int ret;
>=20
>-        xe_pm_runtime_get(xe);
>+        guard(xe_pm_runtime)(xe);
>=20
>         ret =3D xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CA=
PABILITY_STATUS, 0),
>                             &cap, NULL);
>         if (ret)
>-                goto out;
>+                return ret;
>=20
>         if (REG_FIELD_GET(V1_FAN_PROVISIONED, cap)) {
>                 ret =3D xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING=
, GET_VERSION_LOW, 0),
>                                     &ver_low, NULL);
>                 if (ret)
>-                        goto out;
>+                        return ret;
>=20
>                 ret =3D xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING=
, GET_VERSION_HIGH, 0),
>                                     &ver_high, NULL);
>                 if (ret)
>-                        goto out;
>+                        return ret;
>=20
>                 major =3D REG_FIELD_GET(MAJOR_VERSION_MASK, ver_low);
>                 minor =3D REG_FIELD_GET(MINOR_VERSION_MASK, ver_low);
>                 hotfix =3D REG_FIELD_GET(HOTFIX_VERSION_MASK, ver_high);
>                 build =3D REG_FIELD_GET(BUILD_VERSION_MASK, ver_high);
>         }
>-out:
>-        xe_pm_runtime_put(xe);
>=20
>-        return ret ?: sysfs_emit(buf, "%u.%u.%u.%u\n", major, minor, hotf=
ix, build);
>+        return sysfs_emit(buf, "%u.%u.%u.%u\n", major, minor, hotfix, bui=
ld);
> }
> static DEVICE_ATTR_ADMIN_RO(lb_fan_control_version);
>=20
>@@ -123,33 +120,31 @@ lb_voltage_regulator_version_show(struct device *dev=
, struct device_attribute *a
>         u16 major =3D 0, minor =3D 0, hotfix =3D 0, build =3D 0;
>         int ret;
>=20
>-        xe_pm_runtime_get(xe);
>+        guard(xe_pm_runtime)(xe);
>=20
>         ret =3D xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CA=
PABILITY_STATUS, 0),
>                             &cap, NULL);
>         if (ret)
>-                goto out;
>+                return ret;
>=20
>         if (REG_FIELD_GET(VR_PARAMS_PROVISIONED, cap)) {
>                 ret =3D xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING=
, GET_VERSION_LOW, 0),
>                                     &ver_low, NULL);
>                 if (ret)
>-                        goto out;
>+                        return ret;
>=20
>                 ret =3D xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING=
, GET_VERSION_HIGH, 0),
>                                     &ver_high, NULL);
>                 if (ret)
>-                        goto out;
>+                        return ret;
>=20
>                 major =3D REG_FIELD_GET(MAJOR_VERSION_MASK, ver_low);
>                 minor =3D REG_FIELD_GET(MINOR_VERSION_MASK, ver_low);
>                 hotfix =3D REG_FIELD_GET(HOTFIX_VERSION_MASK, ver_high);
>                 build =3D REG_FIELD_GET(BUILD_VERSION_MASK, ver_high);
>         }
>-out:
>-        xe_pm_runtime_put(xe);
>=20
>-        return ret ?: sysfs_emit(buf, "%u.%u.%u.%u\n", major, minor, hotf=
ix, build);
>+        return sysfs_emit(buf, "%u.%u.%u.%u\n", major, minor, hotfix, bui=
ld);
> }
> static DEVICE_ATTR_ADMIN_RO(lb_voltage_regulator_version);
>=20
>@@ -233,9 +228,8 @@ auto_link_downgrade_capable_show(struct device *dev, s=
truct device_attribute *at
>         struct xe_device *xe =3D pdev_to_xe_device(pdev);
>         u32 cap, val;
>=20
>-        xe_pm_runtime_get(xe);
>+        guard(xe_pm_runtime)(xe);
>         val =3D xe_mmio_read32(xe_root_tile_mmio(xe), BMG_PCIE_CAP);
>-        xe_pm_runtime_put(xe);
>=20
>         cap =3D REG_FIELD_GET(LINK_DOWNGRADE, val);
>         return sysfs_emit(buf, "%u\n", cap =3D=3D DOWNGRADE_CAPABLE);
>@@ -251,11 +245,10 @@ auto_link_downgrade_status_show(struct device *dev, =
struct device_attribute *att
>         u32 val =3D 0;
>         int ret;
>=20
>-        xe_pm_runtime_get(xe);
>+        guard(xe_pm_runtime)(xe);
>         ret =3D xe_pcode_read(xe_device_get_root_tile(xe),
>                             PCODE_MBOX(DGFX_PCODE_STATUS, DGFX_GET_INIT_S=
TATUS, 0),
>                             &val, NULL);
>-        xe_pm_runtime_put(xe);
>=20
>         return ret ?: sysfs_emit(buf, "%u\n", REG_FIELD_GET(DGFX_LINK_DOW=
NGRADE_STATUS, val));
> }
>diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_fr=
eq.c
>index 849ea6c86e8e..6284a4daf00a 100644
>--- a/drivers/gpu/drm/xe/xe_gt_freq.c
>+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
>@@ -70,9 +70,8 @@ static ssize_t act_freq_show(struct kobject *kobj,
>         struct xe_guc_pc *pc =3D dev_to_pc(dev);
>         u32 freq;
>=20
>-        xe_pm_runtime_get(dev_to_xe(dev));
>+        guard(xe_pm_runtime)(dev_to_xe(dev));
>         freq =3D xe_guc_pc_get_act_freq(pc);
>-        xe_pm_runtime_put(dev_to_xe(dev));
>=20
>         return sysfs_emit(buf, "%d\n", freq);
> }
>@@ -86,9 +85,8 @@ static ssize_t cur_freq_show(struct kobject *kobj,
>         u32 freq;
>         ssize_t ret;
>=20
>-        xe_pm_runtime_get(dev_to_xe(dev));
>+        guard(xe_pm_runtime)(dev_to_xe(dev));
>         ret =3D xe_guc_pc_get_cur_freq(pc, &freq);
>-        xe_pm_runtime_put(dev_to_xe(dev));
>         if (ret)
>                 return ret;
>=20
>@@ -113,9 +111,8 @@ static ssize_t rpe_freq_show(struct kobject *kobj,
>         struct xe_guc_pc *pc =3D dev_to_pc(dev);
>         u32 freq;
>=20
>-        xe_pm_runtime_get(dev_to_xe(dev));
>+        guard(xe_pm_runtime)(dev_to_xe(dev));
>         freq =3D xe_guc_pc_get_rpe_freq(pc);
>-        xe_pm_runtime_put(dev_to_xe(dev));
>=20
>         return sysfs_emit(buf, "%d\n", freq);
> }
>@@ -128,9 +125,8 @@ static ssize_t rpa_freq_show(struct kobject *kobj,
>         struct xe_guc_pc *pc =3D dev_to_pc(dev);
>         u32 freq;
>=20
>-        xe_pm_runtime_get(dev_to_xe(dev));
>+        guard(xe_pm_runtime)(dev_to_xe(dev));
>         freq =3D xe_guc_pc_get_rpa_freq(pc);
>-        xe_pm_runtime_put(dev_to_xe(dev));
>=20
>         return sysfs_emit(buf, "%d\n", freq);
> }
>@@ -154,9 +150,8 @@ static ssize_t min_freq_show(struct kobject *kobj,
>         u32 freq;
>         ssize_t ret;
>=20
>-        xe_pm_runtime_get(dev_to_xe(dev));
>+        guard(xe_pm_runtime)(dev_to_xe(dev));
>         ret =3D xe_guc_pc_get_min_freq(pc, &freq);
>-        xe_pm_runtime_put(dev_to_xe(dev));
>         if (ret)
>                 return ret;
>=20
>@@ -175,9 +170,8 @@ static ssize_t min_freq_store(struct kobject *kobj,
>         if (ret)
>                 return ret;
>=20
>-        xe_pm_runtime_get(dev_to_xe(dev));
>+        guard(xe_pm_runtime)(dev_to_xe(dev));
>         ret =3D xe_guc_pc_set_min_freq(pc, freq);
>-        xe_pm_runtime_put(dev_to_xe(dev));
>         if (ret)
>                 return ret;
>=20
>@@ -193,9 +187,8 @@ static ssize_t max_freq_show(struct kobject *kobj,
>         u32 freq;
>         ssize_t ret;
>=20
>-        xe_pm_runtime_get(dev_to_xe(dev));
>+        guard(xe_pm_runtime)(dev_to_xe(dev));
>         ret =3D xe_guc_pc_get_max_freq(pc, &freq);
>-        xe_pm_runtime_put(dev_to_xe(dev));
>         if (ret)
>                 return ret;
>=20
>@@ -214,9 +207,8 @@ static ssize_t max_freq_store(struct kobject *kobj,
>         if (ret)
>                 return ret;
>=20
>-        xe_pm_runtime_get(dev_to_xe(dev));
>+        guard(xe_pm_runtime)(dev_to_xe(dev));
>         ret =3D xe_guc_pc_set_max_freq(pc, freq);
>-        xe_pm_runtime_put(dev_to_xe(dev));
>         if (ret)
>                 return ret;
>=20
>@@ -243,9 +235,8 @@ static ssize_t power_profile_store(struct kobject *kob=
j,
>         struct xe_guc_pc *pc =3D dev_to_pc(dev);
>         int err;
>=20
>-        xe_pm_runtime_get(dev_to_xe(dev));
>+        guard(xe_pm_runtime)(dev_to_xe(dev));
>         err =3D xe_guc_pc_set_power_profile(pc, buff);
>-        xe_pm_runtime_put(dev_to_xe(dev));
>=20
>         return err ?: count;
> }
>diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_g=
t_throttle.c
>index 82c5fbcdfbe3..0ee288389e71 100644
>--- a/drivers/gpu/drm/xe/xe_gt_throttle.c
>+++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
>@@ -97,9 +97,8 @@ u32 xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
>         else
>                 mask =3D GT0_PERF_LIMIT_REASONS_MASK;
>=20
>-        xe_pm_runtime_get(xe);
>+        guard(xe_pm_runtime)(xe);
>         val =3D xe_mmio_read32(&gt->mmio, reg) & mask;
>-        xe_pm_runtime_put(xe);
>=20
>         return val;

We can drop variable val and return directly.

> }
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/d=
rm/xe/xe_hw_engine_class_sysfs.c
>index 640950172088..1d3511d0d025 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>@@ -47,9 +47,8 @@ static ssize_t xe_hw_engine_class_sysfs_attr_show(struct=
 kobject *kobj,
>=20
>         kattr =3D container_of(attr, struct kobj_attribute, attr);
>         if (kattr->show) {
>-                xe_pm_runtime_get(xe);
>+                guard(xe_pm_runtime)(xe);
>                 ret =3D kattr->show(kobj, kattr, buf);
>-                xe_pm_runtime_put(xe);
>         }
>=20
>         return ret;

I think we are able to drop variable ret by using return directly in the
two places.

>@@ -66,9 +65,8 @@ static ssize_t xe_hw_engine_class_sysfs_attr_store(struc=
t kobject *kobj,
>=20
>         kattr =3D container_of(attr, struct kobj_attribute, attr);
>         if (kattr->store) {
>-                xe_pm_runtime_get(xe);
>+                guard(xe_pm_runtime)(xe);
>                 ret =3D kattr->store(kobj, kattr, buf, count);
>-                xe_pm_runtime_put(xe);
>         }
>=20
>         return ret;

In here as well.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>--=20
>2.51.1
>

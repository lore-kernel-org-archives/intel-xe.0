Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C0AC7115D
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 04:55:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4C410E139;
	Mon, 23 Jun 2025 04:55:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KgJg68ps";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2199B10E139
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 04:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750654510; x=1782190510;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=edVb3zKqfWcoW0c8QheLpXpqHTx4Ntg6xVnEw+qXaCI=;
 b=KgJg68ps5w5E7jMZIWGP9FXfK0TpNzWxAOMAK26B8Qgp6dpzFGTud8iI
 ki+OHLu0NF5sDb9sPm9c/Yma/2HY9nBCJhfsVYD2gFQAvKQkNs3x60H50
 KzuPeu0jskSEYcnKT+VCk3VAIM+S3uIl++yGs1KaJYhJgdMMGk4H5f+pu
 WG7mwFTPZpbUDZEd6qyybX8ieS0uaawUAE3UG6dZ79qNlDcLGkL6LT1qa
 gyCFqk72qHzKb+LpuIVJNRdk2lYO4v9Fn2AkATLBDY3yA1N+jslBIT3GV
 /aDx5XpuTjh1QR5uD8mpa+yW67nKcehswLe3l2C1vdUeRLfXe7otbByoW g==;
X-CSE-ConnectionGUID: omYjTn+JRISVLy2dY6qIzg==
X-CSE-MsgGUID: yq0dEHWxQf6YjAXET+z5qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="56516915"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="56516915"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 21:55:02 -0700
X-CSE-ConnectionGUID: ioJruumjReqcLloTmWoYxg==
X-CSE-MsgGUID: A5xlVIlJRQqu+0N5CuaIjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="150904378"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 21:55:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 21:54:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 22 Jun 2025 21:54:59 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.88) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 21:54:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I9t2dAD5XJE2XVX4pI+blw5zCkb3un1jI/2efssl3GWHqf+iwv4LG9+giZq6/0GeCdkB8vmb0yt2/rhooDKmbTbPhzLtWAKnp7y5/stfeq7nn+hfvxboSxJAVPlgpktozFtnKRe7VAokbGnzl72Bh7aDH201u0pbm3/6Bux1Omnva5lquu0zbLTBfvFuoDDqRaCCP2sbWPD9ibzk7n2bB5Ycb5ogfYOAX11RMgCDje2W/xlqhUazQLp+Ek7VxQXPx997/AlU0EJLIQl6KsECNRl4QaF51nvbrYnOUJ4nT8HSDkLEyAjqrgp+EAuTvctT5msBxyO4PFsDaCRGExaX1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNkAeS15/6ey2wFAV71PAst1nH2Jpl58JgrL2OmG8Mk=;
 b=CU3EWT6wHELhrL/iDkTeovXZnAxg14abLXgn2QiJtnlVH/Fkwu+TLGdwS4p/918P09464BbYBR3U5piMpnW4K7V5lyTx16q05s59dp8/gYgG2cTIo+jKJIoGx1+pvGKMmwhgn8aG3NGAoYVVY74V/JzRMSPw0/XTI8K1ADBAfGqqodAxIVInP2Ww7Pjgy41nI7SF/BBUjGIJ3tAZ7nzhHyZTJ2Jx+M/LglULDDkJJoHAEjqpUYS+lnlnCwsZa0d6cea6gmJiZMM2nxvScqssk0e+tDW2JoqtiBjAq9eSFZVTm7Yg12b/tvX9RG0eSghv6Cp063t1BH5GO6R6isKibA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW6PR11MB8437.namprd11.prod.outlook.com (2603:10b6:303:249::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Mon, 23 Jun
 2025 04:54:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.016; Mon, 23 Jun 2025
 04:54:57 +0000
Date: Sun, 22 Jun 2025 21:56:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 08/20] drm/xe/svm: Add
 xe_svm_ranges_zap_ptes_in_range() for PTE zapping
Message-ID: <aFjegyCdeNlytbH/@lstrano-desk.jf.intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
 <20250613125558.2607665-9-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613125558.2607665-9-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0248.namprd04.prod.outlook.com
 (2603:10b6:303:88::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW6PR11MB8437:EE_
X-MS-Office365-Filtering-Correlation-Id: e442cd17-8ce7-4a32-b179-08ddb21219d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXQrenNLL1R0UDh3T1daT3NqbmhUdzhuUXpUeXM2blZXME9WNmNwNUdyQ1E1?=
 =?utf-8?B?MXRNMXF6Q25FMk9ubU1jT0hXaXQwS2ljYnV5T1VKWXZiRVNuTW00UzJoc25G?=
 =?utf-8?B?SEhyVTJSSGRla2k1MHF6MnNDaFBuTVBLUkhMT3RqRHZPaU1takVBY3N2d0RL?=
 =?utf-8?B?UXdwaGFDUmVMRDhrenZCUWFPTHgyc0JqR1IwTVUyTlYwZTJ2ZG9qemU0ZnVy?=
 =?utf-8?B?RnU3ejlWV2pVeFhwQkJMdFhpV1hWcUZUZm1sUHpaclh2aThFRTVPWFM4aW5m?=
 =?utf-8?B?RmlsWnZMb3JRcEVnWHhKUURsUktUNmlIcHZ4dUlCdDVuNGVaMmVuRUtxOGZJ?=
 =?utf-8?B?YkFPLzFhdk9LZGM5cDRsWmhNbWN2TjlCeGFZSzg2alpSZUpTelVNTjZ2SXVN?=
 =?utf-8?B?L2Z4V3BLRUlCNnB0a1hHbWwzYW9XUXFmcFlQTXNhVEtqNnlnYTFZdURRWGNB?=
 =?utf-8?B?akE4ZWdUdWVBcEFObk9Jdi8rdGp5dXpwcndLVmh1RXZNUGVDbVJWSkpiUXI3?=
 =?utf-8?B?LzFBOW44eVdkMkFxSUVuN0k0Wmw4TDBObVJtU3Q1ZDZ2UWdTZFk0elJxcG9z?=
 =?utf-8?B?ZDlCRDlkOVlsSXl6RVZxSTQ4OEtHUVVSMkViMlBzUUdMSmdQSnFPdml1NDNJ?=
 =?utf-8?B?M1dwUEtJcGIvT2RZOTk3UHZYUGlPVzZDazZmOTlXWDltSTUyVjFhZ1RVUXJs?=
 =?utf-8?B?QWlRdm56OHZzNUpaUXVtazJ5dlV1V1NqVXliZnlDcitXWEZZcms4TTAydEhq?=
 =?utf-8?B?UkpsOVNpVWs5RnZ6c0RGTDNoUEVSb09SYytFTzJLRjBIcVZBS1ZFcWc3b0tw?=
 =?utf-8?B?WjBVazJiQklkTlk1YXRvMnN0d1ZvZmFqVkdjTGN2aVVJTm12UllBZVNCbU5B?=
 =?utf-8?B?MlVaZ0V3TWtlTXpSbC9LZTNueDVpQlhYMDYrR0FXcHRkTzRWVEpyWmxxZXhN?=
 =?utf-8?B?UmNYS2hHRmxZSjVvaGZrVU1wQmZJdFBpREVHMVNOTENxVi9VUTNkWk5PWENF?=
 =?utf-8?B?K3o1Si8zajVuQzZ1SklmMVJ1UTFMcUpBci9uK3MxZzB0eHRxVVhDVUZtSU5J?=
 =?utf-8?B?amtMMTRhNWU0VUhlbVFUZCtIdC9Yc1Z1TnVHSTlQUFBlbk9kMGhQdmJTWFBt?=
 =?utf-8?B?eGxoOTZIbmltQW5JR3B3bmZOeWJ0M3ExQ2tMdFlqMi93ZVhBaVNXb21PM0dm?=
 =?utf-8?B?YWpvTFhwVy82U3BXM1Z5T0RQR2RNc0Z6YkszSGRaWXJaTldvbThuVGJpRDhj?=
 =?utf-8?B?TEIvemQ3UDRRMTRWVk9wTm1hTVdJVEg0QkorQW1oNFhmRkt0T2hZcmFtbS9B?=
 =?utf-8?B?ZjBvdnp4Wk1PU2ZSZ3c1SGc0MVBRRUlTMTZUS1R0Z2FNMEg5R2hEeFdkcVhK?=
 =?utf-8?B?MmZFMDJrWEJueU9yNUJTYUlHT1NhRmNCSloyNTF1aGxqb1JidUt4QkppRWlh?=
 =?utf-8?B?dE82eW80V2Mrc1JwNEJTcDdsTmdNY3NsNU85VUozWFBRMnZnTkZZSGpCUTY5?=
 =?utf-8?B?TFJXV3BMeit6Q2hyR0tza3lQa0U1RmFzQzBPM1dsZ2pnVmRVb3JlL2JaR0lF?=
 =?utf-8?B?bUxsa0gwZTJrUUZYS2hzVVJXRDlSRVUzQVZyY21PSmwzZEJYcUZ1bWpXK1dY?=
 =?utf-8?B?L3psNnh3dXNEMllNNlIzWUxYZUlKTG5INVZyOTEybVJOYnFCY0lOKy8vcTNR?=
 =?utf-8?B?UEhiOWRsMXg3WGUyUTA0RWVrVm44SjloZjBNVGFJbzZsancvWCtVWE1ldHFn?=
 =?utf-8?B?M3RDSnFLSTRPSjhrcC9JSG9hZ250djM3azE0c2tZU01nWWhQSHhMRm95dzZa?=
 =?utf-8?Q?Y2fUdIccYVGgz87svvGL+xMqYsuGpFuvyMh1E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGJNa1ZaUTlHSktKSFZBaXBHeTUwUStaak1kSDRPNU1mcXhSTU8rSCtYQTFv?=
 =?utf-8?B?NS9DazZnOVhzVllFWGpOWHg3Rmk2aEx2OTl0TzQ3SjErMFpucWxyUHAzZzRw?=
 =?utf-8?B?UEJYVmYzYmV2Z2QzTkxTWm53MlNVUkh1bHNOQzI4ODByUGNGcExRTjdRbzVm?=
 =?utf-8?B?b3ZaOFpuTlJ6UXR2QjA2aWFUV1lOaGFvVTF5VjV1VVM5V1RkTkNJa0ZFa3Zj?=
 =?utf-8?B?ZFNKYmJTTTYxVWJLNUh1Y2YzRzJUT2RNenNJOFNyRlAxWFlMaUdjTFpHTWVT?=
 =?utf-8?B?WmpuYm04dXhRQ3pXUlBPaGlVVnBoamxyWEJZaktESkRyT0xraUdWTHBmdWhY?=
 =?utf-8?B?NmxGVFhLdGFxTStyT0tkZWx5Njd2bTBFNFMzVzhMbFNnalZnYkVXQnlHR0VZ?=
 =?utf-8?B?NXZqV1pvNi9lSDZEcWI5MThrT1M3WE83WDU5N09vOHNHN3JvVk44RU8zM3BL?=
 =?utf-8?B?YkVyYXNsTDBVUmZVc3FDNjBJNjBPcEZJTHRadVlFVEFpUG5IV1ByeG83ZUsz?=
 =?utf-8?B?ZHNhaElUa1o5R3JWakdLZzBqcnZCVkd6MXk5T2pLWVB5WHdBWlgrVzVscCs3?=
 =?utf-8?B?VmhuRHNCeU1UZXg0V3JPUjNQNWRhU0NnM2xNSzZiSi94VXdkSnU0c0RYeXpr?=
 =?utf-8?B?cU5salFGVXlsV042NytzQ3RtdGkydUJVamdJSktERmxVUzV1WG9HNGFKaWtF?=
 =?utf-8?B?NmJLQU9QVklqd3ZzYnhhTHEvN3h3TVc0U3cwaE9CSjFDc053UmFDZ2xXQ1dj?=
 =?utf-8?B?dGtLblp4VEpEejdsUDBxUGU2TGJta3pCeFhrdmE4K0V4NmRoZGRkbXcxSkZJ?=
 =?utf-8?B?OHNDY1BSYldRK0ltQWJXS2tndEErUDYyVTM5OGU0Ymp0SVRUY25HRXBSUzJB?=
 =?utf-8?B?aXpGUU80dXMxUS9yTmgvU1RIWXAvek1VcWgwb3M0RWY4N1YrSndNNStvaUFX?=
 =?utf-8?B?Y1dzWmNiaU9RWHBidTJ5Si9rQkdwU2JJaDZmeXNHa0g4THJzdXhDRkVrVi9Q?=
 =?utf-8?B?Rkx6K1NReVVxd1JXang1WTZORzRTbWRiS1hPdGV0UjU2WHpqMHFTU1RoT3Zm?=
 =?utf-8?B?STFhZU50cXB2aC9OQTJMajREaVhrZEpscmh4clZlbCt6bzZUdlpsNWkwNTli?=
 =?utf-8?B?dUFMRHFENEJhODZUWWI4UDlNT0xpWkxOWW1ZYWtXK0NWb0VBaFlTWkRYT2Fk?=
 =?utf-8?B?dzZNejZaYndKVjQ0ekJFR00rYnU0SXlzZDF4STVMN29MU3pDdjN4amMzQ29y?=
 =?utf-8?B?TWc4cDREbEttaUx6N3pORndOcEtVeWxIY3JFdjlueEZweHlYQ01vK2lNZ05k?=
 =?utf-8?B?bHpWNkxCcGhZUzVVU3FUNzlZb3h1Rk96K2Znc2N3N2crUVVnMDFDZGt2VU1S?=
 =?utf-8?B?MDlrNGppRHVldHJBMklTSHJlZVRFa2orWE51bGQ3bnhlQkplOFRnOEw0dGh0?=
 =?utf-8?B?ZWYrQTBHSDNIYW5RTkw1TVRYempUdjMrMU5HQWl6ZjZVUEREQVVGclJUcDdo?=
 =?utf-8?B?SE9jb1A3UFUrMzhwYWowenFsY2lKaittYmJDekR0TndCZjZ6bFRwdWVJdGlo?=
 =?utf-8?B?eFVNeVRMMjYyT25IU3pXdzlVbWcvRFUrZFdSKzlFT3duNmtTaG5mN2MwanEy?=
 =?utf-8?B?dlBOYjlHOG1qUHZUeWVoc051K2JpS2c1czlYSnMvWWtvOGtpNGNveWVuRXhB?=
 =?utf-8?B?VFozeWNqTTlrVUkxOEFRaTRXWTcyaUIwZ1BwSmlJd0MvQVUxS01pZWxSN3E4?=
 =?utf-8?B?VXgrOGtOeWlYbUdub0VQQ2NVcEljYVVGalRqeDN4MzhxOUhZaEljMys4MHlH?=
 =?utf-8?B?bXVsaDlqVjhjM1VaVFAvSFduZnU3bGIzOG5QTG5qeGlmYklXNStxQSt4WjhC?=
 =?utf-8?B?djFEMUljOGtTWXd1OExMQ3FNOFlyVzFzVDIzZmVDbGFVd1ZtWUVMWDFJR2d3?=
 =?utf-8?B?R3JmSzYwQjY3UDc2aWRiWWE2MlF3cnFscjlHNHdiaUxvRXB0QWJKVEU1Qlp6?=
 =?utf-8?B?QWIwcGd5ZkZ4UkptZUtRWk9ZdlBxd2IvNlBpdjlYTndmYTg3TlpGa2VhUGto?=
 =?utf-8?B?bDBFcWVabHgxTU1NOTBCTHNaNmJrem53VkFxVlJqZnhPcG5qQzZMNW1ua0RC?=
 =?utf-8?B?UmJuM3dYTGM0RXYzTGN3Z2lmOEdCbUg4STRweG5QMi8wTVdzUGtEK0RoSHRF?=
 =?utf-8?B?M1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e442cd17-8ce7-4a32-b179-08ddb21219d4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 04:54:57.0207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kQwz4h68+rHZVnyVuakqo0oiPlBglwlmZuYTIrq4qtch2Cq4UQNni5cFIEn2hPDg9EW9Ins0uuWvPIwqb19NeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8437
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

On Fri, Jun 13, 2025 at 06:25:46PM +0530, Himal Prasad Ghimiray wrote:
> Introduce xe_svm_ranges_zap_ptes_in_range(), a function to zap page table
> entries (PTEs) for all SVM ranges within a user-specified address range.
> 
> -v2 (Matthew Brost)
> Lock should be called even for tlb_invalidation
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c  | 14 ++++++++++++-
>  drivers/gpu/drm/xe/xe_svm.c | 42 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_svm.h |  7 +++++++
>  3 files changed, 62 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 9177c571689e..9a390ef10852 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -950,7 +950,19 @@ bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
>  	struct xe_pt *pt = vm->pt_root[tile->id];
>  	u8 pt_mask = (range->tile_present & ~range->tile_invalidated);
>  
> -	xe_svm_assert_in_notifier(vm);
> +	/*
> +	 * Locking rules:
> +	 *
> +	 * - notifier_lock (write): full protection against page table changes
> +	 *   and MMU notifier invalidations.
> +	 *
> +	 * - notifier_lock (read) + vm_lock (write): combined protection against
> +	 *   invalidations and concurrent page table modifications. (e.g., madvise)
> +	 *
> +	 */
> +	lockdep_assert(lockdep_is_held_type(&vm->svm.gpusvm.notifier_lock, 0) ||
> +		       (lockdep_is_held_type(&vm->svm.gpusvm.notifier_lock, 1) &&
> +		       lockdep_is_held_type(&vm->lock, 0)));
>  
>  	if (!(pt_mask & BIT(tile->id)))
>  		return false;
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 2fbbd6a604ea..19420635f1fa 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -999,6 +999,48 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>  	return err;
>  }
>  
> +/**
> + * xe_svm_ranges_zap_ptes_in_range - clear ptes of svm ranges in input range
> + * @vm: Pointer to the xe_vm structure
> + * @start: Start of the input range
> + * @end: End of the input range
> + *
> + * This function removes the page table entries (PTEs) associated
> + * with the svm ranges within the given input start and end
> + *
> + * Return: tile_mask for which gt's need to be tlb invalidated.
> + */
> +u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
> +{
> +	struct drm_gpusvm_notifier *notifier;
> +	struct xe_svm_range *range;
> +	u64 adj_start, adj_end;
> +	struct xe_tile *tile;
> +	u8 tile_mask = 0;
> +	u8 id;
> +
> +	lockdep_assert(lockdep_is_held_type(&vm->svm.gpusvm.notifier_lock, 1) &&
> +		       lockdep_is_held_type(&vm->lock, 0));
> +
> +	drm_gpusvm_for_each_notifier(notifier, &vm->svm.gpusvm, start, end) {
> +		struct drm_gpusvm_range *r = NULL;
> +
> +		adj_start = max(start, notifier->itree.start);

s/notifier->itree.start/drm_gpusvm_notifier_start

> +		adj_end = min(end, notifier->itree.last + 1);

s/notifier->itree.last + 1/drm_gpusvm_notifier_end

> +		drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end) {
> +			range = to_xe_range(r);
> +			for_each_tile(tile, vm->xe, id) {
> +				if (xe_pt_zap_ptes_range(tile, vm, range)) {
> +					tile_mask |= BIT(id);
> +					range->tile_invalidated |= BIT(id);

/* WRITE_ONCE pairs with READ_ONCE in xe_vm_has_valid_gpu_mapping() */
WRITE_ONCE(range->tile_invalidated, range->tile_invalidated | BIT(id));

Also, we need to be careful here. If we can fail after this point but
before the TLB invalidation completes, we could break the notifier, as
the notifier would skip the TLB invalidation. The code, as written, can
only fail if the CT channel is down — in that case, all bets are off and
we are issuing a GT reset. So, I think the code as written is okay, but
I’d add a comment here indicating that there must be no failure points
between setting tile_invalidated and issuing the TLB invalidation.

Matt

> +				}
> +			}
> +		}
> +	}
> +
> +	return tile_mask;
> +}
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
>  
>  static struct drm_pagemap_device_addr
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 19ce4f2754a7..af8f285b6caa 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -91,6 +91,7 @@ bool xe_svm_range_validate(struct xe_vm *vm,
>  
>  u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
>  
> +u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end);
>  /**
>   * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>   * @range: SVM range
> @@ -305,6 +306,12 @@ u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end, struct xe_vma *vm
>  	return ULONG_MAX;
>  }
>  
> +static inline
> +u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
> +{
> +	return 0;
> +}
> +
>  #define xe_svm_assert_in_notifier(...) do {} while (0)
>  #define xe_svm_range_has_dma_mapping(...) false
>  
> -- 
> 2.34.1
> 

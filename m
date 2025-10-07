Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F968CCA476
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 17:14:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D05410E1C6;
	Tue,  7 Oct 2025 17:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RUK3Pfrk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9647F10E1C6
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 17:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759857292; x=1791393292;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=iwjroGqzbgFxkv24O0Ef2hFIhS8DxhE+h+Y4E9cv+Tw=;
 b=RUK3PfrkLf/kjqJgHCImYDxPi0ObdZUKzkrW3t/TgU5HNpJi2wreEIy3
 RT71PBwNiJoshdSiKgBnPS5UTk2ff9H6td0AH/lSiBtioK7sb++oRPaxG
 7mrfQgNTHm7wJBBTR3xmRz/AmBeRmPtHlnrKogJWkr/tz1Qy6ZOlA44an
 syQzFmffr2MMDsbTYlSmSS6xO0VLoE3VD1Ds/nKPOcD8Jkogtg0vDP/Q4
 CPTh0bMGq1Dh7FjgZw1olZNQ/jFjBLoPmJFtuzJf1Q/ffC1Uk0RhwQyt0
 3r/B1+rBd5lO9GRU8mYrJ5wrZrU0CWn6g/VfcteJEL2V+/LdwgCoXcS/Z A==;
X-CSE-ConnectionGUID: P8ji768sS0y3iVicsfUjYA==
X-CSE-MsgGUID: 5ZYvqsW2TxWoVGJb/pQSGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="84666874"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="84666874"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 10:14:51 -0700
X-CSE-ConnectionGUID: IXJCpotOQTijyBM6mwKwaA==
X-CSE-MsgGUID: p43KdQ1ORCWnS8o7wpgVqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180013235"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 10:14:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 10:14:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 10:14:50 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.10) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 10:14:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jI8tLWyTiKpA/wpxKy8XC5B/4izSRkD6zWDPbzp85TxSCqr7J6VV9/vwt9rw5uBJSsPwZ04xL8tGtFMFJd0MlvFnJlvVWhTQivp4+ZKSodM4xoMXqLY31iG9BH4YcckC4PMHaV6xxMpUJgU+MC3bzrVYJjDUQVI8rK5U+H5NqO5leIf/QyMAtF8kmnZ1d3/4hjkfyVZFWJrJtSNmtREnL1GLeN2+uHuwPMhj84pIChkGRkfHOtJjij6nK12r5jXi5nkAmVu3atrWrmHgsEvyFdYrz5fzpRNYBv7OtaMld6LwsGOtIa86aC+VeGeUeDECN8MV2sx9HQZDw3Iymw4rRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOTOyX/YKzj1kIuHZKZuaLZuDOuQlamFUAvLKgXBLIE=;
 b=gyac/3yZl7edL/o6fpAqJU3GYLRd+DidQv6SM79SR30ab4WJj7yzfQEjBOXTokEak56VZ3gfrDBMq54rvMuLGhUH0J/0yVs9UNWpvq1Kw0pzOUaXFlpvKBh6mhSLDQll9Y3Qdq7BZLmtiaquwEw2HmYDW6V7eRa4DF67LwzcfCuJPwOpbnTX9vN12sXHMGmiymhop+JJXa0QouJ9U8k6YiQnRa6LxhrppCzREaa4S9OI1gvGE70KHO89hh7zQTCO6z03cPZpf2zmgF2AbrcNcOuynSOW5w0SmNR6t6BZ/FeFMUO3PshXFzJfX6/OXUMaD6/56CslzM74lzIGeR56Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MN2PR11MB4517.namprd11.prod.outlook.com (2603:10b6:208:24e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 17:14:38 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 17:14:38 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251007170720.GD5409@mdroper-desk1.amr.corp.intel.com>
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
 <20250930225618.140071-32-matthew.d.roper@intel.com>
 <0ce62511-3c46-4d1a-aef9-8c5f5a4f4d0a@intel.com>
 <175940901218.1952.3042709661416045697@intel.com>
 <20251007170720.GD5409@mdroper-desk1.amr.corp.intel.com>
Subject: Re: [PATCH v3 07/23] drm/xe: Read VF GMD_ID with a
 specifically-allocated dummy GT
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
To: Matt Roper <matthew.d.roper@intel.com>
Date: Tue, 7 Oct 2025 14:14:34 -0300
Message-ID: <175985727417.1709.8771453754301506855@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BYAPR08CA0057.namprd08.prod.outlook.com
 (2603:10b6:a03:117::34) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MN2PR11MB4517:EE_
X-MS-Office365-Filtering-Correlation-Id: 8051e1f1-4120-46da-9c25-08de05c4fef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M25Bc2o0alNudi8xWlFicGl0a0tCKy9GbVFXanBFTzFTU2FRNFJhWjJEL05r?=
 =?utf-8?B?MFdFRDhLdzlKczdGd0NjT1duV2VHMElodlBac1BTQWExemFJcERHMFM2NGRH?=
 =?utf-8?B?LzkvbnNselB2V0M2OUV6T2JwMktYbVljMjVlc0pndyttWW56UzZQTVVPZnAz?=
 =?utf-8?B?WlU2ZWplcmNtV3JwRWZ1Mk1hWDR1ekhvYU8ralpJQWpuc1lCQjVrRXhGMTUx?=
 =?utf-8?B?T0J5WDZxZFl1VjI0YTFlcU1lKzFPVXdQMk1tWU1vL3R0WlJqN000bXV2Skhk?=
 =?utf-8?B?MXRiTFhUK2RuRWRFL0swVDIzYjBPa2R4a0hDbnYvdHgyT042ZmpzUUpzano3?=
 =?utf-8?B?b2Y3Q0tkS3pCQ0ljUWlEdy9XcEl6WE5yaXE4RTZwZW5iY3h5UnMxR0xROFFX?=
 =?utf-8?B?aHViSDZ0L1hCd0IxOC9CYWxzcmRnbTYvc25ZK211MWNkVmIzL2pTamVBN2M0?=
 =?utf-8?B?cS9RazRRVUoxZGloK3pXSnZoYitOS0pKN1NhcEwwSC9BMWFWUjNBRzRNaXZz?=
 =?utf-8?B?Ky9ycTlMWjZBVE5TNXlSamJMVVlLZnVrYjlBeGwyWEVnYlM4Y0h1SkhWSTB5?=
 =?utf-8?B?T0lzem1TWmlSckt0anZ4OU9VcHRWdU03eFVjSkxFeUlUVGRvdU5lSFl2VEM3?=
 =?utf-8?B?dXVGazd6OWV1MTc1RElKUkVvQXZnaE5ScnNRR3RsbjRKUU9ucTNkOG4zSGNk?=
 =?utf-8?B?R2c3eVZQS1dvM0N0Wll5OXRZWlBzUzFNMEJqRStBWWVzUHlxbkxobWFwZDls?=
 =?utf-8?B?SFVMTkRJSTlXL2RjWG9nU0tIVDkvMUU5UkN1Rzh3bkttbjdodGlSYjhIbXcv?=
 =?utf-8?B?M1lhdkg2cy9FenFwNmxLT1pMMUdqT2YrRDJpQlBUSXUzaytSVlc4cTAwUzVH?=
 =?utf-8?B?bU5uYlFHcktKUXpYeGJDbHVScG1Qci9vM29veC9UaytycXk2MEQvbkFQSG9W?=
 =?utf-8?B?cXhVZHJYRW8xUDlDWGhQcVBRVEgwUGhyYmFVRDkwSHZ1RWVub21LSUFCWUN4?=
 =?utf-8?B?TWNldUx5OGRubWRzMjlFNHkxMjB1OWd0dCtaalRQRVEwelBFa0JYZjV4U1ox?=
 =?utf-8?B?ZUVXMlJZNkViVTZCbFJjR0tBaWdFQy9mQUg4UEtHWWgwOTFYWHBlemVWdGdj?=
 =?utf-8?B?Yk5xVVJLMkF6Nm04OVB0d1V6cWxwYW9xaU43TXFXalZaVlM2NERjdU9kT2JU?=
 =?utf-8?B?SFV2cE9RNDdKUkRqYTdTa05DZlBSaHU3eFpVOUtZSWpCRmtyMnROT2Rsb3Uv?=
 =?utf-8?B?a0NURzZUeWVjb24xa1VuN0QyNW9UN09kQmVzQi80c1k2dTJHZU5adE14MGFV?=
 =?utf-8?B?SFJxOHF6eG5JbnFjVlhFWWl6ZFN1LzV1Q1gzL2Fjc3JKL05BSk5YOGl3aXRC?=
 =?utf-8?B?ZlRRencyZy9UNEtqR0lINnVqS2VJZVh0U29ISXBDajI5VnUzVE9rVmdvRGlL?=
 =?utf-8?B?aENDRDZBazRmWGtnZFYzcXRRelZpTENmZEFMU1dZSjh2RTN6MjB0b1kvUUZG?=
 =?utf-8?B?TmhoKzFMKzZCR3A0VU9BeHd1K3RIZVJ2YXg1b2V1VEJicjNKaTBOTThlTzNV?=
 =?utf-8?B?YXRTTVZoaDFIK0pJWVhaL1liUjcvNVBsTVZTenFYMDRNWE9nSkl2Uy84STh3?=
 =?utf-8?B?VTFzdyt6Vno1aFpCc29WU3R6K0QvZkhEcnB6bFdFVUJCUUxYWXYxZmNJbE9N?=
 =?utf-8?B?OFlNZWFxSDQxK01ITkE2SFhVcDJiQk1lVkp4ajduR2EwR21xUHE3eUhhUFRP?=
 =?utf-8?B?d0p2WFVCWnpjdHF1V1RCNlFPak9GRVM2WFVRZXN6Y3NRVVNEUWNRUXVJclRH?=
 =?utf-8?B?eXBVWXdqaTFaWjFHVlphSzE0NFJNZ2kyRVB2VTdCT2w5QVY2cnhjVXZBcDJ5?=
 =?utf-8?B?RGtTUWRxTWU3K2h3dFlSSHBrRWsvRjdlV3c0dGI4cXhUbzJWUFF0Uit3Wk9q?=
 =?utf-8?Q?1MqQ/vsF5Bh1FcfYu7/7juRK4rKMtGqt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?engxS25GaUV2WHphNmdkb1E3Y08zYXFsNTk3Q240U1I0V25LUWhsZ1l3NVpw?=
 =?utf-8?B?anhCTGx4UnpRR1Bkc3JUb2xGM0xYZXJoYVhqOVJlTmlkeWRQSHFWVGJzOGlq?=
 =?utf-8?B?SXF1andsOGFhVHNtc2lwVTZWeldjYVpjZ1dnRkhKY0lNSnNlcEt6R0Y1WEdx?=
 =?utf-8?B?cjhuZVk1azA0OVF1QkQxZlY2NW05YUdEQUVPb0NvdzduVjFHbWpnL3kyVXBm?=
 =?utf-8?B?Z1pKa0lsc2pteGUrcFBsemtWZTNuNDI3NUpDeE83UUI1am02RzliSzBjZmFT?=
 =?utf-8?B?M0d2WEV4T1lNQm5aU3RDd1RYQTJUMm82dDNLd0N0aVRIM2hVZ0hEbit0bDAy?=
 =?utf-8?B?YnllWDYxVnFoS0JBa2JiRytlRDdaVVBwWnUzUzBvZzJwNXdRUERKdWpMbmRz?=
 =?utf-8?B?OVMvRlpYVEVpYmgvYm5IRVpZeW1YTGV6SjJhem4vc2RWUDJOdER6MTRnbytN?=
 =?utf-8?B?aGdsVFNCcFd5RlI5ODB3ZVJ0d28yb25RVGl0TGVvM1J0QnVmZHZCMVVrZkNB?=
 =?utf-8?B?N1R0b1N6Ly8vWUJkOWFCaWp2dkl0ajl1MXAwTlZLWjJBQnNyRUMxZjBTVlpq?=
 =?utf-8?B?U2EvNVRVQzZOSFJ6T1Q2SGx3VytDUndUUTVUckFEN0kxNDZqZTBMS2I1VjQw?=
 =?utf-8?B?Y2NRa2lIYXJmU25XUXl0ZEdTUUtkaFFNQ3Z6MEZBT0REOVY4ZkFnczNsZ2JE?=
 =?utf-8?B?bnRnOHZlQjZiaU1JeHFjMDlWSHl6YVlBcXhrUmtpQXB3alZhVkpXSnhsZmUz?=
 =?utf-8?B?eXdzaytyNU1wWlBOdTQxQTNWc29UYnlsUjN6OGlMMjZrenJVUkhPZ3RNQ3BY?=
 =?utf-8?B?T0thcDZ1L0RMbUV4bWNXNGhzUmp5NEd5VUNORHNLYkx2OXVHMkxMUmxpZHdO?=
 =?utf-8?B?UjNhcmFNdmxXcEdWNElpYTFGWGtUdEtwK2c2MmtrUXNUWVJjVU1TMDBuV2s0?=
 =?utf-8?B?Y3BnWmpremlMQkJIM1J0blhHNkUvRnpOejlPaHY1a0JVM1I5RUZWWnNxcllq?=
 =?utf-8?B?L2ZKQUF3OTJTYWcvbW94blFha3QwajY2Mkc4OWwreGk2cUM5QUJVNEI0ZUtJ?=
 =?utf-8?B?czBIQWJobkVFSXBHNkJDNTkyVndjOFdIZTh5Tk9ESnFDQmtrUlVQNERJb3ZZ?=
 =?utf-8?B?ZlBKL2Z4QXZXb1E0SWRXQ1VPbzhYVDZIK2t3VXFQWGM5MGphbFh1V0VyLzJ4?=
 =?utf-8?B?c0cwOGZENGRTdU5hVVM3bzhoMzN2eXhzY0srWkxUZjBiT2Z6dGdFZXhFL0hE?=
 =?utf-8?B?MzFrTnlCSjJEci9PUmI2MGx5YXlJQVc2ZjE0WTQ5UVZ2SDF3aDZXcUdtRVhl?=
 =?utf-8?B?V2wvK1JLbkJGeVNLMEIrT3FtMldac2dLZEdNZ3VoU056STBHZTY2eVFWNU1i?=
 =?utf-8?B?ZjJvTjRyTUVYWmV1OURmS1BONFFyanVWUk92N0xBbmVHZ3lhaVpuK2JKa3o3?=
 =?utf-8?B?djhCQWdMRFo2elhXM2NnQWVTRUJZNFlwcnAzYklvSXozaGpWdGdlVGRQVVhF?=
 =?utf-8?B?QWlTVG9Zbkd2N1BQd3ZyUmNadUVEblJBaFZlYzJpcXhIRnhjZmJDZGhLeDhw?=
 =?utf-8?B?RGttaEprMmU3ZjFBWUU1aGpLT21JOForRUtyMGVuR1hLNjhJSkxRbzRQdUdX?=
 =?utf-8?B?MkxIMWgraXNlWEM0SXRmVTRTeDVjd0x6SGtubVBjTWloN2hzRXpBM0FqUVBD?=
 =?utf-8?B?bFJYYy9xZFc3bDV3eGYyZHVSUXB6TjNZQkxLb052T210cmxTWloxakxTYzBH?=
 =?utf-8?B?dmhSRnpNM2ZlRVR2b3AxckdXMmFSZmJoazB4OXRONHV6ckxYMEV3TjkzM1NT?=
 =?utf-8?B?ZkR6VUxidmdrYlpGczY3STBJRmJSTlFra0lmM3N6SU9ZNEVjSCtHQWlUYy9i?=
 =?utf-8?B?MTB3cktnOG9lOHZoM1hXNHNWd1haNmRnNFpCdXNGczdYVVZyaDZYQm1NeGYv?=
 =?utf-8?B?OEpLQkVrZHdTOWNxaTZkTi9NYWVqSVgrbktFNVBHNDBYK3NuQ2ZSZDROTHZZ?=
 =?utf-8?B?cVZ2NGNEN3kyQlNKaVR0R1BXeTdjcUtjMjg0SmtvVndmaGYvR1paMEN3S0dW?=
 =?utf-8?B?VHZxZW54YklTQXMyOUUwdDE0Z0pkTUdtdlBlTUdhSnlXWHFWOWJBYXJoVEp3?=
 =?utf-8?B?bUs5b3dESWpkYmlmMTdXYXVBQmdSMm1tNVFSQUc1eGxjZ3FZcnZVbllTMm95?=
 =?utf-8?B?dEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8051e1f1-4120-46da-9c25-08de05c4fef9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 17:14:38.4418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0kg6sYGTIngsw/qyFo5N5tas4c15a0PFscREuiOOR5eBuH2vgfk320DJOHACpEZIdO/rqCCepD9NQD2fqNiQ8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4517
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

Quoting Matt Roper (2025-10-07 14:07:20-03:00)
>On Thu, Oct 02, 2025 at 09:43:32AM -0300, Gustavo Sousa wrote:
>> Quoting Michal Wajdeczko (2025-10-01 07:07:04-03:00)
>> >
>> >
>> >On 10/1/2025 12:56 AM, Matt Roper wrote:
>> >> SRIOV VF initialization has a bit of a chicken and egg design problem=
.
>> >> Determining the IP version of the graphics and media IPs can't be don=
e
>> >> via direct register reads as it is on PF or native and instead requir=
es
>> >> querying the GuC.  However initialization of the GT, including its Gu=
C,
>> >> needs to wait until after we know the IP versions so that the proper
>> >> initialization steps for the platform/IP are followed.
>> >>=20
>> >> Currently the (somewhat hacky) solution is to manually fill out just
>> >> enough fields in tile 0's primary GT structure to make it look as if =
the
>> >> GT has been initialized so that the GuC can be partially initialized =
and
>> >> queried to obtain the GMD_ID values.  When the GT gets properly
>> >> initialized during the regular flows, the hacked-up values will get
>> >> overwritten as part of the general initialization flows.
>> >>=20
>> >> Rather than using tile 0's primary GT structure to hold the hacked up
>> >> values for querying every GT on every tile, instead allocate a dedica=
ted
>> >> dummy structure.  This will allow us to move the tile->primary_gt's
>> >> allocation to a more consistent place later in the initialization flo=
w
>> >> in future patches (i.e., we shouldn't even allocate this GT structure=
 if
>> >> the GT is disabled/unavailable).  It also helps ensure there can't be
>> >> any accidental leakage of initialization or state between the dummy
>> >> initialization for GMD_ID and the real driver initialization of the G=
T.
>> >>=20
>> >> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> >> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> >> ---
>> >>  drivers/gpu/drm/xe/tests/xe_pci.c |  6 ++-
>> >>  drivers/gpu/drm/xe/xe_pci.c       | 61 +++++++++++++++++------------=
--
>> >>  2 files changed, 38 insertions(+), 29 deletions(-)
>> >>=20
>> >> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/t=
ests/xe_pci.c
>> >> index 0f136bc85b76..969f1dacade8 100644
>> >> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
>> >> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>> >> @@ -307,8 +307,8 @@ const void *xe_pci_id_gen_param(const void *prev,=
 char *desc)
>> >>  }
>> >>  EXPORT_SYMBOL_IF_KUNIT(xe_pci_id_gen_param);
>> >> =20
>> >> -static void fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type=
 type,
>> >> -                            u32 *ver, u32 *revid)
>> >> +static int fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type =
type,
>> >> +                           u32 *ver, u32 *revid)
>> >>  {
>> >>          struct kunit *test =3D kunit_get_current_test();
>> >>          struct xe_pci_fake_data *data =3D test->priv;
>> >> @@ -320,6 +320,8 @@ static void fake_read_gmdid(struct xe_device *xe,=
 enum xe_gmdid_type type,
>> >>                  *ver =3D data->graphics_verx100;
>> >>                  *revid =3D xe_step_to_gmdid(data->step.graphics);
>> >>          }
>> >> +
>> >> +        return 0;
>> >>  }
>> >> =20
>> >>  static void fake_xe_info_probe_tile_count(struct xe_device *xe)
>> >> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.=
c
>> >> index 37ae49f4b648..9fb5df10844d 100644
>> >> --- a/drivers/gpu/drm/xe/xe_pci.c
>> >> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> >> @@ -464,7 +464,7 @@ enum xe_gmdid_type {
>> >>          GMDID_MEDIA
>> >>  };
>> >> =20
>> >> -static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type=
, u32 *ver, u32 *revid)
>> >> +static int read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,=
 u32 *ver, u32 *revid)
>> >>  {
>> >>          struct xe_mmio *mmio =3D xe_root_tile_mmio(xe);
>> >>          struct xe_reg gmdid_reg =3D GMD_ID;
>> >> @@ -473,21 +473,19 @@ static void read_gmdid(struct xe_device *xe, en=
um xe_gmdid_type type, u32 *ver,
>> >>          KUNIT_STATIC_STUB_REDIRECT(read_gmdid, xe, type, ver, revid)=
;
>> >> =20
>> >>          if (IS_SRIOV_VF(xe)) {
>> >> -                struct xe_gt *gt =3D xe_root_mmio_gt(xe);
>> >> -
>> >>                  /*
>> >>                   * To get the value of the GMDID register, VFs must =
obtain it
>> >>                   * from the GuC using MMIO communication.
>> >>                   *
>> >> -                 * Note that at this point the xe_gt is not fully un=
initialized
>> >> -                 * and only basic access to MMIO registers is possib=
le. To use
>> >> -                 * our existing GuC communication functions we must =
perform at
>> >> -                 * least basic xe_gt and xe_guc initialization.
>> >> -                 *
>> >> -                 * Since to obtain the value of GMDID_MEDIA we need =
to use the
>> >> -                 * media GuC, temporarily tweak the gt type.
>> >> +                 * Note that at this point the GTs are not initializ=
ed and only
>> >> +                 * tile-level access to MMIO registers is possible. =
To use our
>> >> +                 * existing GuC communication functions we must crea=
te a dummy
>> >> +                 * GT structure and perform at least basic xe_gt and=
 xe_guc
>> >> +                 * initialization.
>> >>                   */
>> >> -                xe_gt_assert(gt, gt->info.type =3D=3D XE_GT_TYPE_UNI=
NITIALIZED);
>> >> +                struct xe_gt *gt =3D kzalloc(sizeof(*gt), GFP_KERNEL=
);
>> >
>> >nit: we can use __free(kfree) here ...
>>=20
>> Taking a step back, do we really need to allocate this? I get the
>> impression that keeping the dummy gt on the stack should be fine since
>> we are keeping its lifetime constrained within this function.
>
>xe_gt is a really massive structure; I don't think it can fit on the
>stack.  I'm having trouble getting pahole to give me an exact size, but
>it looks like it's somewhere around 23K.

Ah, okay.  Thanks.  I didn't pay attention to this detail. :-)

--
Gustavo Sousa

>
>
>Matt
>
>>=20
>> --
>> Gustavo Sousa
>>=20
>> >
>> >> +                if (!gt)
>> >> +                        return -ENOMEM;
>> >> =20
>> >>                  if (type =3D=3D GMDID_MEDIA) {
>> >>                          gt->info.id =3D 1;
>> >
>> >it looks that it is still crashing in xe_gt_mmio_init() called from bel=
ow
>> >
>> ><1> [146.543510] BUG: kernel NULL pointer dereference, address: 0000000=
000000028
>> ><1> [146.543528] #PF: supervisor read access in kernel mode
>> ><1> [146.543538] #PF: error_code(0x0000) - not-present page
>> ><4> [146.543611] RIP: 0010:xe_gt_mmio_init+0x27/0x1b0 [xe]
>> ><4> [146.544175] Call Trace:
>> ><4> [146.544182]  <TASK>
>> ><4> [146.544196]  read_gmdid+0x12b/0x2a0 [xe]
>> ><4> [146.544601]  xe_info_init+0x50e/0xc90 [xe]
>> ><4> [146.544948]  ? drmm_kmalloc+0x87/0x100
>> ><4> [146.544968]  ? xe_device_probe_early+0xdf/0x230 [xe]
>> ><4> [146.545253]  ? pci_write_config_word+0x27/0x50
>> ><4> [146.545274]  xe_pci_probe+0x163/0x600 [xe]
>> >
>> >likely due to NULL gt->tile
>> >
>> >> @@ -503,12 +501,7 @@ static void read_gmdid(struct xe_device *xe, enu=
m xe_gmdid_type type, u32 *ver,
>> >>                  /* Don't bother with GMDID if failed to negotiate th=
e GuC ABI */
>> >>                  val =3D xe_gt_sriov_vf_bootstrap(gt) ? 0 : xe_gt_sri=
ov_vf_gmdid(gt);
>> >
>> >... so in case of bootstrap error we can easily return actual error,
>> >instead of returning plain 0.00 version
>> >
>> >> =20
>> >> -                /*
>> >> -                 * Only undo xe_gt.info here, the remaining changes =
made above
>> >> -                 * will be overwritten as part of the regular initia=
lization.
>> >> -                 */
>> >> -                gt->info.id =3D 0;
>> >> -                gt->info.type =3D XE_GT_TYPE_UNINITIALIZED;
>> >> +                kfree(gt);
>> >>          } else {
>> >>                  /*
>> >>                   * GMD_ID is a GT register, but at this point in the=
 driver
>> >> @@ -526,6 +519,8 @@ static void read_gmdid(struct xe_device *xe, enum=
 xe_gmdid_type type, u32 *ver,
>> >> =20
>> >>          *ver =3D REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 + REG_FI=
ELD_GET(GMD_ID_RELEASE_MASK, val);
>> >>          *revid =3D REG_FIELD_GET(GMD_ID_REVID, val);
>> >> +
>> >> +        return 0;
>> >>  }
>> >> =20
>> >>  static const struct xe_ip *find_graphics_ip(unsigned int verx100)
>> >> @@ -552,18 +547,21 @@ static const struct xe_ip *find_media_ip(unsign=
ed int verx100)
>> >>   * Read IP version from hardware and select graphics/media IP descri=
ptors
>> >>   * based on the result.
>> >>   */
>> >> -static void handle_gmdid(struct xe_device *xe,
>> >> -                         const struct xe_ip **graphics_ip,
>> >> -                         const struct xe_ip **media_ip,
>> >> -                         u32 *graphics_revid,
>> >> -                         u32 *media_revid)
>> >> +static int handle_gmdid(struct xe_device *xe,
>> >> +                        const struct xe_ip **graphics_ip,
>> >> +                        const struct xe_ip **media_ip,
>> >> +                        u32 *graphics_revid,
>> >> +                        u32 *media_revid)
>> >>  {
>> >>          u32 ver;
>> >> +        int ret;
>> >> =20
>> >>          *graphics_ip =3D NULL;
>> >>          *media_ip =3D NULL;
>> >> =20
>> >> -        read_gmdid(xe, GMDID_GRAPHICS, &ver, graphics_revid);
>> >> +        ret =3D read_gmdid(xe, GMDID_GRAPHICS, &ver, graphics_revid)=
;
>> >> +        if (ret)
>> >> +                return ret;
>> >> =20
>> >>          *graphics_ip =3D find_graphics_ip(ver);
>> >>          if (!*graphics_ip) {
>> >> @@ -571,16 +569,21 @@ static void handle_gmdid(struct xe_device *xe,
>> >>                          ver / 100, ver % 100);
>> >>          }
>> >> =20
>> >> -        read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
>> >> +        ret =3D read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
>> >> +        if (ret)
>> >> +                return ret;
>> >> +
>> >>          /* Media may legitimately be fused off / not present */
>> >>          if (ver =3D=3D 0)
>> >> -                return;
>> >> +                return 0;
>> >> =20
>> >>          *media_ip =3D find_media_ip(ver);
>> >>          if (!*media_ip) {
>> >>                  drm_err(&xe->drm, "Hardware reports unknown media ve=
rsion %u.%02u\n",
>> >>                          ver / 100, ver % 100);
>> >>          }
>> >> +
>> >> +        return 0;
>> >>  }
>> >> =20
>> >>  /*
>> >> @@ -690,6 +693,7 @@ static int xe_info_init(struct xe_device *xe,
>> >>          const struct xe_media_desc *media_desc;
>> >>          struct xe_tile *tile;
>> >>          struct xe_gt *gt;
>> >> +        int ret;
>> >>          u8 id;
>> >> =20
>> >>          /*
>> >> @@ -705,8 +709,11 @@ static int xe_info_init(struct xe_device *xe,
>> >>                  xe->info.step =3D xe_step_pre_gmdid_get(xe);
>> >>          } else {
>> >>                  xe_assert(xe, !desc->pre_gmdid_media_ip);
>> >> -                handle_gmdid(xe, &graphics_ip, &media_ip,
>> >> -                             &graphics_gmdid_revid, &media_gmdid_rev=
id);
>> >> +                ret =3D handle_gmdid(xe, &graphics_ip, &media_ip,
>> >> +                                   &graphics_gmdid_revid, &media_gmd=
id_revid);
>> >> +                if (ret)
>> >> +                        return ret;
>> >> +
>> >>                  xe->info.step =3D xe_step_gmdid_get(xe,
>> >>                                                    graphics_gmdid_rev=
id,
>> >>                                                    media_gmdid_revid)=
;
>> >
>
>--=20
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation

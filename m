Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11DACCD195
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 08:06:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A017C10E6ED;
	Wed, 22 Oct 2025 08:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X3oCXBOW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DCD910E6ED
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 08:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761120390; x=1792656390;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dyck3qbRLc5zjmMzHHkmjFNV0+0in2GoRx3Pdi5udPY=;
 b=X3oCXBOWAituTBv0/WXJoXKbc3ZqQZgoJ+b4swLtmsXPlzYeAIdmEOcq
 q1+/Eql5MgqnZ8qaUqnZUobIoYdGA0psYujstm8uTYQBb0BuGMrGXjXuB
 8TBOZdcVHI5z/E5DX6lOE5Vw8VVmnNPexSulxQF0ubZ9h6FWY+JvHyTOr
 aNusAIKYgnQ3FymaZVByoyWSfMUc8LFSYbuKTvqtOxu+fKEkkMvEM4UhC
 E0vejYwka3YvIkglrrtGvSyCUPfKob3hEGxMe492KacYKpPAvLOfF5wQT
 ORIiG9JMrzfylG2dLPjMEYldJi2qHlJm0zSP+eHCxb+3Tm9iYy+xNlswj Q==;
X-CSE-ConnectionGUID: 2b6nZPr+T9u6rIytZnJRvQ==
X-CSE-MsgGUID: SoNhqMFeRQOhYNx8Z5KeFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80883532"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="80883532"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 01:06:30 -0700
X-CSE-ConnectionGUID: JCHoGTeiQIObbTjw7WNVEw==
X-CSE-MsgGUID: oLJfceS0S/Ww4F955I240w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="214449723"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 01:06:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 01:06:29 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 01:06:29 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.43) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 01:06:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OTxDpFRibXDEpueBfoMUwjZMm8fEvL07eNfcecMv0lFpa8KlZ6nBXsnUWbGfVt1GydobrXYgfCUwaJrXVAKfpbNpjoAQssKA8cNmn/ljqsHnlwjtJ0ly2e20dPUoZbvoBmGoAjwbjRzQ36hAfPAFDDtXefab8PEjqLMQPuYktZRhbD9uUoa1+y2mp2snyo9glu71lxNw0yi3QNMCvV2E+Gq3zPuGzW4ma9q5TPZB54kXVy3dVt0wxj+bVBY4XWXKKpFeJ0dgL1fsS64NxdOjXFQ1vgHjL2pDxW10VuADbz53HFwRA1Nte5WV3ZrHfoEpC5i7Wo4/NWldcRllZ9ytjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ieHOXd88kYh1pe5VjgPpq+IW2wgvMIez6X3bygcaAk=;
 b=FnNzyWeNKAtdmPZfTrQBZ8gmGO49CAYcLMCC2hmfZJHJ942e6fEQhnTCGUCHI5dkA3lXGpqXfmwPw26Nof36ETX4SR7wCG6I3wMNtpQqmPVp2wEgmDPftgmdXMYsuVfxfRLcInHbH9/zgQsXBoL7bUyR/8ER0AItgHb8kYhiXDlg8z5UX6GSqQV0C9w0NWKSFtSczuBoCdpxDwldrK1CMQwyAJjXrIRNtuYT3KeTJ6pM/F+O+3uSKTDKPm/XP4ioUgaEc3Asg5wb8nUsunQgduemjHeNPV52T8o2AV5mYjKDvRanqkf2MxyivBAbIZwJMIgkHF3AKzOzGIzqZuGWwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by CY8PR11MB7827.namprd11.prod.outlook.com (2603:10b6:930:77::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Wed, 22 Oct
 2025 08:06:27 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%7]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 08:06:27 +0000
Date: Wed, 22 Oct 2025 13:36:20 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 03/12] drm/xe/cri: Setup MOCS table
Message-ID: <aPiQfN3YyPpSSMWP@bvivekan-mobl1>
References: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
 <20251021-cri-v1-3-bf11e61d9f49@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251021-cri-v1-3-bf11e61d9f49@intel.com>
X-ClientProxiedBy: MA0PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::9) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|CY8PR11MB7827:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c90eba7-0714-4882-7511-08de1141e679
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVRhdytxakJIL1RSdEd6aW1DQzdtNmpheFU1T09kSXA3R2dLYzlPTGJXVmg5?=
 =?utf-8?B?dkZhWjE2ZEhWUHV4bXFyWCs1ejQrZFExZjBhQldiUFA2djhKUEJ3YXBpbUsz?=
 =?utf-8?B?ZFhNUFNScWZSM3E5RXYxOUd0WG16bTBnYURaMHVoMmwvaFpNazRGT0ZqK3lG?=
 =?utf-8?B?bmNoUW52azRuYXh4TUZacVZSbXVONHJHYlNZZFUvRGFzT2RoZmswOE4vd25U?=
 =?utf-8?B?K2J1TnN6S0NYMytPamVMTlNnM1VwUERST3hKMlh5T3Fqd2xwdS8vWXRpbmlH?=
 =?utf-8?B?ZEF3Z29nQmFTVmpCdVBySkZEc2hCMHhobEIwU3VYK3ZYcUIvUkd3K09WOTJl?=
 =?utf-8?B?TTN1Rjd2dURmVWovVk9BZGNhQ0RLbWlpYXRHNGszTlpyaVp2VDZhenpxeTlM?=
 =?utf-8?B?aElwMUNYQm5idlZmcXlCYk5vYlp4eld4VXpLSkl4KzUxaFJtSUFRWk5DNWds?=
 =?utf-8?B?RHNKZlZIcEpMTjlqaXB4aXA5YjMyZTMycFYxUS9Yekg2V3REZXI4cHVmTjdU?=
 =?utf-8?B?Z3NFak5OaGpHWk5waVdyK3JBTkpJalp1MGorSDlWMFlVQnNzdjU5M2hCNE52?=
 =?utf-8?B?WlNMWUhBei9XQXRxRytBSEFzOXJ4b1paU3pzck11TXlGSXA4ZngrZVVxbmNQ?=
 =?utf-8?B?eklUb2R5cjFEZldPVmhvSjV0eXZKaDk1c01UNkJwaXFLbFRpR3FqQm9XWHA2?=
 =?utf-8?B?VDFiTy9HMDVZeVZtdFZkZ2NvN25pMkFvdW9zWEhwM1VaNFFCK0lxMkVPK0tu?=
 =?utf-8?B?bzhmeEhmSjArVk5iUTkxUXNHNnY5cmNtZi9tZkt3emRPZ0lVV2VjMXU5UWRW?=
 =?utf-8?B?azd0RXhaN1JtUXRBQ09UWkhtSnFKM3ZZQTE3alN3RTBFMysva2hXWVB2RVpm?=
 =?utf-8?B?SHpIVTR0K0gyM0ZvL2RZdmw5dW1KVkV5ZXVYaDg4RTcyT2NGaHJ3dStsUy9J?=
 =?utf-8?B?enNtUktkVWwxY0xmUjJyWjRNbExOeGFiY1hTL1BLRW5RK2FZcDk1OXhqSDNJ?=
 =?utf-8?B?UmZvMzBaMnJXUGUzVmJOZkhSS210bE9OOUxEQVp0aUhtdnArZDNEUU43TExU?=
 =?utf-8?B?a3oxMmZxMENLU2tzWWVpS2FzbFlDdC9hVk5HN1k0OGNkTHJKcjIvRGhjUmxO?=
 =?utf-8?B?VWJRRUpRenByK1IvTkJmWVZOSmpSZGE1MzJNU3gzWjA5c0xWVlZHbkRySlZI?=
 =?utf-8?B?RXhrUFVXYXpWN0VaRGRpNFJzUHhkVDJCQmJZYUtyaXhQVGNaalRaWWQ0QXZu?=
 =?utf-8?B?TFhRQlpKMUEva0htbG5ZT0RjQ1dEUG5NNzdvYTU2a0VMeExBai9oSk81bWZF?=
 =?utf-8?B?L3JEM1h5eXhIbVdYZEVtWnNyYnBnQ2dnRzNEaGpIOXBURmVzNUgrbTZ5OGJj?=
 =?utf-8?B?YWFVc3B0ZUF5bUxmR0tselBBYlZiZVhmcHJYSlNMbE5RWTZ5cW5PQmlVcEFR?=
 =?utf-8?B?cGV2NGtLWm5jbTVuVUZpQkROVm15UFFlWVlPZ2hSalJlMlMvNGpKTy9EWW51?=
 =?utf-8?B?eTNCVElycU5OYkFtT0hDeXRoYlkyQ1JvUHZIYXJNUDNOb004T0c0bHRYTUhJ?=
 =?utf-8?B?RUtubHZKSUY4UkIyRzg5N1Q1ZTF4cUpCTENmMkhIYit6Zk41VzNDWHNueVRM?=
 =?utf-8?B?ZlIwTFNtR2ZCQmpwWXlLblQxd2xyY2R5a051dnZvUzRsL2NZNDl3N3ZNcGhF?=
 =?utf-8?B?dlIxT3pGMG1sbkw4Uk9iU3d4K3IrQjJ6VDFyTTZZbGZodXlscERGek1MZnU0?=
 =?utf-8?B?Uk0zZlhpYnVZNHRpNmx4aFpxeDhyaWN3TFBDRTZoY3hoK1V1UDN1VmdzdXJo?=
 =?utf-8?B?eUtSM3NncW1QOW5zc0ZJL0w0aTY1azY4S2Eya1c5SVNSaDJQSEE4a1JhRmU4?=
 =?utf-8?B?N3JXWDdlWStseUhsdlBtNEdrZ0tMNk5lS21ZY0JUcG5YQUdUREpwbDdENzFp?=
 =?utf-8?Q?I9Apqv2iWyFiogAf/UdvPycHhg9WXu3p?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFU1bGxlbEU3SjlkR1doZlNSejZOb3dNdWZrbFZLcTN6TjBGb2VwK2JqbXc1?=
 =?utf-8?B?cTNVRWlJZnJwQVBlMzR4dTdGYU9iL21XVWxLMGZtV0tURnoyU05NY2pWdXF1?=
 =?utf-8?B?eVl3c3N0YzFFZmxyNzdwa0RBMFlHQnI3OGFJTkVDaEw5VXhUZGtqbE1LSGV0?=
 =?utf-8?B?ODVOeEdpbG5GRCtXbnpya0JkVTFiRjdOZmM5WERVZDA2ZXpSSTNkdDExTHhJ?=
 =?utf-8?B?OE12TU5kemxNNW9wdzcwWnF0ZVhscWtxU2FOaVJrVEhPbHFOZVBEUHplMXF2?=
 =?utf-8?B?amNOdWZyM0U2MHRrcFpGRHNGV3lIMmxkSkdRNFNiT082dkJDemR2KzVsT1Fh?=
 =?utf-8?B?OGVPOEFFT2JKbVUwTThKdW1ITkFsZzJ1cERLeHBoUE1JWlFDa3k5RUxxZFFZ?=
 =?utf-8?B?eVB2OVRGL0pCV2h0ZHMyQUdpV2dCVGI2aHJvQlJGVlNJR0pESlVaeXQrb1pk?=
 =?utf-8?B?N0ZHMHVXSnEzbVNsVDRCQmoveFpYUXd6ajRuL3pZNGJEbDRLYWxYUkFRL1Ba?=
 =?utf-8?B?SHA3c3h0cHdnMnVMOUU4ckVVaHhLTDhBMWIzOTJ4Wkd6aEVtN2s5WWdTOGt1?=
 =?utf-8?B?TThPLzF4NWltekd5aHlyZzV5RzhKazQ4ZWIwV3o3dkpiaUVvakQ2c243T3I2?=
 =?utf-8?B?UkVNdG1lL0QxQWkzN3pDZktIeG5CQ3RENWR1bTJvSzRoYk8yYWRPU01nQ0xF?=
 =?utf-8?B?YTNlYzlXV3FsRlN4Q1JSL1JzT1RCRXB5b1FtZVRDU2NLMVo0Nnhnc2d6NWJu?=
 =?utf-8?B?eXc2d1JEWTlMN1FOcnBmY2JyRW9zZlRucmo5Ykkrb00vUFAyYzhZSGEvUnJm?=
 =?utf-8?B?YmhPVkkxL0xBL2Q1MkI2cDBmdFppNkZQc041TWJoaElKcXl2elYrZDI1MldB?=
 =?utf-8?B?b2xXbTZsNFIyL3NwNU80Ly9YQjhxQkthenRyS1pDTjY1cGFyVmpMaUFlQkUr?=
 =?utf-8?B?cVlRU3d4enFjQ2V2TkdjL2tuVklIVXRtSTB0akJDUTdrUXdHSVVqaUh0WE9t?=
 =?utf-8?B?R0IvNEVKbWJSakg3R0ZKUjRhZmhEbWpaRnFjd0E2aG8rbUowR2N6R3dDRXcr?=
 =?utf-8?B?cm1PWWtzelpMNjBCS3dlVWg5amdTNkErQWdYWDNLckRnMWUvZXhlQytGUGtZ?=
 =?utf-8?B?WU94QkVsbEdCQm5Ia2Nud2lYbW9jZk5JYVIwK2hzMFRuNWJXZnI1dGsxcndK?=
 =?utf-8?B?Wlpidm9TVHV5cDNCWkY4QW80NUxRaFNiQzFYNWNLRWVub3FUbDlxK3F2Mlkx?=
 =?utf-8?B?UWNlZ1V3UWUralJoT1IvYUNPK2tKNWtWNHFYRHFwN1RCZWtOUk4vcnlHZ3lN?=
 =?utf-8?B?Q3pWaGVYUTYzMmhwZFlzU2RyNGp0SGcwSmFxMTBMbFhHUldydUc0QU1oQ1p1?=
 =?utf-8?B?emVRQ2VLZ1ZaYTZWU0dCQVlVRUhHUmZoWncwRWE1VDB2ekY5dHJGN3h5akJp?=
 =?utf-8?B?OS9BWlFjWG94L1JKZllRV25vVWxCa2QzeUdPR1YvcE5SbXB5eFFUVzFpanF6?=
 =?utf-8?B?d3RONVRXYjlvcEJsYWVYZzJkNUVVbzZOTW5qdkMxZVVlK1k4MlhPbldMaWpi?=
 =?utf-8?B?M1F3eWQ4alFwcEh0bWIxZ3g3RDJVeUl1RURNbzVhbktEZkJ4U0NSKzRuK1Nj?=
 =?utf-8?B?SDdsYmNDbi9nQ3VVdy9GWU0ya1RERVB1SytCcXVVU2JVNDdlbFozeWd2SEFs?=
 =?utf-8?B?SFY1WGFoV0ZTVXFuMlY4MEZ4RTNrZ2RnRGlTcnp3QmRtM1BTUmh2ZVdIb0Jy?=
 =?utf-8?B?Mis0RFRBWkVrc1g0NDkrQUJ5T0RZUGdxZk13aGxWb1FsREQ3WTZ0VjQ5a0xk?=
 =?utf-8?B?VlI2YkdWL2NhK2NCeTRJTzkzUCtzamQ2VmlHMmhVQXJMRm9LSWtqTDdGUFor?=
 =?utf-8?B?dU5aUmwvZEtXbVM2eUpjN0h4aVlLV0FSQWpLM2F2dnc0M1JJUkVwNFE0aklX?=
 =?utf-8?B?NkNaNklXUktubEhFRDdvWElwVWRVNkh3d25mTlFJOXUvTi9Zd2NSY040UnlG?=
 =?utf-8?B?TmZDS01DY09JV3Z5RUNzM0hMNFY0T2NwWisrZ3BXaWRHdUw4QkRKblA3S0Fu?=
 =?utf-8?B?aTIvR1JQNGk2OStnRUNES3lzWElRdHRYdjJWUEZ5TlZzOTRoRDcrKzhFVWpk?=
 =?utf-8?B?UW5YOHgxeXdOSVVGMWgvUzlsYzA3M1R6VUtNeCtoNUdQdmhsaGZSYlVWeC9X?=
 =?utf-8?Q?fRxKVKlasVKyDaX0Co3ns74=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c90eba7-0714-4882-7511-08de1141e679
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 08:06:27.1959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wsF+JD/e4mGV4dJjVfOdSZ2WTnWq1+uNWkNq24DrYdo+HPNB0r8Y0L+9T9a17d6Nmzsq82mCYr64SrkR7jBkEdiuhwpObJvWzmQQiees72D6KkW+zpz6PRxQI82xvqA0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7827
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

On 21.10.2025 22:17, Lucas De Marchi wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> CRI has a new MOCS table, but uses the same general ops as other Xe2/Xe3
> platforms.
> 
> Bspec: 71582
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM.

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_mocs.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index e8ec4114302e5..6613d3b48a844 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -568,6 +568,23 @@ static const struct xe_mocs_ops xe2_mocs_ops = {
>  	.dump = xe2_mocs_dump,
>  };
>  
> +/*
> + * Note that the "L3" and "L4" register fields actually control the L2 and L3
> + * caches respectively on this platform.
> + */
> +static const struct xe_mocs_entry xe3p_xpc_mocs_table[] = {
> +	/* Defer to PAT */
> +	MOCS_ENTRY(0, XE2_L3_0_WB | L4_3_UC, 0),
> +	/* UC */
> +	MOCS_ENTRY(1, IG_PAT | XE2_L3_3_UC | L4_3_UC, 0),
> +	/* L2 */
> +	MOCS_ENTRY(2, IG_PAT | XE2_L3_0_WB | L4_3_UC, 0),
> +	/* L3 */
> +	MOCS_ENTRY(3, IG_PAT | XE2_L3_3_UC | L4_0_WB, 0),
> +	/* L2 + L3 */
> +	MOCS_ENTRY(4, IG_PAT | XE2_L3_0_WB | L4_0_WB, 0),
> +};
> +
>  static unsigned int get_mocs_settings(struct xe_device *xe,
>  				      struct xe_mocs_info *info)
>  {
> @@ -576,6 +593,15 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
>  	memset(info, 0, sizeof(struct xe_mocs_info));
>  
>  	switch (xe->info.platform) {
> +	case XE_CRESCENTISLAND:
> +		info->ops = &xe2_mocs_ops;
> +		info->table_size = ARRAY_SIZE(xe3p_xpc_mocs_table);
> +		info->table = xe3p_xpc_mocs_table;
> +		info->num_mocs_regs = XE2_NUM_MOCS_ENTRIES;
> +		info->uc_index = 1;
> +		info->wb_index = 4;
> +		info->unused_entries_index = 4;
> +		break;
>  	case XE_NOVALAKE_S:
>  	case XE_PANTHERLAKE:
>  	case XE_LUNARLAKE:
> 
> -- 
> 2.51.0
> 

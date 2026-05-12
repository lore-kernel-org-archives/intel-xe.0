Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FC6CD4855
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 07:18:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A23F10E984;
	Tue, 12 May 2026 07:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IDJPRmM6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0873F10E199
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 07:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778570337; x=1810106337;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=Fduf8CSCX1wrDwPZr3g3nzctzINw3iviQqCER2z8A2M=;
 b=IDJPRmM6KgiFXRx0VrdtDXrXyWuXH1waTeDCQxzJ6nTMgLcREFnHI0oq
 11lP5eChRXpI0+8gZQ/JeEaIVtH30vrH8lBDsViKULiSZSIReVnHRNE4p
 gQHBqrSsOUjYEtvnigWobTh7EVnUjDJQm8QF2JJcrR8WRYw8Mua/DG9MB
 2XHMdkgAKg8BV7z2xL5nLPI/XzlzCXIHEEQKGL7uN5slywlC98jvXRjUH
 f+HNe31khFPWcY1ItOm9wJQtTfQwC7bf7gA2vmV1MARydeYy1mthakek9
 O+OfcE8fG9kcgXAgJlhPwBezD8RUaZUr9+RUKRC6wn4iqQsvyHgDrXyyS Q==;
X-CSE-ConnectionGUID: YAGlqhmtTCOic+ZMk0pQyA==
X-CSE-MsgGUID: 1qAmVPbsR7+tc6U3gq+TZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79331757"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="79331757"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 00:18:09 -0700
X-CSE-ConnectionGUID: ZgqEwFl+QhGq1thi1dplQA==
X-CSE-MsgGUID: HivQaUdEQROuEAuDau47vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="231288347"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 00:18:09 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 00:18:08 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 12 May 2026 00:18:08 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 00:18:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DXXF9M6qXW4aH7ClnKnme6/tHVYp4mXjBz0hzT3QwFYJ3ZqnvI+Qj1oJho97pQCBWe1YMC6tECM2Ifgz4qrtiplMRyJKIOSpdeQ+RXAq9ildSxh4wQqqKsKBTNXdldbVN36c4CayqlZD2L8MOFu+rDC01ddPsUOyNE0fP1E2ogz4fYQ6X0NxB5PTbmCNFqCcI+ZKbazkhQpbob4c+Gogcp9EuX2reZdpsOJfV2Gy2Vo52PrqMvT+bYttNjzLZHvwW2aSXHWtj7fUQ5mDrP8HDkRAWfgfA6gsDE6nbr0cBrRvD+Zp1PSy44b8/lMYMPla3hdTdgwOtIzUwjJ6mzziWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3OUysPlOhzrxYHVEybJOLF8Q+NSxotEhqoH8UBo9Lc=;
 b=aDf3PRPnuLuoqPX2U2Kqf4JAGoIaeISIUn4LBY9KaQ0Ho8PDeDxJ2YWC5kedYM3MgtgH+ODDXV2e0v+ZaOZcTJ/TvfWsCFS4JrcjvutpaS4TQwqWS/p0Xxaxg3H0hBLVSVCapAwFdw7Lmqd+E5QtnLAMhja/KeCqlKC7PMcA5a2SX5gQQqII/OfOBsnRB2ReX15IskIyOGK9Nb04wlgueVyMtjDNIxhkSQbCyTNgYWHcpg+OyGqzE95BbmkujyqU6q+MwtQKsQJhgeCECW+g62R9YNK/aRwysPJR1WTT2YjJO/eaZzV0iH1eHyEv6/XUb7zCBPIpv5UkR/dIyLmVJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by MN6PR11MB8195.namprd11.prod.outlook.com (2603:10b6:208:47f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 07:18:05 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%4]) with mapi id 15.20.9891.008; Tue, 12 May 2026
 07:18:05 +0000
Date: Tue, 12 May 2026 12:47:58 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: drm/xe/devcoredump: Drop a FIXME in devcoredump
Message-ID: <agLUJsi3ZoPFyc0j@bvivekan-mob1>
References: <20260512055508.1380191-1-shekhar.chauhan@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260512055508.1380191-1-shekhar.chauhan@intel.com>
X-ClientProxiedBy: MA5PR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::15) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|MN6PR11MB8195:EE_
X-MS-Office365-Filtering-Correlation-Id: be4eeb99-0823-4db3-82ed-08deaff69c2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|11063799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: djqrx6P/7s427tRpoj/NLMoPVYZs7HnEBTjnEnjRV/4c1sqh1X+j3OAdI3p0/5RZZLeAie1/E6GzGmeon4M5Z81HJzidtWODKGxWngBtuGWS0YkOfAMpqHslflqrj8lU57u1Kw/Y9WTmeQ85PL6B0x5R/ujeYP8k6IaCmLwI1FfC3CgrbaFkTq9nfPYISK3kUtd8ubNzAmnLnNjkmXo6l9rLdEEhMNJdnNpQQ+uJ+t0VmuuKpMkcBgDHam4I52F5RQlZBKPz5EyCn9R2fVxczXN5wkXeug6h8gsujG0x3qRh4dQlixaHj5Cj3ipf1Z/gpP8bWYEFOphTACC8iiyQg6+t1InAMebGysici83thrPUCnkHz1ZGjDzyRB0tk1CIAc1AjmPp52727zVTfE+L9pG6PgvuhZ5x1v/6mVs1bG/5JcazRFkbo4H4Tj1lBWAENB4O0H5T3qDwU7An0CQzXqRoREpXHhT+hN9TZqaweHE4LJytFq1sUJL4bWaF6C8t2gXJ9nhiUkTOfg2bunr+zJao1GEs8fXkA1fV66No+zsAXBSIvkJjqmRqVj4Qk2WDAJdtCvpeTqQWUBVsKamPzgG5/h+tDdsjb7O5zaWMCSmDbof4toZ6UfTiMZMfBnQ7/SRPHyHNJzmvYVJyXxoeSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(11063799003)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmsyZjlsR2o1cjRsL1dhWm9GR3FDMnFqWDZQdFF4RU9ROUVIVUJLb0lGdGV4?=
 =?utf-8?B?VlVUMkU4QnFYWXBRdWFKendaWHFDbk5RU0xTYXVkSkRhaHVFUzltRmtJZDJi?=
 =?utf-8?B?Z2lzcUp0MzM3ekR4WUVUcWdUTzJjbytmeFYxVVFXejdvVGc4OW42TjZ0YWx6?=
 =?utf-8?B?TlgyTyt4UmdLMk80MEJBTVdoTVZBNjJOeXd1SWh3bW1jRnBNd0FqRmpCWFFy?=
 =?utf-8?B?d0N4NXFQZ3VSK3BORk1mQXRjanA0UzNvQ2tlK3V6aGJXWndBWHVNL2IzTFFB?=
 =?utf-8?B?SE90WEZwVmlhcjRwQWoxTjNXK29XdGFHZE1kOFRrcnE1V3RwTS9ZNlRhMnh6?=
 =?utf-8?B?aXRXZ1BNNFBTbGdKbVROaFI0bGNGWVF5a040MUorcFRLRGZidGEzSCt0djNl?=
 =?utf-8?B?SkFTYnJzeGRKdVFUSTJSc3pHMFJhMUtFSjBlcXRFWkJsSThzaTdueGlyMVcv?=
 =?utf-8?B?VEd5aXhOMHFVRnkrRkdSNks4cnA0QWhTa2ZLcDViTUFjaEpmTmJndTFhNHVI?=
 =?utf-8?B?SlhNWHY2RzBLSkE2dUgrQWsvODY3WE1GLzEyYjhZUWFZeUxWaUxlVWU5T3Zy?=
 =?utf-8?B?NFZ6UzZ6ZTVvbTlnSU9WZmZBNENvUEpMTm5uMTgreXRaaFZ3VkZaVEx6OFc4?=
 =?utf-8?B?VC9ESE1SR1VZZUlDclYyTzc0ODZjRWg3a2IybVg3ek9QQWZvcVFOeFhTK3lF?=
 =?utf-8?B?QVVxYngvS2Z4VWNOK2RvL1Vma0NVZElaanhEWnlJV1NKRkdkZStUT0Y3SVJj?=
 =?utf-8?B?a3NTWFIrMDFGZU1rVGhGaUUySlZuZFlldFNiZVpMYW05Zkc3YjhFVzZ4bzgz?=
 =?utf-8?B?MUJqQnFvck0vNVlJdW13UEd4TWt3TXU3Y2FWc0NFTTdHSVJ0K090RnNUU2ln?=
 =?utf-8?B?bEI2UC90M0YzMUxkR2tPTXBuTVBPVHJVRG91MC9zRGVLMkhZUTh0ai81ZEZv?=
 =?utf-8?B?Z3RnbEFPYTRFMWxsRlZBNlBidnBWWXlMNG01U244cU5pS3JKVTlCbFVFUmF6?=
 =?utf-8?B?QUwyUTc5N3pHWUJjODNGK0VhcTUyb3UraEVsNkFnVXFuN3Q2Zlp4T2lvakU3?=
 =?utf-8?B?MVRKeFFTQlNBN01UQUthcHJXS1VpZUh2ZmoxSWF1enZZTVN3a1JMVHpHYkRy?=
 =?utf-8?B?eTVkbm5seDZmRktCM3lwNnF6c2JVOFpnQjdMTUhIZ3lERjJSL1RQV3dWRjMx?=
 =?utf-8?B?blMyQzRDTGkwaXZLNGR3R29HakQxRWxsaFIwa3d6V251SGJQdWhRNmFyOVFU?=
 =?utf-8?B?K0lYWUNnMFJmRXBvNi9yRTVzZzZSKzQ1NVBLQURLbHltQ3JOakU3RXVUNUhj?=
 =?utf-8?B?d1RqUU9RbWs0TEJ0eFVleWQ5cHBWSUZxSjEwaTNEc25NZVA3RU1KT21FMEw3?=
 =?utf-8?B?emtuUnNINHd4YnZjcVZjRExmYy9scDhpc1BLelcwOGQ5QTU2b3Z6WnlDdksx?=
 =?utf-8?B?aUdIRitmOWRQYXUrRVpFcStVOTg3eFBnZ0tWWmRxMTBodWZ4bU50TzZvMjFJ?=
 =?utf-8?B?SkpYdnppMm16ODA4R0JNenQwQlZtdUV6M2Qyd1IzMWZjSWZ1MHVJYTZWdFBZ?=
 =?utf-8?B?ejN5QU1YbEZQRGkzbWgwMkNtbHF3RDYrZEdzS1o2aitXVkFSRjBtZTFqQit1?=
 =?utf-8?B?bkprUW1qcG5haXdzaHV6a2lZSUI5M21YQ2hRSjQ4eW5tWFcrRnVqWDlQV2Uz?=
 =?utf-8?B?eTRsQ2ZDR3FKdUhMQXlpOHhCQmdKWm1xemNMUEd5M1l4djZiaDNKam9uOGY3?=
 =?utf-8?B?YmwwRG55a0tVOVdLam8yaFA5WGJKR0ZMZDhnWGFPemt5ZGxrZ3VkSWpuMkxE?=
 =?utf-8?B?cDZUbHFtaStxNEdsdzJYMVVqcXR6c3ZMYUkxbmtFeERGSkF4VFVNM0h6ZGVC?=
 =?utf-8?B?Nzdqam9Fa205TjE3bFJwWGh3Y1BwaXU3YVJJaVNKd3B4OEdWWEJVREREU3Z3?=
 =?utf-8?B?cG1BRVdHSlZuNEZuVWYxbVFpMi9wZDdEY045YUJ3eG1DaE51bTl6dG14R1FN?=
 =?utf-8?B?QXVYS0ZEM01lMWFwWkpkSWZSM3NNMkRQNHhiNlUwL1h5ckZ4aTRoK1NvV1ZJ?=
 =?utf-8?B?VHhaK1QzMG5mV1B6QlFCU05jQWsva2NtWGhIb0l5amFsY1hPOWFSYkwyRUNW?=
 =?utf-8?B?K1ZXU0EvK25hY3Q1UTFzbTFLS3hNZ0Q1c2tZTWdzL1FOaXN6Q3V0a2RxVTRQ?=
 =?utf-8?B?UW1MTDVlenQwZDBHcjBCc2ZIYnRPRzk4UHI0RzA1UjlDWUVvWGViUHpMYzZq?=
 =?utf-8?B?VWNzUnVWYURkRWYrblBveGhTYUE0NTZTTFlHMEJhQitmdU5RTnR6VjZvaTY4?=
 =?utf-8?B?cGczWnBDVUpmZkJZUC9HQUEyTnJPdDdTdnZnNE1zMEVNVWJDTU9wNGZJZzBG?=
 =?utf-8?Q?AmbMLKkLIHP74KHC3zyYpCPjowgS8ca4qQBRH?=
X-Exchange-RoutingPolicyChecked: QP/Eut2L30OpdZxkhNHXeUU8pyqUoFcUT0xdwLV23Qa3mKoPBigQQcYJZ4pYIz8QWsVqwIBKkKKZgNX6sz5qGQv8AMT60vhhVReDDeddi+/mqAN2Xa7WnF2yyIXTfpWRy6TL0Tj5kp3tHyud7K2wsxGlvy4sr2gZYNNfo8Kw1s3Im9y7q31EANdB8aehDhbaNDfV6+t26Jov9up7+K/Van69ENJOUj2sGZtD7Bhd2QU21T4DF4f4ox4q4pWsVcVAKRImdZZZvs3WZ5gSHhtFFPiac26nYkdu1UORzh0CdIfMbVZElEMmUYBbKShFet8PtJaZ7dk64UrfnYn+c5SA3A==
X-MS-Exchange-CrossTenant-Network-Message-Id: be4eeb99-0823-4db3-82ed-08deaff69c2a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 07:18:05.2078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8yybrKImIURRzGqvUYlSgL5C/9AdWP7BdaHVsDttzJv+FTIfjrCI26QYGV0XVwLEtljOqv67JLwUD62bYcZUt3lqKIJcdnGdx9mUf9Japu079Fqw4J/Pw1nUYg3rBX/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8195
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

On 12.05.2026 11:25, Shekhar Chauhan wrote:
> The FIXME says that xe_engine_snapshot_print.. is accessing persistent
> driver data, unlike what the FIXME says that it does. Drop the FIXME
> since the current code is not going to access the hardware while
> dumping.

Is there any typo in the above commit message? Did you intent to say

The xe_engine_snapshot_print.. is accessing persistent
driver data, unlike what the FIXME says that it does.

After making that correction,

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala


> More details about this patch:
> https://patchwork.freedesktop.org/patch/703884/?series=161407&rev=1
> The starting two feedbacks make sense and the original patch is wrong
> in adding those changes, but the last feedback is the one which
> highlights the point.
> 
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_capture.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index bc49e40165a3..21f7caf9ea08 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -1841,12 +1841,6 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
>  		   str_yes_no(snapshot->kernel_reserved));
>  
>  	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++) {
> -		/*
> -		 * FIXME: During devcoredump print we should avoid accessing the
> -		 * driver pointers for gt or engine. Printing should be done only
> -		 * using the snapshot captured. Here we are accessing the gt
> -		 * pointer. It should be fixed.
> -		 */
>  		list = xe_guc_capture_get_reg_desc_list(gt, GUC_CAPTURE_LIST_INDEX_PF, type,
>  							capture_class, false);
>  		snapshot_print_by_list_order(snapshot, p, type, list);

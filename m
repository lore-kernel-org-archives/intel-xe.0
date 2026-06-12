Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C333BCD98C7
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 00:17:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC1510F1DC;
	Fri, 12 Jun 2026 00:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ABn0BKS5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4155110F1DC
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 00:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781223444; x=1812759444;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9T3jmQQKM2rce3IFNan4zyUCKnUK8tzRhCkJzT66v34=;
 b=ABn0BKS5BkE7cNMjc3lDYHMhCUxdTNscSDM6BzHcFUs2i2Co+KnfSfP2
 /1FGtvGJVPPmlNSlD1KAI7BQmQKEbesrlW6CC9KMQ9dF0SfzX2TXb4fMT
 VmfJFKKDJhsUW1HDp25cO1TDOqJlgGh/hrTuZPRAbQy8PNCBe9VjIFypY
 7PmJXS01QKT50Zuh6JJctjvEvLk2Xv+V9L3K6A9MiquFymod5cvznQyxU
 hf4zmaxnuSnWLG8kSGWv5XB15DY+xToahoMn75oxviBGNnMA9UCfYn46v
 ThFw8BmoAwD/aqybZpOn3s8Kwl1QOYzBNbhp1Iy1rN29SIrmsUf3Bl253 w==;
X-CSE-ConnectionGUID: SDH07G4ASQiaHsSf36Th+Q==
X-CSE-MsgGUID: fqTnyqcCQL2ri9u7veRPjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82036749"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="82036749"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 17:17:23 -0700
X-CSE-ConnectionGUID: my4NqmotR/KZoiEu8dlofw==
X-CSE-MsgGUID: KQVcLcZUQAW5vPK+VDw0vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="243722756"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 17:17:23 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 17:17:22 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 17:17:22 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.71) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 17:17:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jo9aGPRMuPu8vxmxZl+nYX4W0b9DqCcb9/soMs3aPkMOquzAcWB29pgT2StkGyVn+sc5f+3+3oq4YsJeMxj14bKRFz7hCq+x2P720BgCqcp7za8kYRdVwKjhfEdBRr65rpv2uhtxf2ABRy55LVsQsAmyDo3/NoiHYKwQfmG9d1kzWF+bclS2ReNxBQTcrTiCu5cvfQhFXDHbmphlNPb3xE/FANnjFmaDnjMtqvAA6TvOkYIKkgdaEaXTKAIDNEFnToU7NdX5uZHofU2fdI4X8Cz6ngsFUhQ7/0DaI7ZUVG6bAHiL0ytAKWNMMcoWc5v0uAC76k8xzDUSCnAcRcMHRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8dtV3VxyrIa707SDOkKhz5GHAEVNE+F9LIdfhntLO+E=;
 b=JBnE8HzSxIW6E62W+Bdu98KucwhnFHn0SHPDLRduaoidYekkjUSZoEsytuJ8s+1ynNzGcBfgd+/G8gIRqhfct4QI9j0RpKuewN9xQDNE73khO0b/3jYVRtou1f5a9sn9NeDnBCzQ94pc4fh8UOkJzie1Q/FH0XT4YFQ6e05V0/Sc0TJ/uEvUyq117PuKhXk8XeLcZvDQMviupKvb6GXB6EfbLlaxCn9CHUpF2SJxvNhip236JGGZDoE3hdOO4dvPlVYfCdeai/rRupwy15zX1VaEAiZ1LQyYZeXlHst5VeZtQ57JZxNTdiJDWg2ZeinHGBOBZpMjqtegJ9fAvw9L+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5937.namprd11.prod.outlook.com (2603:10b6:a03:42c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Fri, 12 Jun
 2026 00:17:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0092.016; Fri, 12 Jun 2026
 00:17:20 +0000
Date: Thu, 11 Jun 2026 17:17:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Wang, X" <x.wang@intel.com>, "Teres
 Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Levi, Ilia"
 <ilia.levi@intel.com>, "Wajdeczko, Michal" <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 00/11] Enable per exec queue MSI-X vector assignment
Message-ID: <aitQCPpBkgchKNos@gsse-cloud1.jf.intel.com>
References: <20260610212833.153366-13-stuart.summers@intel.com>
 <ain4aHd9KLMh+2Fd@gsse-cloud1.jf.intel.com>
 <7d5380e8499fd44a91bbecca387e2f7b09828412.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d5380e8499fd44a91bbecca387e2f7b09828412.camel@intel.com>
X-ClientProxiedBy: MW4P220CA0028.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5937:EE_
X-MS-Office365-Filtering-Correlation-Id: 95ec16f9-b050-4db1-c7b8-08dec817f79d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|6133799003|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: eXFUzUBtCONr+x8/aFUVIJ2Wr03MPqZb8URe5AQd50YHKG/lKEtBInB1sYxHGzOnxrQagRxWCbDXQCMAE/TsM/++lF09bOVbuQBSiKtrDZOj5SZ3T4w7lHLSG6dKTM3DgN0aiVoQ263AGlwTBO3oPRcI/gJ4oeIw/k9/nZgabDMs2tmSzpSHoHvmd2Ypr7s/h1W5kQrW8omfYTXSFQksg9JB6dmYMIoo70mMNgjQ/VGw79+Xv5AEVmqgHpuH++nfiUj5wxf+Wnrrg/aCvF/iq2Rg74ngN9Yd/Co5Xry7OERKRjj1ZUmwtuSelElUwQJjY+BdDw1LcipdwjMwuEJUCa3NSJBVdjq+oMao4OXIsNHcr30Yi/v6bogMzbphG38MBXYf56d56d331ibg3dFziuhCIWS3iSuTu9kUCS89hX8usvZFvT5K79zAPGQy9RLNFQZvRYJEMSM7lTst0rTkOu6+lGHWnnD1+997jBnhotiA89Zn/6XX00Sz4YQIrEnpwOS16SBbe+dTMhNEcRgPeCcGsQI2/a0qWA0NheLtHya3CFVoFimAzneOmn1Ye6XqZi0rAsoPkHq84fDizvtjqPfzwNrfAN6nw+MLabSi+pTZolJwG5XtnkCbh7WZiPAfE/9sQAwx6bGlW289NM/GdyK34wSUfh1RlOHsZxaclOftK3tFbfcIJUHzmQ6ZF4Qa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUVOK0tMUmh3NjB5bWNvV3ZWNEdpbDNDRW9xcElsMFhSSGFvb2ZrRkNKUkV0?=
 =?utf-8?B?V2MwVUh3Z3ROdS9KeFdDekMvQzYyZWh2ZXJmdGhRTDE1cnhtWHFmOERodHRk?=
 =?utf-8?B?NXZuN2NjSHNaL1M2UVRlWjVRKzE5a1hmRHpKR3JScXY3V3dxdWp5Y0p3K1VB?=
 =?utf-8?B?YldGUU5mODZheVhmMmRXdnFRSUlmbEIydkNjZ0ZabWprNHJwcytGQVptY21S?=
 =?utf-8?B?T1lvQVB4T3laTHNLRVFrR2t2L01WQzZOcVNoVHFINUdSZU43M3FFZmwwQm9O?=
 =?utf-8?B?OHJhRitXd3FNRFAveGprc090MHZ6UlRuL1VVM3Y3eHU5VzhpN2JEWVdQSjFN?=
 =?utf-8?B?NG5wWi9QWStESTBuQ2dpTVJ6YzViSmVaazB3djJWUnFjOVRVYTdNMUZqZ2Zl?=
 =?utf-8?B?OTdNUHVzejZzQVl2YjBjaDdDRVpYMXhNZFdDOFFIaWtvK1dkQWgyV2lBTENI?=
 =?utf-8?B?cmR1NCszeEJtRUVFQ1JVVGtMczFBTytwM2NOdUE0eDRZS3FVa095MVczdWZX?=
 =?utf-8?B?S1ByTWFQV1pHN2l5VWxoNnhoSEJLVVZGSXdJT2tnMUFhTjZnNFVQOUZNOHN6?=
 =?utf-8?B?bWpBUGJnVWlLelo4c01FaGNEWDdVWmJZNzFNYVFXeHJTaGJZdjlNUFlvRXd6?=
 =?utf-8?B?Q0QxeVozaUJuNVVtcnlQOHVHTlc2b2N1WXg5cmRQOG42N0JxUlB0QUJDVHNj?=
 =?utf-8?B?NVJMWDBBRFJtWHhXVVBDcnNJRkR2VzlMV3ZtU2svS1pnOTR6R1ptVUtzQ3ps?=
 =?utf-8?B?eHB1bC90b1FRRnV3di9XK2pmUXNJNWVhU01HSVluaGV2bVVUcW9wcjVSbmJG?=
 =?utf-8?B?MVpHbjkvbWFDTzRrQUIwRnBsNSt5emhLOXVoN0JOaVR0aFpQcHlRanRYQk4w?=
 =?utf-8?B?NU40K1AydFhZVjhWQkwyay8wM2hqcjkzNldwYlJFZjFRQkg3QkRXNFlSTkQx?=
 =?utf-8?B?STd3VjllZzdidXdxMDJiK00wVWVrZzlmRTlQZFdZMjIrZVJqZ1E3eWtKOU9E?=
 =?utf-8?B?aWJ3WG1YVm9yTW9yazJicmhEckVCSHIxL3BQOWczM3QyQ0xpeURISzVQREpJ?=
 =?utf-8?B?NDBoM3M1ODBPNGplVXZzbzhJeXpEL3YwMTNzSm5FN05OM0JWcWpoYWYyODd6?=
 =?utf-8?B?Z2ErZm9HWElMOExIamYySTJLUko0RDBWL3VET3p0cWxNd0t3dUFuYnpZT1Fm?=
 =?utf-8?B?QXoreThPWXI5cllJeks5bjFiKzNtRmV1Ti9pRjNpbFRHRFhTVHFVbzkvM0pl?=
 =?utf-8?B?cDhXaU5oNVVmZ1NYbGJvVCtHUzBsRmZYY1dwLzhlYm9YN2JGRTB6dnRiMWtG?=
 =?utf-8?B?dndBTVlXRjRuaUxsYmo0MjNUQ1dEOHRHTXpXSzNmWGV3WXo5R1I2KzVhaWxT?=
 =?utf-8?B?S3JYT0UyWVJkaFFJZmJsMVRzYVpBSUtMV3JRcXZBWHpnVGJyVGVuK3NJSTF6?=
 =?utf-8?B?MGt6UUU5dnY1MWFPUFR4N2dBcTdXV1NIV0VyQ2NzU0tsZktGOEtDYkVBQyth?=
 =?utf-8?B?YlJLSDNKT1NWL3pZdlZKT2o3KzZoSDVBNWJGdjluWERLQy9xTVduc3hBMDJZ?=
 =?utf-8?B?aVljY3JYTkRXcjhKYmtJcnluSWtDeEN2MjBKajNacnpzdi9SVjRlY3l4Z0xp?=
 =?utf-8?B?WVpVdWd5UUNBUXpEN3VCUEU4eWhjdHBCaDdadFNYenBrVEErOVhyQnB6UFht?=
 =?utf-8?B?aVpTVGVFMmk5dUhkcmQwUEJxSlA1L3RJRnJXNUdFV3dvM2dRL3dVTERaVnlr?=
 =?utf-8?B?S3o1Z2ZPVmFNa3pOZGlxQXhyRGdvV3hLU05JdUZsaFZnOUJSK2k5NGdZWnJ2?=
 =?utf-8?B?RHBIbUFVM1hSdWk3VGN6S2hVQVlCZkpDL0N3Z1UzL3Y1MGJFdUUvMmx4dWdu?=
 =?utf-8?B?QW4zbkV6QWZsdXpQWG52SktJWjI4cmJhelYrQksyL1NBR3Roa05PWUFlOE1D?=
 =?utf-8?B?MmdBd1JhTm9vSEhQekluWE1iUGwwUjlkV1E3cUtybzhjTHUrZlMvN2NLK1VK?=
 =?utf-8?B?WjhobFc4QXphblRLdHVDNlZCUzhrbEFKdWpCcXJDVDhxVWJsZ0hrdC8zcjVK?=
 =?utf-8?B?ZzNWQkVhQWtCVFE1dUhJeGNXVkFWZjFGdTI1ZjZDTzFzbEtLVHczQlVOS0tO?=
 =?utf-8?B?YmkyTWhOcU05T1E4TE0wQ3dqcEpYbm1hdVMwd3R0cFhqRHVuZXZDanRza1Jj?=
 =?utf-8?B?cVJOTjJMc1JFY1pLdkdWUlJFcHN1YmxPTGpvNXFMUzZQakYwOUVkVlQyYWpV?=
 =?utf-8?B?SHlZUEFvNXdzUDZ2N2JpNTMxYm94RUtBL3JScU9od0x5MjRWa0ZYNlptMVBU?=
 =?utf-8?B?bnovTTRqY2VxY01PTzNBQ1N5TlhlRDRmdFVrc0RIc2RRVHpzVFNUUT09?=
X-Exchange-RoutingPolicyChecked: lVq5YqV5BMnw56p+cbEBYIzJqP4FYN6t/pVon7nFHVyrF0mz5AbuawXXku378z2i3VaL5R66fnc8SjuAXyhuG4SkzFoUzEPVzeu9iIrd1GTWQO6Xh2iWD7TjVceo+VNSe24wY/xxXqCkS1Acry7mbnDUYDHnvA54pU0J9TNS09RKXTooL86Z/um2xkBZYQSJ/Mjt0G0Xi+yYKcvSahIZfueUKt6aX9Zm8m7SSGpHSucE5IPeoxoU0H6f0zD8aWgFp0XQg921R+kcmg9sMHsmI7L5m9OrBvcfno1LynTyIKzLjhfxwVK9KQPvonJpO20JP1vvJYBR63UCk64pAq4jfg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ec16f9-b050-4db1-c7b8-08dec817f79d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 00:17:19.9028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HqLze/PcFayYOzisFCfnnrPRCBR2kazH/0xczh8AyQJInIRnw+9WjJXkQ1n/Ae922MqH/QH9YRDy9MH9s+NfUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5937
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

On Thu, Jun 11, 2026 at 05:08:07PM -0600, Summers, Stuart wrote:
> On Wed, 2026-06-10 at 16:51 -0700, Matthew Brost wrote:
> > On Wed, Jun 10, 2026 at 09:28:32PM +0000, Stuart Summers wrote:
> > > This series adds support for per exec queue MSI-X vector
> > > assignment as well as a per exec queue wait queue in the
> > 
> > There’s another improvement we should consider once we have MSIX per
> > queue: assigning a unique xe_hw_fence_irq to each queue with a valid
> > MSIX vector. In the MSIX IRQ handler, we could map from the vector to
> > q
> > and only trigger that queue’s xe_hw_fence_irq.
> > 
> > This should reduce IRQ overhead, as we would walk the individual
> > queue’s
> > list of pending jobs/fences rather than all pending jobs/fences
> > within
> > an engine class. We could also introduce a variant of
> > hw_fence_irq_run_cb for MSIX that immediately bails when it
> > encounters
> > an unsignaled fence, since the list in xe_hw_fence_irq would now
> > signal
> > in order.
> > 
> > This can be done as a follow-up, but it should provide a significant
> > win
> > in certain cases.
> 
> So I was trying to limit in this first version to compute use cases,
> but maybe you're right we should go ahead and include this for the non-
> lr cases. I'll also review the sync case you mentioned I think in that

LR jobs are now tracked in IRQ handler to support VF migration - so this
suggestion applies to everything now.

> other comment.
> 
> I guess I'd rather keep all of that in this one series. On the one
> hand, I do want to get some of these changes in sooner than later so we
> have this use case aligned with a lot of the SRIOV related changes
> going in here. But also, this isn't such a huge set of changes that it
> should have that much of an impact. I'll take a look and get back if it
> seems like something that should get split.
> 

I'm fine either way as long as someone picks up this suggestion sooner
or later. I suspect my suggestion here will be an overall larger perf win than
this series and shouldn't too difficult to implement.

Matt

> Thanks!
> Stuart
> 
> > 
> > Matt
> > 
> > > wait user fence ioctl. MSI-X vectors are dynamically assigned
> > > during exec queue creation up to a set maximum. Once the max
> > > is reached, everything else falls back to the default vector.
> > 
> > > 
> > > These dynamic vectors allow us to wake up a targeted wait
> > > queue and user thread instead of broadcasting out to all
> > > potential user threads like we're doing today. This is interesting
> > > when we have many user threads outstanding as we don't want
> > > to wake them up in a storm for each interrupt coming in.
> > > 
> > > Additionally, there have been changes in the memirq code lately
> > > to isolate some of the interrupts handled here. Starting with
> > > xe3p, however, we have new interrupts available for compute walker
> > > post sync interrupts. Currently these are enabled for legacy MSI
> > > use cases, but the bits are also available for MSI-X. Enable
> > > those bits here.
> > > 
> > > v2: Drop the drm_dbg change patch
> > >     Directly call xe_hw_engine_handle_irq() from
> > > xe_memirq_hwe_handler()
> > >     Only add to ufence_list for user queues
> > > 
> > > Stuart Summers (11):
> > >   drm/xe: Add kerneldoc to xe_wait_user_fence_ioctl()
> > >   drm/xe: Handle NULL in xe_exec_queue_get_unless_zero()
> > >   drm/xe: Cap MSI-X vector count to XE_MSIX_MAX_VECS
> > >   drm/xe: Assign dedicated MSI-X vectors to exec queues
> > >   drm/xe: Add configfs max_msix_vecs attribute
> > >   drm/xe: Remove memirq status and source checks for engine
> > > interrupts
> > >   drm/xe: Add per-exec-queue user fence wait queue
> > >   drm/xe: Track all exec queues in a device-level ufence list
> > >   drm/xe: Hook up per queue thread wake to the unique MSI-X vector
> > >     allocation
> > >   drm/xe: Enable per-queue ufence wake in ioctl and wake function
> > >   drm/xe/memirq: Enable compute walker post-sync interrupt
> > > 
> > >  drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |  3 +
> > >  drivers/gpu/drm/xe/xe_configfs.c         | 71
> > > ++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_configfs.h         |  6 ++
> > >  drivers/gpu/drm/xe/xe_device.c           |  2 +
> > >  drivers/gpu/drm/xe/xe_device_types.h     | 11 ++++
> > >  drivers/gpu/drm/xe/xe_exec_queue.c       | 51 ++++++++++++++++-
> > >  drivers/gpu/drm/xe/xe_exec_queue.h       |  2 +-
> > >  drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 ++
> > >  drivers/gpu/drm/xe/xe_guc_submit.c       |  6 +-
> > >  drivers/gpu/drm/xe/xe_hw_engine.c        |  6 +-
> > >  drivers/gpu/drm/xe/xe_hw_engine.h        |  3 +-
> > >  drivers/gpu/drm/xe/xe_irq.c              | 36 ++++++++++--
> > >  drivers/gpu/drm/xe/xe_irq.h              |  9 +++
> > >  drivers/gpu/drm/xe/xe_lrc.c              | 15 ++++-
> > >  drivers/gpu/drm/xe/xe_memirq.c           | 59 +++++++++-----------
> > >  drivers/gpu/drm/xe/xe_memirq.h           |  4 +-
> > >  drivers/gpu/drm/xe/xe_sync.c             |  3 +-
> > >  drivers/gpu/drm/xe/xe_wait_user_fence.c  | 64
> > > ++++++++++++++++++++-
> > >  drivers/gpu/drm/xe/xe_wait_user_fence.h  |  4 ++
> > >  19 files changed, 310 insertions(+), 51 deletions(-)
> > > 
> > > -- 
> > > 2.43.0
> > > 
> 

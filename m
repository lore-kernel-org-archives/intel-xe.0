Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C9C4C71148
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 20:00:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C739610E527;
	Fri, 13 Jun 2025 20:00:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e4trwAHU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6BB10E9A6
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 20:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749844844; x=1781380844;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ox3eOmL2xzPAGs81rjkZMiHokbLWHh1gvwuKQcZCXHs=;
 b=e4trwAHUBUez0A0rCISPLY5uCDueD0It7/8UL+x8861JmxIr7K/com+I
 /lM04Fz6CUze2CaphmfVq3GE3xF1U8ecbbfHPtMMuUoSvpB9OcGgl7jJG
 MrWtEVmBmdf8S9LY0Sb/D1xeSPPrGSvlWxBojjUiDtOqZYr9dNBEJU3gy
 3FaEjQV5mNL4kOeig11XirDIalaufM6BOj0yWorPQuKm6fkAd6PEjfG6R
 0YyY3UQUqop9ifF7roDjLKgtgHC6kcrYjUfCYnYuYzkn/Xqlw3Cz6BzLm
 EpB/71mB7bWJkEgG4KF5xreqHWpVzCcrY3C5JCigbYIHvXnZU3FQ2jNSh g==;
X-CSE-ConnectionGUID: JRIhe2y0QtiyNKrTbjSKSw==
X-CSE-MsgGUID: owqRhxrgQPmmx4D8GVFVpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="55870297"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="55870297"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 13:00:40 -0700
X-CSE-ConnectionGUID: 0SiwopcyT+mTTVV2zDfizQ==
X-CSE-MsgGUID: jDVFF3iNThSZnhD0I/jhsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="178802735"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 13:00:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 13:00:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 13 Jun 2025 13:00:39 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 13:00:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sd6tkAh6KdO+4UOPyKbyLnf+af9TOGnwKM5DxibY36ylww51LupUN9dOklEP1Vo2KQb+iBMYYjccy0qQbJr7blzD62cu9I2t3CL/SwnHSbquYFmrhT+K9zemVoPUtm8jiB1mXvlf6PVdfGptf7BID2SMB8vORn/srL2qCntLGoTUVbRHXvEKuC+DxrZnp1b8fVr6070eMbbkctt1YWG4HqYIKxRhUMDofzN7l1oJnyZwxf/l7TJll3oeJWy5IMYdR0i6Pz1VFfMj1SdqCb3Q9I0XgVl2EKD9PdUgW6VfBvDCRHDrB5QBCV6EvfJB4KHXGbmH1b8vZiIwtgvmyJe5JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEzGzh3lC1bbI5QINR3mnQqaBXTyLWAYUeduWPc2EL0=;
 b=OK2FBptE4D76OAaydmPyqoXv16jegEqXDBsMWrMWBf8C69Y9B/3lL7BwOb1WX1USBK/rNxANUlZ5/kFMv9VBlTGKzJ1XlnWJ3iJrtt0IUMVQKhWW9He95aLwrPi4U0AS0r+Z2taeCq/jnte7toV9GsrobLSck3HnGkpBl/hURCjATrrF1pvh1Um9MCpCp+G4VWKm3thcMQzExiN8vQ6mT3Zz4nUYKEjbGDsSJsL6NvTAn3qY4mLv7FuAfZtristriVMxOwguJBQ90Nhmzm0sd0edTPxrfKp/KhKpA98XUqitfeRbt0B4X1tujkf6nEwRoWQYlCX1WRr01r43E2DZ8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7301.namprd11.prod.outlook.com (2603:10b6:8:10a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 20:00:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 20:00:35 +0000
Date: Fri, 13 Jun 2025 13:02:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe: Implement clear VRAM on free
Message-ID: <aEyDw0ZQ5R/ohrO3@lstrano-desk.jf.intel.com>
References: <20250611054235.3540936-1-matthew.brost@intel.com>
 <cb53d2efe677724fd5d141d8f3cada5f06758adb.camel@linux.intel.com>
 <aEsKU2LliY6JmG6a@lstrano-desk.jf.intel.com>
 <eb5531f03ee560a593f77f60ae1f6f862eea6a14.camel@linux.intel.com>
 <aExQEKec1H7yqS1I@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aExQEKec1H7yqS1I@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0315.namprd03.prod.outlook.com
 (2603:10b6:303:dd::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7301:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d6e42c0-58e9-4637-af66-08ddaab4f599
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V044c1dnZHdpcXZhWUg2eWZhOThMUHIxL3h4US9ZVnJlemwxSHVDRnhvbUVp?=
 =?utf-8?B?NGcwR0ZxYmRFY2pMRW9UUVh5K1NoTzRzM0JTK1FTU2pRYlQyZG9IaU55aUtC?=
 =?utf-8?B?U0J0YWRydGVZaTIyUEFwaFBPc2pwK01kVzQ1cU03SlczWGw0aFlLWG5ON3VL?=
 =?utf-8?B?bnd4bS9PTmovdEZBN1NvVDZYbTZKNFdvWlMybjZUblBrcG1rM05QS3JUZnFV?=
 =?utf-8?B?TWpyM0RiRjZuK2hRbDZDbkYvcU9PQ2J1dXE3S1Irc2xaZ1BwdkZPVFlJMWVQ?=
 =?utf-8?B?NCtOTTFDYTM3d1dvdVFwZm5qaUNuV3FKY3RYUGdKdW1qK1hxVWlaUjhESmV6?=
 =?utf-8?B?Vk05YjRXWDVxZGFzalozekdMNnZpYlkrcG1JS3VTT3JVeWpTSGgwUFJLOUh1?=
 =?utf-8?B?VVRIYmtsR1duZUJKZENEQ05sNnlSWm5IRW90UFhLaFZMSUIwMStXTm1YSm9H?=
 =?utf-8?B?RXdmdnhvWlQ3VXA1b28rK0VtcjNRdEZrcDE3SVZObS9SWXpVQWRxekZGMDdi?=
 =?utf-8?B?MGMvbTlTamM0K0R6dGNiZkp0SUxvK1ZSbEhzaktCVE1TM2RXbmZ6SHlEamFY?=
 =?utf-8?B?TUo2SFUrcUswT0pTRnRDVFNTeFI4T3RaeGlOTXM5QzROUk9SL25DcXFYNVJQ?=
 =?utf-8?B?cTRkM2NBLzYxNnZjbjdsWWpQS1RwM1JkVExwaGw1d0RIVTl4MFI2aG00dEVx?=
 =?utf-8?B?ODlpNVI2Wk9sOVNxQkVWNktPRGhYdlFRcE1nNnZRS1BkT3pQbWFsRkdsYnBH?=
 =?utf-8?B?RVBuc3paSFVjSU8xWDR0emRrVXVRRDdxZnp5T0toUWtFVUZPdzllMDRGQ3py?=
 =?utf-8?B?Vzh2VkE4K0FlcXVQTVB0K1NIc1d3Z3IwclRhOFAza3BLOUtyUk93cTZia0Nr?=
 =?utf-8?B?aGxXQkFraEFqbk5STlBSODRXZ2h4R2w3R0I2OWZQZ3BBK1l0MFBHWFRXd0hy?=
 =?utf-8?B?U3pEcnRpMkViaklyM2dHL2dvM0tQNnVwUk93ekQzWENJRk1Ibi9HSFNuM1RV?=
 =?utf-8?B?VXRJN0dLNGpyaGtGSXc3MFVXcFVibkdXT2tENHlPVFYyVGxRVDkvbG5abDcv?=
 =?utf-8?B?RERCdTFtaFNSWW5yc1h6YzdaME1YUW1kYXhBcC9HZnRVazF5ZXBXRVlXa09v?=
 =?utf-8?B?NWRweWRuMVpOWDdGTlgzOUtxc3JnVWJ4cUdJZkNCNExZUlBEOTBBR0x6bEg4?=
 =?utf-8?B?dXlueWpqc3UvZmhiV3VPVWRUQ0p0bHJwR0xvdlU1cnVCTWpKTTdydE1KdVlw?=
 =?utf-8?B?RytaNmpRL2Y3RUN4bGhtMTJBWXI4RHhQRThPQTA2MjR5MnRyK3pHZlBaWjVm?=
 =?utf-8?B?RjF0QVQzbXA5Wmd1Rk5MMmIwR2E1Y21zMmZlUUVEb1RkOStYRnlKQUV3bmww?=
 =?utf-8?B?Nnl2aTJsVytEbDRZbEMxODU0amdSL0tvaHNOQVJjNXN0TkROSlVDSDNKRndV?=
 =?utf-8?B?dFZyUWozZlR0a0FBMXIveVMxdVBXa3hsQUpXbGJKYndTd1EyZGRFeHBKS2pt?=
 =?utf-8?B?eUlMZmNkcG9JSXJMbGI0SkdnS25EOHBiZk0wbFNKT0VwTkdTU2Vyak43SlRs?=
 =?utf-8?B?aTNld0cxTk1YQ2l5bW9ucXJ2b0ZDdHNuNEpoU2hOUnNWdm54S1JkZWxNL0tO?=
 =?utf-8?B?aDFOVE9sYzEzTkNMNXZFSzBTSmpMbVVxdXZ3K0tlR0Q1UHM5UlJQYnBXV1Ni?=
 =?utf-8?B?eTNvSUFERTJLQmR5OFJsa29nL08xMHQzNmY5MjlKRS9FUmpVclRZYUF1WjIy?=
 =?utf-8?B?UHJSM2lWMjdCTE1VZ01CZDNiVFIrVjFYZ2VFL3pLbmIwdU1JWFdvTUwxOWFw?=
 =?utf-8?B?MGZHSHhXWFRUMXFZZmpZZTl2VUh2L055RnpTTkw4dFFwb0FvM0FhMktHNFNQ?=
 =?utf-8?B?M1RtVXpqRGd5am5YOW9WSC9rWUpteEtZK2pDR2QrWkFmSDJWV1dXd1BqNW5l?=
 =?utf-8?Q?lzjDBgqQ0ZM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGFRcmE2ZzhHV1dVY1g1T1k4Q2pHUlhPY1NvQkgwUlNXK3lidU92V2JTTlBt?=
 =?utf-8?B?VTM2c0gwZjUvdWF1QzR2NGkzeGJuaTAyd1g3bEdCT2RIQUhvUi9PSVdjTWgr?=
 =?utf-8?B?QityeVFHYkRBWVNiK0pBaVRwOEQwVGgxRlF3Z3NaMG04UUZvSTVlNDdMZzZZ?=
 =?utf-8?B?bjBKK25GcHJreUJ4SktPbUUySXVrZWlseVYrcDFJNzUyeVdIc25kOVBvdFJH?=
 =?utf-8?B?cGtycEdSVWpqWk83VnJiSnBHTnBDQkRYV1hXUWNuT1lBZ25mSCsxQklhcnNy?=
 =?utf-8?B?ZUFTWWR6MkUwcUZqVUZHbFFqcWN1dHV1ZjV3cnpWYWNsVGd1bzZXK0Y0SXhl?=
 =?utf-8?B?WHhJTXM2VHM3V1BScDZoOGlCdk1yRFk3L3RnRzV6Q0ZCUWJMcXJHYXYvWm9U?=
 =?utf-8?B?U3UwbXNSeG9aazM3UkZ3L1JrNEVGZmw1Y2hqUlpwSGljTjZkWXZ3Z3hEaFpP?=
 =?utf-8?B?UjJRbDdhaDJQM25XWXRueGlUMFhQaVNWSXhpdytUTjY4V3h4ZjdOSGRDYytH?=
 =?utf-8?B?clNSNnYwUkdRUE16YnBJSGtyeVRhc0tNSno0VTVlYmMyVVRXR0dwMlFDVG9K?=
 =?utf-8?B?YmJENnZGQUN2YXBiV1RBZnNKWGpqOUozQlB4R0ZUMVZLNU5CRGVSa3ZUdXZm?=
 =?utf-8?B?WmI3TFdOZklaRDYybUJ1Z3hhQ1htY3pNZ2R2UGpPMlBpZ0ZSTHRXall1VGtq?=
 =?utf-8?B?RkxHTkdHSHpkS0ErZkliNmw0cy8zVzM4SU5qOE15dWRtWWM0NENDbGlLNXJz?=
 =?utf-8?B?R2xMeTArY1pmZGNvNXRDQk83alJhMFkxOHdNVTkrOTl0MHhoWkNEU3U5aHND?=
 =?utf-8?B?RERST3RXQWdqcnVKMjA0Yk9xem1HUkV0TitGYlF5d3V5MUc0d2dNT3JiRXpm?=
 =?utf-8?B?QXREQU1CdENSNDdQaTJpd0lqU2gvM3AxYXk4eFJUdHNyZElYdDVSQzBiOC9P?=
 =?utf-8?B?MmxOL1hlNmVaQ2ljTml4dWtPMno0MTRNTjlnOFVRSytIMXJqVTVjK0ZCY2JQ?=
 =?utf-8?B?N3lPeHF3R05rT21UQmdFSHVISUVYcGhmcHU5aHNNRHplTDR4aTFtNjFGZkNC?=
 =?utf-8?B?ZHhDSGEyb0JYR1dtUWtQVUNiWlZjRElUSFJNNmhHT0R2cEQvWHlSNVQ2bVZK?=
 =?utf-8?B?RDVvb2Q1SmQxMTVCa1BNRU1vT0EzQmlKRTRXNjVDaVRqWG1IbzlEYkU1OHQz?=
 =?utf-8?B?NTh1TEZXYzROR29MYXBmS2VKamJxNyt2QkJITFBEMHlyaStyQXBIU3YzSyti?=
 =?utf-8?B?YzRlZkVpaHVTK3g1ZGlVNG1BYjRRaVB3eDF5VGlFVjlDSGh1d3l1OG5Dbyt5?=
 =?utf-8?B?TmxpSEptQjJmNi9xdW5MUmVLazUvQ0NqVGlnMzFQajI0VjEvNXU5ZkgyU2hz?=
 =?utf-8?B?MEQ3Yi91Q002TktxOFJKZDdyOTVRN0hxUGJUR3pCTEpxeGhqK0hUYUNXWXNG?=
 =?utf-8?B?V1JaZ3Z4SmZ1U0Q3ZlBPTGFUUHFVWEZ2OElNaVNPV0JYcDJSMElCTlFQSWpO?=
 =?utf-8?B?U1FseXZBbk8yL3VFM2ZnVFptYkRON3VBTU90dzdvVGRidHdRcjR5NWNYQ0xV?=
 =?utf-8?B?c0VncEQvMnVMWFJ4M0lqNVREZ3I0THBoM3VieUVTM2FFeUpJWUlURXFJeWkx?=
 =?utf-8?B?T0FQN0RnN3JNcW14Sjh2aUpOU2puSkR4SG9sT1F3SWx5OHh5NnJ6RThRSitz?=
 =?utf-8?B?aldFbCt6U2JpdlFpRVQwc2tzNUQ5QzRzcXgyamc5RFVtS3BjdFZZejNHK3Fh?=
 =?utf-8?B?ZkxLbGRFTEtpMllnRmc5NmN0MEtMQVdmN3pRZDQ2SzR6UEFramxuTCt1R3hT?=
 =?utf-8?B?czh0TnhZQW1KZXdscFp5bVIyd0dSTzl1V2N4Z3JtYzRwUmFxYUdEQnk5KzVi?=
 =?utf-8?B?eEFBSDB3M2tESDZFajlJOVI2ZzBIWHRXSGwveTE4TnlnamNPaXRZbGdBeFEz?=
 =?utf-8?B?TTBBVnJ4MkVmWUprN21qRlBTb05tbDdKNmZmL005ZXNsQVl0ekxxZnJ5SjBP?=
 =?utf-8?B?YjkzTHErbnBIcVJHbHpwaXdaOStBYTN2MW1jWjErOHllSjA2UXByZFU5VlBi?=
 =?utf-8?B?bTFGdUkwekJqS2ZvVWNWV1g3WGYxZWREblFBY09UdXg0ODNkQkwvUmJCQm8v?=
 =?utf-8?B?VHZ1ODNBSlFsKzlvb1dBaEYwd3pFbXNma0lhbkdvMkZOOWoxUG9EMFdNcDgv?=
 =?utf-8?B?L3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d6e42c0-58e9-4637-af66-08ddaab4f599
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 20:00:34.9617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SooFyFQH574HftMInfk1iEpUKMW0WTZMfhorZLcGAJws1ylSU16xrQ6FKC8MNDD01Tw98DvKi2bYfgBR6qkDbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7301
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

On Fri, Jun 13, 2025 at 09:21:36AM -0700, Matthew Brost wrote:
> On Fri, Jun 13, 2025 at 10:07:17AM +0200, Thomas Hellström wrote:
> > On Thu, 2025-06-12 at 10:11 -0700, Matthew Brost wrote:
> > > On Thu, Jun 12, 2025 at 02:53:16PM +0200, Thomas Hellström wrote:
> > > > On Tue, 2025-06-10 at 22:42 -0700, Matthew Brost wrote:
> > > > > Clearing on free should hide latency of BO clears on new user BO
> > > > > allocations.
> > > > > 
> > > > > Implemented via calling xe_migrate_clear in release notify and
> > > > > updating
> > > > > iterator in xe_migrate_clear to skip cleared buddy blocks. Only
> > > > > user
> > > > > BOs
> > > > > cleared in release notify as kernel BOs could still be in use
> > > > > (e.g.,
> > > > > PT
> > > > > BOs need to wait for dma-resv to be idle).
> > > > 
> > > > Wouldn't it be fully possible for a user to do (deep pipelining 3d
> > > > case)
> > > > 
> > > > create_bo();
> > > > map_write_unmap_bo();
> > > > bind_bo();
> > > > submit_job_touching_bo();
> > > > unbind_bo();
> > > > free_bo();
> > > > 
> > > > Where the free_bo and release_notify() is called long before the
> > > > job we
> > > > submitted even started?
> > > > 
> > > > So that would mean the clear needs to await any previous fences,
> > > > and
> > > > that dependency addition seems to have been removed from
> > > > xe_migrate_clear.
> > > > 
> > > 
> > > I think we are actually ok here. xe_vma_destroy is called on unbind
> > > with
> > > the out fence from the bind IOCTL, so we don't get to
> > > xe_vma_destroy_late until that fence signals, and xe_vma_destroy_late
> > > (possibly) does the final BO put. Whether this follow makes sense is
> > > a
> > > bit questable - this was very early code I wrote in Xe and if I
> > > rewrote
> > > today I suspect it would look different.
> > 
> > Hmm, yeah you're right. So the unbind kernel fence should indeed be
> > last fence we need to wait for here.
> > 
> 
> It should actually be signaled too. I think we could avoid any dma-resv
> wait in this case. Kernel operations are typically (maybe always) on the
> migration queue, though, so we’d be waiting on those operations via
> queue ordering anyway.
> 
> > > 
> > > We could make this 'safer' by waiting on DMA_RESV_USAGE_BOOKKEEP in
> > > xe_migrate_clear for calls from release notify but for private to VM
> > > BO's we'd risk the clear getting stuck behind newly submitted (i.e.,
> > > submitted after the unbind) exec IOCTLs or binds.
> > 
> > Yeah, although at this point the individualization has already taken
> > place, so at least there should be no starving, since the only
> > unnecessary waits would be for execs submitted between the unbind and
> > the individualization. So doable but leave it up to you.
> > 
> 
> The individualization is done by the final put-likely assuming the BO is
> closed and unmapped in user space—in the worker mentioned above. If an
> exec or bind IOCTL is issued in the interim, we’d be waiting on those.
> 
> > > > Another side-effect I think this will have is that bos that are
> > > > deleted
> > > > are not subject to asynchronous evicton. I think if this bo is hit
> > > > during lru walk and clearing, TTM will just sync wait for it to
> > > > become
> > > > idle and then free the memory. I think the reason that could not be
> > > > fixed in TTM is that TTM needs for all resource manager fences to
> > > > be
> > > > ordered, but if a check for ordered fences which I think requires
> > > > here
> > > > that the eviction exec_queue is the same as the clearing one, that
> > > > could be fixed in TTM.
> > > > 
> > > 
> > > I think async eviction is still controlled by no_wait_gpu, right? See
> > > ttm_bo_wait_ctx, if a deleted BO is found and no_wait_gpu is clear
> > > the
> > > eviction process moves on, right? So the exec IOCTL can still be
> > > pipelined albeit not with deleted BOs that have pending clears. We
> > > also
> > > clear no_wait_gpu in Xe FWIW.
> > 
> > Yes this is a rather complex problem further complicated by the fact
> > that since we can in wait for fences under dma_resv locks, for a true
> > no_wait_gpu exec to succeed, we're only allowed to do dma_resv_trylock.
> > 
> > Better to try to fix this in TTM rather than try to worry too much
> > about it here.
> > 
> 
> +1.
> 
> > > 
> > > > Otherwise, this could also cause newly introduced sync waits in the
> > > > exec() and vm_bind paths where we previously performed eviction and
> > > > the
> > > > subsequent clearing async.
> > > > 
> > > > Some additional stuff below:
> > > > 
> > > > 
> > > > > 
> > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_bo.c           | 47
> > > > > ++++++++++++++++++++++++++++
> > > > >  drivers/gpu/drm/xe/xe_migrate.c      | 14 ++++++---
> > > > >  drivers/gpu/drm/xe/xe_migrate.h      |  1 +
> > > > >  drivers/gpu/drm/xe/xe_res_cursor.h   | 26 +++++++++++++++
> > > > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  5 ++-
> > > > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  6 ++++
> > > > >  6 files changed, 94 insertions(+), 5 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > > b/drivers/gpu/drm/xe/xe_bo.c
> > > > > index 4e39188a021a..74470f4d418d 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > > @@ -1434,6 +1434,51 @@ static bool
> > > > > xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
> > > > >  	return locked;
> > > > >  }
> > > > >  
> > > > > +static void xe_ttm_bo_release_clear(struct ttm_buffer_object
> > > > > *ttm_bo)
> > > > > +{
> > > > > +	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
> > > > > +	struct dma_fence *fence;
> > > > > +	int err, idx;
> > > > > +
> > > > > +	xe_bo_assert_held(ttm_to_xe_bo(ttm_bo));
> > > > > +
> > > > > +	if (ttm_bo->type != ttm_bo_type_device)
> > > > > +		return;
> > > > > +
> > > > > +	if (xe_device_wedged(xe))
> > > > > +		return;
> > > > > +
> > > > > +	if (!ttm_bo->resource || !mem_type_is_vram(ttm_bo-
> > > > > >resource-
> > > > > > mem_type))
> > > > > +		return;
> > > > > +
> > > > > +	if (!drm_dev_enter(&xe->drm, &idx))
> > > > > +		return;
> > > > > +
> > > > > +	if (!xe_pm_runtime_get_if_active(xe))
> > > > > +		goto unbind;
> > > > > +
> > > > > +	err = dma_resv_reserve_fences(&ttm_bo->base._resv, 1);
> > > > > +	if (err)
> > > > > +		goto put_pm;
> > > > > +
> > > > > +	fence = xe_migrate_clear(mem_type_to_migrate(xe, ttm_bo-
> > > > > > resource->mem_type),
> > > > > +				 ttm_to_xe_bo(ttm_bo), ttm_bo-
> > > > > > resource,
> > > > 
> > > > We should be very careful with passing the xe_bo part here because
> > > > the
> > > > gem refcount is currently zero. So that any caller deeper down in
> > > > the
> > > > call chain might try to do an xe_bo_get() and blow up.
> > > > 
> > > > Ideally we'd make xe_migrate_clear() operate only on the ttm_bo for
> > > > this to be safe.
> > > > 
> > > 
> > > It looks like bo->size and xe_bo_sg are the two uses of an Xe BO in
> > > xe_migrate_clear(). Let me see if I can refactor the arguments to
> > > avoid
> > > these + add some kernel doc.
> > 
> > Thanks,
> > Thomas
> >
> 
> So I'll just respin the next rev with a refactor xe_migrate_clear
> arguments.
> 

Actually xe_migrate_clear sets the bo->ccs_cleared field, so we kinda
need the Xe BO. I guess I'll leave as is.

Yes, if caller does xe_bo_get, that will blow up but no one is doing
that and we'd immediately get a kernel splat if some one tried to change
this so I think we are good. Thoughts?

Matt

> Matt
> 
> > 
> > > 
> > > Matt
> > > 
> > > > /Thomas
> > > > 
> > > > 
> > > > > +				 XE_MIGRATE_CLEAR_FLAG_FULL |
> > > > > +				 XE_MIGRATE_CLEAR_NON_DIRTY);
> > > > > +	if (XE_WARN_ON(IS_ERR(fence)))
> > > > > +		goto put_pm;
> > > > > +
> > > > > +	xe_ttm_vram_mgr_resource_set_cleared(ttm_bo->resource);
> > > > > +	dma_resv_add_fence(&ttm_bo->base._resv, fence,
> > > > > +			   DMA_RESV_USAGE_KERNEL);
> > > > > +	dma_fence_put(fence);
> > > > > +
> > > > > +put_pm:
> > > > > +	xe_pm_runtime_put(xe);
> > > > > +unbind:
> > > > > +	drm_dev_exit(idx);
> > > > > +}
> > > > > +
> > > > >  static void xe_ttm_bo_release_notify(struct ttm_buffer_object
> > > > > *ttm_bo)
> > > > >  {
> > > > >  	struct dma_resv_iter cursor;
> > > > > @@ -1478,6 +1523,8 @@ static void xe_ttm_bo_release_notify(struct
> > > > > ttm_buffer_object *ttm_bo)
> > > > >  	}
> > > > >  	dma_fence_put(replacement);
> > > > >  
> > > > > +	xe_ttm_bo_release_clear(ttm_bo);
> > > > > +
> > > > >  	dma_resv_unlock(ttm_bo->base.resv);
> > > > >  }
> > > > >  
> > > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > > > > b/drivers/gpu/drm/xe/xe_migrate.c
> > > > > index 8f8e9fdfb2a8..39d7200cb366 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > > @@ -1063,7 +1063,7 @@ struct dma_fence *xe_migrate_clear(struct
> > > > > xe_migrate *m,
> > > > >  	struct xe_gt *gt = m->tile->primary_gt;
> > > > >  	struct xe_device *xe = gt_to_xe(gt);
> > > > >  	bool clear_only_system_ccs = false;
> > > > > -	struct dma_fence *fence = NULL;
> > > > > +	struct dma_fence *fence = dma_fence_get_stub();
> > > > >  	u64 size = bo->size;
> > > > >  	struct xe_res_cursor src_it;
> > > > >  	struct ttm_resource *src = dst;
> > > > > @@ -1075,10 +1075,13 @@ struct dma_fence *xe_migrate_clear(struct
> > > > > xe_migrate *m,
> > > > >  	if (!clear_bo_data && clear_ccs && !IS_DGFX(xe))
> > > > >  		clear_only_system_ccs = true;
> > > > >  
> > > > > -	if (!clear_vram)
> > > > > +	if (!clear_vram) {
> > > > >  		xe_res_first_sg(xe_bo_sg(bo), 0, bo->size,
> > > > > &src_it);
> > > > > -	else
> > > > > +	} else {
> > > > >  		xe_res_first(src, 0, bo->size, &src_it);
> > > > > +		if (!(clear_flags & XE_MIGRATE_CLEAR_NON_DIRTY))
> > > > > +			size -= xe_res_next_dirty(&src_it);
> > > > > +	}
> > > > >  
> > > > >  	while (size) {
> > > > >  		u64 clear_L0_ofs;
> > > > > @@ -1125,6 +1128,9 @@ struct dma_fence *xe_migrate_clear(struct
> > > > > xe_migrate *m,
> > > > >  			emit_pte(m, bb, clear_L0_pt, clear_vram,
> > > > > clear_only_system_ccs,
> > > > >  				 &src_it, clear_L0, dst);
> > > > >  
> > > > > +		if (clear_vram && !(clear_flags &
> > > > > XE_MIGRATE_CLEAR_NON_DIRTY))
> > > > > +			size -= xe_res_next_dirty(&src_it);
> > > > > +
> > > > >  		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> > > > >  		update_idx = bb->len;
> > > > >  
> > > > > @@ -1146,7 +1152,7 @@ struct dma_fence *xe_migrate_clear(struct
> > > > > xe_migrate *m,
> > > > >  		}
> > > > >  
> > > > >  		xe_sched_job_add_migrate_flush(job,
> > > > > flush_flags);
> > > > > -		if (!fence) {
> > > > > +		if (fence == dma_fence_get_stub()) {
> > > > >  			/*
> > > > >  			 * There can't be anything userspace
> > > > > related
> > > > > at this
> > > > >  			 * point, so we just need to respect any
> > > > > potential move
> > > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> > > > > b/drivers/gpu/drm/xe/xe_migrate.h
> > > > > index fb9839c1bae0..58a7b747ef11 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > > > > @@ -118,6 +118,7 @@ int xe_migrate_access_memory(struct
> > > > > xe_migrate
> > > > > *m, struct xe_bo *bo,
> > > > >  
> > > > >  #define XE_MIGRATE_CLEAR_FLAG_BO_DATA		BIT(0)
> > > > >  #define XE_MIGRATE_CLEAR_FLAG_CCS_DATA		BIT(1)
> > > > > +#define XE_MIGRATE_CLEAR_NON_DIRTY		BIT(2)
> > > > >  #define
> > > > > XE_MIGRATE_CLEAR_FLAG_FULL	(XE_MIGRATE_CLEAR_FLAG_BO_DATA |
> > > > > \
> > > > >  					XE_MIGRATE_CLEAR_FLAG_CC
> > > > > S_DA
> > > > > TA)
> > > > >  struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> > > > > diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h
> > > > > b/drivers/gpu/drm/xe/xe_res_cursor.h
> > > > > index d1a403cfb628..630082e809ba 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> > > > > @@ -315,6 +315,32 @@ static inline void xe_res_next(struct
> > > > > xe_res_cursor *cur, u64 size)
> > > > >  	}
> > > > >  }
> > > > >  
> > > > > +/**
> > > > > + * xe_res_next_dirty - advance the cursor to next dirty buddy
> > > > > block
> > > > > + *
> > > > > + * @cur: the cursor to advance
> > > > > + *
> > > > > + * Move the cursor until dirty buddy block is found.
> > > > > + *
> > > > > + * Return: Number of bytes cursor has been advanced
> > > > > + */
> > > > > +static inline u64 xe_res_next_dirty(struct xe_res_cursor *cur)
> > > > > +{
> > > > > +	struct drm_buddy_block *block = cur->node;
> > > > > +	u64 bytes = 0;
> > > > > +
> > > > > +	XE_WARN_ON(cur->mem_type != XE_PL_VRAM0 &&
> > > > > +		   cur->mem_type != XE_PL_VRAM1);
> > > > > +
> > > > > +	while (cur->remaining &&
> > > > > drm_buddy_block_is_clear(block)) {
> > > > > +		bytes += cur->size;
> > > > > +		xe_res_next(cur, cur->size);
> > > > > +		block = cur->node;
> > > > > +	}
> > > > > +
> > > > > +	return bytes;
> > > > > +}
> > > > > +
> > > > >  /**
> > > > >   * xe_res_dma - return dma address of cursor at current position
> > > > >   *
> > > > > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > index 9e375a40aee9..120046941c1e 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > @@ -84,6 +84,9 @@ static int xe_ttm_vram_mgr_new(struct
> > > > > ttm_resource_manager *man,
> > > > >  	if (place->fpfn || lpfn != man->size >> PAGE_SHIFT)
> > > > >  		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
> > > > >  
> > > > > +	if (tbo->type == ttm_bo_type_device)
> > > > > +		vres->flags |= DRM_BUDDY_CLEAR_ALLOCATION;
> > > > > +
> > > > >  	if (WARN_ON(!vres->base.size)) {
> > > > >  		err = -EINVAL;
> > > > >  		goto error_fini;
> > > > > @@ -187,7 +190,7 @@ static void xe_ttm_vram_mgr_del(struct
> > > > > ttm_resource_manager *man,
> > > > >  	struct drm_buddy *mm = &mgr->mm;
> > > > >  
> > > > >  	mutex_lock(&mgr->lock);
> > > > > -	drm_buddy_free_list(mm, &vres->blocks, 0);
> > > > > +	drm_buddy_free_list(mm, &vres->blocks, vres->flags);
> > > > >  	mgr->visible_avail += vres->used_visible_size;
> > > > >  	mutex_unlock(&mgr->lock);
> > > > >  
> > > > > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > > > index cc76050e376d..dfc0e6890b3c 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > > > @@ -36,6 +36,12 @@ to_xe_ttm_vram_mgr_resource(struct
> > > > > ttm_resource
> > > > > *res)
> > > > >  	return container_of(res, struct
> > > > > xe_ttm_vram_mgr_resource,
> > > > > base);
> > > > >  }
> > > > >  
> > > > > +static inline void
> > > > > +xe_ttm_vram_mgr_resource_set_cleared(struct ttm_resource *res)
> > > > > +{
> > > > > +	to_xe_ttm_vram_mgr_resource(res)->flags |=
> > > > > DRM_BUDDY_CLEARED;
> > > > > +}
> > > > > +
> > > > >  static inline struct xe_ttm_vram_mgr *
> > > > >  to_xe_ttm_vram_mgr(struct ttm_resource_manager *man)
> > > > >  {
> > > > 
> > 

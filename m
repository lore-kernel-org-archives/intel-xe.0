Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA91E98DF9
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 07:58:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7608D10E262;
	Mon, 23 Feb 2026 07:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GFmenoWw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A007A10E262
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 07:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771833485; x=1803369485;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=J+IeZ2SkKg/4/2OFV0x9AhFiVaaVZM8Z8CqpCtcVP0Q=;
 b=GFmenoWwLr7d5FaCGsxuMS66qRoz/XEPcWxuUXfR5I32EpvdklJhW9U0
 O7l6dvdJNl/ibdH2Zz9fEQe8OKfY71CaNZPHbrLsvleGaShUsXPLEUndf
 H14t/HY57SQ0NUmMjQHavlWhRcuAEuuMBtFNjxleXX1TjCCMYTAyW5RnY
 p45Bg19YpfNJ8gOLdRSFlG4Wjs2ydwMd1lEqENfI8EmjM/MbKe/z7W7hw
 JmBtkS2RERgGNZsFhDRUXw9XPxoQ6QSDbeMItPEne+ZtpcdHnrts1J2Wj
 IG7ADBRUqqHfy7LHQNP1N913Z6kjpIv2/134jt3X55QI1xBxb82VCaDM3 A==;
X-CSE-ConnectionGUID: Ypgl3or2Qd+vE13LDb/95w==
X-CSE-MsgGUID: aOrG0UNwSG+YCrfmsSLeRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="90227688"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="90227688"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 23:58:03 -0800
X-CSE-ConnectionGUID: EzFljIfgSyejEb38ZUsKIA==
X-CSE-MsgGUID: +7RnlvfiTZa1jlJh4ywUYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="219990894"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 23:58:04 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 23:58:03 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 22 Feb 2026 23:58:03 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 23:58:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aet1HepQk2MmmVs2/CCWo8VwympJH+f4NnP0JzZ2taV+TB7p2ddluGyvHWg7z5yG4wwhMnMZloPCwfUTtdCh402dNkcvqHEopGrM4pVTKjJ4Hc7NvzfX6xfGbdtZhbfRKCB/TyMLMXqv5o4swy/UilBDQK7S32Fl911M2MmopCRuJQka89LVx5iHoK4wQcelZz6yqJmnxLDglQhzx7Muc5w7mFcLyJTY6NtrZ4Xw5g7C1y1M43ZNwLIKJ9d8iGjebL8oA9P1DUzfVitINDrrqqHyg1G5v8EJiIOR3x9Ei4jJHYhJTnX5gRr3pq2TVzTKov0bSRg8v7YaVQ4ZOvKDgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvRDwIHg/FdOT0YZBitzzMDUfQSZGPiY6D5DutxImvw=;
 b=Ht8mRVxvvRVWZ9ZBg9IMx+d5HsbyQ1E4aKZfOyu3989fLDcCZu+wAoiQFLGvEhIhOuaEyYBKTu6QGjqAeI3c6xhKtTua16fIA22K1UlZO33HnUc1qsqXwwlOGV8qdhnSsOJw1hxHvlHXd8m7ILSM+ZU9UUKiLtdPzFn+QWnPg7ToFoVsFJt/7CzXjvY1esFGtOQOOunzchGKGlyJdSXvBgln7WxOywzO8K1zlKihlUh/KD33ng7GIT7/ycb2dQ88VJskQvTh1oUng6kFd8dtB0f+NZvGomRbpcMvsMogZDPVeOAX7/2Hhc5rb90az9QR5PoLkR8aKUf8zOesizCHNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SA1PR11MB8448.namprd11.prod.outlook.com (2603:10b6:806:3a3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 07:57:54 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 07:57:48 +0000
Date: Mon, 23 Feb 2026 13:27:40 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 01/23] drm/xe/mtl: Drop pre-prod workarounds
 Wa_14015795083 & Wa_14014475959
Message-ID: <aZwIdBHR-ARudmBy@bvivekan-mob1>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
 <20260220-forupstream-wa_cleanup-v2-1-b12005a05af6@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-1-b12005a05af6@intel.com>
X-ClientProxiedBy: MA5PR01CA0135.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::12) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SA1PR11MB8448:EE_
X-MS-Office365-Filtering-Correlation-Id: ed00614d-c0cc-4f3d-464d-08de72b13b7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWpSYzZHcVhHR1BSL2pZRE1ocDZCa3FaR0FIMmsyanJDSjV5VC9ERHp6NlpC?=
 =?utf-8?B?b0kxYUh5S0M4ZE02cElKVlRxblRhajZZTUNDT05TeWVGOVdKbHJhM1p0OWFE?=
 =?utf-8?B?NTU4NUhBa3l6MEpBTzFjZUJZeExhTXFEekkyNC9lYndwakRPSkozbUZTRzdy?=
 =?utf-8?B?dVJXdzlFdFhIRmxsd29nOVM5Q1ZKUEJLUHBTMDByMmMzYWg0Y1BmbXgzR3dr?=
 =?utf-8?B?SFNKb0llVm1XTStWUW5uNGdVVldIYzNGVFRmYjN5REp5ZE5rQU1UeXkxS3NN?=
 =?utf-8?B?K3FBbTgrR21QdkcraDhTKzh5ZGFPTzRRSDdLZElnemEyM0g1K1plS0RtMzdG?=
 =?utf-8?B?K1BTRUg2YjV4UDZEVWZhcHlFUTlWNENvSlZ0aSt2UHlZSlduWlV1SWQ5dkVR?=
 =?utf-8?B?ODlXbWpQS2VWRzFjSklhOUNaYjVDcnlnbmEyMGxFcVdnMW94WkwwT2paYnRs?=
 =?utf-8?B?aFNZcDc0YmVENjh6amg0QXdaYWIzTGkwTTFsY2sxcktkWUd0MGM0b1VOV0Ft?=
 =?utf-8?B?RXhJclBMSGpabURwRG1UTlZ3dFBlRmlWak4wU0czZ2dXWlQ4dStEcktDdDNY?=
 =?utf-8?B?Uk1xYlRtSHNCU1ZBdWR1MndtVUdjTFE2Z0dNTU9oUWVlVGUzanFBUlRUMXlN?=
 =?utf-8?B?VjJWZ2g4NDlRVmFrT0xXVFpKbFdrNVdRR0g4UFp5TUpabWlsTGo4VHBoMkQw?=
 =?utf-8?B?Ym9WOGlVYzd4NlNLdmlXZTJDUG92eFF1ODJxUi9PUFJCTEZZVzdoRVlKUmVG?=
 =?utf-8?B?bXJHckdUQnRWVTRXTU80NCtjallFdDgwSWM2M0FqZFZiSzIwTHE5Z0RxaHFv?=
 =?utf-8?B?MzE1T1V5WVdYMncwcW01UFZKYnlubUxoWEM3Sk8rcC9NWWZFbGJOVjUraVJ4?=
 =?utf-8?B?aG5QakRFTEM5b3pqUkdWbXJ6eVZNd3Y5VGdaWUx0RFZjOGRvZVVOOUFJMjNx?=
 =?utf-8?B?YnFLMHNVRDN1S0s2djc3eGFOSjhXbGFzWUttUXl3K0dLRVk1eFVQeXRweTFZ?=
 =?utf-8?B?c29CUU9iMUVCQ0ZOTk5STUpkUXV2SFpBVW94RUxTaVJQQ0xORlVPWVVmRW1C?=
 =?utf-8?B?RDI0c1QvN3czbmhteXVyeGJiTWFJK0FHSlFFbC92TmZJZjBQejVNMnBVQWFB?=
 =?utf-8?B?VUIwNG9JcU9kZDZ4TkI3OW1weGo5VVIvT1lqVlV0cnV5ODNkb3d4STV3S3VO?=
 =?utf-8?B?NVpMb1hsVHRBdnh0bnQ5VmZQY1B3ZTNpcUZiMVluTFhxN01xcDh3WjBtbm40?=
 =?utf-8?B?cUF5TDh4SUtrRHBSaHNSY3I0NGhPSEJFNXFyQTArMnNxamdHcXpEUjUydlRF?=
 =?utf-8?B?MlliZkVHQTFCMEtNaWQrK09HR3I0VnV4WThGWDBGMHZBUFIyZGFpUVZlc3FD?=
 =?utf-8?B?aG14bVZjVFUyYVhYZEk5UDJ1d0t0cUNxb3VZS01LeG9SUlhlZnVMUTJFK2k5?=
 =?utf-8?B?NXJiaEJydnVsZjQwL0RYclgxYmtZV0ZYS3V6WEx3SWhUOS9XN0VNSlNNLytz?=
 =?utf-8?B?WFZ6SjM4MTJoODRRR3pTVnFlL2FZMzhhaHJMb09XalZoVEViS3pUMWNuUFRz?=
 =?utf-8?B?QmJiaXE5cW5oUDVlSGJCb0VaR0FQbDl5cHlTbHRyaC92Nk5RREJsSkRFNHcx?=
 =?utf-8?B?eHp4NnY1Y1RWMGFKdW5JZllPZjhHbUYxQ3QrUVBBYlR4eG9ER3pXSDhZcFcy?=
 =?utf-8?B?ZzEvazh1NnliUFdQWFp3b0xJOGp5YU9GUkNDdXczaWF3NElub0tjWTkzU1JK?=
 =?utf-8?B?STlxMFYySWlKSlJJdk9Oc1BaV0ZGOXdZVm1iQzlhK3VrS2JxKzRaN05OWUNS?=
 =?utf-8?B?YzJ5SW1PM0tkV0M1RlMyaDdQbUZNblBENkthenV6QmJZT1MrbC9HaU0weS9K?=
 =?utf-8?B?UE1KNjNCcFRTcWpySXk1NW5IV2tRTW5BcUVIZzRUZFdhR1lRd0RodG5nZHl0?=
 =?utf-8?B?bWpXTEpHdGlVRGlIL2IyT1hWK0JSak9zdDM5bldIcVlRYlBvVy82M0huRzg0?=
 =?utf-8?B?cjQxNWJkQmFnYzZLa3hFMGNIbFJsRytpSktGblY0QzA1SzZ3aDMrdFFVbUJ4?=
 =?utf-8?B?d1diZjdTeGlqY09JRXhJNkdsOFBteFJWalBwOEx6MjV3L3Z4RkNrazRuUVpm?=
 =?utf-8?Q?I3BE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MW5OZ0kxNDYwTlN0bS9TaXd3S3pER3prZHpmY0t2bkIzSU9mbkNQSVVaSldj?=
 =?utf-8?B?QStyMWN6anhoTktwTlVhaWx4WmNzUVhhcG5WcWY2VG1XQjhmWnZwMURSOG02?=
 =?utf-8?B?c0JQcFV1aWVQQktMYU92aWZkSDZBK056SHg3NUxOQzNnMWVhdjhhWHR2cjFD?=
 =?utf-8?B?SFZqTVorYmZOUnB4aERIRzYxWTJiQ0RBRWZ2VG9lRHgzeEZPQ2p5YUJIVklQ?=
 =?utf-8?B?MjVXY0V5bmRiUm1wbW1tUEFPemxER05ZT0RsSytSMGxMdDhLV3RrakxHZFlN?=
 =?utf-8?B?M0Q3VmQwbVVadWUwVTJtbFc2WjJkY2dPT1Fpdlg2em8vYnBZZjBRQkF1ZnFs?=
 =?utf-8?B?emxONGNMRXlvaEt1MlBBVDdvSW9RVUpvL1o0bWNhZFBha0JVNE0wSTZjaHBE?=
 =?utf-8?B?YTlvTzRjTkw0M1BHK0ZZUXBrd21mNWlKejM3OUFzc0dzdEdmKyswUm9Ba3Rq?=
 =?utf-8?B?NTk0dURmMkR3WWxUcnFpaXBRbTBxNmpKNnI1dDMyNEgvYlFvZTJKWXFlNGVV?=
 =?utf-8?B?c05WSGgxazJBdlFlZXNPV2VoMUtjdmhPalZ5S20yd2M5cFVFaTFiSmpUT1k4?=
 =?utf-8?B?TDFoQnBYOWpzOTNhMDcrKzkzdEpUZ2JSZFFKS1RhL3dpUjJxdm9tUSt1dUZJ?=
 =?utf-8?B?M21BK0J6K0pJa2NtMng4NnpRS243d0tGQ3F5QWM5aVRQa1BtRVlWaGxwVG5t?=
 =?utf-8?B?d043T3pIN1ZOdmJvTjN0Y09KdTB3N0dLT1k1ZkttYThnZkh3ZnZacTNzUW5I?=
 =?utf-8?B?Z015Y3lYaXhPZy90STF2Wk8zZ3FrUUhqdEZCOVRSNTVoeHUyOHh3cmRLaW1U?=
 =?utf-8?B?MkdBN2V2aHRtS2F4bkVYR3ErSW5pU2diem85Vzl2Q016dENlZ2tDZllBdUNl?=
 =?utf-8?B?NnFlOHVuMjdnUHVRMHVyUVUxMmRvSjRRMEhSTXhUODhCU09lYTFINDA1T1dJ?=
 =?utf-8?B?alJwOEk1bVo4RXVsd2I0eE9PRFNFLzROTmRia0pLUndidWxTSndOL1ZoSnBm?=
 =?utf-8?B?NjdQMFpZVUNpbmlKZmRVQU13dVhiTG1ITXFEbFl2VVJZTFlTMXFGaGprUkR5?=
 =?utf-8?B?MW1JaFg4SWkzTjhoZ0pGV29TU3dFcm9PY0NVZENmdlpEREpHNGxxREFiTVoz?=
 =?utf-8?B?a0puSlJaMXdGNkduVTZNSitKY29VQytlQnplRGZzTHNqem5Bcy9qVk9kTVh0?=
 =?utf-8?B?RkJrMm5xanFTVkMrcnh1UWNOdCtmTU5HSDZ2N2YzK3Robzg4N24wSmV3UCtZ?=
 =?utf-8?B?VjRtRnFNc1dpemlNUFNtdDMyV0R4M25RQkRPMVZneXJmNUFrYUU4QTlud2Fy?=
 =?utf-8?B?Z1d4dGF5K2VnbmRvaGVLeXN1bDZ3bnFJWTFWUXVmRjhQUXRaS2dsWTFZOGg1?=
 =?utf-8?B?a2ZFdlVFVXJQN1BVZHhHeUdiOFFaZ09KZ041VjJqczNHN0lZdnJjRFVFZWxG?=
 =?utf-8?B?QmxZT1kvMDdWVUdsMm10bVdXK29NNXJyR2llNkVFaFFiOEVhLzNjb1FVY1ZG?=
 =?utf-8?B?azFhNEdKQnlSREJiakNCdXZzMXBMYmU1ODlFUldXQU1oZDZDdlB0eGtIVSs1?=
 =?utf-8?B?ejVXaHpoMisxVlE3bmg1aG9GSkc3aG5TNVg1WFVvMnBLd0syT3M3ZE9SMWdU?=
 =?utf-8?B?RUovVHhvUFRkc2pzdCtvMEV0dmJFNWhoWGp2M0dpdjNXQkN0TXVERkwzS2NL?=
 =?utf-8?B?SVYzRVNKYVAvNkVhdDR5SWtEWlpMbXNMR1pZZ005eG9KQS9lUWJLQ2dGSCtP?=
 =?utf-8?B?bUVSSFhGdi9yT21KQ0ZFTkphd3ZJOUFGY0NvN3c2MjMxdUZOWDNqekJBVU8r?=
 =?utf-8?B?T0M0bktRODVlaTB0dVdncXExNEt6d3FPNnhMdFNOYldudDFJVnZTeENjdVJp?=
 =?utf-8?B?eUdWUnhVc01RdU1zVi9zK2F0OFRXUzlIWGhvQVZsWC9MRzlFMm5RWmR5b3Mr?=
 =?utf-8?B?R0l5b1JqZUJTY0IyS2ovdUJVd1A1UVdEZkNqekNqRTMzNy9IOHpPMHUyblZD?=
 =?utf-8?B?TGt3MCtvaG01WE5ZejFUNytldUtSNkhJNEhGb2lESGQ5cFpLTlNwUTlzZHYx?=
 =?utf-8?B?WlBzN0ZqQVBScFRmMjlSajgvNHJudWZwazBGWWN2MHk2clE4VTNjMTcrVFho?=
 =?utf-8?B?bWVsVW9kb3MyNkowVUJreGxhWDZCb3lUbU9WTGVnMzUwMnBzcGNoOVg5YlJl?=
 =?utf-8?B?N2dhMXU3RjFLZm5NT2F0RENnK3V2Tml3YndmdlYyNWNUVkViakdTMG8xc1du?=
 =?utf-8?B?M0NKYkJOTEpsOUprMUpNZUdRZ2dhWm5QaVMvMkRFSUd0amxBSENyQS9hWVhZ?=
 =?utf-8?B?cjZBVDFudjZrdVRad3VBUnErZnQ5VG4zSG9kZ2tITGxjQWZ2VHpEZE1qK2hK?=
 =?utf-8?Q?U5pw50WYLYBd4BgaxoHO3EsQjJahFhcu7a+88?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed00614d-c0cc-4f3d-464d-08de72b13b7c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 07:57:47.9510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YFHiehA/RjpAQUTLNrWobmVaz0FHMI2v+rXdirfE2sp0AGNxat9n5iaI68ak7F/3SRagV2sJ9Rs0Mb8embekDP/ZMmM8nXzGo6GC4CQOOCqZIk4cwqnue3eJ5vA8PiHC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8448
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

On 20.02.2026 09:27, Matt Roper wrote:
> Wa_14015795083 and Wa_14014475959 only apply to early steppings of
> Xe_LPG that appeared only in pre-production hardware (in fact
> Wa_14014475959 wasn't supposed to apply to _any_ steppings of version
> 12.71).  Xe1 platforms already aren't officially supported by the Xe
> driver, but pre-production steppings are especially out of scope (and
> 'has_pre_prod_wa' is not set in the device descriptor).  Drop both
> workarounds.
> 
> Bspec: 55420
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c         | 4 ----
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 3 +--
>  2 files changed, 1 insertion(+), 6 deletions(-)

LGTM,

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala

> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 76fa6d510aadb91169170ba35f65390c477a569e..aa5755bcdc04a3ec2569ab9676a9dd95516f1711 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -191,10 +191,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  
>  	/* Xe_LPG */
>  
> -	{ XE_RTP_NAME("14015795083"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271), GRAPHICS_STEP(A0, B0)),
> -	  XE_RTP_ACTIONS(CLR(MISCCPCTL, DOP_CLOCK_GATE_RENDER_ENABLE))
> -	},
>  	{ XE_RTP_NAME("14018575942"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1274)),
>  	  XE_RTP_ACTIONS(SET(COMP_MOD_CTRL, FORCE_MISS_FTLB))
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index ac08f94f90a142629545c4964ca0fd3f9cad6aa9..cc988f2a18d33365dc09d32f4e85ced01b823877 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -2,8 +2,7 @@
>  16010904313	GRAPHICS_VERSION_RANGE(1200, 1210)
>  18022495364	GRAPHICS_VERSION_RANGE(1200, 1210)
>  22012773006	GRAPHICS_VERSION_RANGE(1200, 1250)
> -14014475959	GRAPHICS_VERSION_RANGE(1270, 1271), GRAPHICS_STEP(A0, B0)
> -		PLATFORM(DG2)
> +14014475959	PLATFORM(DG2)
>  22011391025	PLATFORM(DG2)
>  22012727170	SUBPLATFORM(DG2, G11)
>  22012727685	SUBPLATFORM(DG2, G11)
> 
> -- 
> 2.53.0
> 

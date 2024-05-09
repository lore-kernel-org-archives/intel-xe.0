Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0B3C25B74
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 00:04:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9087A10E2F9;
	Thu,  9 May 2024 00:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H4Ms2fp5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C4A10E2F9
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 00:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715213048; x=1746749048;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MwV+sD0AF1HVxfJvHcBvz96qcLPNHw0PW60Fd8wlOys=;
 b=H4Ms2fp5AMKelUd/AtBPeKXCiDO1hJc5L1KY+W+kOInG9vIUniOjiU3p
 UGxS2qYKselGPOfU+9hhTwY1I7fnug/vCdFeFvxrbCT/rx1AtnjdwYw6F
 Zk4AadCNYd06wmumJKeopEsOwWQzH9XVI2yRCoX4wWKb+2nD6VEoMEbEj
 LkPb8E9o4q6In/G4GLuTN5Ob8mncSAcv91VEJok0lIBGpDCEjXE7x4p2p
 oL+DBxTSs8anLVGZy3def+PbX2Nhb+iu49HgLXex8H9iy3FNF8hYRLHLX
 Juk20aepO9JmES0CyyNRYQmCDCEi8V1mn9Y42+mrRfqBkA8t5Yk6eKCWq w==;
X-CSE-ConnectionGUID: XyZhcHxYSu+Bt3rRT+73uQ==
X-CSE-MsgGUID: T7+l+grYSimJXsg+nftlew==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11262257"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="11262257"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 17:04:08 -0700
X-CSE-ConnectionGUID: /S+rB/3lTV2chygsxIg+Ww==
X-CSE-MsgGUID: FmOPDUkzTISW0TnmLrPTqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="33526648"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 17:04:07 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 17:04:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 17:04:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 17:04:06 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 17:04:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bnJY+qPXcX1NiMyJSu8bSVokGWiAN326YPN901ln1/3XNdA3j1q+4Eazmx4XkGqvlc7Ha4HTWZjDo25AtEkwu2njcQYJiBlVRK0cpP1/Yq/kT8Qth4EgTDCTJzNor9KVZ2MGqptv3tN/VXmSPYSBNzAw6qHIREFJ+1d0dbFUoOHd2X3SNkasqGoDf912jNhcOxEXcTm/e8tLyOKgtrz3HuQfskXOPfAkTeeKveJq+yYlewc4/55ggcT0xWbZWEHRM/G3k0VwLk45xFo/n8fbE6ljs9P7Xfwgw/uVBrHQopKLh38dK+fxFt90GLiU+T7HIPv4pmOzGiiv+XOzg0UR8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jnjomtc0ASrvK/4XmTrZUSzZBsvWmh4uAvLxiE7AN98=;
 b=kBKF3vzlHuOSV34y5KdBmIfv1E7FmzypmBhCJU/pxGqQzNHGYjYIQ15Xrl3pl4RexqSmbIdUoU78BbabsrcrSSA6gvYovLhctZW48+4MOO2nN0Bc/h7Qo/2ZPGBPBZWTgMqroFHFpb9jwFF1WYnNkdAChhuyhVxyj7BZDOrKrlR3M/0lpZoNcHvrIgGE1NvnJzof4hyTLq87qxt2DgWoe45deaden3hKgJIcZ3TIKoqARgTtfo4RbogUxBZ4As3oeAy0pynawgqdHJVuMBEF0PRMEN40oLPpSohsC1SiRnlqiPqo1b8JK7ZqYTz0G1Ln+g/hUxvxqU9/yXazqbGFhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Thu, 9 May
 2024 00:03:49 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%4]) with mapi id 15.20.7544.045; Thu, 9 May 2024
 00:03:49 +0000
Date: Thu, 9 May 2024 02:03:47 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <vinay.belgaumkar@intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>
Subject: Re: [PATCH 3/5] drm/xe: Move xe_gt_init_early() where it belongs
Message-ID: <wl3bu6ixbyvinpmvnjqqqppjl4ocohhbvqxmciux3rt4bbhm2s@42o54st7esdf>
References: <20240425182410.2705061-1-lucas.demarchi@intel.com>
 <20240425182410.2705061-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240425182410.2705061-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: WA0P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::11) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB5818:EE_
X-MS-Office365-Filtering-Correlation-Id: de13964f-595c-4a21-0681-08dc6fbb8128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFE0MkxOdEFTQ1VmRWNYbWg5WWlhejdTRmNyNWZIUGcyTFVxc3RvcVQrVWJu?=
 =?utf-8?B?ckFVT2dFbXpRZDdqc1ZQOGdjUDY2bmhaQitPUUtIZCtxZGlOMU12SzFaKzBx?=
 =?utf-8?B?YmZPTElBYVFSQTVid1I0aXlkcWwrMC9qVFVCUWhaUEM4NDN2UHR5OHYrQUZE?=
 =?utf-8?B?K1F6dWdqQkE4R0k3c2dlbWROOEVGRFd4aXNnRzh2MGQyS2Rkb3V4bFd4UFVP?=
 =?utf-8?B?Vk96L25GZWIyQ2JDVHRkMklZSXNHQ3Q0cjdSRk1kaUxZaDc0WUJ5Vk5jVEdF?=
 =?utf-8?B?TG5qcmtXZFhwblBka1drYnI3VEQ2SjRHOHN6aEFTYXBrYVptM2Njb0JIYjR4?=
 =?utf-8?B?WVF2MkRXOWh6M0Q4QmlIRTVraWYrU2RPbEJxZkxsQVd2ME9aR3R3Z3Ixd1hL?=
 =?utf-8?B?V0dib2orTUpPYXVxUzVwWm51UTVPejFMQ3VmR1kyVmhUaFIvTkhYSVdycWpt?=
 =?utf-8?B?ZGZlUHRSZ3p1d00zQW9iZ1lyR0ttTUQ4T2liNnZCd3ZKTFgzQURkclk4VHM0?=
 =?utf-8?B?a0dCV244dnU4aXBYeHdERHppVW9uakpsZEQzTmJvd1FrazlYQnRlK2FINUta?=
 =?utf-8?B?OU5adEhXb25wSmxJam9iY2FWd1NpMFNLQW4zMzc3SXlXT0N2Z210cUI4ckR6?=
 =?utf-8?B?YWF5ajNqK01hSlp1bmVoUysrMTE2eUhQbkRGR0hsNHVXcEs5NnVMMHE1RmFX?=
 =?utf-8?B?S0pveVovUHFqYVduYUJlWnNuYUp3Sy9kK01BSFhMRkhmcHl6emN5R2YxdE9H?=
 =?utf-8?B?c1ZxY3JFS1FUdkZxQUl4OGFBVHdrbXhvME1zSlVRL3ZwVEdiQko4d1BtWGFL?=
 =?utf-8?B?K0xMOGhieXpzVzN4Y0N6VzdtM0NqS2V4cFZaM29ZcGtiaXM4a3hxbCtrbWQr?=
 =?utf-8?B?NEt5NDhwNEpXeXVQWUFPZ1BFM2hqS095WGdHYzhTVDBTTTFjQ083VmhCci90?=
 =?utf-8?B?NmF2Ui9JTC8rclVsVkg3YUsxdlBhRlExTWI1aFhSLytsb2w5bWVIM3BnNGZN?=
 =?utf-8?B?ekxjLzc2UHZ6VlZtbllIeHhuZnA3dDAxM0FuQ0FuWEtsT0oyNXdrZFV6TjRR?=
 =?utf-8?B?bjhiVHNsYWFmeFdQZ0N5dmFuRXZSRzBLU2dHTlprTmlNNHJFRHVNaDBxQjRw?=
 =?utf-8?B?UCtFalhXaHhLR25CQXpIajQxSlNFUktQUEZDR0YyQjVlQ1hOQXNCUk1UVU5v?=
 =?utf-8?B?NTRTRFI3QzNDbzBRalQyOWZ6UXd1ZjE4Sk5zNEU5MXY4bnNyWjdzWFEvMDZB?=
 =?utf-8?B?UHRGK0s0Uit4YzVGZ1loTlVpVTRnL25NeXhBd0pWbWpGUUt3MktWTDdxbElw?=
 =?utf-8?B?NVpyMXZMVGZhajQzakIyTk5pQ2tSVHNycUk0dExZN2NDYXBGRzBZZnRlVGJi?=
 =?utf-8?B?VCt2M3BzNXZjb3k1TXV4V1VlYXMyTkRHTVVhaTNKRjdhTFdhZkxrVnNiaXVw?=
 =?utf-8?B?RDhRMXpEY3lRWlBySzZYVU1tSHRWWnBVbGc4Z3k1RTEvOVFhbE1yN1gzT1hP?=
 =?utf-8?B?T3NZVlI3L2xXb0ZIT0k1bHI4MmtWQ3Q1ZGRwb3Z4TDM0T1pXdW1rL1RXclVw?=
 =?utf-8?B?dnFSZEUzQ0Y5b3gwODZ4UXpveFhucU1qdmlmV25LZVBEQXZVclI5akhrQTRE?=
 =?utf-8?B?RWkxa2x2V2tDOTNiTGozeGluRHB3cHpPRlJ4L05YNS9iTmhCZzVxR1cyUVhJ?=
 =?utf-8?B?Q1MzeG44N0VPUFI1RE1ZMkg5SmIvZUxidzhQSHZTUUhVbm1xS0psc1RnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFlKSjFDTlY5NDlZbElvL2hsbDJ3Ky9OZERvamVFY01yVGlOMGZSTVd4ZHY3?=
 =?utf-8?B?TXJTMTNxc1JmRUFkdHdtditEU2pYMzM3Sjh0cVFRNFY0R0pSSGlCK1RjR1BP?=
 =?utf-8?B?ZU5xQzJWb2prK3Y3WGgyY1Jpanc2ZER5aHpCVElHZDFOZ1Fjb2txbkpBZHZq?=
 =?utf-8?B?YUxhYWZYbFg2Mnd0S28rYlJYWnQ0MS9EOCtvRTRvYUc2WFdKYXdJcG05S1pY?=
 =?utf-8?B?MGJ0VFQwd1p3UG01SzM1RXZWZnlnVHJGb29QTWNnTzZyUVRvelhqR3ZPS3ps?=
 =?utf-8?B?YWdkUnJJQm04UE9qZTRQbVRkbmZvNkNadC9yMFRJRGgrYVZIdEtpNDdRWGRW?=
 =?utf-8?B?K3hQbEU5eFNyOTE5RXJ6WlBlL2cvc0laYXBVeGlKVTVaQjlCQkFhMm9sNWlj?=
 =?utf-8?B?WnZaU0xUTi9Za2I0cHp5K3IyTktZU2t4bTZEcDJneFFzZXdaeko2NVh4UnYw?=
 =?utf-8?B?cGlseVgzclZRMk12VTNvQ3dlMHluVzlHTGhvQUNEWEF5cTY5ZjNUcmY4eTdq?=
 =?utf-8?B?cW1TajVDUDkwbU5hMVd2MVJOVXF1cEtES1F4ZXdTNFE5allGRFZpNzlBeDF6?=
 =?utf-8?B?Sng4SG9HWDQ2aTFoNmlYcjJJUHFYS05jVFNIZ0NrQkNtdEtrL3hqTnpJSGxW?=
 =?utf-8?B?Q0lSRTNCa3YydEdnWkFKOHA5a1dJV01DZGNJcTQrKzJQRkJ1dlQ4RE1xWjZj?=
 =?utf-8?B?MEN4SzB1VWN5YzYxWkV4WjY4L2p5YmN0WTc0OG9iWDRkdWxhYVJNZEN3L0g2?=
 =?utf-8?B?dWVTSHAzcWdkOVJhZ1BXbTJpbVRDQkhCZ2d3djFORHFZWUpRS0I1SnJ3bjZ4?=
 =?utf-8?B?Szk1alVGVG5Jdit3SWRocDVyeUxrRVRqWlltd1pGMEtLVzY1NWFwamJXd3lP?=
 =?utf-8?B?WDYxZmJramFORk5EUWZUNHpES1hHanF4UE0xRzFiREpYRWF0TlZYcm1kTFlo?=
 =?utf-8?B?akJjWTk0YWtKdVBiczdoZWxTdHQ1L2RENFB3bDJ0WDVtRk5lbERWcldUT0xh?=
 =?utf-8?B?aFA2WURlbklEY0JqcXh2dkhDNVhzK0FpYm8rK0dEcEtDaW1DdW9WeWRiTVlL?=
 =?utf-8?B?c3NNektZb0hGSnFzWlFPTUp2R3ptaDFLclIvSlhKSzJKeEhWdVBXKzE5cVVL?=
 =?utf-8?B?cFNXWUpxUWhXK0hWOU1qYVNGR2YwTXdYTGtxS21zU3dMNm9vYXJrUnhudit0?=
 =?utf-8?B?NjIxdzI2VUp5dVVYcXI3WGRBcWdWN3c2SGdwZklPMUdUMFhKNHAyWFNmUkx0?=
 =?utf-8?B?QlhYNVBzd3NDUVBNVlZmcWFRVnFQR3p4YXo4Q2laRzg5enpwai9KQjFDNnVX?=
 =?utf-8?B?MlU3TmtCNlZmM2NvYXdEQlVPeEJlM1NFajY2MjhpaHk2QU5LNzRHejVaaktN?=
 =?utf-8?B?VUpBMGY0NWdQMXJqNVVGdU5reURvaU1wdGVvQ2p3NzFORTdaZEpmN0Z3M2Fx?=
 =?utf-8?B?cHdZNDBMSGhlNnVuenlQeUJIVHhmaUNRZjNsSGtZV1AzWUFHWFpKQlkzemtv?=
 =?utf-8?B?NGE4QVZXYko5RUM3dm9XRTdKVUNjZWJFSVdiK3Z6clcvUlJ2ZjRtTG15QmZt?=
 =?utf-8?B?YlJnNEVHeGMzUFNLVkdVOVVxaTQ0Sm0rWE5LeEVybytKWG42UkowNVhVVXpu?=
 =?utf-8?B?UTJ2ZzFveVhHeCs5QVJiNlR1ZGxqUkZkNWZjbi9EMzNXeW00cXRhMHBDTWZl?=
 =?utf-8?B?NW1qUWl1WUJYR3FsOTdjTGV1WlV2c0NMTlRBUjY1OUxTZ2NNZkRXOVlIQW9L?=
 =?utf-8?B?WWNpKzd1SFdXSTF0ZElZR0Z3MVhuVk9Rd21Vd0w0RWZ0N05DTklheUZCV0ll?=
 =?utf-8?B?WWUzc1g1NFE4cDlrdFh1VnNyK0oyUWJSb3pmazltRmxtVTc0Zkg2Z2VxS1F1?=
 =?utf-8?B?dlp1ejAzOFZuQ21XMVFwczNpa2ZDNXloS0svcXNUbDNLSTFVc2JGM1lLMHVN?=
 =?utf-8?B?Z05MckYvTHNnVlVDNlZFVVphUFcyb1R4WktSV01xWkE3c2hoUFB6WGkwYVht?=
 =?utf-8?B?a3BxUXE1RnN2MnRSc0xYek9JMG51dUhoV21IQVRoUGhYMUpzL1VRUWJjMDIx?=
 =?utf-8?B?NllQYWx5ck1JbmVXRCtlcFJyZHhENFBXUnpzdWcyRzdlUk9Rak1PMHVqYnVw?=
 =?utf-8?B?YjhsQWdndVluak1JZTA0aU1mUkVReEIrNE9lRE9kV2c5Q0lyZ2xUV1htckJ5?=
 =?utf-8?B?a1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de13964f-595c-4a21-0681-08dc6fbb8128
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 00:03:49.7342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q7a4GBOg3AsGGeEMytalDU99+nCFHh6G34RD5Y2JgoXNxAMwznFjMavz6ohYFa84VMS2vE6jzgrbPAX49HOwsjKgBXuft0dJrzi/57c7jh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5818
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

On Thu, Apr 25, 2024 at 11:24:08AM -0700, Lucas De Marchi wrote:
> Early shall be early enough, stop doing other things with gt before it.
> Now that xe_gt_init_early() doesn't need forcewake and doesn't depend on
> the fake engine_mask initialization, move it where it belongs: it
> doesn't need to be after hwconfig config anymore.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

-Michał

> ---
>  drivers/gpu/drm/xe/xe_device.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index bb4fbae5edb6..8d04283b3617 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -566,6 +566,12 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_ttm_sys_mgr_init(xe);
>  
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_init_early(gt);
> +		if (err)
> +			return err;
> +	}
> +
>  	for_each_gt(gt, xe, id)
>  		xe_force_wake_init_gt(gt, gt_to_fw(gt));
>  
> @@ -604,12 +610,6 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		goto err;
>  
> -	for_each_gt(gt, xe, id) {
> -		err = xe_gt_init_early(gt);
> -		if (err)
> -			goto err_irq_shutdown;
> -	}
> -
>  	err = xe_device_set_has_flat_ccs(xe);
>  	if (err)
>  		goto err_irq_shutdown;
> -- 
> 2.43.0
> 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6E8C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 10:38:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D4110E0B7;
	Tue, 14 May 2024 10:38:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AAo8so2D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C7510E0B7
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 10:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715683111; x=1747219111;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NqmcLptEB1TLmAhnsIg9JjnycL2GGx8gdZI0JM091YM=;
 b=AAo8so2DX8vbJ8Hp1/7TbikchausMRgjAzHAlzOyMW8PLK54YzTr5DGX
 S4pjNC0gAOqev03BvNpD08UkiT1BqR0vXEWUf3mYJRhr0hoHCVcY6X948
 4hACBhSWiImjGQID0V61aVkd4z+PgjyTyfsYi4EhyIYye4JMFzu9CicbD
 DToD/M1YHMuQAToxzUQpie+8VaRp5X4vyLDpYEfPzXLdascYLt4UcnxsN
 p50SHOxDcxb2oDgmhozW05VpTiZwSHEdZxzEDrg2yz0evNW5D+syHNwvn
 dYNolPe7klevE7430RW8C7yROt59J85GPnNCvbfjzUdNL7Vj88fhs5lN6 g==;
X-CSE-ConnectionGUID: O7TSWX3lRLC9taSz9S2n1A==
X-CSE-MsgGUID: 4ePANvYETY6Yv5O2h/e0+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="29174962"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="29174962"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 03:38:31 -0700
X-CSE-ConnectionGUID: SDdThHMZThiFGw+xzisRiw==
X-CSE-MsgGUID: rgMU0YmmSa6EGskzy3DHYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="68111214"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 03:38:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 03:38:30 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 03:38:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 03:38:30 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 03:38:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oUrIGVkIdYuynTO+YFeL3vgwKKFi6g9nJr1SBls0lYI64dbFIz14+51icrLa/rw2X2x2w3MdO2jdL5otfx1wc2IzpR/U/I2zAWHakHR0iQv2+hkrmi//UEZ8LrS1jJmO/MSOxZGE7Bd2qfTWG7xj16fOi2dPIEw7mF8DeDVhmhH4Q6O0mtYt55EaCNk/0Qch0w/SJStP9lNu0HxBq5ozmYR2Gq4eSEwPwXXTrE6CIja/UCE4dcucF4rMo0fxgpFcFISH1LQ/GNi0Y9g0juLj2aGOQHLV3UQScOGHuXsbD6MjhSPu9oE405TxnIKw80X7rN48xu8yzW3Ki8aBFvIS2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=anwyKhiVrZZolff8Cqjsq7GDPwKce9U/VARVmcfGYhU=;
 b=QW0gS0Qd1atmYJsP/BXaP5I0FpWopfVVFPKyILZZDHUuFQBfpXLCPAHLUXbj4DAq++gRgNQIK6WBmLVSssa0snOvxQCoJPL1jPLs6PKUqahHyHNwnP+wVHMMDRLMhFclDWBgqHtcu92hXG68bv7TKQXgDioQ3/PfBjK0T58GTqGTIxxpY1Izl+OyqpvxhSN/goO0FSEnjW14L3dXTxDCLGm1mnubHr+Y41Iubp6Oa1a/BYhAcbyNNEnHp0b4sC2I4m2ejBIPVUcGcC5oOhXlJG5PForO8wvSvPjvwRw/arPXfvgDHGALTOfJu1fyFDeTv4LY+8zXaLdhE/dOnvJWLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH7PR11MB6452.namprd11.prod.outlook.com (2603:10b6:510:1f3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 10:38:28 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%5]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 10:38:28 +0000
Date: Tue, 14 May 2024 12:38:26 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 8/8] drm/xe/pf: Expose PF monitor details via debugfs
Message-ID: <20240514103826.y43kpk2mlkd2qhbo@intel.com>
References: <20240506133814.2571-1-michal.wajdeczko@intel.com>
 <20240506133814.2571-9-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240506133814.2571-9-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DU2PR04CA0214.eurprd04.prod.outlook.com
 (2603:10a6:10:2b1::9) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH7PR11MB6452:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e0b8857-17f0-4f28-a320-08dc7401fdc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0Q2c01EaDVobHhGU2ozQUFQcEt1d1BQNVcvMzNOVWR3dzNtUkVheHZhenU4?=
 =?utf-8?B?NWc4TGZWQVExQm0zS0c4QSs4ci9LNUZBMHRjWklzTklhLzFmb1AyVFRVQkw2?=
 =?utf-8?B?UjBUSTY2b1VnTDNGQThUMnpuU2VlY01yNjJ0dzhyamR5NTlLaHFUV2x0djk4?=
 =?utf-8?B?KzJ3UGdDMW93eUw1TWZZazhway83cFRPelh4ZjhzU05Zd2h4cEEwV0VLQ2RZ?=
 =?utf-8?B?a3pmN3JPVW1qRUZ3a1ROYzExdHBSZlpjRUd0bjVTRTdaTEFKTG9XbWlldUsv?=
 =?utf-8?B?MTZURzF1UEFmOHRaUVdiVUFuS0QzWnErZjNPQS9LZG1zOVY1RnRVT1BncUlL?=
 =?utf-8?B?a01FaktMaE1KSE9PbkpuSkFpa1JsSEh0TS9ocnBqWm5jK1lxREVXMVp6RXZX?=
 =?utf-8?B?RVBaeFBYYWYrU2dTbkpZdG1Ub1hZSkZiaGE1YXJnTnc0SWZ2MFEraWVHSVFY?=
 =?utf-8?B?U2svTFNtaDY1VmVkU0NURkVXWXRnZ2pYZmE5MDRnNW5XYmU4aXpzUUVNQU5I?=
 =?utf-8?B?NDh0NVZxOXFaSWVMTk5iaVZPV2kzZW8waEpFSTNrTkRHT2VCWjNZT3hZWUlR?=
 =?utf-8?B?eWwvdWZlbitGejNReVRrMFVnRzVnOS9QWVFyQnNWVm5JaFBiS0JoWHI4dm56?=
 =?utf-8?B?ZDFzdDBham1oKzA2WG5xWHJ2VEQrcDZwWityTys2VDBETW5leUtvWUpXQ0w3?=
 =?utf-8?B?K3cwdE1oRXNVUjBkZjhZaDQrVFp1L3NpVGh0M0VmSW9UQVphTjBHSjA5NU4v?=
 =?utf-8?B?NE04ZjJLL0NJeXFRS05jb1ljKzRheEtCc3FlUzlXR1JGNllxaDRINkp4OW14?=
 =?utf-8?B?dVd5dlhZL2tpVWlnWWdhSEhTWGhsWk1DYlZQdVhnZHEzYVBnejlPMVRmTlc2?=
 =?utf-8?B?dHdwS3lvRkhHSFpIMjlEend4TGd5TkV5THQ4bnZXZ05JM3VhNld0U2paZ0xn?=
 =?utf-8?B?ZXRkdHZkc0p0WVJPeGo2QmdGTnZmV0hIdG1tMHpoS2hkR1pBL0wrN2c0cjJh?=
 =?utf-8?B?cGI5N3NkU09idURKaURmUkx2QUwyWjJ4NmMweHZuRnE2aFpsTUZ6bFZvQzNQ?=
 =?utf-8?B?Sk92NUlDeWdLOWVXTzZpZVJibXNMRGNKcWt3d3RBY1RaU09naElvd1RURCtP?=
 =?utf-8?B?cG0yeW1xb3FzOGtJUlA1alNyRTdGNm4yaFlkQ2thNmdMRllFTzUzbXl0d0NQ?=
 =?utf-8?B?bVFWVVhtS0lsRitmK05MWDlRQUVzaHlINk56UCs2Yy96V3lTU1A3TURScy80?=
 =?utf-8?B?OHE0cWtIbTExQWRvS3o4SXZSS2MwSmNXSU9XZUNFbHVuSkdJSXI5MzNIVjhu?=
 =?utf-8?B?T1NHWEFTWEdvY09LSXZvbklFZm9HbGxPaENWakZQOEtpZHgvblcrMHB0TmRF?=
 =?utf-8?B?SjlZa0lpZmRlekN3L2V4TFNvMGE4U3NoQjhCTXBDSmJSOE45blpkV2N6L0lV?=
 =?utf-8?B?RndXeFVjc3hLTnNNZm5BNG1lNlhTdjljNlJHMU9McEdSRVdWbGtkZlRGZzJE?=
 =?utf-8?B?Q1E4aW1TdnMrQi94dzdXRmlJVTF3VW5QVk4vdCtKL2p2SnJ1YU1GY2NLd1RR?=
 =?utf-8?B?cVhFOVRVMVBzSjlHSUJnRlFSanNFOW42aXArRnd2bG40OUo2VGZ0UDFNbm9r?=
 =?utf-8?B?VnQwZmVKNDQ1ZFp6c1FoMHVrZmd2WVNVdElERTVhNWY1WFNUYUMrVExpanNi?=
 =?utf-8?B?Kzc5c3ZLMXRLYkNzYTRudTZiT0o3ZDdTeGtLeXVEQjd3M1RaZ3FCTTBnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFd1VDIxcjlGWVhBMHRFMU5oQUlqVk1SSFhVWnRWTjVxYlJ4bW40VUg0b2U4?=
 =?utf-8?B?WEFjNjhlN0Nud29XSzNQRGt0cUhRTjc3OG9jaG5OMlJIcDNIdnordDNyTjJt?=
 =?utf-8?B?Nkg1Y0VWYWdxZFZkSGJNZE5UUEdoMERxRVlIVkdudm9QZ2JiQU04aW5NMHZz?=
 =?utf-8?B?NEY2SzdYSlp5QWF6eXZTMDFuRGI3NUxuK1NOUmVBazJBVzM1NVpzaHF2aXd3?=
 =?utf-8?B?N3lLcURENVdTMlZ6SHMrNUcvSkczcDRsdUVaSkNHRHRNNzBLQU90c0dtODZ6?=
 =?utf-8?B?RVNsbmZZSWx5bXZBZWdNbmpnbEE2aFdVVUdmUjBXOE5XMmtzWndJS1NwTVZa?=
 =?utf-8?B?bnQ3T05Zc1hnN1FmRnNrQ2ZTU3Vtci9FK1JNWmU5cnBsZWV6YnliQ0x4UUVM?=
 =?utf-8?B?NlVZMHZRYm5uVEZjSUNuc2VlSldoRGtiVVhzSHo4MUlPVFVuaEhOV3ZJbFE3?=
 =?utf-8?B?R2JxaVJwdmZ6Rm5ONTJRdm1KRXNXaGt0QkRmT0xwVjBlUENqQ3RRaFlsbkcx?=
 =?utf-8?B?a3Y5ZVhHVlZhdHI1Y1hzOG1RTW1ZRXFEWnN0MEJFdjk2Wnc3clVLOUtlcWpm?=
 =?utf-8?B?dFpPT3o3V3VqbXBObUxWeFNLRnQ5OWtidk1GaHRnRGRjcHBVakFkRHJFMlZ5?=
 =?utf-8?B?U0FTMHNTUGQvVGtqK0FEMDdNdzFwQUsrMVFKTXprVVNkN1NoZ1kvSDNFYkNJ?=
 =?utf-8?B?bW9hVmFSL05CS1NwMXNjU3VIYzZVSlo2OUUzWjRzTmZKbjNyREFWL2NzR1Zm?=
 =?utf-8?B?cjloZ05NdjlsWUJXVTBWV3l0TVFFSk81SXo5Zm1vc0VsdVlHWUg1OWNxUjVj?=
 =?utf-8?B?OFRZWnBSdm43dy9MVitYMllGeHVPR3E4R2E4YldGUlBQSVA2SFM2ZHIyZWo4?=
 =?utf-8?B?U1J2alhlNnoxamQwMklqMGp2T1dwM2FGRmxvYTZ6UmZjdmxMWVB5dkk2bmIx?=
 =?utf-8?B?MFgxWkgrZ0ZZcjczVXJuUUdka1Ixa2ZQeHZodWQwdHhRWm1iazBDS0hoai9B?=
 =?utf-8?B?YkZnZXJ1LzRKanlSOW1aeUtUUnlyT09hNUlhNUcvUU1sYXhiZFI5VGtVMUpN?=
 =?utf-8?B?QkdOSHE0R290aUlMVHRicGk5T1NDdHdxNitZSzhDd1A2OGRwZlRXbW13cElt?=
 =?utf-8?B?L1IyRFFOV2FwM2FxRXloSmROaFFObFhna3lTbzFQOFBCRHI4eWhkSFp3Z1Zy?=
 =?utf-8?B?ZDBhMUkwNUh2NktnTVhzZGZodDlhR2s3RExCcTNEM1dXbWlSZzl5YzVMcXR0?=
 =?utf-8?B?V0V5S21lTE9TcVFDU0FjQ3JvNFhBeXQvbXZWWGx1SEJZdjFwdHVZVEp2MjlM?=
 =?utf-8?B?dnRhTFJrSkROb1FRbXdIMkRpcHhWQ1k1NHhBbENZdERzd1g5S00zZ2U0SzIz?=
 =?utf-8?B?YWJhS1ZPaDBrVCs0WG5MODRrb1crdUk4QmF2c1hheXhNVmt5TFpMNGVRNUpk?=
 =?utf-8?B?TjdYNjZRYnMxdlBUM2pVM0Z2RVhOWGtUZTlOTklaRnZLNS8wcHh1UWR4bXNv?=
 =?utf-8?B?VGtuNEZiUUVsUnJkdFF1RDhIMzZ2YmlMVk5sNWdjSmVlUVN2d0piMlR0Vjgw?=
 =?utf-8?B?YnFNOXFKRGZZaHUyMXR3M2d4cmFEMS9BL2JQUUVYTTRJanZEMXhmRm96aGpO?=
 =?utf-8?B?LzJPYjNnUkVxNHd3VW56ZXZNU0s2R1R1QUNnZlV5V3Z1KzNnQ0hkN0ViN29J?=
 =?utf-8?B?MC9Mb2llL2tiYm9oNW9xemNTUmtRSm9RZkdtOHFjZDR1aDBvTEpRVkhkTnZa?=
 =?utf-8?B?ZmRkOXBhNUxabmRNWmdWTFlUUUxrdnZMc1lKMjNvaU1JSEtDYzVlMDVLT05V?=
 =?utf-8?B?RDhGbGs1STRObzlUZlIyRXM5dHY1QjRRbVRMOXY5VTE3ZnZzMnJKeEJVcWpS?=
 =?utf-8?B?Z1pvMS9FMmJMam5tS3pPd2RXTTRMYUNIMzBxaUJibWE2ZWN5YnlOSjh0VDd0?=
 =?utf-8?B?Ymo3U0cxRU1nTHhnczlET2Q2ZzIxRFdJVHJPRXE4N2pYQnVTRVBiaHVyS3lv?=
 =?utf-8?B?S2hsU2NGL3A2Uk0xaEt3Vnd1SWtORE9Uc0VXZGJZSVI4UU1OSDVoSmhHWkZ5?=
 =?utf-8?B?ZDlYN2p5NVFVenR6Z1dVNnBLLzF6UlJSOENUbFlRYm53RUtiWjRQMlpSMEFi?=
 =?utf-8?B?SjJMSXNKMTduSUoweVNseEdwbVhoQkpNejdzQ3NaYzNnMm00KzN0ZmF4MWs3?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e0b8857-17f0-4f28-a320-08dc7401fdc9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 10:38:28.3197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZQL6FMNDoeIM8M8216LPQI6oq/t+dFNsrsWPWnrgMvXXsEoKtuC6993rcb7oA9dJ8hbz3xttwp3yL2ohhiT5AbHN0CbAeltVRc977xl7LJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6452
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2024-maj-06 15:38:14 +0200]:
> For debug purposes we might want to view statistics maintained by
> the PF driver about VFs activity.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> index eb71c2009c34..2290ddaf9594 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -17,6 +17,7 @@
>  #include "xe_gt_sriov_pf_control.h"
>  #include "xe_gt_sriov_pf_debugfs.h"
>  #include "xe_gt_sriov_pf_helpers.h"
> +#include "xe_gt_sriov_pf_monitor.h"
>  #include "xe_gt_sriov_pf_policy.h"
>  #include "xe_gt_sriov_pf_service.h"
>  #include "xe_pm.h"
> @@ -55,6 +56,7 @@ static unsigned int extract_vfid(struct dentry *d)
>   *      │   │   ├── doorbells_provisioned
>   *      │   │   ├── runtime_registers
>   *      │   │   ├── negotiated_versions
> + *      │   │   ├── adverse_events
>   */
>  
>  static const struct drm_info_list pf_info[] = {
> @@ -88,6 +90,11 @@ static const struct drm_info_list pf_info[] = {
>  		.show = xe_gt_debugfs_simple_show,
>  		.data = xe_gt_sriov_pf_service_print_version,
>  	},
> +	{
> +		"adverse_events",
> +		.show = xe_gt_debugfs_simple_show,
> +		.data = xe_gt_sriov_pf_monitor_print_events,
> +	},
>  };


LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  
>  /*
> -- 
> 2.43.0
> 

-- 

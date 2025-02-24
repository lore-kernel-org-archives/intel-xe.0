Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D6BC021BB
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 18:06:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4382C10E48F;
	Mon, 24 Feb 2025 18:06:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O2XbEZrN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ACAA10E48F
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 18:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740420398; x=1771956398;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hZY+no29XveApG5owqL6sluIYSU2ZI4KsvU19HC1Doo=;
 b=O2XbEZrNGrIn7hNKqVkqu6gT7uq9hW+Rr+b9jPwzsTa4cLisDfisDZYh
 oiRF2WywEXdDHmcJCzPcgEB6xKtER2sJTUOgyw4m4/G+MaxX3KPKozh5R
 6L7seKhN67DEr0+QdOEd9cUnsf+EvW0o5q++TWcRaI+ulkM6DUDSl5iLs
 7y/rtzdHI7O3gHufkah1PDL3xI/V39KrvQOJMS4gOFc7h2VKqx7Bwx8m1
 U8leBxiByiVChSYBso9pmyUVbueVYBpA3MzB11Zo6KUKaNUHQP9MhDGfn
 xxJb80XdyPyAkcKqIpD5+GOvsTYeXwGdKE8sgzA6134T27zXNS7LKLPtb Q==;
X-CSE-ConnectionGUID: xiMc5a2vT9q2MLH1tNK98Q==
X-CSE-MsgGUID: xS5Lv7UARze1EBJPa1nQ+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="41209934"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="41209934"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 10:06:32 -0800
X-CSE-ConnectionGUID: KnIZ0seWSpu8V/MdFPXwIQ==
X-CSE-MsgGUID: TqSXhUk0TtKJhoT/TcUcHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="146970859"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Feb 2025 10:06:31 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 24 Feb 2025 10:06:30 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 10:06:30 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 10:06:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QOqErFHMfFagQAv7K/JfGe7voC6rf0NJxFeIBUM2uKv1/x7MHrKXzC9EZMdYwkFeo5DnUVjR8HCQP2RzcL56tFt+0RAFtLxzHl7pyvurc0oOQEVyK6Tm7HcqtQr0phuH8CusWu/p90zGBKYU8HpeiBeYSg0jpDr+OTjkYb6D2PSDIF2EyIzCUXXKILjeYkPJvLs7bFAeRuZRA+DjueLmm1svyXacBvLZHtsrXbZ0kz1TJci8pU0feWllFHBruw9gojddhuR33kYNHQ8C2Y/IeZIckzOzaamqsL+jqo93yz9b2EwnLYxQQVSkTboH1Zob/nkzksKLcg33k4Z9pnWOcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5vm096Q/cTLRcsFfAb8d4zjEILyz0gS+Vj9D4/ElaqE=;
 b=e9iI5RUQvb6b6WiKpV9Qrxw4Li7ptT0XVeDBHFYWnIJbXPYT3Rl0D0AoA1rCsOLrFXf9Z765JKDQW7b6fPr6diVD4VeEN+LKII2sNG4tq8eNtiTSj1EXbTcyIK41X6NaNDW0EKhqUcJfERrbKgYU3JZ8U4jbpMIuEHPf8JdDGBs/erpwpDBsr8bxqDBBZUGbX19Z1w529KoFn2L6yJP8LbByfjg/Kq5lcN/j/nj0W4WjPXwOkuWW7UKimcya1zvAi4eNjUUYkHNMetUARDpXYmYCIerYh2VmIS/Kk/21o+DZKAM8ueQatGSWp+OqVwZBZo7HeLCzkR5Lo6SVSrSItQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by SJ2PR11MB8450.namprd11.prod.outlook.com (2603:10b6:a03:578::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Mon, 24 Feb
 2025 18:06:22 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%7]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 18:06:22 +0000
Date: Mon, 24 Feb 2025 10:06:20 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v10 4/8] drm/xe/eustall: Add support to read() and poll()
 EU stall data
Message-ID: <Z7y1HPYh_3KkgYr4@intel.com>
References: <cover.1739906138.git.harish.chegondi@intel.com>
 <c55e994b413f069b4ffb60cd30e749caf3bb7223.1739906138.git.harish.chegondi@intel.com>
 <85tt8pol5z.wl-ashutosh.dixit@intel.com>
 <Z7Y0V0ArAEaTerzj@intel.com>
 <85pljdnlnu.wl-ashutosh.dixit@intel.com>
 <85o6ywo0l9.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <85o6ywo0l9.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR03CA0386.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::31) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|SJ2PR11MB8450:EE_
X-MS-Office365-Filtering-Correlation-Id: 9576560c-92b4-4c75-f043-08dd54fdf1f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VDFBSlUwU1JHVHBzN0FvVTRFOUM1OVFxY1N3ZzFkeXh5VEtTTE5nK1cxZnp4?=
 =?utf-8?B?OE0vbWRkLzlWbmNIWEZteGZCZE1iaFQzbmxYUnNxK3ZVeitOWGhGVmVGRzgv?=
 =?utf-8?B?Q21xMWxlVGl0RHY0MXd3cUV5RlpaZ2JZOEhZeFVYd3NLWkZqZGZoYnhzclVD?=
 =?utf-8?B?U09QeUExN2QvaVBjZysyWnpRM1dPelZSZ0dCbFM0NVVQQ1F3TEkxNE9IQ2U0?=
 =?utf-8?B?eXFseDNJYTNERVM4TDVXZ0Q3L2VnYkFJMXdqSWJLditjd25ETy9ndE91RWZN?=
 =?utf-8?B?cmhsZ2drN3NrV2FXWGI4R3NrNXdpSHNHY3JJVXB0STUzM1cyRU5BSEQ4OTEr?=
 =?utf-8?B?VWtSWmUwWWRJSE1uMHppTWdUZmZhdHlPNUtNMEthbmNtVXM3V0pUV0Y3Q3JT?=
 =?utf-8?B?L0Nnc3d2bzU5OWxnMUs3SzFZUCtTaFlzNjh4QnJVcmdRejZXdUZ3NW5IaXZt?=
 =?utf-8?B?d0VyV3ovelFEbmJzTDQ2d1F3YmdaMFNOQmw2M2FROHFvcld0V211YTdwM2xG?=
 =?utf-8?B?QW1lbGdsVzZyRHN2MDhtcTVPWDhvd3k1MFdSdmhZOG5KSHRRbGJlZjZtUS9n?=
 =?utf-8?B?NHl1N2c1TzlxSTh2ZjcxTU1EZTFtUHpsRWxJVGtPSlBCMm5PeUx6UVR3bGZx?=
 =?utf-8?B?ZjU2OExqNlg0dklLMmdyNmtTblhUdWxNOExBUEh3YWV0RFV6UUZ1K0FCM01s?=
 =?utf-8?B?ZzNuZmFGZnlvTy9hQ1pqMWJjekJnNndvMTB6NEhydkNKRHZ0WWJZRCtRMjZS?=
 =?utf-8?B?RmJxV0VHMElqQUNUU0xHaldXSytndWFvcXlpd0xON0taMFlUMEltaklVNmJ2?=
 =?utf-8?B?N3piT1NxUWU1Wmh4Vy9VUW9OZXJhVitTV1RqLy9CdHN6SDBKM1IybnE3TnJK?=
 =?utf-8?B?dmlGNGxWSElCanlzZW1Qc0NzSjR4MTdhS2R0bXhoZjFsYUFES2t1U2N0d0ZM?=
 =?utf-8?B?T2xGeDBQZ3hvZWpNVVBUV1MwU2JsWDBoZXF5SHpzU1pTQTFHRC81RHNLQlQr?=
 =?utf-8?B?blJ4U1IweXBrQmpUeEd2SEllU3BmandRaFdDWEhTRlNoMi94K2dBOWVTVVF4?=
 =?utf-8?B?VWdMb0lRRHh3OTdLbFJUS2d3bE9IblhOYnkrQzREbFI1a0JNa0NlT3NuMVhB?=
 =?utf-8?B?VlZHVlV2S1pVV2c0eVRwZ0tUZ01XQjlCRHN1OC9jL25iY2R3UjBWR0xuTU9l?=
 =?utf-8?B?WFRvMkE2V01iR0tvRENMWnlZVDFuRVhWTmtJdW1VN0U3M04xWXJBaEdkbGZN?=
 =?utf-8?B?QVptTE0rVUQxVzg1ekJmVWpNdExSL0J5a240cmRzeENGMVAyNm14Z1FFTm5z?=
 =?utf-8?B?K2FxNEFlTUpaMyt1dnRLaFNkN2tpMW8yNXZzeEZ4d0EzUTFLOXJyZzR1eE8z?=
 =?utf-8?B?SUxTa1ZEQnZhUzBIbDRwZjFoY0Job3hVYkphckllZUowQUtzSmdoUVVuQzQ4?=
 =?utf-8?B?bU8vUHBoQk1Ha2Z2dWlDTEx4N2k1Um5rNU8yTFZpaWF5SkJJM2s1UzRLL05E?=
 =?utf-8?B?YWI1RVBOQWxuYlFjZlZ4MlBzdm4ySDR6WFozaXpjSUZRYkJCWkxObkNzc1pW?=
 =?utf-8?B?ZU9kcEc3YkF0WmV3Lys0b1EzaDd5TFMrTVRsM1lLZC9scmV2emVZQUsvQVhQ?=
 =?utf-8?B?ZlhmRURHQnkyU3F2Sjd5aFEzN2hPY0J1eGdRSXFhcTBFN2xOUGtUU2ExckJB?=
 =?utf-8?B?L1BhN3IrVW1XUzFiLzZGdnVBZkJHZCswUWQ4clc4VmZkcWtQME5nRmdET0hB?=
 =?utf-8?B?RlNDL3BhOWFoNWdSTDArWkVXRFpBVGQrSTBTa2V2dDZvYStrb2JHQTRGNWJG?=
 =?utf-8?B?VnNqT0s3bW5DanorT215OE8rMng4WW5IWXAvWDR2ZGJzSW4wVHVCOFo3Wnly?=
 =?utf-8?Q?J6TYYSESwIiyV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2JBUjY0Y1NNYklNY2V6UjZYZUJyOXpuVU03ZUlXRDlncFAvNElDbm43MXdF?=
 =?utf-8?B?VkhLYnVyR25BZENQRUlPOWMyd0dqbHQ3aDBKSUdac2N2MUZPOUpVRmh6M05z?=
 =?utf-8?B?Rk54S3hDeS9DMnNHZ0R3N2JHek9IR3VYeWVtV2dnOENWMFh2TmZZY3p5ZXRZ?=
 =?utf-8?B?T04zNWlxK0JhQVRVSnhzSTYyaHUrSmk3L0lLc0tRUjYzTTlJNlJOdk8vK1Ry?=
 =?utf-8?B?UEhYc0d2THhROUMzUjUyYkZGKzVlOWtSa0oxWk5pa0REVytEcnZWT0YwMzF5?=
 =?utf-8?B?M25qVC9UblpwWkhXYU5VN2lwR2dONGlmTzkvNElDa3diT1cxSXFNakhLZmpT?=
 =?utf-8?B?aklZZFdxTkh4SVNOQUpsOTRjTTJMaFk3b1BBakRqMlZvRHNnOTRRN3N0cVdl?=
 =?utf-8?B?Z25hd3hqYVVSejFBYUlXQVorbjlMeG5RZEhMRXgxa3dIWXBIVEZHL083WmQy?=
 =?utf-8?B?dE0xWDlBRWJaU2dwcnRrZHd5cjNTN00yWVN4N1luR1FYNGtoekFjcjl4OG9u?=
 =?utf-8?B?RFhuNFY2VTB3RkF6TW5RZmRNYlF6ZmZ5QXJjd2MrUWhZcWRTdkQrQTljZGhY?=
 =?utf-8?B?S0hWeE5sNnZ3MGhjNjVONU8yQVRjcnc5VkFHZDB0Y3BTT3hYMlhWKzQ3eStX?=
 =?utf-8?B?aXlvamxXU0x6aHYxTVVpVitqU3FkbEI2ak1jUzdncWppdXgrTGJNelgxdzE0?=
 =?utf-8?B?Qy9zb3ovOWV0emFxaVlQTW90UDVjdnRuQWdFSFJJRTBxd045NGVpVjFyT0My?=
 =?utf-8?B?UHRKK3h2OXl6T2lRaGx6K3l1UEpldkxjaVRPMG1iNXJzTzlxSnNpazA2SEJo?=
 =?utf-8?B?ZjlWbUZQL1c4U1cyM091b0lYYkpEdWpDYlVTK3BnYU1MbVh1TTRoZytIQUtK?=
 =?utf-8?B?TmxOVjlmQ0w1UzJyeEhPUVVpU0JEUlR4YTQyVitFV3BVZFVpL2tFYkxxdkJP?=
 =?utf-8?B?cUlIeWx0SFdYRzJGMWV1dFBPeHB6Zm1PNHM5TS9pV3BBMmNQVzlPS2oyQ1k2?=
 =?utf-8?B?eWZCeDlYQVVrcWxzMzNHYWNnTG9uRk82a3NsL2U0NnIzTkRyeEllR01mcU1B?=
 =?utf-8?B?QXNIVGN5UXVQOHBMNk1XR01maFI2M1FuN3VqWE5NL0QyLzEwczYxSHE2aEFC?=
 =?utf-8?B?WldIVDlwR2l3aHRwYVpVZ0l6OENtQlprV0hwelpPcXk4S3RpV1RrWXdGSE05?=
 =?utf-8?B?R1ZrZHdweEdWTFFrcjFwWWVrRUZKOXRoeUY4Z3NPeVdDUlp6aXhma2RsWjhU?=
 =?utf-8?B?SWVERVE2U0QrY0NPVFdrZWVZNDVzVlJIdFhYbzYyUHlKcE9raS95VkpQcUht?=
 =?utf-8?B?WnVSK1NYbE0zZEVPL0c1VitvOWJ5VjcvWmZDUEE3U3hqTGNFRlRKVnRPU0FT?=
 =?utf-8?B?bXpSajZYT2syWmx2TGg1UWJSajBGV1hEUEZFNmtOaEUzanZQeURoVWhWZW56?=
 =?utf-8?B?dmFNSGRhdnFqZHBadjBrejBOSC9GNEJWTGRSaFVKMlV1QWQxT1ZSWnFVeDVa?=
 =?utf-8?B?Y2FUSTdqNkRSTlJpV0xJUzIvYllRY3lJc2VWN284M0JRUzlTdmxtdXNwdDl0?=
 =?utf-8?B?dXB1MTJTTmdQSTFwMitzNlkwY2xKRDczSkZ0eFo0UUhIRnl3NytKSE96aG1x?=
 =?utf-8?B?QW9LaVVYbTZoaGF4LzA0OWYrTlh1eG1xeVNqakc0Ujl2WFM1VWx6ZGMyRHlM?=
 =?utf-8?B?YU1wZHBCSklDbytYWXM3VWpETnJ0Z04zWDQ2TDNWUGswNWZQZUxYWDNrbFVp?=
 =?utf-8?B?V3JzckZ6VkVvbndvWjNwbW9HeERFTXVUbTkzYjluSGJUM2c5MXZuRVh0TmRC?=
 =?utf-8?B?NC9sOUFReTlZNnhFSlRFc080REJmaFRoQU1UN0J4eGlSSG9UeU4xOUppS1pH?=
 =?utf-8?B?b3ZCUndGOTBqOWRCSkczS3FRSzdqOElwVUo1bElJT0hrdENDWGNNOXJSNi9j?=
 =?utf-8?B?dXFOcXZoVHpJN1RtLzVFS3lOQWdHYzJNWlI0VXNaL0xTajRiNGRlVVN6dXd1?=
 =?utf-8?B?cGJvbUxsVmo1M28wbDRNR1ZUYkgwbWxpbzZlVDAwa1dqTDJDdHVVWExGd09j?=
 =?utf-8?B?N2pGVkJFeE92SWxLUFd3QnkwVDRFOWVFa09YVW9UdERFSWxOSENkZkh0UFVa?=
 =?utf-8?B?SkJ2ZVRSWDdDVmV5VVZlUmoxQ1pBVklra3Zkc1Ntd0hxa01uWmtHOHhTRCt1?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9576560c-92b4-4c75-f043-08dd54fdf1f7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 18:06:22.1539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IfEnV6vKR/LqCYMMb7r1IgZmSQeBst0h+70RLEHYLDao6D7zuWASzJQS0zuf/rmqs+qL5zyyzlQKD2CZtm6raiW0V+5616/Ce+xxEzkwgWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8450
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

On Thu, Feb 20, 2025 at 11:52:34AM -0800, Dixit, Ashutosh wrote:
Hi Ashutosh,


> On Wed, 19 Feb 2025 23:02:45 -0800, Dixit, Ashutosh wrote:
> >
> > On Wed, 19 Feb 2025 11:43:19 -0800, Harish Chegondi wrote:
> > >
> >
> > Hi Harish,
> >
> > > On Wed, Feb 19, 2025 at 10:15:52AM -0800, Dixit, Ashutosh wrote:
> > > Hi Ashutosh,
> > >
> > > > On Tue, 18 Feb 2025 11:53:54 -0800, Harish Chegondi wrote:
> > > > >
> > > > > @@ -39,7 +40,9 @@ struct per_xecore_buf {
> > > > >  };
> > > > >
> > > > >  struct xe_eu_stall_data_stream {
> > > > > +	bool pollin;
> > > > >	bool enabled;
> > > > > +	wait_queue_head_t poll_wq;
> > > > >	size_t data_record_size;
> > > > >	size_t per_xecore_buf_size;
> > > > >	unsigned int wait_num_reports;
> > > > > @@ -47,7 +50,11 @@ struct xe_eu_stall_data_stream {
> > > > >
> > > > >	struct xe_gt *gt;
> > > > >	struct xe_bo *bo;
> > > > > +	/* Lock to protect xecore_buf */
> > > > > +	struct mutex buf_lock;
> > > >
> > > > Why do we need this new lock? I thought we would just be able to use
> > > > gt->eu_stall->stream_lock? stream_lock is already taken for read(), so we
> > > > just need to take it for eu_stall_data_buf_poll()?
> > >
> > > I started off with using the gt->eu_stall->stream_lock. But I have seen
> > > warnings in the dmesg log while testing indicating possible circular
> > > locking dependency leading to a deadlock. Maybe I can spend more time
> > > later to investigate further and eliminate the possible circular locking
> > > dependency. But for now, I decided to use a new lock to eliminate the
> > > per subslice lock. Here is the dmesg log that I saved from my testing to
> > > investigate later.
> > >
> > > [17606.848776] ======================================================
> > > [17606.848781] WARNING: possible circular locking dependency detected
> > > [17606.848786] 6.13.0-upstream #3 Not tainted
> > > [17606.848791] ------------------------------------------------------
> > > [17606.848796] xe_eu_stall/21899 is trying to acquire lock:
> > > [17606.848801] ffff88810daad948 ((wq_completion)xe_eu_stall){+.+.}-{0:0}, at: touch_wq_lockdep_map+0x21/0x80
> > > [17606.848822]
> > >                but task is already holding lock:
> > > [17606.848827] ffff88810d0786a8 (&gt->eu_stall->stream_lock){+.+.}-{4:4}, at: xe_eu_stall_stream_close+0x27/0x70 [xe]
> > > [17606.848903]
> > >                which lock already depends on the new lock.
> > >
> > > [17606.848909]
> > >                the existing dependency chain (in reverse order) is:
> > > [17606.848915]
> > >                -> #2 (&gt->eu_stall->stream_lock){+.+.}-{4:4}:
> > > [17606.848915]
> > >                -> #2 (&gt->eu_stall->stream_lock){+.+.}-{4:4}:
> > > [17606.848925]        __mutex_lock+0xb4/0xeb0
> > > [17606.848934]        eu_stall_data_buf_poll+0x42/0x180 [xe]
> > > [17606.848989]        eu_stall_data_buf_poll_work_fn+0x15/0x60 [xe]
> > > [17606.849042]        process_one_work+0x207/0x640
> > > [17606.849051]        worker_thread+0x18c/0x330
> > > [17606.849058]        kthread+0xeb/0x120
> > > [17606.849065]        ret_from_fork+0x2c/0x50
> > > [17606.849073]        ret_from_fork_asm+0x1a/0x30
> > > [17606.849081]
> > >                -> #1 ((work_completion)(&(&stream->buf_poll_work)->work)){+.+.}-{0:0}:
> > > [17606.849092]        process_one_work+0x1e3/0x640
> > > [17606.849100]        worker_thread+0x18c/0x330
> > > [17606.849107]        kthread+0xeb/0x120
> > > [17606.849113]        ret_from_fork+0x2c/0x50
> > > [17606.849120]        ret_from_fork_asm+0x1a/0x30
> > > [17606.849126]
> > >                -> #0 ((wq_completion)xe_eu_stall){+.+.}-{0:0}:
> > > [17606.849134]        __lock_acquire+0x167c/0x27d0
> > > [17606.849141]        lock_acquire+0xd5/0x300
> > > [17606.849148]        touch_wq_lockdep_map+0x36/0x80
> > > [17606.849155]        __flush_workqueue+0x7e/0x4a0
> > > [17606.849163]        drain_workqueue+0x92/0x130
> > > [17606.849170]        destroy_workqueue+0x55/0x380
> > > [17606.849177]        xe_eu_stall_data_buf_destroy+0x11/0x50 [xe]
> > > [17606.849220]        xe_eu_stall_stream_close+0x37/0x70 [xe]
> > > [17606.849259]        __fput+0xed/0x2b0
> > > [17606.849264]        __x64_sys_close+0x37/0x80
> > > [17606.849271]        do_syscall_64+0x68/0x140
> > > [17606.849276]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > > [17606.849286]
> > >                other info that might help us debug this:
> > >
> > > [17606.849294] Chain exists of:
> > >                  (wq_completion)xe_eu_stall --> (work_completion)(&(&stream->buf_poll_work)->work) --> &gt->eu_stall->stream_lock
> > >
> > > [17606.849312]  Possible unsafe locking scenario:
> > >
> > > [17606.849318]        CPU0                    CPU1
> > > [17606.849323]        ----                    ----
> > > [17606.849328]   lock(&gt->eu_stall->stream_lock);
> > > [17606.849334]                                lock((work_completion)(&(&stream->buf_poll_work)->work));
> > > [17606.849344]                                lock(&gt->eu_stall->stream_lock);
> > > [17606.849352]   lock((wq_completion)xe_eu_stall);
> > > [17606.849359]
> > >                 *** DEADLOCK ***
> > >
> > > [17606.849365] 1 lock held by xe_eu_stall/21899:
> > > [17606.849371]  #0: ffff88810d0786a8 (&gt->eu_stall->stream_lock){+.+.}-{4:4}, at: xe_eu_stall_stream_close+0x27/0x70 [xe]
> > > [17606.849430]
> > >                stack backtrace:
> > > [17606.849435] CPU: 3 UID: 0 PID: 21899 Comm: xe_eu_stall Not tainted 6.13.0-upstream #3
> > > [17606.849445] Hardware name: Intel Corporation Lunar Lake Client Platform/LNL-M LP5 RVP1, BIOS LNLMFWI1.R00.3220.D89.2407012051 07/01/2024
> > > [17606.849457] Call Trace:
> > > [17606.849461]  <TASK>
> > > [17606.849465]  dump_stack_lvl+0x82/0xd0
> > > [17606.849473]  print_circular_bug+0x2d2/0x410
> > > [17606.849473]  print_circular_bug+0x2d2/0x410
> > > [17606.849482]  check_noncircular+0x15d/0x180
> > > [17606.849492]  __lock_acquire+0x167c/0x27d0
> > > [17606.849500]  lock_acquire+0xd5/0x300
> > > [17606.849507]  ? touch_wq_lockdep_map+0x21/0x80
> > > [17606.849515]  ? lockdep_init_map_type+0x4b/0x260
> > > [17606.849522]  ? touch_wq_lockdep_map+0x21/0x80
> > > [17606.849529]  touch_wq_lockdep_map+0x36/0x80
> > > [17606.849536]  ? touch_wq_lockdep_map+0x21/0x80
> > > [17606.849544]  __flush_workqueue+0x7e/0x4a0
> > > [17606.849551]  ? find_held_lock+0x2b/0x80
> > > [17606.849561]  drain_workqueue+0x92/0x130
> > > [17606.849569]  destroy_workqueue+0x55/0x380
> > > [17606.849577]  xe_eu_stall_data_buf_destroy+0x11/0x50 [xe]
> > > [17606.849627]  xe_eu_stall_stream_close+0x37/0x70 [xe]
> > > [17606.849678]  __fput+0xed/0x2b0
> > > [17606.849683]  __x64_sys_close+0x37/0x80
> > > [17606.849691]  do_syscall_64+0x68/0x140
> > > [17606.849698]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > > [17606.849706] RIP: 0033:0x7fdc81b14f67
> > > [17606.849712] Code: ff e8 0d 16 02 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 03 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 41 c3 48 83 ec 18 89 7c 24 0c e8 73 ba f7 ff
> > > [17606.849728] RSP: 002b:00007fffd2bd7e58 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
> > > [17606.849738] RAX: ffffffffffffffda RBX: 0000559f7fa08100 RCX: 00007fdc81b14f67
> > > [17606.849746] RDX: 0000000000000000 RSI: 0000000000006901 RDI: 0000000000000004
> > > [17606.849754] RBP: 00007fdc7d40bc90 R08: 0000000000000000 R09: 000000007fffffff
> > > [17606.849762] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> > > [17606.849770] R13: 0000000000000000 R14: 0000000000000001 R15: 0000000000000000
> > > [17606.849783]  </TASK>
> >
> > Could you try out this change in your patch (also just use
> > gt->eu_stall->stream_lock, not stream->buf_lock) and see if it resolves
> > this issue:
> >
> >	@@ -573,7 +573,6 @@ static void xe_eu_stall_stream_free(struct xe_eu_stall_data_stream *stream)
> >
> >	 static void xe_eu_stall_data_buf_destroy(struct xe_eu_stall_data_stream *stream)
> >	 {
> >	-       destroy_workqueue(stream->buf_poll_wq);
> >		xe_bo_unpin_map_no_vm(stream->bo);
> >		kfree(stream->xecore_buf);
> >	 }
> >	@@ -829,6 +828,8 @@ static int xe_eu_stall_stream_close(struct inode *inode, struct file *file)
> >		xe_eu_stall_stream_free(stream);
> >		mutex_unlock(&gt->eu_stall->stream_lock);
> >
> >	+       destroy_workqueue(stream->buf_poll_wq);
> >	+
> >		return 0;
> >	 }
> >
> > Basically move destroy_workqueue outside gt->eu_stall->stream_lock.
> >
> > I will look more into this. But from the above trace it looks like the
> > issue of lock order between two locks in different code paths. The two
> > locks are stream_lock and something let's call wq_lock (associated with the
> > workqueue or the work item).
> >
> > So this is what we see about the order of these two locks in these
> > instances in the code (assuming we are only using stream_lock):
> >
> > 1. eu_stall_data_buf_poll_work_fn: wq_lock is taken first followed by
> >    stream_lock inside eu_stall_data_buf_poll.
> >
> > 2. xe_eu_stall_disable_locked: stream_lock is taken first followed by
> >    wq_lock when we do cancel_delayed_work_sync (if at all)
> >
> > 3. xe_eu_stall_stream_close: stream_lock is taken first followed by wq_lock
> >    when we do destroy_workqueue.
> >
> > So looks like lockdep is complaining about the lock order reversal between
> > 1. and 3. above. I am not sure if the order reversal between 1. and 2. is a
> > problem or not (if lockdep complains about this or not). If it is, we could
> > try moving cancel_delayed_work_sync also outside stream_lock. But we
> > haven't seen a trace for the second case yet.
> >
> > So anyway, the first thing to try is the patch above and see if it fixes
> > this issue.
> >
> > Another idea would be to move buf_poll_wq into gt->eu_stall (rather than
> > the stream), so it does not have to be destroyed when the stream fd is
> > closed.
> 
> So I decided to do a quick POC to see if my suggestion above to get rid of
> the circular locking dependency worked. And basically it does, with the
> patch below (we have to ensure stream doesn't get freed and I haven't
> deleted buf_lock), but you will get the idea. I reproduced the issue with
> your kernel patches and IGT and made sure the patch below fixes it. So
> buf_lock is not needed.
> 
> So with the patch below the circular locking dependency is gone. So let's
> go with something like this, if you agree:
> 
> diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> index b94585bdf91c6..a3fc424b36665 100644
> --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> @@ -365,7 +365,7 @@ static bool eu_stall_data_buf_poll(struct xe_eu_stall_data_stream *stream)
>  	u16 group, instance;
>  	unsigned int xecore;
>  
> -	mutex_lock(&stream->buf_lock);
> +	mutex_lock(&gt->eu_stall->stream_lock);
>  	for_each_dss_steering(xecore, gt, group, instance) {
>  		xecore_buf = &stream->xecore_buf[xecore];
>  		read_ptr = xecore_buf->read;
> @@ -383,7 +383,7 @@ static bool eu_stall_data_buf_poll(struct xe_eu_stall_data_stream *stream)
>  			set_bit(xecore, stream->data_drop.mask);
>  		xecore_buf->write = write_ptr;
>  	}
> -	mutex_unlock(&stream->buf_lock);
> +	mutex_unlock(&gt->eu_stall->stream_lock);
>  
>  	return min_data_present;
>  }
> @@ -503,14 +503,12 @@ static ssize_t xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *st
>  		stream->data_drop.reported_to_user = false;
>  	}
>  
> -	mutex_lock(&stream->buf_lock);
>  	for_each_dss_steering(xecore, gt, group, instance) {
>  		ret = xe_eu_stall_data_buf_read(stream, buf, count, &total_size,
>  						gt, group, instance, xecore);
>  		if (ret || count == total_size)
>  			break;
>  	}
> -	mutex_unlock(&stream->buf_lock);
>  	return total_size ?: (ret ?: -EAGAIN);
>  }
>  
> @@ -573,7 +571,6 @@ static void xe_eu_stall_stream_free(struct xe_eu_stall_data_stream *stream)
>  
>  static void xe_eu_stall_data_buf_destroy(struct xe_eu_stall_data_stream *stream)
>  {
> -	destroy_workqueue(stream->buf_poll_wq);
>  	xe_bo_unpin_map_no_vm(stream->bo);
>  	kfree(stream->xecore_buf);
>  }
> @@ -826,9 +823,12 @@ static int xe_eu_stall_stream_close(struct inode *inode, struct file *file)
>  	mutex_lock(&gt->eu_stall->stream_lock);
>  	xe_eu_stall_disable_locked(stream);
>  	xe_eu_stall_data_buf_destroy(stream);
> -	xe_eu_stall_stream_free(stream);
> +	gt->eu_stall->stream = NULL;
>  	mutex_unlock(&gt->eu_stall->stream_lock);
>  
> +	destroy_workqueue(stream->buf_poll_wq);
> +	kfree(stream);
> +
>  	return 0;
>  }
I tried your suggestions and I don't see the circular locking dependency
messages anymore.

Thank You
Harish.

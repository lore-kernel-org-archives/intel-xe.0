Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920AFCF3188
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 22:08:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41AC710E10D;
	Tue,  1 Oct 2024 22:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="adqHIO0c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D9410E10D
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 22:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727820489; x=1759356489;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xtNx2UU3KkImUG0V63VjkrTTlRwdQTzl0sBuTu2Nq3w=;
 b=adqHIO0cXqYDHDsMlfFYAgZuskfSC3SqayzHKc/+ZxeoIpTJj2OIuMa7
 gZvPqe9+5bJuuHOiJ85Zwsy9Stx72G5LVT5xYNBuIpVV7cgOFLIAZMILZ
 vgvJATwPbeU0DkCEOJtnoUnujf+jPyO/VsN6uNgFWhGw1soXhS8SQBlPV
 lLgFJuHNcRUSGxQ9JAqaHTc1/n5qQzyRB2pq5pvWC2xk43YnYT28+Bsej
 EHsPbU7hdt6/IsF57cr3YHGKIs7F6oneizSJ8d/FEVNx0B+mIZyMBzi9Y
 DO6fyqInO7zKcA3GIS5mooJA5cu28ChmokvJndofBShhKlR57dECbw+UO g==;
X-CSE-ConnectionGUID: 2dQ5KlzhQOmUsKMarURo6g==
X-CSE-MsgGUID: ONlqJrUdTAaqzoG5+1zRiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="38109790"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; d="scan'208";a="38109790"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 15:08:08 -0700
X-CSE-ConnectionGUID: 5fDspMvSQ+GnPDi0x0RxCw==
X-CSE-MsgGUID: /Z1HL7CVQHaDT37RDJ0KMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; d="scan'208";a="104626578"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Oct 2024 15:08:09 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 1 Oct 2024 15:08:07 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 1 Oct 2024 15:08:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 1 Oct 2024 15:08:07 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 1 Oct 2024 15:08:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ul77ogNUNWKuyVchzuUyU+jL1pqam7ZI8aeRGx1GS4fE2U5Ru/pVDi3qnKSzzjfKw9inZwB++eI9MvG9Ytq9OpljFfjkBicg83QHaSBtDNIfkvaL2koX/zUEbUwntdn8GGmeqGlJ5IW/UpNpyUimO6waqR3uU76mNycFgz8KFgwGH4w0sSH4/J2IEBgPe/hLf6w9Y4Uw7nKw6J9UaaDo0djdoQprXlvII4dr0bEUW+NcGy1kigPxtCuvplNoegcB7e6uhxGWdO9qN2x7LPg8fmc5ulzUkVkYzNgdBb3Sk+js1AnXG0uhH5/EeuVlmor/eijycx5WgtKozIQ7mDh6Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y1emoLuGTJCU/DPKB1iO6rW8vG7gM4It2oAl5CygVOA=;
 b=xjppo96zAIsQEm3FIEMhq+KnMrkXQJ3F6p7OnL/s4OHVR5dr/PsKsh4+J/zgpV92gRt7/Qx0Ux97MsGoNC7J13I0tbHVWEb9JE93PUbNV50gR/sIJ8MEjCTHIm3VCw5x8mNH/18UrZwHdk9KmJOUNQ7Pq2InAyOus8FLli+FUaq+4NA3QBpMnxdahVuHHXj1ZGepRZVF8XGqH396I1U7cj+HElqMmkGhp1jXJ82yAGgHwVd3zE58usL+botOs7tFN7q/TeS5fPq7RIjaU9l7pEFxRvzw4QBWN2Gq8bsxh4jlSj61XH1jOyM9ECDeY5Iw01cNL1HjeLYqO69W3Cbv9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SA0PR11MB7158.namprd11.prod.outlook.com (2603:10b6:806:24b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Tue, 1 Oct
 2024 22:08:05 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%7]) with mapi id 15.20.8005.024; Tue, 1 Oct 2024
 22:08:05 +0000
Message-ID: <ca2fd5ca-168e-48e5-97e0-0a0830b2e404@intel.com>
Date: Tue, 1 Oct 2024 15:08:03 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/pmu: Enable PMU interface
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Aravind Iddamsetty
 <aravind.iddamsetty@linux.intel.com>, Bommu Krishnaiah
 <krishnaiah.bommu@intel.com>, Riana Tauro <riana.tauro@intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>
References: <20240927002344.2565250-1-vinay.belgaumkar@intel.com>
 <20240927002344.2565250-2-vinay.belgaumkar@intel.com>
 <suyim7ey3uldherzlnfm37uaqdcrekmub2w3nff34q45ju7g2z@dxhshdswhsj3>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <suyim7ey3uldherzlnfm37uaqdcrekmub2w3nff34q45ju7g2z@dxhshdswhsj3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::39) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SA0PR11MB7158:EE_
X-MS-Office365-Filtering-Correlation-Id: 5538f67f-5d4d-434b-0c0f-08dce265864a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFJJUE1LVlc3eDNmMHNLUnhEMWhhdFhoU2RYenM4a2pPc2lIbnlPL2NiUGRv?=
 =?utf-8?B?VUtkblRoaTVDVmR1Ylk2R3dXTmQ5VzgzZG1FcmxHMjFJam1qeXBZMmFqSXhH?=
 =?utf-8?B?d2FmdlZubGxFZG5pQVZoWFYrZVRMdGhFeGUrSWRrYzdYc25mUlI4aTRZZVBH?=
 =?utf-8?B?VEt2ZHo4NmdUNGJwb2hlUnMxeHVnbTNEN3EyRUIrb1h1Q2xvNFZzcURrTUkx?=
 =?utf-8?B?a1ozbTYxK2RCZk1MamZ1UU1wK05sNzZvTzdCdHJENU9ESmRqVVBsU2tUUHcv?=
 =?utf-8?B?S2NGMGlnaG9NWnNGYWMzM0k5dkhlbTFkWVlXSi9Bbmo1eFltMko1aElkK0lU?=
 =?utf-8?B?TnpTZ1Y1YjEwK0p2bVk1WGVSZC9FTmIyYzNsd2JtaUpTcWN4aVNGckJXM1J0?=
 =?utf-8?B?eVllSm84R3ZhNzBzQWwxanZ3dFJqQnloNHJhNFUvQnhGSFlydUNHQy9PcjNY?=
 =?utf-8?B?NmxBWWlRUEd5TG9ySS9EelFEZ2h0YVo2NTBwSmxKTjB5bkIyUnlOb1RwWVBn?=
 =?utf-8?B?b0NLTUNPQVBic1NIbWExMXFjRmljUTNOQnhiQ3E0WTdMY3hQUkQzSUdKb0lD?=
 =?utf-8?B?ODBGMDkwcTd6ZzViV3VKNW02NVNlbVp2TDgyZkV0U1RLeEZGWjMrZS9hRStG?=
 =?utf-8?B?NzFQalpPaU51WmN3azRlenZDOWdibGxsYWRvOFpoRjNWY2VOTzROQUVRcWk0?=
 =?utf-8?B?TmMwODg0bzlTaEdHOGgrSGZqOXZvM28rb1F6Rk5vU1pBbStWNFBXTWVXaHZQ?=
 =?utf-8?B?S2ladzFOQ1h5VEZLZlRuVlplaU9NRXFKNlN5ZFlSdHBicFhxT1JnNG5WOWph?=
 =?utf-8?B?bXdnUzZJRTlMcVkvR1FuUGZnQklpOXV6VFN0RXdqQmt0NmkwblcxSXpHTlJD?=
 =?utf-8?B?SmxvblBlUmhJd2pFK3dOc3B3NlRnVDRiOGhNZFZSY1dZUzJodDFDVFRJWnRI?=
 =?utf-8?B?SWZWSmU1RytiVEdxNGNPUmViRHNPSXJHK3AwNXhqb2hQTFl1V1VQZ2JPelcw?=
 =?utf-8?B?bnBjRDUyb3pFVHZyMGNwalN5TEc2RFpDU2VCd3V2NHI0cjFvN01lL00zUWhv?=
 =?utf-8?B?K1dOdktOMWJSOVBkdVlDZjNwZ1dmL1RHWnBZY09CZ2ZEd2Q4bTFuaHBHNll1?=
 =?utf-8?B?Zkc5dE1WcnlIL0tXSGhqblFkdmN2SUMxcUNlVmdDTU1hRTZONlB3UG9FSklm?=
 =?utf-8?B?alUxTW41cSthRnZzUW9RdmxEbnVUamJyUzlKZlZTVU9UdXcwR0RHdHU2YzJ1?=
 =?utf-8?B?R2k1RTY1Rm83aDFORkFFWTNqR2Y3WTlNK0pNbysvQlFIb1hLNTZENHhjUnpW?=
 =?utf-8?B?SGJtaVRYdmVOSzNlYmFlWE5NY1ZqZ1Q3cHVwajlBeUZ5S0xNamg5MWtxams5?=
 =?utf-8?B?UmZaVGp0M1ZmaWpOQnBhbkh4em9sZlNZRnVtWmpLNTY4NWMwMm0vN1V6RnFH?=
 =?utf-8?B?NGNBRTlLRDN3SU9uRjIwS0VXcFoxWCsyVHIzVWl5OEQ1S3hxT3BIblJjaTlx?=
 =?utf-8?B?OWRFeVZSNG8vU1dtNE90SThkTUhwN3FGSTdYSEkycWVKRU1GTi9PZ094UkZ0?=
 =?utf-8?B?cnpDSlZuODB2S1ZEYWFhMVdQbm41aGt1aGM0cjdlTTBPSTI3M0FLZ01XejhP?=
 =?utf-8?B?OTdFSGl0M2FXQkUrS1JjK1VSb2M5TXdZS2RQY3RnTUJFQWNOMENpWVZIU3VO?=
 =?utf-8?B?cEZSdm5GZ0x2eVQzZUI1bGlOZVNDdWFUeVpES0xBY1FKMHBSU0RrMW1GbXFD?=
 =?utf-8?B?KzY5eXM1eVErMm9Gbk9WNnRlN1lWbVZFK2VLcndVRTM4dTl6aHNHK3ZpbEE1?=
 =?utf-8?Q?QZUAGEyrbJ0aXd97SrvwwtgU5R1+vFsV3nKf4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFREdWVEUHVTVXkvRGRrSmZHcEpVb0tQMHJxMklwK1gxVWxlSnFwVHpJTXRh?=
 =?utf-8?B?T3lGaWxyanJNL3JtS1lFWGhHRFBjZjFHQWMwaWkycjVHcnZ1aHBIMGJ6ckdl?=
 =?utf-8?B?MkZtZDJINkdJcXV6dVNHeXdwaTZhVVJsY2RIL0FkY2JLUlV6cUhjZkhoNFFC?=
 =?utf-8?B?MWQvZ3g3Q2xuVlpvMXVsUzhmTHNxanNxSDVBdDdEMWIrdVF0a0FUZ3ZOT25Q?=
 =?utf-8?B?NWp1T3Q0RnI5QWQyUmx4UmtvUXYyd1lFbEljRGMwbmdFMEozL1R5VEVJWVNh?=
 =?utf-8?B?ZG5qd09XY1puZC9oWlo2TzEvVWQxcE1CTVpJUXJCbnlud0kzeWJBYk5UZlBl?=
 =?utf-8?B?bEFVTllFRzVNYVIvbVN6NXl0bmFDdlp0WlV5OWMxWkhISklnaS9hNXd1UXlB?=
 =?utf-8?B?SXhtK0oxZFNJUlRSRHJKR0NZWnI0U2M0T29Id0w0OGlUTFovUXlnWHBsUFg1?=
 =?utf-8?B?dWIwcVBWNm03NTREeXhSZjNiVWwvTHZTYnpvby9mVG9jaURzYUpEU0R2T3Ur?=
 =?utf-8?B?VFBIdnZITkMzVmd6SlU5OXNTek1wYS84VGRoTDlSemdSd2ZJZFN1UDM2RGZJ?=
 =?utf-8?B?bm5XY2JmQ1QwalliV1k4L1M3bSt4ZnQ1N3BteGlUVDBycFJiM2RNSmxNZ3Ru?=
 =?utf-8?B?c0w3Wk40b1lPc0R0UHlNTkozOEFJSGR3UlllT3NJK2loNlNzTkNrNU94K0Iv?=
 =?utf-8?B?b3JReDJVMHRETFNtUmVDVEY2clYzRFlkQTlVV3MxQ2V0V3Jld3NnUXFnZGw3?=
 =?utf-8?B?c00wUksvRGNiYWg0bDdIdlBSdCs1THFmRi91a2VWL24vNldzUER0Rmt6bzlR?=
 =?utf-8?B?VU8ya1V0bHlCRXErTXBHcThuUWphTkN2T3EvbENORzFmRHJlUWlJNUlPTTZz?=
 =?utf-8?B?bzYyYnM5M05heFJPVDFJMEJHK09vUThsSFljUGRxQlgyWmdKWFFiKzEvTGd4?=
 =?utf-8?B?NDBHVjhTNVk4ZHYxUnhWUlJzVEh0dXNHc1BSMTdEbXpFeFpzZHZ1Q21uWVU0?=
 =?utf-8?B?d1lFaVJMTHdBQVF2b3cwVG1KQU4xZzVRc0R1OCsvYzRvQTJNbFJpMmsrYlNW?=
 =?utf-8?B?cHNkRjViNHBIRGZJNGlyQmxxUjhHT3lMNmlMYkNKcElFSzg1N1BmNW1Bb3BO?=
 =?utf-8?B?OXl2NnRxbU1XbUlQVDk3U3FES3lsdUJRMUpRb3kxdGZQTUtUWHNhZW9vYU1W?=
 =?utf-8?B?cDdvbS9BQ0VkM0xPdlRldi9GQ1ZoRTFIc09iV3ppSDZrTVFycmQ0WkxzYlRt?=
 =?utf-8?B?UExsSTBEeHhESFBKK3YxbU93THV4SGtEUFVRU0lxV2dQc0l2YTNLVU9NQm5M?=
 =?utf-8?B?ZjgzWXd5NE41VkFSRk13Q1JWY05MQ0l6dnA5Ulowb2tyK04vR1pZYkhQQWFW?=
 =?utf-8?B?RlFJMEdBK2plUnJFV1J1R2VuUGJHRit6N2l2ODExbzRsZmc3MFFXSmRaWjdM?=
 =?utf-8?B?ZndWdTI3NzVtakIvWXVEN0FBTVRYUDVUK1pCYnBiM2hiZTNhQmJrdmdOODIw?=
 =?utf-8?B?Y2FUNlZacE1kS0NXUDBIOVpDR0lUWklMemFWMWhzWlR5eHA5ZDVUWGVmMmhm?=
 =?utf-8?B?U2dSbU1iV2pBbmtSY3pTdEJpOVpGakp5aEw3N3dST1huRlpIcjlyK3NBYmR6?=
 =?utf-8?B?NmNaYkRJeEM4VkRNMGFSN1V3ZTVEV3laQjcyKzdKZ0l2NndXcG5QaTNFSFRU?=
 =?utf-8?B?WTk3TzBlb0FQWkk0NkprdUlPdkdtUTUraXNRcW5TQ0p5KzdNcUt0ZHc0RnFT?=
 =?utf-8?B?UWRWZ2ZBVmdHMG5Ka3VMOXprQ0FHMkE1bGRyZUFsKzhSUlY1UThSMmorL3Js?=
 =?utf-8?B?cFQ0UWZzUkFVTlUrbWZabXRhSHJqd2xJTDJPdWxvYkdCaUVnTFpsWTJIcTRT?=
 =?utf-8?B?ejhzOEdhelNUYS9IcC9jN3Fxanh2U1hLNWI3aU1lbFFoWHNMWGo3RkRYY2RL?=
 =?utf-8?B?RnE5cWZFQzN3NnRBdWtHYWRpVU5lUUYycStzcmE5ajMxT3pJNTUrTVNBRWdR?=
 =?utf-8?B?NStGUzlEL0w5MkY1Q1BUYUorb1o2MW9OWWk2eXZzajMxZDJrcHBkcjV1SUNB?=
 =?utf-8?B?T1o0Y2lxZW01cklxRFBvWmlVRFZ1b01xTEFmZERaYlh3WllTM25BeVVJeTVM?=
 =?utf-8?B?anp1Y3hBc08ydS9uV2d4VVAvZlplbkhlTjNJWHZzSEI3ZFRvY1o3aE9raVl4?=
 =?utf-8?B?a1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5538f67f-5d4d-434b-0c0f-08dce265864a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 22:08:05.3841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UHD1SzLVZn113vKnmMtBTW83bgGkOw0jQ7l80pSEuDXKANpZ087+Jcg7q2de5g0hmSYYqHhrKx36mawKYrvnJcQn3EmW+Sph5ZoSj/tonkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7158
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


On 10/1/2024 2:32 PM, Lucas De Marchi wrote:
> On Thu, Sep 26, 2024 at 05:23:42PM GMT, Vinay Belgaumkar wrote:
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index b6fbe4988f2e..2c5f258eee3a 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -1389,6 +1389,14 @@ struct drm_xe_wait_user_fence {
>>     __u64 reserved[2];
>> };
>>
>> +/*
>> + * Top bits of every counter are GT id.
>> + */
>> +#define __XE_PMU_GT_SHIFT (56)
>> +
>> +#define ___XE_PMU_OTHER(gt, x) \
>> +    (((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>> +
>
> why are you touching this?
>
> I thought we agreed it's not needed at all on previous version of this
> patch: 
> https://lore.kernel.org/intel-xe/602bffcd-d66f-4b49-b3b4-abb934b00f3a@intel.com/
>
> what changed?

IGT tests like perf_pmu use this interface to open specific PMU files, 
for example-

                 fd[pmus] = perf_i915_open_group(gem_fd,
__I915_PMU_RC6_RESIDENCY(gt_),
                                                 fd[0]);
If we define these inside non-header files, these kinds of tests and any 
other user programs that may be doing this, will need to look at kernel 
code to determine the PMU config? I assumed we needed these bare minimum 
header definitions.

Thanks,

Vinay.

>
>
> Lucas De Marchi

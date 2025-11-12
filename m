Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C39ECCF9F8
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 04:15:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1C310E18E;
	Wed, 12 Nov 2025 04:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nkzwhgzX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A526910E18E
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Nov 2025 04:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762920927; x=1794456927;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+oFmnATQPCid7Da8dshYx1H2c5E3tXGmBE/6OfIKI4o=;
 b=nkzwhgzXdM93DovaLdVprxhu79c2WaRdGGTtUGOU6i/1XXEtui+7vE25
 +xLaLWT2f++1mAUHLKTiW3R+6wsBFKSrEufdYG9O8x/ZLQPanryUZMqMt
 eyVyu/MMWvNUKRfhVXgBwCYMdvCWMDeXQTeztoK5RUM0cjl7IzIQahn8b
 J1WfbbjYXYCtAoWY2o8/7FxbA95pAE7dB23EG94NkAFk6cw5FJ22IV4Ke
 6a9qUunmkkXVN/Uv26d9QDK+YgUu7EQo2H6K6X2ttoBBRzdVdIQUdM+mm
 1NYU9F+CAebhk627V+gKatibec1nodXHIk8DEdKY0DVd99Asw0PJnmv/d w==;
X-CSE-ConnectionGUID: U33j6aT+TziNWVylgpYg9Q==
X-CSE-MsgGUID: jl3xdAW9T/649I0eENPB1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64913408"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64913408"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 20:15:26 -0800
X-CSE-ConnectionGUID: TRbosufwSC63MxyaGaGWLg==
X-CSE-MsgGUID: 4yELLBnNRKSdUhj2pS70Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; d="scan'208";a="189083127"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 20:15:26 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 20:15:26 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 11 Nov 2025 20:15:26 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.22) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 20:15:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dl/e5Du306mVXFv4lh5JhWr0sQKx8dK9AYbLnkXYdzUpBuhWfKX9vzuCeel5U+xlGKav+1tJTnyqQeS8jUgSOpjPbaGAjEKoX/7CuMvJB2Po1BOtEpjxp0u22s47VeLGt3tl+epnnkGGEv2jQ5bm753KFDhSG8y+P5HUgNk4adVKU1T/unSd3gWu4U4t+x+IpooH23ywi/8nI5YpEER/mgqjPbQ4zB/Yy7ZLTASAXopl2IjsH5jGHg2uTDk5Zdtcg+XL/jjngmWxUrojebagclawWMcz8yvfI6DjcytqiJxMqvA+EayXCM7vUbu2RFeRS18GjuB5jvY2UpA/WXAc6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eT/Isx8Wwv3Ajj0A+6xmfgObO8iB6YdPbnOYqDFR0fg=;
 b=oCWI/8j4nD9U1Xuq8bRAm37bfr8vo0mjj1+sSXNNuW6vYK3jJWyKiFa+ZHSFKzhy++VjHxT0peIomKvfdgMSQckjfAEPclxEOvCXBtW7fufr5p3qt94YLRVGiphMRE/rd5StQzj9wtDnLfv1rljEUKIWp/XmDQkCnHB8cZPnoc2dbkimDpN6j6Tr+8+3PsuZcgyJ6owJPTDaqvXMcW4GykcXv2YhuqBqG20OpmxPABs2D1Pwx6Ve1oQJ5ngDZA2EKTHWeJ2S4h6mYaPeQ8GFJSgYHnAtpvS3qJ9u91G4QX9ersfMJSYe+2kVec5Va48IMsJltBRNJQR0Y1KpHeFlyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18)
 by MN0PR11MB6109.namprd11.prod.outlook.com (2603:10b6:208:3cf::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 04:15:23 +0000
Received: from DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::81d3:8eb1:c91b:61c3]) by DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::81d3:8eb1:c91b:61c3%2]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 04:15:23 +0000
Message-ID: <7c2ff78a-35f1-413d-8391-81c4b1afe0da@intel.com>
Date: Wed, 12 Nov 2025 09:45:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/xe/pat: Add helper to query compression enable
 status
To: Xin Wang <x.wang@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <shuicheng.lin@intel.com>, <alex.zuo@intel.com>, <nitin.r.gote@intel.com>, 
 <matthew.d.roper@intel.com>, <matthew.auld@intel.com>
References: <20251110221458.1864507-1-x.wang@intel.com>
 <20251110221458.1864507-2-x.wang@intel.com>
Content-Language: en-US
From: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>
In-Reply-To: <20251110221458.1864507-2-x.wang@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::13) To DS0PR11MB8208.namprd11.prod.outlook.com
 (2603:10b6:8:165::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8208:EE_|MN0PR11MB6109:EE_
X-MS-Office365-Filtering-Correlation-Id: bb64b55d-1f68-4115-5014-08de21a2199d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3pYQjlYV3hlNWFDTHBDZVE0NVlUcEkwY2tEdzREWEpsUnRuNjF1MmZja0M4?=
 =?utf-8?B?QVh1dUlYQ0VzSHVwZ3NJS0lobCtqSFY1MWowTnVLUXFhK1dGQVUxZE16UkVh?=
 =?utf-8?B?RlgvelhhbUIxMVZkU2ZqMWxjREQvMncreGRtM1QvZitkZ1RmY1dQTGRnMHVX?=
 =?utf-8?B?cU5YZXhISnhJSXpOelBVaEV0V2QyMUFQeTY0bDhBQ1oyY3Jmd1k5bjRIRWN6?=
 =?utf-8?B?Z2t5ZzRjMTlhbVBYdk43YkNuNnc4b0dvaFdBa2RBSWgzSWs4K1lEM2s1bWZw?=
 =?utf-8?B?OGRPdDVBdG56N1ljWlFmaGdMckIybGpCNG1UZytjSXFGbUtMZnpxbWYxRS84?=
 =?utf-8?B?STZIc3hIRkZYRTM0NXFwTHVhM1BKZUl6Sjc0dE9XQ3A0ZEFTVFJFd2NhVHBa?=
 =?utf-8?B?eHdPd1pzTUN6Sk9ORTVzdVU0VCsya0hFVDdOcjY0aWRRK1BibXlDTUFOdzd0?=
 =?utf-8?B?RXptYmowUklmUWNUejV0Z3hLMmpVTkpIeHp5aW40dDJ3UWFuNGVsMjlRdFpj?=
 =?utf-8?B?MXl5c0tOaWFmdkpTMm05ajJCRDNrTUdvRUxvUDYyNEVnazRIdUhjWGpSTmx6?=
 =?utf-8?B?UFFSK1JFT05KNXF2eTJETnlYMjVWM21pbDRQUHlBcW96VThxcjErQ2pya0ly?=
 =?utf-8?B?Y0c4NWpRUGFiK0g2ZU01TWJtYlU4SUZuVGZjQVplVFlOU0xGMGpDZkNPeTVB?=
 =?utf-8?B?WXhhRE9FRTFXVW1OTTFEdXJ5WnUvcVV4WkFYOExnL0NKLzdmUjM4SWF4WkNU?=
 =?utf-8?B?bHR5U1JmSXRsNUpaclJqeE8rR0N4Nm50T0l2L1QvbEY4QnNlcUVVWUdkUnFO?=
 =?utf-8?B?OUNWOUJtY29PQVpVUWtEbEVkVitCMkdScHgrdkxlWEMySTJDSk5EL0pXa2c3?=
 =?utf-8?B?SDltQ0xIWjY2VUJkeno4dDExMTI2SFFCL0ZlaEZNSjF3bm9WRUZNT2xnYUlj?=
 =?utf-8?B?alNRMUMvbzFvWnVWQ3gxNCtOR084Ukk3SVFPcGxCR1J0ZnZBaGU3UURVUFBm?=
 =?utf-8?B?a3dMZ3ExdkMxckpPcGFvNXF4VXppaUdDTjRYczRIRWNyYVdPOFR4bUZIMHdH?=
 =?utf-8?B?VjhnSVpVL3E0N2JvNDJyc2F2a2NFNTlWTWFjMHF1Uy8yK1k4aVdTVmtuZ0pZ?=
 =?utf-8?B?elRBSTcxUTRnblkwWW5pMlBhdHdWQ01Td01yL2dGMWsxakVvMkFBdUx3cDUz?=
 =?utf-8?B?MWdlUWdCS29QR1BSK1ZabDhWM3VmbkNHV3VNb1JJaitLdFcrTENrT2Z4VFpP?=
 =?utf-8?B?YUJOYURwOVN5bHlCTXVFbEk4Mmw2SVlTVE9ZbHRTVkNrS0tsa1BrdzdKMDZ1?=
 =?utf-8?B?RlliMjk3TTdwdmhGcnBjc01PNmYyV3FuNEdMZjdsZ1pvUFZRdXhtUEpJS09P?=
 =?utf-8?B?TXBxWk15TE1ud1NibkJZbXVid0NEbXRnZGkrM0RSbDJWRnoyZGhQYjFZNGt3?=
 =?utf-8?B?NXRXeEFTaTNJdGYzQVp3SDIrK3ptbTQwaWpEcVhSTDZ3bWMrNlpYZVlkY0ZK?=
 =?utf-8?B?OVhqRjFrQng0VmhaRmkyaFVqbWN5YVR3MWwzSFoxWlNLQmE3S2J6a3ZyM2FG?=
 =?utf-8?B?ZzdiencwaFBZc0ltdG1Mc00rMnFNNHNIVGxrNm1xRXo5SG1qVmx5S2xUN2ZM?=
 =?utf-8?B?UmVGcU15U0pOUVp3VWwycG40T1ZWRmN5NWN1VG1mY2VYNUMxR2ZSQ0ltNGcv?=
 =?utf-8?B?UXN3RzY1OEVseG11YUxTalkrakUxTVZ0RXh6Vy9hVDA1OHViMU5laW92SEVi?=
 =?utf-8?B?N3pqWkViNXJnblVINkNscitsbXE4WWZPTTNWbFljM1czTElTQmRwRHRSWE93?=
 =?utf-8?B?TGVUeWQrVnVNcG5palFHaGVLSWRycGFGcjJaYWZHYVU2azN3WVJTZlRoZWxh?=
 =?utf-8?B?TGlycTE5Tmx4Q1NpQUFYV3ZWNEhoOHliSlV4MlM5ekNDZVpjdkIvb0FWV2JK?=
 =?utf-8?Q?/NQ8sLxJ4HXsHaHR9CzopXGp4fhKgrj0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8208.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1JpdFQ1dWZGSjhzc0xiT3dFcDY2cHF1cjAyRzY2eHgyTUdXVEVzSnFPZ1BZ?=
 =?utf-8?B?emorNEM3RW1vbzB3RDRDb1I5UXRwajdKaXJuNTFJZVliTXZkWTUraEpPKzNn?=
 =?utf-8?B?c3JWSnZuVlQ1eTlCM3RmMWJiTlZmWnBkQlBjTHplZHQvZUNWTEZuRXNaV1A3?=
 =?utf-8?B?MWIyVVRSQmJtVHJNdWVGL21mcU4zYjMyVW0zSHlKRUhCRzNUcDgzT2RxQ0Nz?=
 =?utf-8?B?eDhackd1UTNqay96c25HMTJtdVY2UkxzRUZJNzBmcUkxUFUycWxsYjE4MitR?=
 =?utf-8?B?eWFkMm1objBNVlJoZmVSUnJyeTJWbE1SdDRnRC82UTRzUUNULytXMmNDQkt2?=
 =?utf-8?B?N2txbW4rQ1NOK1M5VlBIbG1RRTdZaHczSFlieUl4YlBDVHpjc3BNZFVuU0V6?=
 =?utf-8?B?eHJQUHN0MjBuK0duVUFmdHlNNEFjRnMzSHJ4NjFtUEtrK0h4LzBLL1kyQnBM?=
 =?utf-8?B?czJ2ZVFyV0VnYys0TFBlWmVyR0NIejZjVEc3UHhYbmlaTmovMTdaa1hkYlhr?=
 =?utf-8?B?Y0cza29Wd3lEQUM3TW1VUUsvNjg0OFFiQWVScnpKdEkwaHN4bFBsKzIrQmhk?=
 =?utf-8?B?bktRWFhMcGtEczJmL2d3UmZhd1NKK2o3MFdxa1VPQTVYVUpXd3l2a3N3bGtR?=
 =?utf-8?B?YzJaM09oM3VuUTE2SkJ6SzFNZkVETGdUbEFOaVk5V08zU093YUQ1WWtDTU4z?=
 =?utf-8?B?bnU4MWRmZERhN0V2NnBUaE9odFBJb1dtaGdTQk1zOURIOThIdVRldVdBNVR6?=
 =?utf-8?B?UjVvSkhXQVhSMFI1RGdqRkFEWDgxY25DbTlGK3ZWWWNHT0RNY2xORGU2SEtP?=
 =?utf-8?B?TXZ5Wk1UZjdVWVF2eHNueTUvVFUxYm1FSVFQekJtY0JBNmtjR01DYmdESHJS?=
 =?utf-8?B?SzVCMUxGT1hrQTJsU2RSWVJMYkJ3Qml5bmNDUEFldmg5R2thUFhSUGxpSWFH?=
 =?utf-8?B?c01lbEdmejY3NjByOUpESEVpRHhHZUIvQjB4S2ViNWVsTVZZTUpkSis3N1ZL?=
 =?utf-8?B?WW9KNkEzWXhzRjBWa0RYdWxBZnpuOE9kb3pPS0RVeWNWZnczRENxc0wzTld4?=
 =?utf-8?B?YTdjUTVzY2hESTJ4QWhrZHVVYnV3Tk0xYlM0Q3doT3BJNHZtRUJEck1RL3RZ?=
 =?utf-8?B?NWhZclp3UGF1YzFTQk9STmRTUzNiZnk0eEJDUWdYSk9ZY1VrZGZsaUxveis1?=
 =?utf-8?B?QW1sNkNJenlWR1g4aUdWUVFzMjQ4bWlmdUd3NTNXNkdCU0tyL2Z6VzM5Z3FF?=
 =?utf-8?B?UzB2U1pWemhSMzVFenRGdVB1S2NsaVpkQmJrYTJJMmI3QWVXckJSSWx6cWpR?=
 =?utf-8?B?RTZzYk5SSGMxZVl6VzRhT3BjcjF3amQzbEh0R0kzQVU3UmdjWlZxdDFUamhE?=
 =?utf-8?B?SzNhT1VLZmdwZ3lpcWEvQnlYL0VuT080NWVueVBlWURaYjJlVWJacHVWYWth?=
 =?utf-8?B?MVI0ckxVbHQ5VTZYWHIxNzV3djd4azdYUW9WYjRsTmtXL1lGYjU3RlVVaEx4?=
 =?utf-8?B?TkxFWjBSYzhxeHFpV1M1SXhhOFB2bzVZaTBXSndXV2RZSUw1WWxjQk9sRXVN?=
 =?utf-8?B?WFY1NjBFOEV2OEhjdTR2d1doWTIwd2V1aEMwYVNQT0pyMXRQcXU4ZFIzQU5p?=
 =?utf-8?B?ZDlOTEt6N2l2V0RXdkM2YnM0eUdWeS9XcElsQktKT3d6UHFqOXo2YTNhRkh6?=
 =?utf-8?B?N1I5c3BNbnorVUlsWERteWpnR1hxVnZqcWJCWnFabis5ZEdLQ3h0WDJ0V3pF?=
 =?utf-8?B?UUxlVmwzbjhYbXFGM0R1cEZRbEhnZThxYkFuYkNQWDVDNGkySFBhWjdVSFhY?=
 =?utf-8?B?c0YxZjY0MDBKbXduZDFnaG14dEkzL2RVVENvRXZEVlg5SHR4UkhDUEpRYlNS?=
 =?utf-8?B?Wk9kanRZZ25GaUtzMUxqR1dOM0JBYWpJdXdyT1kxdWFNUDBldUsvRkhod1Rv?=
 =?utf-8?B?WnR5Q0N6YzVmUDdwTXZ2cGFCMW1jZ2FiUktRTnYxYm5nTFNqSUoxS3hQbEMy?=
 =?utf-8?B?WnBndGtTV1lsKzJlZExjYVBiTHR0OUZCS3BMZ29TaG9DeHlPSktkaFdwV2Nj?=
 =?utf-8?B?Sk5NM2NQS3hjOUlZZ0hicUdRaHpvbjlFSGhiUExkUGJPOFlnMGpSWVkvVWwx?=
 =?utf-8?B?M1AvWjdNQzAzNUZreGxTditjQWROUUJQMDdSQnU0ME9QMGF6UTRIU251OGZ5?=
 =?utf-8?B?SFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb64b55d-1f68-4115-5014-08de21a2199d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8208.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 04:15:23.4640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QYMJ9VeTVLJt/s41CBteFZIwEcT7KYk3/ox0vfpqGhQfjaGtHaiY7hwVlM2riCN0fr1FTb6XM6oOSbrR6VGSAnkLLQrlROgeK19sMStgAgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6109
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


On 11-11-2025 03:44, Xin Wang wrote:
> Add xe_pat_index_get_comp_en() helper function to check whether
> compression is enabled for a given PAT index by extracting the
> XE2_COMP_EN bit from the PAT table entry.
>
> CC: Nitin Gote <nitin.r.gote@intel.com>
> CC: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> CC: Matt Roper <matthew.d.roper@intel.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>

Reviewed-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com 
<mailto:sanjay.kumar.yadav@intel.com>>

LGTM

> ---
>   drivers/gpu/drm/xe/xe_pat.c |  6 ++++++
>   drivers/gpu/drm/xe/xe_pat.h | 10 ++++++++++
>   2 files changed, 16 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 68171cceea18..1b4d5d3def0f 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -196,6 +196,12 @@ u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
>   	return xe->pat.table[pat_index].coh_mode;
>   }
>   
> +bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index)
> +{
> +	WARN_ON(pat_index >= xe->pat.n_entries);
> +	return !!(xe->pat.table[pat_index].value & XE2_COMP_EN);
> +}
> +
>   static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[],
>   			int n_entries)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index 05dae03a5f54..b8559120989e 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -58,4 +58,14 @@ int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
>    */
>   u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index);
>   
> +/**
> + * xe_pat_index_get_comp_en - Extract the compression enable flag for
> + * the given pat_index.
> + * @xe: xe device
> + * @pat_index: The pat_index to query
> + *
> + * Return: true if compression is enabled for this pat_index, false otherwise.
> + */
> +bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index);
> +
>   #endif

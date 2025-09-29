Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C1DCAC5B0
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 23:21:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2538110E25C;
	Mon, 29 Sep 2025 23:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nLP6zenJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B6610E25C
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 23:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759188070; x=1790724070;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1tV5g08jbxT7FOtrwXgnit64YrkfC0F+W3swldFH7Bc=;
 b=nLP6zenJoWPmc+EdAl2FrUQUSrQjYPACpUpcG7NQSFqaqBBfw6lgdQZu
 2liMCPQlpLbtXuPwXjYS6jfxGe7GaxynGfe5AK+POnNY2vdsnO1Bw+QeO
 1mtG9srEl18PKbbsraHbVTgSMMoMF9a2DazhKCubYasF6NIWM9Oq2KQtI
 aSJbvTWSj3f0YC69oCsYNbCXCYX9K8XP74wUnmjoePibJNnByPvGom75J
 AGI1Q/dJnXr80yE0jKUI6rf7p6+B9CuQgAPsEEwaPIH+EwZ7/Fud8EXNT
 MXr433TlyoLgaUzh+EZuWmXQR2LIHb7BSeN0duyQHvZpJ0HYAgPkZSwfY g==;
X-CSE-ConnectionGUID: WQd64ONORzW5k2W3SvdvMQ==
X-CSE-MsgGUID: sCMQNTg1RdyXkp4bqwLqeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="71685277"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="71685277"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 16:21:10 -0700
X-CSE-ConnectionGUID: ZyUkcaA2TRqE+hrjQxTjvQ==
X-CSE-MsgGUID: 21+JPa4+Reqn92QJYu9BhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="182768652"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 16:21:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 16:21:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 16:21:08 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.26)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 16:21:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PtCHB+Iluqq2SyjNSJmxBqQWtITqhroaYoKKhGjJrVbbndDQcjSRWKI/0puIiWQKctJ65vVT7P2OBwyClEyIa71SoKq/C7FP0uycIhZtWue8eBrPwzQ6VWxDJ91r3bUND8XGwlhRUffXcqT7NepS4SH0tm2Sud/AC48u+LtWXJ16xEVLt2OESojQ3iQrFkhwE4rEBUMd+2rF9m4Zze1FtJQXpc3ZPqE9oPpdTLi7o+RQmKQZE968M/vnd6UAVfno3EqE+QJJk4San+KSkOa4rZCsIp18+30oMBsI64S8MDOZP51lWWo05APqjmattzuAdHEYTzOJ09+UDlp/ZXR7uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9UIHnXMpqqx5Rkgfzq6F3CFgl3WhyeQjYTQyHKWrqoc=;
 b=TrYZ7Vo5hzBDgjss0Kp/4r1oQWPKnb/kF1uQNgi6P/ERTmz0qQE0Nw91Z8vo3ut9LJMQcJ0EyHRSstbN1x1SL6mSBFJScuvjcQj78f5vh3ChanGO1/jyvEjtsvZO/JcZLb1oOLbV1KIhG7DdS8mDE1XqPh+e75ytCCGtPOZ8/dZxaaMwkNQhxXWp/YdZZhH3h2Vy6ddDgVQMevGvD09NfDl0qncmYyIOINnxIdvd+OmwM8MnFCLTqbACYOgC5lvom2K7gGXUcOyqBW2V80A98dcxE5OAPL63XwmEAmw4oOZ8XMsCBRp4Pa8yetaewlwH1+WpEqTQXV4aPCOafuu+WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 23:21:06 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 23:21:06 +0000
Date: Mon, 29 Sep 2025 19:21:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 0/6] Refactor PF debugfs
Message-ID: <aNsUX8w6JLoDQPa_@intel.com>
References: <20250928140029.198847-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250928140029.198847-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY1P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::14) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM4PR11MB5293:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f6770ec-b585-402c-d928-08ddffaedd8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3MxNnFDQnptOGwzckNYc0JLTkMxcW43cWgyRFlua1FmSTNGeThzZTNGT1ZO?=
 =?utf-8?B?eXBPSmkzQ3A4YzFYYkx4QXhyY00rSndMdzcxdU5pd2I5UGxBcit0a1cwd0Vs?=
 =?utf-8?B?dFZLY0hDaGlOZFo5S0IySFcxMWJla3hqck1oUFAxTDJmUFFLTng1QUNBb3du?=
 =?utf-8?B?OWRyQmZQbWFWVG94VDZoOGMwaUJvR3RjZ2NSS1N3SFhuRmE0NUFFWGFoM3Ez?=
 =?utf-8?B?WUp6cFN1dTFLU2lZR05DTW5NbThkV0ZWQlpESXhrb01sMXc3V0xtZ0xER3pY?=
 =?utf-8?B?Tk84WnE4Wjh1OUJweVdockt1Wm9xcGNqa2FNblFlMjFQd1g4YnY1U2NNcTg3?=
 =?utf-8?B?QnhhUm9wSkZhM1Y2QmRQcTlZTEkvSmJNQ2RHT1YvMEc1UFcxQUwxWGxpekpF?=
 =?utf-8?B?enltS3hCS05Xa3NhOXNDZVlTQzIvUnZwU0tqQjhtUnkydEkwQWEzRHZmK2Zn?=
 =?utf-8?B?V0Q1bFZhUzRjdUt3bHM3Ukk3MVdaRWdubjFkbzczdVo3T1FIYVN0TVQ0UGVP?=
 =?utf-8?B?M3laaDNrei9YM2U1STl6UVk3MGRjeS9keXVVNGVtaVFnUm9QYnBCZFlNTktv?=
 =?utf-8?B?NGtXbEJMY0QybUVyTUxZbGtiMVp1bHpUM2xwODFxbEtGY2I5bklHd1FYdUZ6?=
 =?utf-8?B?V3ZPV0Rha3lrN0NUY2d5MU9qSEcxQWVDNHpnZk15Ujl6NmdEanBpVmUrak45?=
 =?utf-8?B?aHJIUk9XSEs3bzFaQkRjUStaUkE4ZkYrUHo3SGlQZE4wSjJlSHE2Z0U3M1NI?=
 =?utf-8?B?ZVJ5a0cyWE9iZlVrL2lKRUJpUlZQdURNTklIdVBTQVFDWTVCNm9ZSkR2bW5C?=
 =?utf-8?B?am1BMnVhck1JNitiQzh4dXdtaHhySG1mMmdJN0syYUZjVHpIUnpNRWxZRDdV?=
 =?utf-8?B?YzR1clJnbFNCdmpJVEYzRm5pRVFST2tYSU84TjNwMVJpRm1SajVIRjlBdUds?=
 =?utf-8?B?OVJYS0RoSmhYOG9wRGlRcmxwQ1RhSlpsMWplbTljb01icHAybkhiSHJXa2ho?=
 =?utf-8?B?Q0ZpNUNPeXpjbTdOYkg5emdFdDBkOTVuOWVibWdLb3RsNi9RUE5EQnVTbGlx?=
 =?utf-8?B?RHV3Y0V1NXlPZGJ5dHZ3VWdZT1ByL2NtSTVHS2hMTlpnbjkyZ0JZWHBoY0ly?=
 =?utf-8?B?aHk3ajNkQXFuV2tydmJsMGk4WFlKejRCbjVJSzg2SzZCZElHalQrN24rekM2?=
 =?utf-8?B?Q1ZBMmw3b0dpTUtLdjk1VnQ5UWZ1Y3lvSllqQ3k2aC9zTmRwcDBEWTlqa0dZ?=
 =?utf-8?B?Z1c0Tm9OcVNEblFYUVlmOWN5d0tEbk51UTZKalI2WW9ERXdtc0hkSXpqS0hX?=
 =?utf-8?B?dE00WHJ4YktOQ1NieUhJdTlwYndiUDJ0dkhnVmhNMUpBRmc3VC85KzYvcGdx?=
 =?utf-8?B?Z0hzS2x0MXBpVnQrUjlWS1kyRTAycGJtZm56SjVQUEh4WlhKbFh4aHdJNHAw?=
 =?utf-8?B?cVp2dW1oV2s5NTZpeWwwamMyOGE2eFJrL2M0c29Nb2szS1VaSFJIRzlaRDBt?=
 =?utf-8?B?YXAvWjNGZ2dyY0FHNFdZRmJCZFhtY01Jcm0yTmhVL24zUVc3eStmYWxNVGNB?=
 =?utf-8?B?QlEvSTEveG43ZEQxdUI0MkJla2VLbHZRR2lxbTNQMkExaDlVZ2lReGFZTjlw?=
 =?utf-8?B?OXM2Z0ZjR1Vaemw2YVh5c29OSFduK2R2NHZOT0dMTDZqNTlPRS9qSUdUMU05?=
 =?utf-8?B?M0w1WHJEdE1PMnE0NjRSd20xZnhxeWVjUWp5bktFVFdZUlltd3hCTlpMQ213?=
 =?utf-8?B?NE55akdsdHlsWjFmZnF4RCtnOWcvc3FmTDZ1RGdTTiszWlo3ZEdTSkdjOGNr?=
 =?utf-8?B?dXE2YlRXczl3MzROMkF2SW56a3QrQk1McGN5VU5OMlEvbzkzdUxJeG0rMlVB?=
 =?utf-8?B?a2thaXVzckdKOFJMWnVnZHVEYUE1T253MEc3M0Z4NzRxTFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnk1R29uak9UaHZ3UnRzMzFXbU1DeVVVUVhka2g0R1FnNVFVallLYThXcG11?=
 =?utf-8?B?cTMwbzhNcTR1VThEcmhnNjA3MmQycWxoZzUyejlCWU5wTHdrNGJ1RmM5bExQ?=
 =?utf-8?B?b1dJSGxhaTdDZHhnL1hjbllRQkVMYkFhcC93bzQ0OERGWWpRSXJCTlFXYXZU?=
 =?utf-8?B?UGJFdGZSbGFtSTdQbHZoM1A1MWNab01OdTJXNHVnaEw2NWhaR1hubDNzR0Uz?=
 =?utf-8?B?VktFRW16dmptOXBGWG1wdDlsQzVDckNOSmFMclVpUzhQRlF4Z2JoSVo3dHBJ?=
 =?utf-8?B?TG9yZXQxR2NFMDFyanlzY2NRdExGSHJkUTF5blFNc2lWakpFeXNUV2dzYTEv?=
 =?utf-8?B?YWRmTllDMlRXdFRMQWp2UlJFMUlRVm85QXdKKytjSGt5d2FmUXRXcjQ2ZWFt?=
 =?utf-8?B?bkJlQ2NpTHAyZkhqbEJsb2xOajVjSUVwQ0lyQTNUSU1yWEs5bjJSdjBqNksy?=
 =?utf-8?B?eW9oaWRNdHV5RWlJdm13YkZEbzFnTGVaK1VzOG4wZ25YWCtqeGVlaFU0WTc4?=
 =?utf-8?B?UmxlMzQ5K1BxcE8rYzIyaVZQdTEwakhKbVN0cDZmYVh2cTM3N3lLQkgrTmJ0?=
 =?utf-8?B?S0N6dFhCRWtwaEVRaSt1VXVhbWVBZWlZOXZBdElkSXpEQjhvY01RNXNGWDh0?=
 =?utf-8?B?ZmkzeUpyT1NHTUJoZmFvZnFCdGRsS1ZVdGhJMWlBRG8wWnh0WnlwMmNPa1BZ?=
 =?utf-8?B?a2ZFekgwM0FRVXV5aGZTcjVmcEVFVUV4S3R1RVRwM0RXVndIUFR5Mm5Bckkx?=
 =?utf-8?B?bmd2REdhY01QR2xSUmRlbEhiTE9FRTRyMk9CbDNBUC92V2VPK080WTNQaFBC?=
 =?utf-8?B?bHhDOW9lU1hYNUtiMm1ZT09JeGdudkl5U0NXWUJ6cGJONEFjTGYxVjRTN2VY?=
 =?utf-8?B?MnpFbEREcUtYY1Z3c2tsOXM1QWhhMGxKNm10cFVtcGJZekVPQ1dkTE1jWDkr?=
 =?utf-8?B?Z0tBUlRsLzJ1OENqRStKTjJ3a0Zscjh2VVRDMkZ1bXYyU1FoTWNQYWNUSkZL?=
 =?utf-8?B?T1VVbGpEV2ovQklvYTM1UjZlOVVNL1F6V0JDZEgyVUhIMzNBYUtCbmRyVXNi?=
 =?utf-8?B?RGJsaS9PeFRxTVp0TGRrcFBGc3V3Rm1KRjZGZ08xZGY0aXdORFIwSXY0Ritq?=
 =?utf-8?B?aTYxVnV5T0h4U0Y3N3gvNitWbFZEdWVybDlFRFcraDVnZi8wRldkaDNyaTBy?=
 =?utf-8?B?VmdDQmY2MG5KMTNsdm9pdWc4azVNZ0pzdHlEZVB4cHU1eGNpSmdKYlQxbVlF?=
 =?utf-8?B?U0ppNERzVDhxcWIzcVY5Y3Vuak5jU2JZd2I4NUVXYlIrU0FGSHhtN1VKMFls?=
 =?utf-8?B?UFNlWG5CcDR5SDZRN1BvUTVzZS9JWnprcUpZZkpadVdQekU4VzlXbEZRSldP?=
 =?utf-8?B?Wk4vMjh2QTNFZ0RvZnVPWTJrS2E4SFU0TGozcytBNWJaZHgwRkNMbDVCbGJC?=
 =?utf-8?B?aXNGRTRXSzJ3dXVhZUZKbmVxdmJBZWROSWN3M1lKck9PcHFPSmFxbVdiT3lj?=
 =?utf-8?B?T25YSkdORE5lcTJESmJEbm8zbnlsWFNhbW5sblZPWFFWNUVPcnJRbFhQUFRa?=
 =?utf-8?B?MXlNMlBjNms3WEhybXNTQVlVNkFzZldtTlJJMURmTEQxRVRRZHhqRjgyMVo0?=
 =?utf-8?B?YytlcXgyM2hXNU8xTFRubFhDQW9FQjM2QVo2c1BNTFVPWlVJa2ZyaUM1TEdq?=
 =?utf-8?B?U2FkVWk4ek5YZWtZblBlekpmRTQzREpSMVh2MlpRSVVOZFN5alpsY1JtdVg5?=
 =?utf-8?B?WXNYYTFXdmRHM1ZNZi9GQjNpUVhCTGVkR3d5VmJ6YUY5NkRlVFBDZkdrYnA0?=
 =?utf-8?B?UWRHcEdtR0N1S2JYUTdlUkdlbjVmb3RDc2NxZXVSbEpNcFYrRytMN0VEUm01?=
 =?utf-8?B?c0xZR2hVcWNNODArSUZ5dnJuR2xxYmxVNHU5RFBkcFE0RVJKTGNJRHNFVmFm?=
 =?utf-8?B?MWVSb0FvWlhPQTU3cDNWaEx4RFl1d1Jyam4zVktnM2hFSEM2Y2ZwS0thWWJa?=
 =?utf-8?B?WXVoSFkwdm5kSXRSWW0xYjVSUjV6WG45c0E1bW5GRktZRTNZU3dUREFlWDI0?=
 =?utf-8?B?eHJsd2lodzRSVGdvRnBIQlQvZkxKNUR4cTZuUW5BbmpBYmlQQnB1andFSGlE?=
 =?utf-8?Q?/QS0FXoYpuTj8kWO21vBWwStU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f6770ec-b585-402c-d928-08ddffaedd8a
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 23:21:06.4992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j5TJg77b/6VVTQ1mmY5iFtBvU/s9dv44jIOxO1DnLzUMcoxOHvSazt/A1EMbntkQFMXpDIRJphJwXYOkM6Bqbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5293
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

On Sun, Sep 28, 2025 at 04:00:22PM +0200, Michal Wajdeczko wrote:
> In new debugfs layout, all SR-IOV files are grouped under single
> "sriov" directory, where each SR-IOV function is represented by
> its own separate directory, with individual tile/GT structure.
> 
> This allows to place GGTT/VRAM attributes correctly under a tile,
> without polluting 'native' entry with many function directories.
> 
>   /sys/kernel/debug/dri/0000:4d:00.0/
>   ├── ...
>   ├── gt0 -> tile0/gt0
>   ├── sriov
>   │   ├── pf
>   │   │   ├── tile0
>   │   │   │   ├── ggtt_available
>   │   │   │   ├── ggtt_provisioned
>   │   │   │   ├── ggtt_spare
>   │   │   │   ├── gt0
>   │   │   │   │   ├── adverse_events
>   │   │   │   │   ├── contexts_provisioned
>   │   │   │   │   ├── contexts_spare
>   │   │   │   │   ├── doorbells_provisioned
>   │   │   │   │   ├── doorbells_spare
>   │   │   │   │   ├── exec_quantum_ms
>   │   │   │   │   ├── ggtt_available -> ../ggtt_available
>   │   │   │   │   ├── ggtt_provisioned -> ../ggtt_provisioned
>   │   │   │   │   ├── ggtt_spare -> ../ggtt_spare
>   │   │   │   │   ├── lmem_provisioned -> ../vram_provisioned
>   │   │   │   │   ├── lmem_spare -> ../vram_spare
>   │   │   │   │   ├── preempt_timeout_us
>   │   │   │   │   ├── reset_engine
>   │   │   │   │   ├── runtime_registers
>   │   │   │   │   ├── sample_period_ms
>   │   │   │   │   ├── sched_if_idle
>   │   │   │   │   ├── sched_priority
>   │   │   │   │   ├── threshold_cat_error_count
>   │   │   │   │   ├── threshold_doorbell_time_us
>   │   │   │   │   ├── threshold_engine_reset_count
>   │   │   │   │   ├── threshold_guc_time_us
>   │   │   │   │   ├── threshold_irq_time_us
>   │   │   │   │   └── threshold_page_fault_count
>   │   │   │   ├── vram_provisioned
>   │   │   │   └── vram_spare
>   │   │   ├── versions
>   │   │   └── vfs
>   │   ├── vf1
>   │   │   └── tile0
>   │   │       ├── ggtt_quota
>   │   │       ├── gt0
>   │   │       │   ├── config_blob
>   │   │       │   ├── contexts_quota
>   │   │       │   ├── control
>   │   │       │   ├── doorbells_quota
>   │   │       │   ├── exec_quantum_ms
>   │   │       │   ├── ggtt_quota -> ../ggtt_quota
>   │   │       │   ├── guc_state
>   │   │       │   ├── lmem_quota -> ../vram_quota
>   │   │       │   ├── preempt_timeout_us
>   │   │       │   ├── sched_priority
>   │   │       │   ├── threshold_cat_error_count
>   │   │       │   ├── threshold_doorbell_time_us
>   │   │       │   ├── threshold_engine_reset_count
>   │   │       │   ├── threshold_guc_time_us
>   │   │       │   ├── threshold_irq_time_us
>   │   │       │   └── threshold_page_fault_count
>   │   │       └── vram_quota
>   │   ├── vf2
>   │   :
>   ├── tile0
>   │   ├── ggtt
>   │   ├── gt0
>   │   │   ├── ...
>   │   │   ├── pf -> ../../sriov/pf/tile0/gt0
>   │   │   ├── vf1 -> ../../sriov/vf1/tile0/gt0
>   │   │   ├── vf2 -> ../../sriov/vf2/tile0/gt0
>   :   :   └── ...

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> v1: https://patchwork.freedesktop.org/series/155064/#rev1
> v2: use VRAM instead of LMEM (Lucas, Rodrigo)
> 
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Michal Wajdeczko (6):
>   drm/xe/pf: Promote PF debugfs function to its own file
>   drm/xe/pf: Create separate debugfs tree for SR-IOV files
>   drm/xe/pf: Populate SR-IOV debugfs tree with tiles
>   drm/xe/pf: Move SR-IOV GT debugfs files to new tree
>   drm/xe/debugfs: Promote xe_tile_debugfs_simple_show
>   drm/xe/pf: Make GGTT/LMEM debugfs files per-tile
> 
>  drivers/gpu/drm/xe/Makefile                   |   4 +-
>  drivers/gpu/drm/xe/xe_debugfs.c               |   2 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   | 389 ++++++++++--------
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.h   |   1 +
>  drivers/gpu/drm/xe/xe_sriov_pf.c              |  42 --
>  drivers/gpu/drm/xe/xe_sriov_pf.h              |   5 -
>  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      | 108 +++++
>  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.h      |  18 +
>  drivers/gpu/drm/xe/xe_tile_debugfs.c          |  14 +-
>  drivers/gpu/drm/xe/xe_tile_debugfs.h          |   3 +
>  drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c | 247 +++++++++++
>  drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.h |  15 +
>  12 files changed, 621 insertions(+), 227 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.h
> 
> -- 
> 2.47.1
> 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781A6E7FDEE
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 21:34:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F9E10E2E5;
	Mon,  2 Feb 2026 21:34:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ao86IRPH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BC910E2E5
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 21:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770068082; x=1801604082;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tBIWSOA3WhySuKhKIMOZD/DF2kKEMPmoZKNOhZ6QDuU=;
 b=ao86IRPH42xosg1MWzBOF8ql8Bv59O4w2YIhfNX91i6gRdDBn+lLVgti
 +ByW/1Xu/zn+WiyW1aWgh4MVjSjVEbHX0uzAiJ/HgLnVNqvo0odcxuVDl
 lzGPRvqtxmpNu64NMS1ZGpsnBBr6kHPrBy+MeQ0bRvluki6Ird+8byLv9
 VTW7UO9JZIl8f+rIXGzXT4egCpJ7XMb1CTRbZsgyX5EhQF+UrWxnsebL5
 0Tpfn4m5D5BfJwF8zvNTxBVSFZR6s1lvvOSTOowCCyDNVmpwoyo/7TqEO
 McHk44gNDgXMRLN7UgEUHDe8fd8K0RgI2ncz0BIwq3nt7H3LbUXjmCYE9 A==;
X-CSE-ConnectionGUID: kfEg6fJtSriawjqNsw+hmQ==
X-CSE-MsgGUID: iZnZfd/cSceiGWC0UI2jtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="70439917"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="70439917"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 13:34:41 -0800
X-CSE-ConnectionGUID: 0jmNbtMLTlmnPJCuIsaSOg==
X-CSE-MsgGUID: nfzuqtvIQvedq5GpdTsfhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="214430483"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 13:34:40 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 13:34:39 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 13:34:39 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.70) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 13:34:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RAdd5ClmFBwd8gETJS3Z/hEC1a3OIlzF0RUCBGHzmSe+OXUbXNbyVQlPz39iyZaC42SlnsfSUkRFC0g8y1+j4W4suIUGThJ6A+0JPI+hgKEd9xaCiDO47zBxEj4QZbw6Piv2xjcwJaKniz7briqMcWHaO/ObthG8ElAkrXyvzLIdFQx4SleLGVM3VGKi+GvxpHMEOWnta8Xr2q51k6YGd0fcHfVHA48s0v03JqgHFBkQY5TaqtsLkKJzhU2JtXV61cOO5jvcPA8mXqpFefUNd2mYgaLhULB3ty+cfJ0iqk4qY28+iIgYMDZBZJ5w8cOzu7NrPqWied4/qNT7pCrFpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDCYCZeLMF5FO7gsWScJJRpiFBYfXJWfJeY2GG+F1QE=;
 b=V8klsoTQx1ygKNJOaaUNuhSKp+pH6jzlmJ1jwV6/RpdEgia7VwDaldpGCPhmPwtKhkopsPbNNLRRgj/96BUigz2ySFPPu7UZyJyTxMIrsnb2Per00b1zCXLRKYo8b4sEsIXzWDa6joW2/O4zp8YpYKQAO/HimcG57Wr3b45VJVUiCzQK4uONrChYIbXPO+EVtbxvoEU8KFeYjA/dxDqadJb6I0SqKyUsfxJqmwue+7upmaSaef091kjL6NC7RkZ3lu2KC38bDyYDVSK6UWI664oYEwomE5/R7i+/gBwPU6dKwYx0/xJmq9a9pDzTv0jVP3ACGyb53Ev12l8tmU/i7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CY8PR11MB7338.namprd11.prod.outlook.com (2603:10b6:930:9e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Mon, 2 Feb
 2026 21:34:37 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 21:34:37 +0000
Message-ID: <23a33601-f624-49d9-ac05-d6413370a7c7@intel.com>
Date: Mon, 2 Feb 2026 22:34:31 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/guc?=
 =?UTF-8?Q?=3A_Make_MMIO_communication_more_robust_=28rev2=29?=
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20260127193727.601-1-michal.wajdeczko@intel.com>
 <176956889595.198158.16853758417207901997@a3b018990fe9>
 <28cf2675-88ed-401d-a599-50ec5b16687a@intel.com>
Content-Language: en-US
In-Reply-To: <28cf2675-88ed-401d-a599-50ec5b16687a@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0224.eurprd08.prod.outlook.com
 (2603:10a6:802:15::33) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CY8PR11MB7338:EE_
X-MS-Office365-Filtering-Correlation-Id: 719d20c5-869e-460d-b4cb-08de62a2dd8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejJ3UXNIQjZZWXAyTlQyOHdOU2pmMkZWRXc2d0poekNhODVmWUhjdlRUNExO?=
 =?utf-8?B?ajRZOG5mSk5WZWZib0kvVHROMjhoQWlIaFhsTHJ1d1YrWmhDOU9Dd3FMSzJ0?=
 =?utf-8?B?bDI4QS9qV2NBQzJMbGM3bWdydTBBWFZYRnQxR2dxQjRVdklWb0ZLSkU4Z2xY?=
 =?utf-8?B?M25zTFVUSE4vZnJkem5oajkvVjArN1I5NTBURTZHaUFWNG4xSWg1VXdlTHhH?=
 =?utf-8?B?a0N3V1E3bkxxeU55c3VPTHBtNkJESzdBMHovZTI0STdPOTdRZG1aeXVwbENx?=
 =?utf-8?B?bHBDZnc4N3h2WDlxK0h5UlVBVXdOelFWUG9WOWFWSDAxZG03THNWVlRjWlBE?=
 =?utf-8?B?Z1hhL0tqSVpsN0hxYzBPRzJPN2JoeC9KKytxYUgwMlluL2pJemJxTGNZVDJX?=
 =?utf-8?B?enJIMEFsYlRmOXluOHRpcXFFRHloODMxWktpWlgrcHpoQnNzNHZkdWpLWjND?=
 =?utf-8?B?R0xNL29yZDhNbDdtcFFyeExuUUZYVmFkd1RRSmJQNmNkTWVKaE9hdEdiRCtm?=
 =?utf-8?B?NFNLTHE0dmhTai9aRExrNHovaWw2d3FFVENuMUhuU0pueWQwejBuaEdZUGlL?=
 =?utf-8?B?YnQ1ME5hNnJ2ZnpLVVE1NnVTNk5aRm5nSFoyVDF5MVFqMHVwUHdNVnpCNFBB?=
 =?utf-8?B?MEJ6QkJXLzVFYWJKY1BTMU9GZWlFaitXSlZBT05NaERkeWF6bXRJUHY1RHZY?=
 =?utf-8?B?U2FvUWxUd1J1bzFJV1BqNmRrbm5Rc25BenBxZFUyVGVOTlZwSGlTOWprQnY0?=
 =?utf-8?B?c3hZY3U4dW1KbGxqZTFOZGxFd0VkcEpLNWMzbXhsQjlvMWloZ0Q0dG1FVXFz?=
 =?utf-8?B?VU9Va1BoQmd3QTdXSFZuWk54RzVZODI1d3pWcUFUcUN5V05KSlE3TVgvR0hj?=
 =?utf-8?B?T1czUDhaaFRiSGI5aUVLZmpESUhZY25UMFZDOUtwc1ArdG9TU2s4UlY1Tk52?=
 =?utf-8?B?K3Q0UzhlMjlpamtGTERPSjErTDI1WHFuaVE2bVZic01XUU1TN01rSkt1SjRu?=
 =?utf-8?B?QVh0M2FFdHg2WStvMG5TN3ZpbVBWUmkrcVlqUHYzZVgwMzhUTHVUTm9WREg2?=
 =?utf-8?B?YTliaCtGdTJSMkRWenM2RGp1Si9lN3JSSzVBTlVUN1JTclFETDRhSFBxTlhP?=
 =?utf-8?B?SGcyZFJnMXpBYXhuWEwvbFE1dVk3Q0xJaThjcnYrbWdtNEFFNTl5bUhXclNj?=
 =?utf-8?B?NzQxME9mZ0QwaUxRdk1uN21ZWDBNODJ2MVRmcWgzSnd5SmU5aTZ6bEJUbmpC?=
 =?utf-8?B?L3RuOHFFN0lVSHhaOEUzcVQxODhRaDVPVFFHSG9OeHdBaGlzL05hY0s4ZExU?=
 =?utf-8?B?UVI5TkdUd0QrRVV3L0lraG8vYmZKaEpkRU1ZV29xaFFSYjdGS0tjSjJkV1px?=
 =?utf-8?B?WTFCa2g0TmFyN0kyYzNPN1kxNm12Zkpud0oxTVRLMEdoaXdRN0dYK01NZUY4?=
 =?utf-8?B?ZmZGUEEya3BtUTI1d0hZRHAvS29oVGd5clM1SXhHSWR0bGZDOTJNYkdRUEg4?=
 =?utf-8?B?bTBlZ0M4T0wrekNYKzA1UVhMNHlBUjdyUmxXL0xaSWtheEZxOExNQXpoa0Qv?=
 =?utf-8?B?VDhCUjFHbU1WUzBiTnFFMGhsbjF2dDNQK3A3M2lSUVhmaTlaUkYyeE9FS2lI?=
 =?utf-8?B?Z0ZXUnlEaWxrQWVEcDdKUlNITW52ekJQQW1pZUlUQXdQOU5aNTQzS3JvNmxq?=
 =?utf-8?B?d1hjYldsVVpVMzF2QTErc1lHOWU5MWZoUHNGbWZWeEppTGhQRGsrWXRFbXRX?=
 =?utf-8?B?a2k4ZTNFYmE1REJvMVZLVVZXYmlkdGpPdE5nZk00NHFBY3I5blJvZW0rS0o1?=
 =?utf-8?B?QjJPdk9WMlg4cUF0ekZkSC9HUVJTbXJSMlpMZ3k3bGw2cmFsZkplZlM0dmV5?=
 =?utf-8?B?TjEzNEthMVF1MlJ5Yy9sWWI4a0R6WEJGUVRBVVV1NXNVamtyZGg2c3FqaUhZ?=
 =?utf-8?B?WnFxNUdjNUYvSWN4dDBFMytFb3Y3NWZwMVRzdjRaSzFWVm1LdXVhSittTm44?=
 =?utf-8?B?Z29jd0dld2JpbGczSThYM25mUGRzY3NIVG8wekltTyt0blVNR1VZa1hrc0VM?=
 =?utf-8?Q?BghFYG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFUzanhKZmdlSldDcEN1MzRaUVprdWdWdTJ4TkdWM2QrK2J0ZlQxbFUwRFVa?=
 =?utf-8?B?QU1SajZyT0hxNGw3OU0yRXVaU2wzYTZtdGtJMEN1eVB1SENsOVR0RjYrN0ZY?=
 =?utf-8?B?NjBxWVNKbTJzeG1uemVucENtUUV5K016Z0U3Mm5YSjlqTnUwcHpWVW9yM0VT?=
 =?utf-8?B?N3hwM1BKMkpZeDhob2JwWXNoOG1FWERqaEFkZElIcEhhSURlc2NPS2ZMcjhK?=
 =?utf-8?B?c0gyQ1dyOVhGM0RuM1R3dmV4WnI1L2kvaDBkQTY5cFpBZDdvSldiUE9sOTRs?=
 =?utf-8?B?NjArdDU3cUIyeGVMS1lQZFh2cGhGaDJPanBvR2ZCNFdzcXJBdDRRQnlXZEw1?=
 =?utf-8?B?bTA0eTRJY1pWdmk4WlNKZytYdVlUaXdqc1ZOSTNaS2ZkTGh0WTQrRkt2YWt3?=
 =?utf-8?B?YWs3T1llR2dvUzJ5M21uZTEwZFdvY3d3L3EvazlHdVc4eW5KZ2xJNjNkNzJR?=
 =?utf-8?B?VDZuU0FOVkhTTmlNemUwRDBTNk9uWE1CUnpRYkdrMStVVHE4Nk9TVG16Uk9r?=
 =?utf-8?B?ZngzVXhma2hPbmVQdDI4NFIyS1hTUFNWM0FLeVNhR1JlemVROWlpZStvSW5q?=
 =?utf-8?B?eU5VSzlhamIxWnY0Ny9tRDlXa1ozdEs0dGRObmlpRzYvRmd3THBGV2IvREFl?=
 =?utf-8?B?M1kza0J0WENhR1lLWW5JN2hWUzNOTXZKV1ZvcUp2TDY2RDR0VEw4emZQRHRt?=
 =?utf-8?B?Z1RKL0Jyb254SFd1QmZFODJ6YlB0Wmp0Y05JR2I4elFhd1ZBWHpSTmZjWm9P?=
 =?utf-8?B?c2QxOUtrblJVbm9BWmxLeG5TejdUY0UvbkRZQm1aSldTUGZlS0hVMUxZQ3BQ?=
 =?utf-8?B?cnlaZDdOQmFCblNCTVpmRjlNTGtJemJlTXhjYy9zYmcyM3AyeGswVzNSUElz?=
 =?utf-8?B?UmRoVXcvOWRmUy9POGgvYWNyd3NZVkVJeWN0dUIwdm5QeU1OcXo2eVBWYVR6?=
 =?utf-8?B?RURMbHBCeFNocnJaSkdMTDlTV1hoZUdjZE0xVEZIV3F0ZE9QLzRMd2Q4NkIw?=
 =?utf-8?B?dlNtRDFnSjJWM2NXQmlyR2FLYkd5R0FDOXN5NEJkTUtTY2t4UW5aUllEZEVl?=
 =?utf-8?B?MTFuNmphaTlwT2g3Vk4zYVhudmpTUG1rR1RwQndHZkpIeGpOejBGR3NxV2t3?=
 =?utf-8?B?WXFXV0NwREFEZmt3elVwa09LdU5jck1OVW5HZFBoeUZhakJjbCtBWlVNd0g1?=
 =?utf-8?B?b3NCTS9lSjFxMTVoZ2IvMm5zMW1CdWF0QksxaHI5N0FRaStKRUdpejYwQ1Ur?=
 =?utf-8?B?ZHp1cTllT0ZIVkFlSi9rMDVaMUtrL0Y5bEhsaG1LNDdMbnYvMjZuOXdpZGtS?=
 =?utf-8?B?OW05NnkzcWloYW5wSWh6MEx1VHdRT3FITS85UWp6V0VQVkM5MVlhdVl0d0Yr?=
 =?utf-8?B?SG1vOVVybXVmK0x0YmQvWFVoeUpRcnFLMm1MVnNRa1lUenQyVnNHVEJUMFcx?=
 =?utf-8?B?VDduTnpXamx0dXRZUmF1dkYvckdoZjRGbUNBVmI2TFJPZHcwbTlyY2JNckdv?=
 =?utf-8?B?SHJWVHdob2RKTlRucjJzVkUxdFR0czE0a0oyQXNOQ1hCZ3hkZ01UUWVCdkVS?=
 =?utf-8?B?OVR5THhzV2szMXJkandCRjh5R0YzbVduRzZ6UlpRY1hvVUY0SWJhclhXaTFn?=
 =?utf-8?B?MTNKSElGVzVha2c3Y21GbVp6U2xlTU9zZEJZUEdSQVBBVnE4Y1U5RDNYMDJ0?=
 =?utf-8?B?UnJVcHkvOCtRQmZ1Nlp4UTRXcFRWTEowLzVmUHczS0paMm5rU3hHVzI2cUhI?=
 =?utf-8?B?L3VTMGR3anJXVVcxRDRMY1NCSzdHR3JUamVram9BU1FUVWhXM0FYS0dxM1hU?=
 =?utf-8?B?a0RLVFNQUDRvTUQ0YUlQaVFqNG11N0dzR1JwWUNOcThqRFRTTFVkZGJBU1ZB?=
 =?utf-8?B?eVBOMEV1MEtndUVwNHcrdDB2Tll2bEdScEorQXZHWm54a044QXF2U0Q1RFY1?=
 =?utf-8?B?TWVSdk1kMkFFSHQwb3Q1aUdmemJkUTdzRm9Qa1VkYmlYTkRaNXdMRmRRSllE?=
 =?utf-8?B?a205bHVBK00vQndmRlNrYS9yeGQvcXFGZllKM2xIMGlHaitYbnBRV1ZPWTBo?=
 =?utf-8?B?YXZ2RnRkeEJDb3FqeHFQeTY5cSswbmhkQXJ3NHI5SU0vVHpxcllyWXNZM3Ev?=
 =?utf-8?B?ZHZEN3dndkhDS1VjbmxYMXBVSEVuKzEzRWJLNGRsY0tQTktMai84d3N2aTA5?=
 =?utf-8?B?bi9OaUFBVWJWclpXckpiMzdVcEZVMjV2M2o3cXZxRlk1S3hLa3VoNGlLeUNi?=
 =?utf-8?B?akNKSHZQeFFZS3JDZ2lhSGlDcnkxSTJBQWo3Y2ZMM1BKZzdPQitlU2tOV2Yy?=
 =?utf-8?B?WWxuaHpHQWVneElIOFRyV0RLRDF5aEdCcXNNSGlnYzRTMG10ZnU5S3BXcUpY?=
 =?utf-8?Q?/FidkEEDvQlnX3g8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 719d20c5-869e-460d-b4cb-08de62a2dd8c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 21:34:37.6581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3vCPtj2P9xSD6ygiVWiUSmRzcWCQ49Vgn0ni8Nd9HbaZSzCDzKCf4J3lu34nTIP8lmqTLHcQ1CnSedyKuAgsMCnd8OoSETx50/CsAprKTb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7338
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



On 1/29/2026 7:57 PM, Michal Wajdeczko wrote:
> 
> 
> On 1/28/2026 3:54 AM, Patchwork wrote:
>> *Patch Details*
>> *Series:*	drm/xe/guc: Make MMIO communication more robust (rev2)
>> *URL:*	https://patchwork.freedesktop.org/series/160377/ <https://patchwork.freedesktop.org/series/160377/>
>> *State:*	failure
>> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160377v2/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160377v2/index.html>
>>
>>
>>   CI Bug Log - changes from xe-4456-e8c6d90736933d657ba897686e407f5b9a5058a8_FULL -> xe-pw-160377v2_FULL
>>
>>
>>     Summary
>>
>> *FAILURE*
>>
>> Serious unknown changes coming with xe-pw-160377v2_FULL absolutely need to be
>> verified manually.
>>
>> If you think the reported changes have nothing to do with the changes
>> introduced in xe-pw-160377v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>> to document this new failure mode, which will reduce false positives in CI.
>>
>>
>>     Participating hosts (2 -> 2)
>>
>> No changes in participating hosts
>>
>>
>>     Possible new issues
>>
>> Here are the unknown changes that may have been introduced in xe-pw-160377v2_FULL:
>>
>>
>>       IGT changes
>>
>>
>>         Possible regressions
>>
>>   * igt@xe_exec_basic@many-bindexecqueue-userptr@bcs0:
>>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4456-e8c6d90736933d657ba897686e407f5b9a5058a8/shard-bmg-3/igt@xe_exec_basic@many-bindexecqueue-userptr@bcs0.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160377v2/shard-bmg-1/igt@xe_exec_basic@many-bindexecqueue-userptr@bcs0.html> +1 other test dmesg-fail
> 
> <4> [527.456421] xe 0000:03:00.0: [drm] Tile0: GT0: Check job timeout: seqno=4294967292, lrc_seqno=4294967292, guc_id=2, not started
> <4> [532.575325] xe 0000:03:00.0: [drm] Tile0: GT0: Check job timeout: seqno=4294967292, lrc_seqno=4294967292, guc_id=2, not started
> <4> [537.693881] xe 0000:03:00.0: [drm] Tile0: GT0: Check job timeout: seqno=4294967292, lrc_seqno=4294967292, guc_id=2, not started
> <6> [538.335399] xe 0000:03:00.0: [drm] Tile0: GT0: Engine reset: engine_class=bcs, logical_mask: 0x1, guc_id=2, state=0x209
> <5> [538.336026] xe 0000:03:00.0: [drm] Tile0: GT0: Timedout job: seqno=4294967292, lrc_seqno=4294967292, guc_id=2, flags=0x0 in xe_exec_basic [10427]
> <6> [538.360634] xe 0000:03:00.0: [drm] Xe device coredump has been created
> 
> but I couldn't reproduce it locally, so lets rerun
>  

can't find email with CI.FULL (rev3) results, but they can be found here [1]

[1] https://patchwork.freedesktop.org/series/160377/#rev3

and now the only unrelated 'regression' was in:

* igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3:

(kms_color:2305) CRITICAL: Test assertion failure function run_ctm_tests_for_pipe, file ../tests/kms_color.c:835:


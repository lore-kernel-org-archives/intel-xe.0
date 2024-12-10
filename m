Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D3CE7717F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 18:02:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D030410E16C;
	Tue, 10 Dec 2024 18:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YVAjOLx2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2800410E16C
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Dec 2024 18:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733853776; x=1765389776;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ch/ptaxmMi4z4qWn3RvvwI3nQxBkSzjOFSbK+RRW93s=;
 b=YVAjOLx2lYYR/2KABKrPc/4oQdc9f6HJdyIFPB5zdGHZqNuJfYmB6ac1
 jkphoQ5CgWymf9TinTZvHOcfH5EzTzBEKDVdEdIt0Q2QbyZ4gnH941cZz
 cZMy2+n9dGG6b+/0H8PU4BwhRPJSggiHnisy4uzWJLjFW1lINQ0O3jKEz
 UYi4NbU5uiDWRjrHcsF0LKgQZXUUI+u79yPxMb1YBCoYEc8D645JJ+MNK
 XGugDFBfe3o6ofQS0DRyYlAj3t9UWfEGnHjv5WOiMs+vNIVwfYs4iZWMZ
 dk61+9F0ha050nK4XB5cNILPB7J3trQ5/im6kyBcQ4c1TcpedWOCX1qCA Q==;
X-CSE-ConnectionGUID: VjTY9mBWSausx3DSw7fP+Q==
X-CSE-MsgGUID: nqPWwcu1TXusbUEo/1cNgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="33547750"
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; d="scan'208";a="33547750"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 10:02:56 -0800
X-CSE-ConnectionGUID: V1LdSivwTaeAcX2M9bVyLQ==
X-CSE-MsgGUID: W2pnDta6SxmuPEEum8ERdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; d="scan'208";a="99541933"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Dec 2024 10:02:56 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Dec 2024 10:02:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Dec 2024 10:02:55 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Dec 2024 10:02:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nTDHGR/Do4NSbRaOa4JDhQus7uDxihsi7IKgPNjMwnZkQWQ2uxVnafo4zlNjhbeecx/ButK4+1lWVrpzZecMn4VrIXe71S3sjLPADm5o8oFMYv1CO8GxZ0Vft1uClVg6T0UcunTstQVp97pvcc9QNDyZTXFEtGtxNeu6QoHWN4h9dRDq3SV18ueuiXeKgSoh58EtYbbgFXulrOBhpXJBtxpEhwuMpAojBfGSYpBUeOI1huak22Efs1ztaJXHDlqw+EsSlwommoR37C3IpjRGkI1mQNnQjZfmXKrre5cN35i9Wz7s/Boehxz/rKEh3wA3Ny9ugoODZtNYjGeT5hjVwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ch/ptaxmMi4z4qWn3RvvwI3nQxBkSzjOFSbK+RRW93s=;
 b=dMghWkvGsXrWXXWDi7xaiQj10TUnnky+HqzUnoldvvvQ7+hUYBRRN1k8zLE2bIPfZMXU11zvXnY4IeMlrMPC+K14MrmTiSF4t1NcJOpJwzHaqMf+KpC+mAJa1glD1SEkWT1b9rqCjOBw/31GMHZ0H6Ck+grt3VLYjsS1Z0Or+a4XhsArxL8431fJ0B0a9zmKLR7t7Csl73SsnHe8vHnZhLOAKLm7zWaCvBvYHayIca38LUpkmrMh7A3rVLCmHVyqyRHcHDww1qqvwP4e6Fvv2L3RIo/YTdNowdOJx0B3Rp9S8miwGiASyt4f6/eOYgPoVQwDjf2TmpZAJECNJ6uxsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by SA2PR11MB5082.namprd11.prod.outlook.com (2603:10b6:806:115::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 18:02:36 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02%6]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 18:02:36 +0000
Message-ID: <081a4049-9a67-48a3-935a-332edc700ed8@intel.com>
Date: Tue, 10 Dec 2024 20:02:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] drm/xe: Defer memirq init until needed
To: Lucas De Marchi <lucas.demarchi@intel.com>, Maarten Lankhorst
 <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
References: <20241210083111.230484-1-dev@lankhorst.se>
 <20241210083111.230484-7-dev@lankhorst.se>
 <5kgerssh6hqzxwbuh3ixwfvko4hlfv56qs2wjt754oy2zcnmsu@vfou4q5iq6dg>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <5kgerssh6hqzxwbuh3ixwfvko4hlfv56qs2wjt754oy2zcnmsu@vfou4q5iq6dg>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TLZP290CA0006.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::16) To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|SA2PR11MB5082:EE_
X-MS-Office365-Filtering-Correlation-Id: ecfe2374-2f03-4c38-0763-08dd1944d3fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WnJsTDBScmJ4TEUwa2IzSkg3S2RuR2Q5R0JvM0greWhlY1hZNk50N01RSUFU?=
 =?utf-8?B?ZmduRkdCZVdGRFFIZVdiUjYzY3hmQmdxRjBtWllUL2NhZ2w5anoxLzFWdkg3?=
 =?utf-8?B?cTFobGk3YVViQ3I5WlZXdU5ZV1gybW51NnFFOVVMdmhqM09oNThUSTF5VzFZ?=
 =?utf-8?B?YU1TZ01JZ0g4dWlhNWhEWXBsQWdBaXplSzhVMC9HUlRiaTNQVXMyVGFjZ3kx?=
 =?utf-8?B?cmlONEthaEZjbmUrbWVER1R0Q3ZaQzQrd2I2emw0U1hvNHl1VC8xaldKK29o?=
 =?utf-8?B?aEpUNWNxMFlCNU0vemxvVmJ3ckRsUlRjMStPR2FTNE1lOVF0VG9lUXp5Q3h4?=
 =?utf-8?B?NXV2ZlN3ZDcxNWJBV3g5MlgzcDNCTytBQ3Z0MnViaUhnM3kyQXpacmcwR2RE?=
 =?utf-8?B?SXMxdVJaNGh5WUZiMlUxVzEwVjNTbFBDRURmUmJQUXE1OWJycUNkcS93ekVS?=
 =?utf-8?B?ekFzTFdxbG5HN0ZlR2ZRUmk4ajhBWWxad3N2bnEzSHFscDNyNmZZbzZvMGVk?=
 =?utf-8?B?NHAwTzRKMFltUjdtdTRoR2hoSEhBNk5FM0oyakQxSFM4TVViRnFDM0pXSVl2?=
 =?utf-8?B?dkhhbkZpemlyN2pKMHNmL3kwejhkd21HSjJkU1h6NUM0NjRxNGhRV3lGL1pw?=
 =?utf-8?B?ZGJzZFBmYmlIR3I3T2dLRVJYVUZGeTdsK2o4LzFublpkaXRvUG5aTXJ6d0Mw?=
 =?utf-8?B?d1VsN3VJLzFKYVNkZGxTbWc3ODY4U1NoalZYYVBhQkZVdXM2eXh4bERUbFVX?=
 =?utf-8?B?WVo4anB0dWV3aFpLcUM5SmpZRmVxRzdaMXRISTJhUnBOMmpwR3RRMG5IY1R1?=
 =?utf-8?B?U1RvVWtldjJ6Vk50dUFGTFI5M2dWNFpKZzB6b2hHMVVmOWlDMDJIYUk2T0ox?=
 =?utf-8?B?UlZRRXBBSXY3OFhvSVlSZmtxelMzYjVjQlE2czh6RElSbi9rcm1kcW01YmNC?=
 =?utf-8?B?VzIxaDN2aWJjM0pVR0ZFckljZkQvckhySWJkSnNLWDlEWldwelBZUDVUZmI5?=
 =?utf-8?B?cTNJZExKbzdXV0xvQjVweGMwRUYybTdLd09zMFFndFpOUVp2aG9laWxQOWdI?=
 =?utf-8?B?TjZFV051Z1BBYk00S3RVNUdTMWRFdlZPMFNadnJPRHdzNGpKOHdVc2I4czdG?=
 =?utf-8?B?QlE0eXQvL2E3MGZacm0xTmhaU25BMkVDMkwrejNVR1laVEFOSi9nRHBka0li?=
 =?utf-8?B?SkZFR2tjc1dFSSt2RFZ3OFlCWFdpa0s3TGZZV1ZXNG5LTFl0R0UyTjFWTjA3?=
 =?utf-8?B?Zm5DSENjRGZBcXRRcnVZZ1p5VDhEaFJ5eWZqU2tKZVdpTmRoQXYyK1hYb0pn?=
 =?utf-8?B?UlpJbFBPS0pkOWNtRHdNNEVzdm5PT1VCODZzQXBIR1BtWERLZ1pGUXRrY01F?=
 =?utf-8?B?eVhETzRXbkNYNkl2U1EzazhCbnFoczF5dElSMFJkMTJxblp1SHR2bkRxKzBt?=
 =?utf-8?B?bDVTUGpBL1JIWExwTFdIdEdrMUdLZ0c0bXNnc3Ftb3RzWXVsUWJjYWtiSTF6?=
 =?utf-8?B?d3c1ZlJsSEluaHhBK0Y1NUFQcEk1b3RHQVZrSm9YZ2JMQnFWSmtsQ3QxRjh5?=
 =?utf-8?B?dmlNdngwKzlFNDU3aHg2djcrMlpYS1ljMFMrWmFXM28yTUFWejBNMVNrSWNU?=
 =?utf-8?B?MnZRTnkzOFQxRXRiaFNtUUFWYy80a0RkWlhxSlExZzdYUVdVZ1ZQWEpCMGk4?=
 =?utf-8?B?LzRBQU5TWUlPbWJESElBYW9YN1E4TUYxM3F0T3BXY0MvMVFvd0EwdGdCRlNO?=
 =?utf-8?Q?sSetwLo7HqcPtNZf4o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkxTRWxOU0JsWEZVNEdUeXNDNlRJa0t4SDE2a3ZSMkZtRFJwT0hjTmZKb20r?=
 =?utf-8?B?cTg3Mk5HTzRzYXFkK25rT2ZNTm9VTW1ybDZzRWJaNk5LVTM1aDdTS1pJMnhR?=
 =?utf-8?B?Q3MwTXlVMGs2bmhLQnZDZkNwTjdCSk1VV2NtQ1V6Q3YySkZPSlh0SVlZYnNQ?=
 =?utf-8?B?UWRCS3VuZTBEaWtCMFd6MERmdnZyZU9qdkNGa2pkaVBONkRlR2dnUVlvMkcv?=
 =?utf-8?B?RFIycERsbXovbDlKU0NUTWhxakpGcnZ6bFhWU3hkTEE0VEd3ZjJ2eVV5UnhO?=
 =?utf-8?B?L3NTbUIvOHZCUzU2dVlHa3IyVDdMSXJhSDBqTS9xL3l1cGs5YnBncC8wOEdD?=
 =?utf-8?B?bk5maDFhVVBseGRMR21PTVYrSmdLR0hnVGNPRGVNT3paYTRmQXAyYkh3c1gv?=
 =?utf-8?B?cWF2VnBXbGZld05KZnZqZU1mSjlHMG9FanRyN3pGTEU5aHJIZlUvQ1RMem03?=
 =?utf-8?B?d2lXU1B5WG5BZEJaNlE1cTgrakRiVXc1TnFCRytaYW5rdng0eG5GTjVDOXdq?=
 =?utf-8?B?Y1hVT096YkVxZ3lReEEvdUE3MEYyclFOUnhrakxRYW9wNWZVWGNpMnJoeVV6?=
 =?utf-8?B?SWhmdkRnRStvQStqK09ZUE5adG9JZEh2Zjd0a2xTRGNBeW1pT2pPcUdGYnMv?=
 =?utf-8?B?V1U2OTBhOG9RSVFTemE0ZkRGc2w5NlBWdVMraGRIbUlxVmZGc0JkekVZcERs?=
 =?utf-8?B?cFF0QmR5QUlOTEtiRHJxTXNpd3VLYmtMc0xCQ2k1MFJpc0xPR0syL0h4emp5?=
 =?utf-8?B?YWR6NnpoM25XNWcranE2WjRPQXZ2MEIwZGQrVjdxZUNDTnF2elVSZUVzVDh3?=
 =?utf-8?B?d1hRZnRZVm90R0M5U1A3Q1l0TWFCZlR2MU1KN2VYVE94a0tDU1dtUnhXNlZD?=
 =?utf-8?B?RmMrakJGVDEvbFZBbEJPUFFPOTJlamRGQUpuVnl0SXBFWEwremRKckY0VVRD?=
 =?utf-8?B?UHVXRHl2cXlkd1FLNExrNU8zb2h3MEZCNzJ2azIzK3luaW5WQWNvS3d1eTcy?=
 =?utf-8?B?dkd1aXhUTHhFNjdGUUNjeE01dXNMd1lpTWlJY09pY0ZoNkQ1ZC9jZ0s5dkc3?=
 =?utf-8?B?M3VWSWJyYm9uZnFoMVF0Q0ZtVVlubzhuWEtRY0FkSE1Wb0lCM0hQTTEyWE1a?=
 =?utf-8?B?NVpveHNKWWVhTSthd2IvOUlzaklZcitiYU9uOHZRdWtaMFJyb3dPUUNrU2tx?=
 =?utf-8?B?SDRFbU1vQ3FVbGs3d1F3RjdmOHk0NDdsQ2kyQW55dmZuWWhSSWorVjNYMW8v?=
 =?utf-8?B?ekttWngzRGFva01hRllCcmhHREpTK0hyRjVtV1JNdGNwMWJqVUpaU3lDODFv?=
 =?utf-8?B?ZVp2R0RIUi84RkRZbDcxOVF5NjhoSU1sYkpvSzBCSVRuNXlKRHRabUllNENN?=
 =?utf-8?B?WkZPVXZGNjZlMlA5QzdQWURZeDNLcEFWdUpnSlJBV3kvZXljTU1OUkN3RGpY?=
 =?utf-8?B?ZC9sekVObEo4RWZuUUYrYUF5d1lEcDNSZ29ZM3ZZRVU1QXNDaEQxelhrVUJ5?=
 =?utf-8?B?L0hvRXd2Mm1kUUpPU1dCdTBJMDhzY3VucUErbXArTGs1LzVsTjhvUVprTUZN?=
 =?utf-8?B?L0VVbGxmTjNLeXhRRHQ0VUxhd2hTbStOeDBTdHUyR2JyN3R4ckg2SUhSbTRu?=
 =?utf-8?B?akNNdVhsK2lSRVU0ZXdXQjYrYm1tcitIQVFRV1IwcjR4ckFvL3VXbjNRdkhH?=
 =?utf-8?B?UEZ3L0hoa2hpTFllTys1VGpKYVcreFZYTXlVRHovVmxXRW90Y2N2bWJFY3ZW?=
 =?utf-8?B?alVDWEREemhoelh5T0YxLzFFM1h0bWh0S2RrOWR5blVpWmRTcDg1T0NMbFhv?=
 =?utf-8?B?cmNiWEZOZnhmOVVhMGJFaUJyNVRCWFczOGd6RGU0aWIyQ2c2Wi9iSHlDK0J1?=
 =?utf-8?B?bzRuTXN1RXFtOVprMEFycUhWWFpLYnFtLys2SmhsZDl6cWRVK1FmNVlMTnpQ?=
 =?utf-8?B?UjRYbnV0SzVwS3NBVVBNa1lsMytoUjVNcHJjM3RlMjVmRld2a0I1UjhWZldS?=
 =?utf-8?B?amEySXB2eTdSU1J4SGJpT1IzNTVIMUFZem5yVEljaS9EZmYrSjRCYjdSQVZ0?=
 =?utf-8?B?bklTNmhMRTdib1pTbnhoN2FNV1RETGg5V2pBd1RrdmhNQk16Zmt1TS9Fd0hE?=
 =?utf-8?Q?AnqBaKBNeM70OI45H3bGcZUvS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ecfe2374-2f03-4c38-0763-08dd1944d3fc
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 18:02:36.4777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cJvDZ8ia6E+OoS5SO4+FBtCnJdSNaz9zfjpGAbGgMqHU2tW7VKmC9N6yzSQ3vYDD/NDoIpdRQ4sbDq8u9PBEhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5082
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

On 10/12/2024 16:30, Lucas De Marchi wrote:
> On Tue, Dec 10, 2024 at 09:31:06AM +0100, Maarten Lankhorst wrote:
>> memirqs require allocations into GGTT, which we cannot use until
>> after display is enabled.
>>
>> Now that the initialisation of interrupts is postponed, move memirq
>> init too.
>>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>
> Cc: Ilia Levi <ilia.levi@intel.com>

With regards to memirq usage in MSI-X flow - looks good.
I checked this in conjunction with https://patchwork.freedesktop.org/patch/628026
(perhaps it would be beneficial to reference it explicitly in the commit message?)

Reviewed-by: Ilia Levi <ilia.levi@intel.com>

>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
> assuming the first patches are applied first.
>
> Lucas De Marchi
>
>> ---
>> drivers/gpu/drm/xe/xe_device.c | 4 ----
>> drivers/gpu/drm/xe/xe_tile.c   | 7 +++++++
>> 2 files changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index c9c0b74c74ddb..4c46809472ae4 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -41,7 +41,6 @@
>> #include "xe_hw_engine_group.h"
>> #include "xe_hwmon.h"
>> #include "xe_irq.h"
>> -#include "xe_memirq.h"
>> #include "xe_mmio.h"
>> #include "xe_module.h"
>> #include "xe_oa.h"
>> @@ -675,9 +674,6 @@ int xe_device_probe(struct xe_device *xe)
>>         err = xe_ggtt_init_early(tile->mem.ggtt);
>>         if (err)
>>             return err;
>> -        err = xe_memirq_init(&tile->memirq);
>> -        if (err)
>> -            return err;
>>     }
>>
>>     for_each_gt(gt, xe, id) {
>> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
>> index 2825553b568f7..d07c1fba793ca 100644
>> --- a/drivers/gpu/drm/xe/xe_tile.c
>> +++ b/drivers/gpu/drm/xe/xe_tile.c
>> @@ -10,6 +10,7 @@
>> #include "xe_device.h"
>> #include "xe_ggtt.h"
>> #include "xe_gt.h"
>> +#include "xe_memirq.h"
>> #include "xe_migrate.h"
>> #include "xe_pcode.h"
>> #include "xe_sa.h"
>> @@ -179,6 +180,12 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
>>
>> int xe_tile_init(struct xe_tile *tile)
>> {
>> +    int err;
>> +
>> +    err = xe_memirq_init(&tile->memirq);
>> +    if (err)
>> +        return err;
>> +
>>     tile->mem.kernel_bb_pool = xe_sa_bo_manager_init(tile, SZ_1M, 16);
>>     if (IS_ERR(tile->mem.kernel_bb_pool))
>>         return PTR_ERR(tile->mem.kernel_bb_pool);
>> -- 
>> 2.45.2
>>


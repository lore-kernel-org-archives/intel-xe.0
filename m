Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40948CD8CA8
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 10:28:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF11C10E22B;
	Tue,  9 Jun 2026 10:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OOhRIUYG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B59910E22B
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 10:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781000926; x=1812536926;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w15yIWDXq8qSK9sLRDmygdp4X2lC+MaLMXYBhF6kFfE=;
 b=OOhRIUYGz1KD8Zg6lYxFYX6nJkqhTZzXd39EEpTSnWBmZG8UmldCNQ1l
 QIj7uwhU94WX8LQDK1Hwd7jntqLBMKyLRK9EP4rsPUqhxtJA0DdcQWtXo
 exgXzF4MmVAQhW2lN5eUwQfWdoGZ7t41gYNkRDwE+k81iQwA/r1XiG+ow
 gg167ep39YoLTt+y6PHpSWKZrYJKNpZeOqR0vc54hO9YJ/NSWhDgHtUV/
 b7rqyitKq3t4x2IL29ekdb+OtVWu6dbW/O1xtrtM4ipGMBW1ZwLq8e6yG
 5yjJpmDF6AWcJmK7/XJBcnFeqzDOvruxFBfUu6x353ExO99g/XbZrnYKv w==;
X-CSE-ConnectionGUID: StTqOad3Q3iL9K5onuhPVg==
X-CSE-MsgGUID: Kl+QvqC0QH+q8+etDVj0YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="99332972"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="99332972"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 03:28:46 -0700
X-CSE-ConnectionGUID: MkOXqbnyQdGwarDlrf2noA==
X-CSE-MsgGUID: JUWnHuf3QbiQvN/eOUUBpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="241660227"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 03:28:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 03:28:45 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 03:28:45 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.67) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 03:28:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mnsnd6eMHndbsZrScvURn6Z40HV64ml+r9tiDBhFz9s4h9AuOVT54GT27KuhVv36DzXEob5xYx/bQdjox7dCzWrsIWwgdOKPTq/A+cBW17kSI8Bmn7LLnxsj7/VVZJ0V8tv6IE/+kkjDGqo1shSfjpbdxGyYnIYyERRwUWrxu3F3I1ke2Cq5gsPFRGW/puoCzREkKqPYt5jBF+g1Rh007wALvEBSyIzWgTUFAZ2XgmsNLp/c3tdk8bnajjOYWdVTmztQtaRM3cn65Bb+3D0t+ucZLsEPIHC1uz6p0NVXjsnol+7jcdGPvr8cL9LSfGL51pxzwA3i1Fpxy6Ht/gn95g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8eoAphNR2SxywZguEQAhL4fdv2E1Be2Pr1rPXBrN5s=;
 b=PxerOQ0Ke7Y46DKR8q9bEnY65ecUSIFzEyx/65wkIa2Xl4zBINZw1KUX4ruVI02tZMPEFwtuRtDh80qcK/4ZGZxdLJHZLFdVCYU+fCpxStaB3nQgdqi++M7q20p7PYXARI8Eosm2NxTrSFBPjs0oNaOlDgtQ5HA3zg0oTu0kdR1zQFh0+1onqfgoXN/AfzzqzcKoRRqmtkcnh4mjvhYAkEIrBNIMOFIl3wA1K3F35fz3GODYLUoFujCV2HFQy84L/4rx2dH09c7HrI6cVr8nOextdklu96PplZdbPLgFlY18Hgwm7dqY9gF7Tb8TmDuE1eo3CNKd6wXWqIiHmFinKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by MW6PR11MB8367.namprd11.prod.outlook.com
 (2603:10b6:303:249::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 10:28:42 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::a3b:efa:42d5:e983]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::a3b:efa:42d5:e983%8]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 10:28:42 +0000
Message-ID: <9f9ce7e0-e5ab-42d9-84dd-e2e33eae5b8a@intel.com>
Date: Tue, 9 Jun 2026 15:58:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/madvise: Skip invalidation for purgeable state
 updates
To: Arvind Yadav <arvind.yadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>
References: <20260526135447.2973029-1-arvind.yadav@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260526135447.2973029-1-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0232.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::16) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|MW6PR11MB8367:EE_
X-MS-Office365-Filtering-Correlation-Id: c5d55108-ead4-4350-d9fe-08dec611e0b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: LWF+GLXrOr14iPU/bedFIVUfIyjyueJp6+CmcRmWgRu8ENgj9lm0Rw5Ynrz63A0b4OHZGI9Qn50ajYMClCs9kYDfGT+vKjxLQdulrVwdLKjhs0zJlKcLcYEIjCm9p+huhTD1Hk6f2L0+IoxVphPt9GxAQ8KpJiDuuYSFflReDBvj3TE953Fe1zcgm0TrRKAeSI37f4RTnGmVDSMyKoQhhYcQDPFFP59t/FZ0kz8IVcw5KfOOhhzWCiYjylctzL5Vck9SYxM4y4VtiVmNdgBhJCzFX4uShR4aX8QCm+hfoQkvBkdhUZbtDlgnBFVjKu9X92f1/IPFUmhSF8XoGGZa8PwlpmObxi+HSewU+Qaj7Vn+bAwiP3ZPS+LKtuGXZVw4wTa1gVYeNUngsZNS/XVCHiBY2483ULbDuAtXFCIoaER63cwgRxLm9vLqQHQNe4YLcOTLGQBW6SFiQ/Ub5mxKOV8TduG/cbc4WZgDApsNStYSLyToypj4US3GAE+J6rEhHj4HDQ2Gc+NMWvDLnmthtK2srYsjR8KY2HbNg+Hw8M/p6cgs/cnDLFpl/HTU1jX+dzkdeTuKIHQ7Zn2uH8p2ryXiiFmklD2djMEuSqXhdGKMtJKI1tzJ/DBK3UI9kSxLQAZdu++9UvZiTrMkMQjPqSnRLf/fn2FwKDjcczNKg30NGQvy6SnECvKzioI85Yvm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEVDYjQ0UnFnV002Y0Zxb0J0dHkxTFp2NEgrMmg3TjM5SFJyTUpKWTB1NTZh?=
 =?utf-8?B?VXFtQmRNSlF3L25nazlRU21TY3J3R1RDb1JNMHp1T05ZNEZGK01ObjFkZTNF?=
 =?utf-8?B?azdZQ0pEbC9VdmF2RU9KRzFJelI5Z1RkUHFuQWxrMm5pVm5GY1lScFFoZlR3?=
 =?utf-8?B?elpkeHlFeDN5ZTFFdzRCVjk4elgwZkg0STBpeUkxNlZxVElDU2hZWnh2SmVX?=
 =?utf-8?B?Zk81SFNWTEpSRUEwbG9RZk8xUEQ3S1J1bXg0aGQ4U2dYdGxlcUtqMkd4RWlx?=
 =?utf-8?B?VitWTC84ZGIrRzZ4aVVFc0xPZlgxNGRLMnZ4RTJ0MVhjNW1lQkEwQ0p1VmVn?=
 =?utf-8?B?YzdVejZvelF1NEM0RStNTmRNalBweGNyN2ZnajZDejlXSXNhN0xTYmNQOFdG?=
 =?utf-8?B?b2RqNXJqTkc2eGxsbzNzM2xCV244cXN6SmlXVmhqRWxiVFRqT3lNUDE3Mita?=
 =?utf-8?B?UkxYUlZYMDlKNm93cklWcE1nUXRXM2NxZ1JscFlNSVB3aDMvTFM1RjJIZDBq?=
 =?utf-8?B?TXl0S2VmSXcvYng1aVVoaFhNYkpSSFJHUlA3aGhNSFJ3aEV4V25PNWNuTGZx?=
 =?utf-8?B?UGN5NTFOY3RpdVR0ZXAxcjZlTFFwMjAvMC9OYTMyNlh0SXRvSEdVWm5tRkZv?=
 =?utf-8?B?aFBJN3V1QjBsT3ZxRS9Lck1ZYW1oNjI4cmgzY29yOFpTL2tWS0N0M3dGZ2xl?=
 =?utf-8?B?TjhiR2Zwb3hveTh5RXBwSkhGY3VNNXpRdmh5RFBiMEt0RFhXYlhjZ1g1bnkw?=
 =?utf-8?B?Q1BCclhNUmhVb2JHOEVQczhEMFJpYmM4d1p3bU5oQzVrcHN4SmNQdVRPRmpK?=
 =?utf-8?B?RnhBdFVMZlZ3U1YwTkY4c3RYSlNOSWZUQzFZeEtQeHRCcnpxa1N5YUZwRHQ3?=
 =?utf-8?B?Vjh4MVRnem1NNUFYVjlUQTd4S29DbFhEYSsyUkVZeGcrL093a2pYcFdUcTZo?=
 =?utf-8?B?ZVZ0N1JlOENnM0hwL2swTk5wVk83cTJpYzk2YmN4NExDOTlYYWVWT0hxWTZO?=
 =?utf-8?B?dnI2ekZzcGVJeEN4ZHBHTXI0M1V3WXZRR0JyMStoQURMdUVHUHI1VE41TUtu?=
 =?utf-8?B?RkRlZXJmcGc3Nm9remZhRmUzcnJrNTBDSE9QTk4zK2ZaMGhaVEJuSHU0SXdN?=
 =?utf-8?B?bVNHUFVxTVNwRW83dHpPbGZybnlJREtYcW13MTE0cDZQdEtZQTF1TTVXNCt4?=
 =?utf-8?B?RE92ci9mZ3F5eFNaS0l4Uy8xZEM2c1htakFja3VjWmFqaEgvZUJFRzVxZ2cv?=
 =?utf-8?B?aFM1Rndid3FjZ0loYVlrWjZCTllJZm5jbXd5Snc0d0pHbno0ekc2aXZhK3hS?=
 =?utf-8?B?K1ZFNm9oNW5FSC9ET3h2U2NHOWUvM2tUeitzcFNBYXhJMUd1dlVpQTZPWTNH?=
 =?utf-8?B?MVlTRGhFT2JydFlFV2FyMDNCSXdrOEZldms0OXFMWnlMdkRUMHN0dmxFeU1O?=
 =?utf-8?B?Z09TQlQ0UGtpTTQzRlo3WGpobVdDTkZ6Z1UrYm5ubzNLdVBmS2VDTzJ1T1d5?=
 =?utf-8?B?UzZoVEtYeVQ4RjdoSEFOUWxja0VIaHY3ZWNkSnBzTGIySnVESUtTSTJ4aTRa?=
 =?utf-8?B?NE1pakpRQVU0YkppYmM0cUxiOURrVmdVNlVLc29vK3dUWjg2TVNGRld0bklt?=
 =?utf-8?B?ZHkvQzRjVEczLy9WdnNVd2dvWmdjTFI4anpnY2IvNkdQM1BrdWgzTlFXb1Bz?=
 =?utf-8?B?RW90SjlvZitiUStJQ09zUkxlZ2lNWEhQZWxPZUQwU2pMM0h2N2IwNmFCQ0hk?=
 =?utf-8?B?aXMzZUVNNkg0eU16RG15d09rcEFXYkFmcUNWYlVxbTVibjZTS01qZ0dnWGRw?=
 =?utf-8?B?Y2pwV1diMWR4cTlmdUpkcVFGaFZHZVhlSmhGU0V1ZXhpZERIMCtEdDZ6Sm95?=
 =?utf-8?B?ekFjZ05nZWMzb3VJTmRNS0h1MXkrb0RNOXBKNXVQZEY1NkpXTTR3TlhSaTdu?=
 =?utf-8?B?ZmZrSnFkbHgyWXVCOWpudDJ3WWU2ckk3Um9jcVBCUUxNaVFRRkNlb3YyMXhl?=
 =?utf-8?B?V1d0dnp4R1AzY01xUktWQ3NlYm5nNVUrLytHaXJqMWZ0My9RWCtnc2FzK1Yr?=
 =?utf-8?B?Rk9IK0lXWnZ2b0NweW5ZcVdVUEh2VXhpMEFvS2MreXBXU3BMYytxRWlESVQ3?=
 =?utf-8?B?QXNOZTRQWXF0ZnlzT0RqcWxET2JPZGtJSmhheDFSd244eXFXUjNGdU9DRjd2?=
 =?utf-8?B?aWhLN0FkSDY1TzVBelJxOWswVnJ1WmlBVlpBL0tNUHp2QnVhVVNIRzkzMURM?=
 =?utf-8?B?elFxTjRUSGNtR2pzTVQ5ekJCWUFCWURLblFGNWFSdm4wRDR2c25yZGlDMTNT?=
 =?utf-8?B?WGRIT2NFb3dVdGdUUXhXUEhnSWs2NGs2QklyV2RuSlRxd1l4VFIzU2c2WnRD?=
 =?utf-8?Q?fsuSdqUCLZOwQoeU=3D?=
X-Exchange-RoutingPolicyChecked: cB8V2X1ilqPOGXThMXpKZJ0Cr7X8cFyEXiBXpQ4Nun+pov0XZLVBRUjuVf6gv1Uh31CXI6Tmj8VzSnxZ67Ni2HGktMTS5kzDOgQGt/wiYJaAB6D2oiOtOl0yPX/RlEPf7n2jYfIjqZ6JxMbLMQWMLQbLNXp/H7IcccOWRAXDTwfz7hkyo9gFnxNL9WPm2/goPRnpwoVmtDXRCqssqwskaGMUrHQjFCpwiWgz/I1Ps6w0WCAJ5T1nmWRl+PYqSg7qMeeLZXnQEO9yLqlOPHVoojKxq+rvsYOD9fb/R0IqrTjj+/wYuX4bQvY0+PShEoyl1kRPnhC/oWXWkkUqcykr8A==
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d55108-ead4-4350-d9fe-08dec611e0b1
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 10:28:42.1085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K/L1jWOb6pttLe+3q3Xh4kcjy6+DtsMnogkU5taTYf76O+BdUQrdQqtm+MMoQjuIJqSoIxPIQ+yfSZXNaXyOGYZ4dnAIBgqkRfgYayBsa3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8367
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



On 26-05-2026 19:24, Arvind Yadav wrote:
> Purgeable state updates only change VMA/BO metadata. They do not zap
> PTEs when switching between DONTNEED and WILLNEED. PTEs are zapped
> later if the BO is actually purged.
> 
> xe_vm_invalidate_madvise_range() waits on the VM dma-resv before checking
> vma->skip_invalidation. Since purgeable madvise marks all affected VMAs to
> skip invalidation, this wait is unnecessary and can stall on unrelated
> in-flight work.
> 
> Skip the invalidate path entirely for purgeable state updates.
> 
> v2:
>    - Replace inline 'args->type != DRM_XE_VMA_ATTR_PURGEABLE_STATE'
>      check with a small helper madvise_range_needs_invalidation().
>      (Himal)
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>


LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


> ---
>   drivers/gpu/drm/xe/xe_vm_madvise.c | 19 +++++++++++++++++--
>   1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index c4fb29004195..9e343f9aa44d 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -332,6 +332,20 @@ static int xe_vm_invalidate_madvise_range(struct xe_vm *vm, u64 start, u64 end)
>   	return err;
>   }
>   
> +/**
> + * madvise_range_needs_invalidation() - Check whether madvise needs invalidation
> + * @args: madvise ioctl arguments
> + *
> + * Purgeable state updates only touch VMA/BO metadata. PTEs stay valid and are
> + * zapped only if the BO is later purged.
> + *
> + * Return: true when the update needs PTE invalidation.
> + */
> +static bool madvise_range_needs_invalidation(const struct drm_xe_madvise *args)
> +{
> +	return args->type != DRM_XE_VMA_ATTR_PURGEABLE_STATE;
> +}
> +
>   static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madvise *args)
>   {
>   	if (XE_IOCTL_DBG(xe, !args))
> @@ -708,8 +722,9 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>   	madvise_funcs[attr_type](xe, vm, madvise_range.vmas, madvise_range.num_vmas, args,
>   				 &details);
>   
> -	err = xe_vm_invalidate_madvise_range(vm, madvise_range.addr,
> -					     madvise_range.addr + args->range);
> +	if (madvise_range_needs_invalidation(args))
> +		err = xe_vm_invalidate_madvise_range(vm, madvise_range.addr,
> +						     madvise_range.addr + args->range);
>   
>   	if (madvise_range.has_svm_userptr_vmas)
>   		xe_svm_notifier_unlock(vm);


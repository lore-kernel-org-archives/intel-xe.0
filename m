Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB8ACDE00C
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 23:10:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C73B210E18D;
	Thu, 25 Jun 2026 23:10:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E+MGOTS9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE78E10E18D
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 23:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782429042; x=1813965042;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=W9Pxknwsm2Pw2g9sfTyveVkl7fgZzF095DG5as3cIyg=;
 b=E+MGOTS9jiu/nCoBqmWlVTQYhlU1R9dnis4uUNPEMkL8EXDeyZPNctb+
 vyK1DonZ/seBbPHc2j3JYycX2fZZ0LWrEm820yZdQ4Tl0fRu8eLpWvKaG
 noV16m3DJ7XuJzH0xYMU5NX0o34y51WVq9IQsjYSvMinK2JrF+d9Nk3h0
 R9lRSUaUDpR6aWTsMcbb1kcrG2u8eeuluLSrC6tNvkPGabO8SPgJNTn7I
 UtN3KSZFkO4x31/WGeGM/3rY6CNPU/sMOUDIycRPLkpJuZ93DUYW/TDew
 dz/txSkqPxFQC1pCLv7v1G0Rz6NxLM5ot1NFfAXrng9ncgByT2SRlWc3E A==;
X-CSE-ConnectionGUID: L2bJ3NGOQCqXlQ7KzppDWA==
X-CSE-MsgGUID: Mi4LbS8mQqOeSZPIimISYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83418920"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="83418920"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 16:10:41 -0700
X-CSE-ConnectionGUID: BA5g1olFRomjtFzHcZxSZA==
X-CSE-MsgGUID: PAqyUzoJTcyXS9tQMhL2LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="249480744"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 16:10:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 16:10:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 16:10:41 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.8) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 16:10:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vx+Bo0OMetLLxAaQZR/w867YAHuGi/aOStUufxwgmqnMcOR5Sm965Xrhfz0cFgaxnm/LxeCHigcAjakOJKOjC0WfFMIfTL8RvVwyYRX6l1juAu2s/bsLaaqLtRlwa9Rbb3MCIRlWhzfdOG+dYsb/2esiv3pWSWvxcqpzrvk6148Ufcyp3eotmNurA/7rrCekklo3LhJxUVHHSOWfAvZ3kQzKMT8r9jK/Tj7joZhS8YH7IJwcRMs/n1lfr6JXSrbw1T0ncvycceyzVy1EMDgdWDN2eXc/AC2M5frxkmu0YMWa/EZ6mxoj/W+Tj2nk6n1pxLv07/6Q4faia2tL7fNw2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0wtbZMmCMJSiq1il7MkgPy3QWDt5+KDpWspmOSXuk4=;
 b=ha/hKCjuek0BMglv0sfxE1EvTQJO08zmsAyPBQ9cHpms7W1w8p1p8OwrsarBhL2+r1ZD6fDCLGbYfKmFWooCg00HbNHevUYXx3dGpLvV1TWWg2ZLbG5yzzX1TAA4iXlDlpvN3PGl240TxuTKOIDkpigfQ918mSu2vD5RhHwu/qiCaIuKigYjFZ36fFq/oD6cumhatb8wkiQQWE5d60Am375/ksLnAfgrVTabRJ8NmhxHWYAc/DNLhxdzcpQ9uVkHO/6wy0glLEPHtgmcyw+WKn0/6rwLZgSHWZMzk8KX5xrwlkRqZRi65Txyi/DVe2PRIMht8HKYJtUhYgpqhj8+ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS3PR11MB9795.namprd11.prod.outlook.com (2603:10b6:8:363::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 23:10:34 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0159.016; Thu, 25 Jun 2026
 23:10:34 +0000
Date: Thu, 25 Jun 2026 16:10:31 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/4] drm/xe/oa: Fix offset alignment for MERT
 WHITELIST_OA_MERT_MMIO_TRG
Message-ID: <aj21Z9pO9JoXvRVi@soc-5CG1426VCC.clients.intel.com>
References: <20260617015422.226177-1-ashutosh.dixit@intel.com>
 <20260617015422.226177-3-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260617015422.226177-3-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0241.namprd04.prod.outlook.com
 (2603:10b6:303:88::6) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS3PR11MB9795:EE_
X-MS-Office365-Filtering-Correlation-Id: 672baef9-2ab0-46c8-a06f-08ded30ef5c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|22082099003|18002099003|4143699003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: n6Ba/A6kv4cn3bxHMRy0WTjZd0A4TPQhqHWMZevV/5dTA7G4MTg0so9J63Miv10FVm8WXu/TFY9573wgz7y6p0P1VuyRtnr97fvFyPns/CzLibqR5sf/B3WVsAgslcqBvivsHCc9fyMiDwIEx4fhuCTmBtATf5wX5a5i3jP3jMy4Ed+4Y3Ryo5zV1T5Gfvs4XHhuDV1ekZRE/6CGHaRMnEKMzZES5d31cQDlsE6eAuGw+EywVbwzO9pZD44BMCQ/wxysG9DFt9z+9we7p9ZaJ6M2U1ke/RM1E0XfKNK/rxYZQ9zUYrMC2TI9BGvuZVSEhFR/iF95Ymqz6qy6fMgTZSanJncH2RiDxXyrhgW2nvIhhMPmm33pxGJq1VznnNoo35f1gQiyNMTUVP6SjbkINvWNtMiYhB6RMemU8pfOw2Pjnqpr3skHWazXnPqFj+IpRMeprlLG4BAAWUp35qgdjMnU99It2g0Nc+Iztqz18pR3NKQmfQo/0ethoAb+7HbxFWC9wJuWjnf2Ebz/XTfh7huxP0Ayk0WCblXGajnvOKBrtjxYK03C6Ag/BhcmTCndCzFVLmBTx9l0faA0rOCXGc1t/F130qsvUuCnrEpoq3en0+9S4KCmGnV4LARjSxlj7+b5zVbii6VGVoRX8tpmnjs7q/z5NnSfKEtPBWfR4CM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUdVdHM2OURvWVBBbHVnbW9oUTdZVVpmS3FLOW5sR3RKdzBYVXZVK21QRDVW?=
 =?utf-8?B?eHVrMjBUazYzQ1ZHUnQzK2hNOWVTM1VrRXJOZHVBY3ArNm9kSDF2VGh6bUFV?=
 =?utf-8?B?VmVMVUdhZmxYYjkyc2o2SklMenljbjFORy85M0dzcXdVY2xzM3lUUDUveW5p?=
 =?utf-8?B?Z2MwdE1Hbk5TRTVFMXR5VDJhcnNXVVdMNU1FWnI2Z2haZHIvb0ltYzBHNE1F?=
 =?utf-8?B?c3dHd3pXYU02Y2VyUnZIT1Z3UFArNWFIbXVBTnpramprWjlhUmZlR04vVGRp?=
 =?utf-8?B?TUFBcGx1bWF2MjFibEhWSGxHNTFIcGRWV1FVV2NhbW45RkpudmRiNjV3c21q?=
 =?utf-8?B?cTQ4ZmNRdWlqUTFGakVHVmx4YmtVQ3hiK2pBcERMRlRMUU9ueWt6dTUrK2lz?=
 =?utf-8?B?V0cyTCtITkZPV0Y2VGozOC9XQWt3YmVHNW9KVG02VjhqZVJnK1FaOUY1UWQw?=
 =?utf-8?B?Qi9UeTFGYmErdzFiejJkTmtZWERBbGY0L252QnRJdlBNczNtaEQ1NXVvb2Ra?=
 =?utf-8?B?Mkh5SlV2ZS9vWjczbTRwaSsvOFZRTlhiUHJULzgxdnJxd091ZHMvdk9wRENE?=
 =?utf-8?B?SGFwenRqZGJGaFZXMWJvdXJNTC9GaEMvTE16K3FGUFpScVJRc0RtRzFiaHdN?=
 =?utf-8?B?RnhEVWxJNnJpeloyRkdEMWo5ZkQrVnd0ZW0xRWR4TEE1OU1RbmF5S0kwdDBJ?=
 =?utf-8?B?d1FMZndCUUVtN2s1a3EyeTVyemNpMzZmQ3lscU9pNFRab2NqMFdUNDIwYXhP?=
 =?utf-8?B?SHJQRmtYL0VqaUZBUkdYdmd5YlByYUlNNS9EUGM0KzJLMTdkdEVta2t1QUM1?=
 =?utf-8?B?T1ZMQnhoVnlZcnFZSVNlMEF3SWNjejN2V2RoNmorVzY1d29XM3R2WDB0dGFB?=
 =?utf-8?B?WUJZbnF3bC9NWXBsck1wbmRKeDFmZHlXV2FGbmlsZWVGMjd0UlgrZlZyMzBo?=
 =?utf-8?B?aUNzYXhZbXRaU05YeksvNmUyMjZWNmdRZGFkcWl5VVFkRU8vOEdJMUh3Z0Fo?=
 =?utf-8?B?bUZIdnVjU0E2OWcydm1xdmluNE5BWkhCRDVHd2NleXpETXZTZ09ZcEFVS0Zm?=
 =?utf-8?B?cDRITTJPUldvb1ZkeGg0NDduY1ZZZXJCRy8yVFVnT1VTbnhLSXJ2VXV2aUVN?=
 =?utf-8?B?UGFHMmdBNFB2Qzk3Q2duU01SOFp4Rms5UXdtRlpwWVVNdTI2QmJ1VGlGN1lD?=
 =?utf-8?B?WVRMVXFmUVJqeXh6d25IcER2SSttZW5IdjdMNloyU2xYOGtaSnN4M3VDL2Vw?=
 =?utf-8?B?Y1ZTM0FmRmM0aDJrUHAyNktRbDA0OGU5UTBraWM0K3ZuelR0dTE0T3RUWkRR?=
 =?utf-8?B?RGpSWE00TCs2RlV6SDV5WmJoRzVYbUVhemhjb0hEaDhHL1RES2xiYmNGeWtl?=
 =?utf-8?B?VXM2OTc0OHY2VGJralVyem1hVUoyRDlpSTJqUGl6c0ZCTkdvdUtMd2V0VEkz?=
 =?utf-8?B?cmpDK0pDTmtlSUgzLy9kUmk0OUlsRzJxMmwrWGFuS3hjNUVPOHRNYzF2VnMr?=
 =?utf-8?B?RTZDZWZzWHdzNy9lOWZTQ0toQlhYVzhFdzd5ckdlVmRDYUJlRXBtWlYrYWls?=
 =?utf-8?B?QmJKeFJaV3V4bmczNFVZMVRYWXBuN3BMNlgreUN1cHhnZElURU1ncDdTeWJn?=
 =?utf-8?B?Y0RIdU1tU2k4SVJ5TEtTbUxMNGQrRDRzNGkyQUtaSTdaWEF1bCtXUFM5TE1S?=
 =?utf-8?B?dmlmWEF0dWkvdG04SEZxWmpwQlRsRUVnRU5RZmMxaHM3RzNpODEyKzljQXVR?=
 =?utf-8?B?dEdrdjVhRHA4V3NMc09Bd2RHRUFDY2FveEIrNXdERzREaXM5cGIzTXpDQWwx?=
 =?utf-8?B?SE1vSDBYRzVXSTNGUi93dlBicXhNUmE0dExIaHNtQXQyOGhCaEpUbEc2dm92?=
 =?utf-8?B?cnNMU3hMNHBqb3RnS3R0RkVPVjIzWHFpdGh2T2luTU50a3JpeXNUQVAyRUMx?=
 =?utf-8?B?Q3RyTXNTanlZTW8xN1huQ29UMUI1dHZNZkk1NUFaN2I3R1VscDBXRGpaTWhY?=
 =?utf-8?B?ekpKbEMyTDFsY09DNjkzTUZIMWNVUU1IdHhKNk1HeERVU2NoMTBlUDNYbis0?=
 =?utf-8?B?RjBad2o2VzJUTU9qQmtjVU5OY3k2YkRPVlppWElGaDFwSG1ZNWRoS0JzN2hM?=
 =?utf-8?B?NEgzQW9WZEIvVSt1UTJiUlRQUDUrZ1hLUGdTRi9BQjVSaU1SVlpHMllNNTFG?=
 =?utf-8?B?aTk3NDBSejMwSzNkcWc0aUxJK2Z1bVFWTHN2VE9sZHBxS04xdmtDcE9DczNO?=
 =?utf-8?B?QkRIR2V5U0FnTGNGVmlUZ0hUVkIxZ0plSGFwMTVUYlFYZHJoZ2VvS2o0c242?=
 =?utf-8?B?Uy8yMDQ2Zk1KdHNudWZGYVFpVXhJcW0xa1k0N2orUC82dGgzazNZTG9jNUR5?=
 =?utf-8?Q?96pJgA9g2rHnXTLs=3D?=
X-Exchange-RoutingPolicyChecked: B2Xk8H5mHh1dYQ4Vts+Qd9DRO+ryWfb0Y0pdiXIwbqNBVvPWLW3353ZWDTzU+998h8BN+4LzlBaZzPabJSPnDbFudCKNJ+WU41nzp0HjUfFodSq6PjPwEaBOT+BPitjfM0Q/e6Mp5KZWS5islPiqL5vNA/v/sj1BvAv4TERGGUgcNK7LM1/tyipIScFlC9GIeBSQsZG4ZsLEPo3aljqqoyo5kasP1XNqcftfkQvONbsU9xEdNU6pRrmSel5usoX3WFSDYuTbs7oUcDp5nth4EwsIMvyHGpGBZf93X1VmO2bqTDPobYIwt+p/gjfdd3hulHJMvU+Ank3nigAzPXa8Nw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 672baef9-2ab0-46c8-a06f-08ded30ef5c7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 23:10:34.1742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zrhas3Mkj+jraOys18wsPaezANFl4fjOrleHuaQFv/KGHnCOe7Hqef3DnoV6t+rq/rZ1kLqAoQZ4dhOBmoAyuxRyOiOKxzwgYp6nTAK2ahU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9795
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

On Tue, Jun 16, 2026 at 06:54:20PM -0700, Ashutosh Dixit wrote:
>'tail_buf' argument for WHITELIST_OA_MERT_MMIO_TRG was previously
>wrong (not multiple of 16). Fix this.
>
>Fixes: ec02e49f21bc ("drm/xe/rtp: Whitelist OAMERT MMIO trigger registers")
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Note that the SW whitelist needs to be documented in the relevant spec 
sections here: BSpec 53688. Can you please have something to track that?  
With that this is:

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> drivers/gpu/drm/xe/xe_reg_whitelist.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>index a17ebacc1455b..880079473c26b 100644
>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>@@ -124,7 +124,7 @@ static const struct xe_rtp_table_sr register_whitelist = XE_RTP_TABLE_SR(
> 			      OAM_HEAD_POINTER(XE_OAM_SCMI_1_BASE_ADJ))
>
> #define WHITELIST_OA_MERT_MMIO_TRG \
>-	WHITELIST_OA_MMIO_TRG(OAMERT_MMIO_TRG, OAMERT_STATUS, OAMERT_HEAD_POINTER)
>+	WHITELIST_OA_MMIO_TRG(OAMERT_MMIO_TRG, OAMERT_STATUS, OAMERT_TAIL_POINTER)
>
> 	{ XE_RTP_NAME("oag_mmio_trg_rcs"),
> 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
>-- 
>2.54.0
>

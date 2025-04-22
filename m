Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EF5C369CB
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 08:42:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1785810E542;
	Tue, 22 Apr 2025 08:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I6EKqKNy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A1110E542
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Apr 2025 08:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745311348; x=1776847348;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=B0cRojtAWAJlC8T/yLxnXDmyTwpGlqlVWQxPv1Nf/nk=;
 b=I6EKqKNyeU2yd+1JTj2vajC7lPs0y+Pu7zQ55gRS8vRis0E1mRdKi69+
 H3ZnxMdF90EPLMoLnV6jPQsSazuiahEPgNE6jB7zRs44Wk4tSPKb8K5Wr
 RrjkFgakRiw+PC5YPBEB+/hklMMEnvHlDit7Hg+QvTL/6qqhGe/MQiYRC
 E3gmll2sXQFqHIGTrSZsVGDCb8BBvyJSs747nTpf/yOXyolpiT6snQIx8
 8iwHZqv+lbzBcS6m8h3JnK350+aQV1wjbHTjj0E2FWf7e3BtrtnIOz1VU
 /VU90JItsetSzv5Z7ximjVy5UJmrLQE22pLkKZ7E8d1WwWhARMaCvdpOf Q==;
X-CSE-ConnectionGUID: ZQlvIuoWSYW7g1xRBXZCcQ==
X-CSE-MsgGUID: 8XVToCSBR5qG31mmfTu+Mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="34475806"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="34475806"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 01:42:27 -0700
X-CSE-ConnectionGUID: TTPRISfRQAGbVlLEixvQYg==
X-CSE-MsgGUID: y3hLGH8NQdGqnqgK6FBvlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="131901705"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 01:42:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 01:42:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 01:42:26 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 01:42:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v/xjOIr/P1Kq3lfDpiEOpozj4Y1b6mU4Ywa8wcoH6JcMKEXNmRbBo40YQxk+3rUvqv4EPKcUxpHF6TYNTMdeHhZGUYYLcQrPTPvKvu0wcGXHVeMOw0oU7RC/3ifqOpMun8pmgthxRX8KmS0vO2kfGZxyTG4Sf3lWF9qTIxsVTcdY8CnXzVPs0n61VQNiyU8X27xLYUZPbtB5uzprQijLKB8ZVo3nM4K6EYdRsT61uyFyzqrTjhfA0JkBSqgeJIzDv4xegZb4q50JS3vwWcZGcWSNsRtpZPH6ZdLvSXQTDgKgRt7XeEDwO+BjyKESs0hCSE0NVKJUAWgxKfGdRlKQDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLZeCMuLAumTyKYqlcA2kaqCYbxmRKNSDG62jdJ1nvo=;
 b=GYJdUXRLsa3VexImhX5F6dHQtIM4ihTIWoQ0obDNFWUzNY2nHb0BcpiERF6+8Ugfxf3Yt/b8Q5D4jczU8CfZ4aoZG7BNvR4x+sohAdzh31lVI83/U/mAcNCEDlOFDSE/Uic5Rseuru6YYK10HQORAalPD1CVL+n47mG+JkMRJU3pQ5OAFmzzKi6/E2nXWElDwkZTu0AQH8I8Hgb417UQow605Qo4PhRp9RvXC8nODztotKzQoMc2qu0VTiDhsYrp3GhQvK3tznFLYs4YW5R9J3xMbIBHxVoYz/xRfVqrdAiaIXogozN5oayk1tyUoZ6KP8dVw7qcoAZRSImMw8kIEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ5PPFEC87B8781.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::85c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Tue, 22 Apr
 2025 08:42:23 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%5]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 08:42:23 +0000
Date: Tue, 22 Apr 2025 10:42:20 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>
CC: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3] drm/xe/pf: Don't allow LMEM provisioning if LMTT
 isn't available on the device
Message-ID: <20250422084220.fyhaf255nfxynp5k@intel.com>
References: <20250417142147.278727-1-piotr.piorkowski@intel.com>
 <0b9ac8787dc00ed191b8cea981a56c6b29dc9e85.camel@intel.com>
 <87056576-65f5-4106-878e-7d1701e554ab@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87056576-65f5-4106-878e-7d1701e554ab@intel.com>
X-ClientProxiedBy: ZR0P278CA0026.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::13) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ5PPFEC87B8781:EE_
X-MS-Office365-Filtering-Correlation-Id: 1387db71-9633-4cac-c601-08dd81799a26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0s2aWdYdmd1K0YxcnN3YkpWM2tOYUN0OE93QURySXhubHkwY3UvTVYveG1j?=
 =?utf-8?B?UVVIRlFEdzNBSlUwRE9xZ2xMdllBMHFqQnZldVhwS1ZJM3BIYm8zcmo3ZnNN?=
 =?utf-8?B?VGI0SnlNdGRKc0ZPL3VsMnNiSUNONXp3QUpwYUhhY0dXUlBKcWZjWjVsZ0Vi?=
 =?utf-8?B?NUtKS2ZOMDFjTVd0MmpXTjlublJvdHkvdytCUS9VYUVkRXo1b2Yrc1RJTG02?=
 =?utf-8?B?Y0I2RXlvU1gxZUJFUnh2eXdybzVpWjdtOVhkOC9BVEJHYS9RN3F5SkJVQ2x0?=
 =?utf-8?B?Tll5TjZRZ3pvNmtFYytTRXdobWNtQ25URUdMWXN1QUx1eFNqUXFaaTNzWE9J?=
 =?utf-8?B?ZFlCeWMvUXlBdTVFQzU3Mk4xV2c0azhvc1c5YllWQ0hEYldWSjlKUStPQldU?=
 =?utf-8?B?SmpscEJYMUhkT2NrWWMyakpuOUtVR3EwYmZsMGhkOEs1Z09DVDRXamdJMUpo?=
 =?utf-8?B?M2FtK0R1eEJsN3V3UEs4aUN5VnpIUEQ5Vm9iVGRxYTE0OXdjRWxJZnFRbUFk?=
 =?utf-8?B?eGVpa0NWTEtFRWNOcE4vcnR3SHhyMVllMW02WndDcldnNjFxbWZLMzRkejRk?=
 =?utf-8?B?WC9IbU9YZDQvUDFqTHZJV0YvSE55TEN5bUg1a3czaFJWN2xyZ2lpL25xb3pq?=
 =?utf-8?B?bEh6MWhpOThkUlpaN0M3VG9BbHdSNmNPVGpMdmhYSDZQcURTNEQ3OWtqT0xB?=
 =?utf-8?B?UmtJS0JKZ0g0K1B3VUJFVk9KQXhPK0Y2eC85RVc3ZFErY3VRUXRjTkpFVXBE?=
 =?utf-8?B?dk9zckF0ektIVmQxdlR4VVdaclhJTDNKellrU001cDZwaTFaNHZvQUI0dkdB?=
 =?utf-8?B?STNhYTVEMW8wZ0xnY3loM1M3TDlUb2tkQVcxL0pOdVZscWYzU0IxT0IyNGY1?=
 =?utf-8?B?WFFlMkRoVjk4SkJUMWpLb21jR2JyaGhPd0dxNENvV3FRdjJBdTFQaXEvUFha?=
 =?utf-8?B?YTN1SzFTaWRRZnB5N3dHQ1dGOG9VMDByVDhXa004M0J2eGZkZEN4ZFBkSGk1?=
 =?utf-8?B?RUtTa1dlR2RNY2g0djBqQUFPaGx6bUIzbHY3VXE1aUNMYkJaSjRyeHRzUUVV?=
 =?utf-8?B?dzZ4L0JhQnlkQ1UxVVRudGgzZDlHZUJsLzVlR3RuNXA2N2RaVzhyQUZnR3dM?=
 =?utf-8?B?Q05BbTRCWGNCWEtGZnRxOGpFb3Vua1h1TlpiWG5DK1JNZEF2aWJNL2ZLczRZ?=
 =?utf-8?B?SUtWTjNkT3UvZDNrZ01rQm4zd1JSb3FTamJ1b2kxRTN3MDFSb1lNQWhtZHRK?=
 =?utf-8?B?dCtmNnJXZUE5Rzg0aG9LMmRPZXNhK1FuUkY1UUIrMHBwVndqTXhuSWVWR2hk?=
 =?utf-8?B?YkUrWlNmVDRpaXVkenNSSFBldkxWMTFJejdwTFNVZ1c1N0tsR0cvSUoyZXRk?=
 =?utf-8?B?a0FuRm43QzBNN1IxSkUxU0k0bFhXOXFFMXJEbHFXV1Ztb0VzT3huMjZ4WW5o?=
 =?utf-8?B?cXlJbmxCRTBEUHVnN3RtVWZ4NlJKazIyeTlWOHhJZEpBY2pJNzhjVUJZd0lN?=
 =?utf-8?B?Y0NBclRwUGFIcmE4NkpSbUpGS01jQThGeGp6ZUx3TnJKb2F2SjdCcWhBdnV5?=
 =?utf-8?B?K3ZUSlE0YlJBSmdiL0tyTUxkbFlrakNHOHA4RW5GNHFsUWVFeGJIYndMLzNa?=
 =?utf-8?B?azRHcnIwckxGZG5ZQUhOL3Z5RDVSWUNvNDFkL2FBam9abVFGNXIwU2NjYm9q?=
 =?utf-8?B?RU05ejZmRGV3eDhSY3M3Ym94NmFkb0Q0UVI0Y21YaUpaTlVjWDJmMU5aZWhh?=
 =?utf-8?B?V0V4S0lYZFBuN2gySGM5QWdNeDQrdGxpWXIvVlJiRmNkWUNNZHJvMjhtbThu?=
 =?utf-8?B?VEpMT2l1R1NveE1LMFl3RENvNzUzWUdTMkI2RlJKMHc4Z1MrR2toYXFyRVJR?=
 =?utf-8?B?d1U3eHR4Z2pRL1BCVDdPbVBRU280RDd3V1NMaTNYb2FJK3B5QUNmNklqMDh3?=
 =?utf-8?Q?wZDFKroFwMc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1oxSU9GRUNuZ0RFcVdQbFM4ZTdadXBaVzd6bE9SZCt4SkRZUmRjazRtbjEy?=
 =?utf-8?B?ekRHWFFOWGdzcW5pdmVuT1FGbXlLYWRVZnBiYlo4MmlBTStpdTllUUN5allq?=
 =?utf-8?B?d0VjVE9CUlRXM3J5eDFoWlRIelVlOFNncEJ3ZEViUXNVeWZiL2JmVkd5VlRD?=
 =?utf-8?B?a1BzcTVRaFVuMUVTZUdCckwxOXVlcVhEVzVZOHFJUlM2VmY2YWxhQ0pmUm9q?=
 =?utf-8?B?VC95cGZkQktEUXRPZk5nU2hkektmeEhIUnQ0ZWtpSWpKOThUMElVY1pCUnRO?=
 =?utf-8?B?b2UzU1lNNDN6amNqNlZqSVNTNXFJblF2ZldyTEg0MzBONDhYenU3QncwNTJm?=
 =?utf-8?B?MklWUk9aV0lTUkcrS0tCSm1GMXRlVDUzYzFZVG1jamxQL3dWZ2U3WUJROWhZ?=
 =?utf-8?B?aXlOcldFSjBhVDZmckNYSWZIVzM2YTRhVEFwWklRb2s4bnVjalBudVZ1NGxz?=
 =?utf-8?B?VFBmUXNsVkF0eEZDN216WkhBaXFoNGZGRXJmWGZyRUY1S1Nac01aV3hlREZD?=
 =?utf-8?B?U2UwaVp2dUFUWU5YQy96MjF6YXkva2w0ajZ3aUhLU0JYOVVVbE5DejZFUFEw?=
 =?utf-8?B?dHRqellzcTh6dkhRUk5HYmtkRG41YloxbHdpMWwrb01Wb0w2K0JFMmhqWE5T?=
 =?utf-8?B?NURWMjAySlQ2RzZXNExFeGNhdlFWVUMycmpJM01KYXlzeFJGaWhIV0piUnQw?=
 =?utf-8?B?ekU4NVdLOVdzNUVjbXNSNVZVckN4SGR6T3Jscm9SU25QL1hIWjVZUE16M2hz?=
 =?utf-8?B?UmVyNk5Ja2RSL2lmOGRlUEJrRTNFYy9neWJoNUZuem5rcFRFRzVvOEdxcG56?=
 =?utf-8?B?WDg3ODdwZkovOHRDeUlyUGRzU3ZzZFpvalVKdFB4dDI5d0pzclhFTlNUbWo0?=
 =?utf-8?B?V0FzRlZScUV4QytYYStrN0oramYxN0tiVnNrOWIxbnk5cURvRFVFK05hWkJC?=
 =?utf-8?B?VTVVL3owRVpGeWpIMk82NVg0d1R2OWFHYnFNbHZXS2t4RTFBbEhjSFFjV1Rt?=
 =?utf-8?B?bFBBTEdtRGpDbHRXQm5tU3dQWHZyM1I2a1dmZDE1K0NGTzRYSTV4N0lBbERn?=
 =?utf-8?B?dDV5YTIzTnI4NVB2RnpxdHNuLzBCWkxzL1hUcXNHVGxOTk1uYkVvb29OUGtk?=
 =?utf-8?B?ZmRmOVhNR0NLL2ZVWEorVExJMzJwUkZDQ1ZNeGdPQ21sWFRQemlQTnJSYkV6?=
 =?utf-8?B?ZDlPVFR2eUZ3c2hHdkxXVWJGam9WQnZHa2V3RER5cEp1dTlwbkwzSlN2Rk1S?=
 =?utf-8?B?QmV4RHppa3JnWnM1cjlSRFFnbDZ3czBsY2hUS1l6bGNQOUN3Q3hjOUE3QVVI?=
 =?utf-8?B?YkdDdzZJYnFOcnI0dXNwUGU5aGFuVHEyeXlSUlhxY0VKYjZ2eEVXV2tHaFY3?=
 =?utf-8?B?OFR3c3NBYVJxamo4cFpLZHhqTjY4YjhtZ1lNYStQUlp0YnB2NFAzN2E4QkRS?=
 =?utf-8?B?bExId2o0UG12U2laaFVRUVdEaXhaRkNSNmZxWlRxL1UxL08vRHdnMWw1cTFy?=
 =?utf-8?B?cXpmeHloclhIYjNMU01PRS82UjJ2eXNWRHVhZFNKeGtLVHdZMmNBSDRYK2Yz?=
 =?utf-8?B?MW43NlVLWTB4cElBM1dUN3FRNEwxTGpQOG1WTmREd0ZBSm5GRkhtZjVaR051?=
 =?utf-8?B?ZXJFaDc0ODJqYjJOSXpacjRqTE11Q0NkT2ZjQUZMZUN4d2FYWmdNb1NjRWw2?=
 =?utf-8?B?NnZsY0Q4YitvVEtPWlN0L2c4cWZBKzRvN1NrcnJjaXcwWmZJdzFyLy9vRjBT?=
 =?utf-8?B?cjZDSjhBRG5ObzcwTjBVTHgxMUNBMVdFQ01VUWNoZEkxSCtrSkZVRGdsdnJo?=
 =?utf-8?B?dE0yVGNGUkxGaWZJaFRpOUFtYjhvcldNell0RjV2RzV1SEhHcUVSb296KzV0?=
 =?utf-8?B?S3BuczZicjJtbWJUVGdRQ2dEZXNNSkFhZUN6T2ZOR3doKzJRTU9iRklvWFpw?=
 =?utf-8?B?N1BhZEttQldad2o4dmJmMEdUQVVyOXdFU1c4NmxSVzQ0Qno5ekhTNnNEVFdX?=
 =?utf-8?B?YnMwRS9leFhrOHZqQkd2Sm0zaWxaWWtCL1ZqMG8zZ1J5RGtnSG1ZZmhlK2l1?=
 =?utf-8?B?OHZEWWZ6c1F0QVhLTForNlhnZGEwaFZ5Y2lSeGMvNlhKdC9zbzlLTHZEbkto?=
 =?utf-8?B?ckJsN29QdDRiZUNLa1RuOUFyNHJTQmU2WVE0QlR4czNQSGVZemdpRlczeTg1?=
 =?utf-8?B?dHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1387db71-9633-4cac-c601-08dd81799a26
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 08:42:23.4888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8lAkjVe8UHFH/zhOJWckuTa4bNtjZSOKa33pR3whfaNG/YfnB+s+++yu1gGbM1HYKbDbtqMupnto/X1DDXIVELI/e0Cx0XZ/KMLmlqe7PPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFEC87B8781
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2025-kwi-17 21:32:40 +0200]:
> 
> 
> On 17.04.2025 20:18, Summers, Stuart wrote:
> > On Thu, 2025-04-17 at 16:21 +0200, Piórkowski, Piotr wrote:
> >> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> >>
> >> The LMEM provisioning is applicable only on platforms with LMTT.
> >>
> >> v2:
> >>  - new commit description
> >>  - use xe_gt_assert in xe_gt_sriov_pf_config_set_lmem instead return
> >>    error,
> >>  - disable pf_lmem_info if LMTT is not available
> >> v3: fix condition in xe_gt_assert
> >>
> >> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> >> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  | 6 ++++--
> >>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 4 ++--
> >>  2 files changed, 6 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> >> b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> >> index 2420a548cacc..3556c41c041b 100644
> >> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> >> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> >> @@ -1520,6 +1520,8 @@ int xe_gt_sriov_pf_config_set_lmem(struct xe_gt
> >> *gt, unsigned int vfid, u64 size
> >>  {
> >>         int err;
> >>  
> >> +       xe_gt_assert(gt, xe_device_has_lmtt(gt_to_xe(gt)));
> >> +
> >>         mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> >>         if (vfid)
> >>                 err = pf_provision_vf_lmem(gt, vfid, size);
> >> @@ -1629,7 +1631,7 @@ int xe_gt_sriov_pf_config_set_fair_lmem(struct
> >> xe_gt *gt, unsigned int vfid,
> >>         xe_gt_assert(gt, num_vfs);
> >>         xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> >>  
> >> -       if (!IS_DGFX(gt_to_xe(gt)))
> >> +       if (!xe_device_has_lmtt(gt_to_xe(gt)))
> >>                 return 0;
> >>  
> >>         mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> >> @@ -2163,7 +2165,7 @@ static int pf_validate_vf_config(struct xe_gt
> >> *gt, unsigned int vfid)
> >>         valid_all = valid_all && valid_ggtt;
> >>         valid_any = valid_any || (valid_ggtt && is_primary);
> >>  
> >> -       if (IS_DGFX(xe)) {
> >> +       if (xe_device_has_lmtt(xe)) {
> > 
> > I see a few other calls like pf_sanitize_vf_resources() and
> 
> from old offline discussion - there is/was a plan to reuse lmem_obj also
> when we will not let to configure LMEM manually, not sure if that stands
> still, though
> 
> > pf_validate_vf_config() 
> 
> it's touched in this patch right here ;)
> 
> > and pf_restore_vf_config_klv() and
> > pf_get_ggtt_alignment() in this same file. Is there a reason not to
> > just change all these at once?
> 
> if we want to allow the LMEM configuration only with LMTT then agree
> 
> then maybe we should drop new explicit assert in:
> 
> 	xe_gt_sriov_pf_config_set_lmem
> 
> and instead replace legacy IS_DGFX in:
> 
> 	pf_release_vf_config_lmem
> 	pf_provision_vf_lmem
> 	pf_release_vf_config
> 
> but let Piotr speak here

As Michal rightly pointed out, this was a intentional decision on my
side. I would like to disable LMEM provisioning in the current way
for platforms that do not have LMTT, but I would like to keep
the possibility of using lmem_obj in the future without LMTT.
That's why I left IS_DGFX for the following functions:

pf_release_vf_config_lmem
pf_release_vf_config
pf_sanitize_vf_resources
pf_provision_vf_lmem

Note that all calls related to LMTT in these functions already
have the appropriate condition.

> 
> > 
> > Also right now has_lmtt just calls IS_DGFX, and I confirmed this looks
> > right from the specs, so at a high level:
> > Reviewed-by: Stuart Summers <stuart.summers@intel.com>
> 

As you rightly pointed out, currently has_lmtt is just a call to IS_DGFX,
so from a functional point of view nothing changes

> I'll wait with my r-b until Piotr reply
> 
> > 
> > Thanks,
> > Stuart
> > 

Thanks for the review.
Piotr


> >>                 bool valid_lmem = pf_get_vf_config_lmem(primary_gt,
> >> vfid);
> >>  
> >>                 valid_any = valid_any || (valid_lmem && is_primary);
> >> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> >> b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> >> index 0fe47f41b63c..13970d5a2867 100644
> >> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> >> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> >> @@ -308,7 +308,7 @@ static void pf_add_config_attrs(struct xe_gt *gt,
> >> struct dentry *parent, unsigne
> >>         if (!xe_gt_is_media_type(gt)) {
> >>                 debugfs_create_file_unsafe(vfid ? "ggtt_quota" :
> >> "ggtt_spare",
> >>                                            0644, parent, parent,
> >> &ggtt_fops);
> >> -               if (IS_DGFX(gt_to_xe(gt)))
> >> +               if (xe_device_has_lmtt(gt_to_xe(gt)))
> >>                         debugfs_create_file_unsafe(vfid ?
> >> "lmem_quota" : "lmem_spare",
> >>                                                    0644, parent,
> >> parent, &lmem_fops);
> >>         }
> >> @@ -558,7 +558,7 @@ void xe_gt_sriov_pf_debugfs_register(struct xe_gt
> >> *gt, struct dentry *root)
> >>                 drm_debugfs_create_files(pf_ggtt_info,
> >>                                          ARRAY_SIZE(pf_ggtt_info),
> >>                                          pfdentry, minor);
> >> -               if (IS_DGFX(gt_to_xe(gt)))
> >> +               if (xe_device_has_lmtt(gt_to_xe(gt)))
> >>                         drm_debugfs_create_files(pf_lmem_info,
> >>                                                 
> >> ARRAY_SIZE(pf_lmem_info),
> >>                                                  pfdentry, minor);
> > 
> 

-- 

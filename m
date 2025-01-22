Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0379BC02182
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 02:49:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9FB210E1F8;
	Wed, 22 Jan 2025 02:49:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MHLAkKx+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBEB710E1F8
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jan 2025 02:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737514156; x=1769050156;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GP/NeN1c0yMOHy75ubTek7iqML52qQeU0pwNNVD7Y6Q=;
 b=MHLAkKx+2mUH6ws8zyvpg1o+KenVlsQc/oaNDrME6lp3R+HjlpJlZOX1
 aG6/pj6eCg2jxo2QRr1K1ThRm86Ai4gfH32C1MbKrLWB98aZlmWEiEvMy
 oeohIK/nfR4vM8jgtQOdGQYzpDKuAthQTZIaYVpQv0kd9jH5pZEcChUgP
 DhIZA1Kct9/7U3KkIG5W6qMa/kbW0r7QklD9NoXFXWpUMkru3/SHgRZTs
 BmoK2jjIu+Rg476WeQGKNEmS1eg0QM/EhA47/sf8SJxYEyTwSV7A+HMM/
 YlsjOsstnlebv6QoOONvZfy80zJxT1Nri9CLoIYMQsWqVki/FAyZKtNTZ g==;
X-CSE-ConnectionGUID: BIlOdayHSju58pgIAWEtNw==
X-CSE-MsgGUID: bL1Qun1VTGS+j2jBDwytDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37871978"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; d="scan'208";a="37871978"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 18:49:15 -0800
X-CSE-ConnectionGUID: 5zPU2J9OSxiPrK5YRFAI6Q==
X-CSE-MsgGUID: dzfuAYeARu+z1MDyHHovvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107446107"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jan 2025 18:49:14 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 21 Jan 2025 18:49:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 21 Jan 2025 18:49:14 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 21 Jan 2025 18:49:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nohFkIXytk66ww8lQCuyIq1MY7tmKZMcYRMJmw7Ngd5cZrrsEghexPOho8r9OU9Swhyle/bqrCUkiO0ffINWgWF08g3MtsERl6xRv7e+8Y1ZFpXuqSvSsXy7AP6CyYiAxtXsZKDu1LcCBVsgXQ3vAqu61ex6BiMoJUiUOdgCNgj6A37TbTF9uBHFTUHA4z0a+1txetTxHM6jSMKCHcDhvx+CoSB9X/7IBZs43XKqfXXGxBmNVxLLjSCbqzlQ7I2iCJZi38yhrdQrR/AQfsV3RhMph/wUQDi9ly9hJDjwbvOu7Rkv2E1gfkOxwT2Z0HqcZ8v46VnIiPTRaKu7u4wQMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSd68+kZoj5/HIpMULW0QtLnjUag4CT7e3VncAYNVzM=;
 b=ydoyejuQMm3jBcbn8k+a6BetqZFMPTHqiVfentYg0kkZStJUUrkMDprMrHy8iin6sDpDq2FKZR6/5ns/5uE/GRH3Rg++eVJrMdqi+mSym0fX78G/K1b54JX8p2aJPsWTzM/8ZRkH4oFz/VoN0YvTOEEMLUCaGZkYsLurG4LioRDgwPpdJCr3fGENeWznw9Tay4oIeiGYQzZY1X3MBqF8F8b37Yj73kR9AYoJxjYUxyOUKnTh1RqbJsUk0wtNcAGKz88C/5NpDSGvCv4/G+p1LbsZaAR3TUNLT1jQIcrpByyfuPNg+D/lqC8P5H35EVYHWYfGiUHhGJA3kayJlvQm9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Wed, 22 Jan
 2025 02:48:58 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%6]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 02:48:58 +0000
Date: Tue, 21 Jan 2025 18:48:55 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <james.ausmus@intel.com>,
 <felix.j.degrood@intel.com>, <matias.a.cabral@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <shubham.kumar@intel.com>,
 <matthew.d.roper@intel.com>, <matthew.olson@intel.com>,
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v8 6/7] drm/xe/uapi: Add a device query to get EU stall
 sampling information
Message-ID: <Z5BclzMGIn_TIXpR@intel.com>
References: <cover.1736970203.git.harish.chegondi@intel.com>
 <9452fc2774136a6a977655487db7616316483823.1736970203.git.harish.chegondi@intel.com>
 <85plkme6b0.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <85plkme6b0.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0083.namprd03.prod.outlook.com
 (2603:10b6:303:b6::28) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|CO1PR11MB4979:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f1aec0a-e4bd-4b22-12ac-08dd3a8f51ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXExbklhb0IrZGZoQm9vdkdRZThseEVhL2xlY1NDbndpdkZuenZEaWVmVU1V?=
 =?utf-8?B?d2FydXBYc1ZNeURJbWdUSlg2MTRvYVdrYWFCTmVub3lEVVViejViQ3QxYW01?=
 =?utf-8?B?N2tYTGZxWVdjYitOaGw0aC9mdjVPZE50eU1SZTB0eUloS09pcU8wYlM0Zyty?=
 =?utf-8?B?cHVSK0RRa3M2aytPUDZJb0VXWG1yZ010aTcyVER5dHRVVWoyekZ1enBxQmV6?=
 =?utf-8?B?Z3VIeWxuR3VBbHBiT2Z5cWhYdk5XclJGWC9IblZUUWVmemZpdjBUYm5GK0x6?=
 =?utf-8?B?NFdCZGRmd0dGVEFER1NoM0xFREFMUHlRN0tQTGFWbzJ2NjJMQlFXbU1VdEtV?=
 =?utf-8?B?d2F3dDArSU5yRXk4VFlTc1ZTd0hwa3ZkcHNxUGdvb2YrblREQ3o4bmFUS1Ux?=
 =?utf-8?B?MVBGVDlXRitkVDQ1bS94NjZXNmFnSk1hUG1LbVRSQ3BrQU0wWUYzemh6Y0pQ?=
 =?utf-8?B?L2VPRWFuRHdjYk9qcVNvRVpIU29XRGsrcG5EektRSjVHS2d0ZjJpZEJFWjI5?=
 =?utf-8?B?bmROWEVHcEJJbldqUXdqMHk2VitlQXAxT3k3am51S2lDUW16OXNwZGJ3YkhN?=
 =?utf-8?B?K01GVHJWbU1SN1FWRHJWREQzZlczVjNJRnJ4K1JrYTkrSldOakZJVDA4Zm1S?=
 =?utf-8?B?aDI1MnZPcFBMZXozQjBRM0VBZC9mVCtkVG83c2pjem1vcFhybFFIQnR4T21X?=
 =?utf-8?B?eVNPdjZIVmc3aG5kODA3M1IvVk43VHM2VTdQNXc0NHVybmVLUnJlRkZYUUJX?=
 =?utf-8?B?blFBUkpjNC9lWC9tdE5QSk15azNtcUVkYnFVZTA1YTVKMWo3U0U5RjlEQi82?=
 =?utf-8?B?WDJZakM3ckRRY1AwcFIxbWNJNnhSQmVDTU9jOFZkeng3TkI3MnhRR2U4S01l?=
 =?utf-8?B?OEswdVNJemk2V3NaZkIrUTlGQ0tXWFphQzE4dW02V3NnSGcwWDQzSnZiMmZo?=
 =?utf-8?B?cHRuTDlRcXhZV0pDTlVHNmFFTmJ4NjNJeFBTNlYvTU15UldlczNyTnVicUhO?=
 =?utf-8?B?TEJwQWpUb1N6RlV4bTlwVHdwM2IvdUE4Z3MzUjhod010OTNWMTZRMWhhVkhD?=
 =?utf-8?B?M01ZZlN2NmJYcDZEWHVBTVgzK28ybWVrNGFaVmwxR3Jpait1c2NTcE9yMzJV?=
 =?utf-8?B?RFBrMC9zUHlRVy9wQUJ3eHpMOUMzM0xHa0hFSGx0ajF2d3BTT0R2NFV5OUhw?=
 =?utf-8?B?Y1ZzdHVuZW1uN01rN2RPSUZST05MYlV6YmoxdU5PN1MyYWVYQU1uUkI2dnR6?=
 =?utf-8?B?WWM0RzdSaG5QY1U2bzhEL1NiL25mNWtITW1vQWc0ZUI3WTU1TVh3L1o0ckhJ?=
 =?utf-8?B?djk3OVRabnBWVDRScFcvZUVwM1dsTmdVVjQ4TmNKZ3ZyaXZrT1MydVEzR3VE?=
 =?utf-8?B?cHZUaDJPUjdWYTNvYU1OZmhFVER6Ky90SE9qcFR1dlE5YW5PZlJPV1NoZ282?=
 =?utf-8?B?SldkMTV0aG15SlVxUjd3Tml1RjlmQmNqbUpzZ2oxYVhKUVpVU2l5UmFVNVUz?=
 =?utf-8?B?TFQ4bmluWStBOURVcmF3WCtwV0J1SzRkUnZRQUU5L0lSaDhhM3d6NzVJN3pW?=
 =?utf-8?B?azBPc2hjODhzcW5QV0dXaEY1SXJ4dWlmZmdBU2IzOTlCbkRrUW1aQ1dDZzYx?=
 =?utf-8?B?UVVwOE01VmVCQnlNSEIwUW9Bc0xZVXZWWjMyYUVDaFgrTFdrUWkxaDlwSkgx?=
 =?utf-8?B?QnlqT2pxNFJ1by9hbmdvK2JMVi9ITDJDQnNsZGtrZHdDT3ppa3dzVVVxRDYw?=
 =?utf-8?B?dFEzL2pHSDcvVndCeTREaklCd2t4K2FwSndYRkFZL2dvTWNmZHpPWVFQVzFH?=
 =?utf-8?B?STlHNG0yK0JMVW1TL3RvaEZsK2xMdXhkRHVoeDRkekErNjFPVVlPZGo5TUUv?=
 =?utf-8?Q?MWw/S8FA8IuB/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VldTVEhyQ2pPZU44ZENLYmZNZlgweEg3SDVQZVlCT1laYThNYm5oTjVWcVFJ?=
 =?utf-8?B?RXFaOG1GNWFmdXpSR0tNUkEvdzdzQ0pDY3FZUFdrTyt0Y2pIbDFPSHA2QlVK?=
 =?utf-8?B?eUNsU2FSWk41cmpPZHVweUZkNGZqeS9rRVpBQkFqK0tEc3liRVQreFlWc0lK?=
 =?utf-8?B?K2JDWks3eUlJTnRIVEx2azZnVktJSzcwdWJxbnVDc3YzOGFOUml0ejMwMURU?=
 =?utf-8?B?c1NsL1FKYm1FNVg5Uk9BaVRISnJuaHlKOEpUaTNCSFUyc1lHRzFXblgwdjEz?=
 =?utf-8?B?dGFhOHkxT3Vzd0wyR3JRT1VEd0k4U2dabGh1RHFnMmlKSFQwaUdRYmw4T3RX?=
 =?utf-8?B?VWZvRmpSbEJUbVlmcGFNV2JZc0F2VVhJemJFWHFyWnFxZXlKY1ZhMy9aVitv?=
 =?utf-8?B?VHhpNitvNXpXZ2diRDl2YVNYTkFXam9pMVV0clhLWjJ5SXdOM2QvQ0NtZ09z?=
 =?utf-8?B?U2pEcU9rL21hRWJ6bE5IVTJrS0VPWS9KKzFrTU15MCsxZTI5S2JKQnpzcFpw?=
 =?utf-8?B?b0Z4MTVRL0RRQWM3dXp4ekkxbGMrZVBwN0k1eHh4cVRGaWFSWis1Ym00TVFh?=
 =?utf-8?B?SDVnWmZ1LzJXeE1rcWpXK2FEMHZURjNiamNFdEhxWXIwSmRuR2dFbENRRzJv?=
 =?utf-8?B?QnVKQXBWMkdjbW54MXBXcm1RM29OM2p6S3NoYW00SkpTUVhzOUpWK1kwNU4r?=
 =?utf-8?B?L3FqRis1WW5EVEhUVzk3MmJhT3BMZ2FwSlllbzlhSkx3WlpLbE1zbVl6cFl4?=
 =?utf-8?B?RitSZW04MmtObVZkcG91dnN3V0ZoaVU3MnV3V0NHMEt3aHh1TmJoNEdYRWpr?=
 =?utf-8?B?aENkOEVXT2tKVkJDOVJVeFVPVExMa3FZRzdFaXRjYmFRUVdCWUdRQ25QeXFn?=
 =?utf-8?B?QmZDNmM0cWJWVWhPZXNjRllqdmlGZE5iazI0Q1U0eFQrVGZITWRhQVgrQWhv?=
 =?utf-8?B?TWswR0t3SFFsM01QS3FUQ0t3NUdKazJReWJLRDBWY2pOQ1RUNVBTSWNZd016?=
 =?utf-8?B?L0czalRLRzB0VGlpTFV5Y2dadHJQQXBDdDVGVit4cm83dExIZzA3Vm43UjhT?=
 =?utf-8?B?TkU5b2F5cFh5QXVCa1VWQkNZb3V6ZDJaT0N1MUJxMVlwQ3ZRTjE5b2hFcXJz?=
 =?utf-8?B?SWlIOTVROUFUN3dJdm0zZmRyVklBeFlvN0FVUCtpN2xadTE1WlFxYkhHNXB3?=
 =?utf-8?B?cC91ODBFT0o2SVk1SFlyeGxCQ1JHamhuWlBiR2JBc0kzWnFNbjROQkR4T1N6?=
 =?utf-8?B?a05iY1dYVS9aYnZpeVRWc1ZVOGRHU3BJWnlKTWl5NXFjcHJ3bFRidWpQakNH?=
 =?utf-8?B?djdJMWJvaEppK0VSekUyclVvbTVudjdCRllzWnFDcXNFdVNuam9Bb2hCVk5R?=
 =?utf-8?B?WXBUR3UvaE5BZ2Uzd2xPRzQzNnk2dmQ4S1gwa2ozYnN0TGgxZXcvZm9XMmp4?=
 =?utf-8?B?dE9YVCtXbDhreUZZYjY3YU1veTVVazhtTFl1a1NvY3lxT2J4UkVVOTdXTEtX?=
 =?utf-8?B?RVBqa0pXVml4TDVmZVVsWVdyL1VUQlJWV3ZTeFlNQU9hUGFPOFRaRTllUGFF?=
 =?utf-8?B?NDJ0dVJybm83eGM0cmExR2c3WHNxNVFUQkFHTndobjdZZWJEb0kzVDhYSkZI?=
 =?utf-8?B?d1VHOUxTeVVSNlhvU3JUTjhzR1MxZDJDbU0raFBLN05qV0J3dlZuVUZ6VDRS?=
 =?utf-8?B?UmVqY2E1ekJybVIyNDl3YkxSa3NPVzZWMUQra25SRktDMVRIRXVxVXFiY1ZU?=
 =?utf-8?B?dWgxWVZJUFcvcm9sdCtvTlg3VkxHN2tkVC9DaWZtTkx5SUhjYmFhT2M1TTNF?=
 =?utf-8?B?d2tqbFVTS0p5bWtZTEJLbmllTEhuVlZJS2RreGtBdTIyY0xiUCszbU54bmUz?=
 =?utf-8?B?VElWK2VSN2N5bzhMOTZKSVRxT1VqYWQxQjJJcDBpbWxwSktpbmRTWEtpVmNh?=
 =?utf-8?B?cWpMMzJXQXp0NEt2TWtPcUxLTlB3bnczcUpGbHZ5Mi9BSDBHeUFPSVVDNnJm?=
 =?utf-8?B?YzNuNm9EcFhWK1kzNFdvVXptSjdXbE1TQTZUSzRIWDlMV3JwaFgycnVHUlpz?=
 =?utf-8?B?UzFTUXU1enA4QkprS05PMndwaHJhVEM5eUhTdVp6NmtMQ04xWGhEeXgyUVVL?=
 =?utf-8?B?cTJMZGk3dUM0aE5wa3VMR3pabzFTaGg2d2k5UWVZcVZaclB0ZjZCb3l4ZXBH?=
 =?utf-8?B?UEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f1aec0a-e4bd-4b22-12ac-08dd3a8f51ac
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 02:48:58.2552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7xWxBoNIgosUzqOKkFgh1cy3/e/u0oEtWTpI2NTcBWpyMd1SInW0/z16GBNSqu5vkBFGSzSz5x09J4OGTdIAALh+6DS1osAeBZT6qXUNkXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4979
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

On Thu, Jan 16, 2025 at 02:34:59PM -0800, Dixit, Ashutosh wrote:
> On Wed, 15 Jan 2025 12:02:12 -0800, Harish Chegondi wrote:
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index d9b20afc57c1..7d518f97ba34 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -700,6 +700,7 @@ struct drm_xe_device_query {
> >  #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
> >  #define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
> >  #define DRM_XE_DEVICE_QUERY_OA_UNITS		8
> > +#define DRM_XE_DEVICE_QUERY_EU_STALL		9
> >	/** @query: The type of data to query */
> >	__u32 query;
> >
> > @@ -1754,8 +1755,8 @@ enum drm_xe_eu_stall_property_id {
> >	DRM_XE_EU_STALL_PROP_GT_ID = 1,
> >
> >	/**
> > -	 * @DRM_XE_EU_STALL_PROP_SAMPLE_RATE: Sampling rate
> > -	 * in GPU cycles.
> > +	 * @DRM_XE_EU_STALL_PROP_SAMPLE_RATE: Sampling rate in
> > +	 * GPU cycles from @sampling_rates in struct @drm_xe_query_eu_stall
> >	 */
> >	DRM_XE_EU_STALL_PROP_SAMPLE_RATE,
> >
> > @@ -1767,6 +1768,41 @@ enum drm_xe_eu_stall_property_id {
> >	DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS,
> >  };
> >
> > +/**
> > + * struct drm_xe_query_eu_stall - Information about EU stall sampling.
> > + *
> > + * If a query is made with a struct @drm_xe_device_query where .query
> > + * is equal to @DRM_XE_DEVICE_QUERY_EU_STALL, then the reply uses
> > + * struct @drm_xe_query_eu_stall in .data.
> > + */
> > +struct drm_xe_query_eu_stall {
> > +	/** @extensions: Pointer to the first extension struct, if any */
> > +	__u64 extensions;
> > +
> > +	/** @capabilities: EU stall capabilities bit-mask */
> > +	__u64 capabilities;
> > +#define DRM_XE_EU_STALL_CAPS_BASE		(1 << 0)
> > +
> > +	/** @record_size: size of each EU stall data record */
> > +	__u64 record_size;
> > +
> > +	/** @per_xecore_buf_size: Per XeCore buffer size */
> > +	__u64 per_xecore_buf_size;
> 
> Someone else should still probably check if the term "xecore" in
> "per_xecore_buf_size" is appropriate. I don't know if it is, or if it is
> future proof, as I had remarked earlier.
Had a chat with Matt Roper offline regarding this. He said XeCore is a
formal name in the hardware for a GPU core. So I think this is
appropriate.
> 
> > +
> > +	/** @num_sampling_rates: Number of sampling rates supported */
> > +	__u64 num_sampling_rates;
> > +
> > +	/** @reserved: Reserved */
> > +	__u64 reserved[5];
> 
> I think we should move this reserved array before num_sampling_rates. If
> later we take up a reserved u64 (replace it by a different struct member)
> we'd want num_sampling_rates and sampling_rates[] together.
I noticed that in structures with reserved fields, the reserved
fields are at the bottom of the structure. Although flexible array 
sampling_rates is at the bottom, no storage is allocated for
sampling_rates. I can move the reserved array, but is it okay for
reserved array to not be at the end of the structure? Even if I move,
the num_sampling_rates and sampling_rates[] will be next to each other,
but no storage will be allocated to sampling_rates.
> 
> > +
> > +	/**
> > +	 * @sampling_rates: Flexible array of sampling rates
> > +	 * sorted in the fastest to slowest order.
> > +	 * Sampling rates are specified in GPU clock cycles.
> > +	 */
> > +	__u64 sampling_rates[];
> > +};
> 
> The Mesa PR still seems to have some data structs from an older version,
> but after addressing the above comments, the uapi introduced in this series
> is LGTM, so for the uapi:
> 
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

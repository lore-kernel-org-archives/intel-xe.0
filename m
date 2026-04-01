Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB10410FCAE4
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 21:28:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF41D10ED1E;
	Wed,  1 Apr 2026 21:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C2/6dLK7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777A210ED1E
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 21:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775078901; x=1806614901;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fS2/hbsyzEmXpgHt2dkvFD3Taiaux9Bbwbwo1gsgCSM=;
 b=C2/6dLK7rfFvoFJivVq5vuYUXl0QH93OWE6/3fwb257A2FyivEpHAc1+
 JY45yJ/vZ7s1H19jV3YZfJ/oEaUNTOEGxcCpGts6V6g4hh/UrMvue8+Ay
 JWF2AGhlmT+pgymN/M+QFyAc0ja+CipPOSK1p7vG2QS7ZSG9rx1nOdJWi
 dNJNW4jY6tF0lDxuwqEl/8Y1JKrO22CS2RxvCs/cVqsZ57d3jbzSLIljE
 6ioh0klqpDLcmTQT3GX59Y21I7ntHNJSKisuSvgnKZZH2jZnkwETzpxbD
 dvRSwmHpjlJdeL9PP+Yx9kCpjCqlA05VIQ8KpuQvCiacmR/AYuI8Uw80U Q==;
X-CSE-ConnectionGUID: lUNo9VSnTyiUtNgPZO6G+w==
X-CSE-MsgGUID: aqd7q+hLRPq7p0wTTDPnNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="75167899"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="75167899"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 14:28:21 -0700
X-CSE-ConnectionGUID: 9CP1kTVGT+eSW8NPVWIDUQ==
X-CSE-MsgGUID: vGvAznQcQNaxo4EURdRXvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="225777479"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 14:28:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 14:28:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 14:28:20 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.59) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 14:28:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k9f/thBTrls6zemdcK2jDoaiBkT7FF/x1+GMpjprFpR6uWpmhPuGRDzWXVnnVzCYM9mm8kvmhGQuN0YH55ihuHgY4Y6CR5NcerKXQznteuODNOR37PFltalu+PJah40sYM+x487ulnEQ0/wjLMNDutIwNBj43Xm91TcpI33S/AEvFWJTvPtPhy94G9NB7io1HMVcYizgD/HZ7dtIxIwuan2wz7xDRUvxQF7BSLu1I822j0SNLZYP/9eE0nHOuE3xryinq/NPJ8C3+14+kXiCY7xSYntfWro2Pr/c4GUNYFpoJdOcoQ063zvq7Zd9nzLP48Aa0IKSBcKgrTM3NzwkjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbkq5c8fmviwxbGje7Z+okGm8lBKrA5RZOn74WJyjPU=;
 b=AOTX9Xczmci4pCUwmPUtA/nuG1XwVeaHV0WM0t8ZmD7a1pO1qTJxI/jPCNnHs8BNdcJ2zyNQQkq4GwrGfArF5KhkNZhi7SP6+inhjcq2kMcqZv14aFsuMAp7e2xojLnGzCE+fnVyE7nK51D6LZoF7q9EGO/MZqZE9lJuM0tu4wkHkbgIxn+B6cUUg3HRAJy9a8Do2uoSKIFY6u3CSDqZ0d60RGdxBolm0RGd8qSFv91de0yP38ulRQrzdu1GuGZHZ7F9e3e8qx9s9mIoI8l+35OAixV3PfbpEi8wm2r8k3Niu4oGPuueYDjSl/Uqf/ToR6sThL4GhF3w9ffup9vOdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CO1PR11MB5204.namprd11.prod.outlook.com (2603:10b6:303:6e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 21:28:18 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 21:28:17 +0000
Date: Wed, 1 Apr 2026 14:28:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <stuart.summers@intel.com>, <arvind.yadav@intel.com>,
 <tejas.upadhyay@intel.com>
Subject: Re: [RFC 01/15] drm/xe: Add xe_usm_queue generic USM circular buffer
Message-ID: <ac2N7WrbfaInoIjk@gsse-cloud1.jf.intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
 <20260318074456.2839499-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260318074456.2839499-2-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0255.namprd04.prod.outlook.com
 (2603:10b6:303:88::20) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CO1PR11MB5204:EE_
X-MS-Office365-Filtering-Correlation-Id: d4462a22-4cc0-40e4-9ca0-08de903596fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: T4LRDPmOUigNyZ7VM9uYvA0PudOgWbXE8J2rvcywkPEAaNFt+yKH0+pAZSGxmkJhaz+DTjBJpXZFaPZ7k4QJdx5/o/QD2SccDHie6WsHo+tvN8WAdspqnQ4jzslBgRto4Wvckr06xR9Zw41CuQlOFxm+/mo+zVJSS9HdDOzqRVxqPsYVayBkxM+Lp7/FeQLQRlw5OsaAJ0K9vTy99LA6n7wszwrPWRVlWMlG80TxxqZgtSYt5gty13hxRvTxt/y0iuMlLXY4n5/m/587ewvOkOJM859Y0bG0Oz+r7BLtgxV4ejpTdH9daN6ElTFJmY5fL5uwzrwawEWDF6jX87CwLRjOtITkSbkK8njXVNrxF11nAcwOo8Myqvu6AyCDUcem+bEyYOJt58hk3rMnY7sgkvFET3QJ0wD83VxKy2hee9cmcPHUgHDXb3hGoRds1QmwDb7b+mo38YQ1uf1W2kYUej98adII0loyLyz7iaT0UUunN3xK8AKdMCVgKLqkVN7m3C4EeyGlRUdyNyCGQex5fLG8QOFpIa5kTF6CnZaig9afWFhfcyn8Rt4pE6x8pQaFZL4Cle2SjTtmzxY0JmWY78EpYQrtUeW+6AaRykQR3FJ6dcnoOzcUU3hWlMv9r2uii5fnMbpDl9i4rLTHHoXzR6l4LAaYbS895UUsKpSkjCrfZ+QWkW2LHuKr6tIBMJ+W
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTh4Ly91Wk10c0tuSW1sSDcrQll4OVkwZ1FjZ3lLeXlkMnRqWEJGemMzbUE2?=
 =?utf-8?B?SFZwOHhEd1NGTkJhTE05dk9QdTJucWpSU3Y4a0ZXV2tsYVk5ZXN5c2FXelpP?=
 =?utf-8?B?OFA4N0U5ci9Na0pFUC9meDh5b2FqcU0yUHllMGVhVzFac3hGRFllQml2UDJi?=
 =?utf-8?B?aFhCdjlUSHJQUThtaGh5RmpCblJRb2xzWTFEcGNFeXc5TmpJcnB2ZHE5bEVr?=
 =?utf-8?B?TkZiVHpSNGV1M0lFaHlhb1A2QUU3NmttbjdCZGNBeGdWZ3E0TmsycWRTSHZh?=
 =?utf-8?B?SWJiNzJLeG1DK3pNVVNIWnZEcDZCTkhqOTRuR3Uzck96R21kL1B2UWdrK2dZ?=
 =?utf-8?B?MHkyd2RtYzE0cXFYempKcVl6RlVma3ZibXdNNEtSVS9MWDlFVXplenVBWTdG?=
 =?utf-8?B?Rkk2ZUg5RzZkS3M2K2pMVFl4ZFVsRnRwek9aUk1xZmViQVJKSjRVTzFTbHRH?=
 =?utf-8?B?Y3JyemRMSXFXbVR3YThpQ3hEZXZEQThZWS83Mk9QdzUwOE1oc29EMVFEK2t1?=
 =?utf-8?B?NkNhMGQzZG1CV3p6UG54M0toMEpIUS9hWEFCTFNxbFRHRjBTa2pLdU1MSjdm?=
 =?utf-8?B?cVZmZ29jelpuc0tDdGlBZkZXeWtEUkl6Z1BJSFdTOTlGaFcvSFpRWHZISkhR?=
 =?utf-8?B?czNzdmRGZUlScTlURWpGNllWbzFnVnd0a1BaenRudE81R2s1SExQV3gvekhh?=
 =?utf-8?B?YnE0L2dLT2RLc21QZmRsd1lWQ1FWQzBSVncxNjJPYlc1NFhLNUhBNTJSNnJj?=
 =?utf-8?B?VHZkMnpJOE90QTVyZjgyaTUyYlFkakVjYmJVdGdTM2x2ZkF5OVBqY204WS9S?=
 =?utf-8?B?ZzVTa2xTR0JzL29yK25LZTA4Z29sSTZsbmEzQ3QvM2E5eFdFdFE3cThSWkxs?=
 =?utf-8?B?UTVmNFl4dXBJUzN4MlFnVW4xeU1QU2F0NitIM0pzRFh2NjVrZnM4OHNpQnVY?=
 =?utf-8?B?UWcyTnFDMGRyRTdraXZKMFdMMnJuYkN1NVdLWHQ0NUxRZGlwWXlnSkRzWHhU?=
 =?utf-8?B?aGhsM3drRWxwSEhCRUJLWkJVNCtST21ML3lKRU0rSUtRTmNKam5HeXFPc0FU?=
 =?utf-8?B?dXVUTHR1SGZNUERNV1VoY2hjZnI5c1VWTlR2amk1a2Z4enlUTFFPaWFqYWFv?=
 =?utf-8?B?L3h4SUUvNTR5LzFITzZDL2dYTThNQ2wwNkJTZm1LVHV2N3ZnUGV4S1RrcVNj?=
 =?utf-8?B?bkpUNVBQMmNhNERGbXB1K1hMcUp6Y0loc0NkcjlTSlM3NVVqUlliYTBna0tl?=
 =?utf-8?B?b1YrM0R1YU41TFU0M3J3NHQ1RmNHYU9QQTJ3Qm1qSUFJZzMwd0c1dlpudzdY?=
 =?utf-8?B?KzJySnVMZFYvamx1aDcrUG90dEdnWGpVOVRiR1F2QkYvWFR1R3BLNmJxK1FF?=
 =?utf-8?B?NFhVSnRUdkFaQ1BRSWJjOEFzOVNPd2F2VURWRE5lZ2FqS3o4cFFlaXJ2TlRq?=
 =?utf-8?B?RnZnM2RLZEwxZzlMTEtUbVhEanl4bGZCTHdyVFBUVlpUaWFpc3FPaXVVTUM0?=
 =?utf-8?B?M1BRb2lmUDBOKzRDMFV6UWUweGdBVHlLL21Ib1dYTmNGVU9ELzFRdHFobnd5?=
 =?utf-8?B?TmZmcTFWaDd1K215K0lOQTRiVHMyNGFaWURsK1NMMXY3a3NYVkRJWVo1TndN?=
 =?utf-8?B?VkVyNm9nZmRqczBtcFZpTFFvYWpXY2dtNzdHMGRGN29JVE05a1FNU1pXNVRk?=
 =?utf-8?B?Vmg5Q0hTRm50aVpEZWhWcVR6MmE1NXRXSTg2SDVvNUNUOXVBZkR1UTk5Q2ZC?=
 =?utf-8?B?Y0E1ZHNUY1F3YUFoL1lnNjgzQTZiMk92MmpuaWtVdXVQeFgrWGhxR0dUQWhv?=
 =?utf-8?B?UXhHalpHUlRNdGZPczEwd0hvRDZGVzdBekYxOWViQVA0bDlCTURJL2RkLzlk?=
 =?utf-8?B?SjBudndrL0NrLzZrQzcxWUpaOXJRbGt3ZHd2UC9Pby9WUEl2ZlRFelVtYzNQ?=
 =?utf-8?B?ZHAxZGt1a0E2aTd2ZnRrYm5JTzZQekFrbXFpa2pLdE1qQ2Iwa0xETzVhWXVy?=
 =?utf-8?B?YndWcDAzTG5Oc3VDZnJqZ0hOcnk0aFNVQ05uRFBjRmhWUDVxMUFWN0NkRzB4?=
 =?utf-8?B?OFVTVVdJUFE4V29FYzRrUFFLNTY1b1lGU3gzbU5SYWxvQktiZVM4Z080UzNq?=
 =?utf-8?B?TytCOHN0RGo0a0VMNDFaYTB4M0Frb2tEaytXenA4Wnd4MmROanV0Q1p3dkxi?=
 =?utf-8?B?RWtkS3RXQTB3RnNjSnBCekdXT1lpNWtPeldkanpZa0xid1JZWG1BUTlCUmpJ?=
 =?utf-8?B?YU4vcm1JejBKOHB1MWR5c0lBdU1lSWNCN1ZycmJ6S2M1a3lUbm5rczZ3VDZX?=
 =?utf-8?B?dUw2T0MrQ2oxem9VVGFiZU92MXVjMjdrQnNVWTYrZmYzQ3BrS2xZcTlNUHpr?=
 =?utf-8?Q?tUsRwci5q74Eax10=3D?=
X-Exchange-RoutingPolicyChecked: TvxDEm8NT+J5Ri0HWPdncOJbryTZhOG6FdlwG1tQoSi6HQGnCTgJtBfQYlZm/MmLnCGFcczruzb+vJ42udeaykcXmO2zFYfYSGwklygqs3LEE4WhnPE9QJenAhhKF0B7giiVr8sgaWw7jJiWXxiLl8EFVzvfrbI8rQfrgx4sEr+IvztTZg834tNjitbc8NXkMusGfDIyMSZDDR8R+KivZ5Bno3o2PmqtrM+n3Jaq1CBCN4qRGEbnq0xLpoytmHHCttpfphMMy0bFX3ckxgK6xQqjcl+wkSETTmUlEF3Bz8eaZDDLMZi/5Y6e4I16vbpsekVrNX9AhURpM/fBAd1TdA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d4462a22-4cc0-40e4-9ca0-08de903596fa
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 21:28:17.5439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t757ZJBaXd1u0XawQKQydG9/ktoOJhrCUrzHr0H0nrRVYti5TfX57NtXZUD8MI0s0qFP5aAGCEVgBV69TfEkaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5204
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

On Wed, Mar 18, 2026 at 01:14:42PM +0530, Himal Prasad Ghimiray wrote:
> Introduce struct xe_usm_queue, a generic lock-protected circular FIFO
> used by USM consumers (page fault, access counter) to receive fixed-size
> entries from IRQ context and process them via a work_struct.
> 
> Provide three inline helpers in xe_usm_queue.h:
>   xe_usm_queue_full()  - CIRC_SPACE check (caller holds lock)
>   xe_usm_queue_pop()   - dequeue one entry (acquires lock internally)
>   xe_usm_queue_push()  - enqueue one entry (caller holds lock)
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

I think this is useful, but right after I suggested it, I changed the
semantics of the page-fault circular buffer to be a single buffer [1]
that multiple workers pull from. This eliminates HoQ blocking (e.g.,
five access events are pushed; the first one takes a really long time,
but the other four are much faster—yet the fifth event gets stuck behind
the long-running one). So maybe start with a single-queue +
multiple-workers-pulling design here? This likely matters considerably
less than the page-fault cases, but overall I think it’s a better
structure.

Also, maybe the xe_usm_queue can be reused by page faults, but the
management of that queue actually gets more convoluted in [2] to
implement the page-fault cache that greatly speeds up storms of faults.
So maybe drop the second patch in the series for now to avoid conflicts,
and if we can converge on a shared xe_usm_queue implementation later,
great..

Matt

[1] https://patchwork.freedesktop.org/patch/707293/?series=162167&rev=4
[2] https://patchwork.freedesktop.org/patch/707300/?series=162167&rev=4

> ---
>  drivers/gpu/drm/xe/xe_usm_queue.h | 100 ++++++++++++++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_usm_queue.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_usm_queue.h b/drivers/gpu/drm/xe/xe_usm_queue.h
> new file mode 100644
> index 000000000000..5dc2d692d8bb
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_usm_queue.h
> @@ -0,0 +1,100 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_USM_QUEUE_H_
> +#define _XE_USM_QUEUE_H_
> +
> +#include <linux/circ_buf.h>
> +#include <linux/spinlock.h>
> +#include <linux/workqueue.h>
> +
> +/**
> + * struct xe_usm_queue - Generic USM circular FIFO queue
> + *
> + * A lock-protected circular buffer used by both the page fault consumer and
> + * the access counter consumer. Producers push fixed-size entries from IRQ
> + * context; a work_struct processes them asynchronously.
> + */
> +struct xe_usm_queue {
> +	/**
> +	 * @data: Raw byte buffer backing the queue, protected by @lock
> +	 */
> +	void *data;
> +	/** @size: Total size of @data in bytes */
> +	u32 size;
> +	/** @head: Write cursor in bytes, moved by producer, protected by @lock */
> +	u32 head;
> +	/** @tail: Read cursor in bytes, moved by consumer, protected by @lock */
> +	u32 tail;
> +	/** @lock: Protects the queue head/tail */
> +	spinlock_t lock;
> +	/** @worker: Work item scheduled to drain the queue */
> +	struct work_struct worker;
> +};
> +
> +/**
> + * xe_usm_queue_full - Check whether the queue has no room for one more entry
> + * @q: queue
> + * @size: exact size of one entry in bytes (sizeof the entry struct)
> + *
> + * Must be called with @q->lock held.
> + *
> + * Return: true if the queue is full
> + */
> +static inline bool xe_usm_queue_full(struct xe_usm_queue *q, u32 size)
> +{
> +	u32 entry_size = roundup_pow_of_two(size);
> +
> +	lockdep_assert_held(&q->lock);
> +
> +	return CIRC_SPACE(q->head, q->tail, q->size) <= entry_size;
> +}
> +/**
> + * xe_usm_queue_pop - Pop one entry from the queue into @out
> + * @q: queue
> + * @out: destination buffer, must be at least @size bytes
> + * @size: exact size of one entry in bytes (sizeof the entry struct)
> + *
> + * Acquires @q->lock internally with spin_lock_irq().
> + *
> + * Return: true if an entry was dequeued, false if the queue was empty
> + */
> +static inline bool xe_usm_queue_pop(struct xe_usm_queue *q, void *out,
> +				    u32 size)
> +{
> +	u32 entry_size = roundup_pow_of_two(size);
> +	bool found = false;
> +
> +	spin_lock_irq(&q->lock);
> +	if (q->tail != q->head) {
> +		memcpy(out, q->data + q->tail, size);
> +		q->tail = (q->tail + entry_size) % q->size;
> +		found = true;
> +	}
> +	spin_unlock_irq(&q->lock);
> +
> +	return found;
> +}
> +
> +/**
> + * xe_usm_queue_push - Push one entry into the queue
> + * @q: queue
> + * @in: source buffer, must be at least @size bytes
> + * @size: size of one entry of in bytes
> + *
> + * Must be called with @q->lock held.
> + * Caller must check xe_usm_queue_full() before calling.
> + */
> +static inline void xe_usm_queue_push(struct xe_usm_queue *q, const void *in,
> +				     u32 size)
> +{
> +	u32 entry_size = roundup_pow_of_two(size);
> +
> +	lockdep_assert_held(&q->lock);
> +
> +	memcpy(q->data + q->head, in, size);
> +	q->head = (q->head + entry_size) % q->size;
> +}
> +#endif
> -- 
> 2.34.1
> 

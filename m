Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320EAC3DA45
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 17:12:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0122510EB1D;
	Thu, 11 Jul 2024 17:12:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iQxxnnnx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB0B10EB1D
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 17:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720717973; x=1752253973;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=VA90kxjhRYRKxlHJqOWzD9ntfvq9lu4Mnb5GrUV/idc=;
 b=iQxxnnnxWPdFgyFgelfCaZisaiEbUxy6ONGoq6q2LNZCENknVApyHo/o
 SoAyuZSYj725dY5Y7ezAU/TMsvTzA7YSIzPrZTu07zB9m19ymHkueQcea
 RFf0PBODC1qNhbQL4CTu4WqpySDElEQ5gd7UFht6v2V1dVkEl0IjpZpN3
 z3vCivvPrWYRhpZngGs7sYccqLnia4JVh1QYDdCXy23SReS2xAKkKEFGR
 pytwlktff+urmzTeJPThpiA/Uj91Hn8yGoVepsKv/qDjhVn7N1sNTGwqf
 iZJ9M023wCbafpN6FIFsTWV++fU+b9PqoSViSAT+yJVLw88iwFM5GgZXq A==;
X-CSE-ConnectionGUID: cWsHVxSASSiLpIwM6KioTA==
X-CSE-MsgGUID: t+e4QrGKRouUbAZfJdgikQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="12505294"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="12505294"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 10:12:51 -0700
X-CSE-ConnectionGUID: fDpfEwVfSLCtymnUp+NHQw==
X-CSE-MsgGUID: QJKk5MB3RN2fuDKcepQNpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="49058444"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 10:12:51 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 10:12:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 10:12:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 10:12:50 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 10:12:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HmJ9cMTD1KsvLOSdIop/gbG6OvWIxr3OQOHUO0LbA3zX6DlGtgSmmAG13Q6ylSOPwiul0d9vymuS08WSDBRoe2CgYTdHpKOjZ7uX92VX3HYCPFoWBOPUMCX0WnkNmC2qpCgjRt1g/t1RQpZdny2Q48kH4cJyHHrCZW0gaNEV20Go17R9+/VPZhhlKcyhJg6QQkTJWLnX9bWH1UMtpRnZw1GHBFODMHbTzp/mVRe8DmtNmtgqZHLGqoYYsNz1/GspssIgo03/evJ2pyz93xuPwBz4CpQRVjegbu+ANwq1pEKP1irqsb8/XbXLuTAisQrUg5JRALSlevo/uSpLJtji8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RftzIoFpjXMiSOFUP2nClmLAEWB7Qz0OJQK6hGwHTUo=;
 b=ahcQPsl3+epm5MxZvBntt7KAN5jbzF1waZYTx5Jno+JLk09itahYxRI9WFSnF3J+ZafTbNDjG6t6KR9U58yphZVvi/9fzBMiqV3xEG+BSbX8NS6J/gMAr0BInXxtoo1fVJhPzf7Ap6Xtyw/g/ekiDQvkCGM0ZjFnLxlnlprlXvxP1+C5QgD1I7UmyuBpcTBLsgsxw7ytaSsSHQ89GeMLhg+G43NYrRKpXb3ufXMHYulYvw46S96CfAo9mTCS7VITDyKRKYptxtOeyYgTGxkmosrlwKlFzYB5bvG1kCUNlNTDspDeL0s1dQnx7X6NLct+HvW7LkwQWWdNRzQ0Gha3ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 IA1PR11MB6393.namprd11.prod.outlook.com (2603:10b6:208:3ae::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.19; Thu, 11 Jul 2024 17:12:48 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%3]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 17:12:48 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Paulo Zanoni <paulo.r.zanoni@intel.com>, "Francois
 Dugast" <francois.dugast@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 12/12] drm/xe: Fix missing runtime outer protection for
 ggtt_remove_node
Date: Thu, 11 Jul 2024 13:11:55 -0400
Message-ID: <20240711171155.173717-12-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711171155.173717-1-rodrigo.vivi@intel.com>
References: <20240711171155.173717-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::18) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|IA1PR11MB6393:EE_
X-MS-Office365-Filtering-Correlation-Id: bd248f34-f37d-47ac-387b-08dca1ccb011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1hZaFRHcTl2ZHczaXhRMzM2VUF6dlg2UVUxanljTHVEMGxxRVJHV2kxVUhP?=
 =?utf-8?B?ZGFZdlFENmRTSWJyQ3NiRmh1Mk1CemZIYW8vZld3SWhEbmtoTFpmak0rN3hQ?=
 =?utf-8?B?WFFRYWkrOFgyeEtPRVRaWndlWUdiOHZ5OVJrUWsxVE9uNUxSV05TenBGeHB5?=
 =?utf-8?B?TW00V1Vsdng4UE1mczY1VmowbGN3M3czQzBubXR0dTdUcHUyVFlZKzViN3hE?=
 =?utf-8?B?SEJtWGNEenJXeEhkcjFHeUlkZFRsTGY1V2VYQ1pycnowNDRoYzY1UldiZGZv?=
 =?utf-8?B?cmN2RkdEMExLd1FOSnhHWFlMYmdrcFhSem54OG5hUDVaQVJXUjgrN2N5ZXNa?=
 =?utf-8?B?ZUVxcnJyL1JMakFiZzJ1dUNpSDN2WWJONVNwLzhVRXNhdzlvTUVWNjZsd0tG?=
 =?utf-8?B?VU04NUdxMy9kZlRqN291ckdhcDVxZHRlVlV4WUNia3VBZ0VvelYveGpjRUM4?=
 =?utf-8?B?bHpiZC96Sm50eHZ3OWJTOVdKM0JDNnQxVG10M3d5eGl0TWUwNVVoN3dXV2Vo?=
 =?utf-8?B?WE9MTTM5UUp2aGF0bW9ZS1U0NWtIMzllTzRDQnIyaTA5UFo1WTIwUm1kL2FC?=
 =?utf-8?B?ckVpTyt2UGhuM05aR0REeWxLOHBBUWY2MmZVSy8vdHN2ak5vRVoxcVFua0Rt?=
 =?utf-8?B?aXhJVUFscUxyMTRYbFgxYTErWFFFVXlnN1lGUkhOckNSRlRnZXFid0wzSHFn?=
 =?utf-8?B?OUZqa3RVaW5vUzJleG9pdVhTOFpGNlB0TnE5K1U0UnpPaWF6Ri9rTHlQMnJY?=
 =?utf-8?B?dFZ1NlVXNlcrVEYxYnhPZGJTZlBqZzBGdEVOei9ZTjlhUjZkRFNvbmNDN0Fr?=
 =?utf-8?B?bjFmaFFGN1ozYmpwSTB4RFk2ejJUYkh2K3ZHTEs0WHpFV2s1alI3aGRvU0ti?=
 =?utf-8?B?clltWmRaU0ZpSDV0MWVJbWJ0WEVMY1BNVU1VOWZUb2NNek92RUUwczRHRnVV?=
 =?utf-8?B?VkRPQmp6T00yOVZraFIvVmlhcG00VGpkSFRBUjNDc1pnYVVyQlZFT1dDUlFs?=
 =?utf-8?B?ZDhvWmFPWGt1U1F5bDR4UXhQM2FzNnRTU0pRNFdPcTJNRHFmUTZFRnpoTUU5?=
 =?utf-8?B?NGxGRmE5ZCt1S1JjaUFDTVJ1MXJSN2ltOElsbnNHZlpsRmhlUkpmME5nSTFi?=
 =?utf-8?B?M1FxMDhBWXEza3RNZEI1VXU2UFkyaThTY2tUa1BXSjlTSEVsemVtQUtuZVVK?=
 =?utf-8?B?RHhNS3RtZEJUVkt5WnVhU1lKZFRhSFUyazJjczRqNGhFejdXYnR6RnN3VmR5?=
 =?utf-8?B?UTQ4b1UzK05ZaFRPYlQ0NVIzYklKM2wwRE5FS3F0WlNaR0dGTksyYjc5ZGpp?=
 =?utf-8?B?TytEZmZNL2pDaHdnU2p3QnoySWdLaS9WTkFGUnVQTkFHMnFDbFdWSjNkWHFq?=
 =?utf-8?B?VzFTb08xQmpNZEV6YnBuQzdkRTNQd0cxNnVma2tBYk9VMTVpWW9WL3k2RDNC?=
 =?utf-8?B?ZytZbUhDelU2eEhPRnU3bUdnc05MMmZaZFg2MVdlTVlmRVJIbWNJWVlMcUdr?=
 =?utf-8?B?Z2t2TjFOM0Q3cCtBeDBadnAwRll6RmlLVzlQZy9Tb055bHBQWkI1d2lYUmJL?=
 =?utf-8?B?SUZoTjlEVDFwVGtFT3JDTlh2VmNKYjVEVkNweHd1bi9EV0ZSTDJ4SitXVHY5?=
 =?utf-8?B?RXJRWlJRQ0pTMW82RlAzRjRUdi92S1A1SEJpVE54c3Ruc2p0ODNBUENnY2JY?=
 =?utf-8?B?Rm9zc1k0Rk05MDlma1gwL2EvdDh2Njhjbmpub2YvRkdvczZjUFlrV0J4MHl5?=
 =?utf-8?B?bzM3dHFGaFlIaXAwcXdzTk9vcGJDYmVzL3FsWWhoLzY2bmo0L0t5Uzhia3VU?=
 =?utf-8?B?RWxCMmFFWFU5dHFTOGpRdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFlsRHdDZkUyS1VJd3dFa3dlNW9Pbk40MjIrNUNHTmNHUlZicktRbDhMQ1Jz?=
 =?utf-8?B?OVVsUis2WTZHNFRRenlqd2g3c2NsSlpmc0FCeGxFSEw0WTFUZ256WE5haHpP?=
 =?utf-8?B?eFlVN0RHSVE2RXFxTWdobnNCb1cwNUYza1ROcEMxWXd3NnMyRStkQ2lRQ1hL?=
 =?utf-8?B?OVZuellaV3hsWHBYcENpdk5OVlNibzlRRWIrblpaeXZCNUpjemgvUnU3aEdu?=
 =?utf-8?B?L3UzdDFtSnpRTmV3blU2Sytjb2ZxSUtoUnBpdjlwdFRxQkVTL1dBMWVXWXBy?=
 =?utf-8?B?RUlFM0pITXpXVlVtTUk1OGp5a3YrV3daNFZPMFRRUlpVbEZ3VkVjZzBrV2o5?=
 =?utf-8?B?cHNjOVlxS1I5RVJ2RjdJSHg2OGVlenRjUmdreVZrQ2JmZmZQeHdZMWppNlVR?=
 =?utf-8?B?Vm1QRWFzSVFyQm53akU1RDZtWE5aQzNyeVh4VzU0NGJXc1dGU1VhY1ZTOUFI?=
 =?utf-8?B?b0ZEdkxGclNvc3V5SGNCNHJpWHBLT0IwSnYxNDZQbjB0THg2aXNWMDFaYnl1?=
 =?utf-8?B?WVhSQTNJci8zYllGSzNGNExUbHdkd0xPb3hQVVZnSHJXcWZad3pla0owVklp?=
 =?utf-8?B?bm5XYzl6eStoSm5RVXlxb2lmSVlSbkYxaTVxci9hVklOZXFLZSs4RFErc0xS?=
 =?utf-8?B?RE4rMmZZUGtwYWRJRmtDY2RROWtzSzhkOG5ZYTBRUU4wYStwRDRqRUllblkr?=
 =?utf-8?B?ckZIMHVLcytlaHFEeC9pMUxUbXkwTG9rd1ZROUcwL3dQSG16NWtWa1JPclZE?=
 =?utf-8?B?d1k5NUNxSmVOMXRnYW5zbHQycnhJSElKR0VyeEx2NGFVMXVoalhzSThtTW5q?=
 =?utf-8?B?eXFidkdyRFZ6VDRKRVJZaWJ0cFMzVmk5MXJyVjNsTE4rSWYxcW1qNU1uTml4?=
 =?utf-8?B?NjFJYmNGbjlLN2NFUE9mbWxpaWN3T0s5dHFxWFZmRFpFNTdCOHVwdEsxZ0VQ?=
 =?utf-8?B?NTltamc3TnNoWWlyWEVCYzYrWVdnMnh1V24rVDZMNFJGczNETnFDT3QrNXZh?=
 =?utf-8?B?bjRhSjhyWGJOaEV2VHJjSExvVVpOZHdxVE1WbnNVSDd3VmhPcEZEQzVlSzFZ?=
 =?utf-8?B?UTE4UlExT09WRUJGYk5TalllQjBIYUpTaXZkaXAxak81dFFTdm5yN0NnSDh1?=
 =?utf-8?B?YjY2dTdPWnRQV1FIeDZteWVkNlk2bXQ2eW8yNU1DY1hhb01KdjhPVkpwMTlv?=
 =?utf-8?B?VTV6K3M4QUlVSjNxNmVicHgvZmlHRFpQTlZzTW9xU3RiV2NuR1pEbERPNWxt?=
 =?utf-8?B?QXZiakk0cGZOeGVHaG54SjhqNHJFY2szeXU5UDkrU3p4ZkJnVTAveGIyZkd3?=
 =?utf-8?B?SjUwSW91ZWZab3QvTHFHOTE5M2VJMFB3OW5vQ082QlpQbFhVU09tNGlEVFJi?=
 =?utf-8?B?SDYzZ1RRNDQ0SG4vS2VsYk1wQkZsQ0hXWXBxTGEvbFg1U3BHc24wYTJnYlJy?=
 =?utf-8?B?d1BnSVQ0Ty80TTJmUlYxdDU2MG5lR1BjZURMTTBwNnZOVG11dGhRTVYrUWNa?=
 =?utf-8?B?QVBKS2k1a3RKVUhiNXByM28xRXR1cTlsQStHKzhBYTB6WjFkdCtoUmt0VVAw?=
 =?utf-8?B?Q0s0c2E0aWZUODhTdndjMWxYQ0pKNmRGSm1XUkdKQ1lVbHFmMHlvNkp0UkJk?=
 =?utf-8?B?REtLa1FIM1JUWDFjUXNVZUdrd3EzT1ppdXJhdm9iSUI2N0RsbEpObUt6T0tB?=
 =?utf-8?B?WXVMY1JzMngyNnoxckhDWmRMRnIzQ2o4SHNqcFVIYTZOWksxSTJUM3VLVjNC?=
 =?utf-8?B?Z2Z4bEZIelVlQVdaOWEwbXJ3NDQ1bmRwYzJwcHZrbFFaK09OZmNhcytldThp?=
 =?utf-8?B?RUpLZzhrR0IydGFEV0lqbEpweG9mMkdqR2hoZzlSenM0bzk0UUx4b0hBa2tu?=
 =?utf-8?B?OTQ0R0t1UEFwRDNLL2hsZnh1RUxibWJjdS9KTUlWaVdIQXE4aFJ1Nit4TUVZ?=
 =?utf-8?B?SSsrZXJhRzFmdXZ2VmVFd1hKcVFJWlh2Mk9BTm9jZmpFekMrNmVIR0tKdE5o?=
 =?utf-8?B?MUpDOWFwT2toanova1FZYURBRkRRSmxNTUVWOEZ3TnlDL0FFWVZ3ME00OFVp?=
 =?utf-8?B?TkhFdElyRlZJV3FUOVZndDJlczlKZTA4Wmp4NFh6SlNUREFNbmpVbjRKVlY2?=
 =?utf-8?B?ZTladE1laUd5MWdVcElsSzUzSXlDS2N2WWltTVpLL3BKNGhRZmVSeUZkRXpT?=
 =?utf-8?B?N1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd248f34-f37d-47ac-387b-08dca1ccb011
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 17:12:48.1127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rgCy3J7GYaE/AhXhYAUAeonUyb8253zl6UxUEMVp9enSVDlKAjLYREb8ad4sUKcZQbKEbwlf7pN8vsYCsb1CDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6393
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

Defer the ggtt node removal to a thread if runtime_pm is not active.

The ggtt node removal can be called from multiple places, including
places where we cannot protect with outer callers and places we are
within other locks. So, try to grab the runtime reference if the
device is already active, otherwise defer the removal to a separate
thread from where we are sure we can wake the device up.

v2: - use xe wq instead of system wq (Matt and CI)
    - Avoid GFP_KERNEL to be future proof since this removal can
    be called from outside our drivers and we don't want to block
    if atomic is needed. (Brost)
v3: amend forgot chunk declaring xe_device.
v4: Use a xe_ggtt_region to encapsulate the node and remova info,
    wihtout the need for any memory allocation at runtime.
v5: Actually fill the delayed_removal.invalidate (Brost)
v6: - Ensure that ggtt_region is not freed before work finishes (Auld)
    - Own wq to ensures that the queued works are flushed before
      ggtt_fini (Brost)
v7: also free ggtt_region on early !bound return (Auld)
v8: Address the null deref (CI)
v9: Based on the new xe_ggtt_node for the proper care of the lifetime
    of the object.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c       | 106 ++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_ggtt_types.h |  12 ++++
 2 files changed, 78 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index fe0bfd8c26cd..b57a71d54b1c 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -161,6 +161,7 @@ static void ggtt_fini_early(struct drm_device *drm, void *arg)
 {
 	struct xe_ggtt *ggtt = arg;
 
+	destroy_workqueue(ggtt->wq);
 	mutex_destroy(&ggtt->lock);
 	drm_mm_takedown(&ggtt->mm);
 }
@@ -242,6 +243,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	else
 		ggtt->pt_ops = &xelp_pt_ops;
 
+	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, 0);
+
 	drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
 		    ggtt->size - xe_wopcm_size(xe));
 	mutex_init(&ggtt->lock);
@@ -276,6 +279,67 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 	mutex_unlock(&ggtt->lock);
 }
 
+static void ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+			     bool invalidate)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	bool bound;
+	int idx;
+
+	if (!node || !node->ggtt)
+		return;
+
+	bound = drm_dev_enter(&xe->drm, &idx);
+
+	mutex_lock(&ggtt->lock);
+	if (bound)
+		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
+	drm_mm_remove_node(&node->base);
+	node->base.size = 0;
+	mutex_unlock(&ggtt->lock);
+
+	if (!bound)
+		goto free_node;
+
+	if (invalidate)
+		xe_ggtt_invalidate(ggtt);
+
+	drm_dev_exit(idx);
+
+free_node:
+	kfree(node);
+}
+
+static void ggtt_node_remove_work_func(struct work_struct *work)
+{
+	struct xe_ggtt_node *node = container_of(work, typeof(*node),
+						 delayed_removal.work);
+	struct xe_device *xe = tile_to_xe(node->ggtt->tile);
+
+	xe_pm_runtime_get(xe);
+	ggtt_node_remove(node->ggtt, node, node->delayed_removal.invalidate);
+	xe_pm_runtime_put(xe);
+}
+
+/**
+ * xe_ggtt_node_remove - Remove a &xe_ggtt_node from the GGTT
+ * @ggtt: the &xe_ggtt where node will be removed
+ * @node: the &xe_ggtt_node to be removed
+ * @invalidate: if node needs invalidation upon removal
+ */
+void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+			 bool invalidate)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+
+	if (xe_pm_runtime_get_if_active(xe)) {
+		ggtt_node_remove(ggtt, node, invalidate);
+		xe_pm_runtime_put(xe);
+	} else {
+		queue_work(ggtt->wq, &node->delayed_removal.work);
+	}
+}
+
 /**
  * xe_ggtt_init - Regular non-early GGTT initialization
  * @ggtt: the &xe_ggtt to be initialized
@@ -482,7 +546,9 @@ struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
 	if (!node)
 		return ERR_PTR(-ENOMEM);
 
+	INIT_WORK(&node->delayed_removal.work, ggtt_node_remove_work_func);
 	node->ggtt = ggtt;
+
 	return node;
 }
 
@@ -499,46 +565,6 @@ void xe_ggtt_node_force_fini(struct xe_ggtt_node *node)
 	kfree(node);
 }
 
-/**
- * xe_ggtt_node_remove - Remove a &xe_ggtt_node from the GGTT
- * @ggtt: the &xe_ggtt where node will be removed
- * @node: the &xe_ggtt_node to be removed
- * @invalidate: if node needs invalidation upon removal
- */
-void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
-			 bool invalidate)
-{
-	struct xe_device *xe = tile_to_xe(ggtt->tile);
-	bool bound;
-	int idx;
-
-	if (!node || !node->ggtt)
-		return;
-
-	bound = drm_dev_enter(&xe->drm, &idx);
-	if (bound)
-		xe_pm_runtime_get_noresume(xe);
-
-	mutex_lock(&ggtt->lock);
-	if (bound)
-		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
-	drm_mm_remove_node(&node->base);
-	node->base.size = 0;
-	mutex_unlock(&ggtt->lock);
-
-	if (!bound)
-		goto free_node;
-
-	if (invalidate)
-		xe_ggtt_invalidate(ggtt);
-
-	xe_pm_runtime_put(xe);
-	drm_dev_exit(idx);
-
-free_node:
-	kfree(node);
-}
-
 /**
  * xe_ggtt_node_allocated - Check if node is allocated in GGTT
  * @node: the &xe_ggtt_node to be inspected
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index 60cbce3170d1..5ea12ea30a4d 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -45,6 +45,8 @@ struct xe_ggtt {
 	struct drm_mm mm;
 	/** @access_count: counts GGTT writes */
 	unsigned int access_count;
+	/** @wq: Dedicated unordered work queue to process node removals */
+	struct workqueue_struct *wq;
 };
 
 /**
@@ -59,6 +61,16 @@ struct xe_ggtt_node {
 	struct xe_ggtt *ggtt;
 	/** @base: A drm_mm_node */
 	struct drm_mm_node base;
+	/**
+	 * @delayed_removal: Information for removal through work thread when
+	 * device runtime_pm is suspended
+	 */
+	struct {
+		/** @delayed_removal.work: The work struct for the delayed removal */
+		struct work_struct work;
+		/** @delayed_removal.invalidate: If it needs invalidation upon removal */
+		bool invalidate;
+	} delayed_removal;
 };
 
 /**
-- 
2.45.2


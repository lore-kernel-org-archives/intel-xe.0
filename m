Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230E9EC1E83
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 09:40:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6CB410E85D;
	Thu,  5 Feb 2026 09:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FVwe6yOZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52FD10E85D
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Feb 2026 09:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770284423; x=1801820423;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+VpvtQHBdr0jUTUVl46vUXgX9DTg1KYBXCnn6R+8jsU=;
 b=FVwe6yOZuD74eOJZ0Ph7XGUQz6DruDVBtKsfA7bXE1+oIZB5Ho6PxVHW
 gTORr0NV5eDFpqi7RXdIO+Z/wHVeRa9VEVqwBPlnMfatRainEZKYf7gAJ
 rKs2NK6MAZ+NLcX4f8gfn0b92km+TN87eF/ipvysA9RIzhxwINw9bjPID
 aUO9TU6BSfL4x41j+fEEUluTa2aGvPa+wXgKkwjcJ5WpCH+6ggaimlqoE
 BiCSSzanBCh1zDlGLvBrZRd4jiHYKTeW793GID6h/dzEZJQQ+XDQtPQfN
 Cz2nnrD3awYoq2HfHpIhMvWBDu2mBEoRqpifEPB9iieVPlbaKpGb76t4g g==;
X-CSE-ConnectionGUID: Ll6SAzeSR9qQWCEc4uADSQ==
X-CSE-MsgGUID: y5JJK4CWQBKAmiM2va0G6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71541655"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="71541655"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 01:40:22 -0800
X-CSE-ConnectionGUID: rlUeCZExR8mO6QJJphAAkw==
X-CSE-MsgGUID: zk2Ai0p9RqqMrgyK/I2hEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="210260720"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 01:40:22 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 01:40:21 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 5 Feb 2026 01:40:21 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 01:40:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZD7ye3hYvlaqXtUNNqTg52Xrq1UKn0ZupeLTN3Hw39g2sIW/kz6jZv+76D7cWl74KUM99BlzEhNDxkRTWZbq1sPglKj8PnjX6rJtpiplbqyQl4vLDmolbXiuXzFRF67felG5dmOccjKF8HNmjertEOKREmP9981xlrv/diPMKMlAzDCieKxsr27p2y9d7bqw/UCiq7B8xfzaSobdVcD77v9eBUCT/XrYHpOyTksA0X3HNrQ+7guBsEOxvpYK73jjzhQug1Zy8SONjIvmCz5O1+3bnhHRc/I2FtF09s2AhJqB+JHbMUKXLTFd+xfdqcCVOi09uQhMTKVAUgE1pWxAVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SMm2xBIUtvRYCglrIGPFx4Ax6jpeZrjoEZFG+BB5lQ=;
 b=q9lgDh7+va1Kvv+xeK1GCnT/YB1Cq9/6AKSfIDqHxjHfofqG7p+reTCdXnE3azxzEJC7gKe3nDJmhQdCvwlxDn0t/EILdLlSAX2iczMroih8BiwGOcPY8knp31CZhTZkluceyZ0wHkNbWZcpgy2PiN3I2BiABJlJMeSv+0xo5q6lVDe/gn72q2fw/I06TpHIrm7UYkDdUmmW9sBjBsvpz9Wm0wy1ziYgoMu386lrlN7tN+qKHO0r2Vf4RgQp86Mj6mEU5acWhU2zeUh7yiced8flj08h1UfUUoT2q/JpGzMwvwreeJd+unW6iwDnid/59XLmRcYyhr4YcOU8plpMCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SN7PR11MB7603.namprd11.prod.outlook.com (2603:10b6:806:32b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 09:40:06 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%4]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 09:40:06 +0000
Date: Thu, 5 Feb 2026 15:09:58 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <matthew.auld@intel.com>, =?utf-8?B?Sm9zw6k=?= Roberto de Souza
 <jose.souza@intel.com>, Stuart Summers <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe/query: Only advertise NO_COMPRESSION hint on
 devices with flat CCS
Message-ID: <aYRlbv9tm0Jf-9VE@bvivekan-mob1>
References: <20260205082048.2988738-2-sanjay.kumar.yadav@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260205082048.2988738-2-sanjay.kumar.yadav@intel.com>
X-ClientProxiedBy: MA1PR01CA0173.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::14) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SN7PR11MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: c042c641-9916-4eef-56d6-08de649a8b98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WWMvWDNJbzlpMnpHdDFNLzh6ejdQS1BxN1JQWTFIc2ljR2N2ak5zS2ZhMjFW?=
 =?utf-8?B?N2JYRDN5U2NJcTlUMEQ4Q2ZmWnlPT0tQdlk5SzJOaUJHM1pOWnJhbVlySi9v?=
 =?utf-8?B?bUl3REhSTnNBQ0IrQ0gxQ1NOS1VySzdHS09ZZVF1MkpCeW14bXR2TGpwbFd2?=
 =?utf-8?B?NGxtUlIrdUZCSkFUUlBLb3p4QTZpVlBTemw0clZzV1ZzU1hnaUFDcjlaOUZS?=
 =?utf-8?B?L3RiVVN3VlE3YTNuUjBTeHh2bFBtTVl0RGdmbnNhSGkrY3Jxb3pqaGxoWTVL?=
 =?utf-8?B?dHpSbEMxQk1DQzlTNUxIQTFEZGxVSXM2Q3I2ZmJUeHZqL1RGNk9EYTV3alVP?=
 =?utf-8?B?TDlWbm5wSTlDaFdhOFRQRC9XOE9qNVMvMTRxUFJaSGZVWmlrNVdQcmNxaFND?=
 =?utf-8?B?cFUrVzRUcWMxSkowVEoweUJuNGw1SlgzNm5yK3h5WGhMWUQ1NDZUZjlZek1W?=
 =?utf-8?B?ZTZ4NkFsKzJFVE1iNG52TVVObFFOSTJSVHlwemFJanF0WS92QmZCa1FJbVJU?=
 =?utf-8?B?T29oWW1tWEcxSXNGcWQyRk1GejhXYlQyNGZzZXdqWkN6R1RIdmhMZDZpQnNa?=
 =?utf-8?B?S0JGMzIzcm5LRTB0ZFNpcm84L3dFYUFPY0RVT0hLSmhNUWtCa0xDdkdScjd1?=
 =?utf-8?B?MFRVdGRnUFpsQ2NmUW45MkV2TEViamh6TlJFc2E5UHd5RENES2thRmtkSXM3?=
 =?utf-8?B?ckp0QVp1cUk4RG5SUGpNMWJRbHY2amlGcW1zQ3FuSVVvMzJtZ3BVc2pDNnZK?=
 =?utf-8?B?alBKV3hzQk4rSDFiY212WVY4MnlZWkhtVGhBZUkycVN1ZHVCTmVOUmFVcWlL?=
 =?utf-8?B?eDNrZlIwbzN6b3JTaXFTSjVpd3prN1RqNXFMTUN0eGxiZWRrdDFYZHF0YXJl?=
 =?utf-8?B?em4xZ0hFenFxVm9ETDh1TEI1a0FWY0thc2w1SWU5VStSbXJKZG5GUEErMklH?=
 =?utf-8?B?dkhVaDFEeTVoOVlYWG1tTTZGczlCY0hhdkw4NUtBa0t5NVVFS0ZvOTJxeFBE?=
 =?utf-8?B?SUg5U3VoNVF2dnpSd0RzOXZ0TWtSVnBNcHZ6ZHJNU3BhSW5JMDdFMEJlbUhH?=
 =?utf-8?B?cjJpN2pNMmo4R3RTQmIvc1JFNXU3VU55R3hqZWdLaWUvZU11ZFhKdDVZNTFp?=
 =?utf-8?B?anh6VmNLTVhRbUJZSUpySTYybjBBMm55anRENmdBdzJQZ0pueGFJVEhpWW1S?=
 =?utf-8?B?V2NsV2RqWHB6TVpUZnNYS084Und4dG5SWjNreWFNdjRQLzB3TzZQQncyUy9z?=
 =?utf-8?B?Uk9PLytvSHFlN1JtT3lObVBtZndtUURhU09vVEV1Qm5HVm5vRkRTZDVKWGV5?=
 =?utf-8?B?QjVVSHFVT09uZnRLYnBzZWlpc0Fsb29NZGNGWXpsMkRBeGFKM2VBTTdpNlhr?=
 =?utf-8?B?dG1BM0lWVThOSjRkVittMTJJYVRJNHZzcE50dDVuVzBhSTR2dWY4NXgxcmRt?=
 =?utf-8?B?aUdoMzdVSEE1RDdJTTBhZDR4RE5lM3ZySWhKNm1mb05SM3FyZFl5emJSZzNZ?=
 =?utf-8?B?T0lSdGpOQjQ4YnhtMEE1V0ZsWEZia0NhRlVibWJqdjlSRUowSzhYYnArUlJw?=
 =?utf-8?B?dC9mMXlMQ3EyUG4wRlRuT01IOW0rTEhadjhlZ0JlWDUzNTRaTmU5ZHNTcFRZ?=
 =?utf-8?B?d3puOHF6WXBWWGVBWGVWT1NFWnI2alNkejdMNzVLV2xhTUllK1dKVXRseWpv?=
 =?utf-8?B?enlmRWh6OGFaZHZkNGltTnViTGs0VmZOYUtoVU1jUHQ3WjdmdUY0UTNpdGV0?=
 =?utf-8?B?dzJTNmNET01udUxQcGpnVk5oUStuZTg2UFB6NU5oYytNb21LSmo0UVRZK3dK?=
 =?utf-8?B?OXNobUVmVWNTN0lqbnRPU3R6QkMydmhKMVZLUHc1aE9PNTBiSk55cXJHYUdy?=
 =?utf-8?B?ZE5WZ1Z1ZVlKeWd3V1RvTDdJdm5FSndXaFBLcXVEaFNlRDVLdzd1R2ZaSDBS?=
 =?utf-8?B?WENIWk5uRHN3QVdZVTYzbDVva0YzSUxGVm1tcHZFT3plWkNCcDljNUhqUVpB?=
 =?utf-8?B?YlZLcVVVY3hqU2VCNUdZZFFoRzhhUlFKTHUrcTJVQmdSWGNIMGI2S09YSHB2?=
 =?utf-8?B?Uis2azB1OGxGMWszY0FSc3pRcTNqeW5GYTVnMEJ1Z0pvVnBrN0c0TGwzTVBZ?=
 =?utf-8?Q?kzPE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TloxQzNCWFRXblNKZGZkNm94Q1RuYjhhT0I1OVhoczJGQ0l1bm5EbjdFS2lH?=
 =?utf-8?B?Uk03blNJeWErdUtrK1FnZEkwam5XNXJvNzFrdjZJenhiRXNRWTdycW5wUW5R?=
 =?utf-8?B?NmdDQ0c0OVNVMW51djNpaFpXSWJyaktGODFlR3VnV3N2UmxpS0wyeWVEaWFX?=
 =?utf-8?B?ZkgxdmtnT1kxMzF4R1gyYlNsajlET05UNXBaTTBtcDBwcWhHRCtXaFl2Ymhk?=
 =?utf-8?B?dnkyL0tMcmdneVN6bHhRUGZxYXlpYnNMN05qa3FiUmJHaFFCdDdTQ1VHTzNw?=
 =?utf-8?B?Q0hTTEdpaTJRd1FWR25uMDc1b2ZWdWs3QjRiQ3BmVmdMQlVEZTZxd2MrcWJS?=
 =?utf-8?B?TTZ6dy9GTjF4K1czOU1hTFZzNGxGeXRWZ0dZTUFTdnFRdWxaWEFVTkRuNHVF?=
 =?utf-8?B?K0dwQnI2MEJqSmZWRDYrSkdwN2lrdDlqb1FzWHljdFJqREhLUjBaQjJDbE5Y?=
 =?utf-8?B?Q0JqblhIVlB3L05VaG1IK0hsYUQvWG1VaU4vcEU4aThFZFNNV1pQS3JneVZJ?=
 =?utf-8?B?OWdwdE04OEZTSno0U3FnRUpkMWkyQzJ0UGluSmlySEpxNVNvTkt6eGwvTWh0?=
 =?utf-8?B?dnYrM3JQWnFSR1dEVUk2NHk0UXNGRjlSNzlOa3ZaaVFiQmE1WVFxNFI5cUhp?=
 =?utf-8?B?TnNPbXZaZkNxL2l1TVdkc3g3QU14VzE2WHlSS0VnbmYxTnRQV04vb21oRnAv?=
 =?utf-8?B?bnRCSERMTDlkU3hFTGwrQ3VwVUlJYXN2RDBKVW1WcXljQjRVVmROUXpDajR6?=
 =?utf-8?B?alZSbUQwZXkrclVNR1dtNVNoaWo4SmFyVXVmaldkRkZNZ0xWVno4V0xJenI1?=
 =?utf-8?B?SXI0NTE1YlBFcGRUNmVBa0VpTUxZeG9Ia0dqcjZtTjJpN2g0cEQ4aVNOSU1C?=
 =?utf-8?B?TlRnVDBiL091SzRPSFBFODlZV1A2R2tHQ0hDYm5YTTBaeURyQlN2b00wbHpU?=
 =?utf-8?B?cWk2VVZnampIN3N3ZmpxMWlEZ0MwNlFLdjF6Z25ldjZHMXUwS1RUMVZlWXNX?=
 =?utf-8?B?N2NValBFemc2TjVKN2hPU1FSbHo1SlZVSGdJL0lCSWpsM1hiTHFmWVlWcnMy?=
 =?utf-8?B?bUoyYW1GVEFIK21UM2tUc0xxemlEV25mRTBBZEhWZGRLcE9Gd3hSSzYvTUhM?=
 =?utf-8?B?T05YRnNGK1pSbjNhTHliUkNYZkxDYzZhVjVrc2doRXNsNmFRd1ZVa0I5V0Rv?=
 =?utf-8?B?OWJ1QVpWUWVWTlY4M3hUYk1wQUdQVlJTUGNGTGVTOE5zdkI4K2FCSW9IR0t0?=
 =?utf-8?B?aEZkQVJ2OWd6Tk0vdndBb1Rrd1NYZmVyOXp1M1dqMlIwUjVHMlVkMTRsb1RP?=
 =?utf-8?B?bDVsaXhrL21TSzQxejhEcVBjVm90MTFUbEFQZEhPeVRLdFFwTnVucFhJU1Vi?=
 =?utf-8?B?WDFQenlwQllRTjh5VGtKbnBreCsrK2VNUFpXMXppQ1NaU0JOUkhjY3J4NlJu?=
 =?utf-8?B?TTJaT2tYNGdOb3JJRXB2QTlJa2JrbDJ3QlhaWGhNV3QxOUxmTVlORjZCK2px?=
 =?utf-8?B?WHhiNFNucElpZGJNZlJSVGJzbjJGVisyN1JucDhsd29sQjM5c09mMkluZ0Zu?=
 =?utf-8?B?VGdycDRxWWJETlJhQm10Znd2alUzZVdrZGl6VlBqak1TQUM5aHZZQ1pYYXkw?=
 =?utf-8?B?Vk9uSlordXZvMFRzQkF6dHhQWVFzVFpFYmhPOGxST0JwdXhNV2d1T3YxdFBS?=
 =?utf-8?B?Y3FOVGRQL0pIZERFUnNoWWtEWXdsbVVzeGFCRWI0V01lTEI2Zm5ZRHg5a2lh?=
 =?utf-8?B?RkZ6U25CTEIwNWYveTJBNnhkell6TlhDOFVkTGZrWVgrRVVrckxIWFd1cEhC?=
 =?utf-8?B?VjQ2cThuMDJQMlpWZ2hQSFYvcFgvUUt0aWdueGJuL0lKTVQ2QUVvL2JSTkkw?=
 =?utf-8?B?MnRFcjVOQnFFNzJBcFVNV201c0loMndadWkzZFlTcWNsVkRZbEthbXdXdWNq?=
 =?utf-8?B?bEtpYko2MmVnSG9nRTNwOGVPNkF3czRybm4wSjVQaXkvVEJRaC9YL1dlVUlN?=
 =?utf-8?B?OVVZMSt6TDB4TlBMZVNVSlJJSmtpQUxaL1E2UXlhUmhuRWczWHAvWFJvVlJa?=
 =?utf-8?B?cmlvcUZDdnhaaksxb1UvWU9ZYzY3K0I0eTlzVzRUVmRCSFNuRTk1dlBRMUpn?=
 =?utf-8?B?YS9ZN0dsN1BVTVY0R0dJOUdpZTRPall3ZEtMUC9Qbmd2TEs5M0lxUXBSK1FZ?=
 =?utf-8?B?dkxlNmtBQ3ZlUlllQzlIbHlNcFdYVnZmUGUyNm4wODBsYnNJcmRUL0RYMmpT?=
 =?utf-8?B?bng3YnZjSUhiN2dTYkc2b0VsaGJ6b1ptZjdGN3N4SWhzRFVBLzVSVGtSUUhr?=
 =?utf-8?B?QlBvT1kzYjE1T0lRWGVjRTRuNmVKUU5zUHVBcytRcWJFZUl5QjJESVFZaUNp?=
 =?utf-8?Q?lET3B+gvMRFCN7PbozVxL9winmaenpobLtUkh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c042c641-9916-4eef-56d6-08de649a8b98
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 09:40:06.4032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NYE1uMhmJxPzYxs3bYJiyOfruIYO6rERWaOPgVtjYA4o0tPjVVlnEvWpgYm3I/B8E5NGRLE99bextcfARZg+bIr0TvP7sl+j1t6i+WSf0s4R617xPv8saCMmtFDzdh1p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7603
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

On 05.02.2026 13:50, Sanjay Yadav wrote:
> Devices like CRI have GRAPHICS_VER >= 20 but don't have compression
> support their PAT table (xe3p_xpc_pat_table) has no compression-enabled
> entries.
> 
> Only advertise HAS_NO_COMPRESSION_HINT flag when the device actually has
> flat CCS and thus compression capability.
> 
> Fixes: 78d91ba6bd796 ("drm/xe/uapi: Add NO_COMPRESSION BO flag and query capability")
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_query.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 34db266b723f..c152ebfbd7d8 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -335,7 +335,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>  	if (xe->info.has_usm && IS_ENABLED(CONFIG_DRM_XE_GPUSVM))
>  		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>  			DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR;
> -	if (GRAPHICS_VER(xe) >= 20)
> +	if (GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe))

You don't need the graphics version check.

Regards,
Bala

>  		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>  			DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT;
>  	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> -- 
> 2.52.0
> 

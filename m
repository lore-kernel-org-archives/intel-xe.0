Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762EFD12D60
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 14:01:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21AB210E7F1;
	Wed,  3 Dec 2025 14:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ReNmXiW2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3543610E7F1
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 14:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764770480; x=1796306480;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5Frxi6vZ/NUkCC1SCIZbgqhgI5PRxX9g1x8CizsY/L0=;
 b=ReNmXiW2TuAQTz72q+eD4qzx5syoAf2mxkvJZLkk3t7CbFKXb0BtZDoi
 LXP1dnbTL1+HS58o+xbLgFF886+VP1mJ36sO0/7la1PnFqt1IP7AN4Tyz
 sTCC90P9+zJNRYALUQkNSVj711Cr/5XQerXa0bXnBGG/qsCwYX9gNYH5h
 KtOXE50YIJ5TzGoHMFrmpfTb1D+Tsm1z55qQf7Rxl4FWb/779eOqmW3qO
 qPcux0kxliDp6DUS1mgsSJQ8FO2vVUAbZkRjumsHzCkHs/KKQFFqg4Uz9
 LchqkamjoWLZN1I9g+zaQOZ+ozrHGYxlQlYqc2JKMCIxGE8NZhgs+RvtH A==;
X-CSE-ConnectionGUID: R6LFH40uTQ23lDLdZWx+gQ==
X-CSE-MsgGUID: B2Bfm9HwRRqR2UF5DeO9VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66652902"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; d="scan'208";a="66652902"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 06:01:20 -0800
X-CSE-ConnectionGUID: SSHUCvEITASKwQRL+wPJjQ==
X-CSE-MsgGUID: ASM4cmO9SPmBr51ODXyABQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; d="scan'208";a="194349578"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 06:01:19 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 06:01:19 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 06:01:19 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.40) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 06:01:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jb/W78arArKNwX0Z6zcsSdsmB+oHdT6VZ/MersXXiDUv4sNDQ2Tf+RPA2AAjUUCbyOCQry0bYUprc287MAOpcpScc5TOpooL16Z5ERoqSSJcCgecKnZNDLT4XahRKUCSRZNCyyQJINiwIP2G9ccDt6wAtvu/0YYlp4eoG6FycTsJ8uWo9UTsGtxz+hGTl6UfuUIali0ahY05wpAE0SXKgw4IU/TqXRY3anbAm4NdUTOg+/myUYwxV/B1ifOnh7hBkVhdUOiNRnXmE82eMrXSDzZmHB9F9KKFg5xjLNn6hgf9HBSmyEhd+Kh6wMMV9I1kt9Yp+ZZLrv8MIGj2NOEntQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBcnAmTtQObRFTryMZisMk2SqFuLZAG0KFM1tnBTuCw=;
 b=aKIliIZGIPII45vU1vTXLTKn4EGiDK01ZkP3fbfFH7lvOfzNgwus8O0TG0TkOxZudqvpEcNuJ+fyIRWodLp1l/Nj8PNRXpH1CGDQEV1l7AsUNWK/8WfMJ9/Y8px/Vp3k0OGIF8gK4hKJ+c5g3GqhWgsr8EZxMaef3o6ziw64ID/vLisVufG5YIbU0/aV92A6qP3vjLNe9lUk+j1aF7bEfXduLWIoMU7aP/RQlFjaBwv1LSzA9RaTovmym34GgE7w8tlGSEGm2sYhL1A3BI56BbO8MW3N4fbUdhvq4PETC2Ga568/OIR3gS11Cn2PZTIlvrPkV94T+1nFgr+20DEJRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3041.namprd11.prod.outlook.com (2603:10b6:208:32::17)
 by CH3PR11MB7938.namprd11.prod.outlook.com (2603:10b6:610:12f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 14:01:16 +0000
Received: from BL0PR11MB3041.namprd11.prod.outlook.com
 ([fe80::8f61:c439:8828:cbb3]) by BL0PR11MB3041.namprd11.prod.outlook.com
 ([fe80::8f61:c439:8828:cbb3%4]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 14:01:15 +0000
Message-ID: <c05b0435-0a1e-405f-a1da-fa2cda205963@intel.com>
Date: Wed, 3 Dec 2025 19:31:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 4/9] drm/xe/madvise: Implement purgeable buffer object
 support
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
References: <20251201055309.854074-1-arvind.yadav@intel.com>
 <20251201055309.854074-5-arvind.yadav@intel.com>
 <aS9chAd9GOAdDSxg@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <aS9chAd9GOAdDSxg@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0129.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::14) To BL0PR11MB3041.namprd11.prod.outlook.com
 (2603:10b6:208:32::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3041:EE_|CH3PR11MB7938:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c71fe4f-5628-4161-e9e6-08de32746c5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TENydW9rRU1JRGdrMkhIb2k3QmtBc0ZTMlFQUXFEdVUrRWtrOWFkQmk5eFBJ?=
 =?utf-8?B?REZTUmhhZmZ5V3YzVElGb2FvM1dFbnV4UGZiLytzdkFhVVJmM3dQUjRrODJU?=
 =?utf-8?B?cmFCbTc3M0FoYmt6bXM0NlV1R1dsdDArVThqUk52WXFtWGlFMWZMbG5TR1dS?=
 =?utf-8?B?ei9EOS8wbVZPN2s5aW1TZDN0amNRYnd0SXpnVWh4emZvT1RqOVZnc2wvL0ZQ?=
 =?utf-8?B?ZHBTbE9NZWVmRWIyRks4YXpvZXFxZkQvcjVpRWVtUDFhUENMWHI0ZUFSWTVH?=
 =?utf-8?B?am8zeU5pb2ZwczNjclpLTVNvWmNQZHA1M0tPS29pVGx5aGw3ek9NVERud3VE?=
 =?utf-8?B?dzhuSXNnQ041akpPRFdKQlV3ZVJIVWh3a1g5cHNxQ3ZIeHFaZnBzN1hOaFFj?=
 =?utf-8?B?UytIbzdsb0QvcUNzU2U2NnJQR3FtbUlaMC9FNUZ4Mldhc1BFUFl0U3Nad0lF?=
 =?utf-8?B?YnNGNG5lNnhLVTBsRmczcnlYNmNja29kRDNOM0NhVnBVeldFU1U1Si8xbTNw?=
 =?utf-8?B?am12a3NhTkFXSmZ5dlpMTmlDUGJwRmwrVjl5SXBScTFtL2lVd1hNOUVWNHlD?=
 =?utf-8?B?clFsbGJvUGRjTHlzRVpLOVRIUHFzZVJReHIxMTd6V3JMSFRPOTBnNklVZ3hv?=
 =?utf-8?B?a1ZnSHdLcFpWbGZ4cjdKNm5Kb1ErNkFkczREcVRzdmlEeGZvbC9FL3NNdWVP?=
 =?utf-8?B?WmtjTEwyYXlqT1MrQmlHSWVtcXpoSzZNQmVxN1NTTGZ3WnBaa0ZJcFR3VjR1?=
 =?utf-8?B?Nmo0RTRSU05HY2VxV0hNQmRxSmZDaTAvMytEc3ozLys2TlVyVGtGZUVRQ1pi?=
 =?utf-8?B?UkNDQ1FmZ2s3SnJtLzRqSWdqa0piWlFEY0ZYRlNXNnZ6WXA2RkFZZDhMZVpt?=
 =?utf-8?B?L0o3VW9zNm4wbFo4dWxNbVBDNDQvalV2V29qT3B3VWtaSEhVQyt0SEFzQnZS?=
 =?utf-8?B?clp6VzFYN2FDZ3BlaGJpTGpiZml0UlFQZ2JTY0JxemYwdkJKQ3Ziby9yTG5W?=
 =?utf-8?B?MlFZcnhUK1YzdGNwU3MwYWVHSVFINkhXRmFybDFFWjg3T0YxT3d4U0ZLZHdY?=
 =?utf-8?B?SG45b2pmb1VJaHl1RGlmNG9TRnRnaGxLRm4wZ1RFQXJLaHE2dHhTNVJkY2xu?=
 =?utf-8?B?cWJFbFpJVURaQWw3U1FNMk1BZlVOZkxzMXQxbk15V3pwMlU2NS9pQ1BEQkJi?=
 =?utf-8?B?NjVpUmJVRm83Q2RmL1UxeDNmcjlOSThuRXN1WWdadW5hVFMyc3hrS0VGOHZ6?=
 =?utf-8?B?WXk3NUUxa1JycU93VjcvUk1CdXJmVHRaVnZZRDk1YUxRTnRFS05OS291TVRB?=
 =?utf-8?B?MFdrZCtEMmlIZGdndmlqUXJVTnh5b1ZmZE9KaTJXS1Z2TEc3VW1DSm9mUnZN?=
 =?utf-8?B?bHU4eXl4M2pFbUZ5bU5xdDRZbEFHRlRlRHIwbkNIdDhLRUdNR1UveWdSMlMv?=
 =?utf-8?B?R29MSmpOQnl5MXRKRkhGVUlZNmI2d2RJN29kM2M3UklUM29Ga2UwRmpVdkpp?=
 =?utf-8?B?SlgxbzlkdStxSUlsSmRYczVBMTNGUEx5VlNhNnhqV2U4QkRac25DRCsrdDE0?=
 =?utf-8?B?SGJ1dml1YmtobzRRUTQ2ODNEWVpIR1g4Y2k4RC9pbk95ZWh0cmx1ZEFreEky?=
 =?utf-8?B?UnU3VHdpd0l2djJXT2VQNGw0R01QMFd6OXhOSExGRVVrNE1QZ2lzY0EySkl5?=
 =?utf-8?B?UnhMSVlxbDdSRTNPWEp6dFJMb1M0dlByaDFUQmNISTRyRy8rOGVrYzRmUHIy?=
 =?utf-8?B?QmRJWGczaW82cEw3QWRTYmtFeUpYbTViRmo4OUFSN2JiRkY0dXZnWEtuNFN0?=
 =?utf-8?B?eks5bUpHYjhzZzVqREdQN204L0NLNGkvM1pCczNMU2hBRUlBdnV5RTFLNkJ5?=
 =?utf-8?B?UlJTNUhjUUNtYld5NHNVNUQ0dU0yTGdpQ2xjWVY3ckVxOTNJTm9TM1pnZlZs?=
 =?utf-8?Q?P8wi2UZ1rrojbXYWQLfW0wDBdMthqgN4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB3041.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnd6SXRTb0QrZnBWSTk1Nm0yY0dORjBqMVBoNFZLYlFxanF2ZlN0dlh3MWVT?=
 =?utf-8?B?aktFWGMrZDdDekxvK0pHNXh6U0ZRb2RzdmcwZVZIeU1XV0gvK0VWb1BmM1JM?=
 =?utf-8?B?bGtYeEwvamJZUFUzcmgvYksvV0U3c0NSODRNYXd0RVJ0aUJ3OFNPZFU0OUtJ?=
 =?utf-8?B?bzRyUGNjR2FrejFqTjYvK05mUnZhTGRvcEk2U1ZJYTZsU1RjeDg2QkthTEJq?=
 =?utf-8?B?Y0VIRXJmNUxOaGU2UXZqUFhFcDEvUmFta3B2emlxMUZmVW9STGlvcDBxZ0du?=
 =?utf-8?B?L3VGRXNvc1k5dXpoa21iWW9qUjlIbDJidHdNUm9oN1ZPblEyaTRwUWd1NVBt?=
 =?utf-8?B?N0NKZFFaVGp6QThNdG8rNlU1K1R3SmZTVXVVSGJaaEcvZUliaEVQMjBaRmpy?=
 =?utf-8?B?MWJKeExOSmRyTXFrNk9MenR1QzlDUTJhYzVXWTQ0VGJVclY0QUV4RDJ5S1ln?=
 =?utf-8?B?SXpncjk5NzArMEhwNm94c2kvVE5tMzNoaHdKSk4rSENzZmNTb2tCV3ViZHQy?=
 =?utf-8?B?cmRTZ1lWbG4wS0hhNUpSSjBwcFhZNjR6TXBxNzd6VlJiZVo1ZzdNQmJLUnZR?=
 =?utf-8?B?RWs1UGRUVXI2Qk80Tk5pSStxNWY5T2pSdzUxZUxIKy9HbG0xYm1KTUw1YVBO?=
 =?utf-8?B?MEF6blJWUUFIbldkWHRvdFpBbThqZldrQlJVQ3liSXdvVUxhSUlWWmVONlQx?=
 =?utf-8?B?T1lSTERlWnlSaFpNWDN5Wkp0T1VWMjgvSEo0WXB3cTdkTEFVaERXWU1qaUcx?=
 =?utf-8?B?amdvMkdrYmNDZzJacExJWmdDUmkzZWE0Q0hWN253cUJFTjkrY01USkZBeVRQ?=
 =?utf-8?B?Ukc0UXJsVGdiSzgxaG5sblkyUWJvRG9PUTJCcTFiQURaQlowOW9pN2E1U0Rn?=
 =?utf-8?B?Y01GbWF2eHNON29zZno5RWJtS1FBQnF1SW04OStJYmFTa3MrbTIvaWtIZFdl?=
 =?utf-8?B?eG9IcHdYd0tvenB4eHZ3NnJyV1Y1UHRYdWVyb1lXNWdtN0dZWVMvaU9hNHNN?=
 =?utf-8?B?YmM2LzQ0N2lkbmN5VGUycE9PTUY4OEh5M2ZHd2N6MXBhR2lKR3lyUkQwUEhW?=
 =?utf-8?B?QWRUbHFoNXl6L3p3Q3p1QWFGbCt2a0ZmNGRMZzhFSjNTK0t4MXBWM0xnUE8z?=
 =?utf-8?B?RGF4YXF1K0d0T3FKMm5yVXZrR25HUmxPRVdzNHdsM1BnYWpFQmgwd2tBYkRS?=
 =?utf-8?B?dlNOK3J4a0lKajg2VS9CMDVid1pDNlQ1cy9xZWxqelBHMm5jNThYdzFqSlpI?=
 =?utf-8?B?YWNMNzNWUm9JeTAyRzdXRGZkWDNzR2VLLzBEbi9JcUx6VEdpRjhITkhBOUxO?=
 =?utf-8?B?WE51SXljZnFLU1laaTZmSFhuSWh5a3NqdHhiV0h5cm8wRjAwRlZ6Z2YwRW5G?=
 =?utf-8?B?aEhlTEJPUmdqei83bHFQdFlJaVRwMTVjejhDWjBmNkFjUFRUZmx0cXJsRFVr?=
 =?utf-8?B?M05CaXJWSUFxVTZxenpMeFh6RDlTSW5CU0Zac3BETUJ0ZTJBNXR0V1Q4Yy9J?=
 =?utf-8?B?R2pZM3pjZ25OcWhac2VBSWp3UG0rSzhHZXhhdW82UjdsZHl0aUxYVTZxaXU1?=
 =?utf-8?B?WGVrVGVUSUsrZlYyR0dPaVJRQzBNeDFqalFHRWpucUlZWks2L3hQdFVVT0RS?=
 =?utf-8?B?WUNieWZZcGt3eXNOUXhDYVNhMnU0cGpnN3hOVElqWjNWb05ZZ0kxcTlnYTg2?=
 =?utf-8?B?ckJoVVJzeTNlaFBmdVI5dkN6NnFJWFVIQ3c1NHBYQVovcUZ3YS9zd3VoSkgv?=
 =?utf-8?B?bkdsdjdqaXpPRHUxYUV2TlBJNU9LcjdaR1FPWHo1UG1vL2FsbjJQTy90cU45?=
 =?utf-8?B?WVF3TWRJcUNnWDhjZzdiaUFZRXlTaHhZc3V3Y2VSRXNQMGVUbVhkcXhTbmMr?=
 =?utf-8?B?WStQYTZnSUM0WmdCZUlRWmRvVHpTREU5N3l4Ly9nc2pmQTNvOCtSbXJnRHAx?=
 =?utf-8?B?MVAyR1h3cmJ4bVN0VnRxcG82WkdBamM5OHNiR00xc0w4M0lTNlNkaHdzbnli?=
 =?utf-8?B?aktpTUtIT2F1dllyQllFZ25QeGxpUUhsRGVLbFdVdCtCWkZyMGYwUnU0dmZ1?=
 =?utf-8?B?aC9UMmV6RG8vdkVsOFdXekRUY0s5RzlYSyt6Sm9BanhNZTBZVUVGMElwUm9Q?=
 =?utf-8?Q?+twolLuobaKMVz9oxclZxmgS2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c71fe4f-5628-4161-e9e6-08de32746c5d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3041.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 14:01:15.1918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DzU1/kX485cfG44J8v+W2skn6zFFJoTSY0Xg0zBd8uMeceKceTdZd6nYjk0sDjp4lwNhldrXDpare4wEcIhmtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7938
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


On 03-12-2025 03:09, Matthew Brost wrote:
> On Mon, Dec 01, 2025 at 11:20:14AM +0530, Arvind Yadav wrote:
>> This allows userspace applications to provide memory usage hints to
>> the kernel for better memory management under pressure:
>>
>> Add the core implementation for purgeable buffer objects, enabling memory
>> reclamation of user-designated DONTNEED buffers during eviction.
>>
>> This patch implements the purge operation and state machine transitions:
>>
>> Purgeable States (from xe_madv_purgeable_state):
>>   - WILLNEED (0): BO should be retained, actively used
>>   - DONTNEED (1): BO eligible for purging, not currently needed
>>   - PURGED (2): BO backing store reclaimed, permanently invalid
>>
>> Design Rationale:
>>    - Async TLB invalidation via trigger_rebind (no blocking xe_vm_invalidate_vma)
>>    - i915 compatibility: retained field, "once purged always purged" semantics
>>    - Shared BO protection prevents multi-process memory corruption
>>    - Scratch PTE reuse avoids new infrastructure, safe for fault mode
>>
>> v2:
>>    - Use xe_bo_trigger_rebind() for async TLB invalidation (Thomas Hellström)
>>    - Add NULL rebind with scratch PTEs for fault mode (Thomas Hellström)
>>    - Implement i915-compatible retained field logic (Thomas Hellström)
>>    - Skip BO validation for purged BOs in page fault handler (crash fix)
>>    - Add scratch VM check in page fault path (non-scratch VMs fail fault)
>>    - Force clear_pt for non-scratch VMs to avoid phys addr 0 mapping (review fix)
>>    - Add !is_purged check to resource cursor setup to prevent stale access
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c           | 72 ++++++++++++++++++++++-----
>>   drivers/gpu/drm/xe/xe_gt_pagefault.c | 19 ++++++++
>>   drivers/gpu/drm/xe/xe_pt.c           | 36 ++++++++++++--
>>   drivers/gpu/drm/xe/xe_vm.c           | 11 ++++-
>>   drivers/gpu/drm/xe/xe_vm_madvise.c   | 73 ++++++++++++++++++++++++++++
>>   5 files changed, 193 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index cbc3ee157218..f0b3f7a13114 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -836,6 +836,53 @@ static int xe_bo_move_notify(struct xe_bo *bo,
>>   	return 0;
>>   }
>>   
>> +static void xe_bo_set_purged(struct xe_bo *bo)
>> +{
>> +	/* BO must be locked before modifying madv state */
>> +	dma_resv_assert_held(bo->ttm.base.resv);
>> +
> +1 to assert, but I think xe_bo_assert_held can be used.


Noted.

>
>> +	atomic_set(&bo->madv_purgeable, XE_MADV_PURGEABLE_PURGED);
>> +}
>> +
>> +/**
>> + * xe_ttm_bo_purge() - Purge buffer object backing store
>> + * @ttm_bo: The TTM buffer object to purge
>> + * @ctx: TTM operation context
>> + *
>> + * This function purges the backing store of a BO marked as DONTNEED and
>> + * triggers rebind to invalidate stale GPU mappings. For fault-mode VMs,
>> + * this zaps the PTEs. The next GPU access will trigger a page fault and
>> + * perform NULL rebind (scratch pages or clear PTEs based on VM config).
>> + */
>> +static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
>> +{
>> +	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>> +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
>> +
>> +	if (ttm_bo->ttm) {
>> +		struct ttm_placement place = {};
>> +		int ret = ttm_bo_validate(ttm_bo, &place, ctx);
> Do we need to the eviction to complete? e.g., wait on DMA_RESV_USAGE_KERNEL slots?


xe_ttm_bo_purge is existing code, not written by me. I just relocated 
the function to this section.

>> +
>> +		drm_WARN_ON(&xe->drm, ret);
> Likely an specific warn on function or assert.
same, xe_ttm_bo_purge is existing code, not written by me. I just 
relocated the function to this section.
>
>> +		if (!ret && bo) {
> When would BO be NULL? I don't think ever.


Noted.

>
>> +			if (atomic_read(&bo->madv_purgeable) == XE_MADV_PURGEABLE_DONTNEED) {
> Can we helpers for madv_purgeable access /w an assert?


Noted.

>
>> +				xe_bo_set_purged(bo);
>> +
>> +				/*
>> +				 * Trigger rebind to invalidate stale GPU mappings.
>> +				 * - Non-fault mode: Marks VMAs for rebind
>> +				 * - Fault mode: Zaps PTEs (sets to 0), next access triggers fault
>> +				 *   and NULL rebind with scratch/clear PTEs per VM config
>> +				 */
>> +				ret = xe_bo_trigger_rebind(xe, bo, ctx);
>> +				if (ret)
>> +					drm_warn(&xe->drm,
>> +						 "Failed to invalidate purged BO: %d\n", ret);
> Xe specific warn on or assert?


Noted.

>
> Also maybe this function just returns an error if something fails too
> and xe_bo_move would return that failure.


same, xe_ttm_bo_purge is existing code, not written by me. I just 
relocated the function to this section

>
>> +			}
>> +		}
>> +	}
>> +}
>> +
>>   static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>   		      struct ttm_operation_ctx *ctx,
>>   		      struct ttm_resource *new_mem,
>> @@ -853,8 +900,18 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>   	bool needs_clear;
>>   	bool handle_system_ccs = (!IS_DGFX(xe) && xe_bo_needs_ccs_pages(bo) &&
>>   				  ttm && ttm_tt_is_populated(ttm)) ? true : false;
>> +	int state = atomic_read(&bo->madv_purgeable);
>>   	int ret = 0;
>>   
>> +	/*
>> +	 * Purge only non-shared BOs explicitly marked DONTNEED by userspace.
>> +	 * The move_notify callback will handle invalidation asynchronously.
>> +	 */
>> +	if (evict && state == XE_MADV_PURGEABLE_DONTNEED && !xe_bo_is_shared_locked(bo)) {
>> +		xe_ttm_bo_purge(ttm_bo, ctx);
>> +		return 0;
>> +	}
>> +
>>   	/* Bo creation path, moving to system or TT. */
>>   	if ((!old_mem && ttm) && !handle_system_ccs) {
>>   		if (new_mem->mem_type == XE_PL_TT)
>> @@ -1606,18 +1663,6 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
>>   	}
>>   }
>>   
>> -static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
>> -{
>> -	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>> -
>> -	if (ttm_bo->ttm) {
>> -		struct ttm_placement place = {};
>> -		int ret = ttm_bo_validate(ttm_bo, &place, ctx);
>> -
>> -		drm_WARN_ON(&xe->drm, ret);
>> -	}
>> -}
>> -
>>   static void xe_ttm_bo_swap_notify(struct ttm_buffer_object *ttm_bo)
>>   {
>>   	struct ttm_operation_ctx ctx = {
>> @@ -2202,6 +2247,9 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
>>   #endif
>>   	INIT_LIST_HEAD(&bo->vram_userfault_link);
>>   
>> +	/* Initialize purge advisory state */
>> +	atomic_set(&bo->madv_purgeable, XE_MADV_PURGEABLE_WILLNEED);
>> +
>>   	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
>>   
>>   	if (resv) {
>> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> index a054d6010ae0..8c7e5dcb627b 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> @@ -87,6 +87,13 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
>>   	if (!bo)
>>   		return 0;
>>   
>> +	/*
>> +	 * Skip validation/migration for purged BOs - they have no backing pages.
>> +	 * Rebind will use scratch PTEs instead.
>> +	 */
>> +	if (xe_bo_is_purged(bo))
>> +		return 0;
>> +
> This needs a rebase as xe_gt_pagefault.c is gone upstream and replaced
> with xe_pagefault.c.


Noted.

>
>>   	return need_vram_move ? xe_bo_migrate(bo, vram->placement, NULL, exec) :
>>   		xe_bo_validate(bo, vm, true, exec);
>>   }
>> @@ -100,9 +107,21 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
>>   	struct drm_exec exec;
>>   	struct dma_fence *fence;
>>   	int err, needs_vram;
>> +	struct xe_bo *bo;
>>   
>>   	lockdep_assert_held_write(&vm->lock);
>>   
>> +	/*
>> +	 * Check if BO is purged. For purged BOs:
>> +	 * - Scratch VMs: Allow rebind with scratch PTEs (safe zero reads)
>> +	 * - Non-scratch VMs: FAIL the page fault (no scratch page available)
>> +	 */
>> +	bo = xe_vma_bo(vma);
>> +	if (bo && xe_bo_is_purged(bo)) {
>> +		if (!xe_vm_has_scratch(vm))
>> +			return -EACCES;
>> +	}
> As discussed in other patches, move the xe_bo_is_purged check under the
> dma-resv lock.


Noted.

>
>> +
>>   	needs_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
>>   	if (needs_vram < 0 || (needs_vram && xe_vma_is_userptr(vma)))
>>   		return needs_vram < 0 ? needs_vram : -EACCES;
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index d22fd1ccc0ba..062f64b16a58 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -533,20 +533,26 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>>   	/* Is this a leaf entry ?*/
>>   	if (level == 0 || xe_pt_hugepte_possible(addr, next, level, xe_walk)) {
>>   		struct xe_res_cursor *curs = xe_walk->curs;
>> +		struct xe_bo *bo = xe_vma_bo(xe_walk->vma);
>>   		bool is_null = xe_vma_is_null(xe_walk->vma);
>> -		bool is_vram = is_null ? false : xe_res_is_vram(curs);
>> +		bool is_purged = bo && xe_bo_is_purged(bo);
> Can we drop is_purged and just set is_null to true for purged BOs?
>
> Or rename s/is_null/is_null_or_purged for clarity?


Agreed, I will do the changes as per suggestion.

>
>> +		bool is_vram = (is_null || is_purged) ? false : xe_res_is_vram(curs);
>>   
>>   		XE_WARN_ON(xe_walk->va_curs_start != addr);
>>   
>>   		if (xe_walk->clear_pt) {
>>   			pte = 0;
>>   		} else {
>> -			pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
>> +			/*
>> +			 * For purged BOs, treat like null VMAs - pass address 0.
>> +			 * The pte_encode_vma will set XE_PTE_NULL flag for scratch mapping.
>> +			 */
>> +			pte = vm->pt_ops->pte_encode_vma((is_null || is_purged) ? 0 :
>>   							 xe_res_dma(curs) +
>>   							 xe_walk->dma_offset,
>>   							 xe_walk->vma,
>>   							 pat_index, level);
>> -			if (!is_null)
>> +			if (!is_null && !is_purged)
>>   				pte |= is_vram ? xe_walk->default_vram_pte :
>>   					xe_walk->default_system_pte;
>>   
>> @@ -570,7 +576,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>>   		if (unlikely(ret))
>>   			return ret;
>>   
>> -		if (!is_null && !xe_walk->clear_pt)
>> +		if (!is_null && !is_purged && !xe_walk->clear_pt)
>>   			xe_res_next(curs, next - addr);
>>   		xe_walk->va_curs_start = next;
>>   		xe_walk->vma->gpuva.flags |= (XE_VMA_PTE_4K << level);
>> @@ -723,6 +729,26 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>>   	};
>>   	struct xe_pt *pt = vm->pt_root[tile->id];
>>   	int ret;
>> +	bool is_purged = false;
>> +
>> +	/*
>> +	 * Check if BO is purged:
>> +	 * - Scratch VMs: Use scratch PTEs (XE_PTE_NULL) for safe zero reads
>> +	 * - Non-scratch VMs: Clear PTEs to zero (non-present) to avoid mapping to phys addr 0
>> +	 *
>> +	 * For non-scratch VMs, we force clear_pt=true so leaf PTEs become completely
>> +	 * zero instead of creating a PRESENT mapping to physical address 0.
>> +	 */
>> +	if (bo && xe_bo_is_purged(bo)) {
>> +		is_purged = true;
>> +
>> +		/*
>> +		 * For non-scratch VMs, a NULL rebind should use zero PTEs
>> +		 * (non-present), not a present PTE to phys 0.
>> +		 */
>> +		if (!xe_vm_has_scratch(vm))
>> +			xe_walk.clear_pt = true;
> So the idea is purged BOs will fault if the VMA is accessed on
> non-scratch VMs?


Yes, exactly. The behavior differs based on VM type:

- Scratch VMs: Purged BOs use scratch PTEs (XE_PTE_NULL flag set by 
pte_encode_vma when addr=0). GPU reads return zeros, no fault.
- Non-scratch VMs: Purged BOs get completely zero PTEs (non-present). 
Any GPU access will fault, which is the expected behavior for 
non-scratch VMs - they don't have scratch pages to fall back to.

>
>> +	}
>>   
>>   	if (range) {
>>   		/* Move this entire thing to xe_svm.c? */
>> @@ -762,7 +788,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>>   	if (!range)
>>   		xe_bo_assert_held(bo);
>>   
>> -	if (!xe_vma_is_null(vma) && !range) {
>> +	if (!xe_vma_is_null(vma) && !range && !is_purged) {
>>   		if (xe_vma_is_userptr(vma))
>>   			xe_res_first_dma(to_userptr_vma(vma)->userptr.pages.dma_addr, 0,
>>   					 xe_vma_size(vma), &curs);
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 10d77666a425..d03e69524369 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -1336,6 +1336,9 @@ static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>>   static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
>>   			       u16 pat_index, u32 pt_level)
>>   {
>> +	struct xe_bo *bo = xe_vma_bo(vma);
>> +	struct xe_vm *vm = xe_vma_vm(vma);
>> +
>>   	pte |= XE_PAGE_PRESENT;
>>   
>>   	if (likely(!xe_vma_read_only(vma)))
>> @@ -1344,7 +1347,13 @@ static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
>>   	pte |= pte_encode_pat_index(pat_index, pt_level);
>>   	pte |= pte_encode_ps(pt_level);
>>   
>> -	if (unlikely(xe_vma_is_null(vma)))
>> +	/*
>> +	 * NULL PTEs redirect to scratch page (return zeros on read).
>> +	 * Set for: 1) explicit null VMAs, 2) purged BOs on scratch VMs.
>> +	 * Never set NULL flag without scratch page - causes undefined behavior.
>> +	 */
>> +	if (unlikely(xe_vma_is_null(vma) ||
>> +		     (bo && xe_bo_is_purged(bo) && xe_vm_has_scratch(vm))))
>>   		pte |= XE_PTE_NULL;
>>   
>>   	return pte;
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> index cad3cf627c3f..3ba851e0b870 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> @@ -158,6 +158,60 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>>   	}
>>   }
>>   
>> +/*
>> + * Handle purgeable buffer object advice for DONTNEED/WILLNEED/PURGED.
>> + * Updates op->purge_state_val.retained to indicate if backing store
>> + * exists (matches i915's retained).
>> + */
>> +static void xe_vm_madvise_purgeable_bo(struct xe_device *xe, struct xe_vm *vm,
>> +				       struct xe_vma **vmas, int num_vmas,
>> +				       struct drm_xe_madvise *op)
>> +{
>> +	bool has_purged_bo = false;
>> +	int i;
>> +
>> +	xe_assert(vm->xe, op->type == DRM_XE_VMA_ATTR_PURGEABLE_STATE);
>> +
>> +	for (i = 0; i < num_vmas; i++) {
>> +		struct xe_bo *bo = xe_vma_bo(vmas[i]);
>> +
>> +		if (!bo)
>> +			continue;
>> +
>> +		/* BO must be locked before modifying madv state */
>> +		dma_resv_assert_held(bo->ttm.base.resv);
> xe_bo_assert_held


Noted.

>
>> +
>> +		/*
>> +		 * Once purged, always purged. Cannot transition back to WILLNEED.
>> +		 * This matches i915 semantics where purged BOs are permanently invalid.
>> +		 */
>> +		if (xe_bo_is_purged(bo)) {
>> +			has_purged_bo = true;
>> +			continue;
>> +		}
>> +
>> +		switch (op->purge_state_val.val) {
>> +		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
>> +			atomic_set(&bo->madv_purgeable, XE_MADV_PURGEABLE_WILLNEED);
>> +			break;
>> +		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
>> +			if (!xe_bo_is_shared_locked(bo))
> I think we need a complete VMA check here per Thomas's feedback (e.g.,
> all VMAs attached to the BO must be in
> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED to flip the BO state). I think the
> BO is an import or exported dma-buf we can never flip the state as we
> don't know what an external device is doing with it.


I will add VMA checK as per suggestion.

Good catch on the dma-buf case.
However, you're right that we're missing the imported/exported dma-buf 
check. I'll add a check to reject DONTNEED for:
- Imported BOs (bo->ttm.base.import_attach != NULL)
- Exported BOs (bo->ttm.base.dma_buf != NULL && 
bo->ttm.base.dma_buf->file != NULL)

~Arvind

>
> Matt
>
>> +				atomic_set(&bo->madv_purgeable, XE_MADV_PURGEABLE_DONTNEED);
>> +			break;
>> +		default:
>> +			drm_warn(&vm->xe->drm, "Invalid madvice value = %d\n",
>> +				 op->purge_state_val.val);
>> +			return;
>> +		}
>> +	}
>> +
>> +	/*
>> +	 * Set retained flag to indicate if backing store still exists.
>> +	 * Matches i915: retained = 1 if not purged, 0 if purged.
>> +	 */
>> +	op->purge_state_val.retained = !has_purged_bo;
>> +}
>> +
>>   typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
>>   			     struct xe_vma **vmas, int num_vmas,
>>   			     struct drm_xe_madvise *op);
>> @@ -283,6 +337,19 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
>>   			return false;
>>   		break;
>>   	}
>> +	case DRM_XE_VMA_ATTR_PURGEABLE_STATE:
>> +	{
>> +		u32 val = args->purge_state_val.val;
>> +
>> +		if (XE_IOCTL_DBG(xe, !((val == DRM_XE_VMA_PURGEABLE_STATE_WILLNEED) ||
>> +				       (val == DRM_XE_VMA_PURGEABLE_STATE_DONTNEED))))
>> +			return false;
>> +
>> +		if (XE_IOCTL_DBG(xe, args->purge_state_val.reserved))
>> +			return false;
>> +
>> +		break;
>> +	}
>>   	default:
>>   		if (XE_IOCTL_DBG(xe, 1))
>>   			return false;
>> @@ -402,6 +469,12 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>>   					goto err_fini;
>>   			}
>>   		}
>> +		if (args->type == DRM_XE_VMA_ATTR_PURGEABLE_STATE) {
>> +			xe_vm_madvise_purgeable_bo(xe, vm, madvise_range.vmas,
>> +						   madvise_range.num_vmas, args);
>> +			goto err_fini;
>> +
>> +		}
>>   	}
>>   
>>   	if (madvise_range.has_svm_userptr_vmas) {
>> -- 
>> 2.43.0
>>

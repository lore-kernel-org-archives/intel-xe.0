Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92147CA1010
	for <intel-xe@archiver.kernel.org>; Fri,  5 Sep 2025 07:41:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D74810E2C7;
	Fri,  5 Sep 2025 07:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I9eE1+FK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C714910E2C7
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Sep 2025 07:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757058063; x=1788594063;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l5Mp7tUjpptIFDAm6qHr7HMP/+M5W1v5n17mNhh4tlo=;
 b=I9eE1+FKJRD2cphBvRLP/+yazyhQ++2g8Cc+HkgogQJYtUK1M5irRAnE
 YAwqepBmUGwuoLa8NyJc6CYGvNQOxc3mF4XzR80UZExvSZHyPnTv4zEvd
 0ebBczRU4wl4sKOcbCnLYojidc4hOj4G0haUbBc9afhkDt4RiFEFW6l55
 40xL395D9jg9CEaUOH0ZrhN2F7r9oICeYkBWOugcUihZiZ9yF5LSNGlyx
 rzxB21YELYBScHdoIUgxg29DKxthpt7hDiaf1QtyBJYsTxm6OS4cYVo+g
 Irdip8UlEa2r+aWjXKYs/mgAKpYh1A0aJDPGMuIaSq4HpMXkZdyuK5nY4 Q==;
X-CSE-ConnectionGUID: V9BlSy4hRfGMNBgXtgCiiQ==
X-CSE-MsgGUID: rGip83A0RyKWehGuUst0OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="70021424"
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; d="scan'208";a="70021424"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 00:40:57 -0700
X-CSE-ConnectionGUID: 8ECQHuXBRoicWP6e49nPkg==
X-CSE-MsgGUID: fjRWdb74TRqjZ5WwRY23Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; d="scan'208";a="176444418"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 00:40:56 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 00:40:55 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 5 Sep 2025 00:40:55 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.47)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 00:40:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uWyk5KGpzobj7Whb5/ugiNK7ckcCeDeAhs+ly7r2UriKKlnEmDKGWhOmQse2P9uEVp21ftmY5Fcu1e4Wq25ACfaIFc530VAArxtaDE59vo5pB0/RBSXN0CxtzzKhip35+HJGlmMynVQzkVKGyz554nyy+EVe/N6keLxLYPhjND3u+qRx568zOQF1A+cPqMzjI2XMYwHIZc8nesxib3CbXu5r0p3vjdCIYvkbHie3GvxF8LKgLptZlFUaKbnAKeD4C+t3Lq80O4g+8nekvjH6S04fz8rRuAPqDEiFhvYsjcIGaaVSqpbe1qc6S0eeQzh32Ack6kLf655YaeWsiPSCAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71vrxWAXxvKwjYR9oVrBcWoe+qM/lbI36U1vkpn2StE=;
 b=vZ32f1Kr2isL+rJN/Q6sKNPySoSUD0GoPW/vhYxw0Mmkeq1UQDJupByjpERU7PNpfi+x8W1Hw2nBp87+y9KTOaXZhaXbRfloBA22EcVW3VjcoZxgd5pNRa8aXEnQOSiNNzISAVYxhXqTmuz10sZBumPoKmTygOYzEuPDhBVp6CROl0kzbszhJ/5jxgfZbteZT2uZJ1SsKpcfnus4lI5QA5CLfnw16bU5TxUSruzC+vQ87juxYWmE843N5mt5tD/wU4pj7jRqDjnokWGgJLyV5ZExqJnj4Kxdg1QEgRcJFZMD5eY7jB+pqyBFMYTkFRGp3ntjiDxKY4CMroNLQu8vnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by DM4PR11MB6237.namprd11.prod.outlook.com (2603:10b6:8:a9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Fri, 5 Sep
 2025 07:40:53 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9094.017; Fri, 5 Sep 2025
 07:40:52 +0000
Message-ID: <bb0e2af6-4324-4060-a5ce-eb58d207bf49@intel.com>
Date: Fri, 5 Sep 2025 13:10:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/xe/vf: Use single check when calling VF CCS
 functions
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20250904192918.7346-1-michal.wajdeczko@intel.com>
 <20250904192918.7346-5-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250904192918.7346-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::10) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|DM4PR11MB6237:EE_
X-MS-Office365-Filtering-Correlation-Id: 823fc8a0-63bb-433e-d5fd-08ddec4f8a69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0t2NWVoT1VwOU40S3h4U3hTa3Y1eHNHYkFtOHBOZmt2aXZtVGdpaHZUZmhu?=
 =?utf-8?B?MFJaWmd5ZkY0RTFoSXhIQkJqZ3BuZnF4UTA3dHg3NFlENk5BdjZMaU41YzRu?=
 =?utf-8?B?UzNQNFlETk51QXFPQitacnhnVXR5YXdlTzR3SEN0Y2NhYkVBajY2T1QvU2s0?=
 =?utf-8?B?UVF6MkFQNWJBRkJYWW01RUUzVzFjbGdpbzlSWjVya3JYNnRMakovYmo2a1lx?=
 =?utf-8?B?dEFFNm1DUWR0OHpTdk5XciszQk8veWdaZ01SMlhwbXNLZmI0bGRpNk1lV0Y0?=
 =?utf-8?B?M3JiYmJJdVRRQmJhR0MyalNIbEtnUEpzK1FSR0xJWjdXa1JjdWxZQXBIU2ts?=
 =?utf-8?B?K05CeHlScjNQYlZwMU5KNXQ3VmxsM29pMy9vSDZhWlpoUjB1bENyMzgvcDMz?=
 =?utf-8?B?YkVNbC9ub1JJQWdLNXJvUHBWOGVJdWVaYWhrZzgzVEZzN2RPcFBWUW5aYmVU?=
 =?utf-8?B?S1lzMDE5REdNSTAzU3U2VUpSR2p3UnJ4bDE5dloxZTZKVktQVFlIWGRWN2l2?=
 =?utf-8?B?bGVES3VFRlM1OG82RTVpeWYxWkFrb1I2ZXQ0SW1pTEhIS3lxcGJmM2R2OG4r?=
 =?utf-8?B?NWxhdFRBUHdCcVdQR25ySWxTYVFCSUhseUt3WWUwS1VmMi8yM1BXRUZPNkdn?=
 =?utf-8?B?RWcyRENRZFByd3h1Z0plYjhmVkQyVjlZN2FTTUJQK0FBaUVtWFlUL2FJOVB0?=
 =?utf-8?B?SnZ4RzFHcUtnc20vZEdiRFJ2M0daWlpiSHE3QVJKNmhYejFGb0JQN2VzdEp0?=
 =?utf-8?B?cnU5bUlyWVFtM0F1b1Y0UmI3TGdYZCtma0dCRWtHc0h2RE40VG5TYjN0R0pP?=
 =?utf-8?B?ekZBSUtFekIrV1JMd0VPVWU0L20yb3o1R05KUTFseEswVHFoMEhUaEFHdDVt?=
 =?utf-8?B?eUJ1L09vdmVxNVh6eEZxSFVXU29WRlJpaEpNWlJFMjJ6bHVhZDhDb3ZzVUtH?=
 =?utf-8?B?bXVoWXdEaTVrRm9zL093Mlh4dkhBdUc3bHlvRVMwdUdGNEJ5RlU3QWI1NVli?=
 =?utf-8?B?b3dXaTRhSTQ3Um1VUHdnd3k1TG5wbzhtdmR6a0pHTzM5Q01TT1BIb25OVlNC?=
 =?utf-8?B?L1B0M3NZSUNucFBlWE5nbE5uc1VPSVliaGpYQVd0NmI3SDZuUHlhdXd1bC9x?=
 =?utf-8?B?ZEVrRmZxVHk2cEt6aFZPeHV6WGdFZ28yUjQyNVFmcS9ubVFaVDNFeU82RFJw?=
 =?utf-8?B?cTF1U0ZENXg5d0tsckd4VStMZE4yQXFocFE4OWtkMWx0Ym5EQmR6VWFSQU5h?=
 =?utf-8?B?Z0N0KzY4QjRUZnpmZkZ4MlN4ZWIveisxRW9YTENoamU4VmhpSzVRcXJrZU41?=
 =?utf-8?B?aUhNVXBwaktQQ3EwY2lYOURvcStDeWI1QVpHazdOYVA3M2E1T0lYN0xIOHdO?=
 =?utf-8?B?T3ZvdVJmMGg4Q2prbUdoMWFHTFNZVUM4cnc2QkEwcUF3dEQ1N1lsaThwNlFw?=
 =?utf-8?B?MEZmdldDVkdTaEhjV1I2OU5odXRwYUtLZ1JvTld4eXU1aXB6UHVmV0RKTG5j?=
 =?utf-8?B?ekZDcWJ4QmJmQmlaSG5wU3R3Rmc2aFIvYlk0NGg4cjFWZTlRN2EwMkFDNVVx?=
 =?utf-8?B?QUtOMlNGcWgxRDR1TE1tdTVKVXlWTjI3SSsxcUkySDI3bE9jYmVvajRYYWpR?=
 =?utf-8?B?TU10Q0pDdnRtK1FhQnorNDRvK0IrdzRiRnJDMkdXZlR2dTRJcEFiMFBZWVhp?=
 =?utf-8?B?ZlFCNk81TWZ3ZE5udmVHd2p3S2tTNWprQndvczhjK0I0aWcwWXkyZ20ydlI3?=
 =?utf-8?B?STkydHk3OUFFREpUdHdoalo0dytYa1pwRkJ2eU9JMjFsYWFacFZlZVVGUk9B?=
 =?utf-8?B?MlVOdlZXR0hVbHdTQi9YUkxCMnFaTENkSHhNcEdSd21FWmdVNUthRTdzbDlM?=
 =?utf-8?B?T3oyRnBXaTQ0ZllkZTFJV3oxMDJTdUtSZnpkZHBMdW9UZ1BrNTN3bG94ZzJo?=
 =?utf-8?Q?inyL+Hnzi2Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkdxb09PMVJqSjFuSVZoMitOMTFlWG9BdjNuWko2czR2MUdWeHpjK0JZT042?=
 =?utf-8?B?Q3QyT2dXS0lTbjdkL01aTmlxd1NKRExLWlFvRXN0R1VZQ3hPU2lSQTVEMW40?=
 =?utf-8?B?U3J2S21DZWRwYzFzQ3VXK3g4U243TVpUZEVtZm5Qa1U1NkpvbkE2WjYycy9a?=
 =?utf-8?B?WWRybEViLzY1TWFVS0NuQlBIQ0crbXpWZE5Vd3VTUHZuakQzaytLRmhvM3JP?=
 =?utf-8?B?Vkl3OUxnOVZwMVorN1g2NlQ2RnJ1YXU3cmptL3kxU01qRGZja213NHR2empr?=
 =?utf-8?B?N3pLMkVtcExHaUNLQ0FibHROcnExQWdMQUJhQ0czN1NVRFBMNllWQXhjYVpx?=
 =?utf-8?B?NmpJY1ZQRGFnWVFES2pXanB1ZGZvazFrL3paQlh4VkJhRFFpRStNNGhKRmpP?=
 =?utf-8?B?Snl6ajFCVE90WVI2eWhJang1cDNiZXF6UGRWUUUzbHQrYy9sdlRVTDR5SFV2?=
 =?utf-8?B?RHhkRzk4VVhTRFk3bUxSWE1ocFBUQ2liK2tUdUs4MWRlMEZLOElHR0tOSHJM?=
 =?utf-8?B?TXZVeG5UM05TekdlWlkrVEYyZ1dpOWRFMUpaelhhNUFtSzlEOFJWZE13dW9Y?=
 =?utf-8?B?WnNIQTRHNWZHeTlVMTlRdG02UkkxWWRXOVpidVNUUGpqNVZUUTVScHpYWE4v?=
 =?utf-8?B?dnVyVTNJZXozN0NKWklaUUdJQWJYN0lQQTk0QkFlVkRsWnhtMGRZcktacURT?=
 =?utf-8?B?N3Z5V1VENllPcUJldmg0b1hYaWlnSDdBa0tOek5wMVhoYitCK29rMHpVUGYr?=
 =?utf-8?B?VjVLR24zQjg3YkI4UWsrR1FGRVZjbzV0YWtQSjk0NzlDaVJ4WWJpZytkb2xK?=
 =?utf-8?B?YXhEMGVRRmRMQ2VLTmRJZUw4dVNYOGpiSCswcW9HK1ZMUzdDTmNIUHFZenNi?=
 =?utf-8?B?TkFhM3VlMUVpSGZrbUxTamxQenFPTjE1TlQrd0V2a0Z5OUNNekg2SWMvME9t?=
 =?utf-8?B?WmtCVG1ZOTF1Z3E0dldSWWJJVVFPb2hhamIwc0pJTW1kR3IvK2hWY0xvdXZl?=
 =?utf-8?B?Z2hxRzBIVTlHdld3L1hmNmJVbWs1ZnEzWFE4TURKWXpsb2thR28zc01VcHZJ?=
 =?utf-8?B?eGI1NzZwMTcrRHZnSThYRWxuZkljeGNIZXBLUTVuaE1YN0dUeUpSck10Rmoy?=
 =?utf-8?B?RVg0SHhQT1NJMmpvRU95YVlvM0F5V2VveHJ2dzRLNW1pQld5ZHZzT2gzbnd4?=
 =?utf-8?B?RmxUYkt3Qzd0QTFTdE8yaGhlaUlQMHZLM0tPWmZ3eWE3aUlTNUd5dUVnd1BD?=
 =?utf-8?B?TzlIVmZRcTRyZGlsUnZpTEwzeHg0YndaZG1qc1NmMVVod3hhMEliZE5Ia2Nm?=
 =?utf-8?B?Q2xwZkYrL21Sb3UwdW1ZQ2NvKzRSOERYK1dlelhDbmc3VFNBeVE5aC9uNThC?=
 =?utf-8?B?cDBEdWdTZUM1cmdYdW9NVFpxV3gxTm1Mc2FiUHkza0lGYVhCVVk4N1drQXlt?=
 =?utf-8?B?dWprK25DN0FFVm1RYUQ0ZmYzL1E0ZUNBTTZPM1JWNm92UFQ3NlRaV2lVUHo4?=
 =?utf-8?B?SnNuOXZWbHhSb1BGMi9rQ3FWTmVzNE9tR3VUQkY4clZuL0MzeXZKNUwwdDN2?=
 =?utf-8?B?b2NvQlI4dWF1MmkwTnVLblRJNWozMGpmWkE4QUFPc1RPcmlFc1FqS080aUVw?=
 =?utf-8?B?UklvaTQ1OXh0djM2U1JZWnZaMEZXbitWcHlmNnNLYVpacGhCK3NJQnBsK0Uv?=
 =?utf-8?B?WXdhclozc2JBODJqU1Fobm40eVpTbDgwMTRoVGMvRTlVQ3pPWldoZmVUTG5p?=
 =?utf-8?B?ZFM0cjNVcmRnR1BlNGRKVlJiSjdaMDFSZHhxdUJUQkhKK1lucDF5NzJBMVgx?=
 =?utf-8?B?cW9xUXNoNUR5Rkl1ZGpXOVBSdmV4YzJVQ1ZRcUhmVUhCbTVyWjVvQVBVVFo4?=
 =?utf-8?B?WUZ0dit6bzVkRTc4NnZ4NURUK1VqNEN1eEVEMVJMdE4yRWd2UkRyUXNFclV0?=
 =?utf-8?B?OE9OTEVOZkdYWGNqNERtZUVtM2F4SjlaeThoRjY1QzZsZ3VwcnhJMEZqSVR1?=
 =?utf-8?B?anVEUVRBSmhqd1I3YnhPNnBmNTNtUlVWNlJwcHp2ZE1TcVYyM3RwZlNrMjFL?=
 =?utf-8?B?S2dYa2RzUlBWb0huT2sxSG9jQm1jd2xTTHIxTnRUNHowOUMwcjJjMExXR1My?=
 =?utf-8?B?NFg3bDVlejcvY2JXSjNUMlVoaHhNalpEU3A4WklrK3Z0WGM4WU5WUXkvNEw4?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 823fc8a0-63bb-433e-d5fd-08ddec4f8a69
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 07:40:52.8359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kxVO5ItyqhTo9tt/csc4Q/mPpv5+8WrZE8rEJx85j5qK0w5+nZGzhRaRhsqY4ucJQMV0JGLcm1GvrgHX7HCwAV4tB4x64YX7Oho2z/ECNN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6237
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



On 05-09-2025 00:59, Michal Wajdeczko wrote:
> All xe_sriov_vf_ccs() functions but init() expect to be called
> when initialization was successful and CCS handling is ready.
> 
> Update IS_VF_CCS_READY macro and use it as single entry guard.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c                 |  8 ++++----
>   drivers/gpu/drm/xe/xe_gt_debugfs.c         |  1 +
>   drivers/gpu/drm/xe/xe_pm.c                 |  4 ++--
>   drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 10 +++++-----
>   drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       | 15 +++++++++++++++
>   drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  6 ------
>   6 files changed, 27 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 4faf15d5fa6d..228574e90f18 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -972,11 +972,11 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   	 * CCS meta data is migrated from TT -> SMEM. So, let us detach the
>   	 * BBs from BO as it is no longer needed.
>   	 */
> -	if (IS_VF_CCS_BB_VALID(xe, bo) && old_mem_type == XE_PL_TT &&
> +	if (IS_VF_CCS_READY(xe) && old_mem_type == XE_PL_TT &&
>   	    new_mem->mem_type == XE_PL_SYSTEM)
>   		xe_sriov_vf_ccs_detach_bo(bo);
>   
> -	if (IS_SRIOV_VF(xe) &&
> +	if (IS_VF_CCS_READY(xe) &&
>   	    ((move_lacks_source && new_mem->mem_type == XE_PL_TT) ||
>   	     (old_mem_type == XE_PL_SYSTEM && new_mem->mem_type == XE_PL_TT)) &&
>   	    handle_system_ccs)
> @@ -992,7 +992,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   		if (timeout < 0)
>   			ret = timeout;
>   
> -		if (IS_VF_CCS_BB_VALID(xe, bo))
> +		if (IS_VF_CCS_READY(xe))
>   			xe_sriov_vf_ccs_detach_bo(bo);
>   
>   		xe_tt_unmap_sg(xe, ttm_bo->ttm);
> @@ -1527,7 +1527,7 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
>   	if (!xe_bo_is_xe_bo(ttm_bo))
>   		return;
>   
> -	if (IS_VF_CCS_BB_VALID(ttm_to_xe_device(ttm_bo->bdev), bo))
> +	if (IS_VF_CCS_READY(ttm_to_xe_device(ttm_bo->bdev)))
>   		xe_sriov_vf_ccs_detach_bo(bo);
>   
>   	/*
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 5aa1eded278d..f6f2c14b642d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -31,6 +31,7 @@
>   #include "xe_reg_whitelist.h"
>   #include "xe_sa.h"
>   #include "xe_sriov.h"
> +#include "xe_sriov_vf_ccs.h"
>   #include "xe_tuning.h"
>   #include "xe_uc_debugfs.h"
>   #include "xe_wa.h"
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index a2e85030b7f4..c184097584cf 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -212,7 +212,7 @@ int xe_pm_resume(struct xe_device *xe)
>   
>   	xe_pxp_pm_resume(xe->pxp);
>   
> -	if (IS_SRIOV_VF(xe))
> +	if (IS_VF_CCS_READY(xe))
>   		xe_sriov_vf_ccs_register_context(xe);
>   
>   	drm_dbg(&xe->drm, "Device resumed\n");
> @@ -572,7 +572,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   
>   	xe_pxp_pm_resume(xe->pxp);
>   
> -	if (IS_SRIOV_VF(xe))
> +	if (IS_VF_CCS_READY(xe))
>   		xe_sriov_vf_ccs_register_context(xe);
>   
>   out:
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index b01bb3660fb1..30aea958a337 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -220,8 +220,7 @@ int xe_sriov_vf_ccs_register_context(struct xe_device *xe)
>   	struct xe_tile_vf_ccs *ctx;
>   	int err;
>   
> -	if (!IS_VF_CCS_READY(xe))
> -		return 0;
> +	xe_assert(xe, IS_VF_CCS_READY(xe));
>   
>   	for_each_ccs_rw_ctx(ctx_id) {
>   		ctx = &tile->sriov.vf.ccs[ctx_id];
> @@ -331,8 +330,7 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
>   	struct xe_bb *bb;
>   	int err = 0;
>   
> -	if (!IS_VF_CCS_READY(xe))
> -		return 0;
> +	xe_assert(xe, IS_VF_CCS_READY(xe));
>   
>   	tile = xe_device_get_root_tile(xe);
>   
> @@ -363,7 +361,9 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
>   	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
>   	struct xe_bb *bb;
>   
> -	if (!IS_VF_CCS_READY(xe))
> +	xe_assert(xe, IS_VF_CCS_READY(xe));
> +
> +	if (!IS_VF_CCS_BB_VALID(xe, bo))
>   		return 0;
>   
>   	for_each_ccs_rw_ctx(ctx_id) {
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> index 1f1baf685fec..f0e1189b417a 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> @@ -6,6 +6,10 @@
>   #ifndef _XE_SRIOV_VF_CCS_H_
>   #define _XE_SRIOV_VF_CCS_H_
>   
> +#include "xe_device_types.h"
> +#include "xe_sriov.h"
> +#include "xe_sriov_vf_ccs_types.h"
> +
>   struct xe_device;
>   struct xe_bo;
>   
> @@ -14,4 +18,15 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
>   int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
>   int xe_sriov_vf_ccs_register_context(struct xe_device *xe);
>   
> +static inline bool xe_sriov_vf_ccs_ready(struct xe_device *xe)
> +{
> +	xe_assert(xe, IS_SRIOV_VF(xe));
> +	return xe->sriov.vf.ccs.initialized;
> +}
> +
> +#define IS_VF_CCS_READY(xe) ({ \
> +	struct xe_device *xe__ = (xe); \
> +	IS_SRIOV_VF(xe__) && xe_sriov_vf_ccs_ready(xe__); \
> +	})
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> index 0df6b4130e7c..79092e386c4a 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> @@ -9,12 +9,6 @@
>   #define for_each_ccs_rw_ctx(id__) \
>   	for ((id__) = 0; (id__) < XE_SRIOV_VF_CCS_CTX_COUNT; (id__)++)
>   
> -#define IS_VF_CCS_READY(xe) ({ \
> -		struct xe_device *___xe = (xe); \
> -		xe_assert(___xe, IS_SRIOV_VF(___xe)); \
> -		___xe->sriov.vf.ccs.initialized; \
> -		})
> -
>   enum xe_sriov_vf_ccs_rw_ctxs {
>   	XE_SRIOV_VF_CCS_READ_CTX,
>   	XE_SRIOV_VF_CCS_WRITE_CTX,
LGTM.
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>


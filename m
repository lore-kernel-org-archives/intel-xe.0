Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1277C52D7F
	for <intel-xe@archiver.kernel.org>; Sat, 17 Aug 2024 10:36:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BCC10E05D;
	Sat, 17 Aug 2024 10:36:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UChCG4T9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E48110E071
 for <intel-xe@lists.freedesktop.org>; Sat, 17 Aug 2024 10:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723890989; x=1755426989;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Uu8EokNVL5irT8q8stgL02vRczOB5eqMyqLKck/NjWo=;
 b=UChCG4T9M0NPomLTtlhMP43Pv8K3TocRdUiu2R3ujejxifYFTzP4rgcy
 /dbU9xG1pINoHq0qMlyHVOX5EHCaTDN7MDjGEOV6x1wFViryOdsu4eiAD
 DqyfqtlTeZkzzEpPgum4+BhX9ElZFr6O/7KuT3WY+o4WfQnJ1m4t36mmS
 ltZSIMaSXKQsK4Iyv4O6OwfNpavRG8Gdr1P3ZEZBj53Y25GNkLn5FQN+3
 msz9N1aCKecAwnguvjzpcbeMpzoN/L2dMPVjlgVHWgVIqf23CuQWIpkyD
 LJ74Fm2utrqAUni86VQsTcUB6Dk65ppwokhl4+h3JmZBKVSzyn5F7nf3s w==;
X-CSE-ConnectionGUID: KOjof4s5Rgi8XT1SBRYsCw==
X-CSE-MsgGUID: bkO3SutHSwqowHARmp8clA==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="22352969"
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; d="scan'208";a="22352969"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 03:36:29 -0700
X-CSE-ConnectionGUID: rhV90G/hRW6PaekGlvIY5A==
X-CSE-MsgGUID: diyXr2/UTbK0zKz3Id4VIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; d="scan'208";a="60077812"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Aug 2024 03:36:29 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 17 Aug 2024 03:36:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 17 Aug 2024 03:36:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 17 Aug 2024 03:36:27 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 17 Aug 2024 03:36:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kFO0xQB+DZy2juOH9eAm7KX6f6l2Mdc2k2Kq9R+IedOO9GecojBGPPqrcwHLw8TawEQvi2msc94PYxFmJPqf1lXMEa2tgSkpBCaWSQvLxZbhRgrrwxdvinBvwftQLT+3w7uClMbLb/4adT2Sz9BJIukopPl8TpFDdQslCSOHiO5yu9UZhXkk67/Bx6Lm8Pw/UYdWbk8B7WGZ1cljjvSicZba7gPyCJzEa3PgwHx0khe9IS36P3rLzUwdI3UYxqfMhsY4tXH1rAuQVjPG1Yri/XcU4FNqmVcx2/RYPX4p7RG0U8Rya3rm18xeVHOXgg4bQZgaD8SiuJlV+5gAw8F3/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJexYBB2sa5Fgu3H/NOdwUktUFvqwolQFYxebJhBNbc=;
 b=MKSWcvySiruhYqPVft9yYmZXjb1QNjznLxcIuUpmuoSUyDwfIEQ4k3zR9srfU4PhilvDS8lwXZznwG5bsZpEfYUiZM7pwyZ3wr3gRxf33O1ohQuOojYYEOPb6b4tqQP1ECyrSA6BqWoNJR/jB0qhQReQ1jvPftUGJMxr1H/zNlbQlQqFvLOblroyvn9Ot2O3k5e0NjwEScbnDO32JAIVXfoWjEECMlEpRCqYeB/617vqXR14dL7vmap/VtR43bPKQvQcGdtPPC8wuSVt6STJAfJeRKeNScdYmZoCo/ASC4/b5I4V4LXwj6MrBJups7tpg5iec2c+Gl0QW/JC70bdFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SN7PR11MB6679.namprd11.prod.outlook.com (2603:10b6:806:269::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Sat, 17 Aug
 2024 10:36:26 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Sat, 17 Aug 2024
 10:36:26 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Matthew Auld <matthew.auld@intel.com>, Paulo Zanoni
 <paulo.r.zanoni@intel.com>, Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 12/12] drm/xe: Fix missing runtime outer protection for
 ggtt_remove_node
Date: Sat, 17 Aug 2024 06:35:55 -0400
Message-ID: <20240817103556.163783-12-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240817103556.163783-1-rodrigo.vivi@intel.com>
References: <20240817103556.163783-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0223.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::18) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SN7PR11MB6679:EE_
X-MS-Office365-Filtering-Correlation-Id: 4618ab58-427c-4ee4-c3b0-08dcbea87209
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZExpMzgrR203K1RNTWJSNjJkOGRSTksvVENuUUJONG40UEcvU2gvSG5NcFpB?=
 =?utf-8?B?VVNzV0hHMm5lL0YrN1g5NVpBVXI1Y3EwNmJPcDBhVk5tSUsrNVRJeXVRR1o2?=
 =?utf-8?B?VDlzT21SS1lDcnpDVS9YSFQ0bG9UcmhrSnBHVDdzY1ZzM0xyK2dudkFETDFa?=
 =?utf-8?B?MS83blFYcDlCT0pVZ1RhRDFyR2ozZTJLMVB0bUhsS1NPTWxFWFY2Ymh2MmZk?=
 =?utf-8?B?c2IxMlpuVzA2REl3bTFNa0F4eThqNmU1ZnczbDJGUTJnbFg0L0oyaCtudlZt?=
 =?utf-8?B?bFhqTnhodTY1aXZnWnRXZk9XMUsxTzhWMmpvYi9HRVlwRWhRaGZ1Tkc0V2pp?=
 =?utf-8?B?UUJvTzlVcTNGaHJFcHIyN3FXVUsxc1hSR0VIcE0vblU3czgvV3hGQ2tNaDl5?=
 =?utf-8?B?cHZ3Zmt4eUxlUDRjRXNVNE9OK2FxS1Ztbklaand1bC8waXk2VTVnYVVDMEwx?=
 =?utf-8?B?eGh3ZXY5eit4QnVnc29sQ0xzM0hIaTRvNXRzWkFZQmJRQVdMZTZEbUJMSlRl?=
 =?utf-8?B?NTBrWlN1aHlIcUR4OGwzbVRBK0NSZ0VzeHhWenlncWhpWmxTS3RNdmh0OU5s?=
 =?utf-8?B?NUxZa0VTNXVPRE9pdXI2TXB6eGE0UlFuN3EzVTI3ZENnaGROR3NiZWRObVRX?=
 =?utf-8?B?VThYS3BjK0VqR0FQRGdnSFFUL2MvZDhWMTVIVWNpbStkQmlHVU1zS0djMkRI?=
 =?utf-8?B?UGg4bjlRNkhrbnlwd1c2TzhwSVFHdm8xQVE1amxZOGNZUGhScEljVGV2NDU1?=
 =?utf-8?B?UUVFalE0dEZzcjh0T29YVzR0Z1ZPNUpuc2I4R0JzS1dKNVNpTzNHc1ovV2ZO?=
 =?utf-8?B?RTNsWitWVGw1Z1hqVkpRTjZGOHB6Qm40dzhPVnpBSWZ6cGtHYWpoWlFIR29Z?=
 =?utf-8?B?SXprME1oR2kwTUF0eEVEcC9PVjAwUzdFalNtT3AwZmR1VVlORTh1aHlvUG5q?=
 =?utf-8?B?ZllGNUpsTnRSa2hhL0RTem5FMzltbitjbnBsZ01aSjcrVFlSdkxta1Q2aGZ4?=
 =?utf-8?B?N2c2SVFXQVFGQlZET3JROE9RKzdPZEUrWGxza3Nia2tJQTN6OFBFOE9kOWw5?=
 =?utf-8?B?clhxUktXT1c5QklsUkV1aXpYU1A5VFpOeTM5cW9kbzJJK1IxVkFzSkhyRVF2?=
 =?utf-8?B?Z2Z4b1F0Z2xKekM2L01IeHpLOHpMM1FIZlp6MlRLdDVQSk9ueGtjbUhIMG8z?=
 =?utf-8?B?N1U4dmlnUnFxRC8xVTl5Uzg3ZHA4ck40VFM4cDh1cWJJNTN4MTZHSTYxU2hJ?=
 =?utf-8?B?UWRuaDhGN2hzcmVlS29QT29YZVR5U1JGeU02N0NpV0pyV0dPQjhBNGNvQ1Qx?=
 =?utf-8?B?VXFBN2NDZU5YU2VDbDkrTUI1UU9lWjYrQ3ZyYUp1Q1N0TGFodTM2N0FPOTNz?=
 =?utf-8?B?bWtZSVpXenI1VitkalE0c2RERFBxdUJUa1ZUMGpMUmF1aGhaTGtJSCt2TnA3?=
 =?utf-8?B?OHhnZnQwVkFhRktDZEFmQk5UVzFSNDB4YWlPeXNBU0gxQVJDSlYyTWFTZHBY?=
 =?utf-8?B?REJnbzJyb0RnNjVyaUliVmFrWGdjbXZIb1g2SENhM3FCOXR0dzhMTnBNdStI?=
 =?utf-8?B?QzBuWjJLN0U2dmdYcjNjSUczOEdDendKSHRxTGFoam9LdlQxRlpOT0VhMkc1?=
 =?utf-8?B?M3Y0WDJuSVl1VTBmQ0tOMElaUzdhQlk4Zlg3eGxjK0JsUDlGNGFpREcwMFhJ?=
 =?utf-8?B?amQxQS9RUVA4c3l1S09MY29ucVE3ZWUrTHUzUFNKdTFYNmZSVVlCUWs3cmpw?=
 =?utf-8?B?VktkaXhSY3MxRjlEYTlHWEM4UityS1JCWDMrOTRHSlZkd01VT1oxSDd2aVVq?=
 =?utf-8?B?Tzg2Ni84aVZBM3Eyd090QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cU40Q0FXUHZ0c29pNEorNFhTOEZHbjBhVzI0RHV4ZjRQREwwdWV1NmNzWFBs?=
 =?utf-8?B?WXNDQ21kWUpkYUxtN3VMdGRmYWRJU2pXUFVIU1BqWnlVQTdzeTk0Nm5ESjR4?=
 =?utf-8?B?ci9qNkZDSE9BU1pLWFBUMVg3OXZUU283T0F1V0ZlYkpad08xUEEreGJDQjJr?=
 =?utf-8?B?VE9HV2w0eU5CSEMyUGJoSWo5dVduakZwcnVFWnc4TUhtRys3aHZoQ0FoUkQz?=
 =?utf-8?B?V0RBKzJFSDk1REY0MHN5YjdVQUhwRG9EWjh3Q2NLbGY2azg3TmZveVRsWTVr?=
 =?utf-8?B?SFBCVlArTlpHUWJNTXN0aFlsOG5ZMnp0MFFSTlB1R2h6TmNIaFkxSEtRWVpN?=
 =?utf-8?B?ejZyTGU0WHc0QXprclVmVnZzTFl5V1dFY293bmRvV1RKWkJWK2lKRlFCaGxR?=
 =?utf-8?B?WlJybEZudVZaQWx3QmhCKytEQ0xmR2pJa0pVM21qeDh5Zm5HSUVQMVJUUmdV?=
 =?utf-8?B?MkNYRW5RNW9oQytVekl4bFBkM0FiZWZDTW1ROTJKQk8yaW9zMHBEVjVDWERk?=
 =?utf-8?B?YnM4bmQzNytpWWUycmlUeGhvRTZhSXNmTnd1VXM3c2llSGpuYlRMM0RIcjNz?=
 =?utf-8?B?RTZiaG9xLzcrM1hadXZNcW1EUEEvSkVHam41TFJaWm8rZmZBTTF5SFNPa2hO?=
 =?utf-8?B?OFFPSFZwOUlMUVl5U1VOQUpTWUVQWXNwUmVJUFRGdkJsWFBMQjAxai9TWjZh?=
 =?utf-8?B?a1lRc29kRUhtcThGWWxNYytIbHNWTFlySjUyS3Zqc0hEWUhPTno5Qm5zYlBM?=
 =?utf-8?B?dVVwYitCNjZENFRoNU1DYjlKbDQzRHFOVjM3Z1ZPaVpCdE8yTWNiUnlubm1B?=
 =?utf-8?B?aUZ3bUNvaWFlMy9VKyt5YU54RzBtRkwzcUZPVnFxeHZuZWlSczVRY2N2d1M4?=
 =?utf-8?B?VzFhc3E5TkhIcXRQTkpySTB3cmpCNHQ0TXFRcFNLNFEyYVVET2J6T0hGV0FN?=
 =?utf-8?B?b3hJTnRKN1hScGMveWFLWGdJbHdWMTNPOXNMaWE4WFczaVF5SVp5QXVUamRN?=
 =?utf-8?B?SkRxbmxWSzhMU1VIM3pRSEZqYk9sNmY1cUk1Q1ByNDhTQkRMSS96QjZxeHdS?=
 =?utf-8?B?b2YzOVZaN2ovSExxT01LTlB4bVZsU0FIeHJIY1A2WXo0QUVoN0dEN3NVRlZF?=
 =?utf-8?B?dE13KzFORzdndEtCK1MvblVCWDQvV3FHZGEraDRHYkJESzBmQ0htUlZPdWQ5?=
 =?utf-8?B?dFo3UXQ2dkZUbzd1bkpzdm5Rd21INGNKdW55WWFTWDdRRE5hSytPakg0dGVK?=
 =?utf-8?B?STYxTkJ0UDJ4bmV1c2diZWRuaWREczlxOE5QTTkxczdJb2FXZlVlUk5yZElo?=
 =?utf-8?B?b2tWd1VIMkdmZmdsaVFrTWVSRFR0RzNvY1pCaVg4RWJWMXI1Vy9xaUVQdHVr?=
 =?utf-8?B?Wk82NXlwWVY2TTBBWlg1TWxmd21KMWNhNk83STI1MnFuSDVnV2UvVVRCMjBs?=
 =?utf-8?B?dEUzYTJzem1RUUZUcDFkQlpFampPckNZU21ZRG80ci96N1ZMRXBuRE9wQmxV?=
 =?utf-8?B?dTFpdm1ZSU1XanBzKzJaZkNNYVVtck5ibkpxcFpzSkROdVl0Qkl6ZlNnVnYy?=
 =?utf-8?B?T1dORUd2dUxpTVh3blJaVWJreUlzTU82RVVUbmluZjdwMDNzNHE1SzFxVzBW?=
 =?utf-8?B?eGpBUGhhZ3RlMi9yd1dPdkxRcEVlSG1GTjNQOFJnYXBxTFpTb1lKb0xXbUsw?=
 =?utf-8?B?UE40WDdqMERoMFZ6T050Yjd6a0xRbWdteTFDOVhsbEN4WEs4UG9sSnMzVDFt?=
 =?utf-8?B?VWZYQjBBVUx5OEh3QWJFTGhxWko4bVZnd2dBV1lVSG9WZnBYOFQ5M09hNHRL?=
 =?utf-8?B?TzMxM0N3T3dBWk45S0VXMjBSTHpVd2Q4VytMS3I3NnZ2M2hjamFoWmZFellC?=
 =?utf-8?B?bit4bXRtcDRkZUhucytqUTc0Y1JWeXRVa3VHN0hjeTN0ZlM2M1RjbUZBZEFi?=
 =?utf-8?B?YUNyY05IN1dBTFl5TUpUdGEwVHRLcGJieTN3QWdwZlZJQ0NQUkFzNjZoNEVy?=
 =?utf-8?B?cXlyRnVVaDdaZHJIcGRCWnpEdno1czhPVlFELzRXT21nOEN0YWJnTjhjZE5N?=
 =?utf-8?B?QW5VQ1NuSy9FYyt5c1lIbVpQS2JlamdQcDlaR3B2d1lpUHpuS0hTVmc2RFYr?=
 =?utf-8?B?djZqOVJvdHJ6NDU1ckNKMkJVNFVkS0tMUWJBaE9GT2poNFNwdEFmREE5UkVL?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4618ab58-427c-4ee4-c3b0-08dcbea87209
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2024 10:36:25.9705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cf3/nYqW788Wxo8x3ucqzGWPtX/29HbPVQrMljdYlOm19dDo1rhWM9Qm2yp06O7ewmAApIFfKq61qqbz/Gwh6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6679
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
v10: Redo the lost v5 change. (Brost)
v11: Simplify the invalidate_on_remove (Lucas)

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c       | 107 ++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_ggtt_types.h |   6 ++
 2 files changed, 73 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 8ea223301ab9..d35c68658acc 100644
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
@@ -276,6 +279,68 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 	mutex_unlock(&ggtt->lock);
 }
 
+static void ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
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
+	if (node->invalidate_on_remove)
+		xe_ggtt_invalidate(ggtt);
+
+	drm_dev_exit(idx);
+
+free_node:
+	xe_ggtt_node_fini(node);
+}
+
+static void ggtt_node_remove_work_func(struct work_struct *work)
+{
+	struct xe_ggtt_node *node = container_of(work, typeof(*node),
+						 delayed_removal_work);
+	struct xe_device *xe = tile_to_xe(node->ggtt->tile);
+
+	xe_pm_runtime_get(xe);
+	ggtt_node_remove(node->ggtt, node);
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
+	node->invalidate_on_remove = invalidate;
+
+	if (xe_pm_runtime_get_if_active(xe)) {
+		ggtt_node_remove(ggtt, node);
+		xe_pm_runtime_put(xe);
+	} else {
+		queue_work(ggtt->wq, &node->delayed_removal_work);
+	}
+}
+
 /**
  * xe_ggtt_init - Regular non-early GGTT initialization
  * @ggtt: the &xe_ggtt to be initialized
@@ -480,7 +545,9 @@ struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
 	if (!node)
 		return ERR_PTR(-ENOMEM);
 
+	INIT_WORK(&node->delayed_removal_work, ggtt_node_remove_work_func);
 	node->ggtt = ggtt;
+
 	return node;
 }
 
@@ -497,46 +564,6 @@ void xe_ggtt_node_fini(struct xe_ggtt_node *node)
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
-	xe_ggtt_node_fini(node);
-}
-
 /**
  * xe_ggtt_node_allocated - Check if node is allocated in GGTT
  * @node: the &xe_ggtt_node to be inspected
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index 0e8822ae13fc..cb02b7994a9a 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -47,6 +47,8 @@ struct xe_ggtt {
 	struct drm_mm mm;
 	/** @access_count: counts GGTT writes */
 	unsigned int access_count;
+	/** @wq: Dedicated unordered work queue to process node removals */
+	struct workqueue_struct *wq;
 };
 
 /**
@@ -61,6 +63,10 @@ struct xe_ggtt_node {
 	struct xe_ggtt *ggtt;
 	/** @base: A drm_mm_node */
 	struct drm_mm_node base;
+	/** @delayed_removal_work: The work struct for the delayed removal */
+	struct work_struct delayed_removal_work;
+	/** @invalidate_on_remove: If it needs invalidation upon removal */
+	bool invalidate_on_remove;
 };
 
 /**
-- 
2.46.0


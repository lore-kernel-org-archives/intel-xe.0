Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFFEC3DA63
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 15:16:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DEC510E0EE;
	Thu, 18 Jul 2024 15:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RYVeKB10";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BDD610E0EE
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 15:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721315758; x=1752851758;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=c5Zf24QJBI+QwcBhCBoAiycysvAxae6wBY65w12nvg4=;
 b=RYVeKB10OCUzu0uEQrrXAOPpdbSfJl6BKtQuqLe1fegVValiElgw45vr
 3wG4adTnBAvj1AhX5p6Y6RbFEi6T567V5NwoPPR0fw46BqIMjYXwaFAE4
 EHuJRrQgxIh5l+gUouLgkCeRbsvZSQ6CL9OYh38lrkauWYnCwHxhcb8S2
 DeulvzWW325NeKfZW5/odzI9HDUuNEq4gEmyh590TvZ8ugpVLKYeOgekG
 LhPdqnjaXzXxBiPe2UMe77edGTfW2Um8dkqfAygXnSAs0cdiKS0OMy6N7
 DTIvtocCfm/KubMa4aCYnHcYS1j4iVBwK6cx6Ta9FCj35SzljDEx7f3Ax g==;
X-CSE-ConnectionGUID: VZ3y5PrVREuCI40f8Wsm9A==
X-CSE-MsgGUID: uwfJemuERE61LNnCdmxkEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="30045519"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208,217";a="30045519"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 08:15:58 -0700
X-CSE-ConnectionGUID: WnQyj9swS3uOktKAokTMNw==
X-CSE-MsgGUID: c1esJ10nTHqxdA51HbOwew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208,217";a="50746786"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jul 2024 08:15:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 08:15:56 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 08:15:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 18 Jul 2024 08:15:56 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 08:15:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rW7XPljYJ0P5jdUhUNp5Gy1LnE7XSxP1WeLtqEmpcG7HhFk/6X5SGOQfVuZY8B48yMPum/H4xWtK52PXGYhQJaOk0pYHHJxqyjxj8tyuz3jHYAmM/9abQsHJScMv+NseanGcjczX+P6ESNlKMT+g9yxBTeP1NPhXqqF/ApXu29qr18+NR6MTpwScOEgVTWNrmWtxhuX8Yxcwk5TC84Dgnfv60eQksz9fMcpr9F/M18arskkeWmz8SrkdI4o4Ex8QHZymDyfEwhag+9T1VNZuejrVIYKqMuOO+FRFOWjBCXJuwlTV0e9t4DkulKeHYW0/fi8EJicNdIVgfKHdZuejaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQrliERatXLbMnv7XfSMakGfftZL3dK07HgxdQmvSvU=;
 b=DYPVKnN7RbHffgvdZ4PbVAhk4z67m9VJTUheGmM272f4pJAgYNrKr/F8RLRJrHqmb0XDTYapg4YyaWUjKcseAH+lwRbjALrUDqyeb5tK1gIjeL0HnTgM666pOCcymuH36Wz0Q35YojuOXGzQjuzZm48+TpwNC/hJLk5I+IACUvOzgIFOv/jCzIhrqnC3DxBlYlfo/o7t68Vy8eSNa6vuZEpTkoCEjRDeZ/P//I+hAR0HNy7xIAXNrwKk5SYL0ACSIbRK/uCyOZ/t+eE8TyNvfD7Uy/lz1wtBzUFmeKWv+lB+2BXWXci9hP8QUT7S3aXRWiIsZgj58bH491k9GEkXCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 18 Jul
 2024 15:15:48 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.7784.013; Thu, 18 Jul 2024
 15:15:48 +0000
Content-Type: multipart/alternative;
 boundary="------------RZhdImyIB5exezqub9M0mt5k"
Message-ID: <6715a3a7-811f-420a-a9df-2c08f17d42e1@intel.com>
Date: Thu, 18 Jul 2024 08:15:46 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EBAT=3A_failure_for_Reapply_=22drm/xe?=
 =?UTF-8?Q?/gsc=3A_define_GSC_FW_for_LNL=22_=28rev3=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20240702001155.2163743-1-daniele.ceraolospurio@intel.com>
 <172131396218.286320.18063038232202344133@2413ebb6fbb6>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <172131396218.286320.18063038232202344133@2413ebb6fbb6>
X-ClientProxiedBy: BY5PR16CA0006.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::19) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CO1PR11MB5057:EE_
X-MS-Office365-Filtering-Correlation-Id: 94a103c4-2a00-4e51-f12f-08dca73c80b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUt2NGlIdFZmWmx0Q2JDa3ZqNTQ5QVUvNDdHL0pVczZmNmhjRG4xODlmc0tl?=
 =?utf-8?B?WTVTUTgrUnd3cFM0OG1vV1VsRGtoa2kzck1pQTVYQi9wMmpWYzZoY0ltQU9y?=
 =?utf-8?B?ZE9hS3M0LzRRUngvUFVaWUZKdmsrR3Ewb0VYWTVzS0RRVlpxVEhqS21EYWpm?=
 =?utf-8?B?eElzYU9tTVIrQlMrYlg5V0NyZGRMYnJXT1JBR2dsKzg5SmpPbjJnODVraXRR?=
 =?utf-8?B?a0NxRFZRckk3UG5SY2VOTDdwanJpTlc5U2MxOTlDMFpoYkZiUk5RRTlyRm5T?=
 =?utf-8?B?UjIrVDZFQXNsNVBCMVpsTDR0Y0hGMldydk5oWkRZdCtTSWkvVXpQS3hUTWJs?=
 =?utf-8?B?UVpvTFlaY1UwcytKY1o1NmNpRGRJYk41c2I1LzVKYURKNWdrMWtrR0Fla0Y1?=
 =?utf-8?B?NDFZRFFGbTNINC9WUXQ5Vzl1MVJFL0Q1UFAxRUxLTDVKL3VUc2hjQk1zdmxS?=
 =?utf-8?B?UVZGTzdaeU5pWGd0Nlo5aTV2eVRNNlA1RzJNSWdBaGNGSWppeEorcjROMTJq?=
 =?utf-8?B?ZDAwZk5tb0xRNmpuSHg0bFRBR1NaTnNkeXNxV3FUNlZ3eDNKTkpVSUV3NVJS?=
 =?utf-8?B?KzNUblk4OG5vQ2ZGdDQ2QmxJbndTUGZ3UWpEamx2SkFOdFdhVE5sbWhvK3gz?=
 =?utf-8?B?eFlOK3JpSCtDaGsxcUk2akU4d1dtVzB1d3lGQnY5bXVUUWxBWjJyMUhtMFMr?=
 =?utf-8?B?NTVCYTM3RC8xREQzU2c0SWJad2dEOXliV2RJekNKeGVPK0Rwc3RMOGhYWUtO?=
 =?utf-8?B?REdTMlZJNTdzRmhvUW1ZZC9MdmZiM1VRSTNDNVdSVkRMTjFWWGJwdzZ2TWdQ?=
 =?utf-8?B?aCtYQVlheHpZdzJWU0ZhNUNVTG1KSllTdUR0YVNJcnJSU0NKeUgvR2JhQmxT?=
 =?utf-8?B?Y0J3cTU2NzhVVDBTcjVDQVJzb1lSeFRuM2NLcFNVaTRMb1dqaFNuN2VGR1lN?=
 =?utf-8?B?aUpmeFZiMER5a2RqWVo0RTNvR01GcytqOHJSRkQ1V2d3VTFySEo4b0NXWmxk?=
 =?utf-8?B?SjM3Ty94VmVsUS96eWFjbDNKNVUvL1pTaDFCZ2hhbVM2bkNYdC85SFN6d1p6?=
 =?utf-8?B?SitmTXhmUi9XVFZEODRJVkszVElvNlhUdUZsZ01nWE5uZ0dhdmE3d205Q2NY?=
 =?utf-8?B?SHN6UStUcWlNTEJ5aDFmeEhBU0I3ajNyU0ZrdUJXb1VJeDc3ZVUvY1hONFlT?=
 =?utf-8?B?NjlRS045OTUzWFBzZ2pZK0o0NkttYXhtT2c1eXBUbHJqMDl2WGN1elVnRkVx?=
 =?utf-8?B?eWJjM2R5ZnhhOW9LeFBJQ1JyN0RHVzM4Qk4zRWpHL0hIK045emJlVEJkVHlQ?=
 =?utf-8?B?QVBPcytyRTkwOWNBSk1iRGF0SzNyY0Iwc2dzaXBtcUk5aHdaM2FteXNZdkNF?=
 =?utf-8?B?Y2VXYkZjNldxa3pzSGVqaFpaUEFSemtwUG11R0Y1OGZBRlFjK3FBbEZpY3Fh?=
 =?utf-8?B?K2VNUTNiZStBZ0RwdW9EZEY3aXFQSlpVVHJoWTVCa1pkdEpvNWY0NVF3QTRT?=
 =?utf-8?B?MVprQlZudlh1eGRtSWxWUDlONlhDZDJIMTFiNURRYnEvUmZDZWNaMU41Y1hM?=
 =?utf-8?B?cTRxQVBoZEFzcFRTUnE4VlBmTU5obnpzQ0xISVRMZ3Fhb09pa3pabHFZNWxF?=
 =?utf-8?B?WVJBb2lhbU9TWW5xUW5HdUQwajZ5UlJvaEhxTUVCU1lRZjJKN2lGMjFxVVVk?=
 =?utf-8?B?SGZEd2dVMEFKNnFhYTBMOW43UENLSVlBVE43ekhMTTNHbnpoSkptQ1V4dU5L?=
 =?utf-8?Q?uoimXo/4qSmCZv3ST8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVEzT3NtTzZxNEFGcFE3WEZKY1B1K2Vxc00xR0NHNVFwRFFUSFpTZ0Uxa0FK?=
 =?utf-8?B?cDZzdGNjalJGcHV1enNWUUJLNmVoOUNZSXpNczhxSWJTbGNiMVExdXVweHB4?=
 =?utf-8?B?NUtBVzF6NFlqbEN0aXpPVWtYVGYzQTQza3R2aCtmOWV2QS92RElJNzZuUnpC?=
 =?utf-8?B?Y0gwYTNZL3c0VkxVei9vS2Rxc1JHWGptVlBIU3g4ZUJaRnFVc0JObGZOUkRY?=
 =?utf-8?B?R3Y3WnY0UUk1cXEwelRSM2dtL2IzQjhIQlpZQkVkYXVIdTJEMlpZbGdQNW5i?=
 =?utf-8?B?UUpSVDh1SzdaYXM0Q1ZtWlQwdE51YWRsckpyaS9tSlpnQUZzNTZETkVTY1lm?=
 =?utf-8?B?SUZMc0JITHI1cFUzZ2xzTVA4b2FFb0l4N2wxUzlvVGk0QjJNWlAxZGpqSTB6?=
 =?utf-8?B?MEVnV3dvazFnT05UYnAyWXR2THo0WEIyQzJDYmpjOXZpd3ErdmlsUURhYmRB?=
 =?utf-8?B?MUhRLzZKcWJqUmd1c1lDTGg5TEIxVG13eVR1b0ZLWHZwbURvV1hWeTBweUpI?=
 =?utf-8?B?RjFHSUlCd0Y3QXhDemptR01QTmJnMjlha0NjdTkrdzRuVjFCZnZESjVNejE1?=
 =?utf-8?B?ZGJSclJreGZLR29IZ2FkeDNDU0RBd1NsNDYvQW1hMWxURkN4Qm5qUHBFcmlR?=
 =?utf-8?B?TDhndFVpbjlMM3I4ODVQK2VpeElRN1RKVVFqOENFSDhsWDRTTE1SaTgrc3dp?=
 =?utf-8?B?VnJBRnIvS0p0YXZmdmtMYkVKWGdBeHN5RzBCbllvaXVMUWV0VE5WOW0vb255?=
 =?utf-8?B?VVRvOE5Wa0cvVjJMSTZVT0cwV2k4M0dNa2NuN2hqZ1F2Z2F4UjEzaEN5dURZ?=
 =?utf-8?B?Y2R6blh1L0dKaFBDR25tU0FoOFg2MEh5WjRxOC9vamFFSUtKZyt3YXVqZEFJ?=
 =?utf-8?B?dXBYeUNXb1gzU2xrZk9UdkFNdnN0eko4R1B3cHVybjJrNGZDSDg1cklEREVH?=
 =?utf-8?B?L1JHOTNNVzNXWUdLaFhNQ2h0bFl5RGVGNzcxcG5QYmF6d1JjcERPVmlFT0Iy?=
 =?utf-8?B?a3JYV2l2L2ZDNnFrSnJMeHdqK1Y4cFg5SmEySWlWd2owNGdieEVXRHVuSk15?=
 =?utf-8?B?dDVuazRMTFdvOHBrS2RJb25vK1JtS3JDck1BMm9uNEFtVHFjMXVQc2xaZDYv?=
 =?utf-8?B?ZURLS052ODZxdkgzTDRsa0NXazB6RlRIdnlCUWxPd2t6N29PbEhVNEY4RWRq?=
 =?utf-8?B?c3hCYmZsMWZYTklZRFBmQ2Y5VzIzMnRlTXVMSU43L0xVMExpTDZDeWNQSG5B?=
 =?utf-8?B?end0UW01aDBDT29YdHZCTmNVTFhGUzhYcWd2bC9WVzJnWFZucmh5M20vWVZt?=
 =?utf-8?B?eXRxemdJL21jYVF4L3ZuK282Wkh1UE1jVWtKVXRCTDAxeWFKYmljWnhQZGZU?=
 =?utf-8?B?WnYzSUVIU256QnNhNUlwT0dwZ3l3dTlrdzJmY1IwZEk4cXQ3MGY0aVNQbFI2?=
 =?utf-8?B?MDhNQWczR2ttOEQwSzVIWllDdFB5cVJVRGZEYlFSdHVRL3VSU0l5TVNzRXg4?=
 =?utf-8?B?NHI4clhlWjZ5YmNEOVpGUmFVSXg4MXo0WEpIdWpEajgwTUdjODEwTFlxRHZV?=
 =?utf-8?B?NHFYRmh2M0NUSGdSakFqM3lsL2d2RHJhdFdySnQySDdMRHR6ZUNCaDRNWktP?=
 =?utf-8?B?dG9yUVh5V1R6aEh4UWVadWVGeTN3ajhFU0psTmNjeERMR3VMOUlOUThsU1dO?=
 =?utf-8?B?dU83cWFuS1ZlVkZPYVR5THpGd013c3plQW5mTy9Hd0tYSWpLME5KUUlGald6?=
 =?utf-8?B?eEtzT0liRVEwczNMMTBGdFQra0VWZzRuKzFBYm94V00vajMvZjgxN0ZEaWVK?=
 =?utf-8?B?MGdVdGRYd01rbTdLMVZEa1YrT2Zhdy9NaDBwVDNFSjBUaDhkTFNFTDh0N2JU?=
 =?utf-8?B?NTc5Z2Y4YkgwdWViODg0OWdiMUtWYllpWk5CTFJGeTdqYXhGeVg4V0k1SGlk?=
 =?utf-8?B?ZkhtY1JxMTF2RkhMZ1FvdGR6YXgvNmlZOG1QeUhxU0FpNlhSOVVFTU1QdlNK?=
 =?utf-8?B?WWpJc3o0NHRLakJuR09oR1NNSWhvTWRvamQ0NHI1cHVzdW1SWldIeGxEbjlD?=
 =?utf-8?B?Y01Mb2xPbVdhNms3VW5jYlVDeDBQVGpxY3ovbFlRbjJIa3BoMGpOT013clFa?=
 =?utf-8?B?OVVZa1J3R21OTmdxT2Fvc2hKOFJDQmdJYmV6RmozZFg5dVAvL2FmanJYN3VV?=
 =?utf-8?B?RkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94a103c4-2a00-4e51-f12f-08dca73c80b9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 15:15:48.0754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2L2lw8W27vv1S5l5s7H49V5aPfZRir4OK3FbCilksaJx89RrX0WDQMvrjbJCSZzKdtqr2SCKNuuCXF3WhVjX0cdM/laIQ1Dy5qiXlaVajEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5057
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

--------------RZhdImyIB5exezqub9M0mt5k
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 7/18/2024 7:46 AM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	Reapply "drm/xe/gsc: define GSC FW for LNL" (rev3)
> *URL:* 	https://patchwork.freedesktop.org/series/135623/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/index.html
>
>
>   CI Bug Log - changes from
>   xe-1624-d0e3ac45f03af2770c2027a1e9799617e1186e5c_BAT ->
>   xe-pw-135623v3_BAT
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-135623v3_BAT absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-135623v3_BAT, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (0 -> 7)
>
> Additional (7): bat-bmg-1 bat-lnl-2 bat-pvc-2 bat-lnl-1 bat-dg2-oem2 
> bat-adlp-7 bat-atsm-2
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-135623v3_BAT:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_pipe_crc_basic@nonblocking-crc:
>
>       o bat-lnl-1: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html>
>         +10 other tests dmesg-warn
>  *
>
>     igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:
>
>       o bat-lnl-1: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html>
>         +1 other test dmesg-fail
>

Looks like the boards have been updated to require a newer GSC FW (which 
was an expected update to move to the production release). Will update 
the FW in the repo and re-trigger CI.

Daniele

>  *
>
>
>         Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>  *
>
>     igt@core_hotunplug@unbind-rebind:
>
>       o {bat-lnl-2}: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html>
>  *
>
>     igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
>
>       o {bat-lnl-2}: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html>
>
>
>     Known issues
>
> Here are the changes found in xe-pw-135623v3_BAT that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_addfb_basic@addfb25-x-tiled-legacy:
>
>       o bat-pvc-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html>
>         (i915#6077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077>)
>         +30 other tests skip
>  *
>
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>
>       o bat-lnl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html>
>         (Intel XE#1466
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466>)
>       o bat-dg2-oem2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html>
>         (Intel XE#623
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/623>)
>  *
>
>     igt@kms_addfb_basic@invalid-set-prop-any:
>
>       o bat-atsm-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html>
>         (i915#6077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077>)
>         +30 other tests skip
>  *
>
>     igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
>
>       o bat-pvc-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html>
>         (Intel XE#1024
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024> /
>         Intel XE#782
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/782>) +5
>         other tests skip
>       o bat-atsm-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html>
>         (Intel XE#1024
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024> /
>         Intel XE#782
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/782>) +5
>         other tests skip
>  *
>
>     igt@kms_dsc@dsc-basic:
>
>       o bat-pvc-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@kms_dsc@dsc-basic.html>
>         (Intel XE#1024
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024> /
>         Intel XE#784
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/784>)
>       o bat-dg2-oem2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>       o bat-atsm-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-atsm-2/igt@kms_dsc@dsc-basic.html>
>         (Intel XE#1024
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024> /
>         Intel XE#784
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/784>)
>       o bat-lnl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-1/igt@kms_dsc@dsc-basic.html>
>         (Intel XE#599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>)
>       o bat-adlp-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-adlp-7/igt@kms_dsc@dsc-basic.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>  *
>
>     igt@kms_flip@basic-flip-vs-modeset:
>
>       o bat-atsm-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html>
>         (Intel XE#1024
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024> /
>         Intel XE#947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/947>) +3
>         other tests skip
>  *
>
>     igt@kms_flip@basic-flip-vs-wf_vblank:
>
>       o bat-pvc-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@kms_flip@basic-flip-vs-wf_vblank.html>
>         (Intel XE#1024
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024> /
>         Intel XE#947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/947>) +3
>         other tests skip
>  *
>
>     igt@kms_force_connector_basic@force-connector-state:
>
>       o bat-lnl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-1/igt@kms_force_connector_basic@force-connector-state.html>
>         (Intel XE#352
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/352>) +2
>         other tests skip
>       o bat-pvc-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html>
>         (Intel XE#540
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/540>) +3
>         other tests skip
>       o bat-atsm-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html>
>         (Intel XE#540
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/540>) +3
>         other tests skip
>  *
>
>     igt@kms_force_connector_basic@prune-stale-modes:
>
>       o bat-dg2-oem2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html>
>         (i915#5274
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274>)
>  *
>
>     igt@kms_frontbuffer_tracking@basic:
>
>       o bat-adlp-7: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>       o bat-pvc-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html>
>         (Intel XE#1024
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024> /
>         Intel XE#783
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/783>)
>       o bat-atsm-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html>
>         (Intel XE#1024
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024> /
>         Intel XE#783
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/783>)
>  *
>
>     igt@kms_hdmi_inject@inject-audio:
>
>       o bat-lnl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html>
>         (Intel XE#1470
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470>)
>  *
>
>     igt@kms_pipe_crc_basic@nonblocking-crc:
>
>       o bat-pvc-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc.html>
>         (Intel XE#829
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/829>) +6
>         other tests skip
>       o bat-atsm-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html>
>         (i915#1836
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836>)
>         +6 other tests skip
>  *
>
>     igt@kms_prop_blob@basic:
>
>       o bat-pvc-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@kms_prop_blob@basic.html>
>         (Intel XE#780
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/780>)
>       o bat-atsm-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-atsm-2/igt@kms_prop_blob@basic.html>
>         (Intel XE#780
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/780>)
>  *
>
>     igt@kms_psr@psr-cursor-plane-move:
>
>       o bat-pvc-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@kms_psr@psr-cursor-plane-move.html>
>         (Intel XE#1024
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024>) +2
>         other tests skip
>       o bat-dg2-oem2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html>
>         (Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +2
>         other tests skip
>  *
>
>     igt@kms_psr@psr-primary-page-flip:
>
>       o bat-atsm-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html>
>         (Intel XE#1024
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024>) +2
>         other tests skip
>  *
>
>     igt@sriov_basic@enable-vfs-autoprobe-off:
>
>       o bat-lnl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html>
>         (Intel XE#1091
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091>) +1
>         other test skip
>       o bat-pvc-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@sriov_basic@enable-vfs-autoprobe-off.html>
>         (Intel XE#1932
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932>) +1
>         other test skip
>       o bat-dg2-oem2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html>
>         (Intel XE#1091
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091>) +1
>         other test skip
>  *
>
>     igt@xe_evict@evict-beng-small-external:
>
>       o bat-pvc-2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html>
>         (Intel XE#1000
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000>) +3
>         other tests fail
>  *
>
>     igt@xe_evict@evict-small-cm:
>
>       o bat-adlp-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-adlp-7/igt@xe_evict@evict-small-cm.html>
>         (Intel XE#261
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261> /
>         Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +15
>         other tests skip
>  *
>
>     igt@xe_evict@evict-small-external-cm:
>
>       o bat-pvc-2: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html>
>         (Intel XE#482
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/482>) +3
>         other tests dmesg-fail
>  *
>
>     igt@xe_evict@evict-threads-small:
>
>       o bat-lnl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-1/igt@xe_evict@evict-threads-small.html>
>         (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +17
>         other tests skip
>  *
>
>     igt@xe_evict_ccs@evict-overcommit-simple:
>
>       o bat-adlp-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html>
>         (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +1
>         other test skip
>  *
>
>     igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
>
>       o bat-dg2-oem2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +32
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
>
>       o bat-atsm-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +32
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
>
>       o bat-adlp-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +32
>         other tests skip
>  *
>
>     igt@xe_gt_freq@freq_range_idle:
>
>       o bat-lnl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-1/igt@xe_gt_freq@freq_range_idle.html>
>         (Intel XE#1462
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462>) +1
>         other test skip
>       o bat-pvc-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@xe_gt_freq@freq_range_idle.html>
>         (Intel XE#1021
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1021>) +1
>         other test skip
>  *
>
>     igt@xe_huc_copy@huc_copy:
>
>       o bat-pvc-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@xe_huc_copy@huc_copy.html>
>         (Intel XE#255
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/255>)
>       o bat-dg2-oem2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html>
>         (Intel XE#255
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/255>)
>       o bat-atsm-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-atsm-2/igt@xe_huc_copy@huc_copy.html>
>         (Intel XE#255
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/255>)
>  *
>
>     igt@xe_intel_bb@render:
>
>       o bat-pvc-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@xe_intel_bb@render.html>
>         (Intel XE#532
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/532>)
>  *
>
>     igt@xe_live_ktest@xe_migrate:
>
>       o bat-lnl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html>
>         (Intel XE#1192
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192>) +2
>         other tests skip
>  *
>
>     igt@xe_mmap@vram:
>
>       o bat-lnl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-1/igt@xe_mmap@vram.html>
>         (Intel XE#1416
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416>)
>       o bat-adlp-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-adlp-7/igt@xe_mmap@vram.html>
>         (Intel XE#1008
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008>)
>  *
>
>     igt@xe_pat@pat-index-xe2:
>
>       o bat-pvc-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@xe_pat@pat-index-xe2.html>
>         (Intel XE#977
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/977>) +1
>         other test skip
>       o bat-atsm-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-atsm-2/igt@xe_pat@pat-index-xe2.html>
>         (Intel XE#977
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/977>)
>       o bat-adlp-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-adlp-7/igt@xe_pat@pat-index-xe2.html>
>         (Intel XE#977
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/977>)
>       o bat-dg2-oem2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html>
>         (Intel XE#977
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/977>)
>  *
>
>     igt@xe_pat@pat-index-xehpc:
>
>       o bat-lnl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html>
>         (Intel XE#1420
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420>)
>       o bat-dg2-oem2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html>
>         (Intel XE#979
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>) +1
>         other test skip
>       o bat-atsm-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html>
>         (Intel XE#979
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>) +1
>         other test skip
>       o bat-adlp-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html>
>         (Intel XE#979
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>) +1
>         other test skip
>  *
>
>     igt@xe_pat@pat-index-xehpc@render:
>
>       o bat-pvc-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html>
>         (Intel XE#976
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/976>)
>  *
>
>     igt@xe_pat@pat-index-xelp:
>
>       o bat-lnl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-1/igt@xe_pat@pat-index-xelp.html>
>         (Intel XE#977
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/977>)
>  *
>
>     igt@xe_pat@pat-index-xelpg:
>
>       o bat-lnl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html>
>         (Intel XE#979
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>)
>       o bat-pvc-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html>
>         (Intel XE#979
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>)
>  *
>
>     igt@xe_pm_residency@gt-c6-on-idle:
>
>       o bat-lnl-1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-1/igt@xe_pm_residency@gt-c6-on-idle.html>
>         (Intel XE#1442
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1442>)
>       o bat-pvc-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html>
>         (Intel XE#531
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/531>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * Linux: xe-1624-d0e3ac45f03af2770c2027a1e9799617e1186e5c ->
>     xe-pw-135623v3
>
> IGT_7930: 7930
> xe-1624-d0e3ac45f03af2770c2027a1e9799617e1186e5c: 
> d0e3ac45f03af2770c2027a1e9799617e1186e5c
> xe-pw-135623v3: 135623v3
>

--------------RZhdImyIB5exezqub9M0mt5k
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 7/18/2024 7:46 AM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:172131396218.286320.18063038232202344133@2413ebb6fbb6">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>Reapply &quot;drm/xe/gsc: define GSC FW for LNL&quot; (rev3)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/135623/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/135623/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-1624-d0e3ac45f03af2770c2027a1e9799617e1186e5c_BAT -&gt;
        xe-pw-135623v3_BAT</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-135623v3_BAT
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-135623v3_BAT, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (0 -&gt; 7)</h2>
      <p>Additional (7): bat-bmg-1 bat-lnl-2 bat-pvc-2 bat-lnl-1
        bat-dg2-oem2 bat-adlp-7 bat-atsm-2 </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-135623v3_BAT:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html" moz-do-not-send="true">DMESG-WARN</a> +10 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html" moz-do-not-send="true">DMESG-FAIL</a> +1 other test
              dmesg-fail</li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <br>
    Looks like the boards have been updated to require a newer GSC FW
    (which was an expected update to move to the production release).
    Will update the FW in the repo and re-trigger CI.<br>
    <br>
    Daniele<br>
    <br>
    <blockquote type="cite" cite="mid:172131396218.286320.18063038232202344133@2413ebb6fbb6">
      <ul>
        <li>
          <ul>
          </ul>
        </li>
      </ul>
      <h4>Suppressed</h4>
      <p>The following results come from untrusted machines, tests, or
        statuses.<br>
        They do not affect the overall result.</p>
      <ul>
        <li>
          <p>igt@core_hotunplug@unbind-rebind:</p>
          <ul>
            <li>{bat-lnl-2}: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html" moz-do-not-send="true">ABORT</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:</p>
          <ul>
            <li>{bat-lnl-2}: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html" moz-do-not-send="true">DMESG-WARN</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-135623v3_BAT that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
          <ul>
            <li>bat-pvc-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077" moz-do-not-send="true">i915#6077</a>) +30 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466" moz-do-not-send="true">Intel XE#1466</a>)</li>
            <li>bat-dg2-oem2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623" moz-do-not-send="true">Intel XE#623</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@invalid-set-prop-any:</p>
          <ul>
            <li>bat-atsm-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077" moz-do-not-send="true">i915#6077</a>) +30 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
          <ul>
            <li>bat-pvc-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024" moz-do-not-send="true">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782" moz-do-not-send="true">Intel XE#782</a>) +5 other tests
              skip</li>
            <li>bat-atsm-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024" moz-do-not-send="true">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782" moz-do-not-send="true">Intel XE#782</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-basic:</p>
          <ul>
            <li>bat-pvc-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@kms_dsc@dsc-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024" moz-do-not-send="true">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784" moz-do-not-send="true">Intel XE#784</a>)</li>
            <li>bat-dg2-oem2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>)</li>
            <li>bat-atsm-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-atsm-2/igt@kms_dsc@dsc-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024" moz-do-not-send="true">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784" moz-do-not-send="true">Intel XE#784</a>)</li>
            <li>bat-lnl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-1/igt@kms_dsc@dsc-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599" moz-do-not-send="true">Intel XE#599</a>)</li>
            <li>bat-adlp-7: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-adlp-7/igt@kms_dsc@dsc-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@basic-flip-vs-modeset:</p>
          <ul>
            <li>bat-atsm-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024" moz-do-not-send="true">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947" moz-do-not-send="true">Intel XE#947</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
          <ul>
            <li>bat-pvc-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@kms_flip@basic-flip-vs-wf_vblank.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024" moz-do-not-send="true">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947" moz-do-not-send="true">Intel XE#947</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@force-connector-state:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-1/igt@kms_force_connector_basic@force-connector-state.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352" moz-do-not-send="true">Intel XE#352</a>) +2 other tests
              skip</li>
            <li>bat-pvc-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540" moz-do-not-send="true">Intel XE#540</a>) +3 other tests
              skip</li>
            <li>bat-atsm-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540" moz-do-not-send="true">Intel XE#540</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@prune-stale-modes:</p>
          <ul>
            <li>bat-dg2-oem2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274" moz-do-not-send="true">i915#5274</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@basic:</p>
          <ul>
            <li>bat-adlp-7: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send="true">Intel XE#324</a>)</li>
            <li>bat-pvc-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024" moz-do-not-send="true">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783" moz-do-not-send="true">Intel XE#783</a>)</li>
            <li>bat-atsm-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024" moz-do-not-send="true">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783" moz-do-not-send="true">Intel XE#783</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdmi_inject@inject-audio:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470" moz-do-not-send="true">Intel XE#1470</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
          <ul>
            <li>bat-pvc-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829" moz-do-not-send="true">Intel XE#829</a>) +6 other tests
              skip</li>
            <li>bat-atsm-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836" moz-do-not-send="true">i915#1836</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_prop_blob@basic:</p>
          <ul>
            <li>bat-pvc-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@kms_prop_blob@basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780" moz-do-not-send="true">Intel XE#780</a>)</li>
            <li>bat-atsm-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-atsm-2/igt@kms_prop_blob@basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780" moz-do-not-send="true">Intel XE#780</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-cursor-plane-move:</p>
          <ul>
            <li>bat-pvc-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@kms_psr@psr-cursor-plane-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024" moz-do-not-send="true">Intel XE#1024</a>) +2 other tests
              skip</li>
            <li>bat-dg2-oem2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send="true">Intel XE#929</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-primary-page-flip:</p>
          <ul>
            <li>bat-atsm-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024" moz-do-not-send="true">Intel XE#1024</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091" moz-do-not-send="true">Intel XE#1091</a>) +1 other test
              skip</li>
            <li>bat-pvc-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@sriov_basic@enable-vfs-autoprobe-off.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932" moz-do-not-send="true">Intel XE#1932</a>) +1 other test
              skip</li>
            <li>bat-dg2-oem2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091" moz-do-not-send="true">Intel XE#1091</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-small-external:</p>
          <ul>
            <li>bat-pvc-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000" moz-do-not-send="true">Intel XE#1000</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-small-cm:</p>
          <ul>
            <li>bat-adlp-7: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-adlp-7/igt@xe_evict@evict-small-cm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261" moz-do-not-send="true">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688" moz-do-not-send="true">Intel XE#688</a>) +15 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-small-external-cm:</p>
          <ul>
            <li>bat-pvc-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482" moz-do-not-send="true">Intel XE#482</a>) +3 other tests
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-threads-small:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-1/igt@xe_evict@evict-threads-small.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688" moz-do-not-send="true">Intel XE#688</a>) +17 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
          <ul>
            <li>bat-adlp-7: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688" moz-do-not-send="true">Intel XE#688</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:</p>
          <ul>
            <li>bat-dg2-oem2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send="true">Intel XE#288</a>) +32 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
          <ul>
            <li>bat-atsm-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send="true">Intel XE#288</a>) +32 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
          <ul>
            <li>bat-adlp-7: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send="true">Intel XE#288</a>) +32 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_gt_freq@freq_range_idle:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-1/igt@xe_gt_freq@freq_range_idle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462" moz-do-not-send="true">Intel XE#1462</a>) +1 other test
              skip</li>
            <li>bat-pvc-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@xe_gt_freq@freq_range_idle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1021" moz-do-not-send="true">Intel XE#1021</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_huc_copy@huc_copy:</p>
          <ul>
            <li>bat-pvc-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@xe_huc_copy@huc_copy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255" moz-do-not-send="true">Intel XE#255</a>)</li>
            <li>bat-dg2-oem2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255" moz-do-not-send="true">Intel XE#255</a>)</li>
            <li>bat-atsm-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-atsm-2/igt@xe_huc_copy@huc_copy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255" moz-do-not-send="true">Intel XE#255</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_intel_bb@render:</p>
          <ul>
            <li>bat-pvc-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@xe_intel_bb@render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/532" moz-do-not-send="true">Intel XE#532</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_migrate:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192" moz-do-not-send="true">Intel XE#1192</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_mmap@vram:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-1/igt@xe_mmap@vram.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416" moz-do-not-send="true">Intel XE#1416</a>)</li>
            <li>bat-adlp-7: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-adlp-7/igt@xe_mmap@vram.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008" moz-do-not-send="true">Intel XE#1008</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xe2:</p>
          <ul>
            <li>bat-pvc-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@xe_pat@pat-index-xe2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977" moz-do-not-send="true">Intel XE#977</a>) +1 other test
              skip</li>
            <li>bat-atsm-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-atsm-2/igt@xe_pat@pat-index-xe2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977" moz-do-not-send="true">Intel XE#977</a>)</li>
            <li>bat-adlp-7: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-adlp-7/igt@xe_pat@pat-index-xe2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977" moz-do-not-send="true">Intel XE#977</a>)</li>
            <li>bat-dg2-oem2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977" moz-do-not-send="true">Intel XE#977</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xehpc:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420" moz-do-not-send="true">Intel XE#1420</a>)</li>
            <li>bat-dg2-oem2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979" moz-do-not-send="true">Intel XE#979</a>) +1 other test
              skip</li>
            <li>bat-atsm-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979" moz-do-not-send="true">Intel XE#979</a>) +1 other test
              skip</li>
            <li>bat-adlp-7: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979" moz-do-not-send="true">Intel XE#979</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xehpc@render:</p>
          <ul>
            <li>bat-pvc-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/976" moz-do-not-send="true">Intel XE#976</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xelp:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-1/igt@xe_pat@pat-index-xelp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977" moz-do-not-send="true">Intel XE#977</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xelpg:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979" moz-do-not-send="true">Intel XE#979</a>)</li>
            <li>bat-pvc-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979" moz-do-not-send="true">Intel XE#979</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@gt-c6-on-idle:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-lnl-1/igt@xe_pm_residency@gt-c6-on-idle.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1442" moz-do-not-send="true">Intel XE#1442</a>)</li>
            <li>bat-pvc-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135623v3/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/531" moz-do-not-send="true">Intel XE#531</a>)</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>Linux: xe-1624-d0e3ac45f03af2770c2027a1e9799617e1186e5c
          -&gt; xe-pw-135623v3</li>
      </ul>
      <p>IGT_7930: 7930<br>
        xe-1624-d0e3ac45f03af2770c2027a1e9799617e1186e5c:
        d0e3ac45f03af2770c2027a1e9799617e1186e5c<br>
        xe-pw-135623v3: 135623v3</p>
    </blockquote>
    <br>
  </body>
</html>

--------------RZhdImyIB5exezqub9M0mt5k--

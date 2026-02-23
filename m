Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E83BEEC2AE
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 23:50:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E520A10E464;
	Mon, 23 Feb 2026 23:50:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dtT6aMwc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF9310E464
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 23:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771890657; x=1803426657;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AfkLaYcLfijetuLMwkwMV4o3+biGSWMRctn5DACXIs4=;
 b=dtT6aMwc89fSbHD769uJMpsHmOgqecEcryMHc+MqH0sr61RFehQgV7MP
 zKH2aY+T8dBkEzLq6S3+fdpsidsSZaik6m9geqiOCNrWCUDnljAKJaM9J
 uc2BSPCe4MZ4H4S0IfrLz5+eLZNuoWyQ/3T6vpK9oZZOJbb6jiZd/zvn0
 qLlSgI8axUz/WURInMzPhFAtsIANjcNfZlVWSm+YFqjPSiAkzCubFVhoh
 TfsvuVnQkcJ0F+ZpsE899dbYPxWMHUwyPxy+JEsMYtomVd6YqJ6Pvu70u
 uMZiQn7lgABH0GKm5EV5908tl+13zDTbQHovSLWRwvnxkjr6q5ii3GJvS g==;
X-CSE-ConnectionGUID: N3ng89azSW2XF5cPempRsg==
X-CSE-MsgGUID: N8lU5Dx1Sji/AYQeRDaEgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="84353802"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="84353802"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 15:50:48 -0800
X-CSE-ConnectionGUID: 5J0EhZINQa6gikIaCP5HRg==
X-CSE-MsgGUID: NM724GidSl2TZOwTmJVgBA==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 15:50:47 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 15:50:46 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 15:50:46 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.63) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 15:50:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mfXaOgtvBM8LhNIYSG2Xv/oYVD5J3Be8QysWw0q2rR50wUh6+4xr6fgn+wk+ZjaGOl/tyfrXow7gLTzVcTc532/bM+YpoeD5/Gd0oZZk+eqNq8tlrdK9X1vdTpqBdO2PYrjM8mTnhi83aKb1j0hlci5rR3YitkkjqtEdlhNV7525Al8oqZwe09fZB+seemZvAFmo3ZIrNW69GYWbrEr1goj4dDY+KVI+UgXr9VGA+S+loDN+0WNxhO3kWLhOM6m0UB9zvkZw34SorE42JABe3QSpQqeo6XarJEwdehczrQi7xgQsxADz4f0Z3bmw4Q9jM40Oxutyd4ETg32cENRY/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfkLaYcLfijetuLMwkwMV4o3+biGSWMRctn5DACXIs4=;
 b=rUFwJVeY2x+nBC61vDGfNARjfD24A7mXIZ+4lNrreY3nY4TvlRwcN28mv5xYza2X01/l96JhFuL0l3kTOtT3emuEWSIoJG5gBiRnpntG0YzSXfT7nTTsNS5NBY4sRnnkt4NphRk8gD/92qqSv2PPePK5MtwBRPv3IEMbzvSHUbeDhia4vCMh+yOG39Tg+0vyRDAKn9lVRuZwVCjYn/d11H9AfbV4+i7ni/dKvfupbBf1EZYH8xKblIjFqEYyF+CFLVBsW42t0MX9lPbhnAOH0axEZL8yZ/IbJT3G2IyvRbTIKGTQ5QI7ALWBYldb9ieInuwLm1YiFRhoUgzPEuBvyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by DS0PR11MB7649.namprd11.prod.outlook.com (2603:10b6:8:146::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 23:50:44 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%3]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 23:50:44 +0000
Message-ID: <27005659-b950-40d2-80c6-2e107ab33d09@intel.com>
Date: Mon, 23 Feb 2026 15:50:41 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/pxp: Do a PXP termination before suspend entry
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>
References: <20260219002627.1208210-5-daniele.ceraolospurio@intel.com>
 <20260219002627.1208210-8-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20260219002627.1208210-8-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0300.namprd03.prod.outlook.com
 (2603:10b6:303:b5::35) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|DS0PR11MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 794a5444-0a3e-4632-bd6f-08de73365bc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mnc1WnZBM0NZOG1MdjZnNzd0WXFtdDVXa3ZkZUhCUFp2TDRsQlNTNmRZcUdJ?=
 =?utf-8?B?VEFkRnhyVnM5VUREeVgxR1p2NldNblJ5TXRkUE1YbkFUdmJKTC9RS3JtYW1I?=
 =?utf-8?B?SG5TR2VzV2ErVVBISnhUVmZ6alhSWFcrNDYwcVJmbUJoZ1VyamhhL1lyTnBK?=
 =?utf-8?B?RXdyRm5GNk81L1pDdDdTc3drVVVDczNqemcvZkRQSDViSk9aUno3Q1Y1Z2ZF?=
 =?utf-8?B?TjRCRzdDTWl5b0NOVXBPVW0xa1lSZmpFL2pEcHFCcEtLK1NOc2E2VFJSaGJk?=
 =?utf-8?B?TTlGOEJ1NXphNnY3SDY4QU01Zm5meDViNEdlMFB3TG4vY0NTMDB2RmVoZTZy?=
 =?utf-8?B?RlpzdGdtMEpET1BvdlNTQ1k1Nm8wTFRna1phV09ENm1Udkc1QXZ3RlZ6ZER4?=
 =?utf-8?B?ZStzRVNxZDFaOTBkN1JpWUVZSnd4Wk11Z0VtK0FwSE5Jcnc1MWh3bkdxRURr?=
 =?utf-8?B?WUVHbGpnbFV3cmJrZzNWOTV3eU1Renp4MzV1elpKTkFEcU1CSzJsT2tmMjBK?=
 =?utf-8?B?N2x6bFR3Unk3SkhzS21sc0tkdmJjVklTaDRPcmcraFNNQkR5U29LaEt2d0hO?=
 =?utf-8?B?alBMMVdqN0gvQitGblRIZG5BY2FlZDNnZU05aWpBMGRzSlZuc3lsZ0tZS2FU?=
 =?utf-8?B?RHJuMmdkVlp2Z3pCUnBlQkppV3lZOEs4SWN5SGJiamdxTTBITS9qampyZmJP?=
 =?utf-8?B?V3dYSUF1WUJvY0pJNjJRbE1RNUhoeW1KM3M2S0lkWG5EeW9VRmZQaDRCUW9i?=
 =?utf-8?B?SnVjZWlhSG9TNGtaQ3paSnFWNFI4WVlDZkpSUjI3UWFUa2I1dlJBbS9PU0FV?=
 =?utf-8?B?WEtwSmlVSXQ1U1RCMTdWMXAvQUQwcjk1eTlJQkVPWk9BTXVGYjJQSnJlMFZ5?=
 =?utf-8?B?ZWhtNDlibHo3eWlGOHRBc0w1d2N1Z0FycFo0MDNSVWU0ZzhvZVpReXNxRE0y?=
 =?utf-8?B?R1FWc3JtWEJDZTFwVFJXZ0NIOVRjUUFuZTFrMzRQNlFXYmw4d2l1MHFkM0Fa?=
 =?utf-8?B?cWUrd0dYa1lHTnFVWCt0bDZna1hIUVV1SThUa29PdHJWakZ2ejdzeDBnNm44?=
 =?utf-8?B?U3JTZVRjVlV6RXZGdEFQeTllT0pseU84Kzk5QXBrekYxeWdXMy9zekpwME0y?=
 =?utf-8?B?M1RQVXc2SG5QR2Q3R2FpM2lvZ0pteHFjVHlvcVVjd2RuZHR2TlA4UzllVXVz?=
 =?utf-8?B?RDFadmtOcGtNbXdSa2RSS3FiaFZRWDFsV1lsTnVQUjVBNTRLK29XZkFyc3pt?=
 =?utf-8?B?dXYxWEh0WmlDb1IvT2xFc2RyODhGZTEyTGJ2cnhuWWJXb055THp2OS9oWXJ5?=
 =?utf-8?B?T3paVGdBQVd6dENCZHhKaU96SkFLV20wWUgxZjNHbWlYVURLVFFtaDZMb0p1?=
 =?utf-8?B?bHE3V1ZPMXV5ZExxSG5YSW0vLzdENkJVQVdCSjRaMjhZRDRPMGF3cm5DUEtM?=
 =?utf-8?B?WVlhM2lLSXdneTlQaWJMMnZLZFF4eU5uWklmRWhMcjBPanR2djJVbUtESnVj?=
 =?utf-8?B?T1J3RWMvbWdETm1zKzJ2em9yaTVCdDVoc3BzV08zY1NCUFJvZU1HZTZUaUZL?=
 =?utf-8?B?dHY5eFExMGJHUk02ZTRjK3RhbXd5TlVnb1JLcEgwZ3RyMTVJTm5xYVhkdkFZ?=
 =?utf-8?B?ZjBxd2Z1dCtndmtiTUpyQnNOcHNXcTY3YVI2RTB2QUFSUkI0YjY2dm9HYkNi?=
 =?utf-8?B?MTV1TzhWSS8zQkFsOGgwSXRST3RMOGtVYXhtbmowWFJyNHk3ZFhoS1FmaVB5?=
 =?utf-8?B?dHNPS0hhZXBjTDJHaENKd1pMbDhvY0VxNm9NTmUrYnpUVURvcUpkbE9KdWdi?=
 =?utf-8?B?Q0E0cHU3cHh2VERpN0pXY3NkZDJsRzZQTTlQRXRJOWxoeDVwaktKT2o5bFNL?=
 =?utf-8?B?NG8rL3A5V2xwaHRFdlZtdWpNZFY2RHhSYk1zM2ZTY1NES2txRDMyM2tSbmlZ?=
 =?utf-8?B?djRQbFJnUG1tRHBTck9XcG5nYytqeitjQlVLNGVHcElSRGw2UUxNcG1xby9t?=
 =?utf-8?B?RXk2VEZWZDB2dlJ5S2ptT0h6dlpmUnkzQnJBUkJjajBYa291RGJjcVBaUGZm?=
 =?utf-8?B?ekNoZFdBMUFHbkg0Z3ZXYnJYTVdoQllob3h2L3BBdjlEek5xQzIrUDR1TWJE?=
 =?utf-8?Q?oABw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUcyaS9mbzRPU3hWV0t2WGhjazE3eStwajlxdHdIeWhzY1ArMFVhb2lMbUM0?=
 =?utf-8?B?dDNjc3RaTHhRU1h6K01HUi9VaHpDcnpGNnI0MzBhZUVvK3FXZWVrL3YrTXF5?=
 =?utf-8?B?eWYvbFRNRGRiSHhDeEc5d2NDekNONDF2YzZMMGo5dXJUZGhraWZzZlZWMGty?=
 =?utf-8?B?ZTdsNlFsTzFhM24xbWUrQitiNklFNnhpOVlZKzRMeGhVMmh3aUF4Kzd2Y0lI?=
 =?utf-8?B?MVZOVlZxUE9tQW5TYzhFTURLdXVpV3VacG5TTFdONFhsanIxaWxhY0p4OXNl?=
 =?utf-8?B?bU04cG5ucnAvMFdGaFE1YlYwTnU1Y0lJN3pLNzJrbjBnYk5TVXh2Szd3Tkh1?=
 =?utf-8?B?c2JDS0U1WGx0V1VJbHZpM0RRSkRUanNrOFlZVXcwWk5rSUQwZFlWRGtHOEV3?=
 =?utf-8?B?dm5UZkViUjlhK3lPMVlHNXRSNS9wMjQwa3VSR3dYMDlNVWxXQi9lcm1HbDFD?=
 =?utf-8?B?bWZQRWdQWUMvUFAvUHJaSkd3eGdZQTNuRGtmMGJaREpDUmdLekhsNmVLQlc3?=
 =?utf-8?B?SWJmSmNyL242dnh0WVNlTmpGNlJqcCtUU1BpaEFLdzhnWHBDS1hqMmZHTjMz?=
 =?utf-8?B?ZUNjbk16S2xaa3pOcmxpRFV0QjR0aEhHSlA1Vm1JZnJ2VmxLS01qWkxkQXZp?=
 =?utf-8?B?UmNnOG1nWG1YaUdCUVo4THUwYWl1YmdLcVhzU1QxQzNOR1V5S3ZpT0RMQTI0?=
 =?utf-8?B?eG1VZ2E3ODNoSlY5TUVrVC9nMkQzWitaOXlVSEtQVGVYTFRJelNYWVcxTlBS?=
 =?utf-8?B?ZGdiQmg3eEVvTW1xQlNvMHZCNURPWUNJeEZLUUVxbWNlc3VrQythTVZIR2FK?=
 =?utf-8?B?a1JyZi82OGZEY1p4WUdyS29xZ01IUy9TSUpRUmllVkVpTzZWTWgxNnA4UCtH?=
 =?utf-8?B?bVN1K05JdXM1bjRWd3g4UWJrRW9kMTAyWFNhN2JPSG91ZUlaSHdkZWt0b1BE?=
 =?utf-8?B?bmNhRE5iaVFjVE9RQVEzUW9VRVBjQUpwZUg2Skg4ZWFnd2llZXd4MUF6dkRZ?=
 =?utf-8?B?bi9qNDVxSUFJOUtuTFpDZWcwV2tERm92R296Tlk1eWphL1RDWk9rTVhZT24z?=
 =?utf-8?B?b0w2ZlVZOFhod0U5ekNCMDRaajlIMXBLYzJsWDBJbXpEdVVlWVQ1YzR2MXl1?=
 =?utf-8?B?Sk5WWk9pNXkwcVRITjZhVXVRNlVXSnhWbFkraHQ3Rkp4UXVxb2ROTkhUcGRT?=
 =?utf-8?B?djl0RkN5SkxtYXNxa1M3NEQ2ZlUvTDA4WDdZUkRvS3R2OS8yREMvM1VwTjdY?=
 =?utf-8?B?OHRrbmhqZ29ST2lWV1ZiS29oTUY1VVU2QVpQa001UnQvWjFKL3dQOFpDMHVj?=
 =?utf-8?B?RnhwTjlxc29QUGhVZ2tlbFR3WHV6RVpLZ1VnMVBoVTBFLzFCMFZvR21ZdzJx?=
 =?utf-8?B?enhvOTQ4ZnlZL3NhUElDbW5lRDBDRUdVWVdNaU10MTlOWUgxZ3BqM2N3cm8v?=
 =?utf-8?B?TXg1TERXR3hsWjZNemJtN1NmUngvdnNWRGlhQzR2VzlvRlZUY0tQUUxjNDRq?=
 =?utf-8?B?bSs4OTExbmljcGJ1MElGRWFTNE4yVnhjU050RU4vZTFrMXdPNWFlbFV2eGpI?=
 =?utf-8?B?OWNRdXRsaUlmeWZVQmFRZDZ0LzRQVEk0MU00NDM4UWl3b0Z6RG9kZ3N6Sllp?=
 =?utf-8?B?dHFpY1ZOMXNuemZ6c2FqeDNISUNweEhMV3NkYzRoTG9YTWdxeEJOT3N2bmh4?=
 =?utf-8?B?STlWUWNkZFZjQ1N4YVA3TU5kSGpZVjVDVy9sd3NEa2N2YVNjS3o2ZHRhOXhC?=
 =?utf-8?B?dlJpQVhzSHBPcGgwTTBUUEVnbDdhbmxiWHJlZFlmYUc1NjB6djFHS3duTnlQ?=
 =?utf-8?B?K0syL3RTeTlabXFubkFDNi9qNHloKzIySUNtRUl1cHI3L2tWclg5S0swT2ha?=
 =?utf-8?B?ekd6RFhUS3Z4U2N6cFdURExEQjFKaCtzRThZRldyVWRmSndZbmMvWjN5aTlk?=
 =?utf-8?B?OTJLR2RBdmtTZ2t0NlpZOVllbnR2SlVFVElUdEV0TEsxdnR0RWovdkFnTmk0?=
 =?utf-8?B?Y0ZrWm84R253ZXI4bUZVNkNSWHQzRHVOMzRZRmdKSjh1SnFTdXJoU0g4NFVn?=
 =?utf-8?B?Yjl5RXpRQjJGdGhjeTdrTTdtc0FKNmFveXRVa1FyVE1rcXRMR0k2eTY3RzZv?=
 =?utf-8?B?SFBWUkF4MTJKdFpucHljZ3BxdHQ5ZXY4UmY3RHJocWkxOGRVamZ3Rk9zQlYy?=
 =?utf-8?B?S1p1ZCtndDJCSjA1UVlabUQydmZtVE0vWWFkMkNCazN5VkJkVWpsNWxPZmNt?=
 =?utf-8?B?dHZCNnBYSTd4ZnhpTWx3azNjREJTellkU0pFOVhJazQ4VVU4SG5BYklSQkJX?=
 =?utf-8?B?ZytGVDZtdmFmbEYrL1U5d2k1RkNvTlpuWENLWTdNUVY0Y0JORlIvV1B2UVRt?=
 =?utf-8?Q?gaJA3itHZfwX6es4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 794a5444-0a3e-4632-bd6f-08de73365bc0
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 23:50:44.1318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l/ra0aYTJKvjxkmkWsH5w8/4DYOpYeOYGcOkMwUW3yfxawRDiaQ3bMEhV1uf8cWXkk80cWzIofCfcSTkkZSR1qlCXMjkJH8+TR2796WwO2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7649
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


Looks good to me.

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>

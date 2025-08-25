Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15C2CA0FE7
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 14:17:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFF110E4AF;
	Mon, 25 Aug 2025 14:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AzPkNHnO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7873D10E499
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756131434; x=1787667434;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UpvDxj821W39mVlTxv0ctl5eOSpzqa61GR1Gebs8q/M=;
 b=AzPkNHnO3CgNWAZKcIrqG1iZdiUmiOJs/PXb9d0QZeYT3/z7ZByckf9O
 luddi7HtVIjC/AV61Z7VKOQrU84vHkUQDg6r42D6DtsZRB7/eqar2/S3F
 nlosP32QW/oQ8JncBvTNZfI5rs8AuxRHqM1z3qnkHPcKON6LVpbN+NE2e
 l3RRRlkgF1p7MRg87NYRfB0oMiWQpR/U85b5Gr9u4hSllt5mqfe7mQIfy
 QC0EAHtQViwiuDxugICpQR4Czf9vNdikFWgbqG7+H/2rA06kVeeCPTKo4
 Dbl8sH83lfYrudNND/iSpqDHGHbCVXn8r54rNHQTdzMLZUJ6c1REWVVTb g==;
X-CSE-ConnectionGUID: hCwtdkHGQs2KC4w1BbYoMQ==
X-CSE-MsgGUID: ohLBEsCUSqKAC1uniWr4YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69717477"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="69717477"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 07:17:13 -0700
X-CSE-ConnectionGUID: gkcqvOHES4KT+dqDEVF/ww==
X-CSE-MsgGUID: rthocCBPS4SakL0D7xFHGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="169495207"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 07:17:10 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 07:17:07 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 07:17:07 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.88)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 07:17:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dT8QglSi4LCXJGvzm9NosvXupNwOpOLtWCPcBz14mP0szEb1NLUxG4zqD4+vvUdPkE1lQGbL8qRyL4pQ/xm4epptBv6kkoAqshSV9GuDHvGCoiiMx/yD33gCbnAC03N/nMdP5yq8NX9qOApCN291w+tsBNywoylToWYHtNTGL/nUboud5GcOUHRu3dBXy/kqLJKun00K8cSS5hLPAuuDN/1kBu8IKCBP9eSJw4/RuXsz42hz0VVJBsf2pPa+TtvX4/HsuomrcTJzyNxCvHjugQa+L1s6ulWPCvIXn5meMlNOZHROufReitDfByrBzp3/kocGNK5kbZnKry5kY5+KKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aS0haHi7MZHGu4MYmQSAwxSsXsbUd3N50RY9RbmuvqE=;
 b=lOwNOBvB79POr6nGmeDI4BFIGrnnOjzsOnQNl3e7WuCVdBOWQG7evTlk7wXzlNk1Wx5uJ/8zA3CBd93dblvdgCPqdM24bHhck3OAovqwwTpDguMlY2GKGZ8hR/mXPQj83ZMLXQS2u3nS6v/6OfOZBVsy5fS3YudHyEmp5ZU9ecQ3RiUfXyY3vj9nuNH13jPwg1y0YCfr62C0MKvh9hVnTcRYPXifX8smHSMsCP7mqEvrHfv+MUijGfnymM0i2HhokyzTTt8BConlGgkm/QLAgsKg6dEDD3GIy3QlUzSoczgc1RC7UquLJAueA48feikxuMFdvwy4oOLg1rCy+6aVbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Mon, 25 Aug
 2025 14:17:04 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 14:17:04 +0000
Message-ID: <427ab95a-2844-4804-8259-b7367780d713@intel.com>
Date: Mon, 25 Aug 2025 16:17:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/vf: Enable CCS save/restore only on supported
 GUC versions
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
References: <20250825135641.4259-1-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250825135641.4259-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::18) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS7PR11MB7783:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b845b91-8405-47d1-1978-08dde3e21104
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlZNcnhVYzRvN09WM0FjMnlDRnF4WGtSV2U1MU9PSnBiTVJWQWlzR1JTTEZz?=
 =?utf-8?B?L2diVjlkVFdmSDZudmxmd0tkQUJ0THlMYnFwQkJiditrbXgydkhnUU1XMDRC?=
 =?utf-8?B?a3NiRVNnSTdnWEpFVmxtZFlTVkh6K2xiWkMrZVZIbDhjOWJZRCtpdkV3V0lT?=
 =?utf-8?B?bmRpR1k1cWxJS2RQdzREUFN1bzlQdWNyMGt1U0FzUmJzalZKdVEwZzBZRkZm?=
 =?utf-8?B?b0ExRlVMRXJYbnc0TnJwOXB6d0hoeHZtTkZTVXhPMEFndUJiNmlndmt0eEor?=
 =?utf-8?B?M0J2eDlOR1hnSmdjNlJUc1NFRitUVUgwQllOMTdsb1FjWG9FVTlUVHF1eU1k?=
 =?utf-8?B?TDdzU0NOMmZLTnp2dmU2TVZEUkxkdmx0WlN2ZjFkSTRVRVprdEd1NUhXak5V?=
 =?utf-8?B?eDJPYXhjZG9IeVpBQXQveWg1V2dnSnFTRUQ4a3NNK1VuMUw2bHpiUTJacmI4?=
 =?utf-8?B?Vk9xN3VXVzdKbXpmZEtQYWNvR1FWaVZJMGU2SDRsSko5VVF5eVdVSFBMUHcz?=
 =?utf-8?B?cHozZ2RVK2dOdEUrMnNVZXk4S0ZOcEJ3cjJFT3pCVTk2M0RWNmhZS3ZEaEpq?=
 =?utf-8?B?a045aWpXNnlBMzZNdU50R2U2cFFmYUpUM1pCek83QzlpSGhEOU9sOURCY0E2?=
 =?utf-8?B?bkx2M2U2OHdTdWNzb1lkVERNRFdxbFhNSkl2eVVidDR6SzM1WFZxRjRGRkR3?=
 =?utf-8?B?YzM5ZE80ZmN5MERkMHdTK2JDeGhEUFZiaXZReE1NSVJCZzN1d1NLUERCRlhh?=
 =?utf-8?B?QjBBWTJoYWw1aFljRVNyc3Z0d1NBSXpaYlIxU0dtckp0NjRFTTgwaVFTcFor?=
 =?utf-8?B?U1Y4VmRPN2hrZkxQSFFtNFlpUTYyV21QU3I5Z0dJSWE2TVN4NEhhWTF3Y3BW?=
 =?utf-8?B?MG83N2Z3MC9PL2gwRmp5YmFVYUJBV0xMRzNFcy9WMEp6OFF4TEFKTm9SZS9o?=
 =?utf-8?B?SHp4UXJEcFBYQTQzU0hSS0IwdVk3T1lLM2g3bjc4cWJNOVBnTXI5M0Q4enJZ?=
 =?utf-8?B?d2szdmcycXplOFJ0S1h1TlJQUEF0QS9xeW5JY1pLU1VvQmJ6ME9hNW9yTXJH?=
 =?utf-8?B?bkxNdTRFODNYdzV1b1dwKzJtZE9CLzBFYVZtYkFvbXV1N2JpaTBUSXlWZHBX?=
 =?utf-8?B?cWYwMkR5cHFjWUVNTDVMa3hjK1BrdVQrN0hNRzcyT013dERYSHhBbHdHNUdy?=
 =?utf-8?B?em56OTQ1YXJKeWc1V3lKeHlVc1pUc2NiUW45a0haY0xCTlpmbmdjVEViTTVL?=
 =?utf-8?B?WTJ4YkpyVGZKSnZiOG96Um5sVnhpV2d0M3ArTTNRSzB2cUhrRGY3Z0toQW8r?=
 =?utf-8?B?a3hYZjZvMUtIdGtvb0FGY01TVUZGci81OENNSUlKTmo2bXFSTFFURnZjdkxn?=
 =?utf-8?B?VkxyTXUyWXpaTDBIYXJybWYyUzNsdlFZVERnMk5zcFNUUWRYbnoyb0w0M0FM?=
 =?utf-8?B?V3BHdVNNVnpRVjFTeUY2RHUraTJSN0VWV1Yyb0Zra2Frb1hKUGp5TjZXditj?=
 =?utf-8?B?dlpIVjJCNHM1aWd3Z0d1WVd3bzRBVDVvOXhSTytNV09OVHF5Um5HeVdkMmlx?=
 =?utf-8?B?cHh4REJUUi9ibjZQU2xBTHNvZktFczlrcFExN0Nqd0JCVHJOV3BZbU8yeWtV?=
 =?utf-8?B?eHh4Tkg1TlllUDYzdkZza25nQkYyMmNMYjUrL1psVXRYV0pVRURKQXRKak16?=
 =?utf-8?B?UitNNkprVHdXUXFWQ3BWbGNjMS9sNFI1TE9LZE9xSFlPVmxaOE5pRzFzSG9w?=
 =?utf-8?B?cGdTdjN3aVNKaHdOZmhtN1FENzdjSGhOOVQvZXZNSWxURFRnSW5rZ01wRmpm?=
 =?utf-8?B?ZjEyY0plV3paTlhSYVVPbmxBQVEvZEovaGdUU3JYMndXWGwzRkI5STR4RUxG?=
 =?utf-8?B?UzVMOUtsZ2JrWDZSWEw4QnorRUJ0c2xCZmJqTXpmRzYrOWVGSEo4cnZGSUla?=
 =?utf-8?Q?a/6ZY2HS41w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmE3T1BlRFpSZnN5cE96NkEyRUZPd2IxUWlPV2k5TWJLTEJKNzAva1VkZUlM?=
 =?utf-8?B?Vjl1emRoL2R1UnBDTEdMR08ranBnWENOaUg4RS92SkpoMHpnZUlDM1c5SklS?=
 =?utf-8?B?UVorNEROZG1iSVhrdWFlSGJIL0RoM3ZxS0h5QU05bHhpQStPN3BvVkpmQlhT?=
 =?utf-8?B?SzhYNjg0a05ERXpnREp6cGMvMHJUaXAxWkR1eERjbDBnU01GNDkvSEJUZzJV?=
 =?utf-8?B?Rzd4dW40N005bHFaQjZKZWFUcnUyQlBRVmQ3bjlMNGlWTEY3RGdwUFRVU2Rx?=
 =?utf-8?B?d3hTZ2lKREl1ZFdTZXFLaHVZQ1orWHYvNURZM1lzcFNrMThya2cyMGJHUk10?=
 =?utf-8?B?bEZFbEg0QklsaDhSbDdJZFFMaGduSmtJSVFDQ2V0eUozTnlEZ3gxc1Vwc1F0?=
 =?utf-8?B?WFNLVi9CK0J1a1pGNVNMTUJtRm1IbXdaM0hNUWNGcU02d0xkcnViYUppb1Zr?=
 =?utf-8?B?ejJid055RzlwQ2RyZkdFNURoaC9jZWRrUUxtYnMrdTU1Y2xaRzR4b2xNVTVp?=
 =?utf-8?B?bXV1cmh5aEk0VDRFYnMrUERET2ZIeWRqalJucXd0TkxEcXZOdEp0RDI0WSsz?=
 =?utf-8?B?a2Z1d1pNa0VkKzBOb2pvYWxqMmUzUkhQcTdoenlydUdjbXkyMmg1MzFsUGFN?=
 =?utf-8?B?eTYxRG5nNy9qODYxbjRoc0h0R2dWOHV1RVFvdzBtUnZBMklwMk1pT2JnanI4?=
 =?utf-8?B?U3drNko5MnhoRDJTY3VBMGVwWXJzM0JzcVFONWNNUWhtSzk2bytCMlllOVlx?=
 =?utf-8?B?d1lpd0lNa21zc1JkZFp2WE03eEJITE91cXZSeDgxMU9Tam1xZ25wRWV1MWF3?=
 =?utf-8?B?dG83SkF4eXYzYmQxQ1U3ZjlVbWRjVmlXVmp0TGErSUFuT05LZDJVSmdzZmha?=
 =?utf-8?B?SUd2dVloMU1WVmRIS0M3dXVnTWFkQVJxV0Vkak1VMlhWYTJNSlBPeTRGZUhW?=
 =?utf-8?B?T2tHNXRiTGU3eHUwaWtkSzlTbmtoU3o3Q3FIWjdIQjkrM2pFb3FNMWFMSWdD?=
 =?utf-8?B?dEg0QWozUlVhVkF1bDEwdWxEc2VQM2VZTkVqazJhUVZWR1dxRitydzJRTjZz?=
 =?utf-8?B?eXBlcC9IOWl5R3RkU2ZxNk1mUzZyNmdvWGhmQll6aHF6VytqanVZbFlQckUv?=
 =?utf-8?B?OFFJc0laOVRnMDdtSHBMbHVnNFVHajN2ekRNeVZIU1krNUZoUlpDWkt0K3RD?=
 =?utf-8?B?NFp4Y0oydEFZQlpacmo0T0xtZG9UemJ0NTVUU3ZTcnZZQ1pUemFOc1MyRlF2?=
 =?utf-8?B?MEZibWFzd050MU1peWtQbURYcm9sM2ZwWWkzcjlVbjRkeDRob0hYOUh3cWFy?=
 =?utf-8?B?MmwxU25OcFczb1haSnpLT2JxYm1xYnBQc1lVaUtkeVd5NzBaeStLOXgxMjJL?=
 =?utf-8?B?aXBPUThaOFFqc3VsZkxrVkJ4MFovSjdrRzBsdE5ScWVRbzdrRWcxOVVpaUVY?=
 =?utf-8?B?L1BaS1RHQkFBdDZlODFxZTlNaWxkVGIzbnF4ZEllU2dZS1lKc2RVMTZYRGdk?=
 =?utf-8?B?ZG9KbG9Yb3IrVitXcXpsdGV4K25pTVhSVXVYNmhQTHZSMzFTYkVzQngxcGxa?=
 =?utf-8?B?bExFckJJWGNDYWt5c1k2UGpyMWsvRVRwaURob29NZDVIdmZTMXdVazc2RUcz?=
 =?utf-8?B?Nmx2QWRMcUFOSCtDRE9MUmdVU1M0SzRnME1QUE5XYURUcFYwaThXMWE0NVJS?=
 =?utf-8?B?di96cElNUFBqVjlSWlJUbnZmVUZxOUJQZ3UrR1pZMHQ0clFCNTgxc2YyR2Jz?=
 =?utf-8?B?Z0xZenowNE1HdDZ4SVRTd3Y4WHQxYkpZeDVka0hKVjNQU3h2bnpRSGNIYjdv?=
 =?utf-8?B?c3djZU5vMUJqQk5idWdQYk5xY28xOHh4YzRpcEc2ZWJCNU9ZSklHL3FxRXd4?=
 =?utf-8?B?QldLdlg2VTQwaGw2M2RyUmJMVVZNdmtpSkJmNXJ2NU1rNmt0NnBxNmpWSTFm?=
 =?utf-8?B?V3g5ZzVXdWVVZHlhWDhFMjNjd05xMXFMejlDUlE1OEp0L2kzMUFJeTY3ZVI2?=
 =?utf-8?B?ZHJvQ1I1UDhpdlAvLyt4bU9qa2dRbGhIUWM4S3VxQ1NvbHZMQVZmNnF0SW1H?=
 =?utf-8?B?MHpad2Y0bDI1WERUS1luK1MwcW44Si85Zmk0Mms2TFpQSXZjYzN6UGR3NUhF?=
 =?utf-8?B?TWkxNVplaUpOKzZOekVLOHV4c2llVDE3T2xyOWE3UDJReEFrWFVoOXJGTmpt?=
 =?utf-8?B?Y0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b845b91-8405-47d1-1978-08dde3e21104
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 14:17:04.6037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I0nikbqwMj3F/9DFCP0RPw1Kfp4e9x0bnYRsJlLNI+cM4f/uZCyXQDx4cldeVFWyNnYxtmMa2lP7Erkh2F/guhQM6V2f8LO3vePrLzY1Dv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7783
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



On 8/25/2025 3:56 PM, Satyanarayana K V P wrote:
> CCS save/restore is supported starting with GuC 70.48.0 (compatibility
> version 1.23.0). Gate the feature on the GuC firmware version and keep it
> disabled on older or unsupported versions.
> 
> Fixes: f3009272ff2e ("drm/xe/vf: Create contexts for CCS read write")
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> ---
> V2 -> V3:
> - Fixed review comments (Michal)
> 
> V1 -> V2:
> - Fixed review comments (Michal)
> ---
>  drivers/gpu/drm/xe/xe_sriov_vf.c       | 40 +++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c   |  3 ++
>  drivers/gpu/drm/xe/xe_sriov_vf_types.h |  5 ++++
>  3 files changed, 47 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 5de81f213d83..734e64a50f13 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -10,6 +10,7 @@
>  #include "xe_gt.h"
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_gt_sriov_vf.h"
> +#include "xe_guc.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_submit.h"
>  #include "xe_irq.h"
> @@ -133,7 +134,42 @@ static bool vf_migration_supported(struct xe_device *xe)

this static function should likely become a public one:

	bool xe_sriov_vf_migration_supported(xe)

as you would need this either in xe_sriov_late_init() while calling
ccs_init unless you introduce here

	xe_sriov_vf_late_init()

and call xe_sriov_vf_ccs_init from it


>  	 * TODO: Add conditions to allow specific platforms, when they're
>  	 * supported at production quality.
>  	 */

this comment above should be moved to vf_check_migration_support()

> -	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
> +	xe_assert(xe, IS_SRIOV_VF(xe));
> +	return xe->sriov.vf.migration.disabled;
> +}
> +
> +static void vf_disable_migration(struct xe_device *xe, const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list va_args;
> +
> +	xe_assert(xe, IS_SRIOV_VF(xe));
> +
> +	va_start(va_args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va  = &va_args;
> +	xe_sriov_notice(xe, "migration disabled: %pV\n", &vaf);
> +	va_end(va_args);
> +
> +	xe->sriov.vf.migration.disabled = true;
> +}
> +
> +static void vf_check_migration_support(struct xe_device *xe)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	struct xe_uc_fw_version *guc_version;
> +
> +	if (!IS_ENABLED(CONFIG_DRM_XE_DEBUG))
> +		return vf_disable_migration(xe,
> +					    "experimantal feature not available on production builds");

typo: experimental

> +
> +	guc_version = &tile->primary_gt->sriov.vf.guc_version;

maybe some small helper:

	u32 vf_guc_version(xe_gt *gt)

and here

	vf_guc_version(xe_device_get_gt(xe, 0))

> +	if (!IS_DGFX(xe) && MAKE_GUC_VER(guc_version->major, guc_version->minor,
> +					 guc_version->patch) < MAKE_GUC_VER(1, 23, 0)) {
> +		return vf_disable_migration(xe,
> +					    "CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
> +					    guc_version->major, guc_version->minor);
> +	}
>  }
>  
>  static void migration_worker_func(struct work_struct *w);
> @@ -146,6 +182,8 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>  {
>  	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
>  
> +	vf_check_migration_support(xe);
> +
>  	if (!vf_migration_supported(xe))
>  		xe_sriov_info(xe, "migration not supported by this module version\n");

this message is now redundant since we have some new in vf_check_migration_support()

>  }
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index 4872e43eb440..05d3c680b3fa 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -268,6 +268,9 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  	xe_assert(xe, !IS_DGFX(xe));
>  	xe_assert(xe, xe_device_has_flat_ccs(xe));
>  
> +	if (xe->sriov.vf.migration.disabled)

IMO we shouldn't call this function if migration is disabled,
so such check shall be on the caller (maybe just some asserts here)

> +		return 0;
> +
>  	for_each_ccs_rw_ctx(ctx_id) {
>  		ctx = &tile->sriov.vf.ccs[ctx_id];
>  		ctx->ctx_id = ctx_id;
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> index 24a873c50c49..8eb4ca9f62de 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> @@ -35,6 +35,11 @@ struct xe_device_vf {
>  		struct work_struct worker;
>  		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */
>  		unsigned long gt_flags;
> +		/**
> +		 * @migration.disabled: flag indicating if migration support
> +		 * was disabled due to missing prerequisites
> +		 */
> +		bool disabled;
>  	} migration;
>  
>  	/** @ccs: VF CCS state data */


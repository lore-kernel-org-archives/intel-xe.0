Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7FAC5DF74
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 14:06:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A660310E00B;
	Tue, 18 Aug 2026 14:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YY1s6Nry";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C82310E00B
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 14:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787062003; x=1818598003;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=J4J4ZT4mxg7DjG8l8OwickQrCE0RdtDFStShzMIBjWA=;
 b=YY1s6NryfjFZFvg5rGh0bkLfQD+Fc6RVtzbD4rh93mTIHHH0YCttduoy
 kEL476VEHmfiBU3Sexk8Kbjdwad+C0NAgnvmXkCbdjfpGQ90CojMTcQGB
 Q6web28b5LQhAn/LOFiZ+kmFAaSBo7oD3L9AtO1QJWw/cRkPTq3z5aR/W
 MbGGJT+x1CE8u/Mo2ANQTkNEhZX15nx1sZXSCguvuoWXLrMaHcyY2/c2f
 +KVv//BFjyk8lSc9bZxK9nNormktDW7UuBdbS2IvR2keyfccy6JKi6hL0
 pWw+GWxxbxP5REBmAR0x0Ysl2917UwUm8/BAv0fBj3HxdBGhYEwFjYSbz Q==;
X-CSE-ConnectionGUID: vhNH/SkmQGiaAC54qgvjTQ==
X-CSE-MsgGUID: C9XX2cT5QjajVP9RohdOMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="97891361"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="97891361"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 07:06:42 -0700
X-CSE-ConnectionGUID: 95+0rrxiQY+J7bxR40pIMA==
X-CSE-MsgGUID: lFiT8JBzSSCp0te+Hq2pEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="269073262"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 07:06:41 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 07:06:41 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 07:06:41 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.25) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 07:06:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g0/0sqJ4ufV5rnPI0QTOk18k3DQbhFDWjcpUshx9seqKUVe/IrDH80Jd7PRnK/GwWFMVL6TPar8txpCZie+kki80CNDxJLHzvxlxcTyOyfkhMQqzVqRQ/q1eCN41293N8KjZ4WDl3iEuEzFn3Rg2V+1EvnwHOZuQ/4EzJPR4hmZJodRPBUDgxFU+RgPDzbVniVSQsnI+6YGp5rR2M/F8vTxw3QRBuaHehvSoNLV5y3l7ZuwOrsjMB+M28en7OTB9lX+rgxsxcPmHArCVuQmWudk2qxegLTqTM7HkfUTawp44fW/deYhFO5pWfaHZLgkeeMhK8Dacc1zWbqOZSZt+9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKnK1hPlO5jKuJ0f9TCeYW0SVVn3vHRx7nW87N789AE=;
 b=lhoYnFNQLNEcNNkgblTudnfRtzZPYF2JsxtNcP9/boOKnJhI7pEeN5w+SVdVbEMF9y+ftQREqs7ShtswGK8KYce8Tva1IeBiY52qTpVZttqya3YEVJevEv/1+o0nH/eAV18CU2tNf6kV63+iM68+xcBR6zAue/A5LstDQkoAxsZULmBSj+ya9HzTZdZbAJkKNS72f8PJdQTR3JTKEhNDACMloiU8sRmyG40FdzZ1NY0JNAxZfAOvU2BUVDGXKvJRjJzvuBQiSWTaUjAFPrjr8daTd5Ji2wPy8NbKj83t1iWFmP9qteE6MXqJ71lGlztYydktGU4RhXF1T2C4I73pWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH7PR11MB6650.namprd11.prod.outlook.com (2603:10b6:510:1a8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 18 Aug
 2026 14:06:37 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 14:06:37 +0000
Message-ID: <7647539b-6ae4-437b-9f33-1690ce1910db@intel.com>
Date: Tue, 18 Aug 2026 16:06:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/sysctrl: Add better sysctrl error reporting
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <anoop.c.vijay@intel.com>
References: <20260818131003.495053-2-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260818131003.495053-2-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0134.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:359::14) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH7PR11MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: 79762253-66b6-43ab-d784-08defd31eaa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|18002099003|22082099003|11063799006|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: vWd7Zjo6cNA4OuzE3uiShov3vlPkky94FHdwp2D/2ubJpZd7IXHTTMNTJKrOpEaWIoaA3v5PFbI9+yOACc6D5bfT9BoQLmcxlIFjy/a2QI0yj0qzSXAZ7pIGWQ0AOG1sF5HvF1Z70Ud4DrLHCm/ITeitWtXQOw6vopNq+fy+jM0umbPxi8iEC46BGP9klX6BI1eScvFyOh4A9tYNt2pPlP58Qc3rSkPO1Zh265nLt6WzUrMqwZvUkZhJrQfwDbWVz5Hh+yK2b91xNRHaEUbbUOTWDxF1GOvPI8IhWHYJ/mEe3zDU/3XmVj8xpo43Bwxwq+eRpbdpvJ39J5Wq14Aw41heZISQrMDmhO1h+UZs9DDAvYlUDnIpTohA6d2YNxRCczZjmr7ohhooryUxgPq/N5LjKOb+mCJKpbWLKAIGf4KmZtsD2aJC7VeSTvnAfq2I9ZtI8k+f7M+bt72XRKdnCnXJ8XWMsNcrHv6EsCb91lDdr8dtFye1GjZF0Fswndnyy/IonfVpxURN8y97wEJRxAXyYtq0xjS/fdN+IlT+hAS5ip/djcqvTUI4RB8LQcxYWqsqMcbv33UppB7tMSrcIFBAq6s2lYz2YD1APGMSM4lvnnDekkozsin7i5Wy04y2GGrtyPWMIvMq0HR3UjuEy61IxCMRq9Nu2es+jbcxxN4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sm1xUXg5bkdCSGhYWDBlWUdJN1crYUJrclpLN05ZRGs3ZG1tMDZQdmMxV1JD?=
 =?utf-8?B?Yld4U2tSMjBUSXR2c2FtcGt6Q09MM1g3dDkvZVpTT3lQVGJGMkNTdlJ4R1Rt?=
 =?utf-8?B?R2R0K3owN2RUYU1wMlZqWE43WHM1UjNzaUw1MkpHMTZzQzQxS1FoQUoyNXVN?=
 =?utf-8?B?SlZGSUtqZy9jczFWS2gxTnY1ZHZWNW5QTTFnVk1yeERtQVpWK0g2cm5xOFhi?=
 =?utf-8?B?MnAzbTk0THF6c2Y2TE5EUkt5SysrbXE4YTZOcWNHcXNFN1ZCYWJYelF4UEVL?=
 =?utf-8?B?WEZOS2s5QkdGOWs4LzVXSjFpb1NkcFlOQjd3MDJMdEhXYkJTd1JtT3U2c1Qz?=
 =?utf-8?B?RFhNZHdhZXFhWEpxellOa2NYSTlqL1lDQ1JCTDZMSGU1Tjl1emZMSlRyYXNw?=
 =?utf-8?B?UkNnSXNUcEw3enVTZHU3S2xnemx6amM1a053OUNCMG5rdEdlOXloa0ZmbStH?=
 =?utf-8?B?ekNpdzl4N3Axdmdha3RFOUdvNFZKVWZDVkpBL21Lb1Y4K3FBWTZjYnBBazBK?=
 =?utf-8?B?UENrR3gwU3lZSHlMMUxKRXhMUktkWFhnMnRzSzZsRjZnL001T0QvMzlJT2t2?=
 =?utf-8?B?azk1cFRLWU45NDNEb2g3enQ0L2k0YVhJNndZSXBySHd5R0pNT2VHbTBQc0FJ?=
 =?utf-8?B?OUxuMlAxUXlUT0VLNEZ1VWdlcnpSdnZ0SXZXTWdGR0tIQml5ZGxXTC9iZjZS?=
 =?utf-8?B?a2wrYnd0RnU2aGZwWXBHTVlIRW5XK3ZIL05kdVRRUDRCblphVHQyS3BKcnA1?=
 =?utf-8?B?UGFIOHllMmQ5Y3FWeXJUWml4SnBDdnhPcExVM3ZLeWlrYzQyNTFUMVhUem0v?=
 =?utf-8?B?bFpKMlcxWDZhdnp1OUs1bTMzdDlxVGdieGxGNSt6QndFbE9Kd0l5QTByekwr?=
 =?utf-8?B?SUNzQzcxK2FFZGUzY0ZxUlFrVDBkMlQzbEtjRUwvRHNNYzMrMGJjMDlqSDQ5?=
 =?utf-8?B?d0o2V1IzVXRVa25PQ2srZGZXVi96WitJWmltbTY2UmErYThqbXpZYkdFYVRG?=
 =?utf-8?B?RFFERHJMRWNoVWdpR0xqSTJsMjF6Y25EZitHNVdLWFJRYy9kdzllMWV1aGNk?=
 =?utf-8?B?SlpDKzM5S1ZTZ1ZLVldsNlFFV1RtbjdZZGNhY28zK0R0d2VsTERVbHBEUzhV?=
 =?utf-8?B?SUVra1d6UUVPakhOZ3BPa0ljTjBKelNLWDN2Q1FOcS9rRTRab3J6YTc5dmtU?=
 =?utf-8?B?ZDllTno0MEpYemVGVElyeHpvZ2VrclY1WU1FLzdYbUZteS9SaFpTT1ExelR6?=
 =?utf-8?B?Um00RnoxSDBrODE2emd5dG9VeWppSUhRVkM5dUdPYS9mVXpYZ1o2eHpFVWhM?=
 =?utf-8?B?UWs0WVNmUjlvWURRUCttNmthbzFrdHFkM0RFdEpGQ2VHWHJGTGFqSklCU2h0?=
 =?utf-8?B?Z0pXZWwyaW9pM0g1VC9ycTMvOHNqRTdrRWJrd1dhZm1vOFV6QmhtL3JmUDdY?=
 =?utf-8?B?Ujd2T3hQSUFlcGhzZStwSzNyMjNjRU9BdVBCamFoanJlTzl1TWo5YmJwcGk2?=
 =?utf-8?B?LytSekNiQ0RTbjFuM2pHNFNNc0FRYW5TK3JVSExCdHBBd3M2U0k4eUthVVFu?=
 =?utf-8?B?MzV5WjdtekpSTG5SMzBMcDBUR1lhdSs5SllBSHpXUmJlbW9qM255VG80NEpX?=
 =?utf-8?B?czI3L2hMaGJMV1pGck11SURzaGxlUmYxMjNDWG5BTWVjV1J0NHA3ZHd2YkRT?=
 =?utf-8?B?Q2J2UHVVUU9qNHJZTmxWYWZ3am53QXpZNm54SXVic0JLczNMYlQwajU0MkMv?=
 =?utf-8?B?RmVhSGFraXNoNTlYWlh5Y0dCT3plMVFNZkF1V3FmTGJhZXdnaXBsTXd5andr?=
 =?utf-8?B?TWFEREUycDRhT3o2Z0lEYUxQOUhYcVhrMldTS3Q5TmkySzlpSEIzUXc1N2Zn?=
 =?utf-8?B?ZWFZQ3lZdVFGVjQ2RzNVZndQUGsvejBJZ2VOZ01WZDZYZ3FuN205NUZCczAy?=
 =?utf-8?B?VFZHV1BsbHVXMjdycDdkM3krTXJpREJrT05Mb2VyWXpQVlVoWnQ2Wi9VOG9Z?=
 =?utf-8?B?Ym5oZnNJOElHQkQxWUp4VVE4N2lyL0dLdUhhdnZaZWNrcDZvK0xpWXF1TkEw?=
 =?utf-8?B?VEowYmN1czg2NDNVejFCeTU0UHM3QUl0Q1o2Smx5TTZFa3hTRjlQR1IyTEsw?=
 =?utf-8?B?c3MzQUVFRlR6WkNFTjliR1FaVUttNHgyTTdrcXByTy9Mb3pCRnJoVWNPdy9I?=
 =?utf-8?B?WGdmbzJ1cXluSzJzSE83cXlXUkJFNUo3YWZDWGRsKzFZSlFEazNsOHgvREg4?=
 =?utf-8?B?VXlhV2JoaEpjczlCM3NxblJpdlZESGNJbjc5YmdoOFNYd01XYVZPMnhUSUZl?=
 =?utf-8?B?ZWliREJ3a2NoVkYzbW9ielE4WjhMUndodmpFNllVREc1ZUdwVGR3bmlFV1Nm?=
 =?utf-8?Q?sy9v661gTKa+dtVc=3D?=
X-Exchange-RoutingPolicyChecked: rB+cxRmtoAfCRK23kTtvuOeVlotij28F0SdpYKIrxOGNsAGlnsi+6iCWqFRMo6cnt7Wc2fCaTAxnJt4mnsrQqKHtQ8NuTZYLWRsckBmWAU8+iZ+HYOBbdHnvoVFQqLAmprTwHt/MrDeWJK8IchrhHya1q6Y6mj7JLcWqfhko/xyk6MEDP+GaLnr2lNcSbkZ01CleGeAIU+hoxcOArqvHqjgYJA5C5vJUKYDhuBc5BXJjJZHE8Tnpf4t27a8tkdTAHGGZreo7StmjwAiwbF4GxSelvG146ft39vWtxAD1C3mp/vryPcMrmhTcdSyYLbBjeo8AbROWMtpahnq72Km+nQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 79762253-66b6-43ab-d784-08defd31eaa5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 14:06:37.1050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a0rj1kSO/mbsKEfPvNUH1XttB+h5Fsh4jHe3xpXuDfry44jJd1bO+QIKZEfOOYTfv2oyQOg462sBIRQOyQ+h55e5NYor4QXWXy/qXmgkvps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6650
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



On 8/18/2026 3:10 PM, Mallesh Koujalagi wrote:
> Switch sysctrl error messages to xe_log_err() with SYSCTRL tags so

s/Switch sysctr error/Switch the System Controller (sysctrl) error

> tools can reliably detect and categorize common sysctrl failures.
> 
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2:
> - Use -EOVERFLOW.
> - Drop sysctrl in xe_log_err. (Michal)
> - Drop redundant %pe.
> - Print response->count.
> 
> v3:
> - Rebase.
> ---
>  drivers/gpu/drm/xe/xe_sysctrl_event.c   | 12 ++++++----
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 29 ++++++++++++++++---------
>  2 files changed, 27 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> index da395148ee9d..4341ea99cdc3 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_device.h"
>  #include "xe_irq.h"
> +#include "xe_log.h"
>  #include "xe_printk.h"
>  #include "xe_ras.h"
>  #include "xe_sysctrl.h"
> @@ -25,13 +26,15 @@ static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_c
>  
>  		ret = xe_sysctrl_send_command(sc, command, &len);
>  		if (ret) {
> -			xe_err(xe, "sysctrl: failed to get pending event %d\n", ret);
> +			xe_log_err(xe, SYSCTRL, ret,
> +				   "failed to get pending event\n");

nit1: no need to break line

nit2: we should be consistent (at least per file) whether
the error message should start with lowercase or uppercase

>  			return;
>  		}
>  
>  		if (len != sizeof(*response)) {
> -			xe_err(xe, "sysctrl: unexpected event response length %zu (expected %zu)\n",
> -			       len, sizeof(*response));
> +			xe_log_err(xe, SYSCTRL, -EMSGSIZE,
> +				   "unexpected event response length %zu (expected %zu)\n",
> +				   len, sizeof(*response));
>  			return;
>  		}
>  
> @@ -41,7 +44,8 @@ static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_c
>  			xe_warn(xe, "sysctrl: unexpected event %#x\n", response->event);

we do have xe_log_err_info() now - maybe we can use it here?

>  
>  		if (!--count) {
> -			xe_err(xe, "sysctrl: event flooding\n");
> +			xe_log_err(xe, SYSCTRL, -EOVERFLOW,
> +				   "event flooding: %u\n", response->count);

nit: from the dmesg line it will be hard to guess what this %u really mean

>  			return;
>  		}
>  
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> index e13eebaac1d0..a96ef2864526 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -11,6 +11,7 @@
>  
>  #include "regs/xe_sysctrl_regs.h"
>  #include "xe_device.h"
> +#include "xe_log.h"
>  #include "xe_mmio.h"
>  #include "xe_pm.h"
>  #include "xe_printk.h"
> @@ -115,7 +116,8 @@ static int sysctrl_prepare_command(struct xe_device *xe,
>  	xe_assert(xe, command <= SYSCTRL_HDR_COMMAND_MAX);
>  
>  	if (data_in_len > XE_SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(*hdr)) {
> -		xe_err(xe, "sysctrl: Input data too large: %zu bytes\n", data_in_len);
> +		xe_log_err(xe, SYSCTRL, -EINVAL,
> +			   "Input data too large: %zu bytes\n", data_in_len);

didn't we agree to change that to xe_assert() ?

(this could be done as a preparation patch)

>  		return -EINVAL;
>  	}
>  
> @@ -149,7 +151,7 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>  	total_frames = DIV_ROUND_UP(cmd_size, XE_SYSCTRL_MB_FRAME_SIZE);
>  
>  	if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {

nit: shouldn't sysctrl_wait_bit_clear() and friends return -errno instead of bool?
then we wouldn't need to figure out the errno code at the callers side

(this could be done as a preparation patch)

> -		xe_err(xe, "sysctrl: Mailbox busy\n");
> +		xe_log_err(xe, SYSCTRL, -EBUSY, "Mailbox busy\n");
>  		return -EBUSY;
>  	}
>  
> @@ -160,7 +162,8 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>  		frame_size = min_t(size_t, cmd_size - bytes_sent, XE_SYSCTRL_MB_FRAME_SIZE);
>  
>  		if (sysctrl_write_frame(sc, mbox_cmd + bytes_sent, frame_size)) {

hmm, actually sysctrl_write_frame() always return 0
either change that function to void
or use the returned error code

(also as separate patch)

> -			xe_err(xe, "sysctrl: Failed to write frame %u\n", frame);
> +			xe_log_err(xe, SYSCTRL, -EIO,
> +				   "Failed to write frame %u\n", frame);
>  			sc->phase_bit = 0;
>  			return -EIO;
>  		}
> @@ -174,7 +177,8 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>  		xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
>  
>  		if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
> -			xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
> +			xe_log_err(xe, SYSCTRL, -ETIMEDOUT,
> +				   "Frame %u acknowledgment timeout\n", frame);
>  			sc->phase_bit = 0;
>  			return -ETIMEDOUT;
>  		}
> @@ -194,7 +198,8 @@ static int sysctrl_process_frame(struct xe_sysctrl *sc, void *out,
>  	int ret;
>  
>  	if (!sysctrl_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
> -		xe_err(xe, "sysctrl: Response frame timeout\n");
> +		xe_log_err(xe, SYSCTRL, -ETIMEDOUT,
> +			   "Response frame timeout\n");
>  		return -ETIMEDOUT;
>  	}
>  
> @@ -249,13 +254,15 @@ static int sysctrl_receive_frames(struct xe_sysctrl *sc,
>  	if (!XE_SYSCTRL_HDR_IS_RESPONSE(hdr) ||
>  	    XE_SYSCTRL_HDR_GROUP_ID(hdr) != XE_SYSCTRL_HDR_GROUP_ID(req) ||
>  	    XE_SYSCTRL_HDR_COMMAND(hdr) != XE_SYSCTRL_HDR_COMMAND(req)) {
> -		xe_err(xe, "sysctrl: Response header mismatch\n");
> +		xe_log_err(xe, SYSCTRL, -EPROTO,
> +			   "Response header mismatch\n");

maybe we should print the unexpected data from the header?

>  		return -EPROTO;
>  	}
>  
>  	if (XE_SYSCTRL_HDR_RESULT(hdr) != 0) {
> -		xe_err(xe, "sysctrl: Firmware error: 0x%02lx\n",
> -		       XE_SYSCTRL_HDR_RESULT(hdr));
> +		xe_log_err(xe, SYSCTRL, -EIO,
> +			   "Firmware error: 0x%02lx\n",
> +			   XE_SYSCTRL_HDR_RESULT(hdr));
>  		return -EIO;
>  	}
>  
> @@ -381,7 +388,8 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>  				      cmd->data_in, cmd->data_in_len,
>  				      &mbox_cmd, &cmd_size);
>  	if (ret) {
> -		xe_err(xe, "sysctrl: Failed to prepare command: %pe\n", ERR_PTR(ret));
> +		xe_log_err(xe, SYSCTRL, ret,
> +			   "Failed to prepare command\n");

nit: do we need to split the line here?

and maybe it is good to know which command actually failed?


>  		return ret;
>  	}
>  
> @@ -391,7 +399,8 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>  				   cmd->data_out, cmd->data_out_len, rdata_len,
>  				   XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS);
>  	if (ret)
> -		xe_err(xe, "sysctrl: Mailbox command failed: %pe\n", ERR_PTR(ret));
> +		xe_log_err(xe, SYSCTRL, ret,
> +			   "Mailbox command failed\n");

ditto

> 
>  	kfree(mbox_cmd);
>  


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E764DC4452B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 17:12:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9067610E369;
	Tue, 21 Jul 2026 17:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IWAWFoH9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E8210EAE9
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 17:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784653920; x=1816189920;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=o/QGGKrg4cPxMdGCTbe6zNi4f7Fs6Ant/p9v8jGt+5o=;
 b=IWAWFoH96jsc5v8dZGHP7qEFvyjG+V6/Z3ts52l+JuyJqNV9fT0tJqT6
 ARbWoKAv8LS1xZooQOMZ70/W1ettPivqQnSq+KuvjgMumFE3vcv+DXrDX
 QYAzIAFlBSaHfw1tCVw9n6aaNjnskx5pwaR3Kc7k80IW2GTMas9nmOoK6
 GGvGrl+QZQAmL2ef9TQzb6dv0Mwc505g8LWNDlaNGKG6unF5RkyE8APYM
 7jyk6eZ9DvRf8TQjGYgKFCFcThmBxrNFhJ5BmmDx6Zxv2GkZHZrJtJEkb
 ifofnyufpm+WiugM5TNXPeVHgC9Ea2EyHQP7el6gMcDNISVDuAa4eSF5b g==;
X-CSE-ConnectionGUID: Yetjq4rcSPSYAFiuYT2gew==
X-CSE-MsgGUID: TjNiMQQtSMe6UTF49L986w==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="108052666"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="108052666"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 10:11:59 -0700
X-CSE-ConnectionGUID: awp9nQBhTRKONgwB+1/tlA==
X-CSE-MsgGUID: l+qUH1JlTN6t7aBgZtF4Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="287860849"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 10:12:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 10:11:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 10:11:59 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.52)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 10:11:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OIKIf/7105B6YpFH0vukox5DnBpC9g3Jbki93j9R0iBsoM67vKTH7P8kr+ZVb+BFAO4UuvokEiV/TBnw1nvAXjzmJOIrrR6EqeG+RmXcz/zK4EFSkKKEgubTL13AmoDOxBh3ja3awCNvOg5MOgR0f1HSjbsD/Vm/dGsunFNNNG4W9XX0Y1F1mC8Bg3AnFry+ieTaz+oCbAgcTiQJ+hBYaO7tsSAfkfCJA26YmXCgEVZdQiHuY4Z16bgKnGbFzPCTL3WTUKaLAdO0cEbGp7YkmrBE5vZvhuuLSkiw4IllKoHe80Xw4SCFoJzpUgoYVMYUBspx9iKBBMELC+qehhu+eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cetWm8CSDaTB8k8AqJj/5vN9JpAM3xzS/fM1Xl2y9B4=;
 b=raXlcTmakEsTPLjN9aLrodVa3qQ5rjYTQjtuRleC5zAYhdtUZDX8CAaY25SLfF9KTKqjB4IX+09198h6mP9zO5x4x/8qFG9R3wA9UbRyH9rjPeSSnqtdnM2iRdYXQ4Epf1T/S+flpwQrB2lpDk5e7nYoc5Ge0WUMtzbp+VQ5Q5dD1Xd6tkGjPcHp1MLYYaxF/v6oFm5lcaKg0VvjUCR01ihCi7lS43IREMiP2IFak773VFwEetkcqr0OKUHOBdvxTLo+4aGR1X/YFuVK+6fgaCtDMcd5e54lNw4FScts323KLi6PFE5eoUoNURKPFeYZfmQ5M3Zv4SoyOqRhmR4OhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS7PR11MB8825.namprd11.prod.outlook.com (2603:10b6:8:255::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 17:11:50 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 17:11:47 +0000
Date: Tue, 21 Jul 2026 10:11:44 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <mohamed.mansoor.v@intel.com>,
 <kam.nasim@intel.com>
Subject: Re: [PATCH v1] drm/xe/sysctrl: Detect oversized sysctrl mailbox
 responses
Message-ID: <al+oUKNAoxkKtSWM@soc-5CG1426VCC.clients.intel.com>
References: <20260717082657.2466495-2-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260717082657.2466495-2-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MW4PR04CA0368.namprd04.prod.outlook.com
 (2603:10b6:303:81::13) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS7PR11MB8825:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c702ef2-0f77-497e-6fcc-08dee74b2574
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: Df/i/gdkdUBvPWsgP1WJyEg2qY1X90MP9SItpZlGiW5OmV1V92XOyPZmg6dEMd9Idu4oghVMgfQnD14NjEUkWBoMQOdgBrNlwnLz0f6LRcMu+eFYB+KKedGBcvafunBINHdW9FbCDqSp7oYkeRdeq1j5aU7knqhQjnmvaSICpE4426vyTWAl4EZJZWHUn/no/FWZz1eroDTwiYyKCfPFE3nCybr2l348zNjN7KpwSWLRJ9OulPWrhW2FhfGVSQJ0XhrqjH1PMoLUPEJ5+2Gq9N28rCi50bbRx082eWlwF3KMloCuQU//zCoQdlaJ5wL9/J1ofSmiumJEpqdQmbkIPLKXec35NH+xNIG8n7UYfySX4k3+fIcr5ONzheCeAjw1DoJhbPJaghAPhqZOno49Qx0q9mytGE2i/u3+IVLHcfc1MSBex8JVhUVJpYnK3UV0wuJ9jyJdXZAFZGQMFKn+P0GS7LufSUOY1pQ5tFLL64T++q6SVhJ6G8NkqXEchKYaZkVB7SrkeipT34VlZ+AKzcWI/MKtjFr5YpUMzvlie8dwGlgi099j4E9hBOkqEeV5DYoGe3RRxd0GHFv8S9Pv9cpd6npgLw7asDMESrmVTUnicKUrcNZCYS5fOWEe5mGIhp9jAppNLGOiKdi2CJgb3pkC8lQEJnWu7GgpYHkAJMQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGlSN1crODBkNWw3R05jK2xRaVU1S3poSnRrWmExRTZMMm02RDFwbi95VmZM?=
 =?utf-8?B?Uk90blBFNW01c0ExaVNmOWsyOXFVSnVTR3lDeFQrZS9QcjRnT1AzeG5TUXQ3?=
 =?utf-8?B?b0xsNzNtOTB4MmhOaEhKRTEzTFlKWXpjdGhPYjRRRG8xa1lNVC9nMUxBYXFy?=
 =?utf-8?B?bDdBb082Q2xyaG5tWkpaTCtYVit0Z3dvTUpncERFeitVemIwZXQ4Y1hxR1M3?=
 =?utf-8?B?eStrQ015QlVuVTA4QTBMR1FmY0dFS2JDUlBRRW5vRXNzL2ZmdC9DSWlmdnVl?=
 =?utf-8?B?QjloS1h0VTA5NTU1cVBncFBwYzVqVkhzKzhaU3Jmb1ZnNEVqbm8xRVR4K1U2?=
 =?utf-8?B?SFV1TmZUeHpWMXVvVzQzajFDNnBJTy9VaDF4QmdxMUc3UVRxeHgxOGJnRm5S?=
 =?utf-8?B?ZlFXY20wTk9GQ04vR0hOMmF2MFY2MEhhY0Z1b1UrZ1NPTDVBUlhHQXBjT3J1?=
 =?utf-8?B?Z1pQMGVJVzVzOVNqVy8vTExmRXNmNDFNQlFqQjFJR2Vwa2llVndidGZBNkNB?=
 =?utf-8?B?bzNzZnpJTVd5QnhKVzVsK3hrbnNFTHpiN0ZFYm5YQzRvNXdqUmQ4eUxYQ25O?=
 =?utf-8?B?Q0hQT0QraVRyVFVEeUoxYnV1MldTT3VBMmd4TW92SlIvQ0ZEQUdxKzh4Y3lE?=
 =?utf-8?B?bXlTM09SazVaZGpmUlNoaTBUb2JvRUJ4MDJjMUs3bkNoV0pkZHNlVCt6ZU5U?=
 =?utf-8?B?UHVPeWoyc3pTQW1QWmswZGQrWEEyLyt6K3pkdEJUR1JhRGFoWTdJQzdOakRR?=
 =?utf-8?B?VGxOT2hrRHZNNlNVV05BWDVGaWtWMmJTZ0RWSDg2Vm5McTh1Z0tSNy8vUVgr?=
 =?utf-8?B?VC9MY1Q0czgzTU5Od0ZzWDRHWnNrV2dqYk1oWGtnT0ZuelRSVVBkaWZKZ0dl?=
 =?utf-8?B?aWxibVk5bmNDKy9HdDZvTFhIUk0weEIrTWZMdXN5YVhqRFV3aFZPRFJrdU1p?=
 =?utf-8?B?NlJ3eXJrZmJnZEVFbWplTllmMlVWS3lUems1Q1FRMHhhRmdadXZwR0paOEln?=
 =?utf-8?B?dFpyMnpyZjcrYmVESmd0UVVMYWpLN0FTUEN0M3BEd0h4RFV4QmMrWENhb0Vp?=
 =?utf-8?B?dTVGZ09rYVRJSGdORXBWWlZEZ2FURzFhYllHclRuYVp1OFRmUmpzaUJPQk1V?=
 =?utf-8?B?TUJMYjhOSGhqdGFwbkdVU01WMlRFWHFnN0QzNkx0S1FBQWZQK2ZuU1BxU1Bl?=
 =?utf-8?B?N3p1bW81TnhRVnBaRytvQnVHMUVrVzNkdFVkcVR5NDh0ZWpuVTAzWkR3QXV1?=
 =?utf-8?B?SUxwZ3pxUEtPNWtSWFZvSEdQc3JGbnpTMmE4WXlJbUFOakw3bnMyWUNwampw?=
 =?utf-8?B?SHI3OW1CaHo2NG54YXFuaDRlM3pwTkw1ZXdydWRYNncyWEZSa1BwN3BQWVRa?=
 =?utf-8?B?ZHZidkFxblJLcDM1OElOeDBnQ1JDM2VLdE9qa09Bd2N6MlBNTkt0V1l2dHFZ?=
 =?utf-8?B?QXRNR3dFcnBkM3lQZW5ORHpML25SR0NGeWhScWRVK1F3K04yNGFmalhTaWR6?=
 =?utf-8?B?a1hpcFpGckNoZ3gzQ2xxOHVkdG90ZmxWazNSd3R2UWpnbDVia3ZXNkZOcHk3?=
 =?utf-8?B?MzR1ekdLT0ZWSUJXV0hOdXhZekZab2NkWjNVZjZCVitIY2hnOUx2U002R2tv?=
 =?utf-8?B?ZGt6Y1NyTC80ZGVkR1ZvcVZHdlFmQVUzVVFGc3pOWHJXYTBIQjVuaUhwdGpt?=
 =?utf-8?B?TWEvREZaTlpSSWtxWXU0MjNyN2x1RzhiODd0d2RCdEpoOTE1cUFQZVNVaGJi?=
 =?utf-8?B?ZGcwdUZJSDJDK09YWTl6Rm9hdEdtQlp4SlBBTnNGMjJENGVFYnBpb0ZwRE0y?=
 =?utf-8?B?OXFVQUhXTnAwR21wOHJ0aXVtaTJFaHlPeVNSYUIyVDBqVmRXcTR6b1JncS9T?=
 =?utf-8?B?MGxpTUNaZ1ZKOExxd3dJRk1Gay93OW9xOWVweDU5KytjTU01UGU0cXE0R1Jn?=
 =?utf-8?B?WU03bEZpWktOSThNSGVEdXRYempoL3E1N25DV1FyNnRoK0w3NWtEeFJuWlR5?=
 =?utf-8?B?RXpnWllFR2hpeXNJSnhoNjh1Q3hLVGc4b1hSVnp3ZGlMMTd4SzFLYkZsanVr?=
 =?utf-8?B?RjVQdjh5RHRyVERTWEZITzgwai80Sjl0elBTa21lNWFHWFpjNFpJVkJlQ0Ez?=
 =?utf-8?B?QWJoWDYyYjRTdE95ZTk2T1JDc3l2V1E4c2pBN1lTRHFLVkhUZWp3Vm9pMS85?=
 =?utf-8?B?c2IvVEUxYVBSeExQbXlHaXlNMXA2QzJsa2hyaDVRMEdEL01xSmg4MmV1dytT?=
 =?utf-8?B?WERIdlltb3BwckxwKzhrRDlIbkdlK3NuMk5nM1IvTDM2U3pxUXl6RGN1Y1k5?=
 =?utf-8?B?N0dxVEFIUkJ2cTVlWktGa1VNN2FDek9BQlpsbGhZRXBiMXYwb25WVmRqWmZy?=
 =?utf-8?Q?8hUTa96AHoKRmBto=3D?=
X-Exchange-RoutingPolicyChecked: AZ979L+egr9gVw7XRlSF6FQXcDOigeHAofFzJXUwmnXIdH6oxEkJvaAh2bgm3O+BdfHzLSsRQU0BDPjOCrrfbsrJRc+OrBf06A5KxLS11WTVd0Pv+HsCnkwp0TDbUanSIw6ngekQFxXcQF2yTNXQgvxUV2mPInP/8rX9tIHlD0AMfqQpzkmIALBlVYogWns7OFr5HeRCAxfKSwKACVzYVPBQXMHdyxOhKUDzXttJ1ZJQi8p5/lIfveIJlvNrSxiiIkClE8l3b/HNcaEQjvL0NSA0fbzV6JbzrdKrWct6oxSIrHKl457SE7tmvA/51GaZvnmPHvoOqcCdcYFY8b5QAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c702ef2-0f77-497e-6fcc-08dee74b2574
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 17:11:47.2893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 98NUS1kQyyY6RW98FOA3UaPaPWMrkyKB6RD8NQ8E+9YrhrhFTPssvforVYAAUpZN27Yh/F97m9kYtB0GFTiN7MER3hsc6LPWmaAE1X6F3+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8825
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

On Fri, Jul 17, 2026 at 01:26:58AM -0700, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>sysctrl_receive_frames() currently returns success once the caller's
>buffer is filled, even if the firmware has additional response frames
>pending. This can silently truncate firmware responses larger than the
>requested response buffer.
>
>Add a check to detect this condition and return -EMSGSIZE.
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>---
> drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 5 +++++
> 1 file changed, 5 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>index e13eebaac1d0..37ed05ac0236 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>@@ -244,6 +244,11 @@ static int sysctrl_receive_frames(struct xe_sysctrl *sc,
> 		out += frame_size;
> 	}
>
>+	if (!done) {
>+		xe_err(xe, "sysctrl: Firmware response exceeds expected size\n");
>+		return -EMSGSIZE;
>+	}

nit: s/Firmware response/Response/ since most log messages here assume 
you are dealing with firmware.

What about the case where FW returns less than expected data? Say user 
asks for 10 frames, but FW returned only 3. Since sysctrl_process_frame 
only deals with SYSCTRL_MB_CTRL, it could set done to true after 
processing 3 frames. The value of remain when you exit the while loop in 
sysctrl_receive_frames() might be zero in this case.

Regards,
Umesh


>+
> 	hdr = (struct xe_sysctrl_mailbox_msg_hdr *)buffer;
>
> 	if (!XE_SYSCTRL_HDR_IS_RESPONSE(hdr) ||
>-- 
>2.43.0
>

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E5F103E19D
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 21:36:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AAA610E449;
	Wed, 18 Mar 2026 21:36:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WhVPiIj0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B61F10E449
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 21:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773869791; x=1805405791;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Sbi9jnT7vK67jZ8upphtiUljhYucryHj+TobgFQwt7M=;
 b=WhVPiIj0P5jh2rD1DRsWJh06nxVgeD/4fzY3s+PStawYwvHzDlYEWCNl
 +cRUY5SsxBqLWVFJK51npBIvOrjnjXRjdPx6tsMzg6I24qHhRT9DKL6Y2
 aSsjLzqVPycA9w5n+X0aBLLT5pHLmeuR0q2cuIRT5jIGGEwWgobNb51S1
 qdzzhUvH5UIXzYsKmfeLLQDsSeH+xsLA0+EqiV6NIwrctONcyakhBa5pv
 URVAEdCqeeIzGCt/JnroVYOTXh4PKz1maU42+DU8k7dY7gSaqDYRbRhoT
 GWtBXfSvK/UxJDt1JdaeP0DkMrU3BIaVn5v9Z1dKtbhzsDcKrDV1sAPgp Q==;
X-CSE-ConnectionGUID: Z4ALaDyuRV2OCSVrbPhlSg==
X-CSE-MsgGUID: 1N0WJ7tbTGK6aC9hB8YPXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74851115"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; d="scan'208";a="74851115"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 14:36:30 -0700
X-CSE-ConnectionGUID: owLSzBCcRP+ssz5bYU43CQ==
X-CSE-MsgGUID: KJMCEd9yRb+I5SoWCoMGZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; d="scan'208";a="222982550"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 14:36:31 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 14:36:29 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 18 Mar 2026 14:36:29 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.31) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 14:36:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xdpu6AKU6LrorXBCFzO+0gtQnv82ejWtpidgdY3wxA6HyeSD5Dtegn6+qyO49wBSjnDSYOJ3yirLptdgWhfv+Qtczbs/gOHCd2jtLtiA4y3WgPPT6udRpOtTo63QcnU+Msw7KcoIjXiJdux8xcdvRzEHUU4GIWM11+s+mrzsy7PLKSuTAt3FmL3M280Sp49im0KRgG/9ER2jbO8/rJrf36DK3jF7Yrz2tPcKl2kQPu+Aeu4iCh9yczM3ayWox40l9qo4QsfEtI0WzZf8L1uuL3uyd4SdobD283Bo6XtGHsetaJDFzZoBQ99qWRUAqi1gJwzIEHs/u0NbkUJOgwBnKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJNHGXkJoVM1BvL/5+0/TvnNlMyN3YPap7bjTXCSL1A=;
 b=Pr7GkBdE9v3JYdqNz4ZOM7clv7rdhv3SrWMxnad0gjtKa8tejUKoJMbwjPLrTKpoxV+KP4GzCTcIIj6AB9h8Idq+OkAocHeaf0jHyax2qaHqxpLDEZM6nFyoF8SRzCJq2+k3YeI5Y700fc4rOfqQEiUDIYpgEMcgdV0UWwxhWkruDHXgA9cR3Zs+zQQpbI+G3zoDGpdcLWDborxdMG7/wnqG/64S/65pHufnGC2VdB4fW6IKHpSLqXRk9yAsEAvLUAPRiwBlEr23lrKRLUl60A9RfOk1vmvUNX2jKdryBKoLo0YOpjPtk1XJcrNeB5Yeb7oj4VcIqm7aIYSpLunJxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by PH0PR11MB5144.namprd11.prod.outlook.com (2603:10b6:510:3e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 21:36:27 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf%6]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 21:36:27 +0000
Date: Wed, 18 Mar 2026 14:36:24 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Cabral, Matias A" <matias.a.cabral@intel.com>
CC: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Degrood,
 Felix J" <felix.j.degrood@intel.com>, "Ranjan, Joshua Santhosh"
 <joshua.santosh.ranjan@intel.com>
Subject: Re: [PATCH v2 1/1] drm/xe/eustall: Return EBADFD from read if EU
 stall registers get reset
Message-ID: <absa2Oot6feAs_7b@intel.com>
References: <52d991cc7e8bec514bb582717a1c42033672d4a5.1773683739.git.harish.chegondi@intel.com>
 <87se9xpqub.wl-ashutosh.dixit@intel.com>
 <CYYPR11MB8360A705B57CE5CF6CFFCB6BB24EA@CYYPR11MB8360.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CYYPR11MB8360A705B57CE5CF6CFFCB6BB24EA@CYYPR11MB8360.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0357.namprd04.prod.outlook.com
 (2603:10b6:303:8a::32) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|PH0PR11MB5144:EE_
X-MS-Office365-Filtering-Correlation-Id: 844c1fe1-17aa-4a7a-4382-08de853668e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info: WiyouWyTnHif9y+Ck0L4d98bVG68RLXLwR0+IY2Ei6iFJK/CovojuThLSUnSB3o5lIcBDhXqCXqrguFmHyy+1kS+AjSz1e1QSubsMWgcNol4NY66gAiJXikPVY51N3aV1c5gpGLtuiHA1RKmk0CARhifUvUGlXqXwEcv/IWUKOGRjz6XIDfcSHyPGi7yndgFqiSeQ4NxKmwla4tqH2C7MTMJTWp566Iy2faM77eez9mj0x3sxvs8PgVkukxqedML1BJVknJZB00EyaN0W7doLbXJ3z1ENn5U1kStETu/Vk6gzQ7erxsx0If/z3ynaPaeFV2qO5orQ39bhC/mmuaaicDfhCrULyMbHL9rclPn4E2c5ENzrIrGA5ZqqnaCSEb9s1CeO857IQW6iyn6rPyqtKesqHwVReruEAFdA1nNFeZeTamEdiNGHj+Fvn9BylUS9rTgZ1rzPK0gbP6RDqGKF2ukbNbxp1Dv8XidsdzgDdTrzypFglnjuWYtGCibht30158LmpcVTPOEfiw250dJDiuLidvetaeJp5QfztrMvi2BahAJAVoXiACQ2lEYh7SWdwuDu+g2kX8NCmwhvuUAObzUKABYEd1rDcBae9xf1lyVgBWU670POFD5o9eVNkaaHbbUEqkz/aVx7zrGMeU70lNKSo7Q8JK7u7oJESNVnrJi2mT5RM+Xn9mW/CUO6r6wy2zMHzYb9cIwefHq9+vN6loK7x7jHfABMcaAltggjMc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ui9qRkloT1JPUW1yMllORU53WW9OWkZOUTB0MjllMlhYZy9HQlZqcDdSaGVv?=
 =?utf-8?B?S0VaWmtNaHNRZ00rQ0ViUU91NkVxc1A1K2RWbTJ3dE5hMDBCMWl2VUlIYlBw?=
 =?utf-8?B?Rkg1ZXFCakF2R3l2K1BFSmdtQld6K3RpYkRJUG9RS21nVG0rd25COHUvaVJ6?=
 =?utf-8?B?VFBoZys1VnF2RzJDWUwzK2l4MjN4TGY3SnRCL3g5RFJXR1pWaDZnRGdqUWo4?=
 =?utf-8?B?bWhRcHdFKytvS0NNdFdjdVVCeldZWjZGTDJvSk1FN2UxNFVCUjJlNmltU3cx?=
 =?utf-8?B?dlFpTDllYzkwNkJJMGN6QmZCejBnOWF3QUUySGJIR21uK1Vkc1ZTbU5xbXhP?=
 =?utf-8?B?YmhUdlJOZm5zREVqMWFqb3B2WVN1TXFhZWFESytSSnpEbXlJWmNJTTM0N2do?=
 =?utf-8?B?bjRDTWlod0t1M1JpV2lVU21BbUtmUjFJbE1paUpSdU9lUk96ODQzdTZxU0pi?=
 =?utf-8?B?NFY2eDFXa0JxU3VlSld2ZE5yNUk5V1BDY2I0VzN1WkxsWjl3elhwcTZTSUIw?=
 =?utf-8?B?aDV1cktyam1DQWFaRnpuNFJ2U0dYSUl3MlM4V1p4WHNRbGZ5blQxL2xKODdR?=
 =?utf-8?B?SXdhZFBNUW9FVTBhVVV3ZldhdzI3a1pkbGxtK2RQeXVDTmg3OTNlYjFNazhz?=
 =?utf-8?B?WUw0S0F6TzBNV2NpSVdsbWZoeUhHQnN5ZVQvcDZTYWNxbEtId0hVdW1DOXVo?=
 =?utf-8?B?WTJmRjhzRzJiOEl1SWU2RTNQc1dBMGtQZXhVZEJjV0hpWkxzVHpMdXZPSG1Z?=
 =?utf-8?B?S21pcjhrQkQ5bG1sVFp3QUNIQWFFVEtOaTVCWklsWGp0em1PUk5JdndhVzM1?=
 =?utf-8?B?WXkxdDdaempWM1l6MWV4aWQvbm9DeHk5cHFBYWpsdkNWZzlCaFJqNkI2Sm1G?=
 =?utf-8?B?b2YzK2RmbkNBOFJZZmZRVkNUeW5LaU14MW9YeU5lVnNadTdzWFUzQy9JK0cr?=
 =?utf-8?B?N3gyRS9rSzYrVnM4bUpMejFHOEIxdDZvemNVUEx3MndWc0xDNmUzN2ptZzQr?=
 =?utf-8?B?bEplTFZOMWVtM1NmQ0Urd0xnTXRtYkl4VC9RZk80NFBFcnc1bXhaVzZFdUoz?=
 =?utf-8?B?MlJZbzJ6TkFxQmFwR1FiSkNqR3JBRVA0akFMYTRGOERuTWtNUnFuMlVWQk5x?=
 =?utf-8?B?b3BuRDY3TzdHeHdudnpITEJPZ3AzeC9UK2JnNGhuRzR6SEVUeXZ5enBETHhQ?=
 =?utf-8?B?ZlorWnczcEUwdEE2TVdZUXJzQ05lWlJxWTlEYzhVVytPWWxEMGNSUVJKdVNt?=
 =?utf-8?B?NWJiN2ZZNWVoZlJmNXJHWGg3TzkzakV3d2ZCVkZ6dC9ld0czWHlMVWxjckJJ?=
 =?utf-8?B?c0ZMN2Rwd0lrT0xPQUpFeHpuSFlnR2Z6SGl6RGdINGFyeEdtSXlqL01oY2Q4?=
 =?utf-8?B?T05VaGxwRnJObEZjSmVycnNFUitibmJjUTFWZWZQNnpWQWdQVzdpY1c2cG5H?=
 =?utf-8?B?T3FMaitSNEc1S2libitMb29kUmxKZUtEZTA1N3dvYWdXMlpQNi9FRjRLZjd4?=
 =?utf-8?B?aUd3dVhpYWM5TnBvOUFNV1pXVVhodWtWbS9lZkpZNm5GQ0Eybk8veWJxb0o1?=
 =?utf-8?B?dFBJaERNdVFyVG5NSzVEMGd2Ukxwc2JNeHVJN2NWWnV2NWtmODU2R2VhcEhz?=
 =?utf-8?B?d09BNk9jVEM2Qmw2c2gyemJIc0VPSkxiOHBmMjU4YTRseDVaeElrRVNOcyt0?=
 =?utf-8?B?Y2hITURJbjk4NFNuUyt2M3Awd04vZVZBVGVHKzExdFRTbk5aWDRHeUx2dTYr?=
 =?utf-8?B?OTgwN2ErZWJSUnhQTDJqS2V4VVVrWWVvbnZIemJkUDhHMjIrSUpGeW9wOUlT?=
 =?utf-8?B?NGUvcHZrZGVFV2xwZXVTRFVBdS9RMG9kbWtsV25ZWEppQ3ZtL2VXV21wY3Vr?=
 =?utf-8?B?ZCt6WlRJTkJ5VnpNZUlRRVlSUk9tNnpVamtpaUltaWlNaXkyOVZFWktCVUtY?=
 =?utf-8?B?WW9idU1NSHE1R1hUdXQyNGtxYmIzOTRxblNQWEc0bnNXQUhyckVLNkJsWjFQ?=
 =?utf-8?B?WmZRdFRsTWhpQUNOSlNXVk9Nb1ErZzFOcUtsWFAzSkpsb29UbktvOXNiS29N?=
 =?utf-8?B?WDNuTDNIVlNnRlRaWE91MTRTY1BoRGxlVndrQUtzK2ppZUNFQXpaUzBweks2?=
 =?utf-8?B?bEE3ZEhmdkh1QUJYUW5YT2txSzVjNlhVQlNFVVVIcHF5SmZTMkJxaWRTRmNJ?=
 =?utf-8?B?MlJuc0NPbnkrTXVjbzlHdWwwQmhIN0FIR25NRWlkTHg5cDluMFA0OXp5NTRF?=
 =?utf-8?B?TDRYcVB2a21YcGJGNVdhUkhBVlRjS1ZHeFptY0tVanV5WFpiNE41N25Td0ZN?=
 =?utf-8?B?N2RjZjFZcmRRS2NETndSQnZXQWtYdFgyV29PUWZkS3h0clpNZWRnQ2ZRZ2g4?=
 =?utf-8?Q?sE92i/1kNDCFf/BI=3D?=
X-Exchange-RoutingPolicyChecked: NwfkBAEQkYFGv3MXLD0WpJek1G417wTLB2VptN352dUokhKqWItTQsusE4SeLJddpfr7orHzXyc5HuBxRCaBlJxhslKcHnoqV4sA6sNl4DYrAklmPuku2fGdG3LvILqqPc54UTzJQuNw+xZAapekYNm2f+uNHskjXw2z1EmxlrZswXMkE0qVp3ax3jv1d2SsvLEPIKMbD7hLeWCRtnW/uxWZ4tc63LU0i6tRzXWkPQ8C0QAQ/fKMSYYr4BhmJJcIBpB2wm4yoT5BQ/vzh9x0ldUCLKWIEbPVWt25CoQ0DA2mb+UyE18YS6jbl3SMZgTgkhzEFHcdKVWfC6tHFpFWzw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 844c1fe1-17aa-4a7a-4382-08de853668e7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 21:36:27.2431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C3I8NXRXajCBY/0hRKhsnxdGxq36KYyCGy961RsADSmA9CyZUaJcHcdVicARAzApvWAdBN1DHBJiDeJQP54Q5mzjfo4GNlQ3EZZEeYN4q1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5144
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

On Wed, Mar 18, 2026 at 09:59:04AM -0700, Cabral, Matias A wrote:

Hi Matias,

For UMD, read() of EU stall stream would return -1 and errno will be EBADFD.

Thanks
Harish.
> Hi Harish,
> 
> > return -EBADFD;
> 
> Is this making the read() syscall return -EBADFD or setting erno to EBADFD ?  would like to clearly understand how to detect this condition in the UMD. 
> 
> Thanks, 
> _Matias
> 
> -----Original Message-----
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com> 
> Sent: Tuesday, March 17, 2026 11:58 PM
> To: Chegondi, Harish <harish.chegondi@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Degrood, Felix J <felix.j.degrood@intel.com>; Cabral, Matias A <matias.a.cabral@intel.com>; Ranjan, Joshua Santhosh <joshua.santosh.ranjan@intel.com>
> Subject: Re: [PATCH v2 1/1] drm/xe/eustall: Return EBADFD from read if EU stall registers get reset
> 
> On Mon, 16 Mar 2026 10:58:56 -0700, Harish Chegondi wrote:
> >
> > If a reset (GT or engine) happens during EU stall data sampling, all 
> > the EU stall registers can get reset to 0. This will result in EU 
> > stall data buffers' read and write pointer register values to be out 
> > of sync with the cached values. This will result in read() returning 
> > invalid data. To prevent this, check the value of a EU stall base 
> > register. If it is zero, it indicates a reset may have happened that wiped the register to zero.
> > If this happens, return EBADFD from read() upon which the user space 
> > should close the fd and open a new fd for a new EU stall data 
> > collection session.
> >
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > ---
> > v2: Move base register check from read to the poll function
> >
> >  drivers/gpu/drm/xe/xe_eu_stall.c | 24 +++++++++++++++++++++++-
> >  1 file changed, 23 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c 
> > b/drivers/gpu/drm/xe/xe_eu_stall.c
> > index c34408cfd292..7e14de73a2c9 100644
> > --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> > +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> > @@ -44,6 +44,7 @@ struct per_xecore_buf {
> >  struct xe_eu_stall_data_stream {
> >	bool pollin;
> >	bool enabled;
> > +	bool reset_detected;
> >	int wait_num_reports;
> >	int sampling_rate_mult;
> >	wait_queue_head_t poll_wq;
> > @@ -428,6 +429,17 @@ static bool eu_stall_data_buf_poll(struct xe_eu_stall_data_stream *stream)
> >			set_bit(xecore, stream->data_drop.mask);
> >		xecore_buf->write = write_ptr;
> >	}
> > +	/* If a GT or engine reset happens during EU stall sampling,
> > +	 * all EU stall registers get reset to 0 and the cached values of
> > +	 * the EU stall data buffers' read pointers are out of sync with
> > +	 * the register values. This causes invalid data to be returned
> > +	 * from read(). To prevent this, check the value of a EU stall base
> > +	 * register. If it is zero, there has been a reset.
> > +	 */
> 
> As previously discussed, the best way would have been to not have to do this. We would just plug into the handler for the reset message from GuC, rather than to implement a reset detection here (and in other places such as OA). But looks like if we do that, because of the way EUSS registers are reset, we can return bad EUSS data. So looks like there is no way around doing this "reset detection" here and a solution with the GuC reset handler would always be racy. Just for the record.
> 
> > +	if (unlikely(!xe_gt_mcr_unicast_read_any(gt, XEHPC_EUSTALL_BASE))) {
> > +		stream->reset_detected = true;
> > +		min_data_present = true;
> 
> I don't believe we need to set 'min_data_present = true' if we are setting 'stream->reset_detected = true', correct? See if statement at the bottom.
> 
> Also, since the write pointer itself gets reset during reset, didn't we want to do this register read only when the write pointer is 0 (to avoid an extra register read every 5 ms)?
> 
> > +	}
> >	mutex_unlock(&stream->xecore_buf_lock);
> >
> >	return min_data_present;
> > @@ -554,6 +566,15 @@ static ssize_t xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *st
> >		}
> >		stream->data_drop.reported_to_user = false;
> >	}
> > +	/* If EU stall registers got reset due to a GT/engine reset,
> > +	 * continuing with the read() will return invalid data to
> > +	 * the user space. Just return -EBADFD instead.
> > +	 */
> > +	if (unlikely(stream->reset_detected)) {
> > +		xe_gt_dbg(gt, "EU stall base register has been reset\n");
> > +		mutex_unlock(&stream->xecore_buf_lock);
> > +		return -EBADFD;
> 
> The other option is to return -EIO here and implement DRM_XE_OBSERVATION_IOCTL_STATUS and return status from that. Let me think some more about this.
> 
> > +	}
> >
> >	for_each_dss_steering(xecore, gt, group, instance) {
> >		ret = xe_eu_stall_data_buf_read(stream, buf, count, &total_size,  @@ 
> >-692,6 +713,7 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
> >		xecore_buf->write = write_ptr;
> >		xecore_buf->read = write_ptr;
> >	}
> > +	stream->reset_detected = false;
> 
> So after reset, if a stream is disabled and re-enabled, we expect things to work again and EUSS data to be correct (without re-opening a new stream)?
> 
> >	stream->data_drop.reported_to_user = false;
> >	bitmap_zero(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS);
> >
> > @@ -717,7 +739,7 @@ static void eu_stall_data_buf_poll_work_fn(struct work_struct *work)
> >		container_of(work, typeof(*stream), buf_poll_work.work);
> >	struct xe_gt *gt = stream->gt;
> >
> > -	if (eu_stall_data_buf_poll(stream)) {
> > +	if (stream->reset_detected || eu_stall_data_buf_poll(stream)) {
> >		stream->pollin = true;
> >		wake_up(&stream->poll_wq);
> >	}
> > --
> > 2.43.0
> >

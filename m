Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186A2606A331
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 19:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lRQX4h5t
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5DE110F1F9;
	Wed, 11 Nov 2026 19:55:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C609910F1F9
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 19:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794426923; x=1825962923;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=z7dT6sAI0joCsm0x/jue4+aB88q8auQwQXRXfvQw8I8=;
 b=lRQX4h5tEoI0I+euUHwZPiETfV4VlGMgxH+c5yY2AfGX5Itjj6rLZIEy
 kJpygW9DQ3RJRK7NnJ3QqraLArENg5CkFCCMbrm6LLgaFpBKXGA8vtOmb
 jA/vWTPVH5OQ9dQBycESKbGGuKjvQPAJmk5lWqlaKREfLv6VGJTUunzBD
 R+v/CKxx8oCQ8Ew6Ke8IVXqYWySLRy6q69JzCYE/RrhNau01Z7mg3YlVk
 fJU9i0dYvpEGD5rDURYx+evxURC7Oz2EMbte+R2uYyZSrbTNd/KuVbEC9
 QQKNJ07UOOIZDVJAhhunqAEg+EhmVViKvty+lLgynkp4Tsu7UbFrf3b8o w==;
X-CSE-ConnectionGUID: Tyk3b8QAQ9KhT7+z/rYFLg==
X-CSE-MsgGUID: 1fmCgkI0TQedM3euTYfFkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3200090"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3200090"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 11:55:22 -0800
X-CSE-ConnectionGUID: ZQcOIuo4RUCJKZAwPN6JQA==
X-CSE-MsgGUID: 2nYbduHNQ6+cfZpynaqyfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8659342"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 11:55:22 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 11:55:21 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 11 Nov 2026 11:55:21 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.66) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 11:55:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WTgfmLkQqIif4d8kdlJgbUxq5tApc94eQJcvawMe+zeHkATLwF2h4e3SpDc6dJzzK3F0Fe5nBtPtk6jC7kjKPopAaHeX+G5Nf6eh50SmMZTXn59MqzKfBictGKqHUxbl1YDgO/q19hnzpXMXLkm/7MYExikFR2M9VzG/sVQR6ehMtPNEkHMlTnMROvZdpp2urV4vj/41GRY7tyK3aAqytpodPiagmKl8dIJ6PIvnnAi/X3cyzn6q510/rRCJl79Xehv9uSijbvuFud7UfQoO/lTXJbmOAvTZyxhp8GZOOWmmWGs5+K0HqVVpnbZA/KgjdFPfC0Zfh0xCP7TOloE/KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=reW7i4tMzlzrGDsubtot55QT4p7xNou9egeLBE3J3JQ=;
 b=GfnCmngMHIEgfD6pyy4bo0fUPIU/yrRwUmTfHk+xVOcNc7Ask2PgREwBFtX4TP85V67gS31o/1dzdAbXej0MCR2CHnNcuGcFN5ScYIsF+IcJ7tR1chbVKZR5YWZccVdsfzfH68OcVOZrH79X2uac1D35IKt+NX+D9Ucq8J0aMjQGuh8FvHfEyxflB1V90PaRrbGVMayA+cN5NalUicxPqB6MkZo9Vg47xe7kJUgHU0OebPDy2zb3MMGmnTa+N4rhNaksU000DAykyt8g2DwiOou4UaSbfqiDx8525tWbfQefXpKfjJkOZUEBaV8jZx4nWYeZWRqljTBlYif/967j1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by PH8PR11MB7095.namprd11.prod.outlook.com (2603:10b6:510:215::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Wed, 11 Nov
 2026 19:55:17 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 19:55:16 +0000
Date: Wed, 11 Nov 2026 14:55:11 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <anoop.c.vijay@intel.com>
Subject: Re: [PATCH 3/3] drm/xe/sysctrl: Restore the SoC remapper on every
 runtime resume
Message-ID: <avTIHy8y9T3jcMnJ@intel.com>
References: <20261104215353.234314-5-stuart.summers@intel.com>
 <20261104215353.234314-8-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261104215353.234314-8-stuart.summers@intel.com>
X-ClientProxiedBy: SJ0PR13CA0147.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::32) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|PH8PR11MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: aa3e4422-33b0-475a-ff1d-08df402db4fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|18002099003|22082099003|6133799003|10067099003|5023799004|261028144727099003|4143699003|11063799006|261022075727099003|261009223027099003|261026121527099003|56012099006|261102123227099003|261021121427099003|261022105027099003|261021123027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: 8k+i4EAIkCbmwhjZmLuSTd6UYxokG1LjUyoCbxjKzMVPbn6TiCa60AopzZbwLSQ+fU2PsbyZ7BFH2Ar3Y5aEqzH5Zd/i9FXos7Vb0XJoKFzwHz7H7QcvsRMXJzlRvUWYhiPbGmfSpqdiPj4vkDzwOrKURcIdm9IHVldLrhAU4kYyBKMobHOoZflfh3NCN84JCxrwk34gjremQnS0r6KsFrTr1AVdYGMOdd7VUZlYS0VRU0Zh8mxUdrRJDaOnHCaZxTJ0xYvwUfh3+jc3iYwpVOh1KaF/+y21pce1n35uNN4eVk/NWx+0lpcTIAwoPupgU3e8H9htDw0flIXNswBM6xV0IDEYdFe2ZUtB2TVd8TcrGaL+XKNRMa7X2aq2EY5FZ8iiGpum1Wq5NM4e+9V2XnhXnuoJ8VQvuD+nCxf2LMdkIlp0SPZEq4hxhhXwdx1phSp1j66HArioUObSXH/JdFFIkr4gRYqMRjb8mWrM8803ooJoRixyxe/DFJViq7odxjjRCK2XnSRhx7GGJhhhntOJngZSDoWutifjdlUA2d8PkWRQ7DAr0Axa1Jreh0sm5v8qRykDzc1NE5OMXyQg2lFiyYZATVgo4T1ATP3JPGeoW85aOAd89TPNCUemrQsEepxzDvYbzyhGClnVzpST6VKmWAO0BbkLMkicDJlRUIk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(6133799003)(10067099003)(5023799004)(261028144727099003)(4143699003)(11063799006)(261022075727099003)(261009223027099003)(261026121527099003)(56012099006)(261102123227099003)(261021121427099003)(261022105027099003)(261021123027099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AM36j4F0oHVOMOFljzIQJQurMGtm1+hF7CdFc4lDVqVLY4SdDt1SpIhuOjJE?=
 =?us-ascii?Q?GdcIozo890imLiWQ/BzExj02iZg365hWAwfnS87NECV0E1VO1rSmPs2/U6xX?=
 =?us-ascii?Q?48n7av7YF7JmXbqaWbm+YCUKvsu+AGVIt+h66gGNU/4hleY5CHOEcDmTGY3C?=
 =?us-ascii?Q?rEFJrg3ALV87AHMTUJKw1tJfUgEtp79p5+B0Er9EFa+iW98JklYLuNfsnMTG?=
 =?us-ascii?Q?4j2eZjiZOMM3SW67p4djEGoJhY1XPneg6zG4AAqw4TmGRI444LZ7aEG/TuuQ?=
 =?us-ascii?Q?d+rE6ZpdT6zcZ2rLmecsZ+/XbpctZ7tUatVuLtnTzAJd+6L3TcCts01Df73M?=
 =?us-ascii?Q?x2rpXQ7JtujkGzqxm55jO9/d+yOWpfs+fnmKrtfXwW+zuKK0aQnulyXoJSkU?=
 =?us-ascii?Q?K5GWjj/nA0/RC6W28+uMoL6joeXbVoY1ISNBS0E6wGaPj9nAXDY0v2rQseIf?=
 =?us-ascii?Q?gg91n2UjVNcJfieJjYy6xXq4X5HCYl+s3ic6j6lj0MuUqUv5fV434caohhe/?=
 =?us-ascii?Q?J0N/uYrGWccRAZF0AjF6vGkTb2RRR2/gznqzTgQe4BSK5vKBYx8F8sH2ZQ7I?=
 =?us-ascii?Q?psoKKNOcSUUanFVEHg6BEw0W8zR5W7+8XlRmXx39lcZ0QUogZDoqdczUzMow?=
 =?us-ascii?Q?QEEpZb9RhALNB5iCXflmY3Dh/CIXnwHpi1ZU0yYvmTF5bi1MtFcYzEoRY6j8?=
 =?us-ascii?Q?SyYmK4IM5vJeAoUEhJQH+9ZCg2qeUZvq9H2RkNNnFk1vC2r3ugGBOL8DaDbA?=
 =?us-ascii?Q?S7X+BMHRrHR0Lt6CxcxhBsp6SHtvXdnZTErn7qYazPIdJHz197O6zLWGN0GD?=
 =?us-ascii?Q?TdMcmPPgPAKzF24KYT/devK7HTRABgC7byaLHhvIzJIceHi9LoprcXPTXpoT?=
 =?us-ascii?Q?LMV+18DhTiexQ3o5EjC+WJU2eJOXFxW3IQMqVJ06AcBTDWqOj3UJZxDJHUhO?=
 =?us-ascii?Q?Bo+6EJpWpYPJ3awuJsXNsGBYJ8BOX9JbDrOjAfjHYL+ypjCP4vZPqc7gWBxx?=
 =?us-ascii?Q?QKUIh3dDT6z65LhscmexToqB0P/6cJA5WzxYeMaDpVDsU9LKUTSdRigYSMC3?=
 =?us-ascii?Q?fIuryvb9QR4f00Y1xA/3NaCZOfDEPziD1mRyEHAqWFzKGS65PRcOM/2QZMvB?=
 =?us-ascii?Q?vn3n/bmFqjAQPyKPwnaVyv4QHJ3aULRs/p3Yvj1cFlESNcgCMdFHzTX3i2L1?=
 =?us-ascii?Q?4ot3TKg6A7d15UbGwvA62DIAK5eJSOxjLgi95OPoBHK/J0Fn1w5sthGQFIfd?=
 =?us-ascii?Q?2t7QxVYxgMdj80LbgjOxlZYj3xDBgj3QjFpdnOFHgTWEmPX9eF0nQviA3eS4?=
 =?us-ascii?Q?Nmm9glUXwFFKiPa6K/yOi4GN5jTVEz0ZZCb8tw8B/xHlvmvZh7GVz9WWHWjr?=
 =?us-ascii?Q?kD7b6BXMxtDB1/Rab6pgTzAh0rVryJDOZBHsdgMcbMATSkg097TMTFxza8lV?=
 =?us-ascii?Q?N2bqK+5s/I1OH0tCacWWQGXLO2UrS83yz3k4wu3fgKRAOxwXO62XaXAuP6p0?=
 =?us-ascii?Q?pMsLxIoFaGy28ttFrb3ETtHWfRplzA7l1yXwQEvRL3J+TCn2M3eIpB824mnM?=
 =?us-ascii?Q?u/RLyH6FOUoSog8gsF5TddJmHcIox3/SljtSfRbrlbj++XpLxFdXwQ1eSbn4?=
 =?us-ascii?Q?EiicD2oyRm7j0KO0MA8X2EimxxfzsGWJBaGkVRBRCvdLOeXZFvak1NWNyhms?=
 =?us-ascii?Q?CIWbwPEqOGitUHOxkLqSopppBmksk/wGa1D5+qF92/3/1J0zlci40WbHIUQM?=
 =?us-ascii?Q?K1D81KSP6Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: on3kGjUPNPiK8BqGBWcIxfpQxRfK95jmSsF9r9SWXDME5ydD8GeYbloPOX+8xg04QofZckvDpQoVCjEg4Dk2S/WqjndGvT9u0NuxwpWXQdVxiyH4QRFc1B4mmNWMBb72xxaXZssBfFnrBd/dSQgxK8mirIy71sELfK8Avos6S2Lhkjo3nmoNeOp1EyR4HGs0byy1V75KoLonTPoZcqBuCo9Muxv0tqqwThe1KYX5I7mMQo4/mBIDBUnenA8qkarc2+aZwTfodkp33mU+k7Mt3TdSn0ko3DrHlDgmP7hE1392cboPmtG03umcqnZLg19b8Z6fv0KkvMMOPmjOyFngDA==
X-MS-Exchange-CrossTenant-Network-Message-Id: aa3e4422-33b0-475a-ff1d-08df402db4fe
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:55:16.7046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xKUnoEC346qVi7pGL9owYa04Zcp8MyOhKuMYZI6tKbCwI9fEp4YZmuavX8QpFH3fbHO1j+9m9v6Nlv11x7mMOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7095
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 09:53:56PM +0000, Stuart Summers wrote:
> The SoC remapper configuration is lost whenever the device loses power,
> and @d3cold.allowed only records the state xe asked the PCI core for.
> The platform can still drop power behind our back when the bridge above
> us runtime suspends, which leaves the remapper unprogrammed and any
> later System Controller access pointed at nothing.
> 
> Restore it on every runtime resume instead.
> 
> Fixes: 02eca6edcb32 ("drm/xe/xe_sysctrl: Add System Controller power management support")
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pm.c      | 9 +++++++--
>  drivers/gpu/drm/xe/xe_sysctrl.c | 6 ++++--
>  2 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index f483b565d323..e9bebc2ff29d 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -718,8 +718,13 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  
>  	xe_i2c_pm_resume(xe, xe->d3cold.allowed);
>  
> -	if (xe->d3cold.allowed)
> -		xe_sysctrl_pm_resume(xe);
> +	/*
> +	 * Done unconditionally: @d3cold.allowed is only the state xe asked the
> +	 * PCI core for, the platform can still drop power when the bridge
> +	 * above us runtime suspends, taking the SoC remapper configuration
> +	 * with it.
> +	 */
> +	xe_sysctrl_pm_resume(xe);

That is really awkward... if we lose power on d3hot we would have a lot
more trouble than this remapper...

You are right that d3cold allowed is we allowing for d3cold, but the
final decision is not ours...  but if we don't allow d3cold and go to
runtime suspend, it means we are allowing only d3hot. And the only difference
of d3cold and d3hot is that main vcc is off in d3cold... but always on on
d3hot... So, something is off in here...

>  
>  	xe_display_pm_runtime_resume_early(xe);
>  
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> index 27a59e8e4487..a3fff95d16ea 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> @@ -129,8 +129,10 @@ void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl)
>   * xe_sysctrl_pm_resume() - System Controller resume handler
>   * @xe: xe device instance
>   *
> - * Invoked during system resume (S3/S4 to S0) and runtime resume from D3cold.
> - * Restores SoC remapper configuration.
> + * Invoked during system resume (S3/S4 to S0) and on every runtime resume.
> + * Restores SoC remapper configuration, which is lost whenever the device
> + * loses power - including when the platform drops power behind our back
> + * because the bridge above us runtime suspended.
>   */
>  void xe_sysctrl_pm_resume(struct xe_device *xe)
>  {
> -- 
> 2.43.0
> 

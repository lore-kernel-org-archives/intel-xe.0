Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CE5CEFC34
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 17:14:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A129B10E1BA;
	Tue,  8 Oct 2024 17:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KEcy+i6W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21C410E1BA
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 17:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728407665; x=1759943665;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SI7GRKs/aSzblBk2uKvXvfpVyAj9lJzHs9Bim55Ked0=;
 b=KEcy+i6WaNrLkwHB/USFmDpk2c22CUi4xxmtaFE+5WQC/ormGVmwdH09
 XiWBqIDPfCAsnsm4HBOxSeLn8SZ5JVG0B8954WaTH2vGtCidwVH5mTKNa
 Ti/aJnXWLeHKYaSRR2+Qin12pRueIgiHY4YaAcRx7tCNXE5vmz4wAN2df
 q+g5XL/pAPVotht/IP4r9p+ryx4GYV0Ia35VFWXnEJopNzLQY+ZefeEvn
 S660KLab00LyoyXYWptbxUhz2R0l3kL25xlR1kGgcFF8Zd4+VFkEZWz7S
 jABTnMCa9rpCBxJujJZXPwTEOjruWyF4Tkfnx/rDQ8mosf1jhyypbh8cr g==;
X-CSE-ConnectionGUID: cvp2KonES52uxKDQ5us32Q==
X-CSE-MsgGUID: wVeyR6xbS1uvQA3JTzUroA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="50162230"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="50162230"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 10:14:25 -0700
X-CSE-ConnectionGUID: 70Z5tQshQGChW4NEzAn0Qg==
X-CSE-MsgGUID: Pxwx8jHqTESIzZvNolFPDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="113389163"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 10:14:24 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 10:14:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 10:14:24 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 10:14:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dldMoq9KvTi5FXlQM+t/7dMNGqZ+QI2lv6sMcXiOS5JVDO+ltpAdwPXaxdOgsAFvdLIHjl13Daxwa6SU1rNQyrrsiob646tvsysgtpm92B1I1TU2OHCJpxIxBJNPOH4z5SqNEIw7jblpqHipi97s5QGD2ZWT/VekPrgOhuPLgan9WhRT6ESlAqwERob+bAqSoDTL1bj+F4PbZrBsqOeqz7RfURQ2SVIxU1fFLWPvbu9n3Of13uMCRLdbFQOZEwYinOsi6apTedi0Or2jY1YxqAskrnEBsEe9wKZVaxOXMO8U1SBXUAoljW+fU69V2b4/qpYpBU1ueh/fAu4cW+V3fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CPcLbYUH15fEAfM/wY/Nn8B5gHyHsi+7O8M3hWPwXY=;
 b=cGl4TiZoaN3NEN6LHY65LIC8phePTm8cBRbo72Batu430otwsmaO4JmSRmciLuafcsoQDqUwZuTRkGByMewoIMC9qcLochD//P93ClSyyzXK6mFVJw/E0zIOaaNNLsGhU86S0howH9q8LaHr+w+vI5jAd2PaMGg9Da/8jYCnlRDpNAIPoqYh8AX28syLEKl+MKBiUAaRZMEdjDYEgVvIoAjdxn8Ud+07eebrFS7rXgQUIA+LVDt2JRrFaR0zg7/T8Q+VITKuICuf8c5xn1srsLgPM2GqL1y0chayS8IlyZRaRhYrCpvikdwKLSfnuMCMTcHIZy7G4b01iNZZs+icBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8254.namprd11.prod.outlook.com (2603:10b6:806:251::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 17:14:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8005.024; Tue, 8 Oct 2024
 17:14:21 +0000
Date: Tue, 8 Oct 2024 17:14:11 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: fix unbalanced rpm put() with declare_wedged()
Message-ID: <ZwVoYzV+ugmbdN91@DUT025-TGLU.fm.intel.com>
References: <20241008104723.98300-3-matthew.auld@intel.com>
 <20241008104723.98300-4-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241008104723.98300-4-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR03CA0049.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8254:EE_
X-MS-Office365-Filtering-Correlation-Id: e67d3aa5-5380-41c3-a45e-08dce7bca676
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3AjowQEwDJE/Zsgjai0KcXlWzHR7PSTaWfQfSTHHGs35+qMLgg25QCWQ99mP?=
 =?us-ascii?Q?tt9cdippVIvyEZiASUqq/M1ifi5ySMiEYpgnVnRDHE7meqWD6tgDk0TtCQgU?=
 =?us-ascii?Q?fL/pKpd9oRL2eXhbtdGGBg0vMupqBlpgpa5/scjMJ/Y1UkXgbsIpd0tXU1xf?=
 =?us-ascii?Q?4MTKuLIuVo6xHadxl6fuIw+5ZEXkTmIQbJYDgl8P5NsVJIn1IwtkmStPYroi?=
 =?us-ascii?Q?oVz2BSPtnTihr1Z7cUAqCgC51rwLz+Mi3HdbTe+52zLrvmz89nYGaOiEdzjP?=
 =?us-ascii?Q?Cgq99cWtfZJqWOm0yBGsxVoV48rTpiYTq+nNE0O+eYQojDwFbpzsKkxQk646?=
 =?us-ascii?Q?g7NaYnr+a5m4HqeQtEE3o1Kc5qGgDgFvfLteqxXrL6WfK6wpBpq9bF3v79FQ?=
 =?us-ascii?Q?+QKkHxzZX08l9m2HT3KA8a9wHmlMA23xsZtLZGyqmYatkHbKR30GnML81lft?=
 =?us-ascii?Q?jZkBrXFZCHjGC6X9Mrf3bwhfccHthJoL4kQBP+ypJQlH2Du+tlktYYBhifk/?=
 =?us-ascii?Q?UFMal0S0JB4JOj8CkGyKKggEjpnY52QOdQylnoib/LSZoF4SwXvEZfC5t5bJ?=
 =?us-ascii?Q?xF7MxTSVOh2qTBK3cLxiWMdRdw7fDlrVA18HKNI7gDgE1ct7gNKjgVd3keq3?=
 =?us-ascii?Q?1j6CfTAsPSNFZ0l13FcaB6rb+OX7nTLBLAd/6wqVjFIhO/b6bD6WEP5BMlbg?=
 =?us-ascii?Q?oNXkhSho0sDl4ldNqRkHSew+J08p5ikilZzKf6D4HS1Fne8doYUfnAqCpR4I?=
 =?us-ascii?Q?i1rTCQBK8zYTjk3eA5ETxxMkGtGqISkl3n+0PWq3pESgXJfZ3Uxk030vwblh?=
 =?us-ascii?Q?T1zwAYztYUKVOkTLCA6GszCozywMRp14GBrU4j5yinO+rOXPoiZ/KQlXy/13?=
 =?us-ascii?Q?M/SsGEw38I1rADspVFBIg9TEJO91v/yhD6K1O+Sfz8geSzlZLAziKp/Z2rte?=
 =?us-ascii?Q?hublzzJlC8vUgyJLk0+j2Fzpgk5Qc+6+K49v9zKMxQGbN4LRrvaHEgCv38Uf?=
 =?us-ascii?Q?Qetk8Y8NKHYJ6Jq2JLVeOOj8KPDecbeeT2SOteKQ6T2l+GSAhp0Ho6tiBdjd?=
 =?us-ascii?Q?/Zb9M2If8D0pMBK19oa6RVuJGW9xtJOKxQaoRrLOMhacxo7rejtp6w1rX2yg?=
 =?us-ascii?Q?jCaPeeafjBL/EkNAa5ocVpDrNx/fgpXmF/fgdEbybP25YXhv+9rgURc9lZFq?=
 =?us-ascii?Q?t0y/dhhZJiG59kH4iWGfvMI9DTSLjVRyz2OD9c2mPvRqu8kwQTzS8NYrkJM0?=
 =?us-ascii?Q?xH2FwLmTlnFDuPf5kztP8BOZb3DNnvP30olpSHU6kA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WaCqKgyLcsrqvlNKxTAgILvKK8DAePMXdz2py9S/rAxCgBRw9q8CD2eH33T7?=
 =?us-ascii?Q?JUXg5yWCdOG9nQRFYk0tZNA7eMUE9z3WkpHiOZsyYc+bnZIOIBpbIstekoJ1?=
 =?us-ascii?Q?7DTZGQAKfpu4yoywFLc+aJkfxHPqrcbpBgbmxeSsYnWZahZr5mpPoYGi15H/?=
 =?us-ascii?Q?fPUFMFXYkkwDZWHb+IzdJHCFV6D+T4aSMAKhoo6cn2m1aCxL/2OM45Ywr40G?=
 =?us-ascii?Q?sjD/XgyzW9m+rAk3jnxej7+by/uhhoYIJ1hk53pbfVdqWT3sH6llgHzWWNsd?=
 =?us-ascii?Q?k4IpgFMuP2EvXQ/LEIRmKWZuCBlhn4Ix/p1HnKpHo62ieFAoGFk+NAsd27wU?=
 =?us-ascii?Q?+uqfkth/TEucBFPYTDd1PoilebzYaGMSRIM2h5inEcogF+lOJ3UqSucmHO71?=
 =?us-ascii?Q?iTMiO7U4rctT3evpfxTLsq7ij6cOq2/Kf9cJEJ2v7MDYPA8JwoTv64zy+La2?=
 =?us-ascii?Q?ZGdzCJtTMygeLYfck+SEENoEKRXu44b/aX2RhVjALpm+qfck7rwGKgobg+B9?=
 =?us-ascii?Q?o26Vt60HKL/iiOHU0q+WOAxN5ozDZVzERo18zR29lUaWCjAn7zOvXmkqy9dP?=
 =?us-ascii?Q?IPjxeBbIYPC884rHE/K5eIH7Gv05UIQ3LIjeSQCK2kwEZmOtJuXW2IEHE4mq?=
 =?us-ascii?Q?CXxzuBmToMNzGSs2NGRPNo4JSAlJLUFGx5yzr9hKZ9MEhDH0C9jNHrMsyVd2?=
 =?us-ascii?Q?2fzxilNRch1a3z9EyZtjRV21JQSoYO6i4AX7931eMNIYgui//wMLlXDBJGos?=
 =?us-ascii?Q?MzNa6sUUVAQRI2kDenKH8wi5lTpAsOMGzfSvsB2175n+L8W9NRnMT2Ny35Mv?=
 =?us-ascii?Q?ckFNzizO9Vk+bR84RG6C/lHQ0B+rxoJU+5iuCOPSHPnUAamYWusQvG2yI2ix?=
 =?us-ascii?Q?IqhBP+ZBbSleRKhLbTM7mgbGtjTq8NC0mbsPOQYbV0I0x8n10eqB5nzqVLQ/?=
 =?us-ascii?Q?8nz8axWoOoNPXzwIWe4CuCrIM9WjuHPVdqP27FI2BBrbBIhyZ3mSyv4HmNmK?=
 =?us-ascii?Q?fBMFOXvAY6ToohiZdMMwkWFj4Iik0B3Duk+3xkuz+7IyN0Pl3f9NoobUaICd?=
 =?us-ascii?Q?cChP84CTzMl0xHJjkwuf117d5e9xDypJjik/X1vhv5M7EzBzeXPNONGGBNrD?=
 =?us-ascii?Q?t3h5Xh/Z2bRk7LuReiq0myOW2fSECDuBTqgDUc3JsMR7CLK3p8zMgCsfcq6N?=
 =?us-ascii?Q?aqli9aFaTIyvHEVAW9pEOnAFfStXRPaxqKujM4ZawX0oMiBHRRNQ2tGr9HYp?=
 =?us-ascii?Q?NdFZQSzw4N5nzP9gLc2Koza+bkmw7ROlAMqeGe+B5lwZdxUo/eomL0EDYXy9?=
 =?us-ascii?Q?CnvVyc+fyxyh1U4cPe8cjyXNHnCB0p0GJ0FsfycsYMbJCB2PyvDpWzhJ72+0?=
 =?us-ascii?Q?diG7iY4UIdr+20fQTkOpoKABpDG+f9NbDqdaCzeWc/UNIQrwHRN2NygB53yq?=
 =?us-ascii?Q?p11hFodAQ6whSU8+9LJ0dYtTjd13NQa8LDEF1zOm57dVm2cvSN7cVj4wiUXc?=
 =?us-ascii?Q?uAMZz+eI1dbwDgceSuB7xxYh6KQUZFjdUSBUmqZ/ETBKbfU0OTogPDOEAr8q?=
 =?us-ascii?Q?83gMwan4shpzPD+1LqOmr6VVCPtNJ3WK8/q2fuyV8ZK8orqrEAuY5Z0sDo5E?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e67d3aa5-5380-41c3-a45e-08dce7bca676
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 17:14:21.3356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0kCvZ94ioMWEVN6DMMGYL4gPNjX8lZ1lhmTnQ0q80rzS8dftJaU2nw6Gq55Un1Uy8ovH+u953aYKx1iuePwoyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8254
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

On Tue, Oct 08, 2024 at 11:47:25AM +0100, Matthew Auld wrote:
> Technically the or_reset() means we call the action on failure, however
> that would lead to unbalanced rpm put(). Move the get() earlier to fix
> this. It should be extremely unlikely to ever trigger this in practice.
> 
> Fixes: 452bca0edbd0 ("drm/xe: Don't suspend device upon wedge")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index cd241a8e1838..962751c966d1 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1016,13 +1016,13 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  		return;
>  	}
>  
> +	xe_pm_runtime_get_noresume(xe);
> +
>  	if (drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe)) {
>  		drm_err(&xe->drm, "Failed to register xe_device_wedged_fini clean-up. Although device is wedged.\n");
>  		return;
>  	}
>  
> -	xe_pm_runtime_get_noresume(xe);
> -
>  	if (!atomic_xchg(&xe->wedged.flag, 1)) {
>  		xe->needs_flr_on_fini = true;
>  		drm_err(&xe->drm,
> -- 
> 2.46.2
> 

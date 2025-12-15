Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D818D5B86F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 21:46:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C34810E198;
	Mon, 15 Dec 2025 21:46:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cgOUy/J/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5CB10E198
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 21:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765835190; x=1797371190;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=COk0AksRfpGm7229b/zzbhChSDhh/rDl+JuYDTq9IlQ=;
 b=cgOUy/J/7D2mf6SW439PB08pbELIn/Js3Sqa+GHcjWfpSy6jckxzAVV/
 xvWHUGKTofnl6IRbBLYFcgwUZjhEC6xphM/siD8guBd5R7YtDlJuFMPGX
 fp6Qia9L+IZFjKwl5LsAq5dgLGxtwFEFkirCJcJ8d/UfExY29E+O7wt5u
 7CaCLDwIVhjBpFp4GoRl0j/ZzDvqTsmrE4ULfuZCxxs3qhLTE8ZuTtZ7J
 /E9Yr/4wx8ANmFWzd6sVKTl3V64fqkxAIoBKUBXEKNO5ykKu7xI9xYEU/
 XopPygUaU9LpNpd54As6wSsYcWYqgIJrL7rLOBKgspHyfgOOscQdAHDer g==;
X-CSE-ConnectionGUID: saYZW5DGQgu50AkIbFupLg==
X-CSE-MsgGUID: Tz4yM9IiQuy7QuOxW526iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="71604122"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="71604122"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 13:46:29 -0800
X-CSE-ConnectionGUID: aQTI2jThQm66RPRV1p3wiw==
X-CSE-MsgGUID: qrl6cJPxTBCfZlBCVthyCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="202016177"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 13:46:30 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 13:46:29 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 13:46:29 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.57) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 13:46:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MzI0MLKnrA0kw1gJrKWqvmlKZWIiu5zAT+ghg3m2XkTKVs+o7gGH8R/PogxcrFYF4AS2x9F7OunggFNUDLcOMv0/AHgBNbO9jM3K3dYaDxWDeVh93VRGZGKsF/otWKIUfHyJbTac+oldm19NK2c6RMsVjTvNa6iYNSYzDy6FjjG3G54TqPRS+fof+eQfwCqsk8RSmH6hkef2foHV4P8ZUizH2Ry8a/pRJAZmmNU/VwyY2fo3uEgiNYC3CtOTeBlk604LH1kIkvi9nY4mefrYdrvu1b9ZyaNsGiqOhdanmVeghC5HXGQhZgaYvtnkhCJuuOEPWyLO8PjLA+KZvA2YMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RK1U8hzw3aS1BEKO4NFu/LV+HFdnvaAU1oC7NDzanO4=;
 b=d+dtehuWuj1kPOfd4gEYgGPhhOirwWsgClK5d5AnxjALESdBaG35O22bbB1aFDu133kq0Wc2lKOVYqdcVAL6/Hw8ws2u17UeXfrDqI7hkkOsr3S0gzCiZvIf0tPmDzHNEX4PlsFJF5l+WqD6O5db1PKmy6CcWy7vGDKKiEsCj2kfGsTwZuU/A3HT5RbnOHKZJdrSiH8HXOmCNwpCv9hoBgy1rdaJfQICmaG6wVc8ktupVBLmRNKcskZwrHgKlucc4fQgm+QzdP28dTbhYyGGVQM5CivDXhYi2+mDpEpCPB6j+ZVHnMfRKml2CU2K2AWbAxmM3PtIRdkuopQhka4vBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8317.namprd11.prod.outlook.com (2603:10b6:806:38d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 21:46:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 21:46:25 +0000
Date: Mon, 15 Dec 2025 13:46:22 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <francois.dugast@intel.com>,
 <michal.mrozek@intel.com>
Subject: Re: [PATCH v2 5/7] drm/xe: Wait on in-syncs when swicthing to
 dma-fence mode
Message-ID: <aUCBrn8nGPSp4lBR@lstrano-desk.jf.intel.com>
References: <20251212182847.1683222-1-matthew.brost@intel.com>
 <20251212182847.1683222-6-matthew.brost@intel.com>
 <f8d4426124338517d5bc9f99daf8fd665c9a0c3f.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8d4426124338517d5bc9f99daf8fd665c9a0c3f.camel@linux.intel.com>
X-ClientProxiedBy: MW4P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8317:EE_
X-MS-Office365-Filtering-Correlation-Id: 41ca5d00-bea4-432f-ebaa-08de3c23652f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?fO4CWcPW6Ep6O/bLo1tHQyO0yeb5qq1qVlfpVn0V1YNLWSpETm+mZTF/NN?=
 =?iso-8859-1?Q?Y2RwCJtiQcTK5QhchDiT+Yt6HNjYwr/mTyRpd3iMXuJLNV6fi4W1Ay6Fqh?=
 =?iso-8859-1?Q?EJJ0RMv7Cj4HqYCdxUBfH4/LjRASW9NZGqwOpojC8291wOnP/WAK6iRbtN?=
 =?iso-8859-1?Q?6neJYB3uwnK3sVSaISisOUUOXOFninz7TJR7H6cdL1WxITH/FZFwOHGU4B?=
 =?iso-8859-1?Q?xdaCLJjHpabz0mSmQGpdNPEOlMcSvbyrr3CK5+YVskH4ROoTj6E3yAd2sU?=
 =?iso-8859-1?Q?Tfu4OADEp4FUowYrhVDqkw+obrPjxX5ISXFoaChUnKBiDPp8NuQ1uWWgfi?=
 =?iso-8859-1?Q?7w5QC4qWEGkF6KNRrOr5ied6PMeGsZdQtJLL//LTgNyocU9+mcpNrXHKAx?=
 =?iso-8859-1?Q?4jiXVHOKNu4mskoYuHVIQg4zT2kaMK5ibQppk20kIamxdMtG/zibe4XzLt?=
 =?iso-8859-1?Q?JBKJ4cShmJQqEFf+F4FdEFcDezZBPJbuoM2vkUqvj30moqmTXbNQRpEPpl?=
 =?iso-8859-1?Q?JkGInu2V+xujacXyRB4WTeKbXnoR5ZSUzQwKgLXmYJafCH2lxhS6TUsoaF?=
 =?iso-8859-1?Q?i5JDlts8FDJijYa88EUQ1x7gkz3DDAHEnoSpa1ig6+/RxWrCTlhVYWit/d?=
 =?iso-8859-1?Q?QD3ffifQ3pU3+VtiRmy3Oj0KrPgsfSFvNxRVtrhLDo/anOGxzxAYsdl+ay?=
 =?iso-8859-1?Q?CswiOZtViPW5JW1WRLiNtAeeXs22itymWSVTnMRxHLNvxRraewzKyl9wqg?=
 =?iso-8859-1?Q?T96oIkKH1PjL0oSTgQKWOZbyhTCUTzGjLeB7Ak3ATJmtotlIjOgB1kAubD?=
 =?iso-8859-1?Q?7mN99KEivKfEm1Qak2D7UFjHoiNxwf1xPp8g0w7bcUHwcRgB4sXmNqwUJ0?=
 =?iso-8859-1?Q?kyBcBY6tQ5O7XTfRvI76LLOdtHTXm5U3K6he2pcGHoqQInCiJwa6xGouWJ?=
 =?iso-8859-1?Q?ykgCyHDxDYZx2zk3tZwQHEVeUR1ZCvZSwnwNkU2c68BBZnUzjE45qIimgx?=
 =?iso-8859-1?Q?CKLvu5CrsbHPzypGkjz2dnN41ias4fc5AmRs78blCLZVJTq52bZm3VIbME?=
 =?iso-8859-1?Q?SXHbT6CFBPO1I4jyWn7FNpLQhNJvb7NNMxDU6TijZzc+27YZKpCEkNECpk?=
 =?iso-8859-1?Q?sQtYXwvsJKUO4UGT2ztbqGiJmrSTJugz7z1OC3xEVQvdI77yymanZYLxEr?=
 =?iso-8859-1?Q?yRiN0eNZQUI5vnS91YDDN1orUURZdobItID5O9ELfpOnP9Msqyt4KTBq+B?=
 =?iso-8859-1?Q?XLggJDc2C8Bwd+XhjCfBLrAQp4QBS27ykxHeeXCg2xu6X2EQhrjgORBQxt?=
 =?iso-8859-1?Q?ctpPk1jHwn1XPqeAwCVbjDMho/ZF3sxjGGNnO6LV0ROo1oHjWLukbF4huJ?=
 =?iso-8859-1?Q?qMnzwJ6q9zqqLkQC69VEKwv23F6mrCJOWKl2RkrXMvIurS1rAu5bw2DSUg?=
 =?iso-8859-1?Q?4ddQasnRXCkLwSMh1j2RAV6VgEd9jD5fhzgVN7pHLJOVWUx+o6sVGxtSo1?=
 =?iso-8859-1?Q?b8jpw/FFpyR5cMoDrFpaRa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Qpr2+gHzk7N1vPxkNOd2X0jFpyXSTl2BAZMtO0Df6AQnGJO7GiKvRV+0rY?=
 =?iso-8859-1?Q?+SsJh8fH7s8S1sPQfDdBhcmwGfMzwO9LeUnb3OXO+RlwzxYOJ/u5xmPBsI?=
 =?iso-8859-1?Q?iTR7uU1/b6VhRbcEp13/zkSaykDzgWtF6kfGVk8tCxzqxbVP9Audatq7lm?=
 =?iso-8859-1?Q?XSXzv/3wej1Af6HHIIjkRaBP5hcflvi+fYvSAKusc9OUFAuEvmyr9i90Rj?=
 =?iso-8859-1?Q?Je/OZpDw/qiK+6k0AS2AW8U5/ihsJnu/h5ZKXT6cdA5KOFBxrFK4v0dyhu?=
 =?iso-8859-1?Q?ykgkG2/2dnWV8t1zuQoenO6963An61g1fzkWHlV9Y0UKX86zEP1wWXsPc+?=
 =?iso-8859-1?Q?VxweOu8r2AjUZ1o+kzGKUUy4Bxusf7lfBoBRgJeAxJyo541bfiQdgzegiA?=
 =?iso-8859-1?Q?TmtPhKK+Kn4rfVzGRyDrK5Erd3tG9P8Dx+zg+0IdOXm6bbSNmy78o4w4c4?=
 =?iso-8859-1?Q?SxNp1raNs2w6FTFxWAAZ5dHgEtUYILRAtS+HThgWhjOc5CdrV+h2G+bVQI?=
 =?iso-8859-1?Q?Ku/N70HFUXvqdnJYkHNAllJYEqeaOwkwqpr9UVJIw2DblDDcSgoeBZlWGp?=
 =?iso-8859-1?Q?RhYODzrawQ3gbETG9OAg5pqjgkR+Z0CCcrnc9Bk6lAjAGTq0n4b3M0KCZF?=
 =?iso-8859-1?Q?eNpiT6tWvXNTSBgMFstvSNobdndKj+P0W0cpaUFKIy1ywJ+/UfzBE/5s5m?=
 =?iso-8859-1?Q?sjXQnhyQIOEp3lJ6PHfbdhMN65APUU7IStSslL6nUkCNvBJuY0rVilFiLQ?=
 =?iso-8859-1?Q?Ls0TfsroIEJBD/zI1F7+bEhfdFTVtTv993ubCnWhZX5GOrndZzsCDA30nE?=
 =?iso-8859-1?Q?6xLRLW8BVMr9PT3OB1ZNd6MigZ/IMTQxsLyYzgSAZ0UJZE3vG2r358xy2E?=
 =?iso-8859-1?Q?jdzHWM+fPjQNRyff1IX9n6OQxvtbWaKtaUUl8b/inkLPt2mVNtClsIbM+P?=
 =?iso-8859-1?Q?R/TPL6fjkrzRbBw4vES68nGIUqEJDvwyV0wK7JR7a5tp3a72M75EyeXMIe?=
 =?iso-8859-1?Q?VpFtaH3yF8CHj80m9TdZ/h1Gu1xFee2d7RgGYmeJ4IVVUQTuLk6GWmC7li?=
 =?iso-8859-1?Q?rtZ5TomgDmw7pJ5gLDL+QDbdUpxFepJ+PKIIauncQodnSQhn7uNI4o2hwG?=
 =?iso-8859-1?Q?DfB2gVRiScfe6h5IG+hT0D9NZXLi9oD/hCUefqNthC1ZKzm3CE+OaXDdki?=
 =?iso-8859-1?Q?P5AMStYlBqyn6FudrcTginEGwzEHs5tsXWdvd0VnovcQ7shcXs8i5oD/U6?=
 =?iso-8859-1?Q?FeFw6yZhKTRBX7Nv8KguWjdElOkS+wmHcfPWolVN/z8kkpdmDhc4VzZ2KW?=
 =?iso-8859-1?Q?LoSTc+2DZyBQMGrgzYKyRE2prJ+tFWCMY8wi6m2SbKa1WPB8P+YOHDz1j6?=
 =?iso-8859-1?Q?XH5i83n6vWVtU5yq9friK2nkfECCFxzQzlKx24c69dGsTccl+svHjVssuU?=
 =?iso-8859-1?Q?tXAB3J7X0hdYm9X1OW1rHMFEU6qUW7RY+D+5ZAzMEKyFAZGPKpAJkKkQCY?=
 =?iso-8859-1?Q?oiRMkjtwZWYCe++dymRG2vcIkwwAp72TCKjsfXoEHSSyR9wzR8OHQ9D2DV?=
 =?iso-8859-1?Q?B07ZUnW48S2Eu32dS7WgfQYnA2wfn2b9HTJPvE4Ao+sF+xh6B58kYi3x6g?=
 =?iso-8859-1?Q?s0QVNoOjDCJYA6PlF9vKMfQTFFwPRdOb1z1vPzyY3CTUn9BEKO3/RfRA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ca5d00-bea4-432f-ebaa-08de3c23652f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 21:46:25.4421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Phk9X88h2MO9jFvzOTQ3wFRkMSJUVyg+VNl01NpHf/agwbFnz5eEJLVaHT8Glud2USClZbSufOGJdurN3KTeKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8317
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

On Mon, Dec 15, 2025 at 11:32:23AM +0100, Thomas Hellström wrote:
> On Fri, 2025-12-12 at 10:28 -0800, Matthew Brost wrote:
> > If a dma-fence submission has in-fences and pagefault queues are
> > running
> > work, there is little incentive to kick the pagefault queues off the
> > hardware until the dma-fence submission is ready to run. Therefore,
> > wait
> > on the in-fences of the dma-fence submission before removing the
> > pagefault queues from the hardware.
> > 
> > v2:
> >  - Fix kernel doc (CI)
> >  - Don't wait under lock (Thomas)
> >  - Make wait interruptable
> > 
> > Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_exec.c            |  9 +++--
> >  drivers/gpu/drm/xe/xe_hw_engine_group.c | 44 +++++++++++++++++++++--
> > --
> >  drivers/gpu/drm/xe/xe_hw_engine_group.h |  4 ++-
> >  drivers/gpu/drm/xe/xe_sync.c            | 29 ++++++++++++++++
> >  drivers/gpu/drm/xe/xe_sync.h            |  2 ++
> >  5 files changed, 78 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c
> > b/drivers/gpu/drm/xe/xe_exec.c
> > index 4d81210e41f5..d462add2d005 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -121,7 +121,7 @@ int xe_exec_ioctl(struct drm_device *dev, void
> > *data, struct drm_file *file)
> >  	u64 addresses[XE_HW_ENGINE_MAX_INSTANCE];
> >  	struct drm_gpuvm_exec vm_exec = {.extra.fn = xe_exec_fn};
> >  	struct drm_exec *exec = &vm_exec.exec;
> > -	u32 i, num_syncs, num_ufence = 0;
> > +	u32 i, num_syncs, num_in_sync = 0, num_ufence = 0;
> >  	struct xe_validation_ctx ctx;
> >  	struct xe_sched_job *job;
> >  	struct xe_vm *vm;
> > @@ -182,6 +182,9 @@ int xe_exec_ioctl(struct drm_device *dev, void
> > *data, struct drm_file *file)
> >  
> >  		if (xe_sync_is_ufence(&syncs[num_syncs]))
> >  			num_ufence++;
> > +
> > +		if (!num_in_sync &&
> > xe_sync_needs_wait(&syncs[num_syncs]))
> > +			num_in_sync++;
> >  	}
> >  
> >  	if (XE_IOCTL_DBG(xe, num_ufence > 1)) {
> > @@ -202,7 +205,9 @@ int xe_exec_ioctl(struct drm_device *dev, void
> > *data, struct drm_file *file)
> >  	mode = xe_hw_engine_group_find_exec_mode(q);
> >  
> >  	if (mode == EXEC_MODE_DMA_FENCE) {
> > -		err = xe_hw_engine_group_get_mode(group, mode,
> > &previous_mode);
> > +		err = xe_hw_engine_group_get_mode(group, mode,
> > &previous_mode,
> > +						  syncs, num_in_sync
> > ?
> > +						  num_syncs : 0);
> >  		if (err)
> >  			goto err_syncs;
> >  	}
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > index 4d9263a1a208..022fc0c30d38 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > @@ -11,6 +11,7 @@
> >  #include "xe_gt.h"
> >  #include "xe_gt_stats.h"
> >  #include "xe_hw_engine_group.h"
> > +#include "xe_sync.h"
> >  #include "xe_vm.h"
> >  
> >  static void
> > @@ -21,7 +22,8 @@ hw_engine_group_resume_lr_jobs_func(struct
> > work_struct *w)
> >  	int err;
> >  	enum xe_hw_engine_group_execution_mode previous_mode;
> >  
> > -	err = xe_hw_engine_group_get_mode(group, EXEC_MODE_LR,
> > &previous_mode);
> > +	err = xe_hw_engine_group_get_mode(group, EXEC_MODE_LR,
> > &previous_mode,
> > +					  NULL, 0);
> >  	if (err)
> >  		return;
> >  
> > @@ -189,10 +191,12 @@ void
> > xe_hw_engine_group_resume_faulting_lr_jobs(struct xe_hw_engine_group
> > *group
> >  /**
> >   * xe_hw_engine_group_suspend_faulting_lr_jobs() - Suspend the
> > faulting LR jobs of this group
> >   * @group: The hw engine group
> > + * @has_deps: dma-fence job triggering suspend has dependencies
> >   *
> >   * Return: 0 on success, negative error code on error.
> >   */
> > -static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct
> > xe_hw_engine_group *group)
> > +static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct
> > xe_hw_engine_group *group,
> > +						       bool
> > has_deps)
> >  {
> >  	int err;
> >  	struct xe_exec_queue *q;
> > @@ -201,11 +205,19 @@ static int
> > xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
> >  	lockdep_assert_held_write(&group->mode_sem);
> >  
> >  	list_for_each_entry(q, &group->exec_queue_list,
> > hw_engine_group_link) {
> > +		bool idle_skip_suspend;
> > +
> >  		if (!xe_vm_in_fault_mode(q->vm))
> >  			continue;
> >  
> > +		idle_skip_suspend =
> > xe_exec_queue_idle_skip_suspend(q);
> > +		if (!idle_skip_suspend && has_deps)
> > +			return -EAGAIN;
> > +
> >  		xe_gt_stats_incr(q->gt,
> > XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT, 1);
> > -		need_resume |= !xe_exec_queue_idle_skip_suspend(q);
> > +
> > +
> > +		need_resume |= !idle_skip_suspend;
> >  		q->ops->suspend(q);
> >  	}
> >  
> > @@ -258,7 +270,7 @@ static int
> > xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group
> >  	return 0;
> >  }
> >  
> > -static int switch_mode(struct xe_hw_engine_group *group)
> > +static int switch_mode(struct xe_hw_engine_group *group, bool
> > has_deps)
> >  {
> >  	int err = 0;
> >  	enum xe_hw_engine_group_execution_mode new_mode;
> > @@ -268,7 +280,8 @@ static int switch_mode(struct xe_hw_engine_group
> > *group)
> >  	switch (group->cur_mode) {
> >  	case EXEC_MODE_LR:
> >  		new_mode = EXEC_MODE_DMA_FENCE;
> > -		err =
> > xe_hw_engine_group_suspend_faulting_lr_jobs(group);
> > +		err =
> > xe_hw_engine_group_suspend_faulting_lr_jobs(group,
> > +								 
> > has_deps);
> >  		break;
> >  	case EXEC_MODE_DMA_FENCE:
> >  		new_mode = EXEC_MODE_LR;
> > @@ -289,14 +302,18 @@ static int switch_mode(struct
> > xe_hw_engine_group *group)
> >   * @group: The hw engine group
> >   * @new_mode: The new execution mode
> >   * @previous_mode: Pointer to the previous mode provided for use by
> > caller
> > + * @syncs: Syncs from exec IOCTL
> > + * @num_syncs: Number of syncs from exec IOCTL
> >   *
> >   * Return: 0 if successful, -EINTR if locking failed.
> >   */
> >  int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
> >  				enum
> > xe_hw_engine_group_execution_mode new_mode,
> > -				enum
> > xe_hw_engine_group_execution_mode *previous_mode)
> > +				enum
> > xe_hw_engine_group_execution_mode *previous_mode,
> > +				struct xe_sync_entry *syncs, int
> > num_syncs)
> >  __acquires(&group->mode_sem)
> >  {
> > +	bool has_deps = !!num_syncs;
> >  	int err = down_read_interruptible(&group->mode_sem);
> >  
> >  	if (err)
> > @@ -306,14 +323,27 @@ __acquires(&group->mode_sem)
> >  
> >  	if (new_mode != group->cur_mode) {
> >  		up_read(&group->mode_sem);
> > +retry:
> >  		err = down_write_killable(&group->mode_sem);
> >  		if (err)
> >  			return err;
> >  
> >  		if (new_mode != group->cur_mode) {
> > -			err = switch_mode(group);
> > +			err = switch_mode(group, has_deps);
> >  			if (err) {
> >  				up_write(&group->mode_sem);
> > +				if (err == -EAGAIN) {
> > +					int i;
> > +
> > +					for (i = 0; i < num_syncs;
> > ++i) {
> > +						err =
> > xe_sync_entry_wait(syncs + i);
> > +						if (err)
> > +							return err;
> > +					}
> > +
> > +					has_deps = false;
> > +					goto retry;
> > +				}
> >  				return err;
> >  			}
> >  		}
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.h
> > b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> > index 797ee81acbf2..8b17ccd30b70 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine_group.h
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> > @@ -11,6 +11,7 @@
> >  struct drm_device;
> >  struct xe_exec_queue;
> >  struct xe_gt;
> > +struct xe_sync_entry;
> >  
> >  int xe_hw_engine_setup_groups(struct xe_gt *gt);
> >  
> > @@ -19,7 +20,8 @@ void xe_hw_engine_group_del_exec_queue(struct
> > xe_hw_engine_group *group, struct
> >  
> >  int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
> >  				enum
> > xe_hw_engine_group_execution_mode new_mode,
> > -				enum
> > xe_hw_engine_group_execution_mode *previous_mode);
> > +				enum
> > xe_hw_engine_group_execution_mode *previous_mode,
> > +				struct xe_sync_entry *syncs, int
> > num_syncs);
> >  void xe_hw_engine_group_put(struct xe_hw_engine_group *group);
> >  
> >  enum xe_hw_engine_group_execution_mode
> > diff --git a/drivers/gpu/drm/xe/xe_sync.c
> > b/drivers/gpu/drm/xe/xe_sync.c
> > index 1fc4fa278b78..d970e11962ff 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.c
> > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > @@ -228,6 +228,35 @@ int xe_sync_entry_add_deps(struct xe_sync_entry
> > *sync, struct xe_sched_job *job)
> >  	return 0;
> >  }
> >  
> > +/**
> > + * xe_sync_entry_wait() - Wait on in-sync
> > + * @sync: Sync object
> > + *
> > + * If the sync is in an in-sync, wait on the sync to signal.
> > + *
> > + * Return: 0 on success, -ERESTARTSYS on failure (interruption)
> > + */
> > +int xe_sync_entry_wait(struct xe_sync_entry *sync)
> > +{
> > +	if (sync->flags & DRM_XE_SYNC_FLAG_SIGNAL)
> > +		return 0;
> > +
> > +	return dma_fence_wait(sync->fence, true);
> > +}
> > +
> > +/**
> > + * xe_sync_needs_wait() - Sync needs a wait (input dma-fence not
> > signaled)
> > + * @sync: Sync object
> > + *
> > + * Return: True if sync needs a wait, False otherwise
> > + */
> > +bool xe_sync_needs_wait(struct xe_sync_entry *sync)
> > +{
> > +
> > +	return !(sync->flags & DRM_XE_SYNC_FLAG_SIGNAL) &&
> > +		!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &sync->fence-
> > >flags);
> 
> dma_fence_is_signaled() ?
> 

I don't want to signal the fence here, Phillip Stanner merged a
dma-fence helper that does this check to drm-misc-next but this change
hasn't made it to dma-xe-next yet. I have patch built on top of his
series to to convert Xe to use these helpers, when I rebase that patch
I'll fixup this code too.

Matt 

> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> > +}
> > +
> >  void xe_sync_entry_signal(struct xe_sync_entry *sync, struct
> > dma_fence *fence)
> >  {
> >  	if (!(sync->flags & DRM_XE_SYNC_FLAG_SIGNAL))
> > diff --git a/drivers/gpu/drm/xe/xe_sync.h
> > b/drivers/gpu/drm/xe/xe_sync.h
> > index 51f2d803e977..6b949194acff 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.h
> > +++ b/drivers/gpu/drm/xe/xe_sync.h
> > @@ -29,6 +29,8 @@ int xe_sync_entry_add_deps(struct xe_sync_entry
> > *sync,
> >  			   struct xe_sched_job *job);
> >  void xe_sync_entry_signal(struct xe_sync_entry *sync,
> >  			  struct dma_fence *fence);
> > +int xe_sync_entry_wait(struct xe_sync_entry *sync);
> > +bool xe_sync_needs_wait(struct xe_sync_entry *sync);
> >  void xe_sync_entry_cleanup(struct xe_sync_entry *sync);
> >  struct dma_fence *
> >  xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
> 

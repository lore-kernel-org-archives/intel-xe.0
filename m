Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07793FC72AA
	for <intel-xe@archiver.kernel.org>; Sun, 22 Mar 2026 05:35:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9477810E06E;
	Sun, 22 Mar 2026 05:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HG9C5Cbn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18EA210E06E
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Mar 2026 05:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774157740; x=1805693740;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6kOclZ+Dbpf77plrdAlEuqhhxylwgGmT71sKVTUpATA=;
 b=HG9C5CbnG4kNzj7zSpc2JSMuxOU8yvP1rVFJM08GikXVxK9WVSdIxKsi
 tms6n8SdLU5MzatJ4adisnNeat7t7ePxGO33v02TJKMC7rWeCHIFC1bJl
 OfS5CoVfXZ9+9kJbKd9kScjNHC57X7xfRqM2lfG5WZYBb3Uh4SwdZ5OQv
 Je8EkgKiHc+O8or/3/idRX0EvQNBl5lwXtlnkjITB4S33qlnwIHzkyJLL
 4UeI2kwZXKjeuRAh9HOqiPaZhGLm/PPE8ISA7uT3i43E+9elCSZlJZKDx
 Yhem6/dCUyFMNzR+M5pH3STIwT3Ih9b7ISA4+EvHAonn/c0uzmvsCCOOP g==;
X-CSE-ConnectionGUID: nCkQ92KISgGHMxFXEX3VsQ==
X-CSE-MsgGUID: jm7uGLXhQ46NgnjYIKLYzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="92574322"
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; d="scan'208";a="92574322"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2026 22:35:39 -0700
X-CSE-ConnectionGUID: rxrRkmczQfOJkGq3FxdeYw==
X-CSE-MsgGUID: sqSpewp5R7SJtzwxEDUGJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; d="scan'208";a="261603061"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2026 22:35:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 21 Mar 2026 22:35:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sat, 21 Mar 2026 22:35:37 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.66) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 21 Mar 2026 22:35:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W77t9zsh4/DLiQRp04TSxA1CfdOL40J3/jh09APe5ytq6LiaStYItGBEi1I+UeY1NIMIV+YeynG7qPUcNtMzYO5Mh4DLk6hWkwaR7raSpST3dVYnoRTA26bNbSqLWN4zZBBbbTbufO85WKQn3HRTWKyEBaUhWPMa3u8TM/dB6c1YSZGnvMM9fO0UFh20uc6nmzxAi9pJywRD0LAazdwL+ngNeEh3yZGgYUUMwL3Gl5/iq1aKd6cB25St5pVUJCmkN+O3GJ19dsEanfbNizUG60/VrKleSbgVKg3vp1x91EczK6X+sVEHo15BDapK1MrHhzZ3BGgTGPJqLh3zQvWXEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGo+Pwb3k1xyizCCaXbf26nIoj7F7BTPHvvdBBJBjMg=;
 b=a82ajcpRM08soOScLB9T+CDMXp0qTz+gp9jLknyJfgmka50CVhQaZANUQ8m/JyVpp1dK5PTVzUqHMO6S3/Gaw7lSyR0qW0SscK7mh7LkptdqVIAvdGcrdCuO2C50Go0wbGxsFwxr4YNEWfn8xGegTkeUtH1BmbV/wUMg5ewEfAXkvcwzT6aP8XF7PcdglBu3nS5hbI0uP6bI5hQAZcqRDpxmtLuj7l2BPlqPN5Y93IEwv8TlNKPJQEIb7jCPvge8E8l32sxI4UWqXFi9KEmXWJ4lpU0wSn8/xOSJ0mfEmLWExJ7ZDa9uEuAt4rKoABUKn5TW4m001s3SDLQfF4k6Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6527.namprd11.prod.outlook.com (2603:10b6:8:8e::19) by
 BL1PR11MB5319.namprd11.prod.outlook.com (2603:10b6:208:31b::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.15; Sun, 22 Mar 2026 05:35:34 +0000
Received: from DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::b36e:ab4:9ded:1305]) by DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::b36e:ab4:9ded:1305%5]) with mapi id 15.20.9745.007; Sun, 22 Mar 2026
 05:35:33 +0000
Date: Sat, 21 Mar 2026 22:35:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Yang, 
 Fei" <fei.yang@intel.com>
Subject: Re: [PATCH] drm/xe: Wait for HW clearance before issuing the next
 TLB inval.
Message-ID: <ab9/o3gr002U28RM@lstrano-desk.jf.intel.com>
References: <20260317232133.4106716-1-fei.yang@intel.com>
 <6a481f4d814c4247dcb62929b72e153ab7905cc7.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a481f4d814c4247dcb62929b72e153ab7905cc7.camel@intel.com>
X-ClientProxiedBy: MW4PR03CA0172.namprd03.prod.outlook.com
 (2603:10b6:303:8d::27) To DM4PR11MB6527.namprd11.prod.outlook.com
 (2603:10b6:8:8e::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6527:EE_|BL1PR11MB5319:EE_
X-MS-Office365-Filtering-Correlation-Id: f69badf7-b15a-4b99-cbbb-08de87d4d688
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: PuJ5mFuJ7Iao3zMY9J7+MizgRKJJQJWNM1q+DymI/YjZ8PHdYkm4CrVXZRm9zOZozBFG8LJJuP8KXaiwvVZEfZGafHRxww8chZy91TgIZ/SGcM+AOlSeK4qUl1P+zd5LxT3ionlJ/OVFTf4dQPbYVIaJz6mw+Si+dbfntwNXh7Y+Yp4LbVq/vrTd6z7Emgr/2VwEA4qpAhYtihv7zfjXjYZrtpn3cooOlpdGLSME+CFrBQqfMHep3MU9sFSaSl/oE/hncfMs9cng6tb1ErvDjN9gXNJ1k5bMwbM3aMfe6GfvRQcWeEAVZXdpOYtc5VdqGM1meNiG0OFIiOQl7AzsoLV4jQfu3OWiiPqrjY3qw815fWpPgOmjgVSMmBBaa+FRXKq6MmjTW6U4ZiylbOjfteuDpAbuEgz3ikJhpbZkkFQXAXMQk6cYrWJTiBnOtKDYQkpgEufUaPWOljOgZ0jCkRdh4344y4XCQ5RBt8/k/qYOOS/kmMzrjfh4F+W2FvFrg/JxcVavofmxbsUxMlFjklMvO5IQOfsTMxLUMGACwmvH3opC5yZvjl4VBca+hKy+gZHrTtJLsVCr4QTBRHeAcc5eCjV7LloAsIZ82sIKoVvCzi8lPX0irL49IyfXaeS+GwU19zF4vhW6kJLAoWU9pxreUeA2e2COlTZTiwjwGlOEJ2sRw9mt8SwIykElpaejOdCLxhSg1ESnX6a+8IyjswHKESf4WSehYPD4nP2h1Rs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6527.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUJHQTJZZTZ4cXZsbHk0VW8xbkdkTC9kc25na0dqTEVDc1FpWWlHN3ZOTGxw?=
 =?utf-8?B?V0FINjIvaGpka0t6UVZiRDR3U3JHQjlzYWhhalZ0NlZTSkVhYTNFR2dxWUNr?=
 =?utf-8?B?QitjOVZDcWdqcyt5NDJQc1ZvSExRNmt6SFVJWTVaRUtHY2RIZHQ1STk1ekc0?=
 =?utf-8?B?L0ZnTGc5bjVvR0ZuR0dHclNlTEpTb1picjZiQldYQ2RQYTVESHBrR0pWZnRJ?=
 =?utf-8?B?YkhTd1YyOWs2MTNXbHpYTFA5MytZSXJGemhmVThUYUxvV1FXSXFZWUhEL3di?=
 =?utf-8?B?TmJmM3FLVmxta3pUdVpPOWtKb09OQitmdDBsdlQwNHlDM3gzSnpGVVJpdmxV?=
 =?utf-8?B?VVBhRjJiZVNnNmNmenNGdlorcDU0RXZIR205U1BJL2tMSWdBaFpNOTdwTHdD?=
 =?utf-8?B?d2pDR0Z1cHg2dDVuMkdBN1k0dlRBSDFjbzZzYU5qTFpOOWZHQXUxdmFDTGFY?=
 =?utf-8?B?OVlyRUJSK3BUMytVOHBkdU9jWEZKeDA1T0w2c1BkRHc3S2FObEI2RWtIUys3?=
 =?utf-8?B?U2ZrWjNFV3hqT3pwZ2ZyTklIT1V3dmNwSUc4ZDdxaVhENXA1YmF3aEVPaGYw?=
 =?utf-8?B?Nlk2Y25OSUFpczJQSENnSGFsVW1iUDZUWGMvK2Y0UGJYUUZVNEFNbVFQeEZL?=
 =?utf-8?B?R2sxRWQ2eGxKUHVPNHl0UTdtTVh1ZHA2aURjTWE0eDBicWNrQVhoYUhJNzNm?=
 =?utf-8?B?YTRoVThKWEFwNms4VXRNU3NzZkRaNUFkcUFSSmQvdXJWS2JmS2VNc284YTlD?=
 =?utf-8?B?bXV0Y3htckIybEFZWW1OUjRlZy9lamdwdldGZ1c4Y1piWXhLektwMXNVWHd0?=
 =?utf-8?B?Y3BNVnpmRzFWYzhwd3RTNmFPRzl5YXJpcmtjdi8vamRmendFS0RlVHJFK1RV?=
 =?utf-8?B?c1Y3WnlROU1nbEpoS2ZZbXJLNGtsbjNnaEtLcDF5UUJTelJIQXZ1VHo3TXov?=
 =?utf-8?B?T2RUeVJlYURlbG4reGdBTS83MkxwdU1pUFYrZ0YrUFlLYmVTNUlwVklLaHVS?=
 =?utf-8?B?dXBMUEE0L1dIdkIraEM0SDkvajYrcHhReGQ2S21qTjV0TElzeVkvSWlUT0xQ?=
 =?utf-8?B?VXNTNFJ4VGNUZUR6VkpFTEI0SEJMYStVY1MyRTYwRDVVdzVNYjExNGo3dCtv?=
 =?utf-8?B?UHFnalFCZGVHZ0RLaTgyeWRrejhkMWVrYmJ6cHhvSGFpVlFQRnRjaFpBWE5T?=
 =?utf-8?B?WEloMEcwWHNrbEpCOG9pZmlnSkduYjhDSks2R09OSEFGR09rYWF3aWRvNGov?=
 =?utf-8?B?ejEvQTJjcmc4Qkx0SUUweHlOT2NTY09qSFZlYUhZa1dteUlXNDE2MXQxM0pq?=
 =?utf-8?B?UlR5Q3ZtSStacnA2R1FqTGwvc1I1NmcrbklZTmdXdVhFd2htY1dIOWZFWGQv?=
 =?utf-8?B?QXFRL2xBdUppeWx0K2Z3QU0yeGlnYmRpWUFCKzB6V2dYakl4UnQzT1V2TU1n?=
 =?utf-8?B?MU9PUzFBRDRXRk5BZjAyK2t0NmJNOFFicjdGQzZHL1NEWVJzT3NCSmdhK3Va?=
 =?utf-8?B?dTYrZXNvME5YVkVYcEJ3WlljZDZBUTJFN3hRMVVBd1dadE4wT05RK3JRYlUy?=
 =?utf-8?B?T2ZyNHV2a1M0eXFzV3pXcUY1RUVieXhaaGFJRnpLN2dTZytnVzhmNGNGQUxp?=
 =?utf-8?B?b2NseVArZFdFNHNIV0gvN3psMGtySUhGNFRlRit4bkxQbS9zTVRhSXZsRkpO?=
 =?utf-8?B?L0IwWXl6U2k1aGxCeFg5eHp6dmlsZjZ5TVloUkQzQ2tIM0JIV084dGhWd3Uw?=
 =?utf-8?B?cXAyUkpkYndUUGZTRXFIRzFqVnA2eFpWdFMvenBnSHRDMEN6NEg2THBQZElM?=
 =?utf-8?B?ODJBY0lUUExMN1F1MjFyYjFSaUZDS3gvUXBsOTJ4anNDTTNJYUpXQVV1QThh?=
 =?utf-8?B?NThUYjlGQXNKbEtYeXY4Mm43bjlwelp4RjRna1VBYlY0RGJmQ1VpNGpKSzc5?=
 =?utf-8?B?Y20rRVlZeHNQdWlkdHFJeTVxcllqWmxwRUc2dzh4SWFOSnlHY282MDBkaVJm?=
 =?utf-8?B?a0JWdGJuSkVzaWp2ejVnd2U2c3YzZkZBSDJhY1hESWp4R2JOUXJvYndjWU00?=
 =?utf-8?B?SW9tZlIrTlZRQjRGMjFOSmNWT3p1dFpaVS9GNi9ZOWN5LzZKOWtpQkhHZWVV?=
 =?utf-8?B?U1FoVXErUXdsM1VFdDl5MStjbnI0ZjZ4dFJ5VHltRUdxVWxIcDVZTVdldmFM?=
 =?utf-8?B?ZkFGVFJCNlN6cm5ReVVZQTBjR0tqM2xVa1djcG9vNVhjL0t1L0JqYnU4K2RN?=
 =?utf-8?B?d1R0bFUvTUtyNTRCN2xNU0ZEWHJMR0JlenZFWERVQVo0UUlmalFkSXFMUTFj?=
 =?utf-8?B?bkRHenptQUNzNzd2Q1NRZXFjbzk5YW1UcHIvbjJHd1N1NG9WUVNHZz09?=
X-Exchange-RoutingPolicyChecked: aMtSBAP+qAi5+XUoHFABqimnwrJUZdc+4YZKWJjnOSteV2lNv2q2SFBwz2mjJtjo8aCnYcrPruKwoSgoKwlM0O/JoXHNcmY7ZdQN/fwkyrACBqPXxa+WcO5J+aFRiXzqm3GYhsmfoTcxnXikQzJHpdiFe4nltZpJzzPFVn0pKbjpZA1H1VuFquiZwPg/aKdASLuF+e1VJil+oIAhLd+dGUwBpQidoqHQgeyHM7DCqSgnIhacEBnzl5KsvkBgv+cH4N+XWsqsngpJzZZLOkDutYhNObmcHgkWWARL1K3L9+jr22EkLeWxDB047kJJ47ISg/Cf0kepzfm3ss0ovkXQEg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f69badf7-b15a-4b99-cbbb-08de87d4d688
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6527.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2026 05:35:33.8080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NmdlmOlhyIoGLWFVOBtA6QdB4gf+JruKAcqE3VzxsPp9KIpyDpKN6f7/D8FYWORe08qcvr6gAUOcH2/d66z9Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5319
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

On Tue, Mar 17, 2026 at 05:28:14PM -0600, Summers, Stuart wrote:
> On Tue, 2026-03-17 at 16:21 -0700, fei.yang@intel.com wrote:
> > From: Fei Yang <fei.yang@intel.com>
> > 
> > Hardware requires the software to poll the valid bit and make sure
> > it's
> > cleared before issuing a new TLB invalidation request.
> > 
> > Signed-off-by: Fei Yang <fei.yang@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > index ced58f46f846..4c2f87db3167 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > @@ -63,6 +63,7 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval
> > *tlb_inval, u32 seqno)
> >         struct xe_guc *guc = tlb_inval->private;
> >         struct xe_gt *gt = guc_to_gt(guc);
> >         struct xe_device *xe = guc_to_xe(guc);
> > +       int ret;
> >  
> >         /*
> >          * Returning -ECANCELED in this function is squashed at the
> > caller and
> > @@ -85,11 +86,25 @@ static int send_tlb_inval_ggtt(struct
> > xe_tlb_inval *tlb_inval, u32 seqno)
> >  
> >                 CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> >                 if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe)
> > >= 20) {
> > +                       /* Wait 1-second for the valid bit to be
> > cleared */
> > +                       ret = xe_mmio_wait32(mmio,
> > PVC_GUC_TLB_INV_DESC0, PVC_GUC_TLB_INV_DESC0_VALID,
> > +                                            0, 1000 * USEC_PER_MSEC,
> > NULL, false);
> > +                       if (ret) {
> > +                               pr_info("TLB INVAL cancelled due to
> > uncleared valid bit\n");
> > +                               return -ECANCELED;
> > +                       }
> 
> Is there a reason we aren't waiting after the write to make sure the
> invalidation completed? It seems like we should be serializing these
> and at least making sure hardware completes the request rather than
> just sending and hoping for the best.

Yes, this is correct—we should after wait issue *if* this code is
actually needed.

This is early Xe code from me, and it’s questionable whether it’s even
required. Typically, if the CTs are not live, the GuC isn’t doing
anything meaningful in terms of referencing memory that the KMD is
moving around (which would require an invalidation). So this entire flow
of issuing a GAM port TLB invalidation is, again, questionable.

So I'd suggest move the wait after issue, plus throw in:

“XXX: Why do we need to invalidate GGTT memory when the CTs are not
live? This suggests the GuC is still in the load phase. Investigate and
remove this code once confirmed.'

Matt

> 
> Thanks,
> Stuart
> 
> >                         xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC1,
> >                                         PVC_GUC_TLB_INV_DESC1_INVALID
> > ATE);
> >                         xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC0,
> >                                         PVC_GUC_TLB_INV_DESC0_VALID);
> >                 } else {
> > +                       /* Wait 1-second for the valid bit to be
> > cleared */
> > +                       ret = xe_mmio_wait32(mmio, GUC_TLB_INV_CR,
> > GUC_TLB_INV_CR_INVALIDATE,
> > +                                            0, 1000 * USEC_PER_MSEC,
> > NULL, false);
> > +                       if (ret) {
> > +                               pr_info("TLB INVAL cancelled due to
> > uncleared valid bit\n");
> > +                               return -ECANCELED;
> > +                       }
> >                         xe_mmio_write32(mmio, GUC_TLB_INV_CR,
> >                                         GUC_TLB_INV_CR_INVALIDATE);
> >                 }
> 

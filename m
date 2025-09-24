Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8DDCAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 20:16:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91AC610E257;
	Wed, 24 Sep 2025 20:16:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YJiJObkW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4CB10E257
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 20:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758745014; x=1790281014;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WJxU94isXypE+F8YnJr5nDuOXF+3+ZECoVNOsKyIcJs=;
 b=YJiJObkWoUNe/5R+Bpx9tUM2nKwYWlk2TiEQoNjVS28qtBKufcD4bg3L
 0tnTeYe6yILljOCimwIfy0YXS2HqcjWs18QhBp++mLKXQP8nV5yJp1twZ
 rX8B84QeXsIfLN8IGpPs4EmEzaWl0SlRmkU+urlBAn+pTwBiWyThEGg1G
 jvyrvRYp4GpUnsVRfTqnYMsdd/kz1KmA5sNwY+8E3qaYMfBWm3YOP4ve1
 QJ/p0+mkB4+8CLt1WlI1VjI7K9nNtvxJBjXiQSUN5x4YAp+FwYVc+ca7s
 bXEevVBr2Om/XLSyHZGzCalEvuASpSKyKnNEQpQWeJAqtP8ROdFZdOL9B Q==;
X-CSE-ConnectionGUID: RhPK2u8STP2CeYP0wgZzcg==
X-CSE-MsgGUID: WKMKNeOlRMqYTqwy7vuQow==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="61105383"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="61105383"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 13:16:53 -0700
X-CSE-ConnectionGUID: SYgZrpSsQ0uxDh40GSLrbA==
X-CSE-MsgGUID: rgw6oMiRRAG4OeCzLyG+2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="181132893"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 13:16:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 13:16:52 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 13:16:52 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.13) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 13:16:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ssk14+tqQrp3YczxoyNBrVJ89iSopYU4rHlXPaJY0rrEo5MrVbVDNRzQiXTIHyznHp3/rk+xXvH80ZSeYEZO9DTricN4tB5/4dCAn9GDB9sDtJqX5ylYatkhjxQWUyJu51cgaXFTwFVbpcQoRB6OIaVmg1FuWPU0AH8NgEm9k8Vrw0Uro5WcudrPAm2zpoqabxRuDV3M7ygDUjTXJk7G/72nijKpeMwIfve0TP3Rc3CXf5TjxJqzPf8vAknCn8pRh/yR+QcEVHNyNHLqNwB13ou6snhVFSQvRncHvuf1bIkESFYrjiFMUp8fUnUerjl4CUyODSy3nDZnvcpcLixkYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xylSQqY5CdUD0S08HoYWQafE+Lktb0/tgsO/ongW9O8=;
 b=gXPczI9sTetUTKPjDVv/wxrIO32ugbqaX3x2WYh0dsyaw9uF52S0QXQtXATlMHCK6+xbbslkV/vRMoo6x9IzIGlDBsdzRoNotXR8LTxIpalMRtvipRB2pogo3hGp+e+U1utNOOKCnCD0mPoUALhMwxddiXFZsWZrE/PeCYyzSlfFTOYcq/FSQa3bBVfhLcHsYVMTNeXSLtpNcjRxqpGAeYgIfZwhN59eFUia926ybKRSnp/u/b1G/p8ruA0Rhe5jE+EBC+ysuLSMSENtf1snZCeuOhvn6F97NR7S9UyhS/CdFRIz9xdMinJrjrPdLbO8w/w1/QrjYnS+LEiihV6H0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8093.namprd11.prod.outlook.com (2603:10b6:610:139::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Wed, 24 Sep
 2025 20:16:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 20:16:50 +0000
Date: Wed, 24 Sep 2025 13:16:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 20/34] drm/xe/vf: Use GUC_HXG_TYPE_EVENT for GuC
 context register
Message-ID: <aNRRsEL/nQ8LBzQz@lstrano-desk.jf.intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-21-matthew.brost@intel.com>
 <102156c3-a7e9-4237-9f19-866b814b3301@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <102156c3-a7e9-4237-9f19-866b814b3301@intel.com>
X-ClientProxiedBy: BY1P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8093:EE_
X-MS-Office365-Filtering-Correlation-Id: d1a04487-0eef-4c3d-5607-08ddfba74b92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AFUOU5FnKLfzTc9YWB8uHzN/UK8F9YDo3+GAMLFMLnaRM2mWISrrATvQ9DgF?=
 =?us-ascii?Q?DAQNo5CkylR1FGMLnWoASaQ+UYoWF0GMCgrX5fAq/8f0Ytf1YnCI4QNcPAYS?=
 =?us-ascii?Q?mxD1IYKCqjkdRfY1kIp9xmMFdfL7wqlvnfGZFqo9INhOAlEGoXP4B6KECdhW?=
 =?us-ascii?Q?OyyZWRa0z8YNkw3EkXMl4TUZ5dxdW8aXYPEIhPlOAuidzkJfJDuUI5b55eg2?=
 =?us-ascii?Q?pPGcUwZrk9bRLQp8CrOOnn/2ccGms+dVgaWcsAJi2ABQ2wtX/Dy/sbLmqvGn?=
 =?us-ascii?Q?0cIhoocMLK+tUXczh7iBJuiAcaRHQ9B9wgSImK2d3bE0qlUoIkoit22agU+u?=
 =?us-ascii?Q?GgAaenk9Y8Y4302fBzdPj2p9LOUoPkrMqaWdT5AybU9HuPoNg3ZJqCpYRtFE?=
 =?us-ascii?Q?nNdZsy13SEucHK7E/MGEjb1al3ZonQqUMsDHlCXrbXmP6aMxQ6VIsFXU9Mi4?=
 =?us-ascii?Q?UyeWZorcN7fLua1a1wpXOWR7zO5vCAEfQX6OurxEPcKeFxTHKOu1YxGi+jWC?=
 =?us-ascii?Q?7o0dXkAYBt+Pxw1ceYPM+bBLKwIeJScUzIToPRqXHQe1JGXukqsjqBlCbHhc?=
 =?us-ascii?Q?SjmCD+eG/gQ7yyXnfB1HCEwrsRptelfjslFUAFk0Di90piIeIo7ZYfAlUWsh?=
 =?us-ascii?Q?yz7XxspRDILsoNr+ZRF2Yww7FMzTNFg/tPnOIy7d3NYzThBhxOLn9J//exgW?=
 =?us-ascii?Q?WvSLHPuRVf7fkRCJ/sOlkiDU7uYsvV5/fgjDMaMCoiHiJFegtLuzP07LZB8Q?=
 =?us-ascii?Q?8UTOXyr0KVk9rR+vaJU1sxEmOx8r4QfA+vNf5jIhN83oloZ8zpdQMusfuNdI?=
 =?us-ascii?Q?Ge3mBFqULtlacsiogE39f2JpxQoK+q00ZpwitCgY+Ns+8yl2BF4mnfJrpj+m?=
 =?us-ascii?Q?NUgrLV9xLAShPH0F0KF78QPl3u40pBwhgfjMwwnZwdUGC9D7ry3H9eaNlUFm?=
 =?us-ascii?Q?t3Vcib9E61Fct1gs9USxm67OdPATuhtTUphMnpsXlmidlL/utBUVjkoyP7/+?=
 =?us-ascii?Q?4OCI6RIbpHqJvxdIj3UYUjiqGkhLa7dqEiK7bqtZ2N5l3VCoBXV6moon3s+6?=
 =?us-ascii?Q?B2sHoRzFZWyQRz4aumPJiJSEXPjY39CZ9RUb3emnDxxC83AMBb8U5dwgPB1V?=
 =?us-ascii?Q?+LaPRhB/aSnwi6/9wFPF8KBQQ0zvgi3b/0LxJwH60V4BiaR8mvtdOqKCYyfF?=
 =?us-ascii?Q?MVYJuFBBIGqvWjNW+D4TyUxSE3TOBU9TcPeQYer5RqJqaWvPWJpVBCL4gg2f?=
 =?us-ascii?Q?RNZu7setTQSFWzzNnNjrY4NN3JPPEQjaZiYPn+W0nudbKU4KGqZoMZ5mV755?=
 =?us-ascii?Q?cHwdQuVpzEx6fFvp8o7V9qdOhjw+FlrKDqVXWVVLeZ3hjdeCn4aSlGR5wZvK?=
 =?us-ascii?Q?Spb0RcAqsXDO+OBby2WkUD6a+J7UVArZFrsffCKZtbMCpotpvGBG2h3jBpSS?=
 =?us-ascii?Q?fPgcRoh8gx4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JPs243yvG8Gs5VZTkJco32kp0IUCYCXC6aACD0QmJnpSn3RERBfPNcU6wWd4?=
 =?us-ascii?Q?dQuA5wJ18khiXVKqe5TbrrYItBgD1328Uf8Lib8dN0t07UbpvZVBBaXFh/W6?=
 =?us-ascii?Q?0PFVytBRI+CM833BdgEtGzpgUq7eXHU0Ns5QIXcAfAM+YqkFRQJVjuS3IT5z?=
 =?us-ascii?Q?ptBwfb6MkXDy50m1rV9wPrqlO+SmCXVfWxOgsLHUWPLx20jg3O566wl6xamy?=
 =?us-ascii?Q?qKtJZ/9tbgaCPnBFLyEaAlI4pOqIyrxcNK3eJrfK5Tl810wppkE/yUit15XO?=
 =?us-ascii?Q?Wuxc1+kY3a2Hs09yyyOQhYahLulAPHKRI7tJ+uDNFu9I0IdMEemtVQ4mdatV?=
 =?us-ascii?Q?o6lCNrzgcR9mXUV9ifSfKyqn002dpNGQzPeXiHihiaxq0SPxokK8ew5s57nm?=
 =?us-ascii?Q?nU/U0A7M6hIAOywtc2JgEzeBBApnCT6gYc56o6Hv3HT0KLLKRDjGNr4xmJvM?=
 =?us-ascii?Q?eGNQF0PhCKI4YgbGUkfDA0LuFOab/xzYXprJFDiDi9dwljeC0GFvFWQmZGvi?=
 =?us-ascii?Q?aywynAU53fffOz/cMouUR2vcZpZTuM4JZD98JuJYEWJWEIb28PAxxZfJu1RZ?=
 =?us-ascii?Q?JWjGATYPFnQDuTDOIJvpNHr9IqAHqiPbbXQnHTenzs3j1U6SePgC5rYTFn5A?=
 =?us-ascii?Q?kX8njE0vmsgjgfWxcjwiill1OuiXcCypE6wEl+jO3ePs8CEFPsBcTX9/4FV5?=
 =?us-ascii?Q?YlFO9DeKqoO9GxDCWPBtEUoA1J52zP2bzxAGi60CbNGvtAVDsoNB7bBPwFyI?=
 =?us-ascii?Q?X+cDKKs7RDdrq4ylXeMR0O0t/64LMqYcCfNgCC8N0OUDcZG1aVBCce+0b278?=
 =?us-ascii?Q?mUjjmTrVnI/uhIE4MwLdeZqTjPL9TFH6Z7oRnifgpmoZxlGZ5TLNMiW/sPau?=
 =?us-ascii?Q?sfDNgTzCXECzludVVa8LMTcUVa6UkDmgAhadrm47C84bnQHb9EXGPLP8NTzE?=
 =?us-ascii?Q?A0OK5DkvP1UMyTBRKnnyG3zeH2U6RINdIVIIVK3xbCqE5tGzObpLp5UNC8zC?=
 =?us-ascii?Q?XSty/Hfo9VdqNY2MfA9DWVRxbb79vHWMKw6vBJVB8CKeH28a5vZMSAJamtEO?=
 =?us-ascii?Q?Yu+QoUC/KWs2/wKs5/M+ZlBIgMoQiSBk4+qYF8miJl3nDxvgseCeyGkORg8X?=
 =?us-ascii?Q?N6gIKewal/dEuyzBViRvapYjeUVwhisWA/wusPSz4QyxoFP60OPrEqxR3aLk?=
 =?us-ascii?Q?0lJrYdjKSn41OYg7fGxx8/5FQCAYsEgljLM4BMsQsu6N4P4GFutV2JKK0C9s?=
 =?us-ascii?Q?LA2YltYbI1w15P+I6/u5XvXykvmyxBBAK7rE0os6odsfk/QqP1YG01xoBEEE?=
 =?us-ascii?Q?ojxE3RkhA6ICXIK7ePcr8Die/nwzRFgjUuwENs/OhfhTm5gUiGC3ACxIL179?=
 =?us-ascii?Q?MDuDQpIY7Vehrmj59NoRiGVJCDzSzUEMccSKiVXMSZ1OW2K4T6XPWghNK86P?=
 =?us-ascii?Q?vyHz0QTyDF0Hb1B48tK8dFONDllWIxFGJMrZeC2KEJ9hRyYLVi8WwDvdZRyj?=
 =?us-ascii?Q?AAZT8n8Af/0gui+gABWbW8x66vPfxoOOcvuSvEm1pxJ6zMU7nRLA12N0Use1?=
 =?us-ascii?Q?FZIGv/AanWgGe8aQkkJFZW/EKGgnNmhwOitJsZqF1E2//JQjvOXz+R18fbOR?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a04487-0eef-4c3d-5607-08ddfba74b92
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 20:16:50.4044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HDSp4+WQ0eSS4xA3J4fP5e9nVsj5ZFr9YvPoo7cOMeUJmeQ58PXPlbWW8lN8+Hc/k6Yt1gHb20vR1W3/xPblmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8093
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

On Wed, Sep 24, 2025 at 01:15:12PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 9/24/2025 3:15 AM, Matthew Brost wrote:
> > The only case where the GuC submission backend cannot reason 100%
> > correctly is when a GuC context is registered during VF post-migration
> > recovery. In this scenario, it's possible that the GuC context register
> > H2G is processed, but the immediately following schedule-enable H2G gets
> > lost.
> 
> what do you mean by "lost"?
> 
> if it was not processed by the SRC GuC, then it is still in CTB and shall
> be processed by DST GuC, unless we strip it from the CTB by ourselves, but
> in this case we should notice that, no?
> 

We do strip out the CTBs and GuC submission state machine will reply register H2G.

> > 
> > A double register is harmless when using `GUC_HXG_TYPE_EVENT`, as GuC
> > simply drops the duplicate H2G. To keep things simple, use
> > `GUC_HXG_TYPE_EVENT` for all context registrations on VFs.
> 
> with this we will miss any early errors from the GuC on non-migration cases
> while unlikely, IMO we shouldn't just hide potential errors
> 

I agree this isn't ideal but this check is present for non-VFs. The
registration code is generic so if we had a protocol problem our CI
would quickly catch this on non-VFs. A fast request failure is fatal to
the KMD as we take down th CT and issue GT reset when this happens.

IMO we live with this limitation.

Matt

> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_ct.c | 32 ++++++++++++++++++++++++--------
> >  1 file changed, 24 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index 661ab1bf4502..aa9fb08f7856 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -737,6 +737,26 @@ static u16 next_ct_seqno(struct xe_guc_ct *ct, bool is_g2h_fence)
> >  	return seqno;
> >  }
> >  
> > +#define MAKE_ACTION(type, __action)				\
> > +({								\
> > +	FIELD_PREP(GUC_HXG_MSG_0_TYPE, type) |			\
> > +	FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |			\
> > +		   GUC_HXG_EVENT_MSG_0_DATA0, __action);	\
> > +})
> > +
> > +static bool vf_action_can_safely_fail(struct xe_device *xe, u32 action)
> > +{
> > +	/*
> > +	 * If we are VF resuming, we can't exactly track if a context
> > +	 * registration has been completed in the GuC state machine, it is
> > +	 * harmless to resend as it will just fail silently if
> > +	 * GUC_HXG_TYPE_EVENT is used.
> > +	 */
> > +	return IS_SRIOV_VF(xe) &&
> > +		(action == XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC ||
> > +		 action == XE_GUC_ACTION_REGISTER_CONTEXT);
> > +}
> > +
> >  #define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header and one DW HxG header */
> >  
> >  static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > @@ -808,18 +828,14 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >  		FIELD_PREP(GUC_CTB_MSG_0_NUM_DWORDS, len) |
> >  		FIELD_PREP(GUC_CTB_MSG_0_FENCE, ct_fence_value);
> >  	if (want_response) {
> > -		cmd[1] =
> > -			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> > -			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
> > -				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
> > +		cmd[1] = MAKE_ACTION(GUC_HXG_TYPE_REQUEST, action[0]);
> > +	} else if (vf_action_can_safely_fail(xe, action[0])) {
> > +		cmd[1] = MAKE_ACTION(GUC_HXG_TYPE_EVENT, action[0]);
> >  	} else {
> >  		fast_req_track(ct, ct_fence_value,
> >  			       FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, action[0]));
> >  
> > -		cmd[1] =
> > -			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_FAST_REQUEST) |
> > -			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
> > -				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
> > +		cmd[1] = MAKE_ACTION(GUC_HXG_TYPE_FAST_REQUEST, action[0]);
> >  	}
> >  
> >  	/* H2G header in cmd[1] replaces action[0] so: */
> 

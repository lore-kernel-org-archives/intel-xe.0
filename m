Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38762EB64D9
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jun 2023 02:18:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B1F10E15F;
	Fri, 30 Jun 2023 02:18:51 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E8C10E15F
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jun 2023 02:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688091528; x=1719627528;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tqAXUhlL2XE9/3rBKE4JcrDubNRzX6O6yPScsuqQg5g=;
 b=cIAsxhRmQa6sbrieKb9/Hii5uCjgaeRuviyw6ehqgMayKqXZ9f+xkCbA
 OmW1GD9y/KyQtymOFDHbr438TOE/aMPhPbgnum1CIe+CkzyNeNEkErONP
 DXfunb4xaao77S8pyEeeRMdNjyXkTqkz5SAmjzMGsyrN9g50h9AxU5XZ5
 YLO3hCR0GT3R6oRksgWfq1arqzjn3RRil/f5sSuioCt6WQSYjsiZPc1jQ
 fW9V59vBRrD3xribtgs3Rsfe6prtSd+9bzBundGrKWxcrGrYOqS8kGCdE
 4iXrAZfK79NGRhuDHzRuiTAnGlU5i0icajE6k2G1ylKZLBTvcHcmSFLAo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="352112004"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="352112004"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 19:18:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="694874287"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="694874287"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 29 Jun 2023 19:18:47 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 19:18:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 19:18:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 29 Jun 2023 19:18:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 29 Jun 2023 19:18:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K0VtBUPFMmcaXpfSUnE8uFmxz7jCdi2EqnO6xKx2hfcCpWq2m8CAzK1g8/oawHTbqUXJzRIJZaz9Va8k4cud18rM9NxBPW4UJQqyxa8Zr4p9fgJfVdokzmYpIafMz4U3HNARBeCwm2cGyUUoDXW+occhjMJyp/Xfr7lDaSr0EY/87575oI2Sw/UtOXyFQb3FIA+6V7m/AOt5Nwy3vTEpM7V/H/cOn8Skm/6G+4BCxTaMYoDrYrR++qQkfZjs2ha18aaYmAmV7WDmxNn3d2ROH72P3PZSSgOCqSjDQn2abMt6rzDkcgylaYWqmV9gSTee1Cqd+T2Q39s2yCQ7j1bc7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VzDUT7wOUZqgrOQ511VEvdh0mISzEJip3kxUx40ciqk=;
 b=f/zxorAgxEeVeWUrJ8nbMKfah0peGD6EF/SC4bTKYyPWJdGKglx8DxG1hdzY8R4WZpn7kVA/NCYJnHBLg273dGLfOHsfhNmEr8S3g09vDz16pYW55ohGUdekZ4oGl1Uup0KFJfkN5RxgDqBEGhRR0RZREJ0w2jU/hDXXbOcyfgvmRkK/YUOeys3nw9frDwES4K1iu1q8vEHM0vq5TM88EnRwEbB+p2JiUlQnm0bhQpIzBoeLGzotw7Hs6ZKR9F1w0mT5t8jr/KOXzO35Rl58+L024HNSh5iIlgVHfDLK4Q6iNvqOigEScBZW7nazP9mRKXIz61Qsr5pMuML7Wm1sLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6341.namprd11.prod.outlook.com (2603:10b6:930:3e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 30 Jun
 2023 02:18:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6544.019; Fri, 30 Jun 2023
 02:18:44 +0000
Date: Fri, 30 Jun 2023 02:18:07 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZJ47X2PmlPDNbFrj@DUT025-TGLU.fm.intel.com>
References: <20230629205134.111849-1-thomas.hellstrom@linux.intel.com>
 <20230629205134.111849-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230629205134.111849-2-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR06CA0070.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::47) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c782269-e155-4516-256a-08db791053bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YFwrUJsUYxdHykO+563/CbP7C8DuGscVu5wrK6pnY9vfbEkJSC0yn7b5m0k4x5ZHNVMT+qSncID5W3mMi5eWktGnIMXGgzjF2Y7IM8bwviNrSwKkrKqBN5yvt/9tnF+5Hp2ZZKyikHTVvpd2f3Zz662lYAjn8lZPCGUXCGW153PTeQubbLpC7MVecZ0ke30VXHMPeUVdS3PNEh7h+pIqx30RipZpKnjQNq60FR1uTwg8kWC6YJesOss5ImYe6mHCecEEU52Z+E0yhYmdB2TltkzqTXE1sfNsy4h2cxziPtWal5fu47dBP6fs3fhqLG9zu+0VmmkVts+fk512U5azMFg+EUiSL0g9fzfuSo+6RFuHBLTTNkL7eqeYO3ZCikfrc0azMFXz9sODqereZeNLK+k4QIiwqTuSENdWpA/PjZtCal8XtMaU3+A9GXIW9woTo7WipQcGFo9hrn1Az/f1/5bLSfIMfdRgyj475R3UCSN/Mw/y0Zjj4VvNL+3J/RtSbbtI+dQyFO/P/b8Qq/iURUQH0jdOsuYkDx2Z0g2Ont+2OUpXjDFJJXFlYJjUUorU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199021)(8676002)(316002)(66946007)(66476007)(186003)(4326008)(6512007)(6506007)(26005)(6916009)(8936002)(6486002)(6666004)(41300700001)(66556008)(44832011)(5660300002)(2906002)(15650500001)(478600001)(82960400001)(38100700002)(86362001)(83380400001)(66574015);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?O8/ZpoGumjuje3LrwtFx+kf/p+h0FjcN0uBHHXzhIZY3DjyhZ4EVCRL9Ri?=
 =?iso-8859-1?Q?D3yHvd3iFfVKGALPfveP9lR0eePeFa8+AEQkkdswbarG5S+L6v/6I4ECJL?=
 =?iso-8859-1?Q?FpMT6MG8vD3ecz3zs2bFZlbRYrxIMlsIJSGGwvlZyySx2Dhx+8oEPlo2NK?=
 =?iso-8859-1?Q?cBpT88G7SqW8qYai+xYVWWIvmHRS4dwS8hPWsuc+Y/ViH5di4FhYINMng5?=
 =?iso-8859-1?Q?imRXTyI3LdvM5K+dGMWi+pjUVklF80VhAwMtWNSk+SCo9voSL0vpsR/G96?=
 =?iso-8859-1?Q?nuM8J9NO2Y/1QZVKr2GCenfZ2R5p0BZAp1VScAIPodTf1ksNcqGL+OEaBb?=
 =?iso-8859-1?Q?js3CNVHYTmvQS5l3JPWvydOXyRc4Rk9z3HqH7DA8zZ3rgfDO8qtWnNIZoP?=
 =?iso-8859-1?Q?oSjMkSh7treg2PLaq5P3WG1ai+eOfP7KGk/hPt/2a7jc+dj3J7vfHA4Hzt?=
 =?iso-8859-1?Q?0oIu3MKHpSnUcMlK4Afxhfz5ftHBl9gtIMf9yC1tBwgIZ5nKeOYQ8Pd2Xm?=
 =?iso-8859-1?Q?0baUCqikyirtxLnNFV/EMdtTwEFz7XpotjXImFqqsAUuEgyLZvK++T61VZ?=
 =?iso-8859-1?Q?4LwHxavQ0fyrcQ0eKh5shPVlawz4qKFRb4urYuz8NowBIL+BnySKli6P3s?=
 =?iso-8859-1?Q?vpFPpzsQh0oQilaLQPyf8o2zwvr1gQEhrW/uUkZ6Wy3GQlJxx7mokeP0ji?=
 =?iso-8859-1?Q?RZYNJ84xhf0LiMg4AsIQfPlahVlUf8uYA42UhoAx+vJab6dheYc+inxvzc?=
 =?iso-8859-1?Q?JTNp1X9zBQ6RXxVNfEg85L73MGa39UkJie8ZYOHzEuBlpf7k+4lzsagdYE?=
 =?iso-8859-1?Q?nNUMRwguOe5mTd5KKyOVihcWQ3vFTbBlrNiguwVwrFFcVoK9r7Uu6o5pVY?=
 =?iso-8859-1?Q?//Y8mZgd9tz9dCrurBvu75aAyq79HnRs1Xv6vBJLPFR9Sgb2AMWLZ6deNr?=
 =?iso-8859-1?Q?tX0FHO7iyWvKrbOe4VKzVYRD6r98f1IcjvrkAz8CDgkUfOz/0Gt9KQJzFf?=
 =?iso-8859-1?Q?011smrj/uDAfg791VMB3d+fEF6f5S9aaLLqbTvc7af4WsqQAlamWnkk0Hh?=
 =?iso-8859-1?Q?nIcXAvb+A9Tlmwtx9s13At5IRQVRWjxq9Cd484EzeDZ5HBREuX7Y8ZYZXG?=
 =?iso-8859-1?Q?uE3ptHgvfJ0OiWdGpvXHY6psdlpIkDerx++pjIbpeIs+MAJRGOxS4ZBLzt?=
 =?iso-8859-1?Q?M6mAXlz9DdJuImAexFOULrWC3CRpR9vfwsyPgCkP+GyfsD4m5tJxfIryEp?=
 =?iso-8859-1?Q?QGQ13Ii82q2snHKVtkUaNoVY0A5jrMFIe355hV3frXAchXjtyLU3g0Bmtm?=
 =?iso-8859-1?Q?4VJhV83xiRdLjmavNd9SmBF46mF3I7qzRXAlpymtqu1FDslqYXFt10pNjI?=
 =?iso-8859-1?Q?zhrJ19aC/2g4l+6rC5hR+g+AOPLNc2Wn3ZMbXYCTAoOLI6UgAqv+iuqK1l?=
 =?iso-8859-1?Q?deAwKwMyyYRYzT8CYOK1ZT8+VDojMXcm84VBNMEEeGqquOMY0rgpte8k4d?=
 =?iso-8859-1?Q?jnnk2oTYfLnxyPsI8H9JAYdx8+DGURrChNflwVZ+xdcZDGHDymPSK8k9Pz?=
 =?iso-8859-1?Q?G4/KDHBXcUUXdEJ0/geWvlou2hLq+9nfV2vDqyxX9AEgopNH2HHAe+rkaC?=
 =?iso-8859-1?Q?qUYlZaUGZg2IJZaQyiO/IBUPRsNrTqo7OtV441YiHDb4/dgG3OWOIA/w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c782269-e155-4516-256a-08db791053bc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 02:18:43.8617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tPDhZ55FA9OQIGDjmeIAlJUHWvpVa289uYTRmyrnzXdYM2VaKevn6pI0Fg69r479kJv9ckcD62JLe+M1rH2T4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6341
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Make page-table updates using
 the default engine happen in order
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jun 29, 2023 at 10:51:33PM +0200, Thomas Hellström wrote:
> If the default engine m->eng was used, there is no check for idle and
> a cpu page-table update may thus happen in parallel with a gpu one.
> Don't allow CPU page-table updates with the default engine until
> the engine is idle.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 55e113dd7e82..41c90f6710ee 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1160,9 +1160,10 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>  	int err = 0;
>  	bool usm = !eng && xe->info.supports_usm;
>  	bool first_munmap_rebind = vma && vma->first_munmap_rebind;
> +	struct xe_engine *eng_override = !eng ? m->eng : eng;
>  
>  	/* Use the CPU if no in syncs and engine is idle */
> -	if (no_in_syncs(syncs, num_syncs) && (!eng || xe_engine_is_idle(eng))) {
> +	if (no_in_syncs(syncs, num_syncs) && xe_engine_is_idle(eng_override)) {
>  		fence =  xe_migrate_update_pgtables_cpu(m, vm, bo, updates,
>  							num_updates,
>  							first_munmap_rebind,
> -- 
> 2.40.1
> 

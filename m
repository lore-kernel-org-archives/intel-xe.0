Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1B7C7EE22
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 00:56:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332DB10E1F1;
	Wed, 10 May 2023 00:56:07 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D2C10E1F1
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 00:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683680164; x=1715216164;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6s+NnQe2qxQ1AuLZrAJrmSOSmkXkf/GKdgav8A3+vVk=;
 b=FBLMFzERIdiHVkd029CCHRvwX7hvHlRIc943G0pc40ev8wLsohlGNSZK
 W21mOH+rvV0EnBgdUAS/1Yn6WVijYIDqVBCRqDrx45OdaRT0ghDVih9o3
 2TtqFbiiffkEMX0hb/2mP3M0Ay9ekhwkbyc66rZZAfcT/MNY0GsH91lAV
 mR3NXKXNXAd5MQkA0MgwgHfp1TUG4pRd/NmQvA8Yon4oMyjPRBqEOUE4R
 p0xu6KnkBHJXcBeU0RlLcEnEj5z+NQtJLEXNeiNhg21I25PmxMGiqoCjc
 Rl52y1tYmpQduQ2l1p7Nq6UDQXXbCYagsWPTFkq8POIIYgK4jI9YJbrRW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="436417414"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; d="scan'208";a="436417414"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 17:56:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="810927677"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; d="scan'208";a="810927677"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 09 May 2023 17:56:04 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 17:56:03 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 17:56:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 9 May 2023 17:56:03 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 9 May 2023 17:56:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZaWKdxMZ3K22tYywpRocxExkP2miNTJkAEK6++qjWhA4Jfmk15JOF8c0FAqzKOiTCG4W2Q5TAgtK6v9D+vYpv/9ApE3UNMNIJClMYGKXb7zMANpdWreL4KmjbmunX7yBtmJU59WVkEMDtjBB9dmWnynSWkUw20qCd7vdgX1Y6wVyWRGNATjFuuUrRrdRgplv1EWI7vL1VYUXERqC1dKxWSs2tdZrZeBBkkFyzhlQO/BprSqDU6GiTw6o6nVIrWp8AThbMGu58M/awJLCg5V/aCqN5rJMKazCyv0gnGGVYtlqG7Dv3opP+r04RxFL/9AmCCpmPf2gu21vqKCygFIvDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8b4vATz39Y6AHlJTXiWrqfnnPsvGpIKJCkmgAbQ0ys=;
 b=dzBfbjAWUjKklh5H3b04O/o458oUVc4HpkHNmfjiI5iaUxDJ/BpaPV1muFgwqNEBuirAqdA/Lt3KRwamBKHJSIeNrr4S8zLdK6AvNyHs72gPraPd9DuMlIht18qVuQDhNMuH+vmcSNxTj21Cg0zAK3nhPl5bY3pv5EctStxnuDORwiGwo3ozDJ+cXMBYCBUSha2O6UMv0h7mP5hsF9BLIaJX38OiHekTG50xcZe1UgeUmQBbA+dbTWYF0H2iswtaq6bJ9t2KFD4uc2bgnK0lEtAlW968XJoclgykZaQ9Rd+pwYiWGHeyOo82ePyc0gdkD3qvKxomXwi9GKgs147g9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Wed, 10 May
 2023 00:56:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6363.032; Wed, 10 May 2023
 00:56:01 +0000
Date: Wed, 10 May 2023 00:55:25 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZFrrfVy22/clBQks@DUT025-TGLU.fm.intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-16-matthew.brost@intel.com>
 <3387ce41-173d-c8c0-2610-1fbfd89193a4@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3387ce41-173d-c8c0-2610-1fbfd89193a4@linux.intel.com>
X-ClientProxiedBy: BY3PR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB5491:EE_
X-MS-Office365-Filtering-Correlation-Id: 9de42f6a-7b45-4487-568d-08db50f152b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ynRk5Ohl/kIiIfhsZz5uAug7aGxw29kgnsocg/hg2uuyYUA2X6XdyUEt8g56Ev0QzCi7dY/T3dY0znUlH6y3i6wE4k6VJLsTDJiAWeTcbrpuQasADAt5U49iaKryzHzB6wwVv9J/FSyoMCuKkJu93FqQJkf+3mceq1sOuUTWvS8JWFJDiCqku2/4lHZR4qsCl6EEiYcX1O3XbuDEAw/InrOgzak9+tpJarPkN+zUTBKpcaAWciXa0EClb8lQZxuWG4Osc1AKLdonTSga2T8A1qyhQntjvMKBj7i1DnqB6iCNgi02h9fR/Ppb2oAUVCg2pXk/z88Q6JsyfmdUgT5L2zKE5fvt0RgzHVJyKArJGaQSr+zWpiD4p7GhUMGGk/oormkIGIUvcEdXUYmRP7zN08GN98b4XhLrrnvNCYgXfaGm+LYMBZI7oSlHN87+PTkhjfMNv7orQxfH5Gxuompk7vwPEFNXmxpV6GHjn7+k7BTRQVG+Eq20CV/ae/Afp0RxzxFulxycZ26PaoFoZTQG8Fy0zmN17/Uu3dnkcyLS9ReHahADIHsJW9ekqZ4ZOWvE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(366004)(39860400002)(376002)(396003)(451199021)(54906003)(83380400001)(66574015)(38100700002)(316002)(82960400001)(6506007)(6512007)(41300700001)(53546011)(26005)(86362001)(5660300002)(8936002)(8676002)(6916009)(4326008)(66476007)(66946007)(66556008)(44832011)(478600001)(186003)(2906002)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?zrALh8cS43NtfrcyacQwxUF4+f4KkjwAHvSRnd2VhTBPIflPC6OJ9oFg+H?=
 =?iso-8859-1?Q?w9wNICBRCJB3Cjrl3uOJsCLdVc/5oDye0l8+UEOs7zC6DhzFt+Qsrmqe9/?=
 =?iso-8859-1?Q?0dVbVuOAQPSBYhB8qsIWuIwiBxxUVwcNHXfk+OhIzS7G5xQDoE6WIvVXDu?=
 =?iso-8859-1?Q?Kb6jv9WOf1Jn8ezCqDeeytdv8YJ/aj0HBQ1SjZYW2tMS/zPfMH0a4AssH8?=
 =?iso-8859-1?Q?F78pyRbEVZ5HNBHR5qWjIqDy7O/eBv0fBGY07ouQuZyZCugaaibC9lmiR3?=
 =?iso-8859-1?Q?JzuytYy2CA9j+kumNfzgQt3ZExpexcwNL47UJUSMZ7+JuC6DaBi1XqNAJQ?=
 =?iso-8859-1?Q?Pzj3ilct2Sks5dPS/DncuZspkWStqzfEt0KrkKCz0g/RbD9j/+3lxA3arj?=
 =?iso-8859-1?Q?BXn3PgLLWxePr6eaVb8Fv19Tr32vRkuiSH68sqfbRuqYFnKhhHALkE5+Xs?=
 =?iso-8859-1?Q?RbY6i7bYjEIQhH9NsF3UxyQG6lalFXmjOStlfon1hmKIMFid8Fg5SNhZex?=
 =?iso-8859-1?Q?sdvKKRC8EaCnE1NJc8QolwvDKn+SKs82PLjg5Cz4jXM2l8YintaohONrBR?=
 =?iso-8859-1?Q?GDA6JBKyQJahzuy/k4hQhuZqI+JNlMJ4DDdnYpEw/kIK41XpcqHiCIQqu+?=
 =?iso-8859-1?Q?s0VQWUdkM0FxLXEWJdwyV6L76GRc5WHnON3hZD5HZcjjbmVbkqlh6tbmap?=
 =?iso-8859-1?Q?b94Yk9zZxgZpfpssxGYgQaJjlLpJPDCkD8ldx6AVhAaKaD4AGy1s6Ai2av?=
 =?iso-8859-1?Q?y+zk9/yvzdK3wWBKAHlAdtnhtBjwTyUHulkgAum5sjhdCsxjY9Tkf/mjJA?=
 =?iso-8859-1?Q?QJOVokK9qeXhKbT/ZJR14vBGWOhHUtCtiSe2o4oegl/9slMmIiHco0eEgz?=
 =?iso-8859-1?Q?kmxVNVOet2NAiPhEWAL71ZhRriYqvw2GkfJfBodyU5xa1cMaCs8sBJ4oBr?=
 =?iso-8859-1?Q?lICA+SBin4bL8cXp7F5nUAHlgdvu5skuwCA8M/coZSflcjUk1SGkbdREIP?=
 =?iso-8859-1?Q?u0AtDTLwR/YsPkCvzyDLAjltCXeUE8ValQk/udDavEfW4inpi1k3vwmIRi?=
 =?iso-8859-1?Q?H5FMp1Ahpb31BC2c9ZbcORC0GFL4bofOvrI0eBEWpKcrBswZog/Szs5kWB?=
 =?iso-8859-1?Q?CM/SKUYkyKqvdrp55uQ5Cm1e5rVPxTV2/Bzd2Ex5WP/vLc3d8iHqAC/YAX?=
 =?iso-8859-1?Q?DN8dhpMlkAs7WbhN8Udb7DS/hQD8QpT5PUtkR7SULsF3jdmv1dBy8FUpKa?=
 =?iso-8859-1?Q?nhOjswd1+KiwBEfeWDKoqn4+5DerBPRisjtqdYQVTjrSJH0ncg3vpXCNjF?=
 =?iso-8859-1?Q?fl1RlMzB5RYmID5hW0o+KtMDKIQHK1nf+pJ3TB0V0d2KfZd0vfpoxp8Kfm?=
 =?iso-8859-1?Q?0aS8eOZCQtcIoepaUaXqrp55kMqwQxgC92aDqMmvOxnKFGx1yAxM2DTqi2?=
 =?iso-8859-1?Q?nQQqp1al5pp1V/LxGxrzVx4SIB0I4X//QRPMfdh8Qn0ZrWfeeD3iQK5jrP?=
 =?iso-8859-1?Q?ojwUsdmvBbLtOkyR9H4PUXw1LBHrPVjoeNlqIzQQqHwLu2MrBLzVIxDHOV?=
 =?iso-8859-1?Q?TDdGey9hUlwfZxgtC3D+Nt+QPLrf3SGEH2r2pZzX/oJSux1Fzn10/L9oIS?=
 =?iso-8859-1?Q?NCnqt7oj5eajLuDcXEV/4Mf08+ldKWE43BZ1VDd/O7Rtvbp/DpC6j4Pg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de42f6a-7b45-4487-568d-08db50f152b7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 00:56:01.1664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8IaKuMFw4fwsbE5rWTpffzX5AqKKJKMyDyyWb0c/pog8SgiPYuMzndYkxSvPuVJ6QngqrjefIEoSHLu2lHDWcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5491
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 15/31] drm: manager to keep track of GPUs
 VA mappings
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
Cc: Dave Airlie <airlied@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 09, 2023 at 03:49:12PM +0200, Thomas Hellström wrote:
> 
> On 5/2/23 02:17, Matthew Brost wrote:
> > From: Danilo Krummrich <dakr@redhat.com>
> > 
> > Add infrastructure to keep track of GPU virtual address (VA) mappings
> > with a decicated VA space manager implementation.
> > 
> > New UAPIs, motivated by Vulkan sparse memory bindings graphics drivers
> > start implementing, allow userspace applications to request multiple and
> > arbitrary GPU VA mappings of buffer objects. The DRM GPU VA manager is
> > intended to serve the following purposes in this context.
> > 
> > 1) Provide infrastructure to track GPU VA allocations and mappings,
> >     making use of the maple_tree.
> > 
> > 2) Generically connect GPU VA mappings to their backing buffers, in
> >     particular DRM GEM objects.
> > 
> > 3) Provide a common implementation to perform more complex mapping
> >     operations on the GPU VA space. In particular splitting and merging
> >     of GPU VA mappings, e.g. for intersecting mapping requests or partial
> >     unmap requests.
> > 
> > Suggested-by: Dave Airlie <airlied@redhat.com>
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Danilo, Matthew
> 
> Before embarking on a full review of this (saving this for last) I heard
> there might be plans to add userptr support, rebind_work interaction and
> such and resolve any driver differences using vfuncs.
> 
> Just wanted to raise a warning that helpers that attempt to "do it all" and
> depend on vfuncs are easy traps to start creating middle layers (like TTM)
> which are typically frowned upon. (See for example the discussion on the
> partly rejected patch series on the TTM shrinker).
> 
> So just as a recommendation to avoid redoing a lot of stuff, please be
> careful with additional helpers that require vfuncs and check if they can be
> implemented in another way by rethinking the layering.
> 

Noted. This series goes as far as supporting userptr as a GPUVA in a
standard way, an extobj list per manager (VM in Xe), plus common ways to
lock a manager. Agree much more than would be difficult to do in a
standard way.

Matt

> Thanks,
> 
> Thomas
> 
> 

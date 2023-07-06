Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4CCEB64D9
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 04:01:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F3D10E3E0;
	Thu,  6 Jul 2023 04:01:03 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBE810E3DD
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 04:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688616061; x=1720152061;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YSR3dPL5kbwTbD+PdTAiRm1fLT5a/+6dHOIRiz62JdY=;
 b=I+9cDOuK8nhZnEvjiaKpCVBj/dH42riAbS/6K+EQSjATI7tsgSZOr5PC
 OycaScy2RBq5sL8ZnKPtZE4WZyFevP74XTKie1ItxSXF3n/8ei6DqqDgP
 6UdZWeULLatI+xl8KLyLxo9WwW21Zfp3JTDE/8IoJieosRJZDlggNgzR2
 XcB05kN0XOA621qSxrmwlVZVoOJ1YoTBHE0J/ljXHzHbccwPu+wKr5fcQ
 iw+Dp4QX/ILm+Xl7z+dKZ/hXMLBdXmDt5Yi8FC0wUQQbKr1pbCrvt14wQ
 aeFgb1D8ggz15KgdNLZ2kIABTi9dXY0HWRhSBanwM+Gq66/9R4LLF4cLz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="449860288"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="449860288"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 21:00:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="832790866"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="832790866"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 05 Jul 2023 21:00:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 5 Jul 2023 21:00:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 5 Jul 2023 21:00:58 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 5 Jul 2023 21:00:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+gjdiizKLDiVPrNdBItFGNxJnunq4a4D2nccK5dza6heMy60C/L/8XSPAayXn46Nthoqnww/NBI4rwdGuWKWIqWsI99opjDGNCRqIltHZ5UoZiLn8Rw4EOzqkT82PeV2DRhCF+T15zJGZ2+N8Aze3kMzV1uIwjunYpVpf5MVsGWbCLyiwD/D/1zz9KVvLqBNO5UGc6ifQ2CNn+8b9ROTU3cva0o3oc30XAP7+lSsMS91H5fOhXqraoFTSF0+mG+rvPeAGwke1vvoUvvumL8tDBGPL52c8IB+kyP6fC4z7IpSIcGBqfiKPdg778ak5T/1PrDfIY624v2wmVQ3ydtLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LbsydtPXF2AmQzu437nZTTLr/OX/UFzzBoh09TygMjY=;
 b=bVz9Mh5zQdXi/7hn4dIU5Pi2MTBQQw2Qgzdb7/nyltue3lkx1GvfWiADrDXIb80U4FLIwW12Mvc+JchgoZyIsaqrDI8wOhqbx3Drnibt6v3AAO9HtvNfH/bxv5FN1Ynhj3vrnclnRXo/qHZFfviPZrun44Yveo9BozsnXf6j399P/i9iKver0/LkZp2s6YOE9ZLsj3vpZxkd6effuwaFplNjxMmXU7RIslYVrMLTM4hxn04n32fFAYmPGiFfG8V7KWOyNxP1sjUU4Nm+ByjBezWZIsAfDFfX3EyX4OAwWGHX5aNsoiHpzZw/08yipuTo3RhuTGcJajFUVgZgJWIMGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BN9PR11MB5420.namprd11.prod.outlook.com (2603:10b6:408:101::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 04:00:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 04:00:56 +0000
Date: Thu, 6 Jul 2023 04:00:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZKY8UXTeM2S3C2Y+@DUT025-TGLU.fm.intel.com>
References: <20230705160602.237213-9-matthew.auld@intel.com>
 <20230705160602.237213-13-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230705160602.237213-13-matthew.auld@intel.com>
X-ClientProxiedBy: BY5PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BN9PR11MB5420:EE_
X-MS-Office365-Filtering-Correlation-Id: 04bb070b-efae-49d3-09e2-08db7dd59998
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rw68joR8ccKcpdFGyZWv8In4xwc+2GFBTkFs5Ku7aUJt+O8sYTva3h8RiT9IOOrZ2Rdvzd8jAQ/XIG4oblgiBtJaxl1BS1cRLDhNokb335OVWPCWHScDltPtRNIy44Pfe5j5W41KNIZ4U7F9lConwojZUCQninwkBHzUM8DrNOleAea7BWhWBuX1PNryhnFaN0Txeg01xUi48GEuoBDGF0w8vsltJsOI/BkQgUBgbn/vxLDnebqwZRu7k61lknMbuXzgJU2uZ7DhHI/fFTfoszuIGmzfYKljH3tnyFjFQumWF9pQe/Yh3LcJlZx4gJ10lwBygX+S7IaUDFtSXg/iZ1ZRJvrA1CKmAdYIvfry6si9S5AF3Kj9hGWZe7auqsFSJEFhuSwWtYXeS5Dmgh6mnOsxL/wjY9t45P8v2Bmgw12IZUW9MiOac84C97kdD0nmSeqQdbaeX17jKgeJFQFsO0Xq3gnDNZZYljEj5vX8svfjbV/HzKhbdSRe+8/a7Nou8dGyIX5i/kj2PkHcUa9WHj8d5mSsGPe1IxrT+LbRmABI8i4AsKrREbRKDrmIHupI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(346002)(366004)(376002)(136003)(451199021)(44832011)(26005)(6862004)(8676002)(5660300002)(83380400001)(107886003)(186003)(6506007)(8936002)(6486002)(316002)(2906002)(6512007)(41300700001)(38100700002)(6666004)(82960400001)(4326008)(478600001)(6636002)(86362001)(66556008)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Ywo63flPHY0DLARJGSjmoGLzyUNIdl6FT0rZk2u2IM5NmwahsfiGyKBlQt?=
 =?iso-8859-1?Q?7tnt3cDniSs2CkTYmpnqvb0jR76LHmAFuI9kOre9oH8P03stkre8txnaA+?=
 =?iso-8859-1?Q?3Cs41SLDPBsUu9tAVwgQSR8KUAWVoZ0DBT3QwgA5fmx7koK26BICA6fHaj?=
 =?iso-8859-1?Q?EoKpR/VOdxr/boFj6V+C6ngpjCBBgt0hYbGrC05Ao09wTnUULjSGSNVmXF?=
 =?iso-8859-1?Q?2Qvv0b2NNMbyKfQ7MXUvVJaBTZtddasvCyapn1NEWFCxmE9mwxnbC9D0u9?=
 =?iso-8859-1?Q?CU7gLJdU8B1EdYBLjn2JCRyqCX8FPiw4cz7/QXLhU8VZnfh50w5oWIqfzH?=
 =?iso-8859-1?Q?8VCA0bTpw+pJ/9oKagPXHDdIFvWvQd7rm/ZfrAE7DSe0NZoaja+0U4vIS0?=
 =?iso-8859-1?Q?+OIRB36WC+QpkZ3jCe8Q+h79mXDhvVV2I6n6+PHiw+IWClm9BMvZTtbJ3T?=
 =?iso-8859-1?Q?LjVf4KewexlWQv3AHKg9QHiFm3yVYsAc1ZOfFBNO0V/+y/72B3Bp2LMG4D?=
 =?iso-8859-1?Q?+dkwjZ7VO9wafnPmb50qeuNB11LWh0Du9N96Nm8cw/oMWr8dhT3T4Gy4h2?=
 =?iso-8859-1?Q?wR1FfiZFYlxpn+DbkUn9V4kiMj/gszQEAjf65P8qLJV1Ss4rAQh2/sj6Dm?=
 =?iso-8859-1?Q?6Hq1k64dJywtlhR8zIWXnYVP+s2vgjQpIQLneuQKTtYqysqpV712OnRjBm?=
 =?iso-8859-1?Q?qZSr9u1mLzzp8Wso55J9Jzr32xRVsXuNUmeOSEn5tNxQU0lvDYBpwldYFR?=
 =?iso-8859-1?Q?IKcybmWmmPzk2jB7dzocFvKINLoaVjsz6H9JRWE/MS/D/gjJ92UHJqS6io?=
 =?iso-8859-1?Q?VQqHkv3eS53/hFuPsU9afq1Yrh4jI1W0h8tbdhr4NQdUg0JCgj+pwinn18?=
 =?iso-8859-1?Q?FnSjLw2ZphyJ3lnxL9f0lQFyPR6Q8anOzSQFW5Q9j9+iEMOcHHnYj5AScN?=
 =?iso-8859-1?Q?oAXu8Gerlw2eRhTLlIwlrQiDiy5q+85ll3sdyCa5ug8lbXun1uIu6DSx/w?=
 =?iso-8859-1?Q?9qaExo4/OSZ24dnqoMtMxwbTiC1YCfeG5rqL3y8tdtnlb4azAKqxmosG49?=
 =?iso-8859-1?Q?Uj6hf2cyhGDUbbofhxKGnobLWUlcCgSokJneUVknDdvelVBR4YmlTAzgv1?=
 =?iso-8859-1?Q?WLvvqt0+AWqhU0PjARpBB4wVGJGkg9OyLqrZbg6bSPM79dpLW7wQdiQq2+?=
 =?iso-8859-1?Q?2Qu/csSudsnZ/N+YBrdmUkBryiWtNBJYD7Omy/2ryQrhG0/Z4ojlzBGdHQ?=
 =?iso-8859-1?Q?HfFB5pImyKDOxrHcBeOHpxeVJUXJYVG8BASXSsbOJMq/AGZIh8zpkIhixp?=
 =?iso-8859-1?Q?lsLpvLKtNaREtFKzIA75DKmf9nMjLDhgllKJjf+GdpSppLuDmqkxFiZ4H0?=
 =?iso-8859-1?Q?V8AvZZRGXgAcDVK4/Tz3pvHKZuHEI67oMCwApmU1FEFYSSW5DKrkNWsYii?=
 =?iso-8859-1?Q?L3MPZhLVAm7BwN+n+B1hvnft+igX2t3jHOJKboERcoeg3tk/Lm6r/QM153?=
 =?iso-8859-1?Q?Tw3+cc69VcIK4CP6nSjit0zMcrk7Y48keQ9kERdVmxOvgRJdTPSROWwjku?=
 =?iso-8859-1?Q?Q5nkQv5m5yiRVHjOGSAIHvjuYpIOJfDun10KDRrnQZDOpMk1z/LJgOrIog?=
 =?iso-8859-1?Q?oqel2Ic3GjZemQyFOAGF2+HHx2fPVd9ejMMmCHHlVdcQqdCG7LnrVl2A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04bb070b-efae-49d3-09e2-08db7dd59998
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 04:00:56.2765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MbzhspcLpW5r23tPb6ygXitsbW9ogyoXJlg50eSzRUujnYao63E3vVBM2HITCM7YljpHv6Onay/y8oQduPDV9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5420
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 4/7] drm/xe/ct: serialise fast_lock during
 CT disable
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

On Wed, Jul 05, 2023 at 05:06:07PM +0100, Matthew Auld wrote:
> The fast-path CT could be running as we enter a runtime-suspend or
> potentially a GT reset, however here we only use the ct->fast_lock and
> not the full ct->lock. Before disabling the CT, also serialise against
> the fast_lock to ensure any in-progress work finishes before we start
> nuking the CT related stuff. Once we disable ct->enabled and drop the
> lock, any new work should fail gracefully, and anything that was in
> progress should be finished.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index f8c1a2ca89f7..811518230262 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -301,8 +301,10 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  		goto err_out;
>  
>  	mutex_lock(&ct->lock);
> +	spin_lock_irq(&ct->fast_lock);
>  	ct->g2h_outstanding = 0;
>  	ct->enabled = true;
> +	spin_unlock_irq(&ct->fast_lock);
>  	mutex_unlock(&ct->lock);
>  
>  	smp_mb();
> @@ -319,8 +321,10 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  
>  void xe_guc_ct_disable(struct xe_guc_ct *ct)
>  {
> -	mutex_lock(&ct->lock);
> -	ct->enabled = false;
> +	mutex_lock(&ct->lock); /* Serialise dequeue_one_g2h() */
> +	spin_lock_irq(&ct->fast_lock); /* Serialise CT fast-path */
> +	ct->enabled = false; /* Finally disable CT communication */
> +	spin_unlock_irq(&ct->fast_lock);
>  	mutex_unlock(&ct->lock);
>  
>  	xa_destroy(&ct->fence_lookup);
> -- 
> 2.41.0
> 

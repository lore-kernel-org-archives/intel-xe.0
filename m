Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F9DC4707B
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 10:58:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1C510E8DB;
	Thu, 11 Jan 2024 10:58:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EDAE10E8D0
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 10:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704970700; x=1736506700;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Zj+9vP1yc9CSdH0F9Ifb75O/REUt23lJPkPgYQ4wwoo=;
 b=QPTGvywErPc47N9qNWp55Xd4ufcbmYIIccTASaujZzC6evMPbUuWhC79
 0tLiif1Sl0UKpG7W7OhA1MVFHe3kNMhAjyV2QLM1RM9Fa8/MWsBFAHZH/
 X9Lx5tPoG1Z4to+lWz0v5yMyJdVevTPB5N3XBm+oaxquQmt3QXrlKdsU0
 atyRrKeoGHyBVmy/uzgxdnbW6jvViRMGl/oNF3LM3zVGWpwU4Z+fFRtFW
 olx7ZhWp9M2IO+nxGeTociBZdAlrlMn6cYcU3e4dTorBqi1ij5DSYrKGB
 u8oI7bcOFlt2e5vvr/cLRB3Amu6QbyQ43j0OtZQNKu+A0SyIla5raG5zh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="389249825"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="389249825"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 02:58:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="24587349"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jan 2024 02:58:19 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 02:58:19 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 02:58:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Jan 2024 02:58:18 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Jan 2024 02:58:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JY+qIBppnd9L0niN/Qb6CGXCCsqFBUFLTYvuu7H4upZKVr3mXJjznqZfzzn2YttOJ90jMG7J43eMFE/BKuaJc4ZoAKjBR47x/318egbaVW5S6Nud2iheQiRloBUAQ9TWAitNxsS3fMSPeTdgKtByFd4f/sSRk7gw8L7aGWq5jD3gCn46a0x+DT3cv0UHghCdOfFmw0ncMxaZh4tAjL4duG5fX2YZFaPwxSq0f3WUQ5dPKDaxCvtSNKsGmGUDvJL1ODbor94eVD5FC+dgCtpNFvqqvice9oCtgqT5GW9EcU1ggAuNeKppbJPDnR6xmRh2PYqPDgPVr0mq7F/iKxzpGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M81d47ovDDMmBamuunR4tSKW1h85onqfzG+y/xHTwcQ=;
 b=eQGKsq8B1/tR2XiVaPrDB+abotQPj7DL9gm3u0zPrj5uhA3YZDdRVuBjn7XX8G8nWQEHSMGdyxuHjaTQdkZ+JNbVp1+BP6zIhThq3bdTNsWlD6q+UWBF9SGuocTqXbUN6xaeOAOF/ry3Rn7J1iHjxf/f+tcJg+mbQU+0r0idiAAHAdsWkndUxsBAkipRW0ocEq/2dw2TYEnHb9CzFLZdTP8Q1bhVVTUm01I8y6wqq5xIjGZAwIkbdVvs7fbPUpw6DCCmGgPEkFTb7j8hO0QPBwiCddzQkS2+TCK8zmmP/pfksTTMhoaetujnDEzuXNLrBisXUc05xCRyw+9/x/91nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CO1PR11MB5105.namprd11.prod.outlook.com (2603:10b6:303:9f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Thu, 11 Jan
 2024 10:58:17 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37%7]) with mapi id 15.20.7181.019; Thu, 11 Jan 2024
 10:58:16 +0000
Date: Thu, 11 Jan 2024 11:58:09 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/xe: display support should not depend on EXPERT
Message-ID: <ZZ_JwanaiY9uehN9@fdugast-desk.home>
References: <20240111104716.3548744-1-jani.nikula@intel.com>
 <87wmsgtabt.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87wmsgtabt.fsf@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2P250CA0024.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::29) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CO1PR11MB5105:EE_
X-MS-Office365-Filtering-Correlation-Id: 2911a2d8-b84c-4622-c042-08dc12943716
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HoEJKgXZBC4EARSbC0GrUWD9EfVGaFpRAbrdTueBBajIdwpXOhMaSMG9TqAmz5vY7It0/GZ59/wyqR7/jM5CehCXr9sQ6NNz7qmC3xbfIy4ekSx40/vhhduBJbrW1Yoe9k9gU+UNuie9u7b2cb3Em5+xnW+o0cpdFHSwX4OI49a3CgOvr5KXxEMzXud5uIT/Nf5z8m5yk6x+eYy7iQ/9pUSnUgUUf6v6ASninbdRQpkAPuuAVfMXVZJdL8q52BCcBf4YFKRJoS6H8g4DMij7KM+v5lpH/MnENbrZWwLlZPMbQUJbvJr8bfnK7747Vqh7Yl+yGzod1zONwDFewy8eU+2tuwCBd6cALNYYMhEJAZTKMooDcp0FrgHtz+l9eVeEgwo6/P7U2YvzfKkVDcrf/IJ82ra+7tSOdJrQJXL11XhpDjCHYMhroLt6VRp1l6igP1ak2GXmt7r2EadBWSai1fkI/Cqxz6KkcAOYuzKSPTtZqLXeXbVra1iyXmVwXAAQ8BBuvyu3wjdQUI6dEund+xuMfvRGfrydoN4JzUujJ6nsdSZbg+JEfUTsStQNiJ0u
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(346002)(39860400002)(366004)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(6486002)(6666004)(6512007)(6506007)(9686003)(36916002)(26005)(107886003)(36756003)(38100700002)(86362001)(82960400001)(83380400001)(41300700001)(478600001)(44832011)(8676002)(8936002)(4326008)(6862004)(5660300002)(66946007)(66476007)(66556008)(6636002)(316002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NRcB8vVgOAFDN/Qe8nrVwKYHo5NGfTlTjiT7/HfR3PShhJegTP6VO2l9W+Fa?=
 =?us-ascii?Q?6skbVTjN+haNvw58m1kcm8j6f1rtd4mSPOaGZpvEGolnReclnxPoR11fgjHS?=
 =?us-ascii?Q?8iEsVc3NtfoFVt8nwQLtDgOUvrar7LVz67e1GO/eUwyhC7/pMkMYPgrRdo/c?=
 =?us-ascii?Q?c7pbhrv+mE+fiTvi4OrrylMca+AK28q0ICicPA1WhkCO24M3YlRCZUQiVgmC?=
 =?us-ascii?Q?7XzXojgd/+X1T6KYAysvcNWAhtNfqxY9j9Vw6FxZOocxQyyuDrbRCwXw3xk6?=
 =?us-ascii?Q?WDaIHXOmxV84DA54g+128NuxNu9WJ3Qh0VoRdyhEpGdeBFtf0zWuXbI3uBpq?=
 =?us-ascii?Q?CkArKMUdghseDBCPpVXvmVJiRrdP20NtxSOq5/EkMf3ZU/0y31C4V0Kaihn5?=
 =?us-ascii?Q?ToOHn88KS6XIGwkss2Taz5mfOR9oUccdR54jG15lTvmUfrJsWJeVNb9kveAy?=
 =?us-ascii?Q?5jwCN/uBOnG4rywnpkABJh/sk4k0TSWB9oLU1Rgyy2QTeoSyhSS1+SgUjGjW?=
 =?us-ascii?Q?LgZ/1kbfIz6LRwOFiTLLYHm96GtjHXSSoAKLV67KaUYGA9BUKVqQkBp3bI93?=
 =?us-ascii?Q?uZRVziZSqTnpjTZCLa9nd52/cyU92s7ppnwFDUfUEJV0brjTwu3fFTblqj19?=
 =?us-ascii?Q?vvbxtPShliV1GwSOx7pYcihB8TWywTghiPktaXRGP6EJFY1L9Nl8ADDa3wGC?=
 =?us-ascii?Q?syZhu+bUrFD2758jj+BQFjAMFRAORaKLKvypTy9GohaxLA2NNuGDD8KICy5n?=
 =?us-ascii?Q?VT0xbdt2GYHZbQ+e0mOHXb4PMvzbywSuiQsi/mGkiP0MpBEFKGRr/Tba8j5+?=
 =?us-ascii?Q?thdqK48vIGcM73NzchoHdtQD6zZ/KXvYUzwV+q+NT8XAMIYLfI95vvIyULHj?=
 =?us-ascii?Q?k8OhuCWDEtvZnJ9Qdt+BBlonz4d8cCJnBG08qwo9EFuCtw2lFyIhD9cEzjvA?=
 =?us-ascii?Q?JJoBQr/4Jo46YqdDv+F61utCb9JCRKvq+5icbhlgWNXxHM27/xrwSPu8tkuG?=
 =?us-ascii?Q?tA2HcJAZ0vSeRf6CxeQ5v3rddBN9WciqPhGNSrFaoJWJzo1Ryl8k1HBXP492?=
 =?us-ascii?Q?ZWmCXYFFUdoxPDE8thHoC5ZBD8HPdF8NRqc4JEOMjrihhwZzlvyeG3DUVC1q?=
 =?us-ascii?Q?V2Wsddd6CvqnIOyYMh0p3v2cbFf4iLE622TjAu14nssxvTtutT7rOKq92Kef?=
 =?us-ascii?Q?n+ETntpzhbd+f8Z0/FbvfU59iK3036Z6uIm/IrmsYK4rgfHLHO/WmosYqaLQ?=
 =?us-ascii?Q?hCriFaKvLciPdlNTvpCp9YAebo9/+W5diKVd38GHaAdYuhlRdjhzh5fjFpml?=
 =?us-ascii?Q?xs2uJtY1E1RrGYbnvuZsxTKEMXuMQwDWfqhl1TNCDyrjtI/EwzEkroEW7mtz?=
 =?us-ascii?Q?ZyrJbi1cxuXoVvwUc3dFTTVXjnFNkG37kvy7Sz8swFDFV2B/kVMeC7U/sYxS?=
 =?us-ascii?Q?oXINdKz0J9OPWAL1pcugnXeJycaFwIcf+4hRvnaX6UYdju4TDg71de7ofAWu?=
 =?us-ascii?Q?4R5xSCfeL28Rb3vgK4jx5Mbmr1wieo4PV+/uSdGX4V9YQ4vQXCfqRb87QgXy?=
 =?us-ascii?Q?bvE6Ks6PtwujitINSdOcwRLSvAgsYkZfD75SttSfxdBU+iLeRlza5u+SF2mm?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2911a2d8-b84c-4622-c042-08dc12943716
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 10:58:16.9389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: deripOLk+JU52t30q1TI5NhctFecCRwdcqPjKfp/upgaDOhs1WZb4hW8eC7TmccE/6biFOCoRgFAbm0fTGR3MjdYP15c8iJ1oJrhCg5nBB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5105
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
Cc: Eero Tamminen <eero.t.tamminen@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jan 11, 2024 at 12:48:22PM +0200, Jani Nikula wrote:
> On Thu, 11 Jan 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> > Remove the DRM_XE_DISPLAY config dependency on EXPERT. I can only
> > presume the idea was only experts should be able to disable it, but the
> > effect is the opposite.
> 
> Forgot to add,
> 
> Reported-by: Eero Tamminen <eero.t.tamminen@intel.com>
> 
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> > ---
> >  drivers/gpu/drm/xe/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> > index 1cced50d8d8c..e36ae1f0d885 100644
> > --- a/drivers/gpu/drm/xe/Kconfig
> > +++ b/drivers/gpu/drm/xe/Kconfig
> > @@ -47,7 +47,7 @@ config DRM_XE
> >  
> >  config DRM_XE_DISPLAY
> >  	bool "Enable display support"
> > -	depends on DRM_XE && EXPERT && DRM_XE=m
> > +	depends on DRM_XE && DRM_XE=m
> >  	select FB_IOMEM_HELPERS
> >  	select I2C
> >  	select I2C_ALGOBIT
> 
> -- 
> Jani Nikula, Intel

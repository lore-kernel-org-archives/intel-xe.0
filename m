Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7141EC4828D
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 18:10:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F7510E11F;
	Thu,  1 Feb 2024 18:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iBdlTpip";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8048C10E11F
 for <Intel-Xe@lists.freedesktop.org>; Thu,  1 Feb 2024 18:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706811054; x=1738347054;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2f3wbcR6l2fLEIYe8TVPLofZLTmdN7liw0Ci2/yy5Ws=;
 b=iBdlTpipt5cYckowrsW5ARckYA6SX+AA6u/MRfVUcf1rRmC+zS0fQZL8
 T/aoAeH3jQzjWBRh8rdLKob89KG4befPfGxk+lBwD1Fz/DD6d1EvD21XW
 KhJcp/5+d3MZ9XY4KFUz9Pnf7eZ/syDEwKgOcPogomd0Bq4kybGluf3ed
 dPO1Z3I67wqZ3uh1ySDRFIy+lNIgLHS+I+B+m0HYtTP0YMzP55tHu55Fl
 TCV4gMICAsob7d3H5HJkrMllErpBjyfw5mkgXBlulTxEd8sCSpVIaIdwv
 BcmXQo7SEJ2ePDCoomaKpvw2WlKcxRm6PQ4XNMioaiY5tJUhtXvhUYTz2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="11337426"
X-IronPort-AV: E=Sophos;i="6.05,235,1701158400"; d="scan'208";a="11337426"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 10:10:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,235,1701158400"; 
   d="scan'208";a="164795"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 10:10:53 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 10:10:52 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 10:10:52 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 10:10:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekB4ZG7bFSmA8teRf6JmcXc9pTycnvlupnxBwECDwrohbfHfW4ClaLcj07LU5wefqbZj+bIKd1M5O0K7azH61pcj+MnFi5UGwAoOlbh6smd3QB0QeI5XPhbPy/t8lpiLFzTsst3cOfSehcgiR11hmTHrxhx0Q73Epw2bmg1wO8hG+2ddBs3aWvuUEN4IMAGZ39gca2UjNNJaqwZE4Hma77iHbDJY8VnbwOgOi6pt2BKCSLvIIxWiaS0lFud+N14Tfr8y0MRPnsxnudplGP7TYMagm1dy7Twj53lFVZKkS3OMBMST+ZjEe4HUDa4bS6wbsdWN1EYypP5wi06JfcQpNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2f3wbcR6l2fLEIYe8TVPLofZLTmdN7liw0Ci2/yy5Ws=;
 b=mIOgOl57mzm2j31oTOI7XzlDGvBF4B8CgKC3Zj3N4H9Z0xYtt6SCrOXkmrr79Wi2mhQCWnenvfu/i9qOfDv/S4qC52OttlSVsEVAeSgn1ujS1yf79O5jpEqLRP5l9IV/8nLSoLodASDsVOU7yUVN9QY61CRlRBq1tM6csbnohpgDcT7JIdf5ze04R4qGLKEk8agh96u/Zpfn2vXqu7ouOPMALFxCRuMxd1qER6QFdHZ+/9c6LhH5Ki3H2WvGT3GGhO+T4j49n9d0WX9FU31l2FT9wmT8MOZ6uJv29svZ05hnpAktsbpa53UooZAkOiB5Wni15pRcBMw+hJOnWfcHyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CYYPR11MB8330.namprd11.prod.outlook.com (2603:10b6:930:b8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.29; Thu, 1 Feb
 2024 18:10:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.025; Thu, 1 Feb 2024
 18:10:49 +0000
Date: Thu, 1 Feb 2024 12:10:46 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/uc: Include patch version in expectations
Message-ID: <ovuuoubntshqkw2s47ph6xzohqne335gld245wuicqimz2vsxm@ll42frb3y3b5>
References: <20240122213708.1841488-1-John.C.Harrison@Intel.com>
 <20240122213708.1841488-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240122213708.1841488-2-John.C.Harrison@Intel.com>
X-ClientProxiedBy: BYAPR01CA0019.prod.exchangelabs.com (2603:10b6:a02:80::32)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CYYPR11MB8330:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b8e5911-997e-4ef6-237b-08dc23511e4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F/iOQLUCLtbQ1AfOss/EzfBcw4oknr39N/IfnY/2Yl6kxcJ7RW7DOyPHI/X6SrpwH8Z257l78tmeZK6QH94/WKiV9pOtCILCqK0ENUbDfHF+w1xBrTy0zkoQnz+QnqM7gOxBbf8OVAr64feJbtCQ54iCtdbmOtn0rhtUeY5kG1oc0rVnM5pFHvdQkWqSCYOd/ZS61q4Wk9yR4NzrNw+QQ6hXYASraLSuNuV8wwUmODAwWr+W8mDkyaMGB1rZdctFo0723KbagshcOiyVYPjx2MW/qI2rdirJFxSpaSD+ey6l8HuyB0SqL+EKsSvvKLu4yDlaZFYWViCaSl7/XtXAM6JQ+VQ6FOcg/MXWbmmaRmRimIFOIuLRI0Usu3Ca6hnQOOx8l+Y7z1ONHuTjSJQCMahpW/NL4uZnv+jh3XOND4WxpPeSB+5EtPCet3sJX7AaVAWBfl+0dkcsQsi0KrtfIBVG/UD14eTTbrUIGxKUMtdDBRGEwTTEAQqvuaJ3+j2+wBHh+lazSLhjqp4GGysyS6YVURY6RtAMZZ8RpC53X//92EELOfjbvBVcG2nd3+4k
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(396003)(376002)(366004)(136003)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(83380400001)(33716001)(6512007)(9686003)(26005)(38100700002)(66476007)(5660300002)(34206002)(8676002)(8936002)(4326008)(4744005)(478600001)(2906002)(6506007)(6486002)(6666004)(66946007)(6636002)(316002)(66556008)(41300700001)(86362001)(82960400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F4XT3iNmn7hb1d2PyTLIcooRAkV2isJfEQEJcHWqr+yLGu+m7CDWsNnr4J9w?=
 =?us-ascii?Q?I6cYn0+2wP7/vqqreDJ68oBFZUzurPjsY8MLCcs73StfZNunNg/kae+XlgLB?=
 =?us-ascii?Q?yuGySOJOQ7jpL/CCdXmRVqM3eRYJGmFa5jaax9lu1EIMPCpP5zKZx+51Q3Nw?=
 =?us-ascii?Q?FrCSfOHk7si7ShCk/dKEva3GPTGik90t5wbjAf8jQuZprTrD+It4Qha7NDPt?=
 =?us-ascii?Q?i0lNXcnY+DcNgE58vpj0CdE/uJLDfYGDW0MwY4IjCi4GWmm1FxTy/hEIeH3V?=
 =?us-ascii?Q?VTRTkcwlmHDa6Hy7fQ6hdROgnPOSZdQEfLZ3b/UqYQ4VRIIh3djUYt8YizWv?=
 =?us-ascii?Q?PUTQxafZdh+rbEnrL/DY02D7KOZolDcvZZws/x/vtACSYUS21e6fl38knx++?=
 =?us-ascii?Q?57PCc0ruEWs/fKOKsqwD3iyQFJ4tGFtosOXSQUAzDJhyVPeL47GlnOLJyOK2?=
 =?us-ascii?Q?FDQF8uWie/4XmHnQ0nmlbz2wRfScyKokHNjY2Ke1q93rGK16lrkN4wyPgLiY?=
 =?us-ascii?Q?PlKB6i5lGLgPUonKwCuG1JxPHm/Ax1RJGGnYRnz25uW9ucrpbuOFOoscfHms?=
 =?us-ascii?Q?9JFVNKtIQPYJU+VGILCKEtMGvsphX1ZUN1j6vjaI5KC1Wcek8gFC2LoK4dYT?=
 =?us-ascii?Q?ZWkIs3DSkemqNlhpcUF5HBl+8PcoXbDvD26PALPw6S2zn+dyFVwj/r8eNfl2?=
 =?us-ascii?Q?NhvW8UpnLjdCKWWxV1PUm9NC4PkXF/6eBBcanRwrTDoby3tyNQ3F7MM4IgdL?=
 =?us-ascii?Q?/4v4w3/pvWgwdKR0aupEwKq5ubCjeI4M+SoCZQ+EiBC7rqyOSBVSm2KGPeeX?=
 =?us-ascii?Q?D6r21kAFOKhKgPPsr3FNSI90vsXhXUUR6eQe3DtoOlONEzCrvA4xJoycamGP?=
 =?us-ascii?Q?l66x75+fijiu1QdlqlLATsBdQgx1akNeaBhmsw3EyjiCaAhZjIoFQ8IoAviX?=
 =?us-ascii?Q?FLpCaWb5xcNrs0o/5+nj3VAh5AIBaNk7zaMOmavylN6jLOLOIAeBOdRIsrb6?=
 =?us-ascii?Q?0aHG3e48TrGnAsbmwIh+RcAiQW2DsMs0rFn/7g0pZVKqByG55msRrr5jXDbM?=
 =?us-ascii?Q?pm4pgwKSSB0xtF0Dgf00NWweTK+TvXLjdvSEmh3RW/m6mjVACGdjW9d2Bp/r?=
 =?us-ascii?Q?qal/cUK0LN52w688J6/4eZRxw9AejR8Qq03IaJlcEsWnckeWhqRDt+0apDV/?=
 =?us-ascii?Q?BL2xF6maSL82QkRAvewf6UJEkq9aN+MtmZhrzaVts2ecI3EpoNGH1Svpy+2x?=
 =?us-ascii?Q?Ki7gTPdXaHIhZ1zKTfrbbWeR4LbSMgobBIArVwJac3ZXvZ5kfzEcqdVfNkHI?=
 =?us-ascii?Q?2lXcCYJ+DeLMFU360b00x/YOZtBpjthYYa9HT/X+7b/HzXh2rG69jIMDskmr?=
 =?us-ascii?Q?QSeD4OZpW7DnQJzUgbTndTFQNhYnfMSi8y155AJ0v3KUfxikK7WydhXq4KWd?=
 =?us-ascii?Q?JgqyUT/7/jByOv+LVxdS+pXytJukQ/aN2aCTysKaPXrTLSNioKifwNKilnSq?=
 =?us-ascii?Q?qGiJUjrQ7QdO6qGjT8D6B8jzzX1ypQPu/66z+gAnduiP2RKfS9BqTVxsLEpc?=
 =?us-ascii?Q?+LyZoBGQopV0eKe/BPfgVE/QwQMWRPE0G57tWO2e55vqe5yoiFPPD+A0DyIS?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b8e5911-997e-4ef6-237b-08dc23511e4d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 18:10:48.9686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vnNue3lt5lcymRd/ux/8kBMLqgTCCdx5xHJW5vSK+1juSTnlNLymEgMnGMaV+hb6/TfFzgNEJ2BLhxlQUf5v5nzTTJ+ttoyEmbW34GO2OiU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8330
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

On Mon, Jan 22, 2024 at 01:37:07PM -0800, John.C.Harrison@Intel.com wrote:
>From: John Harrison <John.C.Harrison@Intel.com>
>
>Patch level releases can be just as important as major level releases
>if they fix a critical bug. So include the patch version in the
>expectation check so the user is properly informed if they need to
>update.
>
>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

The second patch we can't merge until we have those binaries in
linux-firmware. We could update it to match what we already have in i915
though. Wouldn't it be best to do that since i915 is the real driver for
those platforms?

As far as linux-firmware is concerned, the last update I see is
44a9510c94ac ("i915: Add GuC v70.13.1 for DG2, TGL, ADL-P and MTL").
Do we have a pull request to update all the platforms?

Lucas De Marchi

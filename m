Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A95C77B71
	for <intel-xe@archiver.kernel.org>; Fri, 14 Apr 2023 21:33:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8117E10E1E5;
	Fri, 14 Apr 2023 21:33:23 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D491910E1E5
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Apr 2023 21:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681508001; x=1713044001;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XwCjIIgrSGBi0omrsy6gY2w7W9Ww665tf4rm2p6KbNw=;
 b=NUw3bs+ZjJDa5ybITPOQkg1pd7dRrm1arSN1Mvpe3RAYMNrALdsqcm+L
 D7jT13lHB2ADLEBofCniU0RdK4TQwsfkNxHzbk25fib8VDMknmXhuFXAh
 n80tgKd6YwxWCCznEAYsIVl2H9J5GQIgCncZVTySlFFLLA3X8dT/M3Hr4
 ++94QTOB88UxSrA45Vp8vY9+vIReu7R2RPVoEWgysKZLYFSmAmmDNnkoh
 iJpw0Re1ldawboJk9qO5sSMvrAjL5QKCccDfI8I+ZskaNC8PE/qWNU+up
 ECkBpXeaDItFG1AAvQcleNwSQ+SFmeIMjUYTOPvzHEaj0kZpiVOgdjJ2F w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="430867120"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="430867120"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 14:33:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="936153613"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="936153613"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 14 Apr 2023 14:33:21 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 14:33:20 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 14:33:20 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 14 Apr 2023 14:33:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 14 Apr 2023 14:33:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dgdkPnT+IEFj2WGP8sAGjrxo7eTkDaR/35SUPzEWAbWCF2xQpRtkbC1iyKxrWTF2PKnOGeSF7vgFp/728A1oxDuIV5HoFaEnF05Jj9Z+Z8f7zopV3KThezHCqyyIavNv/wzku59fr2J6F8O762Xa6tQtbiugiJJ/qrrweUzRtT3hcVec25/gkrANa4ICWm8NPhST1FUzwmtrmx2EJ+YynWqC74u1uLFbdGKcZ8+c60/XSzG9j+6uhSW+82nmPKwC1xzsc6RoQ0cS1/NfglGLyGnTAxLmdMI98Kofa31gdwy2xwRLLENEtpgwMs3sjJciOM9TGbwYa3Xmos68SFpedg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8e0RaPWEZTNBfubF2d9oEERg5bJq1+4guvL5evbk4aI=;
 b=HkZ0wiSVZ2kfVciIjr+dZGYPeI2IPvAP1LxVJaYQC7QubGmSnSbyoXbdbWbmCGcpeb1i16nOgn6pRX0SiFiniMvkDJt+75PrITO55aFxOuyzigZrWLUiW6zJbUzaF2xQvpK0zrZy3oyS217XR1TelfHNGqzjF794o7C+s7bAKqPDMym1Ua2xSEzOVRkP67orNIWgVjgMZl2G9pYRCz8iP2k1JT3LHOyyBkxdyn8hoGPllRsCbo1buKCrxFD6E4Ga8HM0n4MOCxw8N+t2ipinqUWTpbUZmNmW+cgVCjZ9YtDArxrEuY181cBUa+pZb26TPxztFWuWIQnFpmMth/ijKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM8PR11MB5608.namprd11.prod.outlook.com (2603:10b6:8:35::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.30; Fri, 14 Apr 2023 21:33:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 21:33:12 +0000
Date: Fri, 14 Apr 2023 14:33:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <vca4px2aap3ppi5ilha5ydd6brvdyvouzgempn7ie4jxaqmyhi@dhvcgrnk2736>
References: <20230412225248.3229571-1-matthew.d.roper@intel.com>
 <20230412225248.3229571-9-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230412225248.3229571-9-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY3PR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM8PR11MB5608:EE_
X-MS-Office365-Filtering-Correlation-Id: 32bd5dbb-edf6-4f09-8ad7-08db3d2fd95a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kOd5+Ds2baaV4w5aK3IwrcYTGExvmaRRqgDdu6/hRSnI4A2KDhyyOziVijlwmXNVdYGSGD33DZo8D0IIgNOsfR7c5ATev0xL9wdufvWfCIW7zJvY+AsGY/SL9jjur2640XqEgN7e838wYrjTRoU1loth6xp0v8mXLSvN6Ak7A7Yu5eDbepXFsJD+srW3/1fAgH5ZPyyHCdVS4ySGE4uVyEsiFszp6YBLQJQMl/jRjJ2p008FR35V0lpC/SEIpuGI0iBk9PgKY/rtxrqsW117qc+I8k/nCFAXbjUPnfSfBr5KEMRo4dSZbt/2He9Kzi93Ehxc8PRoKvE65c9oJIl7U2i8HtO675jD1Bk/B1kVg3xRrA+4nGJwBSKaO1OUUp5WCsN0HdJHTcGlSSrEUo8fja2rS33mHOp+wAEe4F+EE7fLvH1y4Mf+b4wVUZ94+u5zUE23wpqe88iHKz5y5GqBejRZB0B1a3kz9A4UC2vvD8SbweYHfb7MWK5hUNUbV6HkVufMXS3klOSd1oPZSSsd4jgGyAbHZPWJtG7HgnZhPu7pD5PA9rlQj4dNSSAAqAJMYsPGj3TKrKalEcbPGgI4G81UrWQJChn8NCHnKeJ5GPI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(136003)(366004)(376002)(346002)(396003)(451199021)(83380400001)(6506007)(6486002)(4326008)(26005)(478600001)(6512007)(186003)(33716001)(6636002)(9686003)(2906002)(38100700002)(316002)(4744005)(5660300002)(66556008)(41300700001)(66946007)(82960400001)(66476007)(8676002)(6862004)(8936002)(86362001)(4726002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qqD/dZeIN17B99oUifKEulvhDMI9sxbClA3shXkhlC5OxmnphW7U823Ogiq7?=
 =?us-ascii?Q?EaB2r9BHtVDJ+uKpPDuj4Weu3Gi07WXT9yRESMf9p2uAMRoqeLXz+7+MZCnr?=
 =?us-ascii?Q?s6hnm7Jr3qVOTqpuLDqdahZTE7/x1W+Vbfnmh2qBapusCetQsVKAZeoc7Kpw?=
 =?us-ascii?Q?hMT4mQNaz1rVf2nTpxnpVen+YNsHKjG0ax6JswMYXIa9CjuThR5DRRsZwnJT?=
 =?us-ascii?Q?160JB3qcHJjxRdE5rv3cJBWA8upnW4dGdWLUffEoL+fITGYD1tMM6FylkHvU?=
 =?us-ascii?Q?xAPPT1RutXBweAho/lMIjhCdWKGNJW1ZhvSB2Voc4TDHVYZYHbJpdbi6Oa9h?=
 =?us-ascii?Q?Gu9oFsngw71FAHqttSKhramxPiZ6i2xQZ3RszCGKdKi8AlWIc91VKN8Epsht?=
 =?us-ascii?Q?v58op4e9DRsdocIJCHF8jKZvbwt4jNV9VFjHmNojJUV5FHQS5Zz4ic/3RZms?=
 =?us-ascii?Q?CpBZRpeVyTbKbeq1sQPlu6Q7sCCfuHCvGbjNyJ2G+jsSfAwKE7dfAv3vp4n2?=
 =?us-ascii?Q?pHluvHFM9CQ/DRVOt6Wa+tEu/3C+t+JiYiGw8lQFXY4vafKPwIFTHp41f7W4?=
 =?us-ascii?Q?4KEBDT9FjwMT3W8A21bBEgxpLVXi4I+gx+CutRQ5qgjDCIUmlPsvxTUG0bMN?=
 =?us-ascii?Q?6ooCPt9fyev06R0ag2lGkpnAAPjZuV3wJ9uVBGaa3qNgDwi1+3YScBEONyd8?=
 =?us-ascii?Q?ZEk6pWNcsOHjY+XETCDgzCOFEPLfYBwGIby4J8Y8vsFLfQt3KR5sQBSQKtbP?=
 =?us-ascii?Q?GOWmDzhF7d8OOdM1l/O0ApXsWxokbO+ThW3wIfEjRBai+zjD0gkfwghkiW2r?=
 =?us-ascii?Q?KjhiNy1KpRkUkqp7Kt0ZLKseLKQ9FmE7fa2QsNCdP44vV46Jpj4bdGhhZ9Le?=
 =?us-ascii?Q?EVFAEObeYJpwu5Ih3e5u2kBbs5BT/aS4MiCLkQJfqrKiTfgYZ6ZAesOV57xS?=
 =?us-ascii?Q?x2xWEQXXZiEpVRYFKn5n03E5D2ZGpI3He9D4Atr38j/HsOsi94jy+mK4pu2l?=
 =?us-ascii?Q?ng/gh+DKwGOK/JWxGxde2/wqzeJxb6WuH/YyaZ5oa8CZOO13r4v2SCK9FStR?=
 =?us-ascii?Q?5sT942N67qEZa6rFfvW+W7hIvmCbWwfMdaUjK8PkQLGq4VCdOizCi2ekKNE7?=
 =?us-ascii?Q?Dy1wA9ymMXjJq/IBr0eVExWVpQ0BwNI7+oYoSwzAMbiRcY7/AXb651jFc5bJ?=
 =?us-ascii?Q?WwPey4osnJrNFimgDwPtkvPFRqNu/BZwq1zVM2vybciUCt8jqr2N1QokqSLz?=
 =?us-ascii?Q?zyC/LldhkIu0jTZaY9Z4zR9KcMySRVNCpAi3cuiP8NncM/+J5fbKnof+BFry?=
 =?us-ascii?Q?sy7Y60Zftae2EGaEAFE2Kot9o8q29++KYn9Ezj8yNYOwzsEzkBT5hi2UF1m5?=
 =?us-ascii?Q?2ti104rhIIE7RBektXTcwVyD0qdlN7OKl4lxFT/LOO9XHTD7UQrtnsQfmTyk?=
 =?us-ascii?Q?3XVHKVhnjOZsFqGdTk5GGQp3rb+qiUWiZkI5N2EB1PLmhlPIabkX1MkE/2QQ?=
 =?us-ascii?Q?mLVxR+QK4WyvORld+AHR3ZqS6cegoxXzrsV9Gnou+8LL518HRjgH87qRpWPR?=
 =?us-ascii?Q?tJCD0cRK6mV/iC/TqkB3cVHCzU+Moy0K85/oiH9W/1a23lNYg0+D9rjtJPP6?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32bd5dbb-edf6-4f09-8ad7-08db3d2fd95a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 21:33:12.5406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OWykorRMF5N56M+11ftZKxaUqXO/yN8FSdvKo8qsgPJ40Ge5e9JBCGXT7tO7wNcKmS4tNTYJ5acZNt0RLC2oMkxs5MUKIWuaqCIqwZbjr98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5608
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 8/8] drm/xe/tlb: Obtain forcewake when
 doing GGTT TLB invalidations
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

On Wed, Apr 12, 2023 at 03:52:48PM -0700, Matt Roper wrote:
>Updates to the GGTT can happen when there are no in-flight jobs keeping
>the hardware awake.  If the GT is powered down when invalidation is
>requested, we will not be able to communicate with the GuC (or MMIO) and
>the invalidation request will go missing.  Explicitly grab GT forcewake
>to ensure the GT and GuC are powered up during the TLB invalidation.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

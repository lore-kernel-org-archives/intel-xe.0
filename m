Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D218DEED621
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 16:57:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA3610EBCD;
	Thu, 12 Sep 2024 16:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RrtgV/qA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D9710EBCD
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 16:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726160220; x=1757696220;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=b9g1cQYjV5ac046+DbEH9LkivfiXLK6OA9QpQ0DY5e0=;
 b=RrtgV/qADZO8/NtNUrzrY2EQEgJtgNvdZN49Ui2XbVSpX6UzL3K3ukF8
 CviWbCTz8s+teUwA9Vlw93aKKRC4qjYufx6B40ET71YAXsQrXaP6WQqgb
 L7y6uX9gxbflCh4wVgah8CEkiHfWyoHoyE8lpmNRivr3Gpii74uHcVJPm
 78CaigwW0xQ+Olnn/sE8uh+L4sVXNLq+kA9KyPYCyUUgzhVVfvlOEriKG
 5UzbM952eTRmUor4T5kdsOoIz7Qyiy+GVlAwqXNVAV3x2cGXaixejhdbM
 mG196dq4yO84PPdV5HniY0WXSXxLEiyOeHu7lXFL6Iiz6+EUV0uH0ZrNp g==;
X-CSE-ConnectionGUID: 7dXkqNucSLml/cszs9IMuw==
X-CSE-MsgGUID: 1XMl2iUVRquzU55AwSCcQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="28925507"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="28925507"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 09:56:59 -0700
X-CSE-ConnectionGUID: yGHoRlzXQgiPhQDpSx+eSA==
X-CSE-MsgGUID: 2s3xRXplT+eL5To4mwAHIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="91018408"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 09:56:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 09:56:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 09:56:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 09:56:52 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 09:56:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vr3sIIEbgPEf0EtBRLzLm2OCzEEIDEQyuGGeP+EkYlBSJNNGZJMiheVF2At6cJ9e9aR8dSUI8aF8HDKVrkDglVkMJg/EoufyZ9fYE7HFhwdvtNu/O39CBGN+RJl6HvRHp7kygk4wn9xcxkNX+xyhCgYtc6xtkdeOimW+UGxOxjFMyXDHEy3pSeodNej02ROsK0cUwvtfoQXdpy8DAXMSjzDKV85ChT95YxUvCnRrZbkwFPl9oGi9O4bAUWfPzOFaGUD1/35uZ+ZSE52mcbezBC7BK5rTxxuhkchDwd+akvu/sEtmcg37pkooQKW/nTuly71i6Wv8toIZs28oHWHrHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SHMCNloWrrzoVYALs3VkwKvG7Ee6P2FYaJh4c4o2Jc=;
 b=iXdx6H2qLbtF5ei8pe8GnmnZLFXidHCoim92Vfx5U/KFFR2AHlvK6jem+ec4TL2g/gbsB6fS55XoQ/MdNeaZ1NlItgiyH8PRM3gZ5ArxPdOV6XD+hwWduZ8LOjDe4/FHswPKiMoFA4ltF+Oq7kucB7fDSJ4TCo6XGORXCreu8aLpHF8bXxN2EeLId7ZkvZ9FS6M6zRL/LJDHKrolJlTjne643XtGven6aBj93oKRDncSSi0+X/pAJb1Dgy2Oisfc+jaD7AI0qstu4izxNZGl68MYtoQoS1jUR0RJm35yX2IBEABRdamS1+E9vXNIWx2vMrQRhYYreNfxNHsSIZlInA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by PH8PR11MB8257.namprd11.prod.outlook.com (2603:10b6:510:1c0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Thu, 12 Sep
 2024 16:56:50 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%5]) with mapi id 15.20.7939.022; Thu, 12 Sep 2024
 16:56:50 +0000
Date: Thu, 12 Sep 2024 09:56:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Haridhar Kalvala
 <haridhar.kalvala@intel.com>
Subject: Re: [PATCH 9/9] drm/xe/ptl: Add PTL platform definition
Message-ID: <20240912165647.GI5774@mdroper-desk1.amr.corp.intel.com>
References: <20240906215153.31210-1-matthew.s.atwood@intel.com>
 <20240906215153.31210-10-matthew.s.atwood@intel.com>
 <20240906235640.GB5774@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240906235640.GB5774@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::31) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|PH8PR11MB8257:EE_
X-MS-Office365-Filtering-Correlation-Id: da9b46da-825f-4e67-3785-08dcd34be52b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aky93zw0e/NsQyb24FED6+mgtqk98/nZ0M5CzNAxXhIWm0mVbo025gH8UM1+?=
 =?us-ascii?Q?dc7+rexIZcU3AZSFo6GTmyDPQee/0aXkPUYZgM8ZWw4/99JhmWbcLHpC0Tcg?=
 =?us-ascii?Q?4SEESABR44dgeWfFWBnwyPzx6WDhNbyQRc7R7l9bRClOZUqQJOa1msWsTNls?=
 =?us-ascii?Q?+OQM6VdjMphtxIk/KfpiqpXJAdiDviJ0uxfplxIbLEteVgqnxTtfTBh5mCVT?=
 =?us-ascii?Q?FmPZfHLpK6z0AX6Zfe1qQn8led/MoSb/TlG3j6fQyHNyqStVtUq1fU++gz6e?=
 =?us-ascii?Q?m6QxGh4zlQMibHBa/xATNCxIctYPkhUNAlJFGxRq+jz6etn0Trffr9wV+5XB?=
 =?us-ascii?Q?3vwlGp5mKh73fX/9E5Gb6xCKUFLa6qRqbkaMEASO3VzpXfWoOiFYUeos5Hc2?=
 =?us-ascii?Q?XGEa1UfdjqasggrD1+NwpprPrgdeot0pfeiMk+hDBfuCX9t9kdIlOFjkn2n3?=
 =?us-ascii?Q?FQFK4ZHNWjm9gfOSFzkI/tGTFWFR0r1sV/lBooE6LhzPkOpB5hop1o7X7yHX?=
 =?us-ascii?Q?5Pw8JmCinDDTTYLth6JjzBd/1mflijXJ2rrlKAwAi14TUD67d5EJxkV3goDR?=
 =?us-ascii?Q?DKf1RElXaRP6JqCXo1l9w5k3MqVf6T7Wa4srERmmv80+rInFuod8QNJmTrgE?=
 =?us-ascii?Q?jMLDTqFNJ1K1SFTvnqI1DisGihIUzzB3tRzUr1UkSSEnzf/sjK2/wge5A73Q?=
 =?us-ascii?Q?wkHZ3OJ9aQYjPMOc0Bwa8H4Q9Jh1hAzuMayO7KhnOHmjjIkltRdvIFXKxrRQ?=
 =?us-ascii?Q?HTrb3/3WiBSIO/GyUFBPB2BZgm8KDlGlZ2DhyaTAIfywIfv83ewCOfMFvq6g?=
 =?us-ascii?Q?RfxOPQ2yk1vMiggyRvfQxEkGbOAo63jKXX2zyMcudromFRBW6pWTxwghV/XC?=
 =?us-ascii?Q?X6nwGEB34ZPyb1WfI9hOdXSmssfEJFWuevmPZxyqE9XIh2EvXtVhz2ce8DAO?=
 =?us-ascii?Q?AOVyocQyaT+mA0Aw6/TeQPl0B8Gt8VKBKdE0QdwY5b6MpyyPvw+wbTGUr4pL?=
 =?us-ascii?Q?oNKOMB/ltp/735F8vLMt1wZt9Npnrs2TQHC2uxHjwhqXT4T4a8HFIiSBu15R?=
 =?us-ascii?Q?zikd3keO+A8ue+RyxgPHdsZyEBZtrHkDjl4HS0cAEuwqY5VJe9R02NMtXGGf?=
 =?us-ascii?Q?CV7+xTKLu5aUl8sQZVTk0X21dMZRcpXm61VSYpMmnqdgE78s44WmyVLt/muB?=
 =?us-ascii?Q?XO021aNtoPHA7bqZpluaCh92X/vOyzpb15zRbCFCCVnIK1LTrEqhZVxrq2ls?=
 =?us-ascii?Q?4wJ3hQggwuZ0LcrEeVU8fww24t9yES02yWGyiQ+dKU492XLDnlTvhkxLnMI0?=
 =?us-ascii?Q?cWN+OXtMipEdK5WkIiDOa1XhJIhvpt4LhtIK9XjDTvmNQg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m1KetftXFbSeNTRc60edL3CpcyEpFpyfvEP20eDfQyWXCO8IojokXKle9AIo?=
 =?us-ascii?Q?eYXSLypezz8K8JIb/ewGZexOe34xRSdnbkm4Ib4sOPXiuY7d9Yceu7HaGFKU?=
 =?us-ascii?Q?OS//6VsYBhXrEvaSW2ApdP64NQXQxwqY30SrYiSFkpnj5Vj7+cdLn137m/Z5?=
 =?us-ascii?Q?iAVWS8uJzCFaAATZtuGaUqD5p2AZ+TXZRdlj7KhsfsYMM4WrkKYZdHOrGRK6?=
 =?us-ascii?Q?R77+8qAl553g04TwckSAbhnBSzK7nhA0FVT2BqbmAsEkACc+W+iPGW75mryx?=
 =?us-ascii?Q?RUMiFzfK/iRgq/1JFCtnBC8i1SQfFO0elAPnMJtiUNDd7tYFv/U0WGGTrDjZ?=
 =?us-ascii?Q?6MR0OibHLppGDkAeDP1Vtn4ovemC/u/9I3WwM4AEvGHt5ZSKgfbXQts1B7Tp?=
 =?us-ascii?Q?eZgRhSkT5AmAhaZTATjHX50U2jbqVC4ezgIU5M7dTYLxuNuGK0ncFIiz/RPp?=
 =?us-ascii?Q?poWFxyrvq99DHOGEXABvyumyTEPNGoIAlak6iayawH0jQOLa3YA71QJbcuV5?=
 =?us-ascii?Q?sS+ODhVe/zV6Kt1m2s4PTeClP8aHNGwS1N7W02e6K6LFumpdgZzCPPo6rtJn?=
 =?us-ascii?Q?9JI9Ums9WIoAtXyehLWzvtSDRCcu58y1PkMVc+By3y4bW9uAHiq+jcBjmDPe?=
 =?us-ascii?Q?8UaJyP3zzTatxnszLiFX82ntpCcbMqgyvhvVMGUKjm6Ifzhx7CV2/htUCZBG?=
 =?us-ascii?Q?hpl1dm7KrlQoBjWtW0hsSuDxtho7RAmyXR8/HEMA7xemnTvC7kI+hpkL5EI5?=
 =?us-ascii?Q?0OKJNjO4oUayXbteb/5SPVjuIU3uIxTvV57RhkPDHWfSZmmKqSJ6HlbcHmSa?=
 =?us-ascii?Q?4fVQ7oLPeK1cbSjuuCJ/sSKzDmEWqUb77nvH0GC/777Y93a0R9OeqEnw/tR6?=
 =?us-ascii?Q?xxAuyPQMQ1UHTwHWlsJVJkGQ/LATe3SPEus0d/4h3rI1wlQP6wUP9vANAqSa?=
 =?us-ascii?Q?J0ML03zMwu8ci2gs3oKJAmptSKIbLMZVZ2SVaisyNal9jIx5977K/G6o/xi+?=
 =?us-ascii?Q?qfCtNWfr4DAwPuNVYBsAyOYFB+TmuKlLonmBl9K1rv0XnscX/GGj2GZOgUTW?=
 =?us-ascii?Q?xXGjXjViJIBEWjC3RIof2rqj611Nl8ES6YGh+ezSig4ShP/YEACJqfUL5z1y?=
 =?us-ascii?Q?Yo/oMsCFGHXSvlOMcUBSptuUIEFu1u1n4KPdV3Bd0tDSqBhT1ND7XfYrQSPd?=
 =?us-ascii?Q?gLT5tqqkSJPAp/OtlK6DGTIeOfb1npgEFoA7F1izXlKWatBEIz8cSJjDuwFY?=
 =?us-ascii?Q?1SM+bgvRBhcDMVzZ3CEd1hfpK7meVtURPjkSp17485AG3XrWF+5hT1nQWcg/?=
 =?us-ascii?Q?48tm9oNERU7FeBNmdawdAMXrhOt0yO0JTtbLxm+6sSBLXyX78XJ4cMkoeHuR?=
 =?us-ascii?Q?dReEO98kLz1dS8slK2MlI5GE1wOe0eas4EtNrOZBriXRb8pxMTvH3Zkt1o+A?=
 =?us-ascii?Q?ieBx4zUB6uj/Ca/NpLrPFs9ZtgX2qPAqJMB3rY9HmYmWJdzSy+QvUxuUp6Pw?=
 =?us-ascii?Q?hyvMXKK15RfKS1LQHb0/1jedvhAlKbF5hB/Ay7eY/1b0/h2EZiLpF9vRGegl?=
 =?us-ascii?Q?e3z/vp/sDZ3AB3Z1MX/IB58B8lO/GZNzjNM4EagSKblHUkIPtUGsUepI4UCN?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da9b46da-825f-4e67-3785-08dcd34be52b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 16:56:50.2735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uIgc2+kaPrtv+TKoLKzrYFP+M+2SjoBb1Je2aZCKOidROo/uFcE3/lRnmFIiYRL8JNbSVIxm8jpLlFrEavjNIzQR31Weepw4L2TMGF2Zpic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8257
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

On Fri, Sep 06, 2024 at 04:56:40PM -0700, Matt Roper wrote:
> On Fri, Sep 06, 2024 at 02:51:53PM -0700, Matt Atwood wrote:
> > From: Haridhar Kalvala <haridhar.kalvala@intel.com>
> > 
> > PTL is an integrated GPU based on the Xe3 architecture.
> > 
> > Bspec: 72574
> > 
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
> > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pci.c            |  7 +++++++
> >  drivers/gpu/drm/xe/xe_platform_types.h |  1 +
> >  include/drm/intel/xe_pciids.h          | 11 +++++++++++
> >  3 files changed, 19 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index b30d09508a38..e471832a7a7f 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -370,6 +370,12 @@ static const struct xe_device_desc bmg_desc = {
> >  	.has_heci_cscfi = 1,
> >  };
> >  
> > +static const struct xe_device_desc ptl_desc = {
> > +	PLATFORM(PANTHERLAKE),
> > +	.has_display = true,
> 
> You haven't sent the display patches yet, so this shouldn't be true
> (yet).  We usually leave this off until we start enabling the display
> and then include it in that patch series.
> 
> 
> Matt
> 
> > +	.require_force_probe = true,
> > +};
> > +
> >  #undef PLATFORM
> >  __diag_pop();
> >  
> > @@ -418,6 +424,7 @@ static const struct pci_device_id pciidlist[] = {
> >  	XE_MTL_IDS(INTEL_VGA_DEVICE, &mtl_desc),
> >  	XE_LNL_IDS(INTEL_VGA_DEVICE, &lnl_desc),
> >  	XE_BMG_IDS(INTEL_VGA_DEVICE, &bmg_desc),
> > +	XE_PTL_IDS(INTEL_VGA_DEVICE, &ptl_desc),
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(pci, pciidlist);
> > diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
> > index 79b7042c4534..d08574c4cdb8 100644
> > --- a/drivers/gpu/drm/xe/xe_platform_types.h
> > +++ b/drivers/gpu/drm/xe/xe_platform_types.h
> > @@ -23,6 +23,7 @@ enum xe_platform {
> >  	XE_METEORLAKE,
> >  	XE_LUNARLAKE,
> >  	XE_BATTLEMAGE,
> > +	XE_PANTHERLAKE,
> >  };
> >  
> >  enum xe_subplatform {
> > diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids.h
> > index 73d972a8aca1..0e0256072acd 100644
> > --- a/include/drm/intel/xe_pciids.h
> > +++ b/include/drm/intel/xe_pciids.h
> > @@ -215,4 +215,15 @@
> >  	MACRO__(0xE20D, ## __VA_ARGS__), \
> >  	MACRO__(0xE212, ## __VA_ARGS__)
> >  
> > +#define XE_PTL_P_IDS(MACRO__, ...) \
> > +	MACRO__(0xB080, ## __VA_ARGS__)
> > +
> > +#define XE_PTL_U_IDS(MACRO__, ...) \
> > +	MACRO__(0xB090, ## __VA_ARGS__), \
> > +	MACRO__(0xB0A0, ## __VA_ARGS__)
> > +
> > +#define XE_PTL_IDS(MACRO__, ...) \
> > +	XE_PTL_P_IDS(MACRO__, ## __VA_ARGS__), \
> > +	XE_PTL_U_IDS(MACRO__, ## __VA_ARGS__)

It looks like we're missing a number of PCI IDs that have recently been
added to the bspec.

If nothing in the driver is making decisions based on the sub-type of
PTL here, we shouldn't even bother breaking these out like this.  The
letters here don't even appear to be accurate (similar to the mistake we
made with MTL a while back) so all we're doing is confusing people.


Matt

> > +
> >  #endif
> > -- 
> > 2.44.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

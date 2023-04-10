Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A60C76196
	for <intel-xe@archiver.kernel.org>; Mon, 10 Apr 2023 16:50:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF7510E104;
	Mon, 10 Apr 2023 16:50:37 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321DB10E104
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Apr 2023 16:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681145436; x=1712681436;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=40nWwrlob/s8zX7ijoB+ozKK38PgbvhHr/Y6EenFZ7w=;
 b=EbnVBrT+VSugJqhUtbOhU/WSlJkN68sYh8/sm6C62xNYdbelJdj5NsVO
 j5SlGgsJ8NJj9lYMyhFo+VWUhTcwbFpKOtMKaSMFCUZpGAL+U3+NjixjM
 P3CLNE0VVOLglESv40a+elZMMOVt/bkec4LS66Bp9xIfy2nuVI8EJAesO
 YN1gTueJsOMRv9CUuxsxbeaol4M9hj/eoSp6or2YVr01LxYxL5kfQRtcI
 wI7VgR7lbQRedA4tlfp1y4exannWIWPtBigPk428Oltiq0yB4Z2/tDEqi
 WyqxCBzZ7L22PIgPb4kpZPw6t6rlWe7uELsgMdRGUrGW28gT+niNNyYLM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="429687586"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="429687586"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 09:50:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="1018036269"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="1018036269"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 10 Apr 2023 09:50:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 09:50:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 10 Apr 2023 09:50:34 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 10 Apr 2023 09:50:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1ozq/A/SFlHYfuXcuwx16+k91TNB3gnBaYN6fT+BrImkeIreIo0EakpvpkxCHqX4IeePEuqehdeIZ7FtIW20FipR/6ddaHtuWE4tcNjzq2K1NoSOLjN6vm9l+8qQWQ6fOp/ipy5Az5RTVZwRPxtfA0UbKaJhpOwXd2TiY1VUGCT5jf12IcPGzCwwym/kR8hI/GQLCz9M6H121A6DhnDxyBMFaHDuaWsSqZOZIrYNOS+c0qIsw6xOiOLw9fNsoMYOjvQdkL606K0861NRdQN28QsgX8k0XoaaRZK3/+PZwDAbXzxNbR4UryhfgXYbyPLhhCuV6iiWi2OwLHjk/0nTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkDgH33fuZgXX+W4SSUpx9PLkapyMfJNRoG9lySG/1w=;
 b=B9fC9CXplAAomaHqV7J+xq5RAv2B/iS4q1St/ypUh4NDxsWYUDowz0zyzyBExvEQElt3T9kbYmrg1AyUXYIv8ZCfb0vrRUd+LFxWiOeEzE7AHQQ5Fl54rSd2MzE8ElTNAc876e6TD1yyaNqbGPSbVOEPPr/zHkXt/x600eNavaPpGg20u0lBtHAfz6oxPJedHzaOE5h+S0ASyN/SrMqaTWMwR0gruWr6dfaYvv8QWxGJztXxnzVM4TPv9I8k8D6ZrEDLhq9bNI4fkeJuhjcOhEYCPOZBxUhL7hJQIBsLlf7Barmi0ek+xNYbkK8m5Oj7EfmhrGVQAZnoRzKZWI+1Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5479.namprd11.prod.outlook.com (2603:10b6:208:317::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Mon, 10 Apr
 2023 16:50:33 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%6]) with mapi id 15.20.6277.036; Mon, 10 Apr 2023
 16:50:32 +0000
Date: Mon, 10 Apr 2023 12:50:30 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <ZDQ+VkdmHwcZQL/W@intel.com>
References: <20230406143133.29474-1-jose.souza@intel.com>
 <20230406143133.29474-4-jose.souza@intel.com>
 <ZDQteoVKCktzyNus@intel.com>
 <fd512e4feaf3949b2cf5209e741b358159ed7f53.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd512e4feaf3949b2cf5209e741b358159ed7f53.camel@intel.com>
X-ClientProxiedBy: SJ0PR13CA0141.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB5479:EE_
X-MS-Office365-Filtering-Correlation-Id: a75497f9-84dc-4a42-038a-08db39e3b2e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KIdBZyzMTS2ugZ7WtrwjLgDfnY8iQNvTCFLazxsh1AheRn8tVFdRbHzUDDIjptbNSwmH6sL/sNc5BnWYBvF4r7UOz4guXljb8vjQ9ajTkAcRnnBGajET2rSGkNm41XSNBKPwSbagDaSx+iujjdDJq+ysBpgsQuCpbV33dT1f10J1+lInyu5WWjOwQ8DVO/PvdTK3Mgtr6M1meBVzOcIza/VjhuwyPsr/YKcqbVZb9/mi07ArXa+PteKlroqo70wBaL+Coc6HTu98k8vDH/sGFKnmazmHc0My5c6xSpmd9dHHKjy2PI4IwqiX0hjuJ/A+/UbZOUX3STcOz7hwEHsPhzL1QqLNgn1lrNO8orbnPtsnsxFSrKdw9wlSZ1ijKI51w8caWUj5CeVrbBIxnwQcOINlBu7w7cbhlr31gNiSmzxQWR9jlU0nv/9FsIXMH+j4n+HDmfCxLhSBt8upDSKxWaygeFuRwYg6KsRGeeBu0nf3GdRTkTSDZKeiIqCqVgLMEODRgNs6y+inRSZrju18MKRj49l6t29ragw/7m6a/X0IBikb352wJeDk43b9abvB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(366004)(346002)(396003)(376002)(451199021)(478600001)(86362001)(83380400001)(82960400001)(36756003)(38100700002)(2616005)(6486002)(44832011)(2906002)(6636002)(37006003)(316002)(186003)(6512007)(6506007)(26005)(5660300002)(41300700001)(8936002)(6862004)(66476007)(8676002)(66556008)(66946007)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?keL2VPRrcCUFtU2u1VPJl2WP899lmOwOwwwGEpkJSQLcuUZSxzNbqTcOhy?=
 =?iso-8859-1?Q?PRku3ttbI34sO6N0aOl6Ula2alkmGJgdU9badZqGS6qQIEJPjZwWrvgfl4?=
 =?iso-8859-1?Q?tLbCgVgl1XW6l28bY4BjkCP0zaoyV4+5Zi0ARzbeEjXs5ptf0+19/ADzC9?=
 =?iso-8859-1?Q?W4E6adP5lXtgoTPVz9CHMEPU1e20oxENZRgPHhNERZ6i4tDH+s2ZaOaGov?=
 =?iso-8859-1?Q?2qV8p3PZrIv+127SzuBJD1Jn1KaDuU+RaGkD8wBgVM9VOTpW3A2fJPeK/d?=
 =?iso-8859-1?Q?EVz6CdzQrdrE6qVia3fcPZB6xCFdYKGsxG3f682G8iVBesjUt8x1X/pY7g?=
 =?iso-8859-1?Q?MK/Wxs/qZ3IzghbGuJ+LbzjNS0JZOHFtHHeDjrWDCG52pIwNHeLOyZ4kcn?=
 =?iso-8859-1?Q?mTTBe53FAgYFDUT3rgmJrZCgUSQlYPmt8zeZlDwvj4cq2xurrvYsQVmN+e?=
 =?iso-8859-1?Q?E+Jkvjkx8wrVbshpRDhqHfr7UPI8m2pRjsSXes+ZAEbbuVCjST/WQjGw/C?=
 =?iso-8859-1?Q?/QHcJsyu4vbzg3rnFdkKgtfrMOZWxKuU7zD4q/ANXKOmFsihPV2SC4xLyy?=
 =?iso-8859-1?Q?YgcMilZdOQupgZS5EJ7o5iUjCc1djFpz+Mu2u64FAMwEtCynpvBwG7SNeR?=
 =?iso-8859-1?Q?RjPaPZWxakDc+CPHGVF4RELevsVMxNdWkSU7AuWkkMnKdQIg/jFLlTvpGz?=
 =?iso-8859-1?Q?5urjbEcJwPLDG5dJ4fxZwi46EUFsjGoyPM+t4+IU2WlX/mX/aWKVZLOdNR?=
 =?iso-8859-1?Q?mjKUEWDpomWvqxwhIvgnTogSqRGIw5KrvOyuukin7WqafIUA+pJzqkdGTY?=
 =?iso-8859-1?Q?rEUDQv4xNUyaHl0qYL91ncudYHuxHX1I5zhptWYxK3bxBfbNR6DN7Wqa7I?=
 =?iso-8859-1?Q?AP2eyEXs7vg3NRAd64xJnuuGzrLqotm+fLGmKsqCEeo9T4JeAL2kGFEQbK?=
 =?iso-8859-1?Q?3SRxODg4fqtziWBQ94NsiDx8od4+FKxHGWmlFJJux43Tk4hjuTVOuodqX7?=
 =?iso-8859-1?Q?NRavUpkWgl/GQV7pTdXehvd/HcQWlHkpNKz82sFFkmMTkJj/1byR+ViKuS?=
 =?iso-8859-1?Q?rd+UPn54IQxvgkH7hLF4YNalxOxa8f+DvmO1+jHX9S1/6Fw5lauNo5ixZK?=
 =?iso-8859-1?Q?45fQcEdGLq4FKIQh7Fi9QMYmor9hJPvijyUazHkAFeSb6h8rxedovIASpq?=
 =?iso-8859-1?Q?jlRWFDdJWPrE6QZBcMrwTRPFLj0TKydDbP/J/xZmimZ+yJMVaEsLsQTseE?=
 =?iso-8859-1?Q?aT2D/v5q3UOv5scI4B88+VfQp9XykGrEIL3FPgOzYqI2FVsEB4wUHCBsNg?=
 =?iso-8859-1?Q?2EV3KtZprVzT9ogD3vo3LKqjdT3vbLOQIitREZ301+g3gCMolNwLBgW74/?=
 =?iso-8859-1?Q?JCtBoXHwz1E1fxpXo5l1YZLp15H5CySK/G5KoH/VmQHBm5H8EXUllVvwey?=
 =?iso-8859-1?Q?dv6eaScjf/z4fdsII2jQjCPCxYUPAHliEJU2tjBkGJktjS6NYTTV/jlUAf?=
 =?iso-8859-1?Q?C6aidGX+ItfG5ARsf6E5iaQq0UvlD+/ZIMwhj0WOfyUtR+efYlwTDQPBrT?=
 =?iso-8859-1?Q?h2/z07Piohu7d86GlIYHdR8QuksNvAkfNqsvkD9qb3Q3OfhxyvVP/aDsOq?=
 =?iso-8859-1?Q?xPAXSEiGJRj89xVKQMJNWYdUJ+nhP3GR9A?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a75497f9-84dc-4a42-038a-08db39e3b2e1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2023 16:50:32.8623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NPv3YY/lmdmEt3TSCK3a2ZQVyzD22Ja5hSHePwg2kpQzlaGIgj8+Ati3P0CxDsLaZOj4+WTyEx2T/eNNxYYgpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5479
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 rebased 4/6] drm/xe/display: Enable
 modular fia in TGL
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Apr 10, 2023 at 04:24:09PM +0000, Souza, Jose wrote:
> On Mon, 2023-04-10 at 11:38 -0400, Rodrigo Vivi wrote:
> > On Thu, Apr 06, 2023 at 07:31:31AM -0700, José Roberto de Souza wrote:
> > > TGL is the first platform tha has it.
> > > Enabling it for DG1 don't cause any issues as DG1 don't have any real
> > > TC ports, so intel_tc_port_init() will not be called for DG1.
> > 
> > so, why do we need to enable then?
> 
> TGL had it disabled.

so it looks like we need to refactor this info stuff...
because looking to the desc it was there on TGL:

.display.has_modular_fia = 1,

> This is needed to properly initialize TC in some skus.

This is a key info that was missing in the commit msg, please include it
in a next revision. Although I'm now confused with the info set in the
descrition and here...

Why is that desc one not working?

> 
> > 
> > > 
> > > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_display.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> > > index 5fab5b9fbde0c..0001a9d02495d 100644
> > > --- a/drivers/gpu/drm/xe/xe_display.c
> > > +++ b/drivers/gpu/drm/xe/xe_display.c
> > > @@ -486,7 +486,10 @@ void xe_display_info_init(struct xe_device *xe)
> > >  	switch (xe->info.platform) {
> > >  	case XE_TIGERLAKE:
> > >  	case XE_DG1:
> > > -		xe->info.display = (struct xe_device_display_info) { GEN12_DISPLAY };
> > > +		xe->info.display = (struct xe_device_display_info) {
> > > +			GEN12_DISPLAY,
> > > +			.has_modular_fia = 1,
> > > +		};
> > >  		break;
> > >  	case XE_ALDERLAKE_S:
> > >  		xe->info.display = (struct xe_device_display_info) {
> > > -- 
> > > 2.40.0
> > > 
> 

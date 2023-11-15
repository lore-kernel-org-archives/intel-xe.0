Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAE2C072A2
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 21:13:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E35F10E245;
	Wed, 15 Nov 2023 21:13:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FF310E248
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 21:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700082834; x=1731618834;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=R9TPpHWLwz59OZnErql19PjxGCqFj+t3q9tvG2EEi+w=;
 b=FAzuu8/nJ+V2glSVhEy/nMpbA1ktLgdOmlO9cFdg2AWnIcqFAUCoZvv9
 0Cw/SqpjAVjVooWOskVdCcL7njMt0FjNPJavLzLIez2rJATsNigeO2uxe
 TVMhmXgyjlAIvlWhzVqd1FmZx0ArrGq5MhaQrdXdclk9CBxM9XDWEGemw
 mn3EJeipx2AafDqttAVckpdBeQBfXZOYhZnHB3bG4ID+zFE2Oc96d8vTz
 MG5k4kRcVWAok/suhdzADePdlHxp5aGk6UI1ubYwlVEvFje5iSeOAOR7c
 XPxOU0QM4mp0BRRT+EOEzDokIY4sVUMNfVW6HoCGhMluxXwmutCSXB/oA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="389813930"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; d="scan'208";a="389813930"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 13:13:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="882514500"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; d="scan'208";a="882514500"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 13:13:54 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 13:13:53 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 13:13:53 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 13:13:53 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 13:13:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RNC+QCtdNAr38pSxyZ3K6JyLQWkpgtNJ1vzEWCGeUa8kDn2iFlRV7ua49IJ+UxHVWK703Blijbxd2MFE7BEw+ZD+13flxTlDub3iyAEFmq3o/IgtG5gsDRCpJXUR1c6y1NfedI5tgHgvpN0RAjPwB3mfKdnCL9fs1uXeTpGke4H8xpS7f2WViMfMap2Op7b9y5bgAKyQrTFgRzaIXXpo8auyf2rIwgCS+xGfCE72fd79ZiBK209NL1S+Iy5rQzR58L+PYGHkyZC1feu3nzcPgoKJfCsbVhsAqNogCAzPIlTxAEyMipLsSzd661GGJKdzFW7i2sqLZEix2NSSoLiHtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/U47w0kHclqOF1N7d/P4phfW5om+hjvMthhFZ6gRvs=;
 b=JDRoRUQjme+iOt66XDIhGa/667Pj4LqUIq7/PZjZh1DMzZEKbC3WqlnmqgQdxNTKt1Ezjjx5rb8VbbapnpksOttuhkxEgIZLUdOy0s5Pf8/Q7WLGU/NzVw/E7lIqQLbT5dld0ZkxQRRbrKC1TsNRcwSDDnw4ZOf4NSvFoIozJNx249NwBOQSRCxtHcBD6bLNdXTvKhjEyuRf2E53B8D75sxJXOgaBmL/x7xXBa46ZLdF7dT+oFt4K//ukYepTfxNeydezc5bgc0QU7Uux75/Sf3Bduclhpa3nDT9mYyvTtwYVD+W1F5Qm0F99zGHLCwKG9zqaJ8ECbb1ErjcXB6Lmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8599.namprd11.prod.outlook.com (2603:10b6:510:2ff::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Wed, 15 Nov
 2023 21:13:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9%3]) with mapi id 15.20.6977.033; Wed, 15 Nov 2023
 21:13:49 +0000
Date: Wed, 15 Nov 2023 14:12:32 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <ZVTR0OuxlF3oYrGx@DUT025-TGLU.fm.intel.com>
References: <20231115113748.1949-1-michal.wajdeczko@intel.com>
 <20231115113748.1949-3-michal.wajdeczko@intel.com>
 <ZVSgURHzVdwm1LIN@DUT025-TGLU.fm.intel.com>
 <7b24dc06-effc-4128-9e05-6f7bd33b7b55@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7b24dc06-effc-4128-9e05-6f7bd33b7b55@intel.com>
X-ClientProxiedBy: BYAPR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:a03:40::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8599:EE_
X-MS-Office365-Filtering-Correlation-Id: 415d37b6-9ba3-47cd-6d03-08dbe61fc2ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N4F7sDtS+YYhadc4NgMcVbmVtQLyZQoZlBTeG70eZWAaN0O+ht4U7UF9lC8EuCjyd5F8nrCiaT4Q2Rtw8bVddlEEY1hp5OYtL+6P6MwuvuEQzqdcIkQ6UZvAPUpgTyRc4bdNgs+4XRK2q7st2VA2dMTY3jRKy37DdqBMt/s1DA8UqfjJuFGHIkwVgL03AlCbjQD/RB1Hmr0mQBTj+uIHbN/8PjdUKn0DJH2NvxvRrC/HmpP93JucVnJCNxH03GWNaN9q0uDN4l43bfWRv2Q5mCLT9DUEErdYEkQ8gPx24m+FPUsf29x0CVQ3Fkhmax+Ce5uX3s7RKb/3NVTo/M2L+Hz5jaK3dimrn7NwS78umx+fzrZ0QeYU1RsBtkU6DTUezu/cCr7BkAiDWOtrW248KsE3ODE+5bIhiTy0AxafHYdrp4AE3VbatH6NX3AD6s/AFC6ksVsD1Yx98m7JCRPfts4cuCaSMZj/L6XoiYMS6XK4cBEOsqfu1L3NK1n9szJ7A8OgK3GH6SzAiQM6nQcp24/F9gVwjiHeNO0nC3coFj6UY5kUK9nkTgFkMyg8AzN2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(136003)(376002)(396003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(53546011)(6666004)(6506007)(83380400001)(38100700002)(82960400001)(6512007)(44832011)(41300700001)(5660300002)(6862004)(2906002)(86362001)(8936002)(4326008)(8676002)(66476007)(66556008)(316002)(66946007)(6636002)(26005)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FOvfMWj8N9Nff9B4TQvSws92cl5vCHCgsiQBZVDWgcmLcjwsS9tNyjjpv+le?=
 =?us-ascii?Q?vEJrv/+vP93eLytUFeqBa1dJRDQd1ioaisyZaeACig/egcGYOfCyTqdA8Lkx?=
 =?us-ascii?Q?IdUo3mOahSt8KKWz0VP230xElZsWPVzH7V/K49GF6mZzpVuFcm9kdLDz2gJ/?=
 =?us-ascii?Q?ry+09Vqi0kB67vFXAIrAuldoIT6a4OrK5oI5DZ6i6i5yx76NKcXACNnMXnYR?=
 =?us-ascii?Q?0/Gbz4HtHUcZndTrbyBw4gclDnqgdp8Wx83KTxIMRs74Bqq2nhLGKSA08ue5?=
 =?us-ascii?Q?rnXDRD0KR5DjQnYvP5d0utSXojovd3zIHyjj2t5VcPcBcEntFjufYH071jT7?=
 =?us-ascii?Q?vfs6EeinDITipjjvoRst/b+s8lpGm6NdP0w+wJGr7BP74Ma8vTBrqerXR2l/?=
 =?us-ascii?Q?USGZof8kFe2xkboopsbw7kmqn8Y8LjrylSezXtPynVaro2tLRNc5qgz/AucL?=
 =?us-ascii?Q?6HwE6R8CXRSnbEe76nNFwckkcu5lCJgFyPnxNdSy/GS+6gOiQI6bk2zFDh//?=
 =?us-ascii?Q?7CXvFlHSCv2D7fMlg+czsmrVkyFSREkxT3EiZmpd/w6+Te/JB9DzU6tQEI2s?=
 =?us-ascii?Q?x51+SIyLkr/MZeyZ+LYoTchy61564HUtKUwhJj4SHhnRzq/Ux5yNdwoMYcIj?=
 =?us-ascii?Q?tSQJtYpTsr15nNE3cF3ZFB3BRbz5ZP06M4GfuON8I+3/xEzzokYBU+xmRTT1?=
 =?us-ascii?Q?L85xWi+YifXNO7Mqxa4YMEijj+njFLclGqaVEvLgoJJH+sa9P7FKYtYQbCko?=
 =?us-ascii?Q?MU9UA+M4TqP/fWGn4dcRMlE/7OuGJsKeXFLMMfGvxlbSJGhJY/hC0wvhP/cL?=
 =?us-ascii?Q?44qQBhKHN2O4vsjZyKzG3JVOCkC6E/b42TrfLidxMtiUEIM1dSq9Gn8wz3uA?=
 =?us-ascii?Q?8ZQO0NP/UcaMg0ntY6Mxp+m3uGuOvUdhxLAnbs/7RUW+zvfQqP5+YneWt3EU?=
 =?us-ascii?Q?xyVn5fPyzOumEyUqaO6Z5zbJqE4pW0TXO7HCEaclN+uznuBxmo/r0nVp3IGR?=
 =?us-ascii?Q?Ih2y1c9Z5ql65+yX/hnq/kY5CHfaltfyuWzKmiT9+616wnqwSLJtoZ29HJq3?=
 =?us-ascii?Q?IosFjSH2gONEI74GTW5XPgkwEWFWosXbFI2lJGysQG7mfvclGvb6qFhjX2Zq?=
 =?us-ascii?Q?P9yl73h9OwY8bhsa9C3pWZuYdM98rE0VZRrSHYhrjxwXdtUFMYwvvZDQUqRO?=
 =?us-ascii?Q?k4ddfLRXtHQ1yMvhljoX1MvWMgB43PIpgLddqGyCuO4sRDTjaS5Aa5sQvTAd?=
 =?us-ascii?Q?ZBP/n2GT8WLUK0M9aF9e8pq+msTFWTExcp/3ecvommicUmgstTMIOEq9xVHF?=
 =?us-ascii?Q?zV0B1I6BsNJifQuqHHgnigrQmdaeOTas8ZlSGf3KtgLmnhw88kl0/X4NYok8?=
 =?us-ascii?Q?8b6nVQ9QzzfiErQ2kDcnE4yLDJwFeQQcd04Q9JwnT8y3rBmbabKPGkgliOlx?=
 =?us-ascii?Q?AkNjkO5qFqYLos0E7rtId4b3A67aVFSTw/0gLDIXUjXOjzlLtfJtT5QBmWBQ?=
 =?us-ascii?Q?ixwJylX2CLhV6130WnT7C9MRdxMuH2pkju2Yq565tK5fO3cXFDldlPiVtsB1?=
 =?us-ascii?Q?7iFn3QJgjOCZ6RT14RiAUolBOLhz1eDOQF5kHzxI8gdGWmpG+KBZQ8WlR0Il?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 415d37b6-9ba3-47cd-6d03-08dbe61fc2ca
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 21:13:49.0981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yZ/F/C4VdPMxupLD4QYVZQXFNxqXeez292HUxhCjy5Z/YZeOPTmuijGIIT34Jwb1UBDY2vit1YSYn3vgWCwYMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8599
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/4] drm/xe/guc: Fix handling of
 GUC_HXG_TYPE_NO_RESPONSE_BUSY
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

On Wed, Nov 15, 2023 at 07:00:45PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 15.11.2023 11:41, Matthew Brost wrote:
> > On Wed, Nov 15, 2023 at 12:37:47PM +0100, Michal Wajdeczko wrote:
> >> If GuC responds with the NO_RESPONSE_BUSY message, we extend
> >> our timeout while waiting for the actual response, but we wrongly
> >> assumed that the next message will be RESPONSE_SUCCESS, missing
> >> that we still can get RESPONSE_FAILURE.
> >>
> >> Change the condition for the expected message type, using only
> >> common bits from RESPONSE_SUCCESS and RESPONSE_FAILURE (as they
> >> differ, by ABI design, only by the last bit).
> >>
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_guc.c | 5 +++--
> >>  1 file changed, 3 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> >> index ddbe64eb0f3b..16c233f120c6 100644
> >> --- a/drivers/gpu/drm/xe/xe_guc.c
> >> +++ b/drivers/gpu/drm/xe/xe_guc.c
> >> @@ -671,9 +671,10 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
> >>  	header = xe_mmio_read32(gt, reply_reg);
> >>  	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) ==
> >>  	    GUC_HXG_TYPE_NO_RESPONSE_BUSY) {
> >> +		u32 resp_bits = GUC_HXG_TYPE_RESPONSE_SUCCESS & GUC_HXG_TYPE_RESPONSE_FAILURE;
> > 
> > I think this works but is kinda goofy. It only works because 0x7 & 0x6
> > are values. If these are defined as 0x6 & 0x1 this doesn't work.
> 
> but values for SUCCESS/FAILURE (as said in the commit message) were

Didn't read the commit see that now.

> designed to work that way and the HXG spec is stable AFAIK
>

Can you make this a new define then? I had to check the values of
GUC_HXG_TYPE_RESPONSE_SUCCESS & GUC_HXG_TYPE_RESPONSE_FAILURE to
understand why this works. Or at minimum add a comment as just looking
at code it doesn't appear to work when indeed it does.
 
> > 
> >> +		u32 resp_mask = FIELD_PREP(GUC_HXG_MSG_0_TYPE, resp_bits);
> >>  
> >> -		ret = xe_mmio_wait32(gt, reply_reg, GUC_HXG_MSG_0_TYPE,
> >> -				     FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_RESPONSE_SUCCESS),
> >> +		ret = xe_mmio_wait32(gt, reply_reg,  resp_mask, resp_mask,
> >>  				     1000000, &header, false);
> >>
> > 
> > Here now we'd need to check for a failure in the header field.
> 
> checks for FAILURE/SUCCESS are done in "normal" path below, no need for
> extra checks here
> 

Ah, yes. See that now.

> > 
> > With all of this, I believe it is better just to wait for
> > GUC_HXG_TYPE_RESPONSE_SUCCESS and have xe_mmio_wait32 timeout on all
> > other returns. Getting a failure case is rare and we can live a timeout.
> 
> but are writing production quality driver, no?
> 
> and even for the "rare" cases there could be a need for different
> handling of timeout vs error response (as example take version handshake
> between VF and GuC - timeout means game over, while error might indicate
> to try with different ABI level)
> 

Yea ok, makes a bit more sense now.

Matt

> > 
> > Matt
> > 
> >>  		if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) !=
> >> -- 
> >> 2.25.1
> >>

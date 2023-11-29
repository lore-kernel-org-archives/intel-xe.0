Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E518FC4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 22:17:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC82010E693;
	Wed, 29 Nov 2023 22:17:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47EA10E693
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 22:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701296276; x=1732832276;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=i3qzoKCaB3pVcK/7+/BfX/PJQs9FobhaT+2E8WjI+oo=;
 b=lEyDMlYHu+nW2ybJqRTEWrVqQyrpiVwjsKW6L2HkP+hFJGSMrw9YI0nq
 Ee2r8zOBRsfJt1b8IkXdcgkzAHVjJvg4Nwo8Cf518vh1Rk6vBQjJq0iaQ
 NGa46Bkszwfwyc9oiLGoY3gIUvljzXfE2rL3i9w52szzWT8M/bHzKl60/
 W0/DcSirH9CwKDi4dKfyBLS+T+i32NELgVoey6bJLgSVao1AjWMe2+1pZ
 uSr4leMucYeuSB1sAfQ/+Tw6ls6re1OlGNtbnAtH8ktcv4h+mrOF44tyC
 i/V4dT0aFKlwFq3th78MKbrPzWNV38UCnqYK4n+oISpgSHtXeEnaaif/R Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="11936249"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="11936249"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 14:17:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="912985348"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="912985348"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 14:17:54 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:17:54 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 14:17:54 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 14:17:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K8JyzzuP68t3rKLpGr5WxsXaqnCZyFf+eAiI5QdD/FN9UuyLGRgAPKH0Pdgpwrmi0eBWhgTGhy5PPquSS+eZBxJp+EAtWSRB9WA8vmOeY+749YaPu1xloZ3xQTQi9yscgtB7WpwAiTZXIPf6HF3bTJSZIfe3kCDBn5s2gFUwjR7i1rx4iRbXLW6AqBaJBsFEXRuBFx8oinWWyFKfolfZS/IoYwhVkrga7rLf4y2sxc6urUZnEj4nb5mk4lHv5oqc074+YXj1WcNFXEyPqgKwku0vO4bvtuW+bMzDkSMw4io1qTNZvECxkHi4D5/RO0Kf4A7sQ1ipu1aMcoDXp1zpuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a73E0wCUQFIAdtSGcVuc0GNRto4gVWsvHsvpAActvl8=;
 b=fTEatNeZd36SDd4CsQMFXe4idTzErBdNDmF/EfKkocgYR8kqxQEk/+Osv89GU09TdgyW+U01K8XBEHeWAxvN4o7y6j7HE43spkRwgXtV610HXWjXt9ubDH7wMIGuIb7HX6QyHLA9k6CqMQtAWqyl1jhbzDbvVYfDv21YPPB+tfKEShVNVEyXDy2uznyMj+89Jl1k29yok/nobeHUJCALvpSvdUEAejB8LX1feQzn/n5pNIRQkwPl2U10wh/3r6pdXm9PaVuB2fhUImUCZaLixzGqhRR32F8WOwQaudpXzgGSSbzw7l4rhYGKWuxFQ7TGZ644xAOHJZ13VqE2fDIYZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Wed, 29 Nov
 2023 22:17:52 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 22:17:51 +0000
Date: Wed, 29 Nov 2023 23:17:49 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <wwycojyymdcqnzxjwfnt7e5t6c2byqcuy3asixyhicedlz5b2p@qz7kfax5kn4w>
References: <20231129011624.836843-1-michal.winiarski@intel.com>
 <20231129011624.836843-20-michal.winiarski@intel.com>
 <cefbc4f8-08c4-4c96-b042-a1e83d49d05c@intel.com>
 <ZWd6d4qc4QsFun1z@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZWd6d4qc4QsFun1z@intel.com>
X-ClientProxiedBy: FR4P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::19) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|IA1PR11MB7821:EE_
X-MS-Office365-Filtering-Correlation-Id: 37155145-245a-424a-a589-08dbf12906e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TeQHFfgxXrYn4ZiVX8ZJCgtSymYa9f2WweOXMNMlltusCL1tmx0UmET4ROeISlNOQEN3fmF1XsXhVYPBGUparSFV8xmw8+2aBPQmjyZzr7yEu1+MxNUlalf09zb67P2lOnO95W26g1S2LesKxkoKl/yTr1MAHJxxPpjgGGmZzqYsHm2+P+jAVBYEGzn3uJbN9vlgfR6Mo2cu9lLLPuhoUh4siZ3RlfqR4BlOMYWVUd6rpz5laampTzSjpyV33TL+KseBslRyRr2rCIC35EIpi8vTXBpJhwrSiEmN339vBDMJhIsj44oLNuDaNsX90JggwLDr9IcJsjqCuvqTqqYyUksoWlMEaa657IjzpII6iKhu6PaOlh9yi7JLpC2MnGRWUzN0IBczWFbLYjQFLbmVx3vHmrcxs1l4kZEuFNrthpW9M5M8J0U+q+xqI7A0K7re85Zzh/Q0+mGNFkWeAktuTPH36Vs/5byBjx2OkmsStxnOUj//hdOE+8z4kZP1woLoSRnpEtl2Nv5cqaQKBhJzOQbIpPxsqTw3eeF3j2TOiiMbplVBE3KbIVCCvDFQudO50vgE/Vg10B/dKw/ckt50+Ta1An4UMgB6eImIQefBmrd+OpgQghQDb5NvZeBGMGqO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(346002)(396003)(136003)(376002)(39860400002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(83380400001)(38100700002)(86362001)(5660300002)(82960400001)(8676002)(6486002)(66556008)(4326008)(53546011)(6512007)(8936002)(6506007)(6862004)(478600001)(54906003)(66476007)(66946007)(316002)(966005)(6636002)(41300700001)(2906002)(9686003)(33716001)(107886003)(202311291699003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q29kbk9EN1g2dU9yb3ZSYVBkMkt5eVpOc2hVc28yN2xrNXBQNWpKNWNoK2lI?=
 =?utf-8?B?aXZsUXhtS1hRTGlTbFBtdW42T1ZrTkN6bWE0Rkd5ODhHSFNwd1dxakFKRk0y?=
 =?utf-8?B?N1J1WXZhdVZ0cDdyVWRsc3BCb0w1RFF1elB2M1B6SjZDV3g3SWxTemQ1cGd1?=
 =?utf-8?B?ekJ2eEw1NGpmQWt4MEZScmVTTENzMURCN0Flai9zYXdmQjN4dDBaSE0rOHdV?=
 =?utf-8?B?Sytwa1FGbk5JeFRab0dnZm5RUTdpSmJSQXdPU1QyMzdUaWtBVUs0bko4YWUw?=
 =?utf-8?B?T2NBd2VsR2YxSGIzMWpzNHlQYVJrTUJFdVZyNjhVMi9FMnB5TlNIM1hOUGgy?=
 =?utf-8?B?ZGNhd3BDUXFIbkdkbDJ2QTdIaEZCVStsNm8wK01Xa1NvK0VlNWhhTnRRWklC?=
 =?utf-8?B?VVpuOFhKRVZtTnk3dys5aEw5T0pIS2VMZ1BWSWVYTWNpNGdTZjNvemgvWWht?=
 =?utf-8?B?MlNjTjZWNWlDbnFrSmsvN2RyWjhPL1pNVDJFZy9xYjEyVzVCRGFlUkhOdnI5?=
 =?utf-8?B?RjU1Uk5BRG9zam10TVJUSFByYlVhUGVQU2pBaEVOVlRZMTJvSGp3OTl5VUdV?=
 =?utf-8?B?MVFTSUNEbklTb0ZyQkFMSDZOUFNIdnpCS2twT2taZTlMYWFsUU5Pb08rTlEz?=
 =?utf-8?B?M3h2NFBXdHdKdWZ6emVhZXpsanRJc05yblRiSWszRFh3VDhIdUtBaVJsR0FD?=
 =?utf-8?B?dlFieGZLOHlKUHZJQXJNTGI5bXJVdjByc1VNZU5jTTRpK0hKMXUwVk5jNFds?=
 =?utf-8?B?djEwdm1rMW80TklsVzV5Yk1XQlBFZDBua0FzYUdTSmtUbWdLcU1RMnRtY3ZZ?=
 =?utf-8?B?TGFRaDJ2Tk9LYUpXMGRuQXFVYnBKMEZvcm9IRmlDU1BzRjJMOG1WM0I4UlVX?=
 =?utf-8?B?ZUF5OFZxOEhZeGl1SlZ2SnJpeUxuQjJRd1pjbmdOdys0bkZFK3llNkxVOEd6?=
 =?utf-8?B?VkdBNGEydFQydklZU3pGdHhXRkQ3TnJkVHlHQXN2dUNxSlZiQTI3bEsxMHBI?=
 =?utf-8?B?VTZqb1NhbW43RUxja1lES3kxOW9GbXlQd3JBMnBodDYxWkplRm1VYk5oaE5h?=
 =?utf-8?B?WjBhL05FUDQ2VlUxcWU5MWs2ZC9FeE5mRC9yamFKc1pCRkVnWFc4ek9VcklM?=
 =?utf-8?B?clBENEpyL29QZ0ZLREJWUVdpZTV0b2tMdHBxeis5TnhadGJBMkdORmJWYW9G?=
 =?utf-8?B?aENUbC9aOU83QWwvTTBSTGVzaTl2TXBVVE9lQ0VEV21OWm1tT1lVNTh1QnBW?=
 =?utf-8?B?a0VmUEFYbE5pd1I5a0RVS0VKYlN2STJpWHd2M0VqdnNhQkNlNDN6YjY1aE5D?=
 =?utf-8?B?a05icUxOUytmRWhpT044eXJ2bDJqV0FIRmVKOEJFeFNLbGZzSWc5am5CeTVx?=
 =?utf-8?B?aUNwV2k4YU9zWGh4MEpoTEpGWENWUVJqNEJvZzcvbDY2N05WTFZiVFpUQTlt?=
 =?utf-8?B?eFhjZ2Q1a2lZL2ZnZVhiUFY3T1RwSVhKUDErM2I4VFFHU0hGdTNPQ2JlcEZI?=
 =?utf-8?B?UldFOERwOUdianFPbEJOd0p0RE9Cb1lCVTZLSGF2RnJsdC83M0RMVXhTSkli?=
 =?utf-8?B?dHVYZ1hsRHM0NkpUaXZsVlhENk1nb052aGdpZ0ZaTlR5cW95RnBCQmRodUhP?=
 =?utf-8?B?aXQ0ZDJvOVNrK290NDNHL3czM3dKRGtOcklVeVpVNVkraVFNcWhhRUdhZXpN?=
 =?utf-8?B?cmdZNFZkTVA1NlRrcThRZ0pmMjE4UlJVeE1FdHRjSkRUeDM2ajdqeUZOZzFz?=
 =?utf-8?B?RkVMTHEycUxQU3dDemtJK3FJQTBselFPdXJWTWxKUS9lbkRjVjBuQ3FES0dF?=
 =?utf-8?B?OUpTOG5UNGpwSnovUFlJLzdNbjF0Q3h3OW1abGVNSytxYzYzRDFGTm1DbUVt?=
 =?utf-8?B?QnZvbCt2OGF4ZmExY3RZMUMva1B2R09UZWgzekZZbFkzOVZhWXZXMmJYS1Nw?=
 =?utf-8?B?WG1IdEIxbWw2cHc0MkJRSko1cE50U2srQVMvdks3UmFMdjZNZzhuMFhoYmJ3?=
 =?utf-8?B?ZnpFVm13R0lRdDRaam4wdGNXYkcxRHVNVll5cFlXNmNLUjNUMXlIQlM2T1Ix?=
 =?utf-8?B?dHRVdW5aQ2JUcmJwbW1HcUtWQThKazlMaVhVVGwvSjN2a0x6V2d4blNZK0ty?=
 =?utf-8?B?UzMvV2kxZVcrcHpTRzZRN3BuYmN0ZnJVRmFWczlXeUlBSTk5WENOMmw3NG54?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37155145-245a-424a-a589-08dbf12906e6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 22:17:51.6140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C3PZROx/p6udDu0np2fL5aM8wamuPh7qaMlVc5ZA5OtwHgHkIlA9trALQ9Pu2igpASHenPCo0SSfsDkNimIqV9RLY+z4bZKOcAGZKxajoBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7821
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 19/22] drm/managed: Add drmm_release_action
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 29, 2023 at 12:52:55PM -0500, Rodrigo Vivi wrote:
> On Wed, Nov 29, 2023 at 10:43:24AM +0100, Michal Wajdeczko wrote:
> > 
> > 
> > On 29.11.2023 02:16, Michał Winiarski wrote:
> > > Similar to devres equivalent, it allows to call the "release" action
> > > directly and remove the resource from the managed resources list.
> > > 
> > > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_managed.c | 28 ++++++++++++++++++++++++++++
> > >  include/drm/drm_managed.h     |  4 ++++
> > >  2 files changed, 32 insertions(+)
> > 
> > shouldn't this go to the dri-devel first ?
> 
> yes, please. Let's send there and try to get that quickly through drm-misc,
> or the proper reviews and acks there before getting to drm-xe-next or this
> might block our initial pull request.

Posted this (+kerneldoc +kunit) to dri-devel:
https://lore.kernel.org/dri-devel/20231129221412.1180549-1-michal.winiarski@intel.com/

-Michał

> 
> > 
> > > 
> > > diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
> > > index bcd111404b128..f819940b8a959 100644
> > > --- a/drivers/gpu/drm/drm_managed.c
> > > +++ b/drivers/gpu/drm/drm_managed.c
> > > @@ -176,6 +176,34 @@ int __drmm_add_action_or_reset(struct drm_device *dev,
> > >  }
> > >  EXPORT_SYMBOL(__drmm_add_action_or_reset);
> > >  
> > > +void drmm_release_action(struct drm_device *dev,
> > > +			 drmres_release_t action,
> > > +			 void *data)
> > > +{
> > > +	struct drmres *dr_match = NULL, *dr;
> > > +	unsigned long flags;
> > > +
> > > +	spin_lock_irqsave(&dev->managed.lock, flags);
> > > +	list_for_each_entry_reverse(dr, &dev->managed.resources, node.entry) {
> > > +		if (dr->node.release == action) {
> > > +			if (!data || (data && *(void **)dr->data == data)) {
> > > +				dr_match = dr;
> > > +				del_dr(dev, dr_match);
> > > +				break;
> > > +			}
> > > +		}
> > > +	}
> > > +	spin_unlock_irqrestore(&dev->managed.lock, flags);
> > > +
> > > +	if (WARN_ON(!dr_match))
> > > +		return;
> > > +
> > > +	action(dev, data);
> > > +
> > > +	free_dr(dr_match);
> > > +}
> > > +EXPORT_SYMBOL(drmm_release_action);
> > > +
> > >  /**
> > >   * drmm_kmalloc - &drm_device managed kmalloc()
> > >   * @dev: DRM device
> > > diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> > > index ad08f834af408..f547b09ca0239 100644
> > > --- a/include/drm/drm_managed.h
> > > +++ b/include/drm/drm_managed.h
> > > @@ -45,6 +45,10 @@ int __must_check __drmm_add_action_or_reset(struct drm_device *dev,
> > >  					    drmres_release_t action,
> > >  					    void *data, const char *name);
> > >  
> > > +void drmm_release_action(struct drm_device *dev,
> > > +			 drmres_release_t action,
> > > +			 void *data);
> > > +
> > >  void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp) __malloc;
> > >  
> > >  /**

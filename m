Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BF8C25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 06:58:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4291710E2E0;
	Fri, 24 May 2024 06:58:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Okdq8eni";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F17810E3D8
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 06:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716533883; x=1748069883;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OhIMdsPg5l7+OSuw/ATBKQtMIc7SXpaQymbigEAlA8o=;
 b=Okdq8enierU4XZ0j9Oweyq2wa5RYJpsC49mZg4pgM+nnocr2AbAImMNp
 k9XgdPCkaiZiDGDasShkiI9plzUMMoV9Cd2h9wtjsWvk9H27jvIgam37b
 6IX7hZ5Z7/+4QAqx57ooOOgTLBFHDJnEcARuqAplM2JmdQ4w0BRDjMXmy
 q7ikh6NSIMc3hQ8FO7fzpEfFdQ5Og8ykZCq0R8tovTw0TYM6/nBzlHQ7B
 9C1sVzgFbz/2w9o0FJC1QRog79Z8XTtp0y58V+OY2r8s6RLPMGMnQ3i7d
 qmHuwQxWL8NpGSH4Npp4A8uNcaNxUMsxyL8wqOPaVzsU4F8qEZkxnQHTl g==;
X-CSE-ConnectionGUID: zxisAXdESsi89xUjte7WxA==
X-CSE-MsgGUID: ZFYvxSgwRl+MyGDo2kpwrA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="30431022"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="30431022"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 23:57:27 -0700
X-CSE-ConnectionGUID: pQJgUpmETLCrA0rID6VmVA==
X-CSE-MsgGUID: 7dakMVQ+QVSSR3THGQFyNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="34039482"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 May 2024 23:57:26 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 23:57:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 23 May 2024 23:57:25 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 23 May 2024 23:57:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YBKg2NYQmcgXY8DKjHdui2uE/+Ko4dwkOB2BBoGnOdKajFOF92ZH4wi2G+5TvVpAMVkcDxuoD5A7L9AJFhGP1OK76zCBM/+CZRF3iS80scRdGslgFNq+jbi2jUFSw4l+zVI2lVXnrHRaz6WMSMwYJERpwdR3uLTAQU1ioek2IFEcC5KByWhADmCFEIzXo+qmEw6SnagpP7lgfSaDYjljfFMpttEkFd2Wn2kt4r/0oGFoLdCD93fJhZgq8mA0T3m0107YAIGqHG6CSa7dzsVx8eTUj32Ao8babkptFxu6W/PtSQvvMj5ZYumtpY0D7t/9FvqzVZ4guNmHP0EIw4reSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82wKP33OB2xcqmLeJwk9cisNmc6tCULrA0b2YoVZHVc=;
 b=OGNMImSE1oKNwux9hyZ2p4/9AWAFO4HHjw+nGp4njzRPShRMiRGV6xgMJq7lKZjs8SMYucFFVevWRZEOhewGHhesfYVilcIpeMUYIWffC/Rs3i+jFgyj9c+j0g8NJJ6QdeDkjh3ksEWDBjvAsuvzAywemOuKH4yZ4xk68FtR7Hwu3bkr+o6mNAlRveu9PumNdUlyuZ6X0IzcNiF/wYqZY9/a8wIJjvHLdx9kmjpOPlyfdibNG2Vam3ZceeHrtnxGgh8bgLzFjKkfmp/tb+HdcWqEoV1Pq7tbsVakW9CslT/y6fMjllBUcfnSk7vdm6vBO7NBmnfOiuxNk36cuGdX4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6527.namprd11.prod.outlook.com (2603:10b6:8:8e::19) by
 PH7PR11MB7641.namprd11.prod.outlook.com (2603:10b6:510:27b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 24 May
 2024 06:57:22 +0000
Received: from DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0]) by DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0%4]) with mapi id 15.20.7611.016; Fri, 24 May 2024
 06:57:22 +0000
Date: Fri, 24 May 2024 06:56:58 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 4/5] drm/xe: Remove xe_lrc_create_seqno_fence()
Message-ID: <ZlA6Ol3FhsftA2uP@DUT025-TGLU.fm.intel.com>
References: <20240523152911.28387-1-thomas.hellstrom@linux.intel.com>
 <20240523152911.28387-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240523152911.28387-5-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0043.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::18) To DM4PR11MB6527.namprd11.prod.outlook.com
 (2603:10b6:8:8e::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6527:EE_|PH7PR11MB7641:EE_
X-MS-Office365-Filtering-Correlation-Id: d93795fd-3e56-4f4b-c1bb-08dc7bbec302
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?b2AfTyEfFzq5HQLI/NKRX/aIXQjgiNyCvQw8DJDGMe6vM2785Snc/YwUYB?=
 =?iso-8859-1?Q?+pfRi3sKpRMIeOsEto3zAbhYnRiv+zNV1xNIGNlPmk8mC7XjYKTvWUnv5t?=
 =?iso-8859-1?Q?pzysx73ZuPnI4l9vLjio0/Z+RKJUCYRTKDnXBzPYsPPFFIqVDBQjLf5xTQ?=
 =?iso-8859-1?Q?7m7CmR+aBjt0wUvwmEeVVDiHWn1nRf3S704EDoPxzgFVR7Z7KFl7qAGj80?=
 =?iso-8859-1?Q?AnfNrNu7mw683lwlWH971ZrpY7eWEZuFG3QPKBYObL/vaZR8unysCai0JO?=
 =?iso-8859-1?Q?H9148m9MmIVK1KwDRXGUfL2miWaLTATFCL81vsskmQaRcBOqq0uVzUM/LT?=
 =?iso-8859-1?Q?fSFmasHocA8+abK1AAJWYqTXMsYY4NObMApbQjTvYbSpxbH8OenQI8tI7t?=
 =?iso-8859-1?Q?Nqezl4h/u6Jio2MXwV3b406/+B54cChxPj2wvMxPxFMlGS6ZlVIwt09ERl?=
 =?iso-8859-1?Q?D+RtBzP5N0/YmACNfSECHjW2Eeq0SfAQiKECAsZyhzX7Sz69rMlisolfp1?=
 =?iso-8859-1?Q?OHfNrvH1TRwwe/5T3ufv6e+OgBAiN7rtClG7/z9ISKyodmQSiRlTNmgZnf?=
 =?iso-8859-1?Q?Pu41KXHyjo1ZCiMIY1U1RGeychZfpL9DurlBCrB6t2XOzdbvVphcZvHAag?=
 =?iso-8859-1?Q?vfz7o0bYljL/b5UExKvpieP59RtkqyMmGvzNdSqBkAWwz2RACW+pabHXCI?=
 =?iso-8859-1?Q?PWPuHES86FOX4/iiJ8bFznAz+ddfaFFeOWqxWyuR+ZJ/9vb5lXlFpwwsqQ?=
 =?iso-8859-1?Q?8ldOPJgQROugz+AeFEQZO3SzNg5rnAsj3u/5JB4scefXHyx9GN/j6rbhVZ?=
 =?iso-8859-1?Q?DZd6NeYQrn2Xr1l3tougOdDueetcZUL6qZnQWMoLvGUl5eFo5nKMQz4cs3?=
 =?iso-8859-1?Q?9tKkDqgrMxV0bRCI+zaKFlwJbI5aCPsPxPw+P7TIe7RJofTd/hZsItGGj+?=
 =?iso-8859-1?Q?2p9anAkGja/M/w16BjFfXz6PdtYDk/ACPEI7Dss2y0KARXIZvO56kQfvJL?=
 =?iso-8859-1?Q?8Gszgu3aF1d5ttakOLP83ogNhEFuRecCaikjoPPA7RQ1zsPHM0wUYdGmn8?=
 =?iso-8859-1?Q?8lh/FY/R+rjlKbjoSrgQbHhpOiOCWabs/kBIkoofi5aquQ4oYoQnunpQYd?=
 =?iso-8859-1?Q?hy8RpTaP0H6aHUMZVsGPSF7rUcy7rrUTf0k78mT+6P9Ig2zfRacxMZ7Y6N?=
 =?iso-8859-1?Q?3pZCr/AQ7QnAPMgpMkDAcob+GWfllayTfpkfeq3h/wbaTGzKQmoiRQ7g8q?=
 =?iso-8859-1?Q?Kvn6w4rVlkzV0snNNwelmoDDl6rxkCvqI4PQtZUPkELGCMAq/1Mce8xN7Y?=
 =?iso-8859-1?Q?Z8qOq0cKplbbNJMZL3abynAQQA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6527.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3xjSh1W7RXmh8hJHm/WZkRdQ/0ddPCOuJ0Zypvworkpb+PyZu6BncC1a+9?=
 =?iso-8859-1?Q?v05syBuRo6RS14GkWXdh44GEAMo3qWfKfXjS8gAfnruVI7c8zT31SgB0T3?=
 =?iso-8859-1?Q?m6NaWXN0cHCgP6C953fJmwvF8M9rmRaJWwJN4tjzYynmb2XACeTS+Qhi0l?=
 =?iso-8859-1?Q?Udxgb6NPG74x0iypoeRhmMFRtEZn1QM7tsCkVrJRLTFEF9fyW+Gh2XUMIV?=
 =?iso-8859-1?Q?Q9R5MnK0pB6ONlKfaPv4ZZJBFAYPn4cS1SDQ5JACUrKRR+5O2jyI443fXd?=
 =?iso-8859-1?Q?5JzbdSfXU/EiCKdu8rckEwnUTEGMFmIaqrPnumfB6ini5GnZdwRhzC7vW7?=
 =?iso-8859-1?Q?I8n2z0CRNR4M9thFBuIPx2Ejb6tklYyIe9ojFbwqYNG1mricP3ZfESzWhX?=
 =?iso-8859-1?Q?fPs7O2GcvK0u5T/1OuM172HcVYnjNWWDoiGlsl8Ytj8GtgiyPMD0VIwGOL?=
 =?iso-8859-1?Q?RW4lgr/36NllJWfcprC7gsLqMyYyZYRAOS1QxcYTrM3jcLKcKrlA4ms4BF?=
 =?iso-8859-1?Q?kOuXQESH0G5nLf+q9g/VpOb11VHCrdMO+kcknK3kt8huoR0EbGJ2PAlaWZ?=
 =?iso-8859-1?Q?VIZpqxkl+BqVrIN7dEXYB3A4zCUOKKTJH1L0QNwGaHbiV/Sy4C4b4/A8VJ?=
 =?iso-8859-1?Q?ibXgLQAA+QeoT8b7Sxx+4kYH9YyPR6pNW0U8TZan3QhvpHXIQoA4z3VEXd?=
 =?iso-8859-1?Q?nJbLyUbZ0dhMdBz8wOBhjINvMyP46NJm8uixqUoHfWWb51LkbHVeIrmZEE?=
 =?iso-8859-1?Q?6aHzZgb5oZgldkdAKvFT7TypusCmLzWxQ0j+nak7VC9DYLe1Sffj2PQT9z?=
 =?iso-8859-1?Q?ao+3zqcyf3Rs6e8ylWpnyxxPuSUhKXRbwGDtsO0hhM5FFE+z31oeF7pXWS?=
 =?iso-8859-1?Q?q9Fu5PSM2d+DrsNvYv0/gMVOeNksXtmL3yBqb6NOI8WkcQyIio1GBNsvmk?=
 =?iso-8859-1?Q?yMo/4/hBS7OeA7ZLBlGpXRqX/ddJLiYCJerITO8KmKdoDoBwHp2olAYXG9?=
 =?iso-8859-1?Q?gYDksCnWRlGUO7F4/tzow76tTWMUNv8i2u2deuAODBybyjKiAINK90NvPT?=
 =?iso-8859-1?Q?21s/0qh0BUPsZaM9tmIpRWk58AgvhFiJXDl8UwzUolHkT+pI5i3ncxXwSC?=
 =?iso-8859-1?Q?gzQRFg1g1RsTnTX/v82vQcojW7DNmoJn5+yDi6kX+wwb7KzXzKEMqhHJ4C?=
 =?iso-8859-1?Q?sStDk4aFyeBBFwKaHVRP7724RQR4rLHMOWvbx/VSWQl5BFcUAZCwAgzqyQ?=
 =?iso-8859-1?Q?JBeT2RM4vA5CsKXTxF/BBKraVPZVeFVTxgAbgLqjmsLp0CJtVKNMksYcRn?=
 =?iso-8859-1?Q?nDUsTtfwpsoGpiPAIATUp7adHpmlUq8Tn0HNw+2Mn5tdUKK+WUsu47oaIw?=
 =?iso-8859-1?Q?AeeKApSa5U2DVjjH7tXvWFgWNR9oqw9hr208yHgloHFZkP4hRiYoR4RnKt?=
 =?iso-8859-1?Q?nyoxXtZ2C/WS1XEWR7rk/Wzw/uciXNDingu9VnSyt4bMeBbYQu6RYVVLoe?=
 =?iso-8859-1?Q?wXx2Uar+m6axPxYSDDZigALvJ3jhoA7K+Lncw5G9TTc9eRo7klmfRj8zDg?=
 =?iso-8859-1?Q?N6sl3tfIygR1+YMesircEKfF6PlgsGhdptLexJBBLKqsYA6O4niyFT1Gkh?=
 =?iso-8859-1?Q?M3v16yrQm1kRK8hR0mRxXZCkAo05wm7olbP2QW2T0f0h0utFtXaA3pYQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d93795fd-3e56-4f4b-c1bb-08dc7bbec302
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6527.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 06:57:22.6653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rLIRV8jgS6UUgOnQlD23VueyPAomEMlXG9Cj1DTmiGmO5rMVq19iCbO37XudlLCtlbOUqZwinAJv/UNa7nyVdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7641
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

On Thu, May 23, 2024 at 05:29:10PM +0200, Thomas Hellström wrote:
> It's not used anymore.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 11 -----------
>  drivers/gpu/drm/xe/xe_lrc.h |  1 -
>  2 files changed, 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 7441230ad627..0c7d8dad1cb1 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1069,17 +1069,6 @@ void xe_lrc_init_seqno_fence(struct xe_lrc *lrc, struct dma_fence *fence)
>  	xe_hw_fence_init(fence, &lrc->fence_ctx, __xe_lrc_seqno_map(lrc));
>  }
>  
> -struct dma_fence *xe_lrc_create_seqno_fence(struct xe_lrc *lrc)
> -{
> -	struct dma_fence *fence = xe_lrc_alloc_seqno_fence();
> -
> -	if (IS_ERR(fence))
> -		return fence;
> -
> -	xe_lrc_init_seqno_fence(lrc, fence);
> -	return fence;
> -}
> -
>  s32 xe_lrc_seqno(struct xe_lrc *lrc)
>  {
>  	struct iosys_map map = __xe_lrc_seqno_map(lrc);
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 84e4f4ef7f68..2e6d4de16e6c 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -47,7 +47,6 @@ u32 xe_lrc_seqno_ggtt_addr(struct xe_lrc *lrc);
>  struct dma_fence *xe_lrc_alloc_seqno_fence(void);
>  void xe_lrc_free_seqno_fence(struct dma_fence *fence);
>  void xe_lrc_init_seqno_fence(struct xe_lrc *lrc, struct dma_fence *fence);
> -struct dma_fence *xe_lrc_create_seqno_fence(struct xe_lrc *lrc);
>  s32 xe_lrc_seqno(struct xe_lrc *lrc);
>  
>  u32 xe_lrc_start_seqno_ggtt_addr(struct xe_lrc *lrc);
> -- 
> 2.44.0
> 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5BFC25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 21:29:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290BD112057;
	Wed, 29 May 2024 21:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WWIcrXAa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A9AB112057
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 21:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717018183; x=1748554183;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CeXVnghX++yZpjsqNSnHoF5qxyFoC5EffG5SUTXV+uk=;
 b=WWIcrXAaFm9OfWK8/co+x5WcmDP5NNpWSj4qN6rIo5hqEyb82PmFxPXs
 E+QZShvWezxwEUGPmqiSxfoBSHQGZTVBruoq8GFXJyeN0GxYRjVIdJ3yz
 fjTVRHP5yGz3K8dxsLqjWDMdmSuBtRSy1Vd+f9dsAPq4kdZttWFT4Up+k
 2GNxzWrw1Oi/FyewX1SdCh9jIBdivjkGaWjyDPRZpsaW+yR5U0aEnr1N1
 4Eakb9vDnrQsCgXo3sOn9y5neP8TaoTlMSGbYLfY9+gDhwYHEy6QopD6U
 NZNSaFAfl7Wv/R4lboMRWTqgN2mmS4mcuxaBBtiwiq5UTMjO0VyfSZGUm A==;
X-CSE-ConnectionGUID: NvYWa8x+Ro+OT53K7smFjQ==
X-CSE-MsgGUID: Ur3cmqJ/TXOPceRxSlDwvQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13274461"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="13274461"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 14:29:06 -0700
X-CSE-ConnectionGUID: X72luMKQTWOCJIOpOGroVA==
X-CSE-MsgGUID: a08HXJnkRt6wnl7uGedXKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="39992814"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 May 2024 14:29:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 14:29:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 14:29:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 14:29:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VkmOwKf7K67FWX72DSqeGUTjKichhLVtQxlzFR7ilpcoQ+PkSUsLtxrWnV9rW36i0FuX0VbZVGycvbMgdo5zjbREFbhmvbWmCvJAQflXuSJR6VCO3RsDp4HfhisAppHOUV3UcvttLe1bd2nc55gKPGQsWRKn2hfxrrZEihhXson4o/bre/zl6nX+pjv5AWSqf1/W4T86hHqiWX6knAxWFSqHMCgm4mXdD4YQR+ZEgcM9V/3MWlDfUsmqS1QxCxdgkVZLrnsTz0KAltUwa0CTboePL1cXWc0jTF0up69t2zeO0OlLmZyHfQDq1he4V4Au24pKU4hmJ8LFv/2WyQ539Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3J47iwMMFX+qTbP4ee+EAqcEWKvqVLgxy5dw+2cR6lw=;
 b=jjpWgDnMhcXS+H3ZrE3rHJ8P8bAPrRNEhZVsIgGUM+7OzLdPso3sL7wyLi8U9r+fOAr4WgOuqVzzhdyAxkIUl9RQlUs7hDGh0Qj4BHaFj1QYLtPt6PAWH65Qu1dwoxoUkJST+BRYdLNhfMJZTH5xClse+PrFIjPyWGU+vokKSMSj1HeTpPdRlEPUtrfnlR5AOSI46uH+zgj6nmqWGKdYAh9JOZLQYQD4tYFfusRkihyNVYrwlZkRHaRjTsuU8YL734f8M1906gM7z3XKUrUqZKmUtnOxKu1onMSX8CRbJsGFwfzt92IBoEuUDkTPPmq0SSVxZoG/7IpWZNaq/kXRaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH3PR11MB7273.namprd11.prod.outlook.com (2603:10b6:610:141::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Wed, 29 May
 2024 21:29:03 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 21:29:03 +0000
Date: Wed, 29 May 2024 21:28:15 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe: Remove unwanted mutex locking
Message-ID: <Zled73kpZDfMgkVH@DUT025-TGLU.fm.intel.com>
References: <20240529183319.19731-1-niranjana.vishwanathapura@intel.com>
 <ZleUz3Ep14W6LRJs@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZleUz3Ep14W6LRJs@intel.com>
X-ClientProxiedBy: SJ0PR03CA0165.namprd03.prod.outlook.com
 (2603:10b6:a03:338::20) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH3PR11MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: 6347fa18-50fd-455e-d6a1-08dc80265c7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AWl29R2SV+tHnn4butLxoSiqhVmxUHF535B5ql+L12KdTjrRB4O0VTMgLq5A?=
 =?us-ascii?Q?GNGii2Y/Iv3cEgcT8BOlDvEwUEkYmlP2V2cE/DHdZvulVY+dPbvlyZ342UNB?=
 =?us-ascii?Q?HHJUF++V21rwbl6fA5KIe2F9ml4LGoyhcJhcp92s7n1+xcOVECax3c2zl27N?=
 =?us-ascii?Q?HFmRq7ifeOskxkclS6Waju2obShrTU9+/v7CFeTBUB2JXNCnDTjDFHwMke3J?=
 =?us-ascii?Q?PbGcDe1Xtb2KbjN4hcP1tx7eOUPSk6sd5OFS2yuVauxrtu2f1O3CeQIkBXYQ?=
 =?us-ascii?Q?KfF9FG7512bptlfJV7QeauvFqELGW8/XHdANwn3ESADeZUeXtl0PwgSnPsmu?=
 =?us-ascii?Q?jKCXJZEEzubQ8iEVylznqJnJ0rFF8eYlXkIGh1fqbusS6lyNblCkM3kH6lUV?=
 =?us-ascii?Q?hOyIYKjIgZwLyz5VxiObKpaykqPpWKwgZzA3TmHECDIiU1TTJGZgyZVp4/xb?=
 =?us-ascii?Q?JI3YKiSi6v2PPIRB8KvpTINEdMsZEeyRBcxM+7N9sx0Yy6Rnn4K6a+oFkRET?=
 =?us-ascii?Q?JY8rmP4vnRvHh8d2opv6+2QMmfvrfC0ZcCkYcUnMb8n8Zh6zQjS9oqR7zsRo?=
 =?us-ascii?Q?mcX3vROEHG2R/c6RVxu05XHbVyvX3YXGUvfeq22M6dFxetrtXf55hS2X7kZM?=
 =?us-ascii?Q?+e7KAMsG8E7lnWamSJ842LhvhQrG6zWjMreeVfZWdy7ltHX6FwTI/x9TmOsf?=
 =?us-ascii?Q?BnbZBlDlBeWcoLnmyauu32d8AIDnppRCjPfdCC3Qafvg3GU9C/fnY4QgZgpQ?=
 =?us-ascii?Q?NKSoXDwsvxTAXvxKuL1Git51MCkgwrduEPZ1IAIv5iseuhDEYWgfrd9244CT?=
 =?us-ascii?Q?XfNNdlNX/iLr1AK14NQdB/O96XIL14IF8CKgBJAdT0vZPv8chaxJk6dhioHX?=
 =?us-ascii?Q?aSO+3qvaU5SqMCfqwbW1fJnZuYgf0VCC7JFDCCxTE3I4R2Lp67oew9fG3UzH?=
 =?us-ascii?Q?kl2w7JqlXLaZpzIRpIltYogG2exYIluxswEbcNd+ty7jS2ayHuBmfyqjg2tC?=
 =?us-ascii?Q?YhXyHXwSJ4ViWxaUOEbFAk5FYPoPxbfctL4KYQJ7gGdLxp5ZEebWS89fmLUX?=
 =?us-ascii?Q?mahfb3h9tCaw3nJUCAMIiz9QdiQzknjd8kbCU/MpVkxWT7HlPhAjFsQ5Uirj?=
 =?us-ascii?Q?RTjD4bH2CgWmnpNiNVDdWxXsblQu+IYTxA003Ph+ltr/IT7WHkMcy3bG5Z7C?=
 =?us-ascii?Q?AfRgZOaGAqBvbzNCyjwaBsvb+oTYf2QzTRS+Oi/HtWcxcL75oAFu1v10RXbq?=
 =?us-ascii?Q?LuzACzKGfLP5Ez6jvXGjZjsVGsd3TymqsvXIf+dTHg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Mt1HKYK3fR4Wkwz+Kc55/7cqJToaKjT7C1+VpjFaPSayEgk5w12u9oYclEOV?=
 =?us-ascii?Q?mENw04uKr5tUywkya3NZK2y9OFzkf/Za4FLrxR+vWbCEn3bhh0hd07zMIkgA?=
 =?us-ascii?Q?bOdraGFVNWL5QosgsqBnEaxlqYekU/qX9rzotQDmJAdKNP78SgVeUgNrfiY+?=
 =?us-ascii?Q?Dgz9Y5pp6pOCIxT8s5DZKe4YHoEC7ki3DcVReA3NjPvbU7XR4Ti61DGTd9cH?=
 =?us-ascii?Q?ZNfvHkm6QHcWCBjwcgXLKgOn8Fp2tUcy437XcpYx/46YOjtW/omlJJJX+0Zy?=
 =?us-ascii?Q?VW0pt6v9BH5TkDiQ8t6n1TNryoDkUDhXHhBJqBIiRx7z33Wiyj6rTiHnvDpM?=
 =?us-ascii?Q?mcxggteXSehmph+3WyryalC4UT/1Dpa0bpPecl/bPPeNfICsGnftmW2Fx7lE?=
 =?us-ascii?Q?FpJKTmc4jzC9/xmIDU0iv3cf9t13C0ACJ/bj+NNDvfnULvqFjKVsZXOh42nu?=
 =?us-ascii?Q?rmJoy55LXY1glVQHYwilRMcpCfW1AY5eyIHlky2dDfJtwUWymiP8k3lRaQDq?=
 =?us-ascii?Q?XC4zUr3ZwFjG3FCkPqJlGge2iZ12bHmcPBkhqpIOff313jlM9oARyiUkmlD7?=
 =?us-ascii?Q?RY9aLwTQNHtpSLkIqQZYBP7RmOutDPfjSZEljVeHF+3tp+QOPsZ6x+udlXjY?=
 =?us-ascii?Q?h63xa2X6QkUfqNIIC6TwRhHNIAqWaw+9BJfmz3cpMx3cPeppGYhXN8QPOJz2?=
 =?us-ascii?Q?t/EFaz6e+JRPibglKM4wAMMPDDR2VD3mTCWVBAt7jqtMT/2HLCqMdo7CR4JK?=
 =?us-ascii?Q?vqNawoS83xM1+4f5GpAHgpo5yNpsbl4foa/W6AAAQJKY1e6lxN9VU98qRWH3?=
 =?us-ascii?Q?KNaK05itT/jr0Jq0TAmYQdKL2bHRC5MH6vzK+HxDU7MccMOlFnWICBZ0APE7?=
 =?us-ascii?Q?gFl9BhMzUtQq3qUc6WtbzbaGGCU16AEKd/PvE2yvDEk+oVWRKtt8ScQ5yUWH?=
 =?us-ascii?Q?yTfao+Ru9Ysapd3c0YRsQf2aeoT6y71xQ2iOJEvp19LTGVSqyNDXmU0tfcU3?=
 =?us-ascii?Q?2DdvbQhfET1b6E7NqMfy8B2+9EeNBweYNOdEoKDxqFwTuN1PhPWc7L7dhbMM?=
 =?us-ascii?Q?9H75YCjvTVTonMl/0lbIjXyxRo415gDwYV8exrQqdmAaYW86iRL/r7gaJ4D1?=
 =?us-ascii?Q?cEhbajwB+DEF88uTxuqUTDxDarcleJQdbDVw/etjBReRjDJH6h1gmX0bivCb?=
 =?us-ascii?Q?3Ya+jA3ZBU+5kyhdy0Z27SgVXfu60Tj8Q4RGhQsiQt/kRE8wuWsYmpPJhE/Y?=
 =?us-ascii?Q?1M74ZQtXCF1Mvy/D8VF5Y2kRaZGlMxK64Dg/wXTjFJOW1nHxfLbU27SAJsEX?=
 =?us-ascii?Q?GlyNEuHMtBj7pB1JKi6sdNLGhPTS4DgU7G/TlR3c0/pcN1DxICfhQOt2S/9e?=
 =?us-ascii?Q?bf16zcf6fi57iNCVxDeTg3m5cHUva0cNUk5GvjA6L8Xmfi6yTFc3/fi3r3yX?=
 =?us-ascii?Q?r2jsCfUNTfRBj+3hZku2OfBdQYvUvJy2UsTCyhCOZv2NTFmpDWrizxwzYvC+?=
 =?us-ascii?Q?zacACgURpntdXQuosDHW5bBMGhVI18iC93JRb0RHtngvWxNgWbV4DmsTzRNe?=
 =?us-ascii?Q?YUmhH2uFGetGSKQkTxndHOnLhkhl2o4WaTOZAairfyDw/xDw0E7yXpRGgnGK?=
 =?us-ascii?Q?Ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6347fa18-50fd-455e-d6a1-08dc80265c7f
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 21:29:03.1008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fb+69ZFhJ2PNnM2p8+BMYgK49nrX/gKxXpDdf/OtWa6Tp/Bl5jeNotLdoQBzjGlEChjNzKRyOoKZd5I7O414+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7273
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

On Wed, May 29, 2024 at 04:49:19PM -0400, Rodrigo Vivi wrote:
> On Wed, May 29, 2024 at 11:33:19AM -0700, Niranjana Vishwanathapura wrote:
> > Do not hold xef->exec_queue.lock mutex while parsing the xarray
> > xef->exec_queue.xa in xe_file_close() as it is not needed and
> > will cause an unwanted dependency between this lock and the vm->lock.
> > 
> > This lock protects the exec queue lookup and reference taking which
> > doesn't apply to this code path. When FD is closing, IOCTLs presumably
> > can't be modifying the xarray.
> > 
> > v2: Update commit text
> > 
> > Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index f04b11e45c2d..4cca16f2d4ed 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -96,12 +96,11 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
> >  	struct xe_exec_queue *q;
> >  	unsigned long idx;
> >  
> > -	mutex_lock(&xef->exec_queue.lock);
> > +	/* No locking needed here */
> 
> could you please expand this message here to avoid git-blame+git-show
> when trying to understand 'why not?'!?
> 

Good catch and agree. Frequently look at code which git blame fails as
code is often moved around to a different file / location and then
finding the original commit message with reasoning is hard.

Matt 

> Thanks,
> Rodrigo.
> 
> >  	xa_for_each(&xef->exec_queue.xa, idx, q) {
> >  		xe_exec_queue_kill(q);
> >  		xe_exec_queue_put(q);
> >  	}
> > -	mutex_unlock(&xef->exec_queue.lock);
> >  	xa_destroy(&xef->exec_queue.xa);
> >  	mutex_destroy(&xef->exec_queue.lock);
> >  	mutex_lock(&xef->vm.lock);
> > -- 
> > 2.43.0
> > 

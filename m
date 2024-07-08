Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A681C3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 22:19:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF7310E431;
	Mon,  8 Jul 2024 22:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P88CpzyO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E77010E431
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 22:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720477147; x=1752013147;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ut9TUGV70qeAltDU4G1g28L9W0Lj+8DadUHOm7lONXk=;
 b=P88CpzyO0Q8m6cms4i51wXe6xJDZ3QMUEDJAXuSUosSiRrVDu0t4o9xi
 dRv12oeukIDLEQDtdTbEDMwFQHzUBPCEFcmhUPPA7360/gbeMozPK41pf
 y1rrh5YMn5GS9Q+uNUt1bg9PxnEPbyd0WbXmZYyPd9METabo4tJ2L8UXI
 SpzcQYSlp05f9aJR8c1+phc3fZNmWHVWmFFOdmvyCUFRAatpqQC+njitN
 xQQETT3zgA8KbMV2l/VaIa+oRySfbYy//dmWoQB0ar5gpI5D7PM8/vol5
 GT1XNyp/36i6VTR9LYW8XkMz1Zeg0fybZq95eI1tTdsPAN8U5l2ltgu2Y Q==;
X-CSE-ConnectionGUID: 6ds94hBpQAmzIqlY7ql/zQ==
X-CSE-MsgGUID: iIeRHlq6RVKq6DaDawISoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="28372114"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="28372114"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 15:19:07 -0700
X-CSE-ConnectionGUID: AOM0cFTtQfqw4ZuX/2jwFQ==
X-CSE-MsgGUID: lpqISEAnSAW8VQkxIzdQAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="52238522"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jul 2024 15:19:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 15:19:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 15:19:05 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 15:19:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mm470wNlJBesVhyjAu4W/61q7Ljja/yu+23ETiyxVdf5TWjJNfwa6JT629F2hOMN7WEEl0Q0hYI40qV91Gtz7Z7ZzAHk9FQiZUl0CcSXJjjnXgjS2xC3ByLoFm6mD1dMIi1bSlpLB+lpEeIy5vSo0d633wYdR7Zh9yYI+Gi07ngg+q2f8aAeoyMxsHuf2otY4TrlggouLJbsW1SFdAN867ypxH+5wrH+U23U2d9d8UyC3GKoE6b/NS8HU4z2OCbBdOPM6VzptAL04MRCuIYjmw1obOO7J9QV7VRNNL6APBX6jtYMfmPulKprTQcmEHKZH15ZikLXyad9+38IuBByfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zi2ztf3NTsYaxRefPBJbkDToGcGwM4j1BwcsOaU16IE=;
 b=h2O81Jn0O9Jf4MYiMEZhKEOMJUO372FIWOdwFQP4pp0oTw2H26soRR+J03UCCGb6s1xrxp92GPi2NijaKT6Ak5QPEO2hb0fc0VFy6hBm9G3cLyakPebHWKjNr8zQBMmNE0VGqO31TEcwdSu342z5Dk+clRCz1Mb94ld0umcR7hV7kIXZy70Ujv6yQlW7fx5ld9Faqdr3WVGUD36nzxRRcVeuQZKkERCJSVqucgyMn3SuedJA/c9G449ZsP+4VlZrucFuCo4VmVJErHKQekMvoClcGndWBdanpopNidq7EWx3B0+bHLggKmliDetLOK4pG9s4bkMvGfMsK5KyOpUt2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6527.namprd11.prod.outlook.com (2603:10b6:8:8e::19) by
 SN7PR11MB7538.namprd11.prod.outlook.com (2603:10b6:806:32b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 22:18:58 +0000
Received: from DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0]) by DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0%4]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 22:18:58 +0000
Date: Mon, 8 Jul 2024 22:18:14 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/5] drm/xe: Move part of xe_file cleanup to a helper
Message-ID: <Zoxlpnw+xWtRGOk5@DUT025-TGLU.fm.intel.com>
References: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
 <20240708202103.3347869-2-umesh.nerlige.ramappa@intel.com>
 <ZoxYPUice8rGGTrL@DUT025-TGLU.fm.intel.com>
 <ZoxkUZMQUrzSdVGy@orsosgc001>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZoxkUZMQUrzSdVGy@orsosgc001>
X-ClientProxiedBy: SJ0PR05CA0050.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::25) To DM4PR11MB6527.namprd11.prod.outlook.com
 (2603:10b6:8:8e::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6527:EE_|SN7PR11MB7538:EE_
X-MS-Office365-Filtering-Correlation-Id: 830d9b75-5442-4f50-0b57-08dc9f9bf63c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HlYsy8AHWc+itMJYR6B46ozYCwDEIQYl12bUhyp6R8D0dXRPE7zHdrjoZhjz?=
 =?us-ascii?Q?wx8ZSGD4Y5oCaKfqV+afyj3dRocnY/qgnbHw0EzMR3JmhgWJIBf7JiG/21ET?=
 =?us-ascii?Q?BgFZPyOTVnH5WpBjGOxMXkHTKQ7vRK1ypAMlPNNe5isf6OEKcjXoUxU5OyWg?=
 =?us-ascii?Q?au6sb72vqf4DH26///mFHoTd4Y8RDSfCgldFAruQFO09p0HuPTEYB6+7Nvgi?=
 =?us-ascii?Q?vL5w28fpQVewSnwmXHcRM6CEwNgK+fmk1WCCeubgi1PGW3LTUfICAY+TD6kR?=
 =?us-ascii?Q?8b1xxdW+hydvEebfIKnELzdHr2m2E/AFBL45DlCQbrjSprFnEnESPX8eIhr1?=
 =?us-ascii?Q?tlI6eKXjgjBNehW2ZyT72p8LqfSlk2wVKn7loG5co4fVMfuMHJr/M1+6eb7J?=
 =?us-ascii?Q?Z0afmc51ZHMxfsalft3JkhTrtfDiW+eBOGxORzslIksdihdC0yvXLQrIaTwn?=
 =?us-ascii?Q?41Iln38ID2jS8igcfghBzjX4l9aQ0FhLD4UlK4oasBMpYa64MhyvdbRR0WmE?=
 =?us-ascii?Q?Nz7HqAOgXtNN0tXB7/+ttQNoUJSC0ZFGaJRe9HdCpskC5uQlwR02oGoOytBJ?=
 =?us-ascii?Q?xg9YgPWeeQbs1nUmP9PL3+/5z7i/bVg5B8KTui0fZ14+msFzK+XFuZp11Y01?=
 =?us-ascii?Q?yp93kC10MlP+pmFCgwfMcka5BOWLT1Z6QMQkbkf+6kYPNnk+okY8P4UDlJ3E?=
 =?us-ascii?Q?pX15MlsMiaS8zHRvQPAPlYBCXqK9YWFZEmuGakep9PIp9pAh6U5nDH5vLo5I?=
 =?us-ascii?Q?nGLw0r2QbUEkHzGE1nwG5wfi6ocezK2s6XqbdnGfWbba7PtTfx1/98ctByVR?=
 =?us-ascii?Q?hINaFIHfCk3hFIA49thDoqwdqQWmK1ZS2Ju0GZfXKRzGFR497KPHMixpg/bX?=
 =?us-ascii?Q?IZWbILyw+9i08Lhmu70xlSmBKlUCPvSRMkvhon+F2Ghs4CAlMSDvIWob9mAp?=
 =?us-ascii?Q?tVV9xytjy1vAJMzs0y3HwZnh02XHyFH5lJqgZBPco2giekCXlPLJHpKdXkFI?=
 =?us-ascii?Q?9ZkBvOkCeg+9JMUXtWt64/CwgiiHgG/KRh1tW71l9iphvI7xDVWWgzdHCj9C?=
 =?us-ascii?Q?1nvxYklyR1mBLWG0lhMwIqQI2iGUG/W0f6r/1mSK46rf0KL+4FajhhONrtPy?=
 =?us-ascii?Q?g6tIT0kX4u4gIbyADkXDXwRaXxxAlEgGJNhgyObr5rCLL3+Yi0LIv2DcHtnp?=
 =?us-ascii?Q?U7otAt4SOeik1f5FbPXK726m0qwxmbUYsz6EDkZBjqo8TXxDIAFmmZ7DLvNl?=
 =?us-ascii?Q?rS2qzRCpB78ecNJDGzIytQXJb0iZ6UwHm+SwqegBXY+pWYChriitg1GZB2uc?=
 =?us-ascii?Q?hv4jlVo6aS9Q7UyRrUXzvkA3u6tsCLOcKYgQoVAGktBGYA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6527.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OF98F0JeXvRi563EAFwN6iO5widz1Xr5EjKqLnaYwlFyVrBQbpkyin5cyYF5?=
 =?us-ascii?Q?UbhrgHEimGnLdX86n56Xdp/0IrlDF/uwFANSgZwEw87k3Cgu5a5kWRFH1NFc?=
 =?us-ascii?Q?BBcybzM63uLbWlDjAj7F2h78VZ2wN2ISFrSyy4x1nKMo/Snm2/wMPoOJGUC1?=
 =?us-ascii?Q?UVLgUzENlfMTs2KjBQJbbSoZWdh/TPYtqlHpBV+34UEuuBOeH+PkBSz7a1NP?=
 =?us-ascii?Q?qykosFaldAW9bvAD8JZR4/qcebIPgafgluhmDKy/CqsO17eBXlmqTEHwkvgB?=
 =?us-ascii?Q?usz+LDi1tsbwRX00Mns/QzuwGxyIMVD5EePb2Mnf3R2DkW0X9qq0BoeqcYwT?=
 =?us-ascii?Q?2fjWL0gLn+jclka6dIiwtMV4bGUFQElAIYVdUvQIIdDIeFYvpObAgEZ1ok2L?=
 =?us-ascii?Q?XHpFm1zbjq2So/n1JuRlRlUHcyp83EIKPqjenF+HQ/PbhNiYrDQqFNXCNi4y?=
 =?us-ascii?Q?+fKSP0qTaaRFNmdYBC8sOPN0EURxXDlChdwKrDIizBOUn6MGkuQwCVmlrBiJ?=
 =?us-ascii?Q?Mi0+xH+rIr5MHx10WI6h2IRQ9/B/nDR8MoTP7bJ8fRcLUcDOk+jUBB8edxMv?=
 =?us-ascii?Q?bYyWNTJfKlDZ5bEgC5cTsx6VpPM4aCuPhpgwmjpZhviSCBZwecHACa6YRGbh?=
 =?us-ascii?Q?wQ2P157Z/5GZCjgBtw7oZW7bxWpHKKqFuR5bfhi8heuMrEn2bjs5gd75XLpy?=
 =?us-ascii?Q?ZAYnPMgCEhU5u3pHuQwYKL5mQ6DZrACmJBu/0+foANJyZ2UMuEeMnW3nmpyw?=
 =?us-ascii?Q?49KigVoIPgMB5szUQm7WIOV+feJPJbipq+uNmihj28tnI9Xpe5fkOmuFIgVD?=
 =?us-ascii?Q?srF593VO4WGyzzI9FbllXUzNrW4FmlOzUtXe+IoZhcDw2SsrZRw/Yg3lRZKH?=
 =?us-ascii?Q?WamnGmrsqosRNTUfppC02ZRsetNS2ojTBpz7NyHhkGYFmJX3orIb5smGjpf5?=
 =?us-ascii?Q?z0u8Dabk8TmSnURz24jaQ7V85yisGCAIK0oUn7G/1PqNf+KrQSWNVuh/j0XQ?=
 =?us-ascii?Q?2ki2aP7xnRbx9RMf/kYRQOYFyt7Z/2xjk381AHt1BFpOAnPnjYPCFvf3NHU4?=
 =?us-ascii?Q?Eb3FnbG3fYMErPk/qo7QffCRiI5+R/cODi/YFp55J/ydLc/p9HCLd+3Bm4Tw?=
 =?us-ascii?Q?xTqzjmaBXjSsR7O8Xdu59nx3f6zkz4bZB+5/xXgfwQjJBQekznAmkH3U/g3F?=
 =?us-ascii?Q?0t0hjIbu+9POmk2EwtG9c9nSDdoHz19VaadL24SrKE8lgkU6VB6gPvGDMvn/?=
 =?us-ascii?Q?QzGzFQW1U/05Tgwke8P+xsnbH4xoN+BPx68u1uc28OZ78MMpuWMKkSiQ2QWU?=
 =?us-ascii?Q?zXhE9R9E1gcQ9XihWgXRlqBFRy6AGJPilK/tnUmskXJq322s1pTL0lOOMC9e?=
 =?us-ascii?Q?lmyqKYQqejp5UqjTfnST3Zj7o2Ta7VOfyY/wbjy+bzAg+jIYpUMZ9viLe9Am?=
 =?us-ascii?Q?kBzofKDt/NOKeBMhw4rbcC/ZeN6ay/eObvVGGpX0eBRBP07n2oKWXVzN3HVA?=
 =?us-ascii?Q?SrxR36fAlLHvCow9CmR8yyUGDlhkaxLQplPB5anS0TKzwPK3UItozSVGLWYQ?=
 =?us-ascii?Q?W6VeFkux4P3JNi1gnjIBIM8CC28jlyIvGzqEpjBVC3jvHDu5r4sFYmSEydUb?=
 =?us-ascii?Q?HA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 830d9b75-5442-4f50-0b57-08dc9f9bf63c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6527.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 22:18:58.0970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yczflGS7fK67YR2Gjq6gOtZWZ4n2747azX9J5rhgtUSzaii/edTcEuN4MvrzXz9UyvJLprJXwScGAkyqdXfuCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7538
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

On Mon, Jul 08, 2024 at 03:12:33PM -0700, Umesh Nerlige Ramappa wrote:
> On Mon, Jul 08, 2024 at 09:21:01PM +0000, Matthew Brost wrote:
> > On Mon, Jul 08, 2024 at 01:20:59PM -0700, Umesh Nerlige Ramappa wrote:
> > > In order to make xe_file ref counted, move destruction of xe_file
> > > members to a helper.
> > > 
> > 
> > I don't see where xe_file_close is called in this patch but appears to
> > called in .postclose later in the series. I'd move that change into this
> > patch.
> 
> I don't follow this point. The series is not calling
> xe_file_close/.postclose, so not sure what change I need to move.
> 
> Thanks,
> Umesh

Yea my bad, disregard this comment. I though xe_file_close was a new
function but misread the diff.

Comment below about moving xe_vm_close_and_put to xe_file_close is valid
though.

Matt
 
> 
> > 
> > Also I think the VM should ref count the xref too to be uniform and it
> > appears this series is not doing that either. With a VM ref counting
> > xref, the 'xe_vm_close_and_put' is going to need to be in xe_file_close
> > too.
> > 
> > Matt
> > 
> > > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_device.c | 36 +++++++++++++++++++++-------------
> > >  1 file changed, 22 insertions(+), 14 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index cfda7cb5df2c..babb697652d5 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -90,24 +90,12 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
> > >  	return 0;
> > >  }
> > > 
> > > -static void xe_file_close(struct drm_device *dev, struct drm_file *file)
> > > +static void xe_file_destroy(struct xe_file *xef)
> > >  {
> > > -	struct xe_device *xe = to_xe_device(dev);
> > > -	struct xe_file *xef = file->driver_priv;
> > > +	struct xe_device *xe = xef->xe;
> > >  	struct xe_vm *vm;
> > > -	struct xe_exec_queue *q;
> > >  	unsigned long idx;
> > > 
> > > -	/*
> > > -	 * No need for exec_queue.lock here as there is no contention for it
> > > -	 * when FD is closing as IOCTLs presumably can't be modifying the
> > > -	 * xarray. Taking exec_queue.lock here causes undue dependency on
> > > -	 * vm->lock taken during xe_exec_queue_kill().
> > > -	 */
> > > -	xa_for_each(&xef->exec_queue.xa, idx, q) {
> > > -		xe_exec_queue_kill(q);
> > > -		xe_exec_queue_put(q);
> > > -	}
> > >  	xa_destroy(&xef->exec_queue.xa);
> > >  	mutex_destroy(&xef->exec_queue.lock);
> > >  	mutex_lock(&xef->vm.lock);
> > > @@ -125,6 +113,26 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
> > >  	kfree(xef);
> > >  }
> > > 
> > > +static void xe_file_close(struct drm_device *dev, struct drm_file *file)
> > > +{
> > > +	struct xe_file *xef = file->driver_priv;
> > > +	struct xe_exec_queue *q;
> > > +	unsigned long idx;
> > > +
> > > +	/*
> > > +	 * No need for exec_queue.lock here as there is no contention for it
> > > +	 * when FD is closing as IOCTLs presumably can't be modifying the
> > > +	 * xarray. Taking exec_queue.lock here causes undue dependency on
> > > +	 * vm->lock taken during xe_exec_queue_kill().
> > > +	 */
> > > +	xa_for_each(&xef->exec_queue.xa, idx, q) {
> > > +		xe_exec_queue_kill(q);
> > > +		xe_exec_queue_put(q);
> > > +	}
> > > +
> > > +	xe_file_destroy(xef);
> > > +}
> > > +
> > >  static const struct drm_ioctl_desc xe_ioctls[] = {
> > >  	DRM_IOCTL_DEF_DRV(XE_DEVICE_QUERY, xe_query_ioctl, DRM_RENDER_ALLOW),
> > >  	DRM_IOCTL_DEF_DRV(XE_GEM_CREATE, xe_gem_create_ioctl, DRM_RENDER_ALLOW),
> > > --
> > > 2.38.1
> > > 

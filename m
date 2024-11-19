Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A42D6C287
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 18:50:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D449810E368;
	Tue, 19 Nov 2024 18:50:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WLLh5ezI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F2110E368
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Nov 2024 18:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732042232; x=1763578232;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/LFp22ofu5Cb/n2Azor+/+0FgIZgqycup6dBXpciQjg=;
 b=WLLh5ezIDxfbmoXGjFKqpt3tth02FpeapfmVMP8Uo3nlXwVXvayZAwIP
 SyrvXUQa29Qo8Wa4JQqQuufCw1KYOI5CB7NhB88yvXfZX2AazLcHz09gE
 UEdV10lo2PrMpf1DVTGQfHiUMfqZD5jL6CXG49kFjBLXduNOn69jqje5z
 1JX28etl3qRs4zZACr1wMGINk1M2K/jKZ0NujlBAH6bdDs+U9+/7IIKA4
 WnfkDdlsdrn0TJ34JNKydJw60Od96ogqhroQaY2z1BdGqFIVqdj0C0CAV
 8A2wCHMrDW/HCjfxPsQXsoxeGG13N4f8+aGRHPw6CUquRC0VdIXV5Lft3 A==;
X-CSE-ConnectionGUID: rVixLTCISjGur/7j3v+NQw==
X-CSE-MsgGUID: cs7d9tXpRqa1744kPmGWeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31474552"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="31474552"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 10:50:32 -0800
X-CSE-ConnectionGUID: U+/uOc+mTk2f7HoW0Nc28A==
X-CSE-MsgGUID: KMgq16p6SwiqKYkS+1oYLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="89775072"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2024 10:50:31 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 19 Nov 2024 10:50:30 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 19 Nov 2024 10:50:30 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 19 Nov 2024 10:50:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CExRGFXWvMEdw9jN4yf4o58v0rTEgpp86s5hPLnpro6xfL5MIiTgTfCQzD5of4NmnCt/bWzeWHsMA3y32aK027dTgPqU2dkdOc/0dUW/3N7q10sFGaP9fQXEdsMWcNFfV1wOklfBnkw+rg3mPAkpfeHR9vLPRCDvl+6raekeMP5jsPEzW5+hs7ukGchkRg4m+uSwsXIs0Ja9W27iDZVbHUDmc1Ynx5d+rJ0lUq2GLaV4ifEwoQqKGlxxxpANlkl9Dg0No8Re4b8wXXWsbN4SKADBntSwqzD1Gov4Qc5TNMnbNjksqOYURtKUtmeBCD0G9sDPhRKCbmVFbwqkg+TDnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02RvxTZ8ib+hc4Xj/5kiA8XvGmtsVjrxsAZwq+lWCuo=;
 b=xKrCWV9CTpl1yWdqR/i0ERwoYlSdY7zxnUMTHVLiv3xcUnWTNZ8AFepyHRLD2X+1qk9ah3yez/mvJjtNLUWKV9eFpx/BauDeTmWJCKVnNwklrWyk1s3Tg37oUjy2yRcPNCc3hai9c4l+nm4GQcn6rE8fGhXKudt25WD3MW7D5EeKxSnxSKzq17LUqrUkfOVDvYIcLLznC0mIntJllyvlUVjpXh8zxBuMraCC5InkGs575MwRUVeEAPNmTYMD1rQKU7WfX3mlswntaZsmc8RTi9Op7uZW2HTfYlDKknhQP5+qfQ8vPnW0pf0ycuDW200IDNUL57T75Yx+HiybMUrTJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SJ0PR11MB5184.namprd11.prod.outlook.com (2603:10b6:a03:2d5::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Tue, 19 Nov
 2024 18:50:26 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8158.021; Tue, 19 Nov 2024
 18:50:26 +0000
Date: Tue, 19 Nov 2024 13:50:20 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Drop useless d3cold allowed message
Message-ID: <Zzzd7FO-z9Q66Ugi@intel.com>
References: <20241115192155.2050987-1-matthew.brost@intel.com>
 <ZzfCwCZr0byTqGj1@intel.com>
 <ZzfYK1jr6KTGxR0c@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZzfYK1jr6KTGxR0c@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0257.namprd04.prod.outlook.com
 (2603:10b6:303:88::22) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SJ0PR11MB5184:EE_
X-MS-Office365-Filtering-Correlation-Id: b1150057-7aa3-4c9a-f2dd-08dd08cb07c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XUISEOCt5/oZipqlxQJIEf+IT6wdDmW7Ex6IN09VNRiAE8xxdxLYhHyfde58?=
 =?us-ascii?Q?t05P2cN0uB2Urwl+hElOhW73JCqrFYFiR3zNq9DiyTSn80N5aqU/H9gSbPFA?=
 =?us-ascii?Q?XN31C0CsTVSgOtZJlCXy/KdMQfj5V4V84IphTMJfajQyvRYtcvQn/ZFXB8d8?=
 =?us-ascii?Q?sf73Y6oOpyb7Y6tjT46UptosH0Sxm5ztM7MjeXVQsDEoCZNWlkTrrZaE+YyV?=
 =?us-ascii?Q?dVx/bF0Vnl2ILWlDn9OkfCWjUL6RH8fgQuB/Pmpq1lfRHRp8lMAfVt/g3eKx?=
 =?us-ascii?Q?/+r2VeJRD22gZlMptje62ntwJOaj6NnRX8U9gZ97MzqotPEagwcJXgbmajwr?=
 =?us-ascii?Q?TRfJAJ15WV2IJjJlLxao5l12p+CYEAK6cG+UcvMIX248GPv5WVtaJUSoP0yR?=
 =?us-ascii?Q?HrcF4KGcb/crXcsYLzyu3tOPHOh4ucVvx3GlKeT8U7iLBrc8GKwyI56s9sfb?=
 =?us-ascii?Q?z/G1ogo3DyAkOAH3NRAYYDR0X9Ic6Qq2SzYmzZdEJB1m/+wfHsfDN2VAwUUt?=
 =?us-ascii?Q?slwcEsGVeK28vtS3GNKRGgiXVHUUTc2UuPbsNklwQ8+gYaUTacc977HrmTAJ?=
 =?us-ascii?Q?rfh6qeNb6m91Q627GDC0VRc+WF7W/oTQ3yCSIPb20+kcyV+bwKEivQSFu67g?=
 =?us-ascii?Q?GwFdW0tLgmsnDlsKDU5/1Xku5ja3qzrQfRAaLV6x5MYGcCEJjVLXNskWrHvm?=
 =?us-ascii?Q?xLRSNFK/ejJQFeFYiw99264Q3HCnmq5yIO2bV+WcaPFTjR7ui8Ra+Rr4gkEr?=
 =?us-ascii?Q?FrwzFFxRXJgG8jWxsmWaYdUip0dFVvH3L/iNi9lH2iG19xTl+JL5DdwZOntD?=
 =?us-ascii?Q?+KlUWbW6wGuM9UYSPH2eBPLfRyCrPaoYkf9jKJY7RQyXDSUzKUqamwqg0zjP?=
 =?us-ascii?Q?2V3rJl9sY6imlFsoJwKhxvWMpjKtEibv0qOnhhk7SqvCVB4kycpSmVdmBFOV?=
 =?us-ascii?Q?VFX6rpaN6F0M8kb6X/lnrYy9WM4LxHbGnkVIpTRc3zGKW5cJ8lwuvhqlXfjL?=
 =?us-ascii?Q?A5K5nUWNXCNTJp/VuHOhl++UglI0Ljx21KXxqLiBYNzcbz41x0ISUKzfAZY1?=
 =?us-ascii?Q?LHTuC3ZCtxhEB9Cgemgb2bOY7zAgT6+jxUGGkFtVJ6MJxNi6T6/51IwFRthB?=
 =?us-ascii?Q?tHfl+Emjt4kg/HF+1R5IcdxBN/DLiZ21YcILCHfVBNMTp/nYQ5EDQMeCbYMw?=
 =?us-ascii?Q?s3S56EOz2ZiGoUomSVzESHIcCpO4NmpT1pcyVELJ3B1ch7OVYINmxGgHub30?=
 =?us-ascii?Q?APZB665IDF/+KAkZmKpjdm/12CGRr+NFCbEGYYslMp1kn64WDqmYf3u0l8Zb?=
 =?us-ascii?Q?owwqPMEBkxTWocYEeztF9JL0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vh45JD2GzP3XDyMGavUaFtWnhCGmN4pzM7+VFmEUauAzfO/p7bsiKPXr70SS?=
 =?us-ascii?Q?HYLvOLB9k++blSP0mx/AOWCTi5To1nVDEw/hG92g/KNQtv7FFbLsv92CJPOP?=
 =?us-ascii?Q?hhH7L1ip0cqK/MM0Ufd//aKrvxdYtsdthUe9Pp6rDvRlkxw12kToV+utUI2G?=
 =?us-ascii?Q?nqq72z71ZVq+cG679GSRDEVHvh7m8cSpvekjyBLoIN4oifsv5RJ2tNM9FR4E?=
 =?us-ascii?Q?eNkY9yEwzT+PkATgeiCsDQSfQILsA48RLCL5muazCEo95GL8cLibOga38A4q?=
 =?us-ascii?Q?HKOa6G8Yx2oB3Q8PUPCEU6vKuMpQFqBQz4NkYHOPecmXlfmfKoT5TFpOORGL?=
 =?us-ascii?Q?QUUBoAf/S1uZUtq3yyjYbcu/XssDPUdjBT91AGtqegfQPMVAssQG8S10ymNz?=
 =?us-ascii?Q?Pu3mSmRjrGi+zNvRTEwFu+2f5vbhcxE13c95rs7Eqykz4hxxuvmMeZtCmuIu?=
 =?us-ascii?Q?y4Hy2C4s/+c8HWhCLOvX93zPJXnBvxNyRu3UmlQhxB5hWjF5PF/uKJJ6u6co?=
 =?us-ascii?Q?QEXYEfPmquIaX92gM62TbpirhymyA5HoeeR4u1GjMKCf1E/NNl0C/5nNgvLz?=
 =?us-ascii?Q?MrcyBuKxx2fcDgvO8wJmvVkQJzPFsPtNSWWuFF5JTxZjzCdq7n8AHT0BocEr?=
 =?us-ascii?Q?I9ywNqGd9CDxoesn8aFd7KUDx7H08rHeGaweX+EZotCKvLe84XUtCVZtecYJ?=
 =?us-ascii?Q?cp79ypfY8vkjvWybVbGhKRBNNg0Zzn5ftVG1cwDd17EC2J+CtJMnX8ds/HC4?=
 =?us-ascii?Q?6Yl2JcTvcqt7QlyXsIMnD6wsrdvU+M4qmyn9GAOrty4EyL/7OJN92OPM8fIR?=
 =?us-ascii?Q?81FiMOeqAmp4fcuNyVlA2Pt6Yu3LfWk5xnbLO/TaxdaUwjHiz5IUldK8HH9p?=
 =?us-ascii?Q?t17aDfmlhQvVzMgWP9QVSVqkO+o6wbpmpkLva4z4+7Wksn0f8brHpfBfZaLC?=
 =?us-ascii?Q?dpv/BGkSFbBNUkH42VayQkxmsQbpFbQ18pN49IJaPWNcQjg8IDfgaXbUThKq?=
 =?us-ascii?Q?u/Mo1D/l/rUFh30Q4APsV9L8evecZwgjSeKXEqianunZrqhZpt5SP/l8I/3D?=
 =?us-ascii?Q?iIvue82MOHCAn9skq9bqIcAGDBFSOKQLZzD9mvokhpPXKdIwZDsEwUEuiS3G?=
 =?us-ascii?Q?nTTv06BLSDSWxRZHn0xpeBavyLxVebMm82fUIcdrraG6ffCyYgw/U+sl4ONG?=
 =?us-ascii?Q?T5gkM39T8onoHHdHo69tegAW3i/GKnqB5JiZUDnE73f3qK61Pn0azTH0Mbzt?=
 =?us-ascii?Q?BuaphtioLQ7p6nBoXxmUDlJFfSp/Ntrf8WS31a2BMUiuIgckEcAMugzofA7T?=
 =?us-ascii?Q?c8pPaOJknmZG3N860ZXrPCzPURMDQjkI+5+S46KDEWL9hz2gR4XjnwuQ2DP9?=
 =?us-ascii?Q?nVeJTKtQxlzijgA5NG+LcdVtCWUduugrxOLmeQUSRXw9MNyw1syFfGByTaEo?=
 =?us-ascii?Q?D7Oewuv4BItrJ06oXUAbjuzUgyiQPrgxqDyp97gSxVDerw1aunJuwIAx0BBh?=
 =?us-ascii?Q?LZitb1TOgkgVjkWVxDgggPaOQcUygCVY1EEdaLp3MNkBC1qO5cXfNsDyOpsg?=
 =?us-ascii?Q?9jXr0sa0yDdnKlaL1DFS54FA0EI5K0cBkS4ODiR/8GVSM/4KWjehGg2et25/?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1150057-7aa3-4c9a-f2dd-08dd08cb07c4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 18:50:26.3171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: elryaXZp43FYuiUPSEpe8DF8zSQoV8iKk4DR+CNpy2PKyRPWQj5adoVfAMgRum8mONBhg+haIWlsNKkyU1FJJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5184
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

On Fri, Nov 15, 2024 at 03:24:27PM -0800, Matthew Brost wrote:
> On Fri, Nov 15, 2024 at 04:53:04PM -0500, Rodrigo Vivi wrote:
> > On Fri, Nov 15, 2024 at 11:21:55AM -0800, Matthew Brost wrote:
> > > This message just spams dmesg providing little benefit. Remove it.
> > 
> > I don't believe it is useless, but I also hate the spammers...
> > 
> > perhaps we could bring the status of it in some debugfs form
> > as a replacement?
> > 
> 
> ftrace could an option so if you really care about this enable it there?

hmmm it looks like a good idea... but no strong preference from my side...

> 
> Matt
> 
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_pm.c | 3 ---
> > >  1 file changed, 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > index 40f7c844ed44..80699dbeb2e9 100644
> > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > @@ -738,9 +738,6 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
> > >  		xe->d3cold.allowed = false;
> > >  
> > >  	mutex_unlock(&xe->d3cold.lock);
> > > -
> > > -	drm_dbg(&xe->drm,
> > > -		"d3cold: allowed=%s\n", str_yes_no(xe->d3cold.allowed));
> > >  }
> > >  
> > >  /**
> > > -- 
> > > 2.34.1
> > > 

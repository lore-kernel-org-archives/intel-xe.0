Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C6C2C25B78
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 02:29:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A697F10E684;
	Wed,  5 Jun 2024 02:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W8R51t1s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE0F10E684
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 02:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717554576; x=1749090576;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4+cbsI2ZPlkmTEbM35jRcz2UcwrTav0518nqcVrGl+g=;
 b=W8R51t1sRrv2AAqfpVY+mr7jxQsqNYAZmS32iD9MARhOxTkq78EsRu4t
 ebvGuMfb4QqKKkbw7ER6QOo6E365UZIHMK4e+S2VTT21NPCpajBY8Vkbn
 ZbocabZBNouG9TbyPeSvgS7OIQG29GjGNslvHk0xiYK1APlBoGTV//7Lg
 BIwqlu7Ifz6KlErd+ExX7L5pX+bajirPvPdXbGRi+uySWrJT30v5m/Kgj
 kwSA2e9qHo1sIwu0vXtvU1K1VExnj1BESKcw2jWcguK0ZuAQ9Q81us2ls
 IBCW20evhrEzVQFzfrOhpuBRRFaKKYCeDVwyhQ2abyUEPEEgytBjUvHtI A==;
X-CSE-ConnectionGUID: H3BvGXUAR2mgkpzWbCHUKg==
X-CSE-MsgGUID: L63IkVDbQ/eB0T20fgi6CQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="14271685"
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; d="scan'208";a="14271685"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 19:29:35 -0700
X-CSE-ConnectionGUID: aE28rGbjRbaXA7feW3fmVA==
X-CSE-MsgGUID: Gatya7SRR4a3ACIff/YoAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; d="scan'208";a="37445645"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jun 2024 19:29:18 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 4 Jun 2024 19:29:17 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 4 Jun 2024 19:29:17 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 4 Jun 2024 19:29:17 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 4 Jun 2024 19:29:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RsgQ+ZiHVl9WAgIwhKsVNdK34peQx3f8LSGOUXXQKCwkXG8Syk4o4rtTvwpA7IABnQ+iqh02dp+1MFXAsFFLScBrWNco30Sav1Hk+YMuH/v56pooWUxzyJgQ960Xrs9AoI2crKeTgv/YqsXU6O3NJaP+gity2RDQssJc/ne5T1xfheY33bSCDw8N6r6/bsLsRuc8LfDuCL4zeTl388r25gPuTEL1F/j/hk3cnXZd/aYQsG1JwpLgWC1/esHh/DebQGUDxGryeoR1hVIuZ54FdhTr3VXqYxNSdX7W+UBEbQUE4/ApH3uqvdmOpxKbOjC0xEitqjMoC0eN5Omh45PSSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gAeF13W2Ct55Ncww6m1JaTsrikvLSNTISydabznQJw8=;
 b=V/SEfTE/E1iFgO0LraVwOsmVxFUs3VTdEkPg8/AxgVnozOq1zHY+rxBcLNzHdi0UKuI7YC+5NifNQLC4AWdq6EmW2zzxA+OtDnbX34aQC44ewAuhYEApOTx6jf9Amu/06KByyRJPoDAMeGUQ76E56KwyvpoAdHwBM9sA7SuUIefId6vnFBtFVy3AuGA4XUgVpQjukdd13jk+OepaDrTO7P1LDoXkMduvt+oqdN4ZhHwqCRAK/qTHscCM+Smp1QuPxuHWFC0Uym4Ll8/MX7jZkmbQrUU6nenHZzO7FXGprDtiFzByO/Pxzy1oUg1y6pq/TV7Wy6Vi9bC6lqNWQyTwEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB7004.namprd11.prod.outlook.com (2603:10b6:510:20b::6)
 by PH7PR11MB8275.namprd11.prod.outlook.com (2603:10b6:510:1ae::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.37; Wed, 5 Jun
 2024 02:29:15 +0000
Received: from PH7PR11MB7004.namprd11.prod.outlook.com
 ([fe80::8c26:2819:d0f9:1984]) by PH7PR11MB7004.namprd11.prod.outlook.com
 ([fe80::8c26:2819:d0f9:1984%3]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 02:29:15 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Thomas.Hellstrom@linux.intel.com"
 <Thomas.Hellstrom@linux.intel.com>, "Welty, Brian" <brian.welty@intel.com>
Subject: RE: [v2 19/31] drm/xe/svm: Determine a vma is backed by device memory
Thread-Topic: [v2 19/31] drm/xe/svm: Determine a vma is backed by device memory
Thread-Index: AQHairlh39ZQ9OmFoES1ssXZvy6vAbFiDpCAgFa6StA=
Date: Wed, 5 Jun 2024 02:29:15 +0000
Message-ID: <PH7PR11MB7004DE374AB7F88FBA7275CE92F92@PH7PR11MB7004.namprd11.prod.outlook.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-20-oak.zeng@intel.com>
 <ZhcLKQo+WJ3TUoqS@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZhcLKQo+WJ3TUoqS@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB7004:EE_|PH7PR11MB8275:EE_
x-ms-office365-filtering-correlation-id: 05136cdd-a35c-4a74-9b12-08dc85074b3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?iO5GlzH19fd8ZxG7GC9Mti4Pva1lrSYzD3hfvSLFOucFAoMiPmG0LFYl3Qa4?=
 =?us-ascii?Q?P7CJvvLT5OtyUsrIkvUT88VKnXB52I8SGD5fd/CNz04yngwHpEONM0QtUB51?=
 =?us-ascii?Q?WmYYiM90oP6L8+YjLZv+mlCNWi6cvAgOv+2wB1DvRSLasSwooWT8Qte6EspX?=
 =?us-ascii?Q?TvtlkcZKE71jRNkOE6SlGTl2jRFjxA+QEZj/0HJ6ljCJ+5fxKQDr1G+sR+l3?=
 =?us-ascii?Q?QDY176ZIw8QiYyWqhf+EtYZxQ2lTr/IYSpOMgtC6vXV2+AzDYBLD8ohVndb3?=
 =?us-ascii?Q?Pl5fiKB1GvUPt8AORw11skeDTGl7PkMKye/5DZ86Nnk5RvvXhJQB6/4QpgDN?=
 =?us-ascii?Q?TqgAo6FcPkK23GgpB66FGhhjMbW9vJRbANoDaWhEqaJXkMFHdsFTtZdBPbmi?=
 =?us-ascii?Q?jZ5VU1ZZjFTU5KV00ztAdPAtSPz2Vat4fOmOiDoP4RgpIHXV4o1f6uW2fEFi?=
 =?us-ascii?Q?+eD8dC1bN7j/OpMWpjyKMM48i9Vb5EWYq7Gzb7RGz5vnBueLnZWfc1Dx0iYi?=
 =?us-ascii?Q?TcA+fAMItUz8FdvL2zCu6uApq/B4Q8NVyze7It9hQ6uYAsBXaSteFKr0urHS?=
 =?us-ascii?Q?rIXJKLQqTnFTw7JCY3oFn4b5J1fyuSEJ/K40FBM2K9m9jrtqxn+/NoGRJ2VQ?=
 =?us-ascii?Q?yl3x5IBcwjraB1pb54e/7f/0/zZSLKIgmEA+X8JOTZ4TiNqOTr3If0Bru03v?=
 =?us-ascii?Q?oKb/M5pP6zCastx3c6R6MqKGzBNYku7e4xTRGmBUpFhtl0XVcmjiqtRvufMB?=
 =?us-ascii?Q?PWTqIfqGGXO4VwWH1AdG7GPROpJDVcjo77JSYQXKy7IWKGMlh54o3qBknwgn?=
 =?us-ascii?Q?dPKEFBzlkS5o6a7rZ9JhqdYo7EovJfX8gQ0aqq6H3/EFz1BbAsrLh1Cu6F4H?=
 =?us-ascii?Q?ME51QKSCdb1KDa/vj3l5WQW0cg15LNvh0tqxyontwzG+UXns7GjnEvBjB6UV?=
 =?us-ascii?Q?FE6J1Qo7xGmxeshoGDoXyYV7RYWIOLPaHuC8Eo0hxXCPRUIChPBFBPRfZFqm?=
 =?us-ascii?Q?AwPjo7N+dybN/I0AMaVUpncIwWNH5ZFT5h9KiGGoqcCv63gWRjiwruJT6Pg/?=
 =?us-ascii?Q?EC5qF2PjTgERmXnDSFNm3ii3q4GIyP3XnTkADrSlxvl2BDetoOayvjnxggP2?=
 =?us-ascii?Q?TD/5QfmtjimbYB2ogIuH8ljPgyrMken2Ipe+4nNE7oNWvvFgMBWsY/86/r0m?=
 =?us-ascii?Q?k1/8r9URDcFfRYyq1W5eaBzPxotpiIyJOD0dRtFNAoVFd/HR5Wytv0+HzZvL?=
 =?us-ascii?Q?lZgZ7cgpuk1hjIaMWl/i6BuVRZ+JO7199e2/zg4QuWYq4QLbYIdRu8rOVUxZ?=
 =?us-ascii?Q?Q7e8yM3evP9euJCnPqP/Kex/cdoYxhRW438tCv9UXTVgjw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7004.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Phb/ny43MrHLqw2sThtwmlDL7G5+DyZ8K9fA8wLJpe+G6/yQOCqKkvXKs5+X?=
 =?us-ascii?Q?tTcfWyu5qwTPpcHO6taff4G6iXV5CQDgf+RKb6AQaYLilhJxjpMt+FAxKlsF?=
 =?us-ascii?Q?WLuhK9XHt/clbnb8Whjo/8p5/G02H9Q8juGLaq3SG1vXLwpFb9Zqtmbzr2np?=
 =?us-ascii?Q?n/n7llQskd+utKNg/8TgiEsRhPvLHXfmZxogjPC1cG26+xp5+vDYQFOkU7dy?=
 =?us-ascii?Q?3kRx/oCa02xuMJLcZM7LclNREVVe2ocPJQ8pG7hWvkxdE5Wb0mu+N/OtHDMB?=
 =?us-ascii?Q?5nsHGinpmlaBUVnvQrhNEa773QJLBx1e/xzXxJwhwmW6aJAtbE3c4kUaG++y?=
 =?us-ascii?Q?HdbJQJCv20AStmRKrhOUTnlV3/9OnT9d2Cr/T0Vd0LlZN7bLJSfmPxCbhavH?=
 =?us-ascii?Q?WcTyvjXLvgJNkRVMlwn1JS3qa5nnptXnva/3g4DVNxA5KqLHqcN0qBc6mnB/?=
 =?us-ascii?Q?Gg6I6+uO3XkXHGMa1GoAd1kcnMp4HYLf4QEXX0oPhzDaR9eOByBNrm1wgszE?=
 =?us-ascii?Q?jJIsvdXzikR+vfb9KP8fPqp7IRM+3HQe00Xk6LVhZ2FEJgEts8Aizh/WwxbW?=
 =?us-ascii?Q?w2jizEjTSXKOuEiYBGCMEGivulAOebewtNFVUAuzxo4yWRfj/4SawdLgx34C?=
 =?us-ascii?Q?u8Xq8RdhN3DWCUztOmxmgrYWm8+UeAF1fHj5KG98goCgb3Az42xd3dwTNQBe?=
 =?us-ascii?Q?U4D+x0eKLFrmO3DCMlhJj+2pt/iLHWJ1YrqLtSgQoelFC4vEst9tQOw+RJjR?=
 =?us-ascii?Q?0nR7O3XDxgdulaTn/qdhrpV9EBMLvYznU9uPTxMBKdERK9evE196UeHvMlAH?=
 =?us-ascii?Q?f9x9VwCb8swO6vDc3MFxJe8CHN+zk+a2VgDiHYnYJpEyChdhaKJmImT5LteC?=
 =?us-ascii?Q?D6Kjn39i23Hz8n2lTEDDjxSSohPQxq3hVwWI/V/uB+OljwwTtIqDVwijbV8m?=
 =?us-ascii?Q?iBfzc/ifO8Tzf7WR2CWa0lT+aKTA+oFscLyRon7RvMXDDNAzLaPQCnWIJ5bD?=
 =?us-ascii?Q?J9JxXGCi7WRhrkF7xJJME35pFlbxpKy+bjo2XGf9d5MnNbRv0IOsMc/A7mfE?=
 =?us-ascii?Q?4571fjuVU1x/3EGZYRLVcbuqnfmhIfjCFHWNhirDWU3pGk4giB8V9yMMH1BY?=
 =?us-ascii?Q?MmQroIHH+2twXj1zI5W1OxoNc0LsmW+TSXuUYsLGi5Oz6RlGn4aAJQBEY8qV?=
 =?us-ascii?Q?SdD2PwSYK3SXNgg8nonh9KjWhrJF8DfrwNSF/YGgN+ASqXXAcvUFFf9Itduw?=
 =?us-ascii?Q?/Lxbh61NxEYb8ufE8VCpNEHSaoRqucEBZ1wwzQ5ttBumxCM6H7+qzLo2tn3w?=
 =?us-ascii?Q?kluFPlH0/QLrdPnYJdukIKKAXSyEm1dqcDyc95csORwkmo9BCUS+qLCYRJ9Q?=
 =?us-ascii?Q?QEpL7pmgcipZRRNHErZIJ6d+X2R85p1ggTJ24H8WJGxGKzIf8HZg/HhL8lFF?=
 =?us-ascii?Q?f9RiMamyL9ypIahVpCXf7VpQFQmRjnSrL0/92iGjfmJvv4WJnKhLsBdYMch1?=
 =?us-ascii?Q?pOwx/TJjoVGHGkGBYfAv6LgNWMxxDusLzcd80CBVJ0HOHHs+yTwnyUnzYbOl?=
 =?us-ascii?Q?WOVVsReaaYYrxFB5szg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7004.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05136cdd-a35c-4a74-9b12-08dc85074b3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2024 02:29:15.3120 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J0C8dOi3wLgEl4/tpv0NYXdkFjRsxVOrwrtS1kWbGHGO8DErYQ8dOHutuEmIO5NXTByO//lkSkWqPXq375j6tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8275
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



> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Wednesday, April 10, 2024 5:57 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> <krishnaiah.bommu@intel.com>; Thomas.Hellstrom@linux.intel.com; Welty,
> Brian <brian.welty@intel.com>
> Subject: Re: [v2 19/31] drm/xe/svm: Determine a vma is backed by device
> memory
>=20
> On Tue, Apr 09, 2024 at 04:17:30PM -0400, Oak Zeng wrote:
> > With system allocator, a userptr can now be back by device
> > memory also. Introduce a helper function xe_vma_is_devmem
> > to determine whether a vma is backed by device memory.
> >
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pt.c | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 846e896edcb5..525092111be9 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -577,6 +577,17 @@ static const struct xe_pt_walk_ops
> xe_pt_stage_bind_ops =3D {
> >  	.pt_entry =3D xe_pt_stage_bind_entry,
> >  };
> >
> > +static bool xe_vma_is_devmem(struct xe_vma *vma)
>=20
> At some point we probably want to scrub the driver as we intermix
> devmem, vram, and lmem nomenclature. I think in case we mean the same
> thing too. Anwyays that is a little out of scope here.

Agree we are mix using those terms.

Devmem is still good to me in this case. I will keep it for now.

>=20
> > +{
> > +	if (xe_vma_is_userptr(vma)) {
> > +		struct xe_userptr_vma *uvma =3D to_userptr_vma(vma);
> > +		return uvma->userptr.is_device_pages;
>=20
> Helper itself LGTM. Maybe promote to xe_vm.c/xe_vm.h?
>=20
> Also consider other options rather than userptr.is_device_pages flag
> here (e.g. look for buddy blocks, check a gpuvm flags, etc...). Can live
> with a flag but we can do without it, great.

For now this helper is only used in this file. I will keep it local static =
in xe_pt.c for now. We can consider a move if it is used in other file in t=
he future.

In v3, I introduced range based page table update. Instead of update page t=
able for the whole vma, we can now update only a sub-range of a vma.=20

For system allocator, the backing store of a vma can now be a mixture place=
ment of system memory and device memory. I will update this helper to refle=
ct such change.

Oak

>=20
> Matt
>=20
> > +	} else {
> > +		struct xe_bo *bo =3D xe_vma_bo(vma);
> > +		return bo && (xe_bo_is_vram(bo) ||
> xe_bo_is_stolen_devmem(bo));
> > +	}
> > +}
> > +
> >  /**
> >   * xe_pt_stage_bind() - Build a disconnected page-table tree for a giv=
en
> address
> >   * range.
> > @@ -601,8 +612,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
> xe_vma *vma,
> >  {
> >  	struct xe_device *xe =3D tile_to_xe(tile);
> >  	struct xe_bo *bo =3D xe_vma_bo(vma);
> > -	bool is_devmem =3D !xe_vma_is_userptr(vma) && bo &&
> > -		(xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
> > +	bool is_devmem =3D xe_vma_is_devmem(vma);
> >  	struct xe_res_cursor curs;
> >  	struct xe_pt_stage_bind_walk xe_walk =3D {
> >  		.base =3D {
> > --
> > 2.26.3
> >

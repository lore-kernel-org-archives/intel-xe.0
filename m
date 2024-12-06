Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A77E77173
	for <intel-xe@archiver.kernel.org>; Fri,  6 Dec 2024 14:45:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8269910E1BB;
	Fri,  6 Dec 2024 14:45:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iHezz+7q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E15D810E1BB
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Dec 2024 14:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733496331; x=1765032331;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Txy9Yir6KZh6Wy5NmGLqBvAPH+YKfwFvhmQ9Vme1eMA=;
 b=iHezz+7qqwCEr+7jEvaB3n97nH5KG+kBhKMbDdBAjEvFF/R1SGiFToDC
 BaxDk9gyun0RQ1+LOc1MEwtMwik9OLlXoFSdvfB1Yh432oIA7NOForUVL
 LjVYeKXlblPfXQf4MYg+Mw44lIVSfEZHk6TM0nPoU6kQgxezRzxsU1AIp
 InTLu8uwjAA+34DxL0FJh+vYAJlFwphfr5S3SgpwCW/t5PRwYSxkeB0jj
 u4ybu1qa+ciY6duupEqng+IYeHvMqw1No3eterPihO7NEENLfnRb9KNvl
 gT+973FF/lAlMaaJdbI8TlJvPE2W+hRF7CDo2AGWrVbqjqdky3lYbKcu6 w==;
X-CSE-ConnectionGUID: EGM5Q+zdSQ6ySWfPSRjgHg==
X-CSE-MsgGUID: 8WEIzbrATAKyb9f2lliStQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="59248643"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; d="scan'208";a="59248643"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 06:40:53 -0800
X-CSE-ConnectionGUID: SAcePtL1Rnm4HubJ80xq8A==
X-CSE-MsgGUID: UlPGvUK+SOWh2lw/VOohvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; d="scan'208";a="125261302"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2024 06:40:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Dec 2024 06:40:52 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Dec 2024 06:40:52 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Dec 2024 06:40:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+oz57zD94ZRRqWcKmTnkjsVxD5DoHeYoBSjZBZ7jxT1jNfRfxuV1h+oQhJFy7bU9nMoHCFsNpia1zbpiDRWElJRGhegGKHCtSvWz8LCkCKXLRB6VdX7/11JJYKUrEPTa3AS1X6FACKsmjc3chpAdyt/QgOE3cHlh3LL1rLyMoWEnzdEK20MV5jjsvD6SSUC5kjLpRIq1kU0cynyIBDKkK1rjpgWAGW0BfMStxNUvxndfA0ORCqs6qKkgD0SgNzgZ17X+zRCcl7BexPlW/ktiANzeCyQHu5tOMTawTZLwuJW62w++tKvY3gYZeLmZ6L0zRJJ4PQfsEDgcjN7jPxutw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QhinmYywkQxzlD6+m8YAwludFf3xyv13eLl7vPjlFxM=;
 b=ntPu61lpTftgYsLhEeZoVJO6BSd+j4QMDO498k6d8a9PuQVGiQOMLQhPJxEhziwvsp4ng5Ze3PBGxwCqIicfR15jndEMBxGsIn92S1xaRGZoqFd3A56xEeVfdUVbIB+6Kx9xACoK1yWicsAP9Xt24ugzrJzOeKgGyCcEfbqRjkvlxl5CGSZX5EEKeni/9XH2XoBNJilobrp0RPp4WPoqVda/zToKZRIznVEYneknpVs5wXfCm+sSd+YhRO0SrlovvLY/zoYld0U1gPUQ6xgCVHrMFV+gyjDmSGB7c6Q+Qkxyx5MtQUSThftOqKMNCZcQ3Ouj/KH5woFFHmbuGjL6xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by IA0PR11MB7838.namprd11.prod.outlook.com (2603:10b6:208:402::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.23; Fri, 6 Dec
 2024 14:40:36 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.8207.014; Fri, 6 Dec 2024
 14:40:36 +0000
Date: Fri, 6 Dec 2024 09:40:29 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Oak Zeng <oak.zeng@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Trace xe_bo_validate
Message-ID: <Z1MM3SuauCeF7BlS@intel.com>
References: <20241203022140.1919922-1-oak.zeng@intel.com>
 <c3fe010ee6dc51ea75bad670be5296784beb262d.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c3fe010ee6dc51ea75bad670be5296784beb262d.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:303:8f::15) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|IA0PR11MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: f013c287-1860-4894-7ade-08dd1603f19c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?hazXZuGv+jSz06S2TKF1koRsryZdVmEOX50xKD5eoqk1fzvgnjUBk/lnd3?=
 =?iso-8859-1?Q?Ty4LPsb7BhgFxWQW1mwDLlq3MydAFHp1/7b7nro0HE0O+ChlJS1xKdi5Vv?=
 =?iso-8859-1?Q?WpBCDqOJtI7lnnZF3D9MEjVK4AQG37gB7jaSuUKYIHkUfnJ+T2ltX7j7o7?=
 =?iso-8859-1?Q?UZ7OQ6GaZkQIlF+nn7YgFBFRFj0rQk13hkYrfHkKbBYbGGDVanpcAzQb2L?=
 =?iso-8859-1?Q?GGp/fpy4zkryKubPgWCM70GNNjCaJvuBe4ZBAjd+NBymuLIjeZMfKRhAZs?=
 =?iso-8859-1?Q?y9eUIeF8qsPG0VnHNUPaRXbgZ6p8rBrAf26L4xrZk5zXOCgwG7+TRtPzm9?=
 =?iso-8859-1?Q?KOxiY4Y0/i+sE9OcsqpNLiOdyQZsJ2RI/idTX9E4F/oljmOlNhp9qMYt0p?=
 =?iso-8859-1?Q?hKu1dzbRvpNVUMbb4MHVCv79+OpQsIdENObkZzb5eFQK73RU5xEunLK6A5?=
 =?iso-8859-1?Q?UUBEOS42yyZverolvZKUj8Bve6tZv9gGmlm2Cu3GWeuBTleJ25brtfokvZ?=
 =?iso-8859-1?Q?2OIhtJChS5SxGZ7LMSnbkYY/iz5PUoZtzRmwR46WJhOe0Jr17YZanwUXk3?=
 =?iso-8859-1?Q?VKZhEq3LV/3eoGI080JZLwR99omD0nTGsuZM+wYR5X9LV0HwluY5j3Ug6x?=
 =?iso-8859-1?Q?BnK9jW2GW0558s4Oj0z7VrEBU3VlEeNnja/92vJqEGZb9HRQhBH76RhKhp?=
 =?iso-8859-1?Q?IyC0/Kd7lqx5DVpJU+Tc3A1Mn3xSxRsQCFwrvRVwr/JgmoxmVVuDZNFdOK?=
 =?iso-8859-1?Q?Anq0zIRAk7eabjs2aepf66LgOw9e+YSNn864Ik3X6QvnG6psuu8kvOWhUf?=
 =?iso-8859-1?Q?qi5tXwtI/qzhVka3M5oKvICK6WpKNI2J4mV0/31dqjMI6DKPyJ3Hk8hlP5?=
 =?iso-8859-1?Q?V8dp4LLwmP5pnkLXhXePm9r68sfi6sNfRCJDn5onVv6rp9r+kcd2PyPfNY?=
 =?iso-8859-1?Q?LXOONigPMSm2JfU2d/9ZiJBXl/nP7z+0tOlQ1ThRME9PR0bPCtbRA2bD3m?=
 =?iso-8859-1?Q?vpHrBJxBu96A74Rd9rF39ddE9mqWLUvtmg/Mru97VIVrCoG8ljf3/IH1BH?=
 =?iso-8859-1?Q?pr4RDi6Lht2aM19Qy5V00aUEo/BKbh8pWIQQ6NydLEGEQyi/pAFXozbyLy?=
 =?iso-8859-1?Q?6o6dO12JwiZhKJdX1WuNxQqmRQlw9k9IS6l49Bh4l1lnXg3LYOnif2K1xK?=
 =?iso-8859-1?Q?ijVB1mZwQX8A46f732D5QK8N0EVIjSKyC4p5zXoe/O7BZ+kWiZQ1nd0eY/?=
 =?iso-8859-1?Q?3rVvjUDi/mspo2eleMSZ7tNam0l5WeulDeFxepyFuseDesXLYA6DTn/aJk?=
 =?iso-8859-1?Q?SbA6B11J+aqys7r275x+7sq1bWWiQOTzeuPmXgvReiZ4zsJpkWKPNEUhNL?=
 =?iso-8859-1?Q?NcC8KCSL6HMRWKCfjnf5MkN6Jr550zvw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?lO2f6D+D8/3aqIPZeIWjb9x7PkEekZy3Vzuq8MIsLBdvQLhphulRQWrXDw?=
 =?iso-8859-1?Q?kRIremDiQinBeoQ+QkSR7R55N6X52osvn5QMqc+ydmGSQqGorq9knoTXAx?=
 =?iso-8859-1?Q?/uBpvBFcYqmKfO7MhaCjUST+P6s1ThxxkHpl5TvXDSPMySNeQjQzJzW4Dc?=
 =?iso-8859-1?Q?EFD7rBEi3G5NV54MrDweL1u93jTsBsnLTbTJTBmErTnFx8O2O6j0D0WZqv?=
 =?iso-8859-1?Q?Xa4ki02lnfLWxNQNJHvSHtsz0zY5+dsmBb1DNozIo4hPpjzZCooQgUxQXl?=
 =?iso-8859-1?Q?5pC9LPdmsVUEO+9JJgaG8jK3sgM77/RsB9iRALURInnYtwLHA3zaA4iimE?=
 =?iso-8859-1?Q?NcvhT1qm8jfGzTE9vZIGL0NqGjPqB8p1Sb7YC/6b8E0p4RTrU9g3/TTxM/?=
 =?iso-8859-1?Q?yFPtZ1k2UjmQScsKr5WVDvtIbBHtp8fNCDhd1AGqozsMSBh4SuF3Ndp4UV?=
 =?iso-8859-1?Q?SLga2DyPdYuLU+g94G+tl9jwisA4DnmfEhrOVXH3hGPTiTb4jRELisl48U?=
 =?iso-8859-1?Q?xQ5Ci25XXeMHaWfOeDvHmL8EiPyFjOgV/GivlJyohKi1sttLMi7hZEO3Mb?=
 =?iso-8859-1?Q?Zw3OWkPhahU2Gj2f/FZYtFV4uDdg1dT2HFBmNIDeboNlCwTy5WqAo3yKX3?=
 =?iso-8859-1?Q?SgW76BjCtE6M7L6yF1H4ixnP1RqvmiN5XcClBhWP9neezhjdvw9q3hZ6VL?=
 =?iso-8859-1?Q?ZLbXBXoygFkM0VoHLPDwmS2Ilrsumv7qS2ORNleJK++f/KQqdSgnQ/nUXX?=
 =?iso-8859-1?Q?8apewPvD4EjUd67Dl3OlrTAf5Lv8eePiUYMlSj6qW0O+FY9qt+k+QmMXyJ?=
 =?iso-8859-1?Q?i9A5sPQzQrvLO0wpTVEJ/mfv7FxqiUOVT4w+YmWfUEzjE3e9JJkUFU2gOS?=
 =?iso-8859-1?Q?IT/Oc8hb6S7DcOvq9sz3SgVK+CQhrLIDB8LCePa/tIERZFZMKklWs/Yfzs?=
 =?iso-8859-1?Q?oOqDyRUxrQBF/Ppg/ivumQuBRLmAOR0xXlem7jpEa/GsZWyZ1ZB8qC6hEw?=
 =?iso-8859-1?Q?7DwfRBoTg8u9TZ9e4bNM+dEZB225YbxE8DAwFRThg/ztcInnbWaw9l5Eib?=
 =?iso-8859-1?Q?c2Te4eKtqM/9fqkNpe5wFTQCjqgARHbmE75WUTs2AmUSNcNqEDu8qMdrr3?=
 =?iso-8859-1?Q?Zpsr4TAeKBgeew36ycjkhnUzVpM8DKOxsWiC1Us78jfEIf8qCXIcLbDyI8?=
 =?iso-8859-1?Q?/lUgfyEqb5/QN2EIphyaiJ49LDUoAl2cWjbr9kW8zf3JxpHhUb5tNMBvdf?=
 =?iso-8859-1?Q?ZGxkXB0xMwb4q3svNumtvFKA4RLpWzR2A/aqgY2RA+YsMlgvZg003am6wg?=
 =?iso-8859-1?Q?J+7E4ZUJfZhC1NMGCsST018SJ9ezG3fSMisem/DKeJRNFdfgiv503FHqFn?=
 =?iso-8859-1?Q?64FvgFWf+tf01kLEXgmKk7xiUtcv1k8yfnI9TVVt3eKbGl0KnUlErUgs0+?=
 =?iso-8859-1?Q?zHJJhOpQI5yXzaz0fHFupSlCYFIwn3+Kojh85P+kR+8KtvuOQOwvqII6CT?=
 =?iso-8859-1?Q?PGvwsGxdjs2XUgN0nl0wjlyzB1xt7VppfiTrW1oL1sBykPZuMcZEDWoEC9?=
 =?iso-8859-1?Q?3GjPp14j6vjs/iMXFYpGQbMUZj5MsC7jSBY2SaGbrE3umzEZyfMwvrTWD4?=
 =?iso-8859-1?Q?H1De/AW44NKmVouLH+fvdaQdWnw1aJSF2EAQB7rvwF1W6J3l3YM7RglQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f013c287-1860-4894-7ade-08dd1603f19c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 14:40:35.9291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQwf298rMix7WBG0zKC7nOcdA9DWsxSg/IcEnXAYZ5cQnAWYqmjJmwtztpj3GSyS6Gm6MK123bdUHDL2Mp/0YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7838
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

On Tue, Dec 03, 2024 at 08:09:39AM +0100, Thomas Hellström wrote:
> On Mon, 2024-12-02 at 21:21 -0500, Oak Zeng wrote:
> > Add a tracepoint for xe_bo_validate function. I found this is
> > useful during debug issues.
> > 
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

pushed to drm-xe-next

Thanks,
Rodrigo.

> 
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c       | 1 +
> >  drivers/gpu/drm/xe/xe_trace_bo.h | 5 +++++
> >  2 files changed, 6 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index bdac446bf8c06..3448ede2befa6 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -2004,6 +2004,7 @@ int xe_bo_validate(struct xe_bo *bo, struct
> > xe_vm *vm, bool allow_res_evict)
> >  		ctx.resv = xe_vm_resv(vm);
> >  	}
> >  
> > +	trace_xe_bo_validate(bo);
> >  	return ttm_bo_validate(&bo->ttm, &bo->placement, &ctx);
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h
> > b/drivers/gpu/drm/xe/xe_trace_bo.h
> > index c6d3140542cff..e393a2dd83dbe 100644
> > --- a/drivers/gpu/drm/xe/xe_trace_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_trace_bo.h
> > @@ -53,6 +53,11 @@ DEFINE_EVENT(xe_bo, xe_bo_create,
> >  	     TP_ARGS(bo)
> >  );
> >  
> > +DEFINE_EVENT(xe_bo, xe_bo_validate,
> > +	     TP_PROTO(struct xe_bo *bo),
> > +	     TP_ARGS(bo)
> > +);
> > +
> >  TRACE_EVENT(xe_bo_move,
> >  	    TP_PROTO(struct xe_bo *bo, uint32_t new_placement,
> > uint32_t old_placement,
> >  		     bool move_lacks_source),
> 

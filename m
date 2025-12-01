Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E27D116F1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 18:01:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C17110E449;
	Mon,  1 Dec 2025 18:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JCCBm+21";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C05B10E449
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 18:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764612105; x=1796148105;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7hZbkIOHq23hXjaV+ICtnGtmGINl8dBUdtrMt0sr0Xg=;
 b=JCCBm+214JfuUDTkc51CzED1RBXSTZ473jiXKya8H84bnLSC5f7hviju
 PtM0UOB6FB4ji28+z66sKCswDafjYVvCIGv/n4A6yBTPV3DojHTF/R85q
 fwSCCZ/M/ZBpXpGk40Tn0L2Qp/PR6L0Uu8Fx8eaHipBjtwPFuBK7yNQjp
 lWMEOKOBoo5vNX2XOy8MlSkjYu89a0bbWb8NkovMY/4XsARKOvVZwOd0z
 P92+ZezqfuAavBX7C48IdmTU8zOexuDuLGbpkwpJHnHyRcl2wXJBw6u3d
 TTrHx+MUNKhMYh/BGiGTyxLCy1VlzTZUwABLDYpJk/MZvBoSpQnX7swmL w==;
X-CSE-ConnectionGUID: 4NRcUEtERzyUhi2wWJHhGg==
X-CSE-MsgGUID: pu4GyjzuQJWrkD59Hczdzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66594841"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="66594841"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 10:01:44 -0800
X-CSE-ConnectionGUID: cdmNV4XZRP6DPQAT+kUQ+Q==
X-CSE-MsgGUID: PNPOie/MSfyDJj6ML963Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="193965637"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 10:01:44 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 10:01:43 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 10:01:43 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.68) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 10:01:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pdg1SKYfsvrezu3gT/1sGa6VqRHpx+k32XsRuMkHOwbrCaAeLhfrrys2Uxt/eTZG/oiJIvgggLmlgvj4sRYdg7VnTSpPBlMRuMcYUSZWA0d1wwKypA2pwLOrwkHhOsf4u5qBtrkHSS0jBzJ1xY2MU+d0VUTofNE8vSgx+iALsRUAjTV8m+vcGa8Xn7fRd4suYBnhNbseDNYSf06sH9pzKG3mzqXdmJ78cvYa3PZBwtN8ezzRMy028XAsZyS02bJvBDC8d7ooU3w8TrSjX0BuDCjdwmXsQrj/VMRLo9hzkXHrZCxKAUzuns+m9ypGNAf77jQ1fOvJYzb5o3q4EBhOxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQTul0Bz3GlCyWCD34iUeg9MupZRA8UkGFXmmAXV9FI=;
 b=Jp5/UZrp0M5FtYynL5xyeCgLsGSzCTCA+NdPwzN6vEwR3CEkn9TFeO7caVAj/71hZ/+T46LgW6yFeOmrXr4fzEtdOQ/rwt3PM//fVX2MmrSVuXL4npH+0KgqQ3kWCxbCmi6y0Zm3PEyNVi/Vu91N+V3OgH8Wh7aLaVklFsyIBOK3gDAS1VNafOrKmgGmMNBfWUf+/J6pFU0EuEf8ZOcxbnq+o4sNI1tTz1kOHSV3pOyR72aPbd7elwzpTMRMVtifh9KjOgvAi4Xf6nqOpW51i8rIHOHWaczF9aYWaAsWMOVndO1eJuRYW0dVmVJAn6a9E0Qaane+q3sIvyz01aDbeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY5PR11MB6188.namprd11.prod.outlook.com (2603:10b6:930:24::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 18:01:34 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 18:01:34 +0000
Date: Mon, 1 Dec 2025 13:01:30 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 2/5] drm/xe/oa/uapi: Add gt_id to struct drm_xe_oa_unit
Message-ID: <aS3X-uS8-tfZkN2K@intel.com>
References: <20251126035220.13089-1-ashutosh.dixit@intel.com>
 <20251126035220.13089-3-ashutosh.dixit@intel.com>
 <aSdmTbYbOiJv4i8r@lstrano-desk.jf.intel.com>
 <857bvc5r4e.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <857bvc5r4e.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR05CA0112.namprd05.prod.outlook.com
 (2603:10b6:a03:334::27) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY5PR11MB6188:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e39a90e-398b-46b6-e589-08de3103a9ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C6I1s+lyxZvnMB8TU+CzddHYa1UvrfD0fC0mqTvl50bkfUNlzgUD83hAnOGN?=
 =?us-ascii?Q?x9jgzVVidjhsNYKDmkq8PsLX6X1g6Lozgcqd2y4VYBEYiXMp4ZF+5Ej0He0q?=
 =?us-ascii?Q?8ZKcsTzFtifQOQ/UpMcEZHCHzmd79x54jiArDGvZmr25JAZ2ELlxIzzoUt7I?=
 =?us-ascii?Q?WZRIxfpIgq9ghIpiIZOYCmK1r1+v0DG2ru4VBqIaJVWab2tE4UQvkVMj1ozU?=
 =?us-ascii?Q?Bxt9xKroduTaBdCDR2JRSIcKL8rJO4DXPIfnxZuycI04qcJG5Iak1X0CoPFt?=
 =?us-ascii?Q?dhw1z9i27lg7gisonDIKTdiKShvDMS7xEeTGHPkaT/37//HwYSClTD7GHOWL?=
 =?us-ascii?Q?UakPU/29Wq8x8pVxGis6j9qFaX64OgBe4m9Hu6cRiodnwlF/KSGVGG6fjWjt?=
 =?us-ascii?Q?KTuopitp9oD7/AKZpQiE6cLIuduFArNgatU4b/5D7YAzdQ9eZ1HQfu19qumT?=
 =?us-ascii?Q?PLprr1V8Red+xdwNvY3hkVvaik62VDXI/pfm5zqL83tOL6TaqD60ASOHaXUs?=
 =?us-ascii?Q?fDgaY+p68lP7FLp7X08KMqxIeKg7rrv/AYgFwVxL2L8Dn4HYe6IgL9o/+eSZ?=
 =?us-ascii?Q?ZBVjSzVYKyqy0U+ga4YN6KEMFUHiFxv9pztSUq+ZWzI283l3E1ap+CI5CqDH?=
 =?us-ascii?Q?Bhf0JPpWu6E4p1oJ0tsKpcidb3DhMB+phBfp7Sl7uRxdvGEcGequJQ6yiiLl?=
 =?us-ascii?Q?ONv8Tgwwf3Ow6KDhJCVWv38564zv4Kkfw7m/BRyQ5gmMrwlE5sbWI2NLa9QF?=
 =?us-ascii?Q?xy6gWXfQNmZmbU/pYXwyKjzi7hQBOkk2Ln51+Z7FZKT8xZFIcyjP3lPnSsjD?=
 =?us-ascii?Q?HnWIA/J+OwwwTRj56/j1X3UQK3WrT+ZMoAYZ0L7sQzkaW7RfYC83exS+CS4M?=
 =?us-ascii?Q?NukR+gpujQFLZREnGMHMhjuNN3YpjwZrHZ5KM7WjyzNmlXqOKfJSWzalAEH1?=
 =?us-ascii?Q?ND1Sh1HVHmMqpB9qKYZYfXGz/H7GYEiv80KJVrf6NvvTUYSSS0Qug2nTvQUP?=
 =?us-ascii?Q?DPoUDZlUywvO0c2LsH5nikhPP1GpzXhk27Bp79a3MXWJuhqg2C0WyBNok55e?=
 =?us-ascii?Q?e7Dtjr4N/WFbG5leR95mObDmYoMdRSF8gpSfBo/zzgljlVXHmoTRf31CT/E8?=
 =?us-ascii?Q?yROgrZAdaQg+FrBb01ryXMYOy9uAHUXgw5LVAI+nSETFlcqp4S9BjZOZJX5h?=
 =?us-ascii?Q?GshYZdPH8UieZWNWN9XLOPuMiOWUw2ix4VWPQ688vXWfJo2JzLrNU0m+5o9k?=
 =?us-ascii?Q?fJJDbJkYNMeWZcJuQKlsflzGUq5DHkI+BlOlpzaCYTTXSjql6xoIjTmHiMP5?=
 =?us-ascii?Q?ctLCrlwojWz6FchmEoQ92BCElQ6+C+bvrJev3wVN6ZSZkG8M+wosgAK7S5Ct?=
 =?us-ascii?Q?/dkCiIOKBltuGGTvIw4eEqUjuTndkohNXq4Qsr+biAokE0gmctqe0s3CkApM?=
 =?us-ascii?Q?D1/qXt3Mguxp9cv/s/mZlt7w6R/jbnAO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VAY/fmMQh36TMD0d8Gx90X1jkDTZy/AZoRhX7Eu5J3RkXaJzA93y/ev7et7J?=
 =?us-ascii?Q?O4KKmDixSzfq+GfxFPetBp5tgb1CYo5nxBK52sr0NmjPm0yiwT7WHVmyxmcA?=
 =?us-ascii?Q?nyGHFyXHhWU6TRbXI3q7WfJrZZXSO4MV2C/k+AxC+yLeRFuCSHBnIsLlJKw5?=
 =?us-ascii?Q?LSPNkn8SgcdULd/L/tuY/DysRGJ15Fq0aOElzUU4rNu5SnqCZvs+37nLzFLa?=
 =?us-ascii?Q?vO0WJX8r08Ls3xNVBns/AgZ83JOROckNNuePeciJQIhp6HGL2RjE3TuEhkRo?=
 =?us-ascii?Q?2iWNygNR1a8onYIVyoJF5XMo9lTGM45GOtRUrmjrPTUkG8KXb3KZpaDDTuLC?=
 =?us-ascii?Q?Y8JmW7J9Mf1zBmdpKeGzGMwka88E7Rgdjf0BpLvRO5A/IA22RvRnTFkGi6bV?=
 =?us-ascii?Q?BG7C6n7hsIarVDywkhdZh84jvWipeI8a90M3tt9SGJCcg+XVAoEgFX2lX79d?=
 =?us-ascii?Q?deLWhzU4DaXTyLH7QUR/EjK38je5DjCtBsP03TtxweeB+ZmJwk+uhJlfdAUt?=
 =?us-ascii?Q?RyqNBDTnWBhkQRjibueibQLZYIaQMXCbv4qF7GA4BikA/wy4bxVkHGOHXkCd?=
 =?us-ascii?Q?ilvkMtuMji3u85IHBEjzzaq5BZyTgjCdl8NsOiFHyS6E7g5nwXCyS7kV+3nn?=
 =?us-ascii?Q?6V2SFchTYFPN2y4fOCyuJ/knri5AYVru/R6EhWZTNw8+gYDu+TVyIbP6izMz?=
 =?us-ascii?Q?Am4AsOVFLiU9wcXyP8hJAjFLtCkRydFiG1nGYSPpPYRGVWUvX39YoLDO2xDp?=
 =?us-ascii?Q?fefSfDHjTRIl43Ify0N/H3NZ1k/3jF3sud1GPpN5OaUuJmjQxcKlaLwojLr7?=
 =?us-ascii?Q?lOGvRsAPJsnZYHfvns3KPtCojvPEGJ0tvWtIqrtBgWqWHlI7zgl0EZ7PtmkX?=
 =?us-ascii?Q?MtyghRpz7CwjG37UGGNAC/2S+KWrXxcVpRVFpaWQk9gHv1th+7aaEvxfbtJB?=
 =?us-ascii?Q?havunxyjcIQk+QbzSpo4sbbMXWkjvu+9vwk6e55qoBWD3kUfpbrZTf5tN4vO?=
 =?us-ascii?Q?gZHt83TNTu/gSTvMimy/eRgKExL25OF7vTp29lcaJbRn6hAgWrd5fb3+p6AO?=
 =?us-ascii?Q?UgJYCpKlzrKjOzt58Sl3iAnVb9VyyHwI2BbMN+FMHX68slHvyM+oDVfW7ffQ?=
 =?us-ascii?Q?3cK00xgjXCNI7We5J8u6N+xlRFIJVlAPiuFIJ4pSjKVB3yNfkeCqdQWj5r+o?=
 =?us-ascii?Q?SnQS7eqlQlcLQXz/AwcZ5gj5Lq+YUByyTMVpxvg5BV213bIYlKVSKLdfYPQv?=
 =?us-ascii?Q?juzb78Uodr1hjexYl1tNvC6xLo0JD6cF1sZD7+Nc3h6YKRL36YXYEZ++BBUc?=
 =?us-ascii?Q?YUf1RcpjlMml7UZxD1JtQtkqm5yX1rEor1L2pLLh1lJigf4dvYKmEXtHomwL?=
 =?us-ascii?Q?P7ZGkBEPxc8dNmFP6UWew6Xz3OdAvdcOD6aQdMPHnlBPK69KmZkJ9tfW+TV2?=
 =?us-ascii?Q?HEnNfTjUy+rD5zHORzYxImgB4STS1tpGzGIXw1LrpnqL3VQtQr0pXp/YCpko?=
 =?us-ascii?Q?Phut4vSVQtmlrJuie35mAO0RBxfIURnTyXJYmoC7OFZyvPODDPg/nITEejEn?=
 =?us-ascii?Q?xLrjr/Cz/N1/BMm7D5jQRB4tklsjCwNT3Sog735a?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e39a90e-398b-46b6-e589-08de3103a9ef
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 18:01:34.1485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4WsVOHaprx3+SEtUCUT6I717H0hmPxn+A8eQ7hb4fgTP997xsuE79SZHmS5I+RrfSIiixV9pqUdqV7japbbeJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6188
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

On Wed, Nov 26, 2025 at 03:08:33PM -0800, Dixit, Ashutosh wrote:
> On Wed, 26 Nov 2025 12:42:53 -0800, Matthew Brost wrote:
> >
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index 47853659a705e..ec09b281eafe7 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -1676,12 +1676,16 @@ struct drm_xe_oa_unit {
> > >  #define DRM_XE_OA_CAPS_OA_BUFFER_SIZE	(1 << 2)
> > >  #define DRM_XE_OA_CAPS_WAIT_NUM_REPORTS	(1 << 3)
> > >  #define DRM_XE_OA_CAPS_OAM		(1 << 4)
> > > +#define DRM_XE_OA_CAPS_OA_UNIT_GT_ID	(1 << 5)
> > >
> > >	/** @oa_timestamp_freq: OA timestamp freq */
> > >	__u64 oa_timestamp_freq;
> > >
> > > +	/** @gt_id: gt id for this OA unit */
> > > +	__u64 gt_id;
> >
> > u64 seems like overkill. Maybe a u32 or u16 to save some bits for the future?
> 
> Sure, will change to u16 before merging.

Please re-send for CI. Never change code right before pushing.

> 
> >
> > > +
> > >	/** @reserved: MBZ */
> > > -	__u64 reserved[4];
> > > +	__u64 reserved[3];
> > >
> > >	/** @num_engines: number of engines in @eci array */
> > >	__u64 num_engines;
> > > --
> > > 2.48.1
> > >

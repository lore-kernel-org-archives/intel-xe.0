Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F18C77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 09:37:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF4D10E997;
	Fri, 27 Jun 2025 09:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZX1y30X7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338DB10E997
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 09:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751017059; x=1782553059;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FzlB0xK9vkmM7Ded0Bvnujz+eV5rM0BqkcNPlWc+BCU=;
 b=ZX1y30X7KmfnZcE8R23SL50EsJ39lcNLyDJ8aI+kXyK7fAWHXLveFmnY
 7G55YR6nOLPFOVwrCtKmMG612uaivoi3l5aJFTfr1VD7IFD4/lTrnm5+i
 JGKUuCl/zdTDxpS1jDrPJ2D9Wg6mUi2wWuih2bf86Tej5j5Qitsa8Kk1o
 IYVHtldMBEUn1maGAbfEZMJS9FVw0eN7HK5ypDQ0qle9Hi5FZyP70qx1F
 LRq/yMEL/eDRwhBLGpwbUgG+iq2GMBgguilcjJAOMeahxq6hHyaWPHEND
 y2VA+b7iwWMeOmIbQ/Wqi+ol/jyEW1ZdDd2AnSyCHIPcuNcYAX7sAJdis Q==;
X-CSE-ConnectionGUID: EPZ7fBGXRFuN1DA3pgUP5w==
X-CSE-MsgGUID: 2gz7nVBaSgi2Vp/UpyRVrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53474719"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="53474719"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 02:37:38 -0700
X-CSE-ConnectionGUID: 0h9gSSWSSw2K8PwAhIpdAA==
X-CSE-MsgGUID: hd+YI2EsQYCVxISQ1qg98w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="156802926"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 02:37:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 02:37:37 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 02:37:37 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.41) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 02:37:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dCqwCxlhwd9chpIOalGzJITH8BSlTsvqzovzYsY08cbRyM3NyVyeXjoUMLLnEpoIoMEfqmX0ttADBvP7EXpQh/lGX+CSEEbfRSry8Mm0numu5DwinA8T9Gjdliiif5X/oFD3GxCrEkw77dtmQRjk0LTIqclwrk0/CEnTCPbU/wxAn0ELK+bmRJN/6lSeUg1EAK5XerHdM+dMd8kLfg8OEIwRnLXkdNj9eZxQe88UDBCoKH/UqxhSj3OX/jomyHOb2lxmJlvJo+PzNV98ukCXNjsXQ4idJjivyL9v+6NI9RFByHKSfE2m3LrWRNLb862D6RqNWZjsJvpDHiWKtrM1dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3tAXz/mct6Px6qrkxYbR1RRqLAW5/aUJ22yV3tY7YG8=;
 b=sk+h0fOGpA52+XAzUQsf5Eb8hssPMnyYsTOll2t7rau7cwICu9ITzDiDrKSBFq3jrOCb5O77bqiJM4Y7fGCt67B1BzkqT2fCbQ4ZYQlc3TiR63IwNZaD5DbT8053Ng8xxxfYmXFe8fzP3Qp3sYtynuh83fqZujQCD1Q/1Evo3x/U5OUkNzcUsWgy3ZixVEIKcFe1PWbnS6HnlbJzmIijbbV9vLFCYLa29dhWjlDPy9nIHjsU+se2Dtko6zSsPzFmqcMbY9IraBl0UEHkgNi2YW+4HvcGeceNPryMCkw0d/90GiRQqts1WBHyghREu8Q6lsV2iPPnm8hNExnKU+urHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SA1PR11MB8576.namprd11.prod.outlook.com (2603:10b6:806:3b5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Fri, 27 Jun
 2025 09:37:35 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%5]) with mapi id 15.20.8880.021; Fri, 27 Jun 2025
 09:37:35 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH] drm/xe/uapi: Add
 DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY
Thread-Topic: [PATCH] drm/xe/uapi: Add
 DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY
Thread-Index: AQHb5bRIFEDyzA/Iakm2EzGh9y/6PrQT7XeAgAFoQACAAVXCAIAAFNJw
Date: Fri, 27 Jun 2025 09:37:34 +0000
Message-ID: <SJ1PR11MB6204C011AD05706EF7CCFEDF8145A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250625095805.1390907-1-nitin.r.gote@intel.com>
 <aFwF53I_d8OkwI3_@intel.com>
 <IA3PR11MB89873DE9E3CF21838937618AD07AA@IA3PR11MB8987.namprd11.prod.outlook.com>
 <IA3PR11MB898706D0EC2F50C11BCE2F64D045A@IA3PR11MB8987.namprd11.prod.outlook.com>
In-Reply-To: <IA3PR11MB898706D0EC2F50C11BCE2F64D045A@IA3PR11MB8987.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SA1PR11MB8576:EE_
x-ms-office365-filtering-correlation-id: 74732e18-7e22-42d3-67ad-08ddb55e3f3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?LyQ09ULrCV+dehdrdxP0WH0gJUy1LYQdDvfqPxERWjP91F7mtLrCz/5RaN?=
 =?iso-8859-1?Q?9I0sVH60ZvRfTPNdZkpSNUy0huHM4oRRXANxuU60hFyBvc2mjPdyZ7DAbh?=
 =?iso-8859-1?Q?SSYshvsphrl7wQebDSqwBEgY0AN+17XnBMDoW1UfAzqjAI5Ra8XptBEzpp?=
 =?iso-8859-1?Q?566SemCnIzP0ZdQzfsw/rsoxLQcmoKgFPblTBgyrntyeVtAC3nVssapMnL?=
 =?iso-8859-1?Q?MAGsWMqh1+CCa9JQgP7k3grGoKhB9iBTyRcKdtIz4lNPodGJOuJ7vAOcYi?=
 =?iso-8859-1?Q?P9uGKbQezsyCoUJrFIO655u1jZfuyNs8fCHEUyuZpEplCHzi1rE9r6DVFB?=
 =?iso-8859-1?Q?8UrOoWyMK428XbjGYf73oNZDI4zuIilyodYMX9ckzxzPxl/A4z3uZ6OLri?=
 =?iso-8859-1?Q?qk4ZPWZZce4azSuzeF7lgOFYcdiC0XGITUszyjhddvee9JXRegUiO105U7?=
 =?iso-8859-1?Q?gwxnpR1f5EcVnIcmk2AHohhrW940RU74etgNeStn96S0P3PHBNUDktGtZa?=
 =?iso-8859-1?Q?8atwmYZOB7hPCBsJvZ8NrzX/lEsEsjCOyEDxIhepttnYkDdAKeoJldSpnF?=
 =?iso-8859-1?Q?M2LzYHSFQhf38BDhhoqvb+gRFnLdfMzfa98fBX27c79ycXjngCa6j2bPXA?=
 =?iso-8859-1?Q?ZVTHQjugpV1YC7lVXy1GI0u97FGjiTAJIDKTlBoBH9cCK0DQjCkrFRrjq5?=
 =?iso-8859-1?Q?sAtBiOo9VD5YnO8ckG1st89AD/UdJ0NosIK5U+WTBx0lAgjNC6gO6XStfE?=
 =?iso-8859-1?Q?YgVoxR3opxOWk/9JSlVhrN/7nYEIKKnF+UE3WEYTaPgkxVqKU7oKrDX7Ih?=
 =?iso-8859-1?Q?ihgSv1EfCY09S3+YgYMiNSsQUVBBrtmpVW/JFdG+dkldy6+g863lb4dJhG?=
 =?iso-8859-1?Q?kk2paNMcbSQTpeGDcDK8e508WR8jALJyfMMoc/qnewqCl/MVozD20AOeSP?=
 =?iso-8859-1?Q?QxYcYmYnA6Ql60DV157AP8rPMrNxfL35ID7qbgxMGVPurVprW9gbOqg6RT?=
 =?iso-8859-1?Q?rXTAVB4kxTGg/mIvXRh4RSrj5JEFdd3/wcz8G50zM7ZjZdFJaxHA56jwCM?=
 =?iso-8859-1?Q?wt1KcsoYlXTJYtel438dRK5anDkkSk+6RC+VAYq7FFxnDLrUWf/boj5DCs?=
 =?iso-8859-1?Q?Wwc22Q1EiLrLV/aT+lx5afOcdyY6z3o0gJzzz0ueqobR3UW4VvBB+TUjaL?=
 =?iso-8859-1?Q?tMBYz7PUY8HgDzHVRlVwk9uPtVwWnIj6Rr6wqBhM74UMOXlecd5HtcntK6?=
 =?iso-8859-1?Q?KfcMsbquywpGDVMQeiDSeEBqET74X2jTh9mXNJRGUVKCx+gqkqJvCe4aaP?=
 =?iso-8859-1?Q?2kpM1SDbtrXIJj3W8nYHI8HHde+qNBMYYEd8bRJsqtnS+GDdObRuxNhVm7?=
 =?iso-8859-1?Q?0PqLkxRCcws4m0J3TCrQiJ/EkWMUhbJ57mXs9Ovbn5dDThOtBJ/o6PO200?=
 =?iso-8859-1?Q?NZlScPOy2/9sm0IZT4RVCTG7cRVTv3whdtytTcpmDDruMXqE1Yk94hz0pC?=
 =?iso-8859-1?Q?ChcWkgBkohye4LCkHW57atFYrRelBlMQdYOD3UUi5RpIqsK1yQeJf5rMQL?=
 =?iso-8859-1?Q?ebaXj3g=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?+b63qw59NElfGoKeXt2NZvf/c4F0b+sQwed2DOkOUxCkJzLO3MVXo6fCdr?=
 =?iso-8859-1?Q?gDL8UVIoQdvzQuNQFcdtoJHgZ7/pXgz9A8xlvI1d+Yp1YqdYiJFsuKRt/G?=
 =?iso-8859-1?Q?AGg5p3+jjThEIP3mFfSp8T/Twvsiz+ropxmbUvsKgFjo9K+PrPtDpzn9uI?=
 =?iso-8859-1?Q?9HLK+rOkOYFmXzxJKjACkSxkXIFegocMhzQDIm325xODV+y1K/Ke4oY4hD?=
 =?iso-8859-1?Q?ZK5TBpZSPA0XXJKi/P/Ezs5IHCJqGgdXrb1W6iAA/D/EFmbjQ6Cxz7SvJF?=
 =?iso-8859-1?Q?CYhRrOFqlCBmFvS1MXtM/hNwdqtTFBPvjhGjS5BMELCOGUnVNto/x8sk0W?=
 =?iso-8859-1?Q?WB+Y7gAZa8gzAEeFgtcQDSVowUSnQmU5v6v6M0T2anX2psEVtGT3zZyXUH?=
 =?iso-8859-1?Q?rg1rBK/d61BODQcQ6ma8xKFONncwaMX3549juWbje5pbeKpGS41JliQZ8N?=
 =?iso-8859-1?Q?QQpdQ2DIPAtkUkcAN0rqmGyOPSWhTENyhA2Eb5Cb4OiJFKRMH/Hi/U4MUZ?=
 =?iso-8859-1?Q?2BrtYK7BROUnewkisN6i0EkgD50VGOBg3ZZ39MRmebr77jO6o+ZBxE6W81?=
 =?iso-8859-1?Q?Q6exneTR6FvlKNEGCzLZ2F9332B/o5oRNBV/5E9OEcyzaasIiU0B3iAox+?=
 =?iso-8859-1?Q?XC9a/g8k0ilkjoZb0W4qlrxmGKZIBSIja/BIw2scHSJN7mSPqC0yi+yO2A?=
 =?iso-8859-1?Q?eHw/Z9fHzXqs2KFPozfJMjulqf80irUHipOM28Ttrxyr91dXDsS1HoJKl1?=
 =?iso-8859-1?Q?0opM7L2rJJ/8UCB5uwFtnKQ3vuvAsi3SW51blmnBuoH/oLyasWCmGOvS1t?=
 =?iso-8859-1?Q?W1Id/ktQV+LSf1p1+avjnfxcSpuD/ZgjJFtYBLjAdav80qbp9KtJZpLile?=
 =?iso-8859-1?Q?2KxhW5gNVxG0d9aggqTqnHlqW2ME0Hi2L5kmrnXmY5Gul4mqk3CZUsSttC?=
 =?iso-8859-1?Q?8NR6SkKQFz//Z6+gD6gwSr/ZXP8SGCqA7I8kooJyAj3Qq5tABqkRhyTAV7?=
 =?iso-8859-1?Q?pNGEPrxx4rGf1qlnkdVS0UEpfCFvpPEVxceteiZFvNZ8Btr+ICoVLl6SZN?=
 =?iso-8859-1?Q?dhojTLzzx99mSJLEsU6lSAiAxPCKGS0/ig1CUGJd/vsEUrxmaOptgWz5GO?=
 =?iso-8859-1?Q?T8jVyE0jIfQ3RXc6QMe7CRQfgtoVipWJT6O62j2HK+v2Yq8gf/1lLv90C8?=
 =?iso-8859-1?Q?7sNe76jkDQpnjgZ02ycek6aSMr+KwWLRv/UwdTsOGv/FhgKMi1DXSdQhGh?=
 =?iso-8859-1?Q?zq7RMNozSaEr8b0yWaepKiWmuUzYHX1J4o/+m9652X0u07eSiEYoEBlIdA?=
 =?iso-8859-1?Q?BIBmW07I79X9yOAAqOvT/5HXX5BOAh9I1XF9abChbhBqbxQhBKJhEzPlJO?=
 =?iso-8859-1?Q?Q67G2BgjFH0GWZ+uJh4arEayJWgIhRjv/EcoOcoe8j2zwUIGWas1+v5XfD?=
 =?iso-8859-1?Q?SFq8/uCAfMoNGJPvs4OSzchbE8ia8kyBXbiFAQOVQhRVbzYId+tCwGCW7a?=
 =?iso-8859-1?Q?kYotOi7SggjnxFVWOanpizQqc1EGpHdrpbRzP2nimI/oYInCDKMBNKQnjD?=
 =?iso-8859-1?Q?VGogdWZ2F8hdpyufbYe4xkv8LajyB9rqJ2L1hceux0ZltZEfUfKpaMISAy?=
 =?iso-8859-1?Q?ndkRYELLLZ5lKuLpmyVwyMKHBFO276GG2c?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74732e18-7e22-42d3-67ad-08ddb55e3f3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 09:37:34.8955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZJBqUOGbFhU2c2yl3l2l5n//gvKiKzz7lC2hEfUaLxJ0G4Phc7lF6m9ZyYdWR+gHQHeijtxLBhQUY8q12hDl3tU5iyYWiGa3TYRJXUmcX9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8576
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
> From: Gote, Nitin R <nitin.r.gote@intel.com>
> Sent: 27 June 2025 13:44
> To: Brost, Matthew <matthew.brost@intel.com>
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; intel-xe@lists.freedesktop.org;
> joonas.lahtinen@linux.intel.com; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: RE: [PATCH] drm/xe/uapi: Add
> DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY
>=20
> Hi Matt,
> >
> > Hi Matt and Rodrigo,
> >
> > > On Wed, Jun 25, 2025 at 03:28:05PM +0530, Nitin Gote wrote:
> > > > Add the DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY device
> > query
> > > flag
> > > > which indicates whether a device supports DIS_NULL_QUERY (Disable
> > > > null anyhit shader query mechanism). The intent is for UMDs to use
> > > > this query and opt-in DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY flag to
> > > > disable null query mechanism for anyhit shader by setting
> > > > DIS_NULL_QUERY bit of RT_CTRL register for Xe2.
> > > >
> > > > v2:
> > > >    - Use xe_rtp_match_first_render_or_compute() api to check
> > > >      render_or_compute. (Tejas)
> > > >    - Validate args->flags (Tejas/Matthew)
> > > >    - Add proper kernel-doc for both
> > DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY
> > > >      and DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT. (Matthew)
> > >
> > > Matt asked for full spelling of DISABLE, no?!
> >
> > Thank you for clarifying the uAPI naming convention.
> > I will update it.
> >
> > >
> > > Also, where are the UMD patches/merge-requests for this? And their ac=
k?
> > >
> > From the Mesa team (Palli, Tapani) is going to send the corresponding
> > Mesa patch.
> > Meanwhile, I floated this patch.
> >
> > > Thanks,
> > > Rodrigo.
> > >
> > > >
> > > > Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_exec_queue.c | 11 ++++++++++-
> > > >  drivers/gpu/drm/xe/xe_query.c      |  3 ++-
> > > >  include/uapi/drm/xe_drm.h          | 12 ++++++++++++
> > > >  3 files changed, 24 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > index fee22358cc09..ef8b49d2242a 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > @@ -26,6 +26,9 @@
> > > >  #include "xe_trace.h"
> > > >  #include "xe_vm.h"
> > > >  #include "xe_pxp.h"
> > > > +#include "xe_gt_mcr.h"
> > > > +#include "regs/xe_gt_regs.h"
> > > > +#include "xe_rtp.h"
> > > >
> > > >  enum xe_exec_queue_sched_prop {
> > > >  	XE_EXEC_QUEUE_JOB_TIMEOUT =3D 0,
> > > > @@ -597,7 +600,8 @@ int xe_exec_queue_create_ioctl(struct
> > > > drm_device
> > > *dev, void *data,
> > > >  	u32 len;
> > > >  	int err;
> > > >
> > > > -	if (XE_IOCTL_DBG(xe, args->flags &
> > > ~DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT) ||
> > > > +	if (XE_IOCTL_DBG(xe, args->flags &
> > > > +	    ~(DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT |
> > > > +DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY)) ||
> > > >  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> > > >  		return -EINVAL;
> > > >
> > > > @@ -693,6 +697,11 @@ int xe_exec_queue_create_ioctl(struct
> > > > drm_device
> > > *dev, void *data,
> > > >  		}
> > > >  	}
> > > >
> > > > +	if (((GRAPHICS_VER(xe) >=3D 20) && (GRAPHICS_VER(xe) < 30)) &&
> > > > +	    (args->flags & DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY) &&
> > > > +	    xe_rtp_match_first_render_or_compute(q->gt, q->hwe))
> > > > +		xe_gt_mcr_multicast_write(q->gt, RT_CTRL,
> DIS_NULL_QUERY);
> > > > +
> >
> > Also, as per Matt's suggestion in rev1, I'm exploring the WA BB
> > program to set this.
> >
>=20
> If we move this implementation from the=A0exec queue creation time to
> the=A0submission time and write a WW BB program, then this register will =
be set
> for every exec queue submission.
> Let's say if submission happens 3 times, then register gets written 3 tim=
es,
> which seems unnecessary.
>=20
> So, having implementation in the=A0exec queue create time, the=A0register=
 will be
> updated only once, and we can disable it in the=A0exec queue destroy.
>=20
> What do=A0you think? Could you please suggest?

Hi Nitin/Matt,

Are we talking below cases,

(if kept in WA_BB) :
User1 --> submits on rcs0 -> register will be updated for rcs0 (User2 will =
not be affected)
User2--> submits at the same time on rcs1 -> register will be updated for o=
nly rcs1 (User1 will not be affected)

(if kept in exec_queue_create/destroy) :
User1 --> creates exec_queue (register is written(not sure on which instanc=
e of rcs?) --> submits on rcs0 (User2 will be impacted if used same instanc=
e as User1, which isn't possible)
User2--> creates exec_queue (register is written(not sure on which instance=
 of rcs, but for sure not the instance User1 is using?) -> submits at the s=
ame time on rcs1  (User1 will be impacted if used same instance as User2, w=
hich isn't possible)

If above cases are true then both look same, isn't it? Unless I am missing =
something.

Tejas
>=20
> Thanks,
> Nitin
>=20
> > > >  	q->xef =3D xe_file_get(xef);
> > > >
> > > >  	/* user id alloc must always be last in ioctl to prevent UAF */
> > > > diff --git a/drivers/gpu/drm/xe/xe_query.c
> > > > b/drivers/gpu/drm/xe/xe_query.c index e8e1743dcb1e..c5002b8c9ac0
> > > > 100644
> > > > --- a/drivers/gpu/drm/xe/xe_query.c
> > > > +++ b/drivers/gpu/drm/xe/xe_query.c
> > > > @@ -344,7 +344,8 @@ static int query_config(struct xe_device *xe,
> > > > struct
> > > drm_xe_device_query *query)
> > > >  		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=3D
> > > >
> > > 	DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR;
> > > >  	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=3D
> > > > -			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
> > > > +
> 	(DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY
> > > |
> > > > +
> > > 	DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY);
> > > >  	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =3D
> > > >  		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K :
> > > SZ_4K;
> > > >  	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] =3D xe->info.va_bits;
> > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > > index 8e8bbdec8c5c..7c30e707346c 100644
> > > > --- a/include/uapi/drm/xe_drm.h
> > > > +++ b/include/uapi/drm/xe_drm.h
> > > > @@ -397,6 +397,8 @@ struct drm_xe_query_mem_regions {
> > > >   *      has low latency hint support
> > > >   *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR - Flag
> is
> > > set if the
> > > >   *      device has CPU address mirroring support
> > > > + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY - Flag is
> set
> > if
> > > the
> > > > + *      device has null query support for anyhit shader.
> > > >   *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory
> > > alignment
> > > >   *    required by this device, typically SZ_4K or SZ_64K
> > > >   *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual
> > > > address @@ -415,6 +417,7 @@ struct drm_xe_query_config {
> > > >  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
> > > >  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 <<
> > > 1)
> > > >  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
> > > 	(1 << 2)
> > > > +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY
> 	(1 <<
> > > 3)
> > > >  #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
> > > >  #define DRM_XE_QUERY_CONFIG_VA_BITS			3
> > > >  #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> > > > @@ -1270,7 +1273,16 @@ struct drm_xe_exec_queue_create {
> > > >  	/** @vm_id: VM to use for this exec queue */
> > > >  	__u32 vm_id;
> > > >
> > > > +	/** DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY - \
> > > > +	 *	Flag is set if the device has low latency hint support
> > > > +	 */
> > > >  #define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(1 << 0)
> > > > +
> > > > +	/** DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY - \
> > > > +	 *	flag is use to disable null query check for Anyhit shader
> > > > +	 */
> > > > +#define DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY	(1 << 1)
> > > > +
> > > >  	/** @flags: flags to use for this exec queue */
> > > >  	__u32 flags;
> > > >
> > > > --
> > > > 2.25.1
> > > >

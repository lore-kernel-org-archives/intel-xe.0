Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DFAE7FDFA
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 00:11:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D71210E496;
	Tue,  3 Feb 2026 00:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fLzStz/f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930CF10E496
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 00:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770077480; x=1801613480;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=84IKck3b7zMzlLZUEbZd/nbihIL/8jtCih8imBD9JDs=;
 b=fLzStz/fMnlp7LYStGOSas4g5QMwcx7Irm1FL8KYvG3DMcB6nF8KmELL
 aUPKSQc6i9GaigSSr8cW9jKKXf8+cuWVCYdaO9FgKLFvQaPWofMytFOXe
 fhEMm3dlrco1YI2Z+iBF3Hym991tq79HhyQWgv2FmJQc6Hj4UT0T5+AVC
 RncoK20x1CPmWbEqNIEzv3Jo9LPa9NyFFGKnsO4Qni6uXpUDBwMQMlOKw
 AsUiMpK3QCagR7pVH6VoutHaP5WgE3JJ4bgJL8PXFUp9eHnysne9HLIw3
 xsRvFUEuC08WV7uttQAco3oabBpYW/EtKNjUUy2HGLXwELW93zWRg2GX0 g==;
X-CSE-ConnectionGUID: DNxNSL45RTaKo3HQKkEUmw==
X-CSE-MsgGUID: IawSZiPNTGSNYNX+ct5iRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82614322"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="82614322"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 16:11:19 -0800
X-CSE-ConnectionGUID: Gl3eCF09Rza1HdPb1a6QSQ==
X-CSE-MsgGUID: XwkbaPcyQE6sbfH9GaiSWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="208771746"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 16:11:18 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 16:11:18 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 16:11:18 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 16:11:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B11noRnFEVt/ASkSh60xIgCDwxXbk1CUbEKyc/hCpUvUZQHk+jhC1zLY6DBNsxkqxs/LRnE+rDdnpDq5yJAW3pNar2GQG5h6alxSZ3CO+yprOj5n8rsGiUNQaCPCxt32ERulT7pTF7fzOhTIvzLVN4AtufZ7cIP/DmrnQlkvF4jt91EdRo6Mt5KsYPeNM+COEaSV9NqtV1JGSqYXG/8qVj3f/pyODtEFRnT2xATfT+RpCy2dbYNDsiHnJlUlFWGlS7qjv9MVqDXKlxe4MfhzYcQwN1iKuImgAwUvNreANUb9eqv1HnmRV9wYoe17nGb3fptaZJ5vfwGh3urgrTXmKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B7fiYgmLnmA2+4S0v0HX+5VAsXdrRxsqMTPDyi3ZEFg=;
 b=So0GVcNUh5cSXtfzgZb4cgba9Ms2hwnLqbjaEe7G6y7Twvh0dJcxJ/zLTg8Hh8te2yciR1vI3lcgeW94fEUsMpudsXrDzd7NWIgMngL6tlKsnQVrrFfLpWGrSzV+ZPg6rsIMy0xTwWFzqVjOfz4Sc34MIHCVP4Hvnujva2FlMGGzGEZ/bBHV1jx0qzDj/d7H7mQSZE/S2FRRpmBigq5wUQdMzAWrt0dzEsNRvrTpZI0DDyJz0HYZuUxXemlv4WChvT7CoBpVJzmLZ+KsG93qY1Vt66mYjomn/Kq7ibqRH8YlZQG/E6aHhNg6WNRfvM+4e7nfPJAVFcX10Y9WP+9NUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB7444.namprd11.prod.outlook.com (2603:10b6:8:146::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 00:11:10 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 00:11:10 +0000
Date: Mon, 2 Feb 2026 19:11:07 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/5] drm/xe: Keep all defaults in single header
Message-ID: <aYE9G4E85jGQPkkt@intel.com>
References: <20260121214218.2817-1-michal.wajdeczko@intel.com>
 <20260121214218.2817-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260121214218.2817-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0143.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::28) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB7444:EE_
X-MS-Office365-Filtering-Correlation-Id: bc6a95cf-45b1-4f56-4daa-08de62b8bc3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?LHIXZ2Z94F+Q4JqlcQB0EyfwNP+zi5gsPz6wxUIvt/73rA0gnw35EkCix2?=
 =?iso-8859-1?Q?LZ2+EIC7LqZ0Mtvh/NCMAbOWVNNZM3U+nq7nwXqvngBrd0WZnPmVQUrQO7?=
 =?iso-8859-1?Q?VykohLo7j56xgsmfHExzCmliaRMY0j86xOXZ39oI8wBdZNqQBzoDICRdNe?=
 =?iso-8859-1?Q?5W6Zd1rT/84E4X4tP+a6f5nd4wNPgCBqNhNowJqsPhan6wZWYgBbPyNpG+?=
 =?iso-8859-1?Q?76N+Wn/VnPUumiEsqe3FDB7eDlKgs76+mHhZ64zh4OFt20koO39Wc06Q++?=
 =?iso-8859-1?Q?WR1l83IV6Q+GseQX6/rt2mf61/vSZFeHTdV5dcLV+69g5NNlLLfle3pGxA?=
 =?iso-8859-1?Q?/1f07dRcMcDEVPoEnxcrXyvyHaA+Cjb9aT2rTAbU2ZbZSpYtkZQIeS/CJB?=
 =?iso-8859-1?Q?/mY5D7sOSeXbXzkxMgUMcn4JYKgfOdWZgccUNn0DHqHNohDJyDnYfTbqZb?=
 =?iso-8859-1?Q?qOnCO7RWft2KKfsfHI5zWHhlkD6gvdAkWigcIefu0jbhHJBPdIgzjPDSGu?=
 =?iso-8859-1?Q?Aj6QtVJiyZ2qQxB/MmutHFtZkfQ2ZIyAtv80UViojCl7111I/DVSyAFuC5?=
 =?iso-8859-1?Q?BH0GLLS5Slu8Wzo/BBf3wL/+nQo/gAk+FGCx1ZqiIEnCaP8kMoz+nC7Fx/?=
 =?iso-8859-1?Q?AqwC7Toiccc2CPcdtSIeqmFFY+nxVIs8pVmJjJUgc6BSzEfYY5i0ARzujU?=
 =?iso-8859-1?Q?Y/8U1bsHfOzLm3NlGDtVK1oRz0qQpOfHvpOQ+oQqybdukmBacbYBxrDRgE?=
 =?iso-8859-1?Q?FH0W688iqVfrmW2SareNPVr+0vwVseUZXTLR5JVa1CaSDXNS7ocuP0kC9e?=
 =?iso-8859-1?Q?sqzg69jiuVWK18uy8h4dSpMTvqnsU2m5ueW/R+ABJwSf6344AmdF4S10de?=
 =?iso-8859-1?Q?fdU06YSa0uNYIYD3UFaQcLrFV6LQVuY1H6cG+773V3lhHrWvzIymTRXeQ6?=
 =?iso-8859-1?Q?N79Yp+pbzI9apKuakTp7/+GpYd5F6An7U6P1n9Z4Gd3X+8SgbOJYjXNjgq?=
 =?iso-8859-1?Q?dgqHJXYLC84pQYaM46RBfDYc/wsuDyn77dZUm1I5P+XjUmz9PZQaRQrE3w?=
 =?iso-8859-1?Q?IDipFOK3g02kYjPL0S+chveinU9JlJfbc18v0wU1i4sp47B/CxMw4vJxb+?=
 =?iso-8859-1?Q?8DzA30TPi2re+gvlclSntrvKvNXnHBsvf0weEE/mRPAvtmGsDKKO4CYv8d?=
 =?iso-8859-1?Q?ER5tf7UxWoGOKjqdNy8n60upLRQTYgbTzQYi3vPA2//sEjKyfC06tojP42?=
 =?iso-8859-1?Q?k0CoIJhzZTZ7prAjihH4meDCQUhZ+/K7nqA3Bc2s0lEtJE5oFW5qFgp3+v?=
 =?iso-8859-1?Q?k/IEO66pnOUdiveEOtOkohmJ1uSgJQs66TZ5XHrryPHZKIaqh1MEd92bIG?=
 =?iso-8859-1?Q?aLT7uHV0AEr6V64KBGJYgh5ghmhJ2FObjAb2QG8FoI4XXacRrMda9uI/XP?=
 =?iso-8859-1?Q?wERXVSD92ZI4WhdWGnN/KFrpU8WEKSPJmr4K/IVRi4160iEjmH6mxcAGD5?=
 =?iso-8859-1?Q?AM0hB09p7Ak8EbcMY3Nr5N7Fmy/g5944nzv+5/jZhzdKaWAMROlJJk/856?=
 =?iso-8859-1?Q?9dmYKrjSh7LyEl1X2AQfzK/4TrsxOhTxjJ7yENnZSm+fjjatBA8bZxqxUS?=
 =?iso-8859-1?Q?KlmJUH1AnhLj8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?QkO71HdnWyKDjzSpaLpYYY7xONOJIzQWHjJHBeOyX1/k86fZSlhQ6ZYEMs?=
 =?iso-8859-1?Q?m5/DQ+6ZBNbltaVlp0ansG+BguNeO6hNL8Nsg7AeTBpADG+VIJ9UekDXj7?=
 =?iso-8859-1?Q?HO2p1nHWND0BWbeRCk3y07qrkzoUHnE+8Nbi5tCKlPPe9ggtDCOymA0dRZ?=
 =?iso-8859-1?Q?BOWcSoqP4tkpomefRKACNThHSozUx5QQ7JZmqqn5dYmAzwTnf4zNPbYK4R?=
 =?iso-8859-1?Q?ZlKvbQKzj/c23zdbB/NxGE8Jnx+qK+ziSaF4ZbCfhoZNl/9B0+cUqckW8p?=
 =?iso-8859-1?Q?wQfx9Nxw169SU5/Bm2wvKTYsUR+qjYLLYUgfvkAuiqQ9RZAKA5zx5lV+K7?=
 =?iso-8859-1?Q?HZvQ2n/ETSPuFFMvbgyEGfaSq0+5zNozfX9bMSIv/gQ7/JcaSE8fvsAHev?=
 =?iso-8859-1?Q?JMfZx90jj4gh7jGcrmEyFZnaEI7O5VkH1iQTCzKxAYpaOmCWfBwucF5QFa?=
 =?iso-8859-1?Q?GET38Gdw1wwbltl3QJ5UY9+H/kG1sRGzWT5YFP3dxCFCCIPC0JoK/LqomV?=
 =?iso-8859-1?Q?r8FUjXgtnrxlOz/hf+d9uN/ePMH2YIvkgyXgkvXVgq1vw1q2cf7gvnzo0I?=
 =?iso-8859-1?Q?ygVdwyiW/djgQQGGa4YBZ5zsCeiFDih4h/Y7BJzqhixhoxLMBeGJXx2zNU?=
 =?iso-8859-1?Q?U4vfKEcCLAn+aTIeiVh8yrrFjKBGh3MGFEqrUtCB/4pNM9bt+KN7G+PYyU?=
 =?iso-8859-1?Q?6hRW4ShOGGwQNJg1va/kk1UsU6SjkfOVlxxP5EUunw3GHt32Ze5VlkBsTp?=
 =?iso-8859-1?Q?RcuwnOHzp3oyrZbVuZgs2SwTs49I4Rwi4MYEo/oQhpTs2SbUmGxKbHVfwW?=
 =?iso-8859-1?Q?6xRuXakgxChxqEidYn9THIAGVJwqJuDxfTTMo71yX6Eu5YZRkkHdDwhBUe?=
 =?iso-8859-1?Q?yoozus3a6s8aOHob3a2Kt5qbEYfZPmrvg6cT7TvWqhezHAWDYQYiIaY5zX?=
 =?iso-8859-1?Q?ZeguxrMmcX4vTT2nDVzdO7BeXjDRmAv8D+bJY5K3cQythmDCUswHzT+lhl?=
 =?iso-8859-1?Q?UVPejgoDAFyyfGkPUiCz8Eu08He0mp4O08M6/7fpdzvZuu4x9tHV3nhE0W?=
 =?iso-8859-1?Q?ExAFZGzBw90ztvpLkVP/lSwwsm9G3S6VBscfl7cHRJKOiWHQlGirIhK7FK?=
 =?iso-8859-1?Q?kGGNXG9j3CAO3l7pzS4V+pVoBWN0CIitnaOlVnzvDImNi1EMCiMmYxlJFi?=
 =?iso-8859-1?Q?bKyaNcUXAEHF6sfQcvlBpPU7cwhx6yw3KNKuoT/DBNOgVzAqnxPtcpON9x?=
 =?iso-8859-1?Q?0GAhjEnw7Gul6xWi9ZuZu9AydNCtaH7gSfVdR4z0YtDMliCzhLHiquNhwl?=
 =?iso-8859-1?Q?3Qh0mWzIJU/EVF6lJjFfsd6ZStEJUv2oPDkjrDC4wOoKFtVhrHa0Ca2hsE?=
 =?iso-8859-1?Q?S5eBlddimHQ1Dcf0RmS9NJ/stGigbkRqfW6OMxjCQKvTIVQSrghSJrB6k0?=
 =?iso-8859-1?Q?sgXgssHwjRKU5CJdkwObdMeJdhUkZjx3s9a+DUSS+zV2Du1+paRLk4KYMA?=
 =?iso-8859-1?Q?bjG6tjykQDuiNtSWfz76kKDXYQo7c9gzjBrkJ+cw1FWr6SRzobec3dww++?=
 =?iso-8859-1?Q?hui6pnlQyiuVCeJMhWsL3RngZLZ534YR61srvhRp86WYcDULmwDdmvQvMu?=
 =?iso-8859-1?Q?/bTywojEos7U5lKgRi42/K1JrNyT+dbUPFEFtNkBPvZhpGM0PtTOgOq4AC?=
 =?iso-8859-1?Q?VLgj76TAI9fjGIZLETxQvplgoaAwmIUsUQJjrVHW9HPbHaE1FpOxCcTWb4?=
 =?iso-8859-1?Q?UlGnCRPSjLwCmO0Mwaev8cajVhd+P4hpB9Nb6Pj9BmrMq8zc8cjHFQUIrO?=
 =?iso-8859-1?Q?kLpBADH2mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc6a95cf-45b1-4f56-4daa-08de62b8bc3f
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 00:11:10.7400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g4ExqFxjoGjmcZuSFWRRIPsWM8818IviPx4FpwB0QFQJ21RzhAnBvpJpNHtTVNMDtU4iJP6Mniri6H7iFNMopQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7444
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

On Wed, Jan 21, 2026 at 10:42:12PM +0100, Michal Wajdeczko wrote:
> We already have most of Xe defaults defined in xe_module.c,
> where we use them for the modparam initializations, but some
> were defined elsewhere, which breaks the consistency.
> 
> Introduce xe_defaults.h file, that will act as a placeholder
> for all our default values, and can be used from other places.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

on this and the whole series

Thanks for that.

> ---
>  drivers/gpu/drm/xe/xe_defaults.h     | 25 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_device.c       |  3 +-
>  drivers/gpu/drm/xe/xe_device_types.h |  3 --
>  drivers/gpu/drm/xe/xe_module.c       | 42 ++++++++++------------------
>  4 files changed, 41 insertions(+), 32 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_defaults.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_defaults.h b/drivers/gpu/drm/xe/xe_defaults.h
> new file mode 100644
> index 000000000000..9183d05b96e1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_defaults.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +#ifndef _XE_DEFAULTS_H_
> +#define _XE_DEFAULTS_H_
> +
> +#include "xe_device_types.h"
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +#define XE_DEFAULT_GUC_LOG_LEVEL		3
> +#else
> +#define XE_DEFAULT_GUC_LOG_LEVEL		1
> +#endif
> +
> +#define XE_DEFAULT_PROBE_DISPLAY		true
> +#define XE_DEFAULT_VRAM_BAR_SIZE		0
> +#define XE_DEFAULT_FORCE_PROBE			CONFIG_DRM_XE_FORCE_PROBE
> +#define XE_DEFAULT_MAX_VFS			~0
> +#define XE_DEFAULT_MAX_VFS_STR			"unlimited"
> +#define XE_DEFAULT_WEDGED_MODE			XE_WEDGED_MODE_UPON_CRITICAL_ERROR
> +#define XE_DEFAULT_WEDGED_MODE_STR		"upon-critical-error"
> +#define XE_DEFAULT_SVM_NOTIFIER_SIZE		512
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index aad4aa53a51f..17f4d048c8b9 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -26,6 +26,7 @@
>  #include "xe_bo.h"
>  #include "xe_bo_evict.h"
>  #include "xe_debugfs.h"
> +#include "xe_defaults.h"
>  #include "xe_devcoredump.h"
>  #include "xe_device_sysfs.h"
>  #include "xe_dma_buf.h"
> @@ -743,7 +744,7 @@ int xe_device_probe_early(struct xe_device *xe)
>  	assert_lmem_ready(xe);
>  
>  	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
> -			  XE_WEDGED_MODE_DEFAULT : xe_modparam.wedged_mode;
> +			  XE_DEFAULT_WEDGED_MODE : xe_modparam.wedged_mode;
>  	drm_dbg(&xe->drm, "wedged_mode: setting mode (%u) %s\n",
>  		xe->wedged.mode, xe_wedged_mode_to_string(xe->wedged.mode));
>  
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 34feef79fa4e..b4600c5069a9 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -62,9 +62,6 @@ enum xe_wedged_mode {
>  	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET = 2,
>  };
>  
> -#define XE_WEDGED_MODE_DEFAULT		XE_WEDGED_MODE_UPON_CRITICAL_ERROR
> -#define XE_WEDGED_MODE_DEFAULT_STR	"upon-critical-error"
> -
>  #define XE_BO_INVALID_OFFSET	LONG_MAX
>  
>  #define GRAPHICS_VER(xe) ((xe)->info.graphics_verx100 / 100)
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index a0048f64ed12..903d3b433421 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -10,6 +10,7 @@
>  
>  #include <drm/drm_module.h>
>  
> +#include "xe_defaults.h"
>  #include "xe_device_types.h"
>  #include "xe_drv.h"
>  #include "xe_configfs.h"
> @@ -19,51 +20,36 @@
>  #include "xe_observation.h"
>  #include "xe_sched_job.h"
>  
> -#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> -#define DEFAULT_GUC_LOG_LEVEL		3
> -#else
> -#define DEFAULT_GUC_LOG_LEVEL		1
> -#endif
> -
> -#define DEFAULT_PROBE_DISPLAY		true
> -#define DEFAULT_VRAM_BAR_SIZE		0
> -#define DEFAULT_FORCE_PROBE		CONFIG_DRM_XE_FORCE_PROBE
> -#define DEFAULT_MAX_VFS			~0
> -#define DEFAULT_MAX_VFS_STR		"unlimited"
> -#define DEFAULT_WEDGED_MODE		XE_WEDGED_MODE_DEFAULT
> -#define DEFAULT_WEDGED_MODE_STR		XE_WEDGED_MODE_DEFAULT_STR
> -#define DEFAULT_SVM_NOTIFIER_SIZE	512
> -
>  struct xe_modparam xe_modparam = {
> -	.probe_display =	DEFAULT_PROBE_DISPLAY,
> -	.guc_log_level =	DEFAULT_GUC_LOG_LEVEL,
> -	.force_probe =		DEFAULT_FORCE_PROBE,
> +	.probe_display =	XE_DEFAULT_PROBE_DISPLAY,
> +	.guc_log_level =	XE_DEFAULT_GUC_LOG_LEVEL,
> +	.force_probe =		XE_DEFAULT_FORCE_PROBE,
>  #ifdef CONFIG_PCI_IOV
> -	.max_vfs =		DEFAULT_MAX_VFS,
> +	.max_vfs =		XE_DEFAULT_MAX_VFS,
>  #endif
> -	.wedged_mode =		DEFAULT_WEDGED_MODE,
> -	.svm_notifier_size =	DEFAULT_SVM_NOTIFIER_SIZE,
> +	.wedged_mode =		XE_DEFAULT_WEDGED_MODE,
> +	.svm_notifier_size =	XE_DEFAULT_SVM_NOTIFIER_SIZE,
>  	/* the rest are 0 by default */
>  };
>  
>  module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size, uint, 0600);
>  MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size in MiB, must be power of 2 "
> -		 "[default=" __stringify(DEFAULT_SVM_NOTIFIER_SIZE) "]");
> +		 "[default=" __stringify(XE_DEFAULT_SVM_NOTIFIER_SIZE) "]");
>  
>  module_param_named_unsafe(force_execlist, xe_modparam.force_execlist, bool, 0444);
>  MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
>  
>  module_param_named(probe_display, xe_modparam.probe_display, bool, 0444);
>  MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left untouched "
> -		 "[default=" __stringify(DEFAULT_PROBE_DISPLAY) "])");
> +		 "[default=" __stringify(XE_DEFAULT_PROBE_DISPLAY) "])");
>  
>  module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size, int, 0600);
>  MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size in MiB (<0=disable-resize, 0=max-needed-size, >0=force-size "
> -		 "[default=" __stringify(DEFAULT_VRAM_BAR_SIZE) "])");
> +		 "[default=" __stringify(XE_DEFAULT_VRAM_BAR_SIZE) "])");
>  
>  module_param_named(guc_log_level, xe_modparam.guc_log_level, int, 0600);
>  MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1=normal, 2..5=verbose-levels "
> -		 "[default=" __stringify(DEFAULT_GUC_LOG_LEVEL) "])");
> +		 "[default=" __stringify(XE_DEFAULT_GUC_LOG_LEVEL) "])");
>  
>  module_param_named_unsafe(guc_firmware_path, xe_modparam.guc_firmware_path, charp, 0400);
>  MODULE_PARM_DESC(guc_firmware_path,
> @@ -80,20 +66,20 @@ MODULE_PARM_DESC(gsc_firmware_path,
>  module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
>  MODULE_PARM_DESC(force_probe,
>  		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details "
> -		 "[default=" DEFAULT_FORCE_PROBE "])");
> +		 "[default=" XE_DEFAULT_FORCE_PROBE "])");
>  
>  #ifdef CONFIG_PCI_IOV
>  module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);
>  MODULE_PARM_DESC(max_vfs,
>  		 "Limit number of Virtual Functions (VFs) that could be managed. "
>  		 "(0=no VFs; N=allow up to N VFs "
> -		 "[default=" DEFAULT_MAX_VFS_STR "])");
> +		 "[default=" XE_DEFAULT_MAX_VFS_STR "])");
>  #endif
>  
>  module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, uint, 0600);
>  MODULE_PARM_DESC(wedged_mode,
>  		 "Module's default policy for the wedged mode (0=never, 1=upon-critical-error, 2=upon-any-hang-no-reset "
> -		 "[default=" DEFAULT_WEDGED_MODE_STR "])");
> +		 "[default=" XE_DEFAULT_WEDGED_MODE_STR "])");
>  
>  static int xe_check_nomodeset(void)
>  {
> -- 
> 2.47.1
> 

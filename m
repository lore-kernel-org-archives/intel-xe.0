Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E440D2FEDD
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 19:46:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E120A10E5B8;
	Tue, 27 Jan 2026 19:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hNcTj+F/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B0710E5B8
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 19:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769543217; x=1801079217;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QGMk6q7GP58NAOCAsaHoKifKYFTwGdVHOrEYidlCmrU=;
 b=hNcTj+F/tREgOc3+lDaf1Lp3y5iGGyFsjHryI4Bse6nJ7MEbC4p9EoS4
 kjJddhQ5pbndWjlb2FXAZEeym3EyjDEXTVC38TMyEMYLCvUPAnWIpsoSI
 qi/DOcd7gXxVRIq0cOXQDNwUTkLnQoMvp3oKCsWFBl1GuL7Mri+hxdxpl
 8RYc6sD7Pi5+1WqQwUuqkRJhVLv+QDa7OOkfmp+fJfJgI/ZEmO2qimVNZ
 OeVHVtHhEkVx1QXqX8m/MMlZWtf5r3LTH85f3egdKk1m0Z/6NNjDoOd3N
 Agt5D1CRiAWnHJt5ly9jXD5ZhsxKttwG95bsNjdkphqPhQa5jWkXjghmo g==;
X-CSE-ConnectionGUID: NMuxfp3ZSdyaVpiDkF4mYA==
X-CSE-MsgGUID: WVnqMTsXQT2XZ2aU1iS3dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70723576"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="70723576"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 11:46:57 -0800
X-CSE-ConnectionGUID: PEXdjJPpRP2C+ORS/ErfmQ==
X-CSE-MsgGUID: Smohi2WWTf+1TNsHxVsmOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="212170666"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 11:46:57 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 11:46:56 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 11:46:56 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 11:46:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TyZZ3Te6+qXDI8npe+fW1T9rCthlW8AAvaWJ4iR/YhhC9d44ABf5Pb1Tfrtcrupt2Ut7IGWakOxfF9VXkv9Cl++sBM5lkEByi8ecwIdGG2nmTsvkH3oUrFAlogp42B0kWJKpfDyLWwcWqtotUJPm3BQIcrkc8d5rTqsoIzHQVkDlt4KZKcuZJ440c1x4sKczLfPJ8H8COpkTLGHlXXHPCL/kb8rOxropRwCaYo1mtKU2u3uyKClqepACM8IRfebPzbni/6sY10sT6YIa5F1BM1odro+NuwqrEYZSgpcINKUEOT7dP1yWN36SpQNyhnwXPUITQtsxIfOYQygQANGBVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUwkeNr1Lnv2nd8s257hZbKxiUf4wLSAQ83BcIPEhgA=;
 b=LuPQSQy0r9B4OPhxdTwCkIdGGefLVvOUJqCDMPWxHxwpK3LVOrpncPg+/6ygYgCdVk2v+ZxTSwDjbcK6vDf1H3LE39WwhoFgc2ZcfjPS+/NhqyiWcQYBzEAjZDsHrUsybX0+0jdlNLfloW8YhUMZfo5yAojeLBYmGzYnjpW32trF9Xu+Q5kgc0dq9r7zyWd5H3VK/1UUJKN7uwoUDfzxKzj0bqfmcog/hvp5xs0x9hd1+hqcCPgtVmwuGX8ZNIQPUDd21CHxlDtMnjO/ObvGfJuPA82pd8MSp7BmgL7cjOGUQ0HAsJCdngIOBxI41jm9XvvAwCTFOfaYydjaVuYINQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB9455.namprd11.prod.outlook.com (2603:10b6:8:28d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 19:46:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 19:46:54 +0000
Date: Tue, 27 Jan 2026 11:46:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/6] drm/xe: Promote relaxed_ms_sleep
Message-ID: <aXkWLHGoGcQjEOXq@lstrano-desk.jf.intel.com>
References: <20260127193727.601-1-michal.wajdeczko@intel.com>
 <20260127193727.601-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260127193727.601-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0062.namprd05.prod.outlook.com
 (2603:10b6:a03:332::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB9455:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a89917a-264c-45a3-9985-08de5ddcd2ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?5M52TCDQtzcoLwkhM9eoVuGrYLl5OLEhETgslSWNrsbi2SiBwkeOFuP7U/?=
 =?iso-8859-1?Q?lwtT/VM1+cZBQjSsvJ5Ibul2UCvVwtTqFwDPD49XYhyjnKjr/C4QDWvRJx?=
 =?iso-8859-1?Q?JkX2vqCkev8+bIWpxd/fb+yDM2djkdJ90sx6aopmuivFtzlfgXi4mliIf1?=
 =?iso-8859-1?Q?YaiwfMdynJ1B6Av1czYIWYOcgxkJBJcbC/HD8Lo9da9twxho7IEZqjgSRm?=
 =?iso-8859-1?Q?gXFIk61oKiCLPg2O97rrtjATuvK2bG3run+vvqtNJ9hqCnOR0RMY0/xg48?=
 =?iso-8859-1?Q?EssJ1KFj73ek1fSUfIBru3+96CdO8KUws8IXFACCS524ni/3En6Qrixvz6?=
 =?iso-8859-1?Q?j9sO+KQ1O9U9Wl3Oork7sPiRqHttOHd4nK9CeevoOzcySLeCIQc7/T25ma?=
 =?iso-8859-1?Q?dVw7o6kklRqEZ607szyAbSaVcVJDYzc34fJs9yvQDRJGfi7KJKYUtFaVMc?=
 =?iso-8859-1?Q?97Ud+TYtTmohiPHKygnbeOj5NUQzzCyU5DmdsvTYxNZ4MVyP7GwjXLr2+m?=
 =?iso-8859-1?Q?wktXAmU4w5bLSV0XV0kUpPsKQlJGghV0bf8Tyl/Un0MF09rBlE3ySzAxUJ?=
 =?iso-8859-1?Q?/daUtr5IfSW5pjKZ5FKkL9bTpNN2cJ/oaObFMEfJbZxHAJnliqjrIcHWSo?=
 =?iso-8859-1?Q?oOCroaufMuKHfM7auODpdQa6FHuK45lZtBKObrcu1AubPbsqHwAEtEjawd?=
 =?iso-8859-1?Q?cvB0zLUFtXmjVRfjckUOn99JwMSZjExmU73wkEZ1yJUvBRkOHE/lPCjtFe?=
 =?iso-8859-1?Q?Kwcf5yMqa4fCE9oKf/vXmq4zRztOaGSuRiVt0UsCAlkQDL1Lvu9FKinWMM?=
 =?iso-8859-1?Q?fAWNbdTPS9mG9ST9FmKiJ2Nu+oJE7z4oh/5wya056IGWs8CB4irTKouUav?=
 =?iso-8859-1?Q?/11myP8Y64d1xidT1Ks2qN6N+sBGPODH9OTMMJ9Ww03dN87xUYuvM0wrom?=
 =?iso-8859-1?Q?Hc+g+fqMtND0wR3h9JbcirQ1T/Lici1Bnygk8Kj2+gChdSkz725pmhe7lZ?=
 =?iso-8859-1?Q?qcg0KLBq0dcuEv1rtwkgSRA/SVJFmGcXWAwMQ2zqdD+vLPLzyuOukxn3w/?=
 =?iso-8859-1?Q?421fOyFjBHGgHIUmgKlVr1XBfZYNHU8cS1N19SOSmHvf3KYAPvBTV5sU+Y?=
 =?iso-8859-1?Q?zAhKh95UOkHNAeH6QY9V66tvcOVz90ehnO+2RinA2XW44HBPSM3Vz7/f0M?=
 =?iso-8859-1?Q?uvGp1Qgy9g9y4AxOgbYM6TV4vUVoaHlSsVuDDglAThTniDL77Iict5AlBg?=
 =?iso-8859-1?Q?ZqOwXdNBY+UhyacoqEV87uJcGHMOvUvYcyMkkfSEMl7n7ZRKQtTqVf3bf/?=
 =?iso-8859-1?Q?fSyarpq9bCv1uT/p2Qe6QOc45Ld0HrErV10OfwVeTH0deJ0jXGgYwWbm1Q?=
 =?iso-8859-1?Q?03enTrf2a9lUeWFz176zOIKUW7VnIWgMzqxo/T4UqLbCWzSFtahlTOnvGE?=
 =?iso-8859-1?Q?6Si+IK3YAbeTVB0aeNrXV31FJIank+Ow4KZKesutMrKAByBunzxDjfqOdk?=
 =?iso-8859-1?Q?LplT4Itt+tJJEQKtvea67iOqZQ1XQTfqnX1NDxTZeYaCC4PsKJwNIViVtB?=
 =?iso-8859-1?Q?BKch0RYUsyd73+R+CXzmy5gRnO23dnq8aZPVohaR151ft7mG9/d4mRcW+J?=
 =?iso-8859-1?Q?jm94W0CCuw1jk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?w7cgi/HSao0jrj0oI9/r0XYwLpyDBxCu3D7fP2jTWdFMMUdF55x2dmLbuV?=
 =?iso-8859-1?Q?UlnOM9MFW/jr+0JromoZhOi6bjWU05jQiQX6NOu6ntfWAB1Al9iXjHdQCZ?=
 =?iso-8859-1?Q?8w4vzRoN0bTdyyEhw8LtZhZinxc/zyFl9yQBgkEmYDljgebGHwdty0cwJ/?=
 =?iso-8859-1?Q?an92WFOGT/5E0YLN/sJMJLwSucKmBwNUi/T+M1SVdJAuzgY1lmB3/05LCC?=
 =?iso-8859-1?Q?ojcnppY5WQrjtcX7NLnWFgmDsECN3RKQOadaNE+LAqqxgGcrcGiyylc5NY?=
 =?iso-8859-1?Q?8tPVGf6DX6lzanEEixmrm2ePYeTe6c2rwFXXkJp+wwRjc8yRsj0E/eW6rw?=
 =?iso-8859-1?Q?Gg7kdVjjf4HneitUjav+iRK4kCT3E/yZrJ3Y1mE16NaAtgtLh1yIplx1Ec?=
 =?iso-8859-1?Q?Lp9trViq7KN/e7awkC40qqn/tDwHt7FEd1huN3zkCXW8yfkS8DK60B0gnv?=
 =?iso-8859-1?Q?AoOeaxo7rnZdriklibRj8JC1x9pKE9CyAIEM2Nh4HzmceKvALbK5c8pXup?=
 =?iso-8859-1?Q?uztglCPIwcCyi87XuEICVXu7Xmzg1BPfGwdJyE7y+RvabStkdZHhrVu4Cq?=
 =?iso-8859-1?Q?mjpBjhc+mVtfo1cMYrUAb4LfTAR7fXfiehpmz0coZPuW5++GaXidfqtcdd?=
 =?iso-8859-1?Q?iM65gwt+fFWqDo+DzAlVSCVbh+x0AHlO4hc5UzmI2j8++qXvCf+ckSw3Y9?=
 =?iso-8859-1?Q?cr/2wRi4Y3YZf0gobyLKfTJWomKJagG1RbWuWl4aMMf93UQ/oiYKxfdyCg?=
 =?iso-8859-1?Q?5Jy63I9SfKmJ0VuzoKnayW3UeYpzpawKKXOOdCQI/rWSd5ZTZdraoWDV2h?=
 =?iso-8859-1?Q?D7r/fNRvj6OM0U2ng315JlMdJ/xeXQ9QzvTVb4B0ZLfO7E19ed5o2HZkzb?=
 =?iso-8859-1?Q?n6lVnBIJJWjLah4gocWpGnlCGHP7yMNFjf2TUTG3Bx/SH9jJ1BlrQgynRv?=
 =?iso-8859-1?Q?eHh4VcnehaBMXUZA2wH2/Pp1CUaYW4UT7pta9n+Wkiz5mqt77fhbsxu/1w?=
 =?iso-8859-1?Q?rEAVVSrL/qHOMZLl3mw9VCPwji0My3elyGdQ8hAs+wde/U0JaRSia2cTtg?=
 =?iso-8859-1?Q?FLGkh5gEM1+mkl7txvZSbjbXoh+Zo4/zL9aZIkz1Tshe5xAUPrDg5G5SwE?=
 =?iso-8859-1?Q?s2UfebhpbZAJdDlY57K0s9DIdMsD/8DqO1MNUTvppaYFuUXbBbOdE3Cl1x?=
 =?iso-8859-1?Q?GlKbp13MsTt6uIogj5NQ6udiNCCa5YedGp23Pa4rW+rmhQYQt56fs5SjHS?=
 =?iso-8859-1?Q?HOWqCvyTv4KY/qTIMqDzEFs0gsqhUJB1263bN6g6Nt2HlDkHlwjcnYWDCI?=
 =?iso-8859-1?Q?xHu7TAIw7YDQaTOGgqZyPBdhiGnrecxqyegzazTIoY1Ph+UNk9OL2Dy0Q7?=
 =?iso-8859-1?Q?3FSQ6c6S3W9Bp8mIELCfHdYW9RijToraUoxyP1vpLk9WTvg0q6L5Bb3ojO?=
 =?iso-8859-1?Q?ST1awos6qVAcma3L5bbkFCElnlsF3CqvDjI4CJPL33+80Q9ue46/kMqPj0?=
 =?iso-8859-1?Q?DADTNgGbe199PDgBc50GuxCmapmtoiTAhmsSygTQv6hQyd7NGIwfrGtUCn?=
 =?iso-8859-1?Q?7LHAcWq813fbRU6Uvx09mIg7etIC009DJ53tYSIh3jYbggUS6eHWOMV3Zj?=
 =?iso-8859-1?Q?Z8s7pKR7Dm/VwpnSe3QUU50itRw7fdXgv3H0aNgqnFneLXGyQSs6aZEQFz?=
 =?iso-8859-1?Q?2h98ITeR/odFoX06FIXPmzlSFY+TKrmkqXYhuzSACbAxWd3hcpka/05w7r?=
 =?iso-8859-1?Q?3QJsYdXlXylsXiz+2zWJuNM0SIsed13qWi8Px70cpcJOr9+85F2T6ZdDVE?=
 =?iso-8859-1?Q?KeIpaisBJw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a89917a-264c-45a3-9985-08de5ddcd2ec
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 19:46:54.7721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M0XC0hCt7KL2h2y3bHJk2WkrYsocE/l8KAuPw/fmtGx6wRBUJ8eML/SLvHhWDhyVFVznhJHldkh1h7Wjm+ubNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9455
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

On Tue, Jan 27, 2026 at 08:37:21PM +0100, Michal Wajdeczko wrote:
> We want to have single place with sleep related helpers for better
> code reuse. Create xe_sleep.h and move relaxed_ms_sleep() there.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 23 ++-----------------
>  drivers/gpu/drm/xe/xe_sleep.h      | 36 ++++++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+), 21 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_sleep.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 456f549c16f6..4ea14f2794f4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -8,9 +8,7 @@
>  #include <linux/bitfield.h>
>  #include <linux/bitmap.h>
>  #include <linux/circ_buf.h>
> -#include <linux/delay.h>
>  #include <linux/dma-fence-array.h>
> -#include <linux/math64.h>
>  
>  #include <drm/drm_managed.h>
>  
> @@ -42,6 +40,7 @@
>  #include "xe_pm.h"
>  #include "xe_ring_ops_types.h"
>  #include "xe_sched_job.h"
> +#include "xe_sleep.h"
>  #include "xe_trace.h"
>  #include "xe_uc_fw.h"
>  #include "xe_vm.h"
> @@ -1028,24 +1027,6 @@ static u32 wq_space_until_wrap(struct xe_exec_queue *q)
>  	return (WQ_SIZE - q->guc->wqi_tail);
>  }
>  
> -static inline void relaxed_ms_sleep(unsigned int delay_ms)
> -{
> -	unsigned long min_us, max_us;
> -
> -	if (!delay_ms)
> -		return;
> -
> -	if (delay_ms > 20) {
> -		msleep(delay_ms);
> -		return;
> -	}
> -
> -	min_us = mul_u32_u32(delay_ms, 1000);
> -	max_us = min_us + 500;
> -
> -	usleep_range(min_us, max_us);
> -}
> -
>  static int wq_wait_for_space(struct xe_exec_queue *q, u32 wqi_size)
>  {
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> @@ -1830,7 +1811,7 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
>  				since_resume_ms;
>  
>  			if (wait_ms > 0 && q->guc->resume_time)
> -				relaxed_ms_sleep(wait_ms);
> +				xe_sleep_relaxed_ms(wait_ms);
>  
>  			set_exec_queue_suspended(q);
>  			disable_scheduling(q, false);
> diff --git a/drivers/gpu/drm/xe/xe_sleep.h b/drivers/gpu/drm/xe/xe_sleep.h
> new file mode 100644
> index 000000000000..a772f1a37395
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sleep.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_SLEEP_H_
> +#define _XE_SLEEP_H_
> +
> +#include <linux/delay.h>
> +#include <linux/math64.h>
> +
> +/**
> + * xe_sleep_relaxed_ms() - Sleep for an approximate time.
> + * @delay_ms: time in msec to sleep
> + *
> + * For smaller timeouts, sleep with 0.5ms accuracy.
> + */
> +static inline void xe_sleep_relaxed_ms(unsigned int delay_ms)
> +{
> +	unsigned long min_us, max_us;
> +
> +	if (!delay_ms)
> +		return;
> +
> +	if (delay_ms > 20) {
> +		msleep(delay_ms);
> +		return;
> +	}
> +
> +	min_us = mul_u32_u32(delay_ms, 1000);
> +	max_us = min_us + 500;
> +
> +	usleep_range(min_us, max_us);
> +}
> +
> +#endif
> -- 
> 2.47.1
> 

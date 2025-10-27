Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FEACCF9E5
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 18:30:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FDE210E547;
	Mon, 27 Oct 2025 18:30:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dgnf6hWh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E7310E547
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 18:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761589836; x=1793125836;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cp1xk2ue55PrVzlPvkFq/535u8vCaevSJpe4OIgOr1k=;
 b=Dgnf6hWhlSmI6CMa8HkRWUR8FAZ75AMPtIsVnWNl9Z0Qe5++Y4RnIgrc
 01igDd3tXEZi4QDm/60S1QcRyXRw+0ZOzOp4aKG4ra5mn5ji2Q1rGBKYZ
 lrcuu8AqvZtCwrnJCzjnSHbIiDDnX8uwaWiu5CZQwfKQvCpvLAhg/cKG/
 mhGTNwzTI4UPY9m1CfL+2tmhnN5oKbARf+dnyUnuwuHkrlykwgZadLzcI
 OUaJHPOhj/pLHknB/JTirhU98SGTA2OvvjWJ4TEkZcba7iPJUT/f9MARK
 GjH8HYwKzDLcdNVQ+7BGRiNxlrbii45+rxOsrq3X8EA+0Zo3uesFmV0Ke A==;
X-CSE-ConnectionGUID: CxNUUeJUTIO0YmvBgSRErA==
X-CSE-MsgGUID: WmZd6vI8QzGKu3P8KWvfvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66294920"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="66294920"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 11:30:35 -0700
X-CSE-ConnectionGUID: yMatC6nwTfigC1VCe8XbSQ==
X-CSE-MsgGUID: b12Rw7h2Q5qhXHrbULMkaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="190257285"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 11:30:35 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 11:30:34 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 11:30:34 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.2) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 11:30:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MpYf0AoVmMPqt29hKntIyCBY4obiuf6EMFzf3aKKujGMrtvmB7DMb6Y7GD5GH9s3H8KKZqxclMipt4uDX3FQ3emI3oxEbQSc37+SLgLCcD2P0nBZADaDj+HoeWoOuOnHrg0mgt943FFRu7DaSbPwOa/D1XTqLk6h826CXspWhgwdoAuAn0Rx8p/M96XSrGLZiWQTUPcpMk/ptoFqXn0BGa8s2rT5JQI4+Kn8wO29a8WtQhTEnEMEK670+cHENgm4bpw/zbiUAkgsw8iEOyc0Mgq+UAxEfu0i/tjWhBZcTJpKQugTRo9NHNIWWvp4rwzwwyigsgQBQ2NaOkgHsi++/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hv8h9yCsqBIiVRartD3m9TIoNXAOaZMGUMh5RSbxOYE=;
 b=Mlea/AOQZQAfw1CSmFcc1ArysgkquGjzUXCZnaQoPPI0Nbj5TsitCG+8qgKLv9l2jhSxAAYomInmjopImorDv7VAdlymrsl2ErV0eFF4whCyzuIlXwKLTiUD0m9bhgeYpkR6vKeY8IL4HimC9+mshJJEWl0fCbCL4g3C3VYD1v8sp6BUSYFMdKRNT05yLWzG7pcqaxU+mhDEPF0XGlMGe/7h7ZoTOMFiJtSstScNLRoY1EhQWd9Nu6CSxsRrk7hdLgtvv3rG0wlYbEWlFYVD8MbDSz5ObPa32jQsmo+2ri8bLH84Q3340ZmIkS3u5CGtZRwGiO3an6/6TU053D8kNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7776.namprd11.prod.outlook.com (2603:10b6:208:3f9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 18:30:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 18:30:31 +0000
Date: Mon, 27 Oct 2025 13:30:28 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 01/14] drm/xe/pf: Prepare sysfs for SR-IOV admin attributes
Message-ID: <npplzbwwjribkuplw5q6xzrh7bdx3kdbmuh2ybxrbkikjzetuq@wlx7w6qvoqwv>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
 <20251020182414.576-2-michal.wajdeczko@intel.com>
 <oz7hgzvtaw4qlhgbftbkblbchlgpx4uaf7pg5ua3rmj2625vuh@umpamfhzsmdh>
 <eb5c16af-136a-4f66-a7b4-f5a6fdf4ccdd@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb5c16af-136a-4f66-a7b4-f5a6fdf4ccdd@intel.com>
X-ClientProxiedBy: BY3PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7776:EE_
X-MS-Office365-Filtering-Correlation-Id: 78069fde-65be-4142-12e3-08de1586e8e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?IqXmysNduBh0xyRDceXq8Du+mSct4Tih2x4CcI0XvG8SRroaxj7WPXAxKD?=
 =?iso-8859-1?Q?pDrJmj9AEZml9EkvGr7SY7KVsRHszuRQms+niAhSWQqjDpMRrtj16FEjIh?=
 =?iso-8859-1?Q?v3C1F0OgrzicBsqv+42xUBdxLO6J+Lq6YxfHWrO2Yed0WC60ZuZk/EKheG?=
 =?iso-8859-1?Q?zkd2YdBLIz2TM453EJzfiD7tYyLWc0BXmQIw4gRitXk3rpMtxKbMu2HUdl?=
 =?iso-8859-1?Q?Lr9+kz/6edWRnEYd+aEkRMGpKPsunr6AAyWzoo3p+Lwlz6qIHE0Wl2D2Pj?=
 =?iso-8859-1?Q?Wo5E986kJTm1Yd8dkoy3Q0r7TDxZcDsTGDDaeIRrCw9GrJHgBxhfdZGvVa?=
 =?iso-8859-1?Q?Gh+jeYrdUhaPVzKm5b5jaqjgvq0bnRxTH3fAIAtac9ZOhS0T0UJ6YOOhDc?=
 =?iso-8859-1?Q?BcZOAvCqtC80JyDVhqlQ0wx8O/ojhsbmSU12QoPWiWVqK8iuMn15yr/BaE?=
 =?iso-8859-1?Q?+FP2BAfoseTe35sSdkb1r0ya6UCqCepo+T6FBomAlB9+KZOLnWQ5oMnwYQ?=
 =?iso-8859-1?Q?oLFkqC5iZ28RRXmxZ3P9a7QqmHkwyekPe6QDnJvw9f4iy4lD+vN/x4Tm6h?=
 =?iso-8859-1?Q?Jfqu/4uGxYH+VUWJMUZ/DjtsLZ3hS5OjcG5hrPC0tShTgx7U06LD9KCccp?=
 =?iso-8859-1?Q?exoZX/MufaatDw4bHshuL0yJDh/iWb8Jcwez5fZzgzFw968KifeMRompWO?=
 =?iso-8859-1?Q?9vobtuBCrlNDZ5/PJ3lVVH89A0qFUMefa8ptq1Ba/Ddgui0AqE/si+mE0a?=
 =?iso-8859-1?Q?Cdg6zE/jYlfaBCZQZit82Ekkmdh2Y+06nr/DjtyQirrhFD3XFcFFRaO/ul?=
 =?iso-8859-1?Q?uTp+nweD/dRz/rswxjTYHF9ckfb0oBwvBWYuQcEzeSSyHasvC2K5sAuEWz?=
 =?iso-8859-1?Q?1LqQTvruC/EY4bq7sJmADAIjuJ4WEHQ1hXYA0bf9aXEndynCzoOf26yRkC?=
 =?iso-8859-1?Q?HHeInn4wVS/aC8brVhnPb/dNkL+YQ+ADkhccrtuDnirdYxJv+kMwLg6ZCe?=
 =?iso-8859-1?Q?YKqGHICGvg8ZjLr4iKdcZqWz0ZvcY1b4mG3132xPlIw3DoYVXrHZj4+MJb?=
 =?iso-8859-1?Q?hLDpbjjf83D/qYZBj18nlz2NoMypHZ1XYge6VPUPZKGmKxDnbFsGu08iTq?=
 =?iso-8859-1?Q?p0xWlXfXZB0YTqP3vKj3aH95ixIFPgE4kYkHXY/2G9LDQrzK0m4wU03/NM?=
 =?iso-8859-1?Q?d/mTiN9gGCqsGUMIT7MaSJxB5Um70HV9stc2/srp/2MFxa4LE+wsVp2Kt2?=
 =?iso-8859-1?Q?lhpESdN/2DJwpkyEUb4y8YsKo+OXWaLDVFimynfH1M77HkcaHYM6IBRwXj?=
 =?iso-8859-1?Q?Y+e3roUwiNizsnOKVBU9lFSnG7oggcuYaWAw82tJ6CTk209Zymb/r3QQ+h?=
 =?iso-8859-1?Q?0BFiAPXgVYESM5SFRHE7ssM1eXdF3ENP5MNmdlR67nZfxv0NCKl1QtR7Qr?=
 =?iso-8859-1?Q?VfmwTgJ5PZWtpvumrbo/zJ1KMz4t7av0SnuhOWIaKL1upc4uG1FgPbJuHU?=
 =?iso-8859-1?Q?qJXCttoZ9teg3s5p1siucN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Z0wJXOY4Kb2hJLEteoxJeeV2xkGxZxGs4A5FDoSKh9UQvketnTMyfehYfj?=
 =?iso-8859-1?Q?RG3stcNK8ecaErjS1UVxk9RkvNXrTrmB0IZT44apC1JhGITUM40cb6G4KO?=
 =?iso-8859-1?Q?FAxRotAccmhbCzzFwKYnW2W7S6+4HhLQG89wF13wXkxPd3FXyaMLECfaN7?=
 =?iso-8859-1?Q?x210+YgCOmTRIq1YloF6PBOjmYnnq9wYCS9JpaE6ZxGBpq1YtZxFjt6kQu?=
 =?iso-8859-1?Q?QURre98MoPJGwQGYFLMhmdhComHYn7rBE/VQ1/0xm7VOPQh8Oo8K8+aWbw?=
 =?iso-8859-1?Q?BWhM8uyk6Y5raT0/QuTqqnawqzvSzuFq8P9G4b0CS4JpBqQO9BrCj0iVxz?=
 =?iso-8859-1?Q?bspLcoiYOpad2T2NH8ECYmSXo379ewrCwm6PamfSwY27X8SzNbNFe0eg0S?=
 =?iso-8859-1?Q?aT968waz2xM+BfL6CNUiT9m+hCryi3SQxCqBa5C6R+pxmejKccjfKnUMel?=
 =?iso-8859-1?Q?8ETT53UaInW7Qie/0beuprJVV7hdtt+OHMStgJLKswiJ1LQDff1x+VX4N3?=
 =?iso-8859-1?Q?c6QGpaczjOIKUs6aZvrz/mE4g8OTO2tTaDbQK/PxaN2BQpu8OYLAYEEheT?=
 =?iso-8859-1?Q?cV+U26mNzqN+4vTquaLWoM6WE/Js73Ba310pWb7nQE8BmbBkAJovCY/wTE?=
 =?iso-8859-1?Q?lHhRDjgR2dSqO96g0I5xJd1f4LHacYhX8KZXWsqoobtb8ne9XH7srWXTvn?=
 =?iso-8859-1?Q?dljcfyW4UPzLowiCio2ef46OGSrIHYi3MSVZdRxBz4oLKvLEE6R/R7Ie88?=
 =?iso-8859-1?Q?clUTMLtOJjlFN6h2vFLm7cnX8b2NvzMeH5W7ro0NWC/6394MtGmnIrE7+D?=
 =?iso-8859-1?Q?MV7IDX9BWh9lnDFjkkrUz89CihcdtRQJTGjJA2kfcuwmy+582uit5PNADG?=
 =?iso-8859-1?Q?Kgh30PSvxa/cDmOhlQYerJsJCS5NKlYdSBLYi/5V9GkIOcEg8XiTzInUa9?=
 =?iso-8859-1?Q?mPU82oi+jA5ZC9WBWpUbJ9JOJX5Ko8yHNEUStUorDDbgbOJ7pX8ZWlqnmr?=
 =?iso-8859-1?Q?GR1lw19WK+q7yqoiAU6P7OaHhKsb8w20Pb2GU94dnT8Z3OKHrDUYChfeJo?=
 =?iso-8859-1?Q?mMrIqx2WLonFZ38upk/RP+CGsttV2yrI1OjGuFXB3TcBVKGAEQmByE431r?=
 =?iso-8859-1?Q?8RICUkXcPjYNPOGr/3HlT6LjNysw2kuGnvQZrsTOEbRyrZyQ1+wIU3JNqa?=
 =?iso-8859-1?Q?4MUF+5wWNGfF2TJfwXHfp1D0MvOp5Eyyob2JGBxKTco3WYuseR2tAPWrRv?=
 =?iso-8859-1?Q?w/5WSpYCMS46scXvKGxqwu07ZNenjdA0UzcKyD2fiIRnJB4RIY4BM3kCV9?=
 =?iso-8859-1?Q?AFy7SwtutmzFK2UpOZhWR5oVHINyy6i53NSfQKOrJflWTs+9g++ha+LF/c?=
 =?iso-8859-1?Q?EXDpeaFNeh7SxsAoEWAi9KsdM31NBQEevEBfZ64GIxppDZgrRdc7A2SkfK?=
 =?iso-8859-1?Q?dwkpwI7hUTLKTjXER6096ovUadEDxaoeUu5OVnCeWqZfVKleRY4FqG1yUa?=
 =?iso-8859-1?Q?aR13eNN9u5Dr5N9UzWm6VuFoqcI6/8p0v4EiR/6lxeXdA/BNz6cxUSYi+h?=
 =?iso-8859-1?Q?T3GUT9+lhT4nxfWVhWs6d071SAP6a8BLtdk0FtuXpAojdOARUMjXHTywYQ?=
 =?iso-8859-1?Q?AhiJId/OviNMUtPKpgMdUHnDJ5WnJgxbmClZSl2q2eikCiE7G0/0DZtQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78069fde-65be-4142-12e3-08de1586e8e5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 18:30:31.2876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MmhzXkcyX63vLRi80utWSbyMV57afOYNX3iSrQHgB2cDv1ZPszypOMa6Vmu+hyeQR8E8w6RwK9FSsFDBFCKo2MUOTfBwN5yXbKOluh9KBlQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7776
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

On Mon, Oct 27, 2025 at 06:59:21PM +0100, Michal Wajdeczko wrote:
>
>
>On 10/27/2025 6:11 PM, Lucas De Marchi wrote:
>> On Mon, Oct 20, 2025 at 08:24:01PM +0200, Michal Wajdeczko wrote:
>>> +static ssize_t xe_sriov_vf_attr_show(struct kobject *kobj, struct attribute *attr, char *buf)
>>> +{
>>> +    struct xe_sriov_vf_attr *vattr = to_xe_sriov_vf_attr(attr);
>>> +    struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
>>> +    struct xe_device *xe = vkobj->xe;
>>> +    unsigned int vfid = vkobj->vfid;
>>> +
>>> +    xe_sriov_pf_assert_vfid(xe, vfid);
>>> +
>>> +    if (!vattr->show) {
>>
>> nit: I don't like hiding this programmer error behind a dbg. If the perm
>> was set to read, the attribute was supposed to be defined with a show
>> method.
>
>it is not trying to hide programmer error, it is trying to protect kernel
>
>if bad admin will change perm of the attribute using chmod a+rw and then
>will try to read this we will get NPD here

humn... right, I was thinking that the show would be NULL and kobj
already checks for that. But yes, with the sysfs_ops define below we
do need it.

However samples/kobject/kset-example.c uses the following style and
return code:

         if (!attribute->show)
                 return -EIO;

         return attribute->show(foo, attribute, buf);


>
>>
>>> +static const struct kobj_type xe_sriov_dev_ktype = {
>>> +    .release = release_xe_sriov_kobj,
>>> +    .sysfs_ops = &xe_sriov_dev_sysfs_ops,
>>
>> (general comment, feel free to ignore): I wonder if we could inline the
>> ops definition since it was not supposed to be used outside.
>
>it's all static already, or I get your comment wrong?

since it's only to be used here, I was thinking on inlining the
definition like .sysfs_ops = &(struct ...){ };

let's ignore that.

>
>>
>>> +    .default_groups = xe_sriov_dev_attr_groups,
>>> +};
>>> +
>>> +static const struct kobj_type xe_sriov_vf_ktype = {
>>> +    .release = release_xe_sriov_kobj,
>>> +    .sysfs_ops = &xe_sriov_vf_sysfs_ops,
>>> +    .default_groups = xe_sriov_vf_attr_groups,
>>> +};
>>> +
>>> +static int pf_sysfs_error(struct xe_device *xe, int err, const char *what)
>>> +{
>>> +    if (IS_ENABLED(CONFIG_DRM_XE_DEBUG))
>>> +        xe_sriov_dbg(xe, "Failed to setup sysfs %s (%pe)\n", what, ERR_PTR(err));
>>> +    return err;
>>> +}
>>> +
>>> +static void action_put_kobject(void *arg)
>>> +{
>>> +    struct kobject *kobj = arg;
>>> +
>>> +    kobject_put(kobj);
>>> +}
>>> +
>>> +static int pf_setup_root(struct xe_device *xe)
>>> +{
>>> +    struct kobject *parent = &xe->drm.dev->kobj;
>>> +    struct kobject *root;
>>> +    int err;
>>> +
>>> +    root = new_xe_sriov_kobj(xe, PFID);
>>
>> Slight preference to follow the _create() name convention in xe, so this
>
>hmm, I just didn't want to break the other rule, that function name should
>start with or match the first param name ;)
>
>in this case it is a factory style, that takes xe, so started with a verb,
>also somehow matches release_xe_sriov_kobj() that takes plain kobj

ok

>
>would create_xe_sriov_kobj() work for you any better?

yes

Lucas De Marchi

>
>> would be:
>>
>>     root = xe_sriov_kobj_create(xe, PFID);
>>
>> but won't block on it.
>>
>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>thanks!
>
>>
>> thanks,
>> Lucas De Marchi
>

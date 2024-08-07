Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7398EC3DA7F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 19:09:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F91D10E1D6;
	Wed,  7 Aug 2024 19:09:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y4SLLIle";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FFD10E1D6
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 19:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723057768; x=1754593768;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=POe511uXSsxLEeYpy9t7NzP9spNJ1tY/HsIO5T1TbCA=;
 b=Y4SLLIleQeyxU6XUutchCs2sUDotlpgJnYnvHzDftmWI6CWxxLf6RnKt
 FolSbokwd2ynDnVfDOjEpGNe1msqcTHJX78LMSUHu/pOK1LhptR/k3KOU
 yG0rm96kYogzdWexansHhKQSzUAJO6IIWavLpMufoXV3bLj4kHBaW/Gkx
 YF2UQjpWcPbIip6EP6jSWaGH75tnJP/bqO/yQVL2yU7Dw2RIMMd/NT30T
 KoxzePGZOPUnIvVa5G+MD2VfdiFPYTIL5K1o82GebD49j6aYZTadcGN1f
 unh5/rOmvQD3iIHEBsevAyx3dmfyxhK9YItuSmHbvauMi9OUVFVEKn/iS g==;
X-CSE-ConnectionGUID: dF8NS5i5RnaASvf8Atzwhg==
X-CSE-MsgGUID: R/DGLG7CRjuw8umJ9wLmZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="20728493"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="20728493"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 12:09:27 -0700
X-CSE-ConnectionGUID: xXKCCw1KTsiRiel3Es7gcg==
X-CSE-MsgGUID: ayik6Z30TDeeL5YRNQ+tCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="61615900"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 12:09:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 12:09:26 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 12:09:26 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 12:09:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQHmew/MPQ0wKRZG5mPoB91lGaXr0gGQpbOKYi2eJ3hMrqpra44lsiZFG5ZF31eHgjxRub4+SrMZFtZIj+N/2nZgcc4CLgILA7H/zC0rCFR8UGNc1yDIIFll5uS0B3Ns/OpG81OEQ3J4GUNbi0uE0iIEkOQJIJCISCXxcap7j3vkoaTMMVO9dSufV/V/w5NW4XNsZD8i/MQet414EIp4loefbBR7B6Bfq95/T9GSKsvnR52W8DwrjDTuSqCEwWRRnpXj4nSw0+oe87P0m2p5f9ysHI05S/rc5t+MHL0sZ401e8jVF2IuitOufSHYeZir4bV9igCliFQA/SOvzApZvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=si6wZ1hK3xTVTtrHUtU9wejYVtvBDNMcJ+JrvsW68lo=;
 b=T4KSekq9qCEv2kR9llANbi/gFdZraaNXRJKA8os7DIUmfO+cPp5kAVGAUqki4hWG2HV7TFAJvG1IgVsruLxgk08rhjevLmVQklZ/ddzrJriHcrbHBu0qfqQdGsPoSlwus/Y/hNVuIZL24j5SJo7q+K70Ri+Mp3nHqkWOWI4TZZgn5+D5vLtXjrzUWzszebn5Y2qTA5YXeE6i2JOWGJhpd8LoAS7lzuKidxuFm1yyhveN+mVfTf8hy/RItvkOMYC785H0EVw9owJJ0GlmpIanNr/EWBIV4oqw9lBMA2clfjfVcEd3+4+BmubukVI+tyIPGoX/jpuBQFhm9aqzYUPqYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7922.namprd11.prod.outlook.com (2603:10b6:930:7b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Wed, 7 Aug
 2024 19:09:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 19:09:22 +0000
Date: Wed, 7 Aug 2024 14:09:16 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Write all slices if its mcr register
Message-ID: <722yqhnlihrgqvnejzfgjakpgfqrkvxgdsvfysjs5s2kszzd73@urxkn74fo5hu>
References: <20240731093152.51424-1-tejas.upadhyay@intel.com>
 <20240731202148.GJ2906448@mdroper-desk1.amr.corp.intel.com>
 <SJ1PR11MB62049C56A03784747EB3D44681BF2@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB62049C56A03784747EB3D44681BF2@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW2PR2101CA0005.namprd21.prod.outlook.com
 (2603:10b6:302:1::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7922:EE_
X-MS-Office365-Filtering-Correlation-Id: 02056783-71a2-4df1-7c84-08dcb71471c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OhdJI7gLjnRkLWuJHrYSqMyMY10UIpvXlTIevfUQw0iSoioUCsP7cqChDZjh?=
 =?us-ascii?Q?IouCM+Urz4CSmZluL+lpWTYlyn2x437y+PC+pZMJOhs0DX/NJARZSxUoUWUv?=
 =?us-ascii?Q?/iJAFVZWacHe7s1yS1rdFAU+69iEQyr3zWq60ay9SkSxaBWZJcfDSm/79A50?=
 =?us-ascii?Q?WLfFTGyJuY+cHbqH4F1qw8m5zBhQGc+77VplbhzhnMVp1F9JB5s8+RemFBLY?=
 =?us-ascii?Q?IdSavD0NtDii/qn/OLwcGjHd45GEBWgs9X9EcuE37O0Q3FbsTiOtzY6IGqDE?=
 =?us-ascii?Q?nZTTlMluXF8gXBoJamBqmRwcgz4kNPml+G2fA3/5yF9KpNDPMUs1jcpmqk8B?=
 =?us-ascii?Q?RjSHWJPTSyCX35QRJgAp1HbGvFa0PI3e/ijUI1VczfRJNiokIi4OZT3BxfLL?=
 =?us-ascii?Q?GImr4ntsA87RaeF+Ylc6eqb2BB3aMSXG4ZtiS0OIYACYxGmQ1g5HWSbWcdy6?=
 =?us-ascii?Q?RKfWL62RP/viRXKt7MhhK7ZYsw6UMcN0ubNhtDKZvCpLSkvAw9nOgtt/dMg5?=
 =?us-ascii?Q?1R0HexX+ATC+7vHlHxaK66F0jvW/hX87g2pOPCsl5G21SxvsDg3aW6k7JYO2?=
 =?us-ascii?Q?ffHfQdD92cQ+kIx+wW6rUm2625jr9/uuWa9YuQqGTe9ekwKFU61oqfUAGxj1?=
 =?us-ascii?Q?If3NeHxWPLzrlxaOxXOtJoBfSnio/04pWExNU5xADjojUotVMt0Z6B/JnATa?=
 =?us-ascii?Q?0erSYcTGZMu3fal8SY8V1AufbVaMc0YCWZuGRQjJPlcRpKngc/6Lhv8Z0vKb?=
 =?us-ascii?Q?+RY5s1xwcxRqU1uRrbLstbH48/OFNC6pexR5iIt8TsCOq77K4V/+sUmNNW5V?=
 =?us-ascii?Q?YvLsakLpNo2sdZ/jHzRa0vsiYXJXomkIcHE73ScZa3ps23XyQAnhkftQ4AWJ?=
 =?us-ascii?Q?o1D4Jeo6YJ9rZaEMydQdDKPuIgzrP8BN2VvOVTzK3h2r8G5dxIU184zAKL3N?=
 =?us-ascii?Q?/bnTBMmfbXE/a5FEmiazBv2PSOMcUHPXDS5eY6pWmQmj0s/p6bLjxEfdqGTC?=
 =?us-ascii?Q?6ZeQm3VanoIveTu7sAY12QZiveC//wA0NPSlaUq9/fu154Q76uQhcyVDKXtE?=
 =?us-ascii?Q?HdamVbBqM3cXC+xGbcuIbUL6v/P60sffqm1dQbunX4VJmfOlJ1i6tS0hKvHO?=
 =?us-ascii?Q?IH0Gcb9fNAjPIqYRsTCpIltfJJYX5gS6zgJUNBoybPKjTW++IOVvoTTI61je?=
 =?us-ascii?Q?9v5S5XSiRKI4GySfpnJgkWQoC5i8/qMo+7WEjmR1TdlQxSHP/YNLn1T0+Aqm?=
 =?us-ascii?Q?T973G3fBQNkH5UJw9X0c9Drhtw6tqO31V6rYfL8EreJuCJROlX7d6EM2/72i?=
 =?us-ascii?Q?0VqzKD1IjVa1HvwcWDNWldb9SovprrkwnIOSdnWgZYtpGA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mwrGj4zK70W54gQl/dcuYr1fdSqlKyycgePc75edWeiaHpNRuwrVsKO4yU9d?=
 =?us-ascii?Q?LPZ2DK903McJ2+rbLH7NLNBuIrv93br2RMubcQQWiOwZ73lsAHco2+i+zszV?=
 =?us-ascii?Q?g5IMHfbTQOPYhGiV84Yw6xz/Nu2JUjMkNHDzkiKJQQKhGORt7SNso/GnUujB?=
 =?us-ascii?Q?8wuRmWPhl2t3VGB/tjZu6fnkdM9SkQ4anFoc8uoeA0eVDnOz/dTPbiVk8H6B?=
 =?us-ascii?Q?Msr+VCz75kuw5yVQVCC0thkgjQEsJm4vErnojeSBL1iPvpAXBH47XLkjUNea?=
 =?us-ascii?Q?nFgTWs6IALnFA6e76h3nTvYiIQLQ219yD4e/nC+c0dEKNHX/dlfTdJrN560w?=
 =?us-ascii?Q?+gKIze03wjhOYVg8DUvOIcSi3E9mZ23Yy4YRpHaWYLrF2S1Gjbr9zhVyUDsv?=
 =?us-ascii?Q?dVW8ReLY/H9Ai+vw4o0CquBe7QoleHhycZvpG9ogVKKlKSeR6xxU/zheYRrP?=
 =?us-ascii?Q?uNZIDsaT0jamZQ38FTpVVjpXvFt67krccVyV8seq0MTp+fRnbfW7Hr/CGdZS?=
 =?us-ascii?Q?By5dI94jnHAd++nh+HsXJgAtukM++q5nDOZAkf4HhLWwRtEoprKN3cWY0hco?=
 =?us-ascii?Q?lF5TbkTZdd8iYb8px5DcTv2FxIFu77fDoD4H1bbk4KNsAFId7WRky0EWATzM?=
 =?us-ascii?Q?B+EpYsDhqRscarmib5As9oPMbbpWOuI/P5RKwjknRkTcrXRGxA4e2+MVuegC?=
 =?us-ascii?Q?jUK3FOJvPgJamP6HXnK1/ihy+vK/cYL9W+mTOt3wBumH6Ivb3sd/bEqx69Sc?=
 =?us-ascii?Q?xDypQh6j4xq7mx3k9r8bXOVZ5e4mJzOLC/4lyyBA7NuRpt/NyLq2z1FHzgGu?=
 =?us-ascii?Q?eRCZkyvIpQxVTs3o6EXD5y9pwsgZ5cIqBdyfkOIXgjSIZzsc79WB3qDzkerz?=
 =?us-ascii?Q?/uOF3csAaplnxP9z8RpERWJVvSilL6Q3pwJ6BquHKUEZ8U0LVV2102ujOrQO?=
 =?us-ascii?Q?UMB8Z2naDTg9zbw2v1cEqjsJoQloJd6uTOtgue2eUyyRp3Pf/V1jkKRsEYvM?=
 =?us-ascii?Q?6qoa01zLfiPcpt9O5OP1+arM3yODoes/iNBdsbB9TUc+6k8xbIMfc8y7isqR?=
 =?us-ascii?Q?qQ0DypObWTaVTCmNf4aXc2blGvA4T+VHqem6Hs2RQf5oteBjs8Xo7AxkwchB?=
 =?us-ascii?Q?BFvRv5uXFV936JsVrL7Cx/E54+SN9YUqLpOhsatC3a/vFbxjhCyUzDa0CDOs?=
 =?us-ascii?Q?tov0Pc27ANvNTU4CGgzrdYMaL8J9kYvvQ6A53qle8tUP45wYrXN2kTKK1iBd?=
 =?us-ascii?Q?NDz5+Lk7URtABU++2+wN0/dmseTVEyk51Wk02LQXkt5z79MYwAvprWLaHjyG?=
 =?us-ascii?Q?MP04OHy7cKbnT9XZXb08cxWJz19llmXcDPjt4xGP0dDs9QY3pSoHlXXcjTSk?=
 =?us-ascii?Q?r6G89qBbUWVTrpB+3K6iBOikKjwWUUixkgS6hXvHtA4cjcZ+J3Ly/vZ+yTNW?=
 =?us-ascii?Q?59W3R38Ld/W+wLjRr6c6DAHtdv1DG4A07s4dd1RQPLSzYAYfynk/IbthjpXs?=
 =?us-ascii?Q?UrkDyhHxBoi+2lvNCwJ4Riehomr582F1+eEH3IOgDRDWwb/oW5N8fTeDCrS8?=
 =?us-ascii?Q?Xiq0ZkzgSNfnNwQmW6wQhLWKa43Jl6GeI/sR8wIkim7S4F3PIsFqZsAKQBFQ?=
 =?us-ascii?Q?rQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02056783-71a2-4df1-7c84-08dcb71471c2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 19:09:22.0712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SyfGS+gQU6Jkz9lWiDrPFBiTk66+QHVsHWe7XNl60Bu5cxWnJBWd7GAp7R6p4X2g1ePFv4Nmjv64dntfBtDCxjZHzu9MehU3znJy040SXKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7922
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

On Tue, Aug 06, 2024 at 09:14:15AM GMT, Upadhyay, Tejas wrote:
>
>
>> -----Original Message-----
>> From: Roper, Matthew D <matthew.d.roper@intel.com>
>> Sent: Thursday, August 1, 2024 1:52 AM
>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
>> Cc: intel-xe@lists.freedesktop.org
>> Subject: Re: [PATCH] drm/xe: Write all slices if its mcr register
>>
>> On Wed, Jul 31, 2024 at 03:01:52PM +0530, Tejas Upadhyay wrote:
>> > Register GAMREQSTRM_CTRL should be considered mcr register which
>> > should write to all slices as per documentation.
>> >
>> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>
>> Bspec: 71185
>> Fixes: 01570b446939 ("drm/xe/bmg: implement Wa_16023588340")
>> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>>
>> > ---
>> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
>> >  drivers/gpu/drm/xe/xe_gt.c           | 8 ++++----
>> >  2 files changed, 5 insertions(+), 5 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > index 3b87f95f9ecf..b131e3171899 100644
>> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > @@ -80,7 +80,7 @@
>> >  #define   LE_CACHEABILITY_MASK			REG_GENMASK(1, 0)
>> >  #define   LE_CACHEABILITY(value)
>> 	REG_FIELD_PREP(LE_CACHEABILITY_MASK, value)
>> >
>> > -#define XE2_GAMREQSTRM_CTRL			XE_REG(0x4194)
>> > +#define XE2_GAMREQSTRM_CTRL
>> 	XE_REG_MCR(0x4194)
>> >  #define   CG_DIS_CNTLBUS			REG_BIT(6)
>> >
>> >  #define CCS_AUX_INV				XE_REG(0x4208)
>> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> > index 58895ed22f6e..c6296dc8897f 100644
>> > --- a/drivers/gpu/drm/xe/xe_gt.c
>> > +++ b/drivers/gpu/drm/xe/xe_gt.c
>> > @@ -110,9 +110,9 @@ static void xe_gt_enable_host_l2_vram(struct xe_gt
>> > *gt)
>> >
>> >  	if (!xe_gt_is_media_type(gt)) {
>> >  		xe_mmio_write32(gt, SCRATCH1LPFC,
>> EN_L3_RW_CCS_CACHE_FLUSH);
>> > -		reg = xe_mmio_read32(gt, XE2_GAMREQSTRM_CTRL);
>> > +		reg = xe_gt_mcr_unicast_read_any(gt,
>> XE2_GAMREQSTRM_CTRL);
>
>This is showing regression, mcr init is little later after this call. Should we read first slice default using  = xe_mmio_read32() or we should shuffle order of mcr_init and xe_gt_enable_host_l2_vram(). Any suggestion?

we were already calling xe_gt_mcr_multicast_write() in the end of this
function.  Although it works since we just rely on the
mcr_lock/mcr_unlock since multicast is the default, I don't think we
should call it before the xe_gt_mcr_init(). It access the hw via the
init() callbacks, but they are mostly sw-only initialization or reading
a fuse. It shouldn't have any impact on l2 vram being enabled/disabled
afaict.

so... shuffle the init and make sure we initialize
mcr before xe_gt_enable_host_l2_vram().

Lucas De Marchi

>
>Thanks,
>Tejas
>> >  		reg |= CG_DIS_CNTLBUS;
>> > -		xe_mmio_write32(gt, XE2_GAMREQSTRM_CTRL, reg);
>> > +		xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL,
>> reg);
>> >  	}
>> >
>> >  	xe_gt_mcr_multicast_write(gt, XEHPC_L3CLOS_MASK(3), 0x3); @@ -
>> 134,9
>> > +134,9 @@ static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
>> >  	if (WARN_ON(err))
>> >  		return;
>> >
>> > -	reg = xe_mmio_read32(gt, XE2_GAMREQSTRM_CTRL);
>> > +	reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
>> >  	reg &= ~CG_DIS_CNTLBUS;
>> > -	xe_mmio_write32(gt, XE2_GAMREQSTRM_CTRL, reg);
>> > +	xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
>> >
>> >  	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);  }
>> > --
>> > 2.25.1
>> >
>>
>> --
>> Matt Roper
>> Graphics Software Engineer
>> Linux GPU Platform Enablement
>> Intel Corporation

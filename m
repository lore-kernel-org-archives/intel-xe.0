Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51638D65C63
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 22:37:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03AFF10E3D2;
	Wed, 17 Dec 2025 22:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I7pru1+r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D742310E24C
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 22:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766011033; x=1797547033;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FM2STWXcwdD51Lrb09Mggqxa/ACab1Et1Z0v+AKPOrs=;
 b=I7pru1+rdUyvXnn9Ze+ZrUYbW6TblpQRDvIXWdMqDapzwdv/dGiEID1i
 v2ZBkYfJQlCLfx4M3hSBHq06WjS6RAgTaMRakyC9Uy+O8nFSUNPF3Qh1t
 //Sd3WzSEWcfhUANN8eTUuwbn3ozfRvAOYf+zpKndXUR7Vd/+O0lFtc3/
 UiAjb8iEt7ttOGPOXm6rqsY6hFpq6IBtg0n7q11gj5Ug66opALo9oyUKh
 dHcEum5AcRbJqnIGhKZV3q9iGiZmTgB3l9LgPMLUNKKwHvLHibkmYyRW9
 XoqmKfjuZoomEL27ytTfFsI4MPsoFsYNZ0/96b9/Fw3LdWBYxtWzX2mrE Q==;
X-CSE-ConnectionGUID: SmGzK2wbQQ+QST9HZc4JYg==
X-CSE-MsgGUID: buRdyEOGRSeo3VnmkNjQyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="79082997"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="79082997"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 14:37:13 -0800
X-CSE-ConnectionGUID: ABPXD0gNSq+ob1W5yFcR5Q==
X-CSE-MsgGUID: JwLzHcqYQ22ejAcgDq7FQA==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 14:37:12 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 14:37:11 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 14:37:11 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 14:37:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5e4pMihqA9UAUkJAnXZR7YznODy/GtXXcdSVrr1DSlpnG5OC4EeHJ8B5N6WaS0X9fkI1xrSxp+FNHTEXQGLTkcsCKax4jUVhRIdrLcqtsQl8Pw7U3szP7d6i/ehkXSY6hBY4ZFdWDYfsm8rL5Q05OetiQb5XImkPmpEP2WA33F1H2ufMZay37xmPCWfxy9Ru87yqfRJk7CvGz1uA1Md3f0YDXpZrHjd/99P2ZCnlK5lGNJ5RQW3kvsY1uUstobYZSbOOe9xe8VqZkxmgBUkz0ep50BAGXHkxPIPSIWqwjA36IcY69DULxBrQjepl859ZLh3FYV7Tr5As5zCUXeB0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmRq/NMjJGwbUs+OMgo9N3dbVRGBNUZI0TT2rwvvGEE=;
 b=joQte93yzTAU1zoxoBN0Wdgi7jqDfsybxNq+vQYfpL5u7rFpHN561xFSEwbIklgexSC5Q788hdLzNcAq1ynbgTkaqiDUapcchjc7JNiPNBzcWLJ3uryF8en3pOHI6BvKRaTYeo54M40R6Wdjt1Ktf+cJ4pZu8G0uoi4W/7OowYWTXOz/FmRfKcsh1a26m0yuBj3Rdw7H3L/yR5yA2IVDPZkzDJu4W+m1DWZ6xmKIM9AMwsdjoIL7BGIM+VEZmQISs895cPKBDYe4U8hIhDcpnPzoAuuM/+v0ZsdaTW5aZYmB/CIZ/i4mm/uUd4AKw+dzEkqgsz5s8SAqDyve+AR4Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH3PR11MB8546.namprd11.prod.outlook.com (2603:10b6:610:1ae::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 22:36:55 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 22:36:55 +0000
Date: Wed, 17 Dec 2025 17:36:52 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 1/3] drm/xe/oa/uapi: Expose MERT OA unit
Message-ID: <aUMwhEoQPZT-cKvo@intel.com>
References: <20251205212613.826224-1-ashutosh.dixit@intel.com>
 <20251205212613.826224-2-ashutosh.dixit@intel.com>
 <aTbJDZhEMqU8Rg62@intel.com>
 <87345k6b8q.wl-ashutosh.dixit@intel.com>
 <aTcstlSxNvhYcY6w@intel.com>
 <87tsxr8rp7.wl-ashutosh.dixit@intel.com>
 <87h5tpx65h.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87h5tpx65h.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::15) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH3PR11MB8546:EE_
X-MS-Office365-Filtering-Correlation-Id: 35c7e1d1-ca4c-4ea0-8162-08de3dbcc7ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gCnDUp2uw6ecETsxZjcrZlzVFHD5F9W1aqqPppGe31eTlzjlP78LwR3nrXze?=
 =?us-ascii?Q?vsxBJOL6TfBzY7mEGC3zHgpm3eF79QDBudbqaTYGchU0gwFzEIuz8YbKf530?=
 =?us-ascii?Q?RJXjzehgBK8S0vbfSVQX14eZppanBPIzhpP+1Q+Pl48D/HwNBYzwuiOcL09o?=
 =?us-ascii?Q?lfrfbozSKo9mBoEo4QpIh4saD5EPmh+DkedKW2Aw4NnRn2RMHxfoiTA5ZqAi?=
 =?us-ascii?Q?T5xJU/z5izYMsimOFP6xIaPHVLBaZzJyBuA5J4qtOe5zYG3giEmL5Vr3pS3+?=
 =?us-ascii?Q?QuPJC4m+Tff/w8X6M9jFuPnUhGKIfUBT7SL3aWLSf/Pvoip9+dAdBv5CmCm2?=
 =?us-ascii?Q?MTYoOOgLSEdX8hvblCF0YSkBhGjFcGIKKtBXBeTUqPFRMnQlswDQ3O+NuZP8?=
 =?us-ascii?Q?ZAhBCeq1NQPZCtXyw7C0XQDFpcBjlC8tAcDVExBb56msxCMD4ZNILeEoIFNR?=
 =?us-ascii?Q?khjlxo+SvoVfqetp7wVcnuVlj5gaLumPzZr5QDnWfZ3ll8sbHxD0mNGzPVJC?=
 =?us-ascii?Q?fGdUHdJzNR/WTCoT1Nw1Vm+dgNvNhNvecluLZf12m+lrKXf7TwJ9nI6DHj9E?=
 =?us-ascii?Q?SPW9vwFN3/KazugC3WoEhusu0+GSL1wXUkHNNZvft4xOC7h4NcR4+0eNG5VZ?=
 =?us-ascii?Q?iq4GelckOgn1C79Dr6x7bRM+ZcvbjxSlmzZ5yLsKJVJuXv+RyhRSeR+5z7MG?=
 =?us-ascii?Q?xWi1eQjXwRpdoTSUrdgBvUlGO9lvRmbL2gRq1N6HKcktfGc6CLGWiznwfIuo?=
 =?us-ascii?Q?aOFeBSrHqlnrYzxTsbdY4QlXxwpSbOzUv9b1KGoOLSIbEFVJWHBR1jhGtYE1?=
 =?us-ascii?Q?miugtW+dRWCH1i4n9sRlvB+86RGUGYekJtwa429s32qkls1S51mg1sia/ygf?=
 =?us-ascii?Q?8o3xnWj15bH2BxFXbUUXC/O+/AYgca37nLXd4A33gi3ePS0LHTRHzjq+UWeI?=
 =?us-ascii?Q?yarj/rdap2XWUBjXtH4pMPC4AVN0jFqCuZSDGELjfp0B1enA0bB4kNnwmQx6?=
 =?us-ascii?Q?+L5+CHQjT3UQVpcMZf6BkpLLOjJAIdQv8FoZTbVkbWHqArBH6hgAprgeGJm6?=
 =?us-ascii?Q?XqTxKR/B32ZKK9QnujzHiL9twEDmIuOYGpCTxBkdaqrszl5RFOczCuGi1Cpl?=
 =?us-ascii?Q?ZhiXOKRvG5oideD4s4+NeWcEXvFagsJFUKl15FJMA10CFXNolN1k/q53m6R+?=
 =?us-ascii?Q?63qCWNx/GKA7GHphKtRaxoX/sXeF79tw89shSvFzK+Dko8CKAFHXnJ6pYfkO?=
 =?us-ascii?Q?30ES4fBfXEk7DFUzcl26cMv1g9WwlWi2OU8xVOjAQOfIRz00j2Hjp6GCJM+N?=
 =?us-ascii?Q?jnemCPT4X+wfHjcu7yf0P7iTudlBvA8wIHCnBheh1FQDz8TFnMUvH1NqlGtt?=
 =?us-ascii?Q?4+hro8YnCnft4HDP2jVMz50hdSjLHj1zlEvvYevB7OIRWCRrBrftJV06pFos?=
 =?us-ascii?Q?zW9i3D9VNG5gFt/QTBHdunfzEozqpQPG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vH4SPL4fRYqMSvk3QCUGBOF6DhHweNmzif0wTp7iwNYa8hJo0XC6dvnXULRy?=
 =?us-ascii?Q?ZCY3cgZUFSNIu8hnUVC5AEl97/J6DCLmjsXpLHB3xpJKBB10Mfb1oFQSotY9?=
 =?us-ascii?Q?xvO0Hzu2WAUx/ffGBkEDw0gBKcgWREeWK6DUCtbxlpQzzpAgaRW1kRcSzwlb?=
 =?us-ascii?Q?1t49bnw8Y1X6l1ZTRC+JUOI7p/e+5Usaar20pdCTiH1icAc8TldXGMlKTNzo?=
 =?us-ascii?Q?FrFfBGsr7bXNhxYCeUGYoTRcc+huZ8BUwyFWFcgZ7Z8SH3vDSJzOJQaHFfl6?=
 =?us-ascii?Q?7FBLfhB9lBLWiPtGE+gsWKldeKSRq4M0WYgZkYdOLRrZ3t8huSi2Ip4d3aDO?=
 =?us-ascii?Q?fH072sdw42efVtXBE0GIs0yjbjBhFfWwedwPaYofYJrm7djXXMz3MsEmUQLu?=
 =?us-ascii?Q?GJZmdqjGkIPuNV75beXKt307Zid+Dd2ItcCS/BEgq7sbxobCQC1SPVbc+8bk?=
 =?us-ascii?Q?GqGn4i+ZCmy8UO6RS3ZgDWPTdfDszyGirx/HPcDam3t5QDzpAWHIHRdA1bAl?=
 =?us-ascii?Q?c6YQCFdoYwojjkOcfAVaKCo31eW5gkVouSSzPPgsJXH1WTx/TDalq6V/TRzp?=
 =?us-ascii?Q?wGhB4du37cIRRtw/3qnFpnIbLdPQRspHr9cU/asDdVC506TkfQNeYG9gCyKX?=
 =?us-ascii?Q?y7/icceUvVhG7gfgnIwZVnhL8sIfVUE0hxTL/0BE6eQJyh1utWS4QWqoXf6Y?=
 =?us-ascii?Q?hYUU/MugdpYkXMFLnW5s7AZRc3+TWTJj8iicg9tGDTr1r7Na+i743FaZAI01?=
 =?us-ascii?Q?5q6paF5HKxklR3BgGP6bkjkcaeMtFpXAKf35uMTo8MtmBVV2y+qF+KmnVP3T?=
 =?us-ascii?Q?xjF+Jz/SFQq/7IdJNPc3qZe34UHIEnJDD5PkfhxjiydeGjPcZAu5MrS5uSWD?=
 =?us-ascii?Q?bzYsoNKQraGABAM/mrUyCi7ihMWacsBQEs4vh2AC06mqMXn9eP+DwC7aHCNK?=
 =?us-ascii?Q?fLbhiHI6ZH76f40sfxsTVJESJjo73xYrs4/QIjMnmp0I7E/Um2MSYeWciEfW?=
 =?us-ascii?Q?SPtY4NGkQB+gdaOupaHJ0x3EHav9v02UrqWr7ubhF4iD6LmCT35V8Gih8D60?=
 =?us-ascii?Q?u9TaTkBWYIQaSze5O5uWgapiPOGWMBUOTvrHRav5svTmNpj+QJOdTfznLMg6?=
 =?us-ascii?Q?4RXAVZBkkF3hGAwY1oGjjl4XBwb28giwbSHRI6zR1cCCKHT0z5Xjd41ttTz+?=
 =?us-ascii?Q?4W9Ykas+8o6i/K17YNqNZQJQd+Ao95CT5JyzWA9FAez5DfWJAL49pe1u1qFo?=
 =?us-ascii?Q?GeRAXYTKYWy78CTNIGM6/Pcl2VTK+Z5b42pizMMkx2RAht31xClDDtZ9KLgE?=
 =?us-ascii?Q?hJra5hDz5KUhy7SwTP2Map8mt9tK0E1vIygPWfpJUHhASO8KMhXwWmJyGTjS?=
 =?us-ascii?Q?GdUDZBJHOnCbq6NJD8oG/cUoWZxIwrD47KyLFkXgvFQQjfMfTayLxTn4WzPj?=
 =?us-ascii?Q?+2UTziwoU3mRM2LaXdruKX+kNmclkxFpmODYRhGPlLBD1wfEOw7t2HH7euHn?=
 =?us-ascii?Q?j3+7WCwQnWkquDf2hbcnRMuvGJFGmi7CRoR0inATzGnaf7wxoB5G293/2bwi?=
 =?us-ascii?Q?u2gO1b2emEuIJYkRru97K4bggUI4yL9IVGyfaA2s?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c7e1d1-ca4c-4ea0-8162-08de3dbcc7ff
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 22:36:55.4682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FGB8xKrw7eJUvsda66k8MF6Fi4AVtQbhc6qllmo/Gr/GLMIu+e6kp/KD9jxVrV+7rUIJVLsu0Vj/9QYz95F9AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8546
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

On Tue, Dec 16, 2025 at 05:12:58PM -0800, Dixit, Ashutosh wrote:
> On Mon, 15 Dec 2025 11:34:28 -0800, Dixit, Ashutosh wrote:
> >
> > On Mon, 08 Dec 2025 11:53:26 -0800, Rodrigo Vivi wrote:
> > >
> >
> > Hi Rodrigo,
> >
> > > On Mon, Dec 08, 2025 at 11:10:13AM -0800, Dixit, Ashutosh wrote:
> > > > On Mon, 08 Dec 2025 04:48:13 -0800, Rodrigo Vivi wrote:
> > > > >
> > > >
> > > > Hi Rodrigo,
> > > >
> > > > > On Fri, Dec 05, 2025 at 01:26:11PM -0800, Ashutosh Dixit wrote:
> > > > > > A MERT OA unit is available in the SoC on some platforms. Add support
> > > > > > for this OA unit and expose it to userspace. The MERT OA unit does not
> > > > > > have any HW engines attached, but is otherwise similar to an OAM unit.
> > > > > >
> > > > > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > > > Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > > > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > > > > index 876a076fa6c0c..f520462c28643 100644
> > > > > > --- a/include/uapi/drm/xe_drm.h
> > > > > > +++ b/include/uapi/drm/xe_drm.h
> > > > > > @@ -1675,6 +1675,9 @@ enum drm_xe_oa_unit_type {
> > > > > >
> > > > > >	/** @DRM_XE_OA_UNIT_TYPE_OAM_SAG: OAM_SAG OA unit */
> > > > > >	DRM_XE_OA_UNIT_TYPE_OAM_SAG,
> > > > > > +
> > > > > > +	/** @DRM_XE_OA_UNIT_TYPE_MERT: MERT OA unit */
> > > > > > +	DRM_XE_OA_UNIT_TYPE_MERT,
> > > > >
> > > > > And who&where is the usage here?
> > > >
> > > > Sorry I just merged this.
> > >
> > > No worries, I just force pushed it out.
> > >
> > > > I will provide the MDAPI UMD pull request for
> > > > this when it is available. Hope this is ok.
> > >
> > > Let's re-merge when we see the usage out there.
> >
> > We now have a MDAPI PR for this feature:
> >
> >	https://github.com/intel/metrics-discovery/pull/37
> >
> > I am still waiting for the PR to be reviewed, it is expected to be reviewed
> > by EOW, at which point I am planning to re-merge this series (after
> > updating this email thread). MDAPI will merge their PR after the holidays.
> >
> > Hope this plan is ok.
> 
> The PR is now reviewed. I went ahead and re-merged the series. Thanks.

ack. thank you so much and sorry for the delay in the response here.

> 
> >
> > >
> > > >
> > > > This functionality (memory access counters) was part of OAG OA unit but is
> > > > now separated out into a separate OA unit on some platforms.
> > >
> > > Yeap, but any flag or anything that changes the uapi we do in the defined
> > > order:
> > >
> > > 1. both kernel and user space patches are sent out together and reviewed
> > >    in paralell.
> > > 2. kernel code is acked by user-space developers (apparently not relevant
> > >    in this case)
> > > 3. kernel patch lands first. (Here we have the user-space review already
> > >    finished and ready to get merged)
> > > 4. user space patch lands right after.
> > >
> > > Thanks,
> > > Rodrigo.
> > >
> > > >
> > > > Thanks.
> > > > --
> > > > Ashutosh

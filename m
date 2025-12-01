Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87108D116F1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 17:59:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4485E10E449;
	Mon,  1 Dec 2025 17:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XbGFwkzF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 661D310E449
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 17:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764611963; x=1796147963;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=l5CyXlFcHIEGy0TDpGHY4HKo3M+VaQyR1jjICbZeBzM=;
 b=XbGFwkzFu2eIJGgiGTvDrF8kxCGHJYCNGecjp69EPVONDfvqisSIm/CM
 KcQdWUPuavphtTTYFWbv4FXASrFG6UHx6aV3Gi+7Mpxn5fPTPDNdpf61a
 kwD8+AtH4D5YM4Eir8t8EuiG0u61g7A9pygxduAiD2U2uZqcr9bh1I+P9
 fR9V95vtPX7LZcfAvPVqF2RZtFJFdLWWk6w5ILR0GemrTQBRkCk9CluiW
 v7Kr9hHy6fZzwboaiuEnxrLH/i0KDz5AjCV1vkcveks0xHXe04/RzvWrH
 yikAq8djZVWvp7BG1zcONmoTKVQr8BKLpYuBvPCzptaTkDqjK89Kz5q36 g==;
X-CSE-ConnectionGUID: rS8eqG6OStSZ5i5SFrRF/Q==
X-CSE-MsgGUID: RPGkoJACTW2NXo+jCmrqmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="77909481"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="77909481"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 09:59:22 -0800
X-CSE-ConnectionGUID: SzFa0q24Qpqj56FvrlgyoA==
X-CSE-MsgGUID: PcVxm6UjSyyt7a+2o2wk1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="198510840"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 09:59:22 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 09:59:21 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 09:59:21 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.30) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 09:59:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uJ0mMO26X20hdwoCBnSB98+csTD1TEqCUaIHsF9c5YHSzuWGsBwJHV89zZXeFGlPf+6SwhsGmCwv41ncyfNnl0NXiDH6CtzJGoQgkuNYQwJYhdycqr0OMxsfvJpDbyyw9+jFOewp31jUhykAr6GWNleFPKSLJnE73bM8Z43WgV830q5g4kXx/MxascvuLhbQcA26BnOTd6mEJN9U7ZxMYvhXsn1VjJ1MkgUXgxgGZ2Oyr6esL0AdWFDQo5Q3drx5IflKj1SEbv4lndIGKaXdw0vtRSQS+6be1H5kDBxIZ1ie1vCZfnkDxyJzUqGJcL91rum0c1JoyKL+XZUGvp5bHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vyQci9TktRHTVFGnGLg9IIJnYrJ8sEdJ39M9WFEOvuQ=;
 b=wllQXE0zSRlM2/GuxydKVOwq4G6nMr3t/XMZ0+s9Zqz7Q9IhZFicAYODi93c5SpcCyQ33P1Qftof8oq1vUXTSxgKKRgjdcGT8IXR5zenlriVkCY8lbGSwJtmgTXytgipt9vnw80sgGI57J7bFbzzlqFihEW17pebemf9WU1ajNG5Op9JPpwQ01NrL1yeMKnDamXSMYETyznEkpTlG3twPHCGVwtrWNUqEFjhxdLLNg6SC8V2VZngTgf4mVVeoevUkJ6O+XcpF/68OMuFlMHHxfrV1CIOHrLSa0ppnjbXaTkfbhPDyudph+0BT5IE86Q0jpApqIuRukgv9qSwd3axwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH0PR11MB5781.namprd11.prod.outlook.com (2603:10b6:510:14a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 17:59:18 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 17:59:16 +0000
Date: Mon, 1 Dec 2025 12:59:13 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH v5 7/9] drm/xe/uapi: Add
 DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
Message-ID: <aS3XcVQAwWBXLA29@intel.com>
References: <20251126185952.546277-1-matthew.brost@intel.com>
 <20251126185952.546277-8-matthew.brost@intel.com>
 <1f5e8d8de449590f4ac85cf74e1feda2e1373c89.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f5e8d8de449590f4ac85cf74e1feda2e1373c89.camel@intel.com>
X-ClientProxiedBy: BY3PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::15) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH0PR11MB5781:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a1418c2-d936-4ee5-1673-08de31035807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?buU8+DJeayYOdsCGikqaQtJu6XN5WQEBhSC49iztVLd9qg/EH8EzgIqDpN?=
 =?iso-8859-1?Q?8oL9cVz9WnjXLi30yJo946qkV0BY7BjlMF48XmdjCPYorIuVnrtt3zmDur?=
 =?iso-8859-1?Q?84fZYGkVfDzeRcPno+CYJTVRb07x1YYA7KV3A5lR5yCXn9aK+YMUQiDFXq?=
 =?iso-8859-1?Q?MerS4+ldwqwQM7lDO2DBHRBm1swRtd1yMyf/nvCFS9XIJ+dII8sqThOxp7?=
 =?iso-8859-1?Q?oJAAzF3m1UzDUwMK4urDiaBSm1A7nEeNCN3IzwAc1iCI07UpLf8w8uSIRm?=
 =?iso-8859-1?Q?UbPua7RJhhrj0RcpRxSQ/g/ofPLi5NRseuFtIz+FVKs7bYiPLnZWt8K/gh?=
 =?iso-8859-1?Q?RGD/1zriPAmpm5RBQdQAaN4DyHbXCA1GVB8HYhPX+xruIMgGwGij++8pv6?=
 =?iso-8859-1?Q?kLKOihfRvCzX59dbX3S/Z5vjzZ1L3nqI+CG/kf7ezX+CA+L338MvMAsL/L?=
 =?iso-8859-1?Q?CMJMgfqtxilLCWzlyll+Og+PgVamFIFDqGcWP3Vtg77wFW82xMLA+nkyq5?=
 =?iso-8859-1?Q?NG8QDQbm3S0htRvESl0C6wNQ/qDzzbdPE5Qzn22W3QmWBbfEzN+bQJTBaN?=
 =?iso-8859-1?Q?vfgwX3SQZ2Gw1uLtiIc/kWAlammz2sEukq9/a5Qo/GPKDxzYN4p/0llQy1?=
 =?iso-8859-1?Q?xtTRwONzIcRdPvMesUVaR3XgTQx50DUS5nOqcDl1l1pi/GUlw/E41FSUHD?=
 =?iso-8859-1?Q?JbasgnguGQI47a22kV8BZ+Egbs3uhFWkptCLCj6iskikpSz44svXmNOupx?=
 =?iso-8859-1?Q?fjELUoTNNE41O/0YUAiaeVnAl3HqVnE0yb7kg5Rj9+dQ3VqDQPYI5NiC++?=
 =?iso-8859-1?Q?buLHIMUbeSuLvQLB4Nc97BZpEcNeHbsa7n8KMvqSBvBO7kuaM90V44ULLA?=
 =?iso-8859-1?Q?MkhNX5Yt7XSVBebSEs7CsD1BKijlUheHf5ecrr97d50IxOG8sFTEHYRVKh?=
 =?iso-8859-1?Q?JZ5s7riVaEnydQnzl13Dup5RzHY30TK5fut5sn7SinW+QpiSh63pwaY2V0?=
 =?iso-8859-1?Q?ZEuftH08bDR4r4sV3BZjHR5xGHacDz91IPrHmvceDTv9xS2oGZLCmv16Ax?=
 =?iso-8859-1?Q?K9Cwk7bnuXofrzUdg3nbuzRxFsnJF8HescP5ECkvqhSKjxTcu5YZHR9THS?=
 =?iso-8859-1?Q?RRB4VYOs8aIBRbrW/29QEBAoRKrtALoQlTGxHX9okjbTU/mXRgHwH1crgN?=
 =?iso-8859-1?Q?I7lYBoj/3KPAcIoBXCFhbBfhXdJaDKzgd+ZnV3WbB/l9DqhhhgqcMVvIIu?=
 =?iso-8859-1?Q?QDfpW3oWMXgFd7PUagrPH6idJiwZj3odbKreJiNdBcGcn1xgvRhlSx6UpV?=
 =?iso-8859-1?Q?7PohJ/Sig0ZprdAsD4V+87hLKm9B+E7riS/532UHJBceLBtKnX0vb58SS7?=
 =?iso-8859-1?Q?wyCmkbZ9/4GbZQZXh3Kqe+WxdNecP8x7uBqrgEhJcHiFuIDv2JYGYzHjM/?=
 =?iso-8859-1?Q?ugwqeWbj7vDuoGElVs3j0ENv6f/pEAxNqmX9cUM9ZqAHTROcznulKGJrf9?=
 =?iso-8859-1?Q?A3qP1Nb65mHg+TCLXDiT1f?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4QXZnvYWD/sZCVNDK5wv9HHllVbZCodLRPa1oocGuHbDfbN525GLSKfjid?=
 =?iso-8859-1?Q?vmW21TRMlRhsmHRWlWOrj/+veuh2j17QmPKT9S9VpggapzT6ClJEAXxKtf?=
 =?iso-8859-1?Q?LAu6PY6DN3u7g3OI8UKbMkf2FSQtNDyCZI9Erpgf9m6OukKUkwnHg7ZKjO?=
 =?iso-8859-1?Q?LcbdZT9c6QK9WwclQ5kz5b8D9eDj9/V6ibEZ/qbKa1Lztuhw31255tCBmy?=
 =?iso-8859-1?Q?Rw8+qiAsu0uqD0ZZS2W6KSRmV844WtkP/Vk1ynUpuw3qhb1u9P6opgAb0T?=
 =?iso-8859-1?Q?TnIU5/terJtO/o7+eK68nC4YS4enXI3L2kbO5365//rCSD9Y8EzHHEs+xj?=
 =?iso-8859-1?Q?sVCun3rGeKsEdhORvrQiElP5k4nbTlNAVglRcApBGvWmpIYuOvjJFqSAws?=
 =?iso-8859-1?Q?qqbAzf0jZfENND+WR35C6Q1+zrD2Q8LURKTTweXmqCPm3OSHDnwwboK1cI?=
 =?iso-8859-1?Q?b5CuLaoKkEcGLp3BW+h3jyvg+iaAN+vvRIb7FcL6Ip2z12fErHnZIh8k78?=
 =?iso-8859-1?Q?mqEB+TPqxC5djg6gWFqWgsERZRBOYG1NPT6lwql2dpT8pyOCy2uRm+aboz?=
 =?iso-8859-1?Q?rsOLnIMBUliX625JcYRHiXWm7elmUK4PdbrN30CdLm+DFi6R3qdBYHT5i1?=
 =?iso-8859-1?Q?fTTpN7ywXR0JQUQqrVQjn8/zKKgE3VeBuXgNgLgr1omRiuTIsCWsqvmTEf?=
 =?iso-8859-1?Q?11o1SrWtsxqn16gtrQ0JAwD4s+KHZH5N6qi/DqsA9PUJ7r3o5VYo/14JWC?=
 =?iso-8859-1?Q?oX0AR2JhYtDntIlEHJ9VBGjFnlWUwGZt4tZflLOIY3m02tIm/MpUz1Sm8L?=
 =?iso-8859-1?Q?w2199vHclSDZJ123ewGKU1NiAgN3ukW/pz2yg7Ik6LSctobj2Uza8BF/xT?=
 =?iso-8859-1?Q?VOTp/Vt3kqhmEQ02JQTwI5spPcYrNKyGY4bpPjR3SA5IusPuVYcSXJS2hZ?=
 =?iso-8859-1?Q?i4A3z4o384ZU7QIzFxZ8AX5OJ9Lj9NYGPEIqEHEaK+RkKUXGUKp/ANv9bH?=
 =?iso-8859-1?Q?+QAxedupV9YS8xQsha7IgJI7BEoClrSjIut5pYLMaJ80wdygEIpr1lJdQv?=
 =?iso-8859-1?Q?lJB1GeB4E/9MCEHDwzMPN8d3YBFawKQqijhKab1Whq4ht8LUrMVIKfj3ec?=
 =?iso-8859-1?Q?GBeqRjAKczYMgFe4N2PAIhBouZ+P9QqXYr5ydDJ1Bph3kUpxucyRTEfxx+?=
 =?iso-8859-1?Q?NVHdObS4xHC4UHD+WKdgxtRxHT1dMGH+KSBS/A6gmOI2ehT+veUq9xa1bG?=
 =?iso-8859-1?Q?Vg+pJy9mBdc39anTEzw6GsSzL7ZRgeJb/iw5DEoty5Mzx3GbUM7PSe9CKX?=
 =?iso-8859-1?Q?bzoNBRU3GuecpBctiF5kJIi9YzhZZzX8btXDkTXdE64MOmz8KouKmTf5Y1?=
 =?iso-8859-1?Q?I23zCit03nCvMpmgPenRgjAH2YL4p6tzLUvdRSfPIyVTZRcU6AvhRklF+t?=
 =?iso-8859-1?Q?tImKEQSagQ/OcdPqPnJbIsZ/Lv0wAsUyA4x6SAJrpNsVngU4sqblq9Zq+N?=
 =?iso-8859-1?Q?Pm8lLyueGcYUT9EGFMukiDVi7Y0n8UtKjM8uVYehQyRxqg/vWXpXaTLiVb?=
 =?iso-8859-1?Q?ZvGoQ2CX7qDgMAlZmEgkJM5NvdiBVcrxPRUmVLhggP76mWwvPlD/+6iCDY?=
 =?iso-8859-1?Q?RkywkkUpkNiLciL7cPb75+px6KQvucwqnD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a1418c2-d936-4ee5-1673-08de31035807
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 17:59:16.7010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: acrdvJ/WOiYjsPs0jzYPH4Ae4BGanWX3I1yjkszSwtLUPSayDX4ne4gxWHciADX/iVfjhBxurFyn/rvtm+tI2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5781
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

On Wed, Nov 26, 2025 at 08:44:51PM +0000, Souza, Jose wrote:
> On Wed, 2025-11-26 at 10:59 -0800, Matthew Brost wrote:
> > Add DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE which accepts a user
> > pointer
> > to populate the exec queue state so that a GPU hang can be replayed
> > via
> > a Mesa tool.
> > 
> > v2: Update the value for HANG_REPLAY_STATE flag
> > 
> 
> Acked-by: José Roberto de Souza <jose.souza@intel.com>

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> > Cc: José Roberto de Souza <jose.souza@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Carlos Santa
> > <carlos.santa@intel-corp-partner.google.com>
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > ---
> >  include/uapi/drm/xe_drm.h | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 47853659a705..37881b1eb6ba 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -210,8 +210,12 @@ struct drm_xe_ext_set_property {
> >  	/** @pad: MBZ */
> >  	__u32 pad;
> >  
> > -	/** @value: property value */
> > -	__u64 value;
> > +	union {
> > +		/** @value: property value */
> > +		__u64 value;
> > +		/** @ptr: pointer to user value */
> > +		__u64 ptr;
> > +	};
> >  
> >  	/** @reserved: Reserved */
> >  	__u64 reserved[2];
> > @@ -1292,6 +1296,7 @@ struct drm_xe_exec_queue_create {
> >  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
> >  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
> >  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
> > +#define   DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE		3
> >  	/** @extensions: Pointer to the first extension struct, if
> > any */
> >  	__u64 extensions;
> >  

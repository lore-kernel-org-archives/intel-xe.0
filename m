Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514CACA101F
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 07:59:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ECDB10E86A;
	Wed, 10 Sep 2025 07:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cz3oyaS6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157DC10E86A
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 07:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757491173; x=1789027173;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wxaMI880XcV4Z197DEuyHj6ZRKrnbLe/rI8oei9nBV0=;
 b=cz3oyaS6q77MDtf3Dyb/Ca/IxFuoDU3HwQntenqGm77TDa9tNcJuYbX9
 clTcrWc7DJLJMPgLQokzcZsHQ2lilznipZEZLHxKuw3iz2pF9JlxEQw9k
 PDMipYtZlHizRk34lh1ZY7BDk1itZ1HSm3TyyyIQqccFWeZEkVPr1Idjm
 QoITBwrQdDc7BdBRSDnteOJAMuX1sTEqJ1KrK00lLwk1ISlscM5MCP4e9
 sGFnnfvxyoqhUd27iclLXpvfeCqxND0pFjg3oBcYQYY7pQDFfXghbY8J7
 0Q1yv0lHDJTNAjMqZzKoMUZf9C2wenEFZ6xjmKJZKyK+uJdEQnqc3Stv+ g==;
X-CSE-ConnectionGUID: rvDq50yNTcWAiL8XzDQG7w==
X-CSE-MsgGUID: M/A7grRVRSqWlhVrAb3Mwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="71172214"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="71172214"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 00:59:33 -0700
X-CSE-ConnectionGUID: EaObh8/xQySImAT5JG/vlQ==
X-CSE-MsgGUID: N81zdtNhSM6d4MqgSIcVVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="196983067"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 00:59:32 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:59:32 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 00:59:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:59:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UMxnDJaoKQx3cgk5M6LwAKDHOsL/36KAPs+2gshos7tFlsBST3UJ1Al7RGDL0SDo6PCJgLBfeZ/HT/DzGXBlcjPuQhLehrZoxXrO0QglElqnukK/4bnQPASJkB/whz837kECJa0MePW8Jb/s0TEOPdM/e4Jv/GhqSB+E756t/e/Abhn2GAwYub174A/2+dEOMXPUKTwVDTOEu/eu4QFEg9keBjshs9XwOOlRdd16RjBBF5HfC53pABJ2qu4CCz3irYWHdJmw1jJMt1r5WB+Vq8mFhc2Cui/3ZNL6hXQsXVLryAuIP7ghQ6xC5qtBR2BT8jtZJIw1Mu8NKiCciZnKHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SZOG/oq9OlSSR6TNi5OLQ/uqSoknKFcqGSeJKqsd810=;
 b=v3VH0rlkYjtE/SowsD2q8lcbDwNYjtpIZSN7GspWyA3x1mH2iZk60wtcU9AuoUddovNdD+7/qhSa159lMNHtBxqYKoROq4WZBFffIvOO/X2TTu6awxxDh5PbkTIWLw8X6EF8iVHyJObapyRt8Uglps0ZJ70qkpa/A3cvwM+/IuzmuNBR++LCPyxFEbfe/bKKSc6PS31qSel2Ld2hcKDo9evYtEDzBd72mAKQG8yZCrPHU41Zhn/p2OCPW3qIQTRmc//dzNhW5en8hdIIoGHbzgxyUkizQxuU6X1s0QoAvSSdvku3OPiGsgiD1fKvvWx2F5Gsr3q5b0tza4P2HneFVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH0PR11MB7633.namprd11.prod.outlook.com (2603:10b6:510:26c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 07:59:24 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 07:59:24 +0000
Date: Wed, 10 Sep 2025 09:59:16 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>
Subject: Re: [RFC 2/2] drm/xe/gt_pagefault: Add tracepoints when handing page
 faults
Message-ID: <aMEvyD-j1_99SUMH@fdugast-desk>
References: <20250909150437.986365-1-francois.dugast@intel.com>
 <20250909150437.986365-3-francois.dugast@intel.com>
 <8fd9e885a3b8cbaa422ff7825fa93c8083aa36c8.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8fd9e885a3b8cbaa422ff7825fa93c8083aa36c8.camel@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: VIYP296CA0006.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::11) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH0PR11MB7633:EE_
X-MS-Office365-Filtering-Correlation-Id: 45e9a583-5648-4fec-9bdc-08ddf03ff550
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ASgPFx8axS7Jo89OVRd0pV5hMHxK6yzhK7GoLns0njhiGXYeyx0s8xzUVj?=
 =?iso-8859-1?Q?TEeHe/T25+vJRy+fGcXXRo1A7ttW9QurD61b1rkQf9NmH8w/TC6RZZX/cY?=
 =?iso-8859-1?Q?+nJA/VOAi+vNhybmruD0VYrtyTC3jujuLJRGSJZFSWYvR/TYdeGqyCkclL?=
 =?iso-8859-1?Q?Zh6NWcfstIQJVCgg+CioiOExnYTx+WK9tCjUM+YuLtbSeu5t5auufuo1Om?=
 =?iso-8859-1?Q?gpxgNzslI4tKPbKr3brWP1ujEDlQgFVDxscvfBe5LPn5GErypUUiz6/VuP?=
 =?iso-8859-1?Q?JpozWDLNu9g6MpxiTror54qjtYnHWF8iohYscoS9uYq7/KksoF1jqtG9pY?=
 =?iso-8859-1?Q?M8Yu+7B0+w+BgR4u4esjwMjD7IRqb5Gjk7GQcuSazzUqWy+WyzvtCavHxG?=
 =?iso-8859-1?Q?PAX3bebZMFVCZGgirVP5c+AEGK2UHMRhxSuou2YMSwihsvgHAUE3Zhlx5d?=
 =?iso-8859-1?Q?O+iDykfM2Oic2+ZxpFr3LSlRhwLhl5QlCpXsuwU4OKBDk7dmh/mAo6xCAT?=
 =?iso-8859-1?Q?m4FT8FHjmOV0VSqQkcL7KslUFeQy7xJmRBEDLOQG/bdJITK0PifAUnSdRk?=
 =?iso-8859-1?Q?fLUSpBWwG+eX6sQx0FnX9LxWOjgjU2RaOzTqxVzcJs3MMbQ9HUZ67tzkZo?=
 =?iso-8859-1?Q?bp7rhU9WY4f0h7PbzvAnDyxlqvwUHMgTobR7THm7IwYGVMroxcMragPOzL?=
 =?iso-8859-1?Q?rFS6ikTMFgrMvsnJc06RVE1kBOjT9WwaZ8HGllegzFyO9sIofcsFOaBooT?=
 =?iso-8859-1?Q?YMSXBmoubzYiTG5d/S+XXM+uEmkjqQ3pt00gcKzoNGkID3OV7E0lhl8PLp?=
 =?iso-8859-1?Q?St9Saoa0iszslCZuxE6NsEQo1LwVyjEi/RCy1gUBGicrfFPfTHI1PoiwMP?=
 =?iso-8859-1?Q?rp5eR3pa1hsDMKFV5LLxryUp3BP1MIXvCySxK8ATiwUdVp6ulmnSo5wsyv?=
 =?iso-8859-1?Q?AlVs37Q48j3Ta7cCN8WL4qma5oP0dmoL/spwU/9t0Cx4FZxhY1NT/HPteL?=
 =?iso-8859-1?Q?gXEzDfqjwTgBCOem5Mcr/lWLXKXEMzCO/cmkhwtBg7+rE20R3LjDyXHReP?=
 =?iso-8859-1?Q?Fl9v/hCBFcS3LXxeYCLVhEB+bzvgCW1XJdc1gf4DJ15PQaoo4jVdo4uaW1?=
 =?iso-8859-1?Q?FkeiYTI+HCjeFKlmhDyTjLqv4UsXIrIoKAXbBDIBV7m6Ou9GnFfAkzdG/D?=
 =?iso-8859-1?Q?Axg9v2PwKMyE51oWhq+co0E6vEYjIpkuPyfiEWeMEMf+ByYpQstWHDeThQ?=
 =?iso-8859-1?Q?NIGpCkl8VA7Kgm18dDFMWp5oAwbDGSZAm9p5RX8KM9R+JjKN0nXhxHecpr?=
 =?iso-8859-1?Q?omNfN9Zvwx1vkFiteseiYNgUlpLWJim/YE3fmfX2ivZgJk1HSZvE+F2Fj4?=
 =?iso-8859-1?Q?DMKprwMbuC6Jyyo2Pt97IbllhSKH3sNd1z5S6qMca0H8hJJFEaiSVbsI3t?=
 =?iso-8859-1?Q?+4KLfJdQc8CfVyynC7ylAxnSJD0f3hLXyWtHHTgXsFlcMiBKX9O1laoeds?=
 =?iso-8859-1?Q?U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?KqK3YowWD8x0Y5xoYjPwk680J4qIf7vecmjLF1kPKYGz04venx6jt6WPdL?=
 =?iso-8859-1?Q?3JFHeb/Kwo9w3aaI+U7E/l9zukCevwsSJTMUz/gjjBFxlrcxDbZpy0Y6rf?=
 =?iso-8859-1?Q?KpOv7SsSDSriE9+WwWDnFZQjC4nJJGcmfarTpFbusYM6FWZj2gpUA/m4zC?=
 =?iso-8859-1?Q?NhekKpKZ9QUZMRg0kajR6KfGyiGMS49Fc5FvMYLELYfPqBl4tdRktjeB7e?=
 =?iso-8859-1?Q?WkoUOB8+Jdo7uSqTtDiyOeEhY2BHV+itNFe4+xbOx5niNldSzel/geiGJG?=
 =?iso-8859-1?Q?ZEMb8aWyw9Jod1eD4D8NCxDadym5drT8Za1QA3u3kmjE1TE7eRRbSf9W6v?=
 =?iso-8859-1?Q?yj/YjWVYlOZwWQ+Cpprlq5HBgkq/HpQhF42/I/G3blKIcPs8qd+NlFD2iu?=
 =?iso-8859-1?Q?fmdR9Ryll/wjPBQxtoKjyEKgcmXzf4fVtFyhV48V+/Ki7aboZHqtLbWesA?=
 =?iso-8859-1?Q?QMOca25Q/1w1/nrmzMHPhs8y8uTYzgvL+pLU6q2JkMtPTt8itUawZglC4j?=
 =?iso-8859-1?Q?OVXFbggdZ3rdv0RZkTCl6VcNyCxooqrcp2U3UQxkI9xLRyxxr+0VbahafM?=
 =?iso-8859-1?Q?+gVet67KPQeaLtnoKk97/96AcW1cBL0Ih5VNXlQ2QE/CrA43x1/7or2BcW?=
 =?iso-8859-1?Q?T8Bufc/vr3rDWbdI3vEomC8hJw5w4pY/QxX4HHlFpgrL4870rxdfhdLmBl?=
 =?iso-8859-1?Q?ybuJBJLmmPXA6UBTl2MCaAdPrd777AXFaM4My2tE6d/iHpvppBtuDT7tjr?=
 =?iso-8859-1?Q?roSeXSwBlU3Vc/yqZXbqqxnyEyX4IoVpjj7z75QHSwA/qVoklBGPpVnTdz?=
 =?iso-8859-1?Q?h23VZLSf6fFR/hH26Y/AsaD7K5up3706mIDmaSNTaL3QtBghoLJWGl1H0t?=
 =?iso-8859-1?Q?tc/fC7BtZPg0lbgtGDiPiFbt7jWRiK8r4W+DTsBTi1t3W6+JEjEjcKjKok?=
 =?iso-8859-1?Q?IrfAM8kY0A9cNF3BFP+DHX/Q2pZaDluSdoXRxCY0Q/Vrsif81IMahUMF/z?=
 =?iso-8859-1?Q?qoxW3W8w46Y0EcxOgh2VS8xtX/SJL/V3MDgULmoFbiA9LCEusArYHdbdae?=
 =?iso-8859-1?Q?e14rEmr60ZI0B+A4sK+7jeZNk8e/aSYT0Fz29wxV7JvpAojfYQ6rCBF8P4?=
 =?iso-8859-1?Q?rpQCRiV6n1IDsxwWR5ydZaDgRMOAeuE8XWrr6m+0A8DD2l+5v+Rgeqaw7+?=
 =?iso-8859-1?Q?QJ+sd5aZi/NU5j3Wfmqyv53fh092Hsqyb0GQ3vrEyVfOS8JBz+5n8y0bcf?=
 =?iso-8859-1?Q?EDqqn0aHShBfPGdDDY2UpySyjvIVHs0Tmj/6dCp/f1ZfUlMnXAxi+Y6W0Q?=
 =?iso-8859-1?Q?VAkxuVa5/NmGZTLeoMDY3GE4lQpikaAPY5MoS/xE/vD1Em7lgRCuw9vEuW?=
 =?iso-8859-1?Q?/RNsbg1RPhDsXuJJEC3GD+i5Ibk3JZo374YFxbbVY05Buf2yoBmZSncSxF?=
 =?iso-8859-1?Q?UW++ScXW8OOIs06Fn1Un5eSYhuUZ0aR5skE7jUS8PIXw5Bc4tzRYb0zma4?=
 =?iso-8859-1?Q?xJXCR+0M70nSL05wdrZti97uWQO8TlUbFqDnGSLXrrLg8bpLcwZibW63BF?=
 =?iso-8859-1?Q?mgfRQj82E8ALId/0FBAqDDrdbKjYqELKwucqefTcS1+nChy1pLXO8hqMaO?=
 =?iso-8859-1?Q?7VXLTPziI34o/aQBS1MwR7nbyQiGf8N3IYTrF8QeOjpecRK/xhba1nFA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45e9a583-5648-4fec-9bdc-08ddf03ff550
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:59:24.7634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OHZvfsmVB42kvrg1x1ynEclSAbYrHMeVPKTNV6tg2jqqD7IHLZ7KjSWli/McZYgJdRRXc8DGoWaNsnO3/dK22F3Msp1jRnvLeGD+1MxnfGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7633
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

On Tue, Sep 09, 2025 at 09:08:03PM +0200, Summers, Stuart wrote:
> On Tue, 2025-09-09 at 17:03 +0200, Francois Dugast wrote:
> > Add a new tracepoints when handling VMA and SVM page faults.
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_pagefault.c       | 22 ++++--------
> >  drivers/gpu/drm/xe/xe_gt_pagefault_types.h | 25 ++++++++++++++
> >  drivers/gpu/drm/xe/xe_trace.h              | 40
> > ++++++++++++++++++++++
> >  3 files changed, 71 insertions(+), 16 deletions(-)
> >  create mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault_types.h
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > index d02d22fb3659..50836df79950 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -20,24 +20,11 @@
> >  #include "xe_guc_ct.h"
> >  #include "xe_migrate.h"
> >  #include "xe_svm.h"
> > +#include "xe_trace.h"
> >  #include "xe_trace_bo.h"
> >  #include "xe_vm.h"
> >  #include "xe_vram_types.h"
> >  
> > -struct pagefault {
> > -       u64 page_addr;
> > -       u32 asid;
> > -       u16 pdata;
> > -       u8 vfid;
> > -       u8 access_type;
> > -       u8 fault_type;
> > -       u8 fault_level;
> > -       u8 engine_class;
> > -       u8 engine_instance;
> > -       u8 fault_unsuccessful;
> > -       bool trva_fault;
> > -};
> 
> I'd rather wait to add this on top of the page fault series Matt has on
> the list.

Yes, absolutely.

> 
> > -
> >  enum access_type {
> >         ACCESS_TYPE_READ = 0,
> >         ACCESS_TYPE_WRITE = 1,
> > @@ -209,11 +196,14 @@ static int handle_pagefault(struct xe_gt *gt,
> > struct pagefault *pf)
> >  
> >         atomic = access_is_atomic(pf->access_type);
> >  
> > -       if (xe_vma_is_cpu_addr_mirror(vma))
> > +       if (xe_vma_is_cpu_addr_mirror(vma)) {
> > +               trace_xe_handle_svm_pagefault(xe, pf);
> 
> Can you add this directly into the xe_svm_handle_pagefault routine
> instead of in the outer layer here?

Yes but I would favor the other approach you are suggesting below.

> 
> >                 err = xe_svm_handle_pagefault(vm, vma, gt,
> >                                               pf->page_addr, atomic);
> > -       else
> > +       } else {
> > +               trace_xe_handle_vma_pagefault(xe, pf);
> >                 err = handle_vma_pagefault(gt, vma, atomic);
> > +       }
> >  
> >  unlock_vm:
> >         if (!err)
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault_types.h
> > b/drivers/gpu/drm/xe/xe_gt_pagefault_types.h
> > new file mode 100644
> > index 000000000000..431b1469d79b
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault_types.h
> > @@ -0,0 +1,25 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_GT_PAGEFAULT_TYPES_H_
> > +#define _XE_GT_PAGEFAULT_TYPES_H_
> > +
> > +#include <linux/types.h>
> > +
> > +struct pagefault {
> > +       u64 page_addr;
> > +       u32 asid;
> > +       u16 pdata;
> > +       u8 vfid;
> > +       u8 access_type;
> > +       u8 fault_type;
> > +       u8 fault_level;
> > +       u8 engine_class;
> > +       u8 engine_instance;
> > +       u8 fault_unsuccessful;
> > +       bool trva_fault;
> > +};
> > +
> > +#endif /* _XE_GT_PAGEFAULT_TYPES_ */
> > diff --git a/drivers/gpu/drm/xe/xe_trace.h
> > b/drivers/gpu/drm/xe/xe_trace.h
> > index b9f59651771e..8587982e7eee 100644
> > --- a/drivers/gpu/drm/xe/xe_trace.h
> > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > @@ -14,8 +14,10 @@
> >  
> >  #include "xe_exec_queue_types.h"
> >  #include "xe_gpu_scheduler_types.h"
> > +#include "xe_gt_pagefault_types.h"
> >  #include "xe_gt_types.h"
> >  #include "xe_guc_exec_queue_types.h"
> > +#include "xe_hw_engine.h"
> >  #include "xe_migrate_types.h"
> >  #include "xe_sched_job.h"
> >  #include "xe_tlb_inval_types.h"
> > @@ -473,6 +475,44 @@ DEFINE_EVENT(xe_migrate, xe_migrate_vram,
> >              TP_ARGS(xe, len, vram_addr, dir)
> >  );
> >  
> > +DECLARE_EVENT_CLASS(xe_pagefault,
> > +                   TP_PROTO(struct xe_device *xe, struct pagefault
> > *pf),
> > +                   TP_ARGS(xe, pf),
> > +
> > +                   TP_STRUCT__entry(
> > +                           __string(dev, __dev_name_xe(xe))
> > +                           __field(u64, page_addr)
> > +                           __field(u8, fault_type)
> > +                           __field(u8, access_type)
> > +                           __field(u8, fault_level)
> > +                           __field(u8, engine_class)
> > +                           __field(u8, engine_instance)
> 
> Also this information is more pagefault specific and not really to SVM
> specifically. Instead of moving to xe_svm.c, you could just put this
> outside of the svm if condition above to cover all cases.

Sure, will do.

> 
> > +                           ),
> > +
> > +                   TP_fast_assign(
> > +                           __assign_str(dev);
> > +                           __entry->page_addr = pf->page_addr;
> 
> And yeah something about the VM we found would also be interesting
> here.

Alright, any info in particular? asid and gpusvm?

> 
> > +                           ),
> > +
> > +                   TP_printk("dev=%s addr=%llx fault_type=%d
> > access_type=%d fault_level=%d engine_class=%d %s engine_instance=%d",
> > +                             __get_str(dev), __entry->page_addr,
> > +                             __entry->fault_type, __entry-
> > >access_type,
> > +                             __entry->fault_level, __entry-
> > >engine_class,
> > +                             xe_hw_engine_class_to_str(
> > +                                     __entry->engine_class),
> > +                             __entry->engine_instance)
> > +);
> > +
> > +DEFINE_EVENT(xe_pagefault, xe_handle_vma_pagefault,
> > +            TP_PROTO(struct xe_device *xe, struct pagefault *pf),
> > +            TP_ARGS(xe, pf)
> > +);
> > +
> > +DEFINE_EVENT(xe_pagefault, xe_handle_svm_pagefault,
> > +            TP_PROTO(struct xe_device *xe, struct pagefault *pf),
> > +            TP_ARGS(xe, pf)
> 
> Yeah I just don't see why we need both of these from your patch, other
> than just to tell whether the cpu mirror support is set.

Yes, will do in v2.

Thanks,
Francois

> 
> Thanks,
> Stuart
> 
> > +);
> > +
> >  #endif
> >  
> >  /* This part must be outside protection */
> 

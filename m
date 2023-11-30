Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB92C4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 22:45:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B0E10E060;
	Thu, 30 Nov 2023 22:45:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8424110E062
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 22:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701384348; x=1732920348;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UMWCBNWpg0cbnprlwrNnYr/uWgjBP/5MNNxgGc/4OK8=;
 b=bdvPu4GttSapsuwX4LKgNPjMwHbamCXFiyr+Dte7pEwYQZF0edTI9iSs
 UxRcs8YdP2kL3AoDRHYPZvcqdM/jJ6E6qnhh7SROq3HIv9zskO4nEXhLa
 iZDVuizbjWJO0dk6P/xfn6WZV+orFJlBBLY1FvFx9imRIj5+AxDaz9uk8
 EhGKjjZ+3A0F5S5JVUHSHy3LZs3ZOhWiJ7b0Y8bl9zFvs4oUuJBwAvs/b
 2fyEiIA5bTwaDhZNSlSiKvWiAsYP2DLGugaVozHzPIepms6qABEXnUj6y
 HqFy6KLj58hOZfToCRqYkPz5O7pYR7bWG5Vt1u+RCexHEohlDw51gEM9m Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="14953150"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="14953150"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 14:45:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="892971125"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="892971125"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Nov 2023 14:45:15 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 14:45:15 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 14:45:15 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 14:45:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b7nSYd8zSnwrFDAjh4j1w3aXvzXGF5e778QJkvPfZj4YTXVpk1delSfcT1oMOOWgfyxHAW2TDxj2VDh7vDD517kBqCnkXfCoLetKXG/8KO/z4FHQLZE/bqPZ1pkibxqhzux+Aby+lrjtzNockZu500m8cUmThm9jgByA1Gz0Q9Nuta7KLBAlQITsFqVTh5nt4Rb3uW16EiKvi5m1cPnL5GdwP+lIK+I+tY76FBccvMTYlMGE8ekwmaV0n1JmXULOB1HdcWYy5N5QPtX0X7/MLFuppAgpYuDyxuhO6e067fzEUlHplI6VEK1ojN3vrWy6AYqjzU37Egf9wqrMqxibCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+MgZrKGzjNx5c8Ghq6jJe1oRZ3eqyhmvs5IU1+5yn6Y=;
 b=AUrKnzzrQEdBpVvX4BUVeoc15o/rAqvI/41vZF3jSD2lfJ+dpPnCYfzWHH3yybvpaEMmcALTl082YAKHLE0Z2i4jmFDILANvETfBuUk2PBraoUNhKuX/mZndR7cMKkrNqXnOQBj1JRZxVaqLPQa9E3QzTBaHrfsm0T3D6VD/ojh5Y60tt0S3PZ7Yi5bez2gJk/fVxECRzjqWUv/6M4axjq7p6ZpHtacQ76v6/3nSdXF7iKRkysOvc3iKuxR7G5NFsiddw5ASDF1nrnn2v4qX0sxv7nzUij9zi9tZ6GJle0DmBO7lfR+aXCpWlxd7s0GCVIUHQI+Ys3hXEr8xiFXY5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY5PR11MB6486.namprd11.prod.outlook.com (2603:10b6:930:32::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 22:45:05 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 22:45:05 +0000
Date: Thu, 30 Nov 2023 14:45:03 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20231130224503.GB1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231128151333.4068550-1-tejas.upadhyay@intel.com>
 <20231128151333.4068550-3-tejas.upadhyay@intel.com>
 <80cd47a5-f157-4847-8242-df842c2e2aec@intel.com>
 <SJ1PR11MB62045C5257D79A6B5E47CCCF8183A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <ZWj_dpyE75C_Ippr@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZWj_dpyE75C_Ippr@intel.com>
X-ClientProxiedBy: BYAPR07CA0108.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::49) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY5PR11MB6486:EE_
X-MS-Office365-Filtering-Correlation-Id: 71935e34-0fc7-451f-4953-08dbf1f5ff37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LuwdR1ID8jvwRrxzgLYXtbbLT5tsunV1qqczAvso64lTqJmN/aYZ57K8Q4xDZlZDBMyDuKqQ8uUpeqldXbw1ykY/CEjRIfaJt8FpzoNjdkicAXmWm6i6wvwF2gKZva1gVrWihhn43O+ZTteSZGh9XupYE1QhqfZzoA7ZF75SPJHnEcx7iXp1sC05kNm1DfevHA9c0+6Nz3y5oIXLydzhzNs4R0k6GKscBev8LcNqU4tRgT9SIglIYCwXq6O4RI2V9mGX51nnomAiVd+AM4Xq53nbOZCEeWlzpWkPxW5SS+S6IG+J4Wq8n+ECqPdKdBMa3PGBsoCzDfMoAtL/jn6aX+sR1zPulclRlUeRMPqSslAoxrj5ZTFlvJusMQgr/QA9OMJRHKkwbaL8IDOkRQX7CQuRVF730nXiAg+ynXQ86A58n4lN8iEuARak6yInrqB79EaXZk+Yg5n6SPUpk8+XrK/j/ZwiEjG5J4e4xvTlRn9uoyJG9sV175urMp2FXdxvwP5y/6nr9kg7hUh0BaUYDzSHcHbvzd+zj0vV/mwfyLSQEeKeX2yBbVIR5L8V57OQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(396003)(366004)(39860400002)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(66899024)(86362001)(66476007)(66946007)(6636002)(82960400001)(33656002)(38100700002)(54906003)(1076003)(83380400001)(26005)(6506007)(6512007)(53546011)(2906002)(316002)(66556008)(4326008)(8936002)(8676002)(6862004)(5660300002)(478600001)(6486002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PxR764kFjZ1JJjVOyxra3oP4+aNBM4xNYb0FJrEnlP6Ase+FzQdqBzniOp5R?=
 =?us-ascii?Q?qGTcZ4q6AyvA4dSTNw9xWiNsVFA7mz6i0lJUoubQ/hVtD6syVnLj29MKjO5S?=
 =?us-ascii?Q?f1dPN/H3pTMoPkRtsgQBf2rdfIqDndioGHCIyRPVI8XBtCZDOIAGQNMUuot3?=
 =?us-ascii?Q?ebSo6BdSprVC6Ky9lkOhB5D9xEUwh5dh+SPCY3FdyWqsNU5MbTIkOxWCn+Ih?=
 =?us-ascii?Q?7O2oyECcehCyGs3oiDO1t0AUzKQCcmxzAaMUBLVGCUO43aBz9P+y/nthU2TC?=
 =?us-ascii?Q?4qow6dBofrr9pmu2QS2txTYl82UO3doz+gpFZ+z2VV57LCk6cqFfl/YDz8Ss?=
 =?us-ascii?Q?RoLTWiSFOuYtbX0y8ocCepCWGR858QqdQvHAxxRb39WX57A4J/ejKB/5Q1DZ?=
 =?us-ascii?Q?KkqfNkTjoMgi927jpBCswsllJBCDmvfEVgX/93KJjGpTIQwP0Q0ImGWyQACx?=
 =?us-ascii?Q?9EOLZJQp+e2SaiC0VN6iKJLccCiuxL0CYGJmXExhPbd4A1kiJbKGpLKtxMFS?=
 =?us-ascii?Q?ii39PD/iJc7wZ5fPizCkhS8kTavXIf+fk6MT6N7auhXz0UCLwoYCglotXz4B?=
 =?us-ascii?Q?0UFXqACKyRXnp/R0BdfUqsn7FtP+JhggJzjdXQAvbyFW/+LeLv8Uu/Q5d1Pp?=
 =?us-ascii?Q?/GVt/AVpK6BBiER32Czdaha8735yT+nS6n0Qnp7vWd9GjYI5RF1wgojtpfpe?=
 =?us-ascii?Q?+Q1ucJdxPsc7HYsrx4926g8N+rX0ifMvAR0tsG2CRmdpCsJbVH7qif5BXU17?=
 =?us-ascii?Q?O/Hx1V9vVyLJh4K8VY1iy9dtgq5hI21eBCdvOMy4xET6fL7/jMdTA5Uii9mP?=
 =?us-ascii?Q?MtEjgzWiL8TvwYwcVm1BM9klRFTE80awbCc9zNq/hezCWZe2boiA8M3k81OZ?=
 =?us-ascii?Q?6MpvevdQKyW6HNBMyVrQNESP0ZxEQzwpUfZCyTn1fHP7MZj5oO1USwTfCIgE?=
 =?us-ascii?Q?i8O11c8vJAz+KmjocXVYh/njm8mv7weCSf4XGbjOPXj40IhXBSV3B8rbZxw5?=
 =?us-ascii?Q?5nB+zlVgtl1ibUECU/Ghp+chg3yKFsZqjVkmEQQV0L/YD2Qm+nynLAnfG1eH?=
 =?us-ascii?Q?y2hpT+rRwETuRU+ALmPMf0T0onm/zypUga4oUmUCRjnDA7ZZ5l+otxmOdJvf?=
 =?us-ascii?Q?abNmpn4NtSbYh7We5lZfSnJDAM05nu0upRXIyMiApxIxfjz7alLG00zleJu5?=
 =?us-ascii?Q?cnqGwDw/T3RoeF2eippfmJV990C48eO3tbvcn1SA2wAEmWusPe158d5oiF9C?=
 =?us-ascii?Q?yBjuAwM3ymoSA1VllDCpRiui26l9+cY2njzjFFUd37xAXbktncrZq8VzMDeX?=
 =?us-ascii?Q?i8KbQieH0lhKc2P0ra7rpPtI9kYohOoDyHkTINk+ym/LITT7beA+xLW8gMvu?=
 =?us-ascii?Q?ARHip8DuCHRrRcVwNaA895ezN7ZPoqbV4oOAvdCRKhT9h/j7b1+nWvsvilEG?=
 =?us-ascii?Q?GZJuTKataZpGJFBvyQkVq8HhxpXywIXttEgCEOwjEe3l6soQjHkmCE/Hmhxm?=
 =?us-ascii?Q?OTJoRbUe2uXk6NE2GOIt9xCj3/2oc/M7eBfUNDsRtwY6U2AkQcVxOwpzaish?=
 =?us-ascii?Q?DpS1Yre9tf1kJcV1GLTiiMySIWiiOHo7BZ6FXEuEwa64Zf0XHx8o8Rk1GSEQ?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71935e34-0fc7-451f-4953-08dbf1f5ff37
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 22:45:05.5645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NTUXsJ6Cesb1rQIdxhXc+9XHAXzAIf4KZepWtYbSzGYsUxYIancXfNyD/LzZ8tVWNr35YKd6mWy0BswS+Ef77LXBi2eFfkHJg6hp41GUpic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6486
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V3 2/3] drm/xe/ats-m: Expose uid for ATS-M
 via sysfs
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Nov 30, 2023 at 04:32:38PM -0500, Rodrigo Vivi wrote:
> On Wed, Nov 29, 2023 at 12:00:39AM -0500, Upadhyay, Tejas wrote:
> > 
> > 
> > > -----Original Message-----
> > > From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
> > > Sent: Tuesday, November 28, 2023 10:31 PM
> > > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > > xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > Subject: Re: [Intel-xe] [PATCH V3 2/3] drm/xe/ats-m: Expose uid for ATS-M via
> > > sysfs
> > > 
> > > 
> > > 
> > > On 28.11.2023 16:13, Tejas Upadhyay wrote:
> > > > On ATS-M CSC firmware calculated unique device id(uid) can be read
> > > > from defined registers. Only ATS-M has this way of reading uid. Also
> > > > ATS-M customer require this solution to locate and name their devices
> > > > effectively.
> > > >
> > > > Consumer of csc uid is level0 sysman and end users using sysman.
> > > 
> > > is this generic UID or UID only specific to CSC firmware ?
> > > if former then maybe just name it as "uid" or "uuid" ?
> > > 
> > > >
> > > > This patch exports uid to the userspace via sysfs.
> > > 
> > > as this defines uabi, shouldn't this series go over dri-devel ?
> > > 
> > > + @Rodrigo
> 
> The biggest problem that I see here is actually the justification.
> It doesn't matter which wrapper are using our sysfs or not.
> 
> A better commit message would be something like:
> 
> In case of multiple similar dgfx cards plugged to the same node, the
> user cannot rely on DRM card number nor on PCI address to identify
> which exact part it is operating at since these numbers can change
> upon order enumeration. In the case of FW flashing or other cases
> where the admin might know specifically which device it is accessing,
> it needs to have an unique identifier number. To solve this case,
> CSC FW provides an unique number that can be query. Let's expose this
> number in the sysfs to make the device clearly identifiable.
> 
> > > 
> > > > For example, uid can be read by:
> > > > cat /sys/class/drm/cardX/device/csc_uid
> > > 
> > > as this is more Xe driver extension then maybe
> > > 
> > > /sys/bus/pci/drivers/xe/<BDF>/uuid
> > > 
> > > >
> > > > V2(Michal):
> > > >   - Make separate patch for csc uid capability
> > > >   - Use %#llx for 0x
> > > >   - Dump error value when sysfs creation fails
> > > >   - Have consistency in csc uid name
> > > >
> > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/regs/xe_regs.h    |  3 +++
> > > >  drivers/gpu/drm/xe/xe_device.c       | 11 +++++++++++
> > > >  drivers/gpu/drm/xe/xe_device_sysfs.c | 21 +++++++++++++++++++++
> > > > drivers/gpu/drm/xe/xe_device_types.h |  2 ++
> > > >  4 files changed, 37 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h
> > > > b/drivers/gpu/drm/xe/regs/xe_regs.h
> > > > index ec9372aa739f..3599c7b38b61 100644
> > > > --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> > > > +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> > > > @@ -71,6 +71,9 @@
> > > >  #define XEHP_CLOCK_GATE_DIS			XE_REG(0x101014)
> > > >  #define   SGSI_SIDECLK_DIS			REG_BIT(17)
> > > >
> > > > +#define DEVUID_LWORD				XE_REG(0x102008)
> > > > +#define DEVUID_HWORD				XE_REG(0x10200C)
> > > 
> > > Bspec uses different names .. and LWORD/HWORD look strange but since it's
> > > for SW use then maybe at least (assuming ATSM is XEHP):
> > > 
> > > #define XEHP_DEVUID_LDW				XE_REG(0x102008)
> > > #define XEHP_DEVUID_UDW				XE_REG(0x10200C)
> > > 
> > > > +
> > > >  #define GGC					XE_REG(0x108040)
> > > >  #define   GMS_MASK				REG_GENMASK(15, 8)
> > > >  #define   GGMS_MASK				REG_GENMASK(7, 6)
> > > > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > > > b/drivers/gpu/drm/xe/xe_device.c index d60379d844d2..b54635d512d6
> > > > 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > > @@ -355,6 +355,15 @@ static void xe_device_sanitize(struct drm_device
> > > *drm, void *arg)
> > > >  		xe_gt_sanitize(gt);
> > > >  }
> > > >
> > > > +static void xe_read_csc_uid(struct xe_device *xe) {
> > > > +	if (xe->info.has_csc_uid) {
> > > > +		struct xe_gt *mmio = xe_root_mmio_gt(xe);
> > > > +
> > > > +		xe->info.csc_uid  = xe_mmio_read64_2x32(mmio,
> > > DEVUID_LWORD);
> > > > +	}
> > > > +}
> > > > +
> > > >  int xe_device_probe(struct xe_device *xe)  {
> > > >  	struct xe_tile *tile;
> > > > @@ -379,6 +388,8 @@ int xe_device_probe(struct xe_device *xe)
> > > >  	if (err)
> > > >  		return err;
> > > >
> > > > +	xe_read_csc_uid(xe);
> > > > +
> > > >  	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
> > > >  	if (err)
> > > >  		return err;
> > > > diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > > b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > > index 99113a5a2b84..4fbf0275d3bf 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > > +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > > @@ -65,11 +65,24 @@ vram_d3cold_threshold_store(struct device *dev,
> > > > struct device_attribute *attr,
> > > >
> > > >  static DEVICE_ATTR_RW(vram_d3cold_threshold);
> > > >
> > > > +static ssize_t csc_uid_show(struct device *dev,
> > > > +			    struct device_attribute *attr,
> > > > +			    char *buf)
> > > > +{
> > > > +	struct pci_dev *pdev = to_pci_dev(dev);
> > > > +	struct xe_device *xe = pdev_to_xe_device(pdev);
> > > > +
> > > > +	return sysfs_emit(buf, "%#llx\n", xe->info.csc_uid);
> > > 
> > > if there are no plans to use this value in driver then maybe just read it here as
> > > it was already suggested by Lucas
> > 
> > Why to wake GT on every sysfs read and read those registers? Does not look correct in my POV.
> 
> Why not to wake? it shouldn't be a query that user is doing every time right?
> 
> > 
> > Thanks,
> > Tejas
> > > 
> > > > +}
> > > > +
> > > > +static DEVICE_ATTR_RO(csc_uid);

Are there usecases that require this to be readable by unprivileged
userspace?  If it's something that's only going to get used by the admin
for the examples Rodrigo gave, wouldn't it be better to use
DEVICE_ATTR_ADMIN_RO so that random untrusted software can't easily use
it as a way to uniquely fingerprint specific cards/users (which could
raise concerns about privacy in some settings).


Matt

> > > > +
> > > >  static void xe_device_sysfs_fini(struct drm_device *drm, void *arg)
> > > > {
> > > >  	struct xe_device *xe = arg;
> > > >
> > > >  	sysfs_remove_file(&xe->drm.dev->kobj,
> > > > &dev_attr_vram_d3cold_threshold.attr);
> > > > +	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_csc_uid.attr);
> > > 
> > > it's sad that we don't have proper groups defines and need to add each
> > > attribute separately (but that's not your fault)
> > > 
> > > >  }
> > > >
> > > >  void xe_device_sysfs_init(struct xe_device *xe) @@ -83,6 +96,14 @@
> > > > void xe_device_sysfs_init(struct xe_device *xe)
> > > >  		return;
> > > >  	}
> > > >
> > > > +	if (xe->info.has_csc_uid) {
> > > > +		ret = sysfs_create_file(&dev->kobj, &dev_attr_csc_uid.attr);
> > > > +		if (ret) {
> > > > +			drm_warn(&xe->drm, "UID sysfs setup failed
> > > err=%pe\n", ERR_PTR(ret));
> > > > +			return;
> > > 
> > > if you exit here, you will leak dev_attr_vram_d3cold_threshold
> > > 
> > > > +		}
> > > > +	}
> > > > +
> > > >  	ret = drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini,
> > > xe);
> > > >  	if (ret)
> > > >  		drm_warn(&xe->drm, "Failed to add sysfs fini drm action\n");
> > > diff
> > > > --git a/drivers/gpu/drm/xe/xe_device_types.h
> > > > b/drivers/gpu/drm/xe/xe_device_types.h
> > > > index 268a40639ec5..e88b64cb0eca 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > @@ -239,6 +239,8 @@ struct xe_device {
> > > >  		u8 vm_max_level;
> > > >  		/** @va_bits: Maximum bits of a virtual address */
> > > >  		u8 va_bits;
> > > > +		/** @csc_uid: device uid calculated by CSC FW, used for
> > > generating uuid */
> > > > +		u64 csc_uid;
> > > >
> > > >  		/** @is_dgfx: is discrete device */
> > > >  		u8 is_dgfx:1;

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

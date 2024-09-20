Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAB5CF9C68
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 20:47:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ABC110E0DF;
	Fri, 20 Sep 2024 20:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gmetxTaC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6874E10E0DF
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 20:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726865228; x=1758401228;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sDV1nbssRRnAfg/NaUYfYRDdsl/QIUcgW1HFvtMSKsg=;
 b=gmetxTaCWLDIn+R5KPmNnReZkMk7K4BrzNWUS9m5gVSKXv+vugp1sF83
 B3kfgeBywpAr4eMbAUeZZKWgbtdApDRKci1IxM9enmuVdZ08x4y105sJn
 0o9JTdMDVhGPCGhVJB9lIK5p2Fz+10seUDcJ5smMNy5O5wfW9akDJsTHm
 h+OlBpy4XmP6EZ4o8io2AhV3AUe42RffTayPLPyY8fvurPlv2IGemWkGp
 o4mNnnG1anROcokcKVhVNMUswQIDby4nwx/EwLGuNpEY15qf+OEiIlpKu
 bplhcXyCOa6qtGa9lb3Q3KmEuiaN9rRPBgx2zkyravKefzFmBp+0xKsJe g==;
X-CSE-ConnectionGUID: M+qLq5x0RNiZaqBYX3iC9Q==
X-CSE-MsgGUID: T+6keAeGRwG9jEFgMLcIdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="26037820"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="26037820"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 13:47:08 -0700
X-CSE-ConnectionGUID: 52tKz9FgTw6dCpIRsjlyhA==
X-CSE-MsgGUID: YT7mcZ6vQWuEzBY0DrOSow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="74814215"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2024 13:47:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 13:47:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 13:47:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 20 Sep 2024 13:47:07 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Sep 2024 13:47:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xQR4TV5ku5UltHK4o+rlcDgPa6wPrepA2xAaeEIa6Ix720cpReqO73vYO9Slmx6OXsKxg+bDm96WCcfgG7SG32D0hLNNn0nhf60zxQJsmvc+KGrPHXj/akkZf0YrGN3ShkskrCMLhY9V7+Y+45OCroFRJ8L6he4l0FMxAiv+X7DATM/TImrtY/oAVhnqNIcNlyAdPoq1dywoAOd3Xb8nZZZT+Fl4ezGFkxdiwpjgJm2EaBGUSwXJUNgCofM6uYl2v3urFTLfpcSJLuuuJsZu1FPKmaLrUi+pWLs7+cWD5mx3s55ZhoZs6tBxab2bWxhngE+2558E8OF16rIeClTaKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVZ95WqKK5kpWNowBmbB6vfZ2sENOzewZaTatU+GbMs=;
 b=vDF/W2H4Ko4xeKo2RW5UIWrsb6DBK8/ZKmc/S9qdnqSWQzYawME1cGWlwrxPtP2GItxvPBNaxC0e0VebuV9r5igcWIDb6XulvmHBV9gTee/bGhiSPOOmmfW5p/7qgMznf/fxP8K3SxSmI47viMox2gHAIqDh+35UBBt90+uycLKEKHXt7vJksv8Vkcm7zSxImWddmUkeqpByDM4nsW7JEtK+DtDvhIaoUAQW2h6G3RYOryoVAm15aES9glRQ+q4+7JSh1TkfVp9dmrYMihVI2AejAgdMcovkZH8uDW9wTC2U8yUBsd9yEZuan4KpHXrsW5UPxenApp099tLbsdVCDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4940.namprd11.prod.outlook.com (2603:10b6:806:fa::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Fri, 20 Sep
 2024 20:47:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7982.022; Fri, 20 Sep 2024
 20:47:03 +0000
Date: Fri, 20 Sep 2024 20:45:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/debugfs: Display gpuva info in debugfs
Message-ID: <Zu3e3RzmNQgnVUoP@DUT025-TGLU.fm.intel.com>
References: <20240918164545.3955824-1-oak.zeng@intel.com>
 <Zux1IqkPO2JgwVF9@DUT025-TGLU.fm.intel.com>
 <BYAPR11MB3159727E185F70F6AD2C7974926C2@BYAPR11MB3159.namprd11.prod.outlook.com>
 <Zu3CSjQyoh4BCOeg@DUT025-TGLU.fm.intel.com>
 <BYAPR11MB3159E9953DFEED24708E5A60926C2@BYAPR11MB3159.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BYAPR11MB3159E9953DFEED24708E5A60926C2@BYAPR11MB3159.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR01CA0066.prod.exchangelabs.com (2603:10b6:a03:94::43)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4940:EE_
X-MS-Office365-Filtering-Correlation-Id: c02a6012-3474-4d70-18be-08dcd9b561be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3riznzAjmlvLfeJEQCcVqQB5VLoOZiG480KnUyXKvq9NF9ElO6kYzqPTCDmD?=
 =?us-ascii?Q?VZqpX2NgOKz3NHJ/8B0LQPFMInz8ZQlE9J2wVf7MhsxQuzyAp0zyVHVXZk2u?=
 =?us-ascii?Q?mHjo8+tZt6PsRsHAazsL3U1DcTcKk7QV9H5kN4cCcBDOsnZZF4A84gnq+Vms?=
 =?us-ascii?Q?EuZSW14m3LgeqQDacGS9cdmj5EMIlcePBr/c+a15/S9NURGJtSP3IvM79MJB?=
 =?us-ascii?Q?n/kxXQLrAKffQ9CXTjQtw5gjkPFyhfPsMQuP66ygVEA44216m+eMRGdZicJp?=
 =?us-ascii?Q?bUwG4YIDOQLbxByefjU2WSI1jKBfVMPuel4+J/xhVkNJI/6pf4lD82yAGYL+?=
 =?us-ascii?Q?Sm7WEtF3sbYClNBRUAbVr0znv+dtyhT9oqW2yBRNMCk++UXCqvt9ViOFoF1c?=
 =?us-ascii?Q?osRanH4/JsH/gRH767mVIaB/qa5yDeeBGcb7dA/+uOM+dy0b3DjQZrvMADVq?=
 =?us-ascii?Q?J0XnvZmmDqHrPjnCCRyOXJyEpWUA+gW+BMDlRfbBfl6TgbvpbNQXuHVOmBh+?=
 =?us-ascii?Q?mJJCtTY2s36xAtriQdCcSAeegHeWgO2QG7skMBl1LFIp32smaYYGwspL/vXX?=
 =?us-ascii?Q?xfaLoSjG8IcOabIwcPMZBRw56Hj14BYGmu9JQ+2gFjpBoPZONiyeeHbKc28l?=
 =?us-ascii?Q?CPfR+kSLpmfolaJEu2nCBnTRcUtbXpnmKy1RSQJ5yO7fmGYtxt0zc33GSo0z?=
 =?us-ascii?Q?kNIaGr68ZRGqdaPbTg0PsMOj4aI04FtCD75r1GSJj6vp98QW0BqCV7R2Gesn?=
 =?us-ascii?Q?A3jVqgzb+weMf1QPGRrtaUF3ZArapSfpa4ioR2UVRsjDa6nKc9scfv/eA1jo?=
 =?us-ascii?Q?tITm0K7MeJFWjdiDK1FEL5PeyTCcb5d3JONpr6faeAFQJUQqp7kPvB/59L8d?=
 =?us-ascii?Q?AgwSf/C995o2/kagfd69u4Zs4VwMPHFW9svxPgrWayYqRhaOAnT0PLqi+8XO?=
 =?us-ascii?Q?/3oO8TwM4D182ykG58r9nSsE0OCNASDkUby3KpCvjv5bCnyzEUbVBOt3/RVW?=
 =?us-ascii?Q?Rxga2wDhn1fMsJ9OZ+S2uQ4KLWl84QGt49BOoFX6QO9P8uCw57hMbLh7EV7k?=
 =?us-ascii?Q?BS8ncBaUJyl4kBC8LXj3OnqlRBe6M1jPm5v0uHn7MZnzGuPxhOah9BOsr76y?=
 =?us-ascii?Q?1+5SpcXw6ArgeM5f7OyAkVlbjz1KQfdTq8kQX89u+RuUDI4cV78qNAEKL00E?=
 =?us-ascii?Q?oZb8ad+VQKBBPRUTF9ST1QYgE3akQ0mNLlKYvkeY91bAmDgWYv+iNHXd7947?=
 =?us-ascii?Q?o7+TtjC9QAuwLbocZMXYHNBVG8SnQAXkuRvgnQXABTu/6Ym7PR/g5VWcIWQA?=
 =?us-ascii?Q?dO9ZLalDxcMf8G4P1/dlix48?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7zScDq+Te9JkRkTov9miKC2DKRWYNviJArLzMyYCyLALSNLPU0LWfGgiGNTH?=
 =?us-ascii?Q?SlljwfYkyjWkTiZYV/Ot7W06l4nr4Xz9lSK2nlDWr/OIyv2GLdgN5LdETHs7?=
 =?us-ascii?Q?EAmyzExcmAWx54Q93TfSmE0m4bM339Bytx/TfiRZjHPciWD5n/EzbQyUnWMq?=
 =?us-ascii?Q?zbVta3WHNr+qN9BsjM0ixulMZHm7TukZ3Z3OB6GQKGkSAo83YHsY6vfuVriB?=
 =?us-ascii?Q?vv3HvWbN3bjgnb2BFPvb0BtVQMdnmEdBvJwSYIW7wBAAqmGM85iKaJ5AwCkz?=
 =?us-ascii?Q?U13XuyxtfKuzMo+nNpY0CndFYgdzdUi9hnxPg1uq4AK+9JSd2dkLkxbrvZov?=
 =?us-ascii?Q?pbtOWiDzgIH4KG044PiwrWacuAJQHLNLtUFETk7pumGnhdDNzonfPpfJockG?=
 =?us-ascii?Q?+cpyVKuvokVerQaSOhd6DzORSF3L13ByONH11GfV+VJ7iVUUS8BEwyq4ORyx?=
 =?us-ascii?Q?5tgv7Vsr1YVSeUDFRqAJ/HJ0j7sQXYsuX19m8uEgre8ybBvwKJzKoaPUFFLo?=
 =?us-ascii?Q?fwvbhqrii1vlVX7u2VTw7g2xE+goILM/0IX/DLUSogsV2+unFKiUVhzzCTTt?=
 =?us-ascii?Q?P8D6NbqZbPwx5cfv11vcvrQz7Ncl9QwXOdtGj4/g9YpSBRRCVVkK8dXTDi8R?=
 =?us-ascii?Q?kMd0z5bx7L1tjj+PXPWXfcBOUM8sn0lZOCyK2Yk5MxaYHVjKwCxBSyV14QXl?=
 =?us-ascii?Q?HfmbbKSemogTsnpVScuVId+1HnnYh1IYV2Liq1rZlbNrDt/xWqQMauDY863t?=
 =?us-ascii?Q?KS6uTFt7UR2Jz0QXItAgLX5xnoo++kiWuv46nho50JHmjn3UnvZiunA94UjH?=
 =?us-ascii?Q?lp+/aq61xhtL1DL96++lM9L+MOp2KW8nc4+mTmgYeCsogaGk0pV+zbtRreGW?=
 =?us-ascii?Q?vAMDJ3W4v6jQiBuZYvAY6q4/TLs0UMjeK2HI1HtqPzsbLNVE7wEuA5L6C7yT?=
 =?us-ascii?Q?8SlhuCjYtt8MrSmsmBZW83wFQeQByrtkY3/zvtca8d5NveGlsb/Tky8/NV9e?=
 =?us-ascii?Q?YhgTd+A7lk6QUIP8lrJi/Edt7sYdJIaECPBfGpBbCMqL29+fxqq6+XyhQoJ9?=
 =?us-ascii?Q?qKACBBKnhZff6sq6KE9Dr1eAuICU5jO3EnKiT9KoYF6VwbmuWAitePAcC93/?=
 =?us-ascii?Q?4OeAO6gZTEle+etmzT7ufePoa6XeUeSK8VcByfhDBnqLG8kcQVnR32+EhF2W?=
 =?us-ascii?Q?AZnXvD7ksuXM3jTP4MTG1STG5dhNLTcYUb+rN9bEjDCZqvyxNzC5KfQ0oytZ?=
 =?us-ascii?Q?+YJul64Vx+Ueb8w44rNElxAbnl8fM9fxMb9PP7H7zcWvEsANgkS0Alc9bxbG?=
 =?us-ascii?Q?5++4lDLGj2sPbwn3S7A1qsjNTweg0R2kwMQso9+KDReGn/0lulwntXQKsmrf?=
 =?us-ascii?Q?Lb8dA8k8kUDorMRD5i+g8d7v69hNPmtK1p0f47DEzY9rEOhzHuVH6n+77Mh+?=
 =?us-ascii?Q?n4RSIFp+wl2gWkqwa6jABQxLy4r3fNVN1/4Mj1glwVF7dyJ63B53g4semZJK?=
 =?us-ascii?Q?TpDlXMXzLrOrj5Mi9XoKiRdDZ3j60wpVsVob7tP5Gv4jShyFNUcvlwKkw+A1?=
 =?us-ascii?Q?DiPMdxtq7yimjYMtmQ9ZfySfKtG3Ka9+cSkQ76YV6spxeUk0HBHAoxbJ5X6e?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c02a6012-3474-4d70-18be-08dcd9b561be
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 20:47:03.3000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rhUed+F9J56omH8CP/oGaftQkcfY0sQW1sd4ZF8ABHicRaM8TshzC8leojBbzjPESmFuF4BcbWPeyJzLqOhXug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4940
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

On Fri, Sep 20, 2024 at 02:03:54PM -0600, Zeng, Oak wrote:
> 
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Friday, September 20, 2024 2:43 PM
> > To: Zeng, Oak <oak.zeng@intel.com>
> > Cc: intel-xe@lists.freedesktop.org
> > Subject: Re: [PATCH] drm/xe/debugfs: Display gpuva info in debugfs
> > 
> > On Fri, Sep 20, 2024 at 09:57:19AM -0600, Zeng, Oak wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Brost, Matthew <matthew.brost@intel.com>
> > > > Sent: Thursday, September 19, 2024 3:02 PM
> > > > To: Zeng, Oak <oak.zeng@intel.com>
> > > > Cc: intel-xe@lists.freedesktop.org
> > > > Subject: Re: [PATCH] drm/xe/debugfs: Display gpuva info in
> > debugfs
> > > >
> > > > On Wed, Sep 18, 2024 at 12:45:45PM -0400, Oak Zeng wrote:
> > > > > Add debugfs entry to display all the gpuva that is bound to the
> > > > > device. This is done by walking all the VMs created for each
> > device
> > > > > process, and display va information of each VM. This is useful for
> > > > > gpuvm debugging. With this change, user can display gpuva info
> > > > > as below:
> > > > >
> > > > > root@DUT7279PVC:/home/gta# cat
> > > > /sys/kernel/debug/dri/0/gpuvas
> > > > > Process "your process name" GPU VA space
> > > > > DRM GPU VA space (Xe VM)
> > > > [0x0000000000000000;0x0200000000000000]
> > > > > Kernel reserved node
> > [0x0000000000000000;0x0000000000000000]
> > > > >
> > > > >  VAs | start              | range              | end                | object             |
> > > > object offset
> > > > > ------------------------------------------------------------------------------
> > -----
> > > > --------------------------
> > > > >      | 0x0000000000000000 | 0x00007ffff5db7000 |
> > > > 0x00007ffff5db7000 | 0x0000000000000000 | 0x0000000000000000
> > > > >      | 0x00007ffff5db7000 | 0x0000000000001000 |
> > > > 0x00007ffff5db8000 | 0x0000000000000000 | 0x00007ffff5db7000
> > > > >      | 0x00007ffff5db8000 | 0x00ff80000a248000 |
> > > > 0x0100000000000000 | 0x0000000000000000 | 0x0000000000000000
> > > > >
> > > >
> > > > This looks useful. We may even want to extend wedged mode to
> > > > switch the
> > > > VM to a state where this is available after a hang which causes a
> > > > wedge
> > > > as this could useful. Can be done in a follow up later.
> > > >
> > > > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_debugfs.c | 44
> > > > +++++++++++++++++++++++++++++++++
> > > > >  1 file changed, 44 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
> > > > b/drivers/gpu/drm/xe/xe_debugfs.c
> > > > > index 1011e5d281fa..0c7bee1c2a8d 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_debugfs.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> > > > > @@ -9,6 +9,7 @@
> > > > >  #include <linux/string_helpers.h>
> > > > >
> > > > >  #include <drm/drm_debugfs.h>
> > > > > +#include <drm/drm_drv.h>
> > > > >
> > > > >  #include "xe_bo.h"
> > > > >  #include "xe_device.h"
> > > > > @@ -84,9 +85,52 @@ static int sriov_info(struct seq_file *m,
> > void
> > > > *data)
> > > > >  	return 0;
> > > > >  }
> > > > >
> > > > > +static int show_vm_gpuvas(struct xe_vm *vm, struct seq_file
> > *m)
> > > > > +{
> > > > > +	int ret;
> > > > > +
> > > > > +	mutex_lock(&vm->snap_mutex);
> > > > > +	ret = drm_debugfs_gpuva_info(m, &vm->gpuvm);
> > > > > +	mutex_unlock(&vm->snap_mutex);
> > > > > +
> > > > > +	return ret;
> > > > > +}
> > > > > +
> > > > > +static int show_each_vm(struct seq_file *m, void *arg)
> > > > > +{
> > > > > +	struct drm_info_node *node = (struct drm_info_node *)m-
> > > > >private;
> > > > > +	struct xe_device *xe = node_to_xe(node);
> > > > > +	struct drm_device *dev = &xe->drm;
> > > > > +	struct drm_file *file;
> > > > > +	struct xe_file *xef;
> > > > > +	int (*show)(struct xe_vm *, struct seq_file *) = node-
> > > > >info_ent->data;
> > > > > +	struct xe_vm *vm;
> > > > > +	unsigned long idx;
> > > > > +	int ret = 0;
> > > > > +
> > > > > +	mutex_lock(&dev->filelist_mutex);
> > > > > +	list_for_each_entry(file, &dev->filelist, lhead) {
> > > > > +		xef = (struct xe_file *)file->driver_priv;
> > > > > +		seq_printf(m, "Process %s GPU VA space\n", xef-
> > > > >process_name);
> > > > > +		mutex_lock(&xef->vm.lock);
> > > > > +		xa_for_each(&xef->vm.xa, idx, vm) {
> > > >
> > > > Kinda a nit but I've said this in a few other places - the xef-
> > >vm.lock
> > > > read usage isn't right here. This look protects the xarray lookup
> > and
> > > > ref to VM and nothing else. It is not designed to do anything else -
> > > > e.g. holding the lock then calling another function.
> > >
> > > I don't see a problem calling a function holding xef->vm.lock. we
> > require
> > > Vm to be alive while calling show_vm_gpuvas, and xef->vm.lock
> > guarantees
> > > Vm is alive because it guarantee vm is on the xarray and as long as it
> > is on
> > > The xarray we hold a vm ref.
> > >
> > 
> > Your code works, it is about having well defined locks and not abusing
> > them.
> > 
> > To repeat - this lock protects the lookup and taking a ref. It is not
> > intended to be taken and do other things underneath it, certain not
> > intended to be an outer lock of sorts.
> > 
> > > >
> > > > With that this loop should look like this.
> > > >
> > > > mutex_lock(&xef->vm.lock);
> > > > xa_for_each(&xef->vm.xa, idx, vm) {
> > >
> > > I don't think xa_for_each is safe againt removing items from xarray,
> > > At least this is my understanding.
> > >
> > 
> > It is [1]. The lock protects the ref to VM so after lookup it is not
> > immediately freed it does not protect the lookup itself, xa has locking
> > for that.
> 
> You are right. Now I agree xa_for_each is safe against xarray modification.
> 
> > 
> > [1]
> > https://elixir.bootlin.com/linux/v6.11/source/include/linux/xarray.h#
> > L491
> > 
> > > > 	xe_vm_get(vm);
> > > > 	mutex_unlock(&xef->vm.lock);
> > > >
> > > > 	/* Do something */
> > > >
> > > > 	mutex_lock(&xef->vm.lock);
> > > > 	xe_vm_put(vm);
> > > > }
> > > > mutex_unlock(&xef->vm.lock);
> > > >
> > > > This avoids unintentionally creating locking chains, in this case
> > > > xef->vm.lock -> snap_mutex. We should strive to only create well
> > > > defined
> > > > changes of locking. Once we start unintentionally creating locking
> > > > chains it hard to unwind in a driver.
> > >
> > > Can we annotate the xef->vm.lock -> snap_mutex locking order?
> > > It is reasonable to me from the locking hierarchy here: xef->vm.lock
> > > Is at the xe file level, and snap_mutex is at vm level.  we can create
> > > multiple vms to one xe file, so the locking order seems natural to
> > me.
> > >
> > > the key point is, not be afraid of creating locking chain, instead,
> > creating
> > > locking chain at reasonable order. Fortunately, the locking order in
> > this
> > > case is very obvious.
> > >
> > 
> > We could annotate it but I'd rather just avoid a chain. In general
> > creating chains is a bad idea and great way to have locking which can't
> > be understood or get inversions.
> > 
> > Again this works but it fairly easy to avoid creating this chain so
> > let's not do it.
> 
> If you think this is better, I can change the codes as you indicated. Not a big deal.
> 

That would be for the best.

> > 
> > The only place we really have chains in Xe is in memory management
> > code
> > (VM and dma-resv locks) which absolutely required are very well
> > defined.
> > 
> > > >
> > > > Likewise I suspect we really shouldn't be holding dev-
> > >filelist_mutex
> > > > and doing things underneath it. Fixing that would likely require
> > > > converting &dev->filelist to an xarray or writing an iterator with a
> > > > hitch though so is a bit of a larger change. Looking at the usage of
> > > > this lock, I'd say this is kinda abusing this lock too and I don't think
> > > > anyone in the community would be all that happy about its usage
> > > > here.
> > > > I'd lean towards we need to properly fix this, or alternatively
> > maybe
> > > > just maintain a per device storage of all the VMs.
> > >
> > > Take a look at drm_client_info function. Holding filelist_mutex and
> > doing
> > 
> > I don't see that function [2].
> > 
> > [2] https://elixir.bootlin.com/linux/v6.11/A/ident/drm_client_info`
> > 
> > I see drm_clients_info...
> 
> 
> Sorry it was a typo. I meant drm_clients_info. It is here:
> 
> https://elixir.bootlin.com/linux/v6.11/source/drivers/gpu/drm/drm_debugfs.c#L73
> 
> This function not only takes a master_lookup_lock, but also a rcu_read_lock.
>

That a generic thing for dereferencing RCU protected pointers which is
required to look at the PID I think. The PID is very tied to the file so
it makes sense.

> And it does a lot of things underneath.
> 

Not really, it prints a somethings related to file / pid.

> Same behavior is demonstrated by amdgpu_debugfs_vm_info_show.
> 

Yea, my previous reply cover that - that looks wrong to me.

> They are all correct usage of the lock. Very natural and straight forward
> To me. Not at all an abusive.
> 
> So why you think differently? By carefully read your words, I found there are
> Very subtle different understanding of locks.
> 
> " This look protects the xarray lookup " - I understand it differently. I think the lock
> Protect xarray itself, not lookup. Any modification or walking of the xarray need
> To hold this lock.

No, I cover what the intent of the lock is in my previous reply. FWIW
this is third time I've said this to people in the group. I likely
should update the documentation to avoid confusion here.

> 
> Those locks protect variables or data structure, not action.
> 
> So in my original codes, by using those locks in my original way, I basically say:
> I am walking all the files in a device and all the vms in a file, please nobody
> Is allowed to modify file list and vm xarray.
> 

I understand what the code is doing and it does work. Again the point is
this lock is not designed to have things done underneath it. Your code
works and yes it is very small issue but if we start doing things that
'work' all over the driver for convenience we get an unmaintainable mess
eventually. We should strive for doing what is correct over convenience.

> (Of course you could argue there could be efficiency issue because you hold
> Lock for long time. But this is just debugfs where you usually don't care much
> About the efficiency. Of course this is also not the argument here.)
> 

We don't care about efficiency here.

> I think we should first agree on this point. So I am not going to reply to
> What you said below.
>

My position is quite clear on this and as stated this is 3rd time I have
pushed back on usage of locks like this. I purpose another viable
solution without any new locking chains or reaching into another layer's
locking, I would prefer if went with that.

Matt
 
> Oak
> 
> > 
> > That function does take fpriv->master_lookup_lock in
> > drm_is_current_master but that IMO is well defined and within the
> > DRM
> > layer too. We also shouldn't take a lock from different layer and make
> > rules of what we can with it.
> > 
> > I guess AMD and vmwgfx [3] take this lock in kinda similar ways but
> > IMO
> > that is a bit abusive, in particular this usage [4].
> > 
> > [3] https://elixir.bootlin.com/linux/v6.11/A/ident/filelist_mutex
> > [4]
> > https://elixir.bootlin.com/linux/v6.11/source/drivers/gpu/drm/amd/
> > amdgpu/amdgpu_debugfs.c#L1771
> > 
> > > Things underneath, including hold another lock, seems fine. That
> > codes have
> > > Been there for many years without a problem. It is just natural to
> > hold
> > 
> > Again I think it works but that is not my point.
> > 
> > > Filelist_mutex to walk device's file list as this lock is designed to
> > protect the
> > > File list. I don't think it is a abusing of this lock.
> > >
> > > So I think it is reasonable to annotate a dev filelist_mutext->xef
> > vm.lock->vm snap_mutex
> > > Locking order. This is the same order of creating device ->device file
> > descriptor for device->gpuvm
> > > For a device file descriptor. Any reversed order locking is not
> > reasonable thus a kernel driver
> > > Bug.
> > >
> > 
> > I disagree here and think it easy to have a well defined xarray + lock
> > of VMs attached to the device with same semantics as xef->vm.lock.
> > 
> > Now that I'm looking, we already have that xe_device.usm.asid*.
> > Maybe
> > just repurpose that structure / lock to be non-usm specific (e.g.
> > always
> > assign a VM a ASID and insert into it). Your loop here then would look
> > like the on described in my previous reply with taking a ref to the VM
> > and then dropping the lock for main part of the implementation. That
> > seems better.
> > 
> > Matt
> > 
> > > Oak
> > >
> > > >
> > > > Matt
> > > >
> > > > > +			ret = show(vm, m);
> > > > > +			if (ret < 0)
> > > > > +				break;
> > > > > +
> > > > > +			seq_puts(m, "\n");
> > > > > +		}
> > > > > +		mutex_unlock(&xef->vm.lock);
> > > > > +	}
> > > > > +	mutex_unlock(&dev->filelist_mutex);
> > > > > +
> > > > > +	return ret;
> > > > > +}
> > > > > +
> > > > >  static const struct drm_info_list debugfs_list[] = {
> > > > >  	{"info", info, 0},
> > > > >  	{ .name = "sriov_info", .show = sriov_info, },
> > > > > +	DRM_DEBUGFS_GPUVA_INFO(show_each_vm,
> > > > show_vm_gpuvas),
> > > > >  };
> > > > >
> > > > >  static int forcewake_open(struct inode *inode, struct file *file)
> > > > > --
> > > > > 2.26.3
> > > > >

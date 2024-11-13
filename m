Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A033D462AC
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 14:24:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD9C510E710;
	Wed, 13 Nov 2024 14:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NzR2Ru6n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D146710E710
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Nov 2024 14:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731507871; x=1763043871;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7NOgkjEo/VrgQvE+yYOGl6DEBNyDVpyiecTkEsmRW5M=;
 b=NzR2Ru6nEifMlV18bQ34p8GuyiM4jKnumhn3yfTqQGYnMMXyEUT8Wr/K
 6tbaA2ByopN+br0fDagYflNjEBj2uKWXAec/PvT1tD8I8TwUbmJsEy8qe
 EUMOXQPlcJVVJmL4XgmE+c6Zh6V7Y72ok1RMx4Uv/ByeG3HrdHhvP6x34
 YdWSDntZfKdjci8bHENPz0hf4r6Pms2gSCK+DMsa9/IqXRMm73ey/vMjl
 EaW1uePfXjs7gFYxrm05ZlLLU3qPuyFgaoy+UIoJirf0fj4WEtBpN1Bia
 hAdJS7eHV35IT7lxdfhlyanD118POwPtZ64sAZPPppPzD4qArAlsdNEFg Q==;
X-CSE-ConnectionGUID: 6pex3EenRgWeNv3zQgTbLA==
X-CSE-MsgGUID: 3Q++QmVhQSa2Ydk46mKnOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31283582"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="31283582"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 06:24:27 -0800
X-CSE-ConnectionGUID: DBnc+6LOQWKUwfWEsm5osQ==
X-CSE-MsgGUID: wEfNAS5IT+aPWa4J3NMgig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="111199218"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2024 06:24:27 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 06:24:26 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 06:24:26 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 06:24:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=othMi8NTZrxWqt+zgFHjxTvS0vg6cd/Pec+UuUdzKS3kRwogMi29J7R+crwv+gVD7qNs15ifAPFJ7uQ7+RUYLdSE1wYEGoMg3UGNJollillTM4wuhkr8Fbj2hA78KVbcdagyDOXATYIW7ZdOdah3ivOc++ktAQUUVg0HfjTsfLasFKJc3G5jDQW4fKi9trJImBTMh/EacAVZJxUZam6rO5alhKYIIFNKJbQmVfpdJMeu+wCbXvfX+RjpJP3pYhEFZDMyDKktZ2DlfB3orzvs5kyUxJlcBCbVjiaNUQCcblw2e/bEh9NUHBy5EHx6H8yLTd+reUxhiKQUtowIXcbpmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2A6jgitf/MmwdKu6k9z80YTj5z7H3sPM7zU1qlq9mVc=;
 b=sCKtOQPTZ+Y9K6ok8jekI6c4M+fjGaaFXPzcbxyYZniZxt5V219TPdY57WD+/+JAbTgsQogAtHgyyi7IZEzhgyC4KRRiDEyN4iZHrxROZ7yPeqLMl0qQz2phv6HbaVZMQRjwRbcQcZXH02QFKuNe2i+oMR0RD2APE7OREA0OflC+03HHiafNPaGT/w6e5kDWErVACGZDS76x6/8DdstvWHKJ1P+RgJJZwzaP1u+GBpUNeNPGan6cgOH6dJoKcvPya7cgy45gfBQIYuF8PhZMAunrxhU9rysK5WpORr23c13XKe12FYdLOM/kxWHM6tH4xnVUjXv1OfREQDz8xtA5rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DM4PR11MB5995.namprd11.prod.outlook.com (2603:10b6:8:5e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 14:24:23 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Wed, 13 Nov 2024
 14:24:23 +0000
Date: Wed, 13 Nov 2024 09:24:18 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC v1 1/1] drm/xe: Allow fault injection in vm create and vm
 bind IOCTLs
Message-ID: <ZzS2khzwa5a-6gr3@intel.com>
References: <20241108161307.1203967-1-francois.dugast@intel.com>
 <20241108161307.1203967-2-francois.dugast@intel.com>
 <Zy5wJSsG8ppPCg2A@intel.com> <ZzM4mV8VXtuUyBT-@fdugast-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZzM4mV8VXtuUyBT-@fdugast-desk>
X-ClientProxiedBy: MW4PR02CA0021.namprd02.prod.outlook.com
 (2603:10b6:303:16d::31) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DM4PR11MB5995:EE_
X-MS-Office365-Filtering-Correlation-Id: a4181315-30ee-44b5-b18c-08dd03eedde8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YejIpX3NEE1gfhtpIFLpSrPlkj3CUg8MHVGtKSyppJFTfYKMkcunnH+nnYUT?=
 =?us-ascii?Q?kxgsS283ogQ5l5CeeZ7QgIduxFrjsM4rIt5dDV+bcARtLEa/3PY3Mzd2sqPJ?=
 =?us-ascii?Q?Alivcl6eK0J1H3IAEPL+rk9uPVkIhl4CLVUl+XJA2U7G+p2oUEtQoimjJvXv?=
 =?us-ascii?Q?y2iRq1BtNum853MoL2K7vObbw3Fa5xngS1lIwaJuWo0fJDaVrXzH6gZnLUma?=
 =?us-ascii?Q?dwKjje6ZvOG0A6egxz1RMjSL06ekPhmVPqadMOiq2oyGmqR6XdG4/SBHNqP6?=
 =?us-ascii?Q?z1fQBfUpYLYPQ3130USUm/uyLz/7addZCAbSQkjoBWi9pqaRtx47KQr5TWg4?=
 =?us-ascii?Q?16rrx+M0oPKMnUdyffhFpfx+XmoCfioG7BCZ5ZHlIXShVHCeqN1g1wmXDA+f?=
 =?us-ascii?Q?vm3A3pVfQKwFLHZqwvKGl8xiarpTLzthYXPJs97IzMvgcWFHFclY4kIliYWa?=
 =?us-ascii?Q?gqR5i4MUmzsCoECQ9qhZcYeLBEke2Rme39HL896838FE9VTuGVPCtln78b0r?=
 =?us-ascii?Q?189JnvYFNNg4yBD2CBREWB1aLbzug+TMDnJlo1wgHZZ010tQaUiEyEMp/7bF?=
 =?us-ascii?Q?3AyPKGikrDvD6jnLpbDD/+JSzp7vQ05iuERW5aiVbLwzu2/hFHlnnVDEN2v/?=
 =?us-ascii?Q?PBvFYGMv0RzRKSoJqHH7K7hMZkI5H7hu4qaKnCwQcYwLEXiRjppiIWLHS/RA?=
 =?us-ascii?Q?1hTg+z6lCIJD5GgLjRcOzaDu7F39V5mChWLcmqhKZS3UrU56tP5aM3HBHkYV?=
 =?us-ascii?Q?GaDz84Q2+v3s9Q0B6LoFx0XaoAVp4OO4rPjPf0nhitl+UhG3MKGbA6ukp6a+?=
 =?us-ascii?Q?4xUjTQXZkxGOgfP22AX2QsUhGOtdx9dQf0ElXWSRVfx5TwaIbii/eQ+x/o6O?=
 =?us-ascii?Q?UYyG8qqoChfMzJ74gKidOxIv+RkRkZhNmGviTnQrnRvWkyN3P5oyN48Xy1cs?=
 =?us-ascii?Q?qXcxB1XBB7CUWVnf/8P3TM06Ek6Gld5GEMFt4IFktVbPoj9RWGJ+coHzA59A?=
 =?us-ascii?Q?hoSN9NZiF/zIlQC9KWGdUvU56BhHPGtsLZyv7aV6jOLODQ5M6yplgS+Dp2Em?=
 =?us-ascii?Q?d3S3+WTYfnQ2L0UE0fKeF/4/RQQ1P10j/QToyrk/x8xPk6skZEDsTvjvtH4j?=
 =?us-ascii?Q?znOYMHRxqjKWTSxsEjnYniw07y+8Qqi1cPmDoj3ml0HaqTKp+e+xtEk8qzUW?=
 =?us-ascii?Q?rW9D1A3pBmMf+cRM38iWB46x9JjyUprHiR/awS/JuYdr/rebj19LChBSxE/T?=
 =?us-ascii?Q?wKnN4jiayfTRI6BGIut886DtM40Ui3Tu5Ob0I2lOgw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zE+FJDeG8SaYh4JpNPB+SujT2BEoilXcWWYZR/EB3ZnYUNg/L2nTuBzZqa3U?=
 =?us-ascii?Q?CRAC2xTaTpidbAXSk16FrozQewEYjDJ2Sd3qv0NzJka9USxpaSMKu73H6Wp4?=
 =?us-ascii?Q?3UCI4xs0aPL2s+KVJDtjp9B2DEKAxXA5LKwqEQMYzaUr9SE8slJ0QADKzLRe?=
 =?us-ascii?Q?tTFws+jAN1DRhpB30b9a9ID9rs2bnsORmOWzSJY4qRs1F5soJRfLWpfDNMCs?=
 =?us-ascii?Q?bnf2ECENXro4TaZAqAhjSiRATXej3x0m1zS7dpYxlyTXa0gnfxbcVLuzLGP7?=
 =?us-ascii?Q?hHgryOjeaTgYIjtVAnyMb4km7lHc8nxu2r/1yyozGGcV0shlmX0eKHB6eA9b?=
 =?us-ascii?Q?Pr9KAthOzHrO+QpoWxEMYnIKxlOkYWor0Wu/tguKo4u1MEZoCGabGnrVWHaD?=
 =?us-ascii?Q?6pRc43EUl9FHIDg0PAKUxhgdLQHMS3RCPNSxc8M8TdQhcLRR66ZsIVnREmNS?=
 =?us-ascii?Q?+I1OHRaY23WI/ZiLFPtGJERAruCBiI9O+0ir5yfYX2hMpJxFu6AjAcFM8VAD?=
 =?us-ascii?Q?jt4O7+wJe365NxXZjV4+eNW9g9fSZh4PKa7ikx8HNOVfA2TSDlDoTC3KQGuJ?=
 =?us-ascii?Q?+zIPzXwGxUVKvJyhhVIMAZt+lXzZTsuoZ48iT42fTyeeoTVoCkRSUwCmAiXr?=
 =?us-ascii?Q?O02xd6je/vejvTIJF1rv81vJUo08rgpUACGepxtC00ld/8pwJBXnjQTIt/uM?=
 =?us-ascii?Q?Lp3yjIfpbYzWv5uFm+ei3rq16K0FBf8A6RgAqp1YYAs/G+fkpVhPEpijUkcB?=
 =?us-ascii?Q?XMRfxSafNc15pbyvHxxF6vE0eqJYt41FV+AYPC3DcYcZa/6M2w3MuzY3sBe6?=
 =?us-ascii?Q?heg2Je+D2zlKVPlSbuSac9xzJmO1IC+Wk0P+3jSlquAYepejxBuHZO/lOSah?=
 =?us-ascii?Q?XigeQjlynbTQnZfkNLBF3mbP4Q0yD5VDLDPn9cWTzVeMakS/kYjKUv0crfIB?=
 =?us-ascii?Q?aEUEm52edelcOtz9XQFOuz0HsypH6xmnsjuM2uf30ffC/zvUREAMtG3v090g?=
 =?us-ascii?Q?xevR0l2iYxrkvrYMU1XNjNA+ARghIa7PhIVW76gmeTb8KK/JpYfc0WKgICWv?=
 =?us-ascii?Q?I5viLpGFNwVx4/KVD1HXNT145ZQxcuB9h7wB6F8dZh2fVVUFkSVI1xWnIS7F?=
 =?us-ascii?Q?gUyYrQsIsoEuaHZ0TZmid6hSNl3+bANEfwui7g7saj7jOnyJ8Mx1WDJP44mg?=
 =?us-ascii?Q?6VbB1VfCZwAeU9vt8CsaSIZwfxIw/x3WeKSlNbAyTESrvCsWOFLsLpCdc56K?=
 =?us-ascii?Q?2l5Srvoo1qhW9G2FnVVy/hFSeBzGxBAX+xFVTndHdy6wg9Cz+cZa8LLJXjve?=
 =?us-ascii?Q?bLV9NEWZ4fmHRsHApxb4BmwT/ZORzlkhwczUs75RFCduYo1nvBWKqrB2td0A?=
 =?us-ascii?Q?KJTYUP4jYpnVwFUWYyaZxZn0VQuSLQ0ZkdH/5eJZRzE5TJl2x2B2962MOXjS?=
 =?us-ascii?Q?cGSR4eBBp3JZn1Nk20Z3qc4ylsDDtVvlV7NpvrLa2bW35sP2OoZ1QfErCnY8?=
 =?us-ascii?Q?fAQKBNn1oNvPL7F20fNQtaY+2c1GOBqSdEhU2DwyZe4P+FX0VfQlDdO4T6xj?=
 =?us-ascii?Q?CiEB0jUAgRr3zimke/C8Al9sz1qPnqByc3Oa5oon1UC1GWjZixOXEBofYO3p?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4181315-30ee-44b5-b18c-08dd03eedde8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 14:24:23.2983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S5RtEal7y6kz2f/Q0wBWPUKIal6JJ+ZQTrp8NlE9rmoi2pEuyOriMcClNsedK0aL1tX6AD1J753cko8Z70Vkyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5995
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

On Tue, Nov 12, 2024 at 12:14:33PM +0100, Francois Dugast wrote:
> On Fri, Nov 08, 2024 at 03:10:13PM -0500, Rodrigo Vivi wrote:
> > On Fri, Nov 08, 2024 at 05:11:56PM +0100, Francois Dugast wrote:
> > > Use fault injection infrastructure to allow specific functions to
> > > be configured over debugfs for failing during the execution of
> > > xe_vm_create_ioctl() and xe_vm_bind_ioctl(). This allows more
> > > thorough testing from user space by going through code paths for
> > > error handling and unwinding which cannot be reached by simply
> > > injecting errors in IOCTL arguments. This can help increase code
> > > robustness.
> > > 
> > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > 
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Thanks! May I retain the RB after applying the diff suggested here [1] which
> adds xe_pt_update_ops_{prepare,run} to the ALLOW_ERROR_INJECTION functions?

definitely!

> 
> [1] https://lore.kernel.org/intel-xe/20241108161307.1203967-1-francois.dugast@intel.com/T/#m69d0b496c82f739e2093710fa8b8d7ff9f4ae712
> 
> Francois
> 
> > 
> > > ---
> > >  drivers/gpu/drm/xe/xe_exec_queue.c | 1 +
> > >  drivers/gpu/drm/xe/xe_pt.c         | 1 +
> > >  drivers/gpu/drm/xe/xe_vm.c         | 4 ++++
> > >  3 files changed, 6 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > index fd0f3b3c9101..b999db5f5c19 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > @@ -240,6 +240,7 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
> > >  
> > >  	return q;
> > >  }
> > > +ALLOW_ERROR_INJECTION(xe_exec_queue_create_bind, ERRNO);
> > >  
> > >  void xe_exec_queue_destroy(struct kref *ref)
> > >  {
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > > index f27f579f4d85..e111698abbd9 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > @@ -136,6 +136,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
> > >  	xe_pt_free(pt);
> > >  	return ERR_PTR(err);
> > >  }
> > > +ALLOW_ERROR_INJECTION(xe_pt_create, ERRNO);
> > >  
> > >  /**
> > >   * xe_pt_populate_empty() - Populate a page-table bo with scratch- or zero
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 624133fae5f5..2e67648ed512 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -740,6 +740,7 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
> > >  
> > >  	return 0;
> > >  }
> > > +ALLOW_ERROR_INJECTION(xe_vma_ops_alloc, ERRNO);
> > >  
> > >  static void xe_vma_ops_fini(struct xe_vma_ops *vops)
> > >  {
> > > @@ -1352,6 +1353,7 @@ static int xe_vm_create_scratch(struct xe_device *xe, struct xe_tile *tile,
> > >  
> > >  	return 0;
> > >  }
> > > +ALLOW_ERROR_INJECTION(xe_vm_create_scratch, ERRNO);
> > >  
> > >  static void xe_vm_free_scratch(struct xe_vm *vm)
> > >  {
> > > @@ -1978,6 +1980,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> > >  
> > >  	return ops;
> > >  }
> > > +ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_create, ERRNO);
> > >  
> > >  static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> > >  			      u16 pat_index, unsigned int flags)
> > > @@ -2697,6 +2700,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> > >  	drm_exec_fini(&exec);
> > >  	return err;
> > >  }
> > > +ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
> > >  
> > >  #define SUPPORTED_FLAGS_STUB  \
> > >  	(DRM_XE_VM_BIND_FLAG_READONLY | \
> > > -- 
> > > 2.43.0
> > > 

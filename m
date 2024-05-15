Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF00C25B78
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 22:46:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1281D10E0BE;
	Wed, 15 May 2024 22:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UN6lUHOl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17DEE10E0BE
 for <intel-xe@lists.freedesktop.org>; Wed, 15 May 2024 22:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715813191; x=1747349191;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eCMmu8CL1qSrQjFyAY/oTYhmLeY83TZrDwyZwCIkBSU=;
 b=UN6lUHOlG0au0hMrzjgjjN/hxP4q/1pS/UzV6M4nypop3MfvTVV8qPC4
 qexVYvaqcvLGDhnBWXtBQT2yZDWrF476u4lu5kkVyAGEo9Ya/5X49eYIF
 9VhaIqcS9LPLAWUtV/ICh8pTuUX0gOb/Gtj3NEEcgip3JU9mWHO1NZLJz
 EPaMlVusCj/e+vHexKMC9jQzJxG2GJ6F44HaD7lqO/J76VFS15ZD3dklH
 NW6DezSE4V98aFVV0K+WnmIG0wgWqSsRp4fsL42LKeVvhxp7c3xih5jH1
 xPSJoihp+Tz6evImBN7Xv7f+D6xkR6ipXqHle9poMqppmnc2X0zPUdwyD A==;
X-CSE-ConnectionGUID: b8m2UGZTQBujpWMFKuXYKQ==
X-CSE-MsgGUID: NXiQnlgISpqLF3eD6rUr9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="14846470"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="14846470"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 15:46:30 -0700
X-CSE-ConnectionGUID: NaWcO8ueQ6iQuwffytv9wg==
X-CSE-MsgGUID: idoCWCnzTpOGBTIFJRtq/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="62409076"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 May 2024 15:46:30 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 15:46:29 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 15:46:29 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 15 May 2024 15:46:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 15 May 2024 15:46:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KzgNnVTMsBbrErciuoPU63rjmWFBcQNx8OUu8CzXqrIX/pmWlt4EffcGBwWAOYNHyzD1yKb8PwJ4HnGhEwK2d6eDfYk0T2+WcNfxfNcYQkNKH3iBNQpJfA1wnqw7xicWKUDC92wBV2n9KFopcfmygMx4MBfokK6OHsBQkzod4/Ahq3p8v3ZDgdbRaKDEkIFoWy8xA3RfDB3f/qdWz24ikLzbrQkdz/Ifcvnn4MefI/34dtorxPmsaeYkewdSLnPTY9tZYUNhCClRWaESJ00RGVzKDUQf+7wdh/K/V+yYzsObJnwBeIZ5O3HwLQ0+WKCWKvXGqE4yk5jjsxVjI5B13A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UTRdstjI38BnzndNnB8Un5851WLh2L9IozItGBgtUdQ=;
 b=AGKupjQ2up2tlW9ZImbFGDlC34b2iuNJeZkBcu9ff0aUd9Z/LiMGu+hO83Ha6LRsYoQvwdPltxHvzBWDXG3AFnyKoI5IB+BpxzH9YWoiPeAIqe5yFqK5laD4WW0KF8RZGvJqH+hnKebovDtZQMOacgPKIeg7C0mgrUz4j0UdgKT2e3CfchSZ1dTfmIDOLEAnqq+Kp8a/cccSv4ov9WFJcItrA5wYY/REP4l5a0mrtAxX5a7j7ysekMIVc1Yr59gx4exTrN9w61g+qRKrIBtACpSEebyz2mi4c/gNUEROxJ2TJEFirE9kXmAw9t1JKaakIvGvrn4sTcLGQvWN7+mg2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CY8PR11MB7081.namprd11.prod.outlook.com (2603:10b6:930:53::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Wed, 15 May
 2024 22:46:26 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7544.052; Wed, 15 May 2024
 22:46:26 +0000
Date: Wed, 15 May 2024 22:45:38 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 6/6] drm/xe: Add VM bind IOCTL error injection
Message-ID: <ZkU7Ep2JrHN8UzI0@DUT025-TGLU.fm.intel.com>
References: <20240515004010.100091-1-matthew.brost@intel.com>
 <20240515004010.100091-7-matthew.brost@intel.com>
 <CH0PR11MB54442A8068E820E1A295CFDCE5EC2@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB54442A8068E820E1A295CFDCE5EC2@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0176.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::31) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CY8PR11MB7081:EE_
X-MS-Office365-Filtering-Correlation-Id: a6673c4f-2532-4743-9f54-08dc7530da62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?On7CMw2krEB8qIhY17ctK2hZvdQhiKp3tS3jmMGPw6jbxSoSR/UGEuwPWdOb?=
 =?us-ascii?Q?ZY8TgdDwhl922hQBOXt8Pj0ICF5CdSyjcx7yX96+zYuSlhkRH1LDWdIdODOE?=
 =?us-ascii?Q?YdHdE43qFmbPHuAZqWFlj4N/nBvfbbDpRI0MVOZBGSDVN7UMUqJQfyHA/L9Q?=
 =?us-ascii?Q?dKfAByaSYtNccYwudOB2lTuJlKyivvI5gD+Ln5yA4Z2p/W6vwgNeiVKTE7rI?=
 =?us-ascii?Q?ZuusWtrRrL3OgQ3avw+hd6A23mxU7C0gbT6ad2IOhJ5hTGD4u6V+LC9FBt+w?=
 =?us-ascii?Q?cTJf4NwqYK28v0pwKDTOdR1ECuVdbvHqgZodMnme+hiUdZBovR+FI1+tF0N4?=
 =?us-ascii?Q?bgW3lkAkYUVh+BTxxk/4ujnWSs2zYZRQW6+P0aQQzFeUylm4+6xSBd7uler2?=
 =?us-ascii?Q?QFnaNnRguSBxrKwItuClYXNSGXJtIefwVbCkvhHhVJXCoyrGsX2D1sAdrFw6?=
 =?us-ascii?Q?wab7fjWRCmQDvXHBfuN/aNk9Po+OjRldis4YeDL9WQhs9MWfpb8LhvJkylu9?=
 =?us-ascii?Q?Y861JCrLLw5ZdPXKpZgoX6OlOjBL1zDRl2p5b0MeK7CfGZzM44fFmLsLkSIi?=
 =?us-ascii?Q?um9H6qn0uCsxsItPWG2BahT/n9ebjL1ygDLJSlWhdh9uqXdU6hz0JtKd6RpD?=
 =?us-ascii?Q?stJsthC1humN3zS/1YhjvjapZIb4eRrh/goCCalv5ZFISGts01V8S+5CjSTv?=
 =?us-ascii?Q?1uOLD0jqBIT6gzNWTQw6FCmmZSJpm0De4tE9HjUQT7/EukwLRrrjPX1RTe3m?=
 =?us-ascii?Q?hnjPrd3iSsErYczvN8SPA0r0WUCp9kYr29BcJZkPVCzyK2wbQ7S3OLiBlgol?=
 =?us-ascii?Q?IiU0jRuJaB/fFmhzAsUXXwUwpMAGeDqadZfNhSSv9aeDyCCBjOfE2KYS7UqO?=
 =?us-ascii?Q?5fkBF7ae0NiItlBe/AiA+s/WAd1iNjbo3f9sF33Jga4QU6xC0mPMRq2JLvRZ?=
 =?us-ascii?Q?1KyWIPuiIVcaGbFFUW9zpIsaQSKzjjgkHg/yWHophpWP2n7Wu6NB+hv7oDq7?=
 =?us-ascii?Q?/4EKCyLlMC00ybf8Jtmoa6gdjCgtLW/Do7LSm8ObJ0s8mPvDYURuPBpfpLhl?=
 =?us-ascii?Q?sA+PpSygwkaCK+cfflZxvm9lhish4n9mT2PJ7ZDXi7rNQXfp7/LgHm+EVsoj?=
 =?us-ascii?Q?d3nda/OaNUVV2b+JSA8s3esKC+HQy/v2Xz66WS/cp58h4jOJyv2fz42LGu8N?=
 =?us-ascii?Q?4nCnEnfU7sX4yCtI3/MQpO6zCOzG+WwwTbvo9xHBuMBquAiUZBrcV2bk1hbS?=
 =?us-ascii?Q?Huwwmh8D8DyvaPC4H37GCpPR7YzZxDnGXF6VXomN5w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FlDH+9ZJlccS5mvd6d7LdZvWXlqlxw5zEM/q4awYBw0V//4hk+oiVtjRemzL?=
 =?us-ascii?Q?tFAkfglrpl8sISdfYbM1p62NHw1Y1wgL6LviPRs2Nzjv3fc7bfdnlP007YBz?=
 =?us-ascii?Q?6lDTIjf9Vk9xwzBwZHrwX+bsOkZQaB4kAl+zUPcHxWCaSZfekWadLmLWw6ot?=
 =?us-ascii?Q?JXeAwyakUP9eqdT3ijGmCk81MY0Th0BQA/X4aO+8unQdH3Uz91BaPLDTc/gK?=
 =?us-ascii?Q?riVMdOrswSZQ2ctTcgpLv8ULD0VKNQZQkj/TEDku0yHBLgjTV8BcFD7tEAvS?=
 =?us-ascii?Q?BO5xm/DQpvx97KDGOU5sQ5Pg/mfuK75ReQU5D61gh7a9a6MA+0AAk7BP7X2K?=
 =?us-ascii?Q?7a8SI5ocsyyhHCehNj6hS1K/3/2RKYuXs7eBK2EjyMHettaPb9RMYXUnEFV1?=
 =?us-ascii?Q?D1eSOoSHfcjp8b1FzewVPxPSeseGIOQ6rKvBp+5wS73AynVrnxt0YU0hn08n?=
 =?us-ascii?Q?A3MQCs83H8IjBW9KZbg/VvObXfXoZSldlNboIUtAiPlypU0PqVYaCoWkof4Z?=
 =?us-ascii?Q?Fl53UmPnJA4Olj/7FBIU6yoLv+lwFRFmDepYJ7iaUqj9SAOZ1oakS8Uc1+0o?=
 =?us-ascii?Q?MMbJ22BZfx6pA06ZLEWGwQUd949QjV1N10KfCK9h3O94HJY2FyoBxNdnr9yl?=
 =?us-ascii?Q?e/9nQxU/4vV1IbGSD8TVYwGl1rOfFtOWkJ/5k/1w1Xg8QFlS7csic9s9BJ/9?=
 =?us-ascii?Q?QuJrTNqAW5vNjjTME8i1NvhRiIoGF0z74/977OyNDcL+Tz04Kv5xi7wzStMx?=
 =?us-ascii?Q?Lh3Dh+5J6ohDGrrSZwnf9CsqVK8lhfUutQPs5nQWwV63paiuZ9We43uUVZAD?=
 =?us-ascii?Q?HJnxUACV0SaLjhUlzfOkftGGpjgHYY+cGSgMFaZEFIpPcQPSmtF0RygujIKH?=
 =?us-ascii?Q?JA7mf47HxIBPPTQSHADkAbqmP1J/Ck0HILrgwSNyCDwUW6aOX4XgSnirCwJ/?=
 =?us-ascii?Q?QTcMcg84cdS3s6vEQnU1hXoD5/olb1tkY06AQulKx+YuMD+C3Cs64dHEUikC?=
 =?us-ascii?Q?Q60fVz8CAmlXQneOvBQx1C/urnZCNeWoGy23VJuLDrA0ZAGm0FmXLysFy73R?=
 =?us-ascii?Q?GhEY1a3YJXhsPezRftvunxYadSBcDoqWmqpQaP3SL4qq8D8vwVOSztyV6wSq?=
 =?us-ascii?Q?v+k3jgY3BmBx/gSXo0sCmn42y6SQz1wovblOA6qK8VIdLMVws/4r2QCix2Ys?=
 =?us-ascii?Q?uyl7GuVitLgjPqAPK4IfSP8J3l/LhGt110qfmlTXySitAPK+sIp+CH0QemV2?=
 =?us-ascii?Q?3X/vVzkTaa1Bo3c5qJfRiXAJmbifPrGCeE8Qmo+Lmd8QBfbBf+9235n3EgKQ?=
 =?us-ascii?Q?MBIsDz36iXApcrhF9rogLjwN0gmINJDN52/jPiJJf5z8JJ/FBFEO4sI5aDXX?=
 =?us-ascii?Q?Mdz65gC8CiYZNHWaJ3ZtiHYWsr3RSDBGoWHW8Eu9Mg1sK7o9MZ1DXt8BGoPU?=
 =?us-ascii?Q?xIckyXeunxwy8GV5rSdP/F6Qxood7fyqtUPLjFDTe3KkHz19wuOmNFI0eNnj?=
 =?us-ascii?Q?4cQiiJzrB8B+Zhyf6JJmhpj6D5hxRlZHLnQXb9LtnmA9eY5MrLDFfGIl2/gG?=
 =?us-ascii?Q?16BbH9aQtmQgjCc1czE/MDcvow5DPPuAjDAG1ypClRvKeWV70kjt9atditgq?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6673c4f-2532-4743-9f54-08dc7530da62
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 22:46:26.3801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: azgqznuFw9sAekYCoOv9+6z2LhkLIzytMgpL1YIo5SJQEOAnQetSsa90e12iUTNq/2OXEQt+TGKtOFUycIBxWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7081
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

On Wed, May 15, 2024 at 03:29:18PM -0600, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew Brost
> Sent: Tuesday, May 14, 2024 5:40 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>
> Subject: [PATCH v2 6/6] drm/xe: Add VM bind IOCTL error injection
> > 
> > Add VM bind IOCTL error injection which steals MSB of the bind flags
> > field which if set injects errors at various points in the VM bind
> > IOCTL. Intended to validate error paths. Enabled by CONFIG_DRM_XE_DEBUG.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> I have a minor nit lower down, but nothing worth blocking over:
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> 
> > ---
> >  drivers/gpu/drm/xe/xe_device_types.h | 12 ++++++++++++
> >  drivers/gpu/drm/xe/xe_pt.c           | 12 ++++++++++++
> >  drivers/gpu/drm/xe/xe_vm.c           | 24 ++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_vm_types.h     | 14 ++++++++++++++
> >  4 files changed, 62 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 0af739981ebf..6c8c55e9addd 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -22,6 +22,10 @@
> >  #include "xe_sriov_types.h"
> >  #include "xe_step_types.h"
> >  
> > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > +#define TEST_VM_OPS_ERROR
> > +#endif
> > +
> >  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> >  #include "soc/intel_pch.h"
> >  #include "intel_display_core.h"
> > @@ -471,6 +475,14 @@ struct xe_device {
> >  		int mode;
> >  	} wedged;
> >  
> > +#ifdef TEST_VM_OPS_ERROR
> > +	/**
> > +	 * @vm_inject_error_position: inject errors at different places in VM
> > +	 * bind IOCTL based on this value
> > +	 */
> > +	u8 vm_inject_error_position;
> > +#endif
> > +
> >  	/* private: */
> >  
> >  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 7f792b7feb06..0907aeaa25ed 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -1865,6 +1865,12 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
> >  	xe_tile_assert(tile, pt_update_ops->current_op <=
> >  		       pt_update_ops->num_ops);
> >  
> > +#ifdef TEST_VM_OPS_ERROR
> > +	if (vops->inject_error &&
> > +	    vops->vm->xe->vm_inject_error_position == FORCE_OP_ERROR_PREPARE)
> > +		return -ENOSPC;
> > +#endif
> > +
> >  	return 0;
> >  }
> >  
> > @@ -2005,6 +2011,12 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> >  		return dma_fence_get_stub();
> >  	}
> >  
> > +#ifdef TEST_VM_OPS_ERROR
> > +	if (vops->inject_error &&
> > +	    vm->xe->vm_inject_error_position == FORCE_OP_ERROR_RUN)
> > +		return ERR_PTR(-ENOSPC);
> > +#endif
> > +
> >  	if (pt_update_ops->needs_invalidation) {
> >  		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
> >  		if (!ifence) {
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 7fa533902bda..2bac8539d024 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2467,6 +2467,12 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
> >  			return err;
> >  	}
> >  
> > +#ifdef TEST_VM_OPS_ERROR
> > +	if (vops->inject_error &&
> > +	    vm->xe->vm_inject_error_position == FORCE_OP_ERROR_LOCK)
> > +		return -ENOSPC;
> > +#endif
> > +
> >  	return 0;
> >  }
> >  
> > @@ -2703,11 +2709,20 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> >  	return err;
> >  }
> >  
> > +#ifdef TEST_VM_OPS_ERROR
> > +#define SUPPORTED_FLAGS	\
> > +	(FORCE_OP_ERROR | \
> > +	 DRM_XE_VM_BIND_FLAG_READONLY | \
> > +	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
> > +	 DRM_XE_VM_BIND_FLAG_NULL | \
> > +	 DRM_XE_VM_BIND_FLAG_DUMPABLE) 
> > +#else
> >  #define SUPPORTED_FLAGS	\
> >  	(DRM_XE_VM_BIND_FLAG_READONLY | \
> >  	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
> >  	 DRM_XE_VM_BIND_FLAG_NULL | \
> >  	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
> > +#endif
> 
> 
> I'm aware this is basically the only correct way of doing this,
> but the fact that both instances of SUPPORTED_FLAGS are
> the same save for the presence or absence of
> FORCE_OP_ERROR rubs me the wrong way.
> 
> I know we can't just "append" to SUPPORTED_FLAGS, but
> maybe we can use a stub?  Something like:
> 
> #define SUPPORTED_FLAGS_STUB  \
> 	(DRM_XE_VM_BIND_FLAG_READONLY | \
>  	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
>  	 DRM_XE_VM_BIND_FLAG_NULL | \
>  	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
> #ifdef TEST_VM_OPS_ERROR
> #define SUPPORTED_FLAGS  \
> 	(SUPPORTED_FLAGS_STUB)
> #else
> #define SUPPORTED_FLAGS  \
> 	(SUPPORTED_FLAGS_STUB |\
> 	 FORCE_OP_ERROR)
> #endif
> 
> Feel free to disregard this, it's just a suggestion.

That's a good suggestion. Will change.

Matt

> -Jonathan Cavitt
> 
> 
> >  #define XE_64K_PAGE_MASK 0xffffull
> >  #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
> >  
> > @@ -3055,6 +3070,15 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >  		err = vm_bind_ioctl_ops_parse(vm, ops[i], &vops);
> >  		if (err)
> >  			goto unwind_ops;
> > +
> > +#ifdef TEST_VM_OPS_ERROR
> > +		if (flags & FORCE_OP_ERROR) {
> > +			vops.inject_error = true;
> > +			vm->xe->vm_inject_error_position =
> > +				(vm->xe->vm_inject_error_position + 1) %
> > +				FORCE_OP_ERROR_COUNT;
> > +		}
> > +#endif
> >  	}
> >  
> >  	/* Nothing to do */
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 39bfa259c7be..2ba7d9ad5ba6 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -23,6 +23,16 @@ struct xe_user_fence;
> >  struct xe_vm;
> >  struct xe_vm_pgtable_update_op;
> >  
> > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > +#define TEST_VM_OPS_ERROR
> > +#define FORCE_OP_ERROR	BIT(31)
> > +
> > +#define FORCE_OP_ERROR_LOCK	0
> > +#define FORCE_OP_ERROR_PREPARE	1
> > +#define FORCE_OP_ERROR_RUN	2
> > +#define FORCE_OP_ERROR_COUNT	3
> > +#endif
> > +
> >  #define XE_VMA_READ_ONLY	DRM_GPUVA_USERBITS
> >  #define XE_VMA_DESTROYED	(DRM_GPUVA_USERBITS << 1)
> >  #define XE_VMA_ATOMIC_PTE_BIT	(DRM_GPUVA_USERBITS << 2)
> > @@ -361,6 +371,10 @@ struct xe_vma_ops {
> >  	u32 num_syncs;
> >  	/** @pt_update_ops: page table update operations */
> >  	struct xe_vm_pgtable_update_ops pt_update_ops[XE_MAX_TILES_PER_DEVICE];
> > +#ifdef TEST_VM_OPS_ERROR
> > +	/** @inject_error: inject error to test error handling */
> > +	bool inject_error;
> > +#endif
> >  };
> >  
> >  #endif
> > -- 
> > 2.34.1
> > 
> > 

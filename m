Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360EFC35FF1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 17:59:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC2B610EA1D;
	Fri, 14 Mar 2025 17:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XI8EBBI7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 197D710EA1D
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 17:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741975196; x=1773511196;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jBX7h+GVGriED/5Sqt5XIA4X08z/U7M7VlYucmbx5g8=;
 b=XI8EBBI79rNVmHMNJllqcJH261jAiQ6OTl1eC6i0Vlvogsm9ATXndbh4
 JDnoUBVmBpvm1aonq0Yv7801eMRZWxF/hhq6yL9LHNwsWfwSGotzWNNIS
 RE5h4OO/tyz/tgx4PY761/kSCQrr+4SgVqDdWmfjIsjQ3ZgvrO6kkzXOV
 FyhfZAgGO0BC6QCNd6Sx6PoON9SxWQgtwEzGUEALm+HjmJWKoBBOGR9wI
 SotXUWyX+TcVLhNvEoWWFw61FsB+dUkHLKGydZNZPCqtqo2LlU5C8YD9+
 zHOo+YA7sjNyO+/qQJE1LfQzGRpOfdEjn4kd1Wf7y2wsmNNjHIUNpfSWS Q==;
X-CSE-ConnectionGUID: vbRCIsvqQVup38HJ6WM11Q==
X-CSE-MsgGUID: GvWOImKeSq+i6qAiigv8IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="65597898"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="65597898"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 10:59:55 -0700
X-CSE-ConnectionGUID: RJvwGaAyTm2jsqvZF+eryw==
X-CSE-MsgGUID: 58+R0tOERl6/w351XQBx2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="152240209"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2025 10:59:55 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Mar 2025 10:59:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 14 Mar 2025 10:59:54 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Mar 2025 10:59:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cPJZyXKoYzpK7qDACkjjH1BwfNg/e+boEt0nVcNHyraGoHzNBsr18/NfpkKSgjvo9o7Ceqj8PXk1d/dDtNkWrWL+QBvHZgJ+KKjq4aQxcXsswrESbc/rQXPOn+Nl0akQeOruPxJPAAc4GSm9a4tzo7v7RGbcHauSMItPd7Fxm5dlR7PujyEVcgezP4VD34vMYSPHHnsfBDoDUFNneQWc5mZNF3AzSSfYsKAnxUr26ao+/ZLiMrfv4aFQx+lWRAbFGBUO+oma+E+EmveIKC+3RivrT6RvuaZ3X/iFBMZmu9WzpRukrJTcFQt4uEFtjCRzO95RipFAQOEFw08Dy+X0hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTGW2ND/2aLF++mV5RcoQb+gn7h4wIh1R3UztiH/Xnc=;
 b=IdatBf4x+xIzKsE/dWPeDQ0uz8UoRSQ39Ax07vzniLj059e/cnMuGeSGw0TC4Z3B3QDk8QcFRzAOCn/ICpdzgHDKmb27/1u6A29Ke0wpdO8WLhb4ryVWnmbgUiI7b+8sjgysrElfhGsfw3Mq/I80Ps/IrZXI4OxNksGriqDvuh2qDRWwm8/MsRFkgK+kr3/vUyQhjv6jZBFt5PjrjeiqNw+pPM1oDkGyBR5jpm61+jGopTTen6N29Cp0RzZ42/fe9NUodncyh/nqQzzpHACCKa5Isw1LbK1QGABMYwI0dBL+mCt/TmxDd2kTJVvqIZZFetU4fTGyGI7bq77DEG+yzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB7023.namprd11.prod.outlook.com (2603:10b6:510:221::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Fri, 14 Mar
 2025 17:59:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.027; Fri, 14 Mar 2025
 17:59:51 +0000
Date: Fri, 14 Mar 2025 12:59:49 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/hw_engine_class_sysfs: Allow to inject error
 during probe
Message-ID: <5be4y7dnu2ycpdn7hvirbstb6pvvm3jeyje2fkkutpgrc4a4dg@2pdofpwguuks>
X-Patchwork-Hint: comment
References: <20250314105050.636983-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250314105050.636983-1-francois.dugast@intel.com>
X-ClientProxiedBy: MW4PR03CA0106.namprd03.prod.outlook.com
 (2603:10b6:303:b7::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB7023:EE_
X-MS-Office365-Filtering-Correlation-Id: eb3d4a00-616f-4611-ba9d-08dd632204ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gT5QUe0LPS1wgz8+wuASKhaj4WnuDJHqtyx6Hyrg/yZJxazc5/kfaeydE8VL?=
 =?us-ascii?Q?/kIJuvSX+utDKBNaXD/g89/jFW7dfg8m5OV4yCOEC23gioJeCDbmDMhP83SY?=
 =?us-ascii?Q?q/W5M3CONxUduqa1DQao1TWGGNvvJCAxHgQ3EiqBEf6O3ma8sK1F6SeuvGpT?=
 =?us-ascii?Q?/im5RA35C7yYk4VabDDrmPFfVRxqdx+77kARKLuj0wfijHopoSzVIKzPz+SU?=
 =?us-ascii?Q?TehZVPs63UeLz2SQHbGLTk69mKD8bSGxH618x5ccQ9t6bWeLkJVH+z12+KBh?=
 =?us-ascii?Q?dtUBRQ7SiMXkMvllxqPw9MKov/aaBuOLCUvDsuiiBJWEFwm3D7NbXQht/5Ir?=
 =?us-ascii?Q?vol+X7nG/F87Ms2i9bvfwaHAjsSwBBOhadn7WSUgA12oxP+4bj1bWty+o19W?=
 =?us-ascii?Q?MWQjr66j+BmYm0B5/mpVLD5fGn1A0qWgmbZR7JHInoBwcanpWoZ4q6UkNOtB?=
 =?us-ascii?Q?rGQk/EXgjaDQzPZ7XudSQ7g9TZD56lI2WzIONoD4lT5ltcSaJ3gqiLTcGjpb?=
 =?us-ascii?Q?jTZphWAKhoCFE5eaGOl6xQSJs8h8X/TfZGVB/77vc6rGdgNaED1cuZyHCqbn?=
 =?us-ascii?Q?Jf5CtHv/TC6eYgo1AOZILf6TLV0apF81p0ZHEXVobqGCXUzlwZDoZWT6oBjh?=
 =?us-ascii?Q?1RQ9yCx6I+7lFmAwduk+4RuaMFr3JHk7fdb6lIh4T8NM1pzSNCjmMtywO4Il?=
 =?us-ascii?Q?2AjHouzL3QdHjHAqdXBq5fIF58LZCg7rCJSlILqMjY6+pAXsykVlkYpU9jNr?=
 =?us-ascii?Q?LgLDO58/LXzRA8ZhpxPe3mU7xPPdMkCWdOTJCoX9Whbx03nPgT1LX3F88UtE?=
 =?us-ascii?Q?1+T4caWmkmsLGvluEoZN/KqYk4FYJsLeMWiiMLCy/PG8mtoehpeeh0gTCPst?=
 =?us-ascii?Q?gLx2i7yN/7SjWI4oiXmz7k9uEDPZVTdfuRDYfbQOrm5atdJbVP0fO38gzxZK?=
 =?us-ascii?Q?lkym3IoyWNWYAYBSc02layItLITr3XZRFJwYOw63NFaskd7AQuYPXq22+N9N?=
 =?us-ascii?Q?BMXrE6dgO+jI7UZWdSe2fBBNR7CA6gtIKZyZ8zzZFgSvNkJxj5vVcnRInhe6?=
 =?us-ascii?Q?cvlnmrtdylwUNQ3QQhNigbvbhJSDF6F0QbUbCB7buopEwQ+gbGRLJn7azzJb?=
 =?us-ascii?Q?O4fifk/EWaeaJWp0LlgKklWnniQf94dEUQtg1ceUmKrBvgo/gT3KAolqAXdV?=
 =?us-ascii?Q?PKd63MYug1F71z1wqA5s/Rb4FVvwNAbS3M3+Lm5tvXPpWGF8S9aZGQ533xsV?=
 =?us-ascii?Q?eD17jg3bAZ0gj6hxw56AA0xWplBrIsD3EbeSCoEcTs48knp7j14vCSOvukyC?=
 =?us-ascii?Q?qpLRSHMOh3FWoBM492OxlDkOToi1Aho+11Ufrs8vRs+UwYe1+nl8iKXfAF7F?=
 =?us-ascii?Q?r5IjyGJoG4VOqi9lr1EF5XS2axs9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Pizd+5K6T3iqk2imQ3BKe7UBvv2bORpWXVtKgCLmW0rMHqqnAdNkeMs/Ha0S?=
 =?us-ascii?Q?pILLDFfmZZ/38+K03QnXXAI8pVpEqj6PJsAMeRYPof7VM2ac8tiqA1zcIGDg?=
 =?us-ascii?Q?/FfLwU0N8jiPCTiQBHirKOIpTZHtwA0XySofq9mAzupcWfKQGdz9+1KDxWzx?=
 =?us-ascii?Q?6hRkui4glW9UcSI+F9d4H1pehnbE2SWMgRdRIGm0PNEEtpcUX4k6CfxuySdV?=
 =?us-ascii?Q?cVKT5n/Y/obodmej3Vornvg+saAALstjFCoXz4CM8edEHL0gApkvx6xAPpsO?=
 =?us-ascii?Q?WPMF98Z+Bb2F4AOHjEAa86op+EzAODDD+6JlWnfPMtnHZNXM6E4cWx1uwKdO?=
 =?us-ascii?Q?utvDpEeC6sjvF3cdIdxbMci6tLnvR50nWFtIS44vdNsouIHkT//ty+eSo2wj?=
 =?us-ascii?Q?kXjXY1PmP3JBNObXctV9Y5qSyBk/55xn1rdPuoCwEHDDZ+QNaZZJ70CeFoWr?=
 =?us-ascii?Q?kEZ/u0KcG7ZHHPyB4fPN/NYRlbadrSUJc9RJ0hMuhtcjc5r2O92iwHO0i1wo?=
 =?us-ascii?Q?YPTFCVVWXGoyuGzLczqAKELqUc6/F/oZFgjHzwIG0ycTxzko93tHlE2l5uLM?=
 =?us-ascii?Q?aUE7hIvLQKTxy0bmoEZ5Dgrnb7pATbJ5FsVm/HrUTS0A7KWI1o+4yewhmmfL?=
 =?us-ascii?Q?JTJANIpEm6FJh3rsvlbtR3jdRVRLxausn+p4ngmMi+MWwV5lszVaYjlX0cnu?=
 =?us-ascii?Q?IX32zMgeCf7WYBBcjX+ChMelsFVNCwJT2K2jpWdMLHW35tagRDzM4WmoUYgk?=
 =?us-ascii?Q?73QZO9N/Y71a7n2iyJztWwtF7VUfFikdYuPYg139LAymOxepylQiVbbRUo//?=
 =?us-ascii?Q?4ih5aL7rOHERj48/dz+c8EPF2o3Ba/UP+BwBbbxPYYoNgSMcTLQnsWuXF1+7?=
 =?us-ascii?Q?CbQNE1iZgKGJlrzwjnpDMb1+JVTbPMaOjY+znL42R0z0DxVbhdl/tOHITWfM?=
 =?us-ascii?Q?ak+ZjPRGQcefzkeZEVwHehcpUyU5hJOUyPggQysgJA/zbNKDGcm/JOXAb68G?=
 =?us-ascii?Q?+7pUpurYuf11KQkG2f1ACW5aP18CgVnAx8sMhpBEDG4d0y8Jco0b8mfJzDu0?=
 =?us-ascii?Q?ZSD7rbujXy0n2u9eORRf7gHLgq02p0jR422K93SaDis2kZWxn+YnH9r7ThZd?=
 =?us-ascii?Q?PjlTKvxywiNEM6gbVSW/9kC29lZ83cn8AHYBXeHjlJxZ1CyHHuJV4w9VmYfC?=
 =?us-ascii?Q?sNutt7M2a159sauAnN+4saEsocuNAI1cZ/IodB8rJWl1j4PmeQRxQc63WRO4?=
 =?us-ascii?Q?O5d7Q+43yRIkX3OF3hnN+i/RIPSJWArWqn5/NETE/4T706BtgtPhDlWomdzT?=
 =?us-ascii?Q?CyJjeTn1tAb5bmNEQRbbuCu36ysAZY6we2oskLuW/C5Nxawzi8yxzqFE/OvD?=
 =?us-ascii?Q?BmSmvPqi4hgsIoXPgS6TlQKUv1n7G9OTXvYuM8qVO69l5C2Cky4YaBSNmIJT?=
 =?us-ascii?Q?GPF0noAO2YSSJl0Z61Sfbg990JmEUwfsmypr/MC4acowfu+34GqxO2Yni+Rj?=
 =?us-ascii?Q?mayN/CkHGM4SVl71RKdgEMTLuux04+nyte12ff+EcIUcqjqtVfp1SXuyIjZC?=
 =?us-ascii?Q?UsZB8e9N8gIQdUsMuhdprAWvoivbfBMOnNqfeBgyKOK4NwRwblEVqBysVbbn?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb3d4a00-616f-4611-ba9d-08dd632204ad
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 17:59:51.6876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mu+usB1dh4UCso2Wk62yvI0/agbxvfBxrDQbGOs7tyWErVjK5DLESs5BIVd8fexhB6H42p8r8Kv1a8Dt+35tg8VbzWPLXkOcWNsSll70Ik4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7023
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

On Fri, Mar 14, 2025 at 11:50:50AM +0100, Francois Dugast wrote:
>Allow fault injection in a function used during initialization by
>xe_hw_engine_class_sysfs_init() so that its error handling can be
>tested.
>
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>---
> drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>index b53e8d2accdb..e238c0e9fdd0 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>@@ -558,6 +558,7 @@ static int xe_add_hw_engine_class_defaults(struct xe_device *xe,
> 	kobject_put(kobj);
> 	return err;
> }
>+ALLOW_ERROR_INJECTION(xe_add_hw_engine_class_defaults, ERRNO); /* See xe_pci_probe() */


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>
> static void xe_hw_engine_sysfs_kobj_release(struct kobject *kobj)
> {
>-- 
>2.43.0
>

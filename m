Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C40C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 16:33:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F7410E760;
	Wed,  6 Dec 2023 16:33:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA27410E760
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 16:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701880420; x=1733416420;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YaREq5/Dddrb8nY18aG9PBIT+VuIn+qemjqvtTn8uaE=;
 b=Nt/eYsMlvpZNlDbLEDNsFv+BCAnqAubibh1Ag14fhMSa8xBOe9Cv4w3U
 oF28uG0NeeAB2ay10xVqOEUtD7uWc5ga0hWSuk5rwIcdPsbnLQRSaJMea
 /pgzVM28oTOCe0kuEJ0zpOwyxg4xt3nl9X4ssPcAzg3dgMqAFiSX7UUmH
 UrRYYqtDQXa8w3x6VFf6xCDEc8mLAbSfqs2lt43CaVbZYtRtymlNYMsfD
 9tmUFJ2yh2QcOeohyFVEkcpGnbAPPkWB+EjnWXPYPjVED0mgMlywmTnpe
 1XuQAXSblOvqruYauHEoUUlp9to1SOguhCB268iA9NA6RoLKiQkRymJgf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="972746"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="972746"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 08:33:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="771350723"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="771350723"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 08:33:39 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 08:33:38 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 08:33:38 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 08:33:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdgSuXBobXRHJVUCRONA7s+XJ4S1VnmJV+QKNq2qaRNq9JB8128T99oCJmMtBXVtYWstfIYZ7X7rgY++Q0oCFdFiFQTIlqnLTEoLYh8AG7B4HIsHZGBcC+e6Lh+10kVT8wpbcHhrtgGXEWfKTE3TSGQmruscAkB3z/4lp7qNwvOy8BUSRpXN4MnJm4XxqmyjjF9OiLLdFElTyG+QdYlwzXhvWnT6zHskQ5qp1D/WerogFzcbS4XuEOBk2PiIeo3M9GRuuVz6sdSwNIPWE11EeRP0PPlODhA1aS8epF3MojO2gqsP7w1so4naEATGFPYgHRmEdnMtPv8gIOxyjsR05A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W4JNmHkCbuGgMJIpCK5cgqRBa6WfkMaFjt7Dt8bWDfw=;
 b=fD4JILz0mdqxj3eC8e+oOigfgr1eIWJvAgkp7yEndPVPcX2AcDxjYUnm+YcztVe9lLiyCWTlvaPeRymOl3df85SdUZsAsxbv1LnfYN423uEDtBM40dpgUVQzl6pfrdOPQ1dCn+9NcBJgRkEKZ8UU/JqmdjRoMc7rJtBDDT2Uw7GdvuOi+uNejPmt2V1ls1nVuLuWvV3P8Gq1ecRl8w/g6F1VooP5XdA3WaRz/KGIpPvQjexMuNasztyOSwGm1q0S3F2M+deud5yirqLivoK8AUWgLDCnCuepx9lyAdMYoNCBlETXZJzTgjDJasO9DEPM3n5OciASA53ZbTovA4S9cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6407.namprd11.prod.outlook.com (2603:10b6:8:b4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 16:33:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7046.033; Wed, 6 Dec 2023
 16:33:37 +0000
Date: Wed, 6 Dec 2023 10:33:35 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <wpaxuzibwzygcbkoxzznwvjmb3ruvjbfauzvbkmjebq6jyxlx3@krcvv3no3x6o>
References: <20231206160617.7-1-francois.dugast@intel.com>
 <3v6lvfmd37hezn6tudgzrwv235f7wv4wct4d7zswa5qres7sfx@jovwzf4vgh2l>
 <ZXCgqvhDlMiEJNFo@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZXCgqvhDlMiEJNFo@intel.com>
X-ClientProxiedBy: BY5PR17CA0066.namprd17.prod.outlook.com
 (2603:10b6:a03:167::43) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6407:EE_
X-MS-Office365-Filtering-Correlation-Id: ec93113c-625e-4db8-e494-08dbf67918ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r/V2o23nYnnuLSVuKDRwEEx/pA8lRaZ/l48/1Z6VTW9pUKNsCG5geCnWiQOAImgDY+xfgW1QirNUx1yU2ZBiswxA+mUurVqL+/T4Xkh+PrciD8iLPR+By7eD9ZF/tsZECEoJpi3EjtqghXeTEuZ67AbZlBal2tdrD/3OpFY/Bt23apIWaeJNgWsX/9vfK2NixRXPqwZncpUH2DByOCVcqPZsyAdpgNM5xYOGljs+MPOwipHvbxiMKg9lEeyZeRlC7MOJscJwnAhrURiHSFJ/ypdW59FsAj/cTQUUplLG1YdRjULikfNrK9SV5+2GScJ6LrT5Gu2a8BYbN8NPer228sBskBfi4g1sD+BjU9i/kwm8LKnd+lnSGkUZGN5VLBlyFnXR4v1FC+4CwA4o6rlyPdKI/How3d/eBtLUyMoY/oWGRBYImoKXVwIgyO5cf83UfbWFMhztcxk5YiOiu30KrH2la4KEXCtuIvDehodygiHkKjS7KvzqmgV8/tcAhA/7ReXNw27/fOQlbPIHL+Ia6u7hq3jaWLAsV0afR/org/DPOyROBi2mumpTOhf8um0H
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(366004)(346002)(39860400002)(376002)(396003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(2906002)(33716001)(26005)(83380400001)(86362001)(82960400001)(38100700002)(5660300002)(6506007)(8936002)(8676002)(6862004)(6512007)(4326008)(9686003)(41300700001)(66476007)(66556008)(316002)(6636002)(66946007)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zh9otZUVRmV/vTLXZgi/bNnBXUqpKSBSY8SyxPs+Vt7Aiv1PvjW+eNunHxBb?=
 =?us-ascii?Q?hs0UTKWFRo559MNDNG5efmcb33i7MbKXatF6hCQdEgArtF7x59cKGyTohvxk?=
 =?us-ascii?Q?Iu/6h7uMVTSjpeTDsmFyL0mXsoFM7cQB7+jCSzKk59y4P3LdnOUcN0Tuv5wt?=
 =?us-ascii?Q?TmypAp7pzRe/hFF6QIdi/efaFMZaHMOYgFzLbAUJ5zyI/ghK4c67csBlAEEl?=
 =?us-ascii?Q?S2KTFWb6viiUR8UKofR43fZQFuR8tu5fKpWdLatF321YX+HPlXTYpE0aEP3A?=
 =?us-ascii?Q?bJpP5N0/QPoMhfIBoA65VeV4yxYMpEshB3wxu6jCBnnd1zU+w/uOfUJoB14q?=
 =?us-ascii?Q?L1SqSUjQyHVqzNPwX5nSImjASqNa807FaUBSb3EV1Q+z2uJ/ghPdd0hC+mt7?=
 =?us-ascii?Q?3w2ekjxTlUg0I5983VCmP6XL1TPL/95HW0U8m3dmbyhQ8czH1V8uBIAkzSk4?=
 =?us-ascii?Q?U+42NeVXZzuGaeAsVikik2Wk06SnAH0azt6AHVKe2KV5/sLp/bRM6fTgPRfo?=
 =?us-ascii?Q?2SxHvrPHe5lv9oPGnaAyKr+b74ACJwaWKjg12qzfiqb73o7TtZV1WgFM0xKd?=
 =?us-ascii?Q?HATe4lg1yIHq2Z0JvOJhkLu8pwp3hz/xFOvIOp4l40dw9VQQ/27XsBwl88oT?=
 =?us-ascii?Q?6om6tgLHOxxU2KRZcl2OFQbPzEzsm5JvVK4znYHa5m8LdgQLpvJg2YFkJbe7?=
 =?us-ascii?Q?nv1mVdGStsmMY9DrelyQ6805Hko8i/lUQUqhNwYHhXlNCXN2MNnHm2P4uNsw?=
 =?us-ascii?Q?B62KoedpLWZ0vvVdPVMh1otH1Kh1koHj1P7tTIcCD7ASaiVP/jARxfYNJDo0?=
 =?us-ascii?Q?JwMwaE0dp5CrDYO/JJ/VxXd13nnUcJrGYAeQC54h2oANyuXrxh6iOisogia8?=
 =?us-ascii?Q?TiTepMS3THWA2CbSrqugocpvlUo6NqgLt0xfRXtxCQT5bvj1LU8yUAlDqdwH?=
 =?us-ascii?Q?XRyWAWzl0/tY4tbVAhB4fg2oh6IZpupkQcGl6CrTkeeUWyN/M/mGwb50RnDb?=
 =?us-ascii?Q?TQjM/aF94g5/5dHX9MLpdisFh0Gtze+Rs4DXnqXx4SKUjA+fZi2nE4lUASnE?=
 =?us-ascii?Q?R/uoM5ACmoNU+ZK+7eL5s7hOW8CfW0tKJ1daaVtSOjng5WZdjAnGPm3eCwVI?=
 =?us-ascii?Q?Lpa0zT0YgVdIaq3BNBeiGXfEEetWFE2L92aEfDLHcuwSBVWCppNfV7L5PHEn?=
 =?us-ascii?Q?n1ipQgqh2SQMev6mZziyDgurQvoIky0DFqqzM/nt+vDcIudmODZyFdACT+F8?=
 =?us-ascii?Q?Ch3zPjAgNL6SM5I29nCEyGUZlOsIp+ideROwqW8kwUDbj5LjvlsdQBOKHG3r?=
 =?us-ascii?Q?WyeUO39Ygh4W2+jjMmyQwO9SYxSqeFig8rtQ/pBtzlfsf89VIKKV384faRPT?=
 =?us-ascii?Q?cqnqa1hRBz2k9tOynwlwWyUvCoKKa8EGT4Sf2mbrrlidgJtMRDCUoCxrXw/L?=
 =?us-ascii?Q?QWFHYTQAfvgTpUoIYOJoVHd7FDQSsgCAMSzrROKrNuSEUXolHj3cXbdAWWXO?=
 =?us-ascii?Q?yAyGIlyeuMKFPWECJva/wGOrOG5GjZPB91bwXYWEzHLXcpzCovczK/39iArA?=
 =?us-ascii?Q?diQKCLcuPwUueXA7tTBD6m1sijYN3h2avRlgFkuCnCKBT6hBJL6pyQRGcoTj?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec93113c-625e-4db8-e494-08dbf67918ad
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 16:33:37.0247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IViYVh09hnwPJIRfamx8yYmbovDNVlpVVQ2WyfVV1t1tjj7tehaG7PoqzVMh1kjZ7QLoicwiFzYby3hVUqdu7Im52UCsUDijMRF7T2T7UZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6407
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/uapi: Remove
 DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Dec 06, 2023 at 11:26:18AM -0500, Rodrigo Vivi wrote:
>On Wed, Dec 06, 2023 at 10:16:22AM -0600, Lucas De Marchi wrote:
>> On Wed, Dec 06, 2023 at 04:06:17PM +0000, Francois Dugast wrote:
>> > The exec_queue_set_property feature was removed in a previous
>> > commit ("drm/xe/uapi: Kill exec_queue_set_property") and is no
>> > longer usable, struct drm_xe_exec_queue_set_property does not
>> > exist anymore, so let's remove this.
>
>my bad, sorry
>
>> >
>> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>>
>> should probably be a fixup to that patch? Anyway,
>
>no because it is in the uapi header that gets "copied" by the UMDs
>and IGT already merged and Mesa likely... and we cannot do fixup
>on their sides.

wat?

any UMDs would just copy the header and point to the commit it came
from. It doesn't matter if we used a fixup or not.

Lucas De Marchi

>
>Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
>>
>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>> Lucas De Marchi
>>
>> > ---
>> > include/uapi/drm/xe_drm.h | 1 -
>> > 1 file changed, 1 deletion(-)
>> >
>> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> > index dee750385161..346007e8074d 100644
>> > --- a/include/uapi/drm/xe_drm.h
>> > +++ b/include/uapi/drm/xe_drm.h
>> > @@ -53,7 +53,6 @@ extern "C" {
>> > #define DRM_IOCTL_XE_VM_BIND			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_BIND, struct drm_xe_vm_bind)
>> > #define DRM_IOCTL_XE_EXEC_QUEUE_CREATE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_CREATE, struct drm_xe_exec_queue_create)
>> > #define DRM_IOCTL_XE_EXEC_QUEUE_DESTROY		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_DESTROY, struct drm_xe_exec_queue_destroy)
>> > -#define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
>> > #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
>> > #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>> > #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>> > --
>> > 2.34.1
>> >

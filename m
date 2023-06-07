Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CB0C7EE23
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 05:05:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C800A10E420;
	Wed,  7 Jun 2023 05:05:39 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5AB410E420
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 05:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686114337; x=1717650337;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+obw25f8GL/NtlX6aO7Bd4dZ04ahUPEFIM1eY+CEj08=;
 b=JUo94FwCJTK0UGQKoMpdQUYRmgGroKAwGBYJzQsCVL3xnUTulsCkwz8q
 fVoCLD/nIz/rPz6U+hon7/ZrWTXyejOnYZ0CXDH1T/fmDaClMgVJ85nB6
 gkuKY7HCo4zHLvQQu48Lx4FaA0K6dHAO4Zwn7HLi4nRuerpdbFvnGQJLw
 6mORiqrxM/aaeexALhqQdBujvL6k30xMx82NiQS4Tu9j8KjwmSvIkwFdV
 sMnY5yg1H6AeNn6tS+ZAxZ0C7nMY2WSd4ZNcs8gnqSTi4mmcO8r4P9cBu
 YBJI/q/sN80jGXJti6C3wYupn/tdMn2YRDQtM4vS3y42Ke35LqrvtLwic A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="337242915"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="337242915"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 22:05:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="833505585"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="833505585"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 06 Jun 2023 22:05:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 22:05:35 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 22:05:35 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 22:05:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJGBmwIvDfndFWRM5N4iVyXSbCURpzkvst0GtconkMMBP6c5ZGMlXTQvE+J0eWlAg4bQVS0+3f6H0Rcmpp3aH+ulhhNyKlBz0st/muwc1j934R48d42240ytQBD0wWgrnXfg6IiNy4D9DZ5XND4xttop6PRcfT6oTHbgUMxzCSElziQ34wHoxzAGDoWsNetcuisvp1AU8+W0NEbyGsfZJ7aAP+lKRv5AosI+dpJmOab4TXeTlU9RtT1MxpxPM0x4DPiyc3LJyZ+Qt6wBnR2DztXC1qHnhfAAIRo5/OJ+EttiGLRSLE1xHCZSAktPzdN5sgGtsMrRVqAmQUe5udAuPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nMNWr+FZn+Hyq03+jAJ8RLf2gkj1u/QOjyjeZZV+qa0=;
 b=YG9ei2Kln2E7TkHHHQOd+Glw5y5tNLouxeH5aEk7dMwIGnJlRq5zopoQvmPWEmoSWD0bqQo3OhqaHEpa2QIlnW3OOekvw8F3N6HvQEqlENcntwDMTPmuiz2t1F7y1iysBU2qg/t2wBGUVfxdAHc4VYXztU3G5TEQ/0Vo4PiLObG/QirRE9y1nQ5FoL2WLHNaHK12ExVmHZV/hYtF3o2bURys7/uRhJFugep0nZhrk612/+qjBK1KLcb3v2Gu8jeEH05dtofQef7xGuwGB/5SQ9NhlmotWZEllUzgmoIf/jHCuBJh35qrQoERYErcaRBhv00RrS67VspK+FqnmqExkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB7932.namprd11.prod.outlook.com (2603:10b6:8:e5::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.33; Wed, 7 Jun 2023 05:05:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 05:05:33 +0000
Date: Tue, 6 Jun 2023 22:05:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <w2j5bb6kngaaqox6vj7qzqpwj2w6ldovubpgadvg2vt2du7y64@hqhhmpjrz26z>
References: <20230531152338.6-1-francois.dugast@intel.com>
 <20230531152338.6-3-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230531152338.6-3-francois.dugast@intel.com>
X-ClientProxiedBy: BY5PR13CA0029.namprd13.prod.outlook.com
 (2603:10b6:a03:180::42) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB7932:EE_
X-MS-Office365-Filtering-Correlation-Id: 035e42cc-3e8f-4028-5e90-08db6714d27e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rDclWp3vCZzYsfTI06RWsJ0nn1+/OewWXkX5FGs833S8RXISYQUQd2Uo7EZMauO+645V0Ix7jw93XUjfjlj3YNukUvUCHW3NjjGt8MG2Jtv4oEC37uAmE4Mv0OCrYULTfQ/bvSkQCTfIiCFUfuXFI3PwiuZZqZJwGmZp11sXDKydXeMa8d5+xWCptPdGYXyaTzDC8z5uuHNpX6GfU0yMTMzDV+fT+1Pl1MffbeKTMpeS+oenxyOjnbAXrIYpNu5AIbv2jW4eimiE5rPZJoHW7E/5Lf+k6TIafxYTbvUVwfKp3UNOICb+IxJNO5Atlq7JwLGkqFFUrsHLthbsRBnYCWkaKvFOqmly9Pb5Drd7kMxGjDBZ+q78+kpL8H6/LvMysZ+0BjLjQEgsLvE+4gvJPVmOiZBfb8bDSdBw4Z1TqguSEWpYXsnqn8abbKMpEpyZTzwEymvkrsj85/NX2fw0hQhZx/MJvHJmZXjf7Uow62PIZkVCcbSpb/249CPHdmo6OLVallO2D8fVa3sWwcNIyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(346002)(396003)(39860400002)(136003)(366004)(451199021)(6666004)(966005)(6486002)(83380400001)(86362001)(38100700002)(6506007)(6512007)(9686003)(82960400001)(26005)(186003)(33716001)(8936002)(5660300002)(8676002)(6862004)(41300700001)(316002)(2906002)(478600001)(66946007)(4326008)(66476007)(6636002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xO+Cw515bJrrq32V00AdeCwhZrlrO/INLtLXqh0XTx2Ggz+A1Gc/n8tbCtgk?=
 =?us-ascii?Q?fBt3qzbb14O2LpOpC4bZTCWy0JWQRjdgtLds4PWEuq3qJBjqY9Tffw/HQAFp?=
 =?us-ascii?Q?81uALEwGg9Io8GDM4TmYZEM/W2eh7dUwqWTBw4ZbXkXUWeOIomEooYI77TcQ?=
 =?us-ascii?Q?o5/vlSfAfFhERdcx3T+2VXMPpn+3HsqmIe5dkqUC2Js9sfa0Sq/cqlfJgY4p?=
 =?us-ascii?Q?1xkpH2ulIOJpPO6APvQVTBRABYR5N9zrxf8o1oW5IKhSZMfDBT2+NiJNoPag?=
 =?us-ascii?Q?+UqXoMYXn/X1QbtqDk5VR08eFdsqKIz9JFt6TJt6YnHVO0eAlBpnHZdqK+3l?=
 =?us-ascii?Q?tNbl1e/n4xOd2yEE607ym8ow2Gnr7uvt70TRRqEWFqn7RJNnRzzm5c+PrK5E?=
 =?us-ascii?Q?EihPpwc5q0JHiCxw5k0FFfw3IXbgsJUrP2YOV62Fu4hAouxCVEgCfzz9tHFe?=
 =?us-ascii?Q?oHSUV/EVB2yC1u/0QcAvhrCt/DGvvL60z92GbglLt7BcITF6CcBZ+1HScb/x?=
 =?us-ascii?Q?zOyXZq2jlvVrvV7budLa8KjbCEcQeGRsBhWVUkDvAMhrqt16dj6m/3OO1sxm?=
 =?us-ascii?Q?ndSjjWPBljEEXl+H/KUH1jBwAyUPjIwPhjHUUVBdsEpd613FfsKlHHc966Zw?=
 =?us-ascii?Q?tYVjijaSj+qnYSlXq49pwS40BM98llJyBikM0gPlCZzGQP96cHeL5Nuwa32n?=
 =?us-ascii?Q?sjO+KCGhmQGQAYh2IrWGXgt3zrHnCgutvaAxXpdnppC54kSsaP8IzuXmJJ9G?=
 =?us-ascii?Q?81Zb1jhV/eBgiFIVUyr3sFFkX5wusN09ar5hA1+aPV446UmnBqVR2H+YXOPt?=
 =?us-ascii?Q?zUSiiysS4rDs4yQFu70pTmt7S151IeTOcDydEiw1aSuUCv5fiU7XSGRRaTRd?=
 =?us-ascii?Q?W/qJl68iEBP8CAiays0MeFqDPFHpbaNFhOM5c7ZgBCWAH9zf1s6HgbuPvt3n?=
 =?us-ascii?Q?Dcew1KuU9cvu0jmDHR9U9w2nSVc/Mf2562Nk85FW8u83EnrdLxJ3GdmoRdJs?=
 =?us-ascii?Q?aqhJb8UaqofZW8Je1UgqGscD06afSMrpP+YOaRESmUSADn0W74Hr2nEaqoA/?=
 =?us-ascii?Q?RBDJ7fwLGOEXpzaB38LbheHZUpzI7S73iP5MUnVTdsSAeShXcLqwq3kouCDf?=
 =?us-ascii?Q?V2aTb2B4dM1eV97mXCNfkhPq8g6WJKX0WGQMbccQ0iB/9JD/xJBNFQS5FtV5?=
 =?us-ascii?Q?2gI03pkU2Xw7Noc3wn2EG5YMUn9AP3nNxt5fc+s+EfzzJxElG7aFvvz5pHuS?=
 =?us-ascii?Q?XB6zyDWlux0jJWSGeH8jvHuP2J63xZlZ0Ya9vgoW3CFsby+A0etjTMux+zkM?=
 =?us-ascii?Q?KuS3roRPYSe0frYNUMKI6Zq+LwBqA3HlXEWIUdmt4Y3fVV7bTo9GD27+seWc?=
 =?us-ascii?Q?WSjs7fyIF4/zFGp4N/bdZYu7i8MArq4EA9UPBiy3Eyprt+a99/N9xiqqtZvx?=
 =?us-ascii?Q?phaMMLlpK0e361AVgSm2IvKwe66aGNNAT3kNpGJaRWt+4WcTwGCbPH3bgifN?=
 =?us-ascii?Q?cD1XVlO55hohRaLUFTdvYUlpLxSaigRo3hwGmq5jIyOQHPpjcV5boPvBEp2U?=
 =?us-ascii?Q?IOgGF3C5yD0NuUxrQPU0hl6hLPV9G9HL/PazYvtoutNy5iwDl3/eer1k+xWJ?=
 =?us-ascii?Q?+w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 035e42cc-3e8f-4028-5e90-08db6714d27e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 05:05:33.3583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AP3uV9Vt8DQphGwLDdbfJaZi+JIRWjvByEzFgKr8uqP8Z8x4XHKYYjjNoODIqTs/YBSRoItFclAdzmJoXmrPnw5WGDoktEnWFBi2bCdYB0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7932
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/5] drm/xe: Group engine related structs
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 31, 2023 at 03:23:35PM +0000, Francois Dugast wrote:
>Move the definition of drm_xe_engine_class_instance to group it with
>other engine related structs and to follow the ioctls order.
>
>Reported-by: Oded Gabbay <ogabbay@kernel.org>
>Link: https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> include/uapi/drm/xe_drm.h | 36 ++++++++++++++++++------------------
> 1 file changed, 18 insertions(+), 18 deletions(-)
>
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index ac3cfc1fb4a5..5d34b570a305 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -116,24 +116,6 @@ struct xe_user_extension {
> #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> #define DRM_IOCTL_XE_VM_MADVISE			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
>
>-struct drm_xe_engine_class_instance {
>-	__u16 engine_class;
>-
>-#define DRM_XE_ENGINE_CLASS_RENDER		0
>-#define DRM_XE_ENGINE_CLASS_COPY		1
>-#define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
>-#define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
>-#define DRM_XE_ENGINE_CLASS_COMPUTE		4
>-	/*
>-	 * Kernel only class (not actual hardware engine class). Used for
>-	 * creating ordered queues of VM bind operations.
>-	 */
>-#define DRM_XE_ENGINE_CLASS_VM_BIND		5
>-
>-	__u16 engine_instance;
>-	__u16 gt_id;
>-};
>-
> #define XE_MEM_REGION_CLASS_SYSMEM	0
> #define XE_MEM_REGION_CLASS_VRAM	1
>
>@@ -518,6 +500,24 @@ struct drm_xe_engine_set_property {
> 	__u64 reserved[2];
> };
>
>+struct drm_xe_engine_class_instance {
>+	__u16 engine_class;
>+
>+#define DRM_XE_ENGINE_CLASS_RENDER		0
>+#define DRM_XE_ENGINE_CLASS_COPY		1
>+#define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
>+#define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
>+#define DRM_XE_ENGINE_CLASS_COMPUTE		4
>+	/*
>+	 * Kernel only class (not actual hardware engine class). Used for
>+	 * creating ordered queues of VM bind operations.
>+	 */
>+#define DRM_XE_ENGINE_CLASS_VM_BIND		5
>+
>+	__u16 engine_instance;
>+	__u16 gt_id;
>+};
>+
> struct drm_xe_engine_create {
> 	/** @extensions: Pointer to the first extension struct, if any */
> #define XE_ENGINE_EXTENSION_SET_PROPERTY               0
>-- 
>2.34.1
>

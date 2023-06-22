Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C26DEB64D8
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jun 2023 15:09:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5468710E57E;
	Thu, 22 Jun 2023 15:09:41 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9149510E57E
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jun 2023 15:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687446579; x=1718982579;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9JGr2BRJB9cIWINVhwEvzOqfy04j8qnEyAPyoiBnFu8=;
 b=hYu3HqpbvKG/5lyZ9JknFO8QqWHqKOlbRrxz53i1IBRIEYb2AX0T+7rA
 gSFqOrnfH+NPDCBYsLlM81SaatX0/g33bUvw/mP4BaEAJ9HiR13c2FoBu
 lbQo71gwCQd+AsOFht08y2ntrbQtbobCLCnnW8Xem7CCo99e8IKRkfLsJ
 iRdauBQgJG/vBrhP0Xq3AgLsIVdwIU69ewLW8eTAcoWToHPDnrj2Z/58z
 Sd/My7iAJfHRG0PUDvDgnSdTSxLEdSczQFkNStmrbDSmNkT57NNipqrN0
 GJAEil9rwunSi4Fjdw6duUig6nxbs4urbDpr58aJ9XPNG9AlOxMzh1VYq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="363955563"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; d="scan'208";a="363955563"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 08:09:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="744629136"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; d="scan'208";a="744629136"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 22 Jun 2023 08:09:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 22 Jun 2023 08:09:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 22 Jun 2023 08:09:37 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 22 Jun 2023 08:09:37 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 22 Jun 2023 08:09:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQHp91x0V4+eUMAOT9axGiy1eDunwkGT1Z6k1l3AQ/kx+K5PYAs6MllIoMh6+XagQyoXcpSS1rrmcQMXX1A/6sXUsy/ttQ1/Snxwxt6b161CE55HptYoVjRNwlWSGaWoslIL4hZt6LMtX98LAPZ6HoJcwnxdhus9XaFyhcZaU2PyaTTBi9CU7nI8bde1GkeBRgVegc/L3tSs3tUptO36w6lqM27mM0wfG/1pWL5yd0FQyOv8p3h/0czkJhqNTenUt4oJvYx3vmvE7ize2XHqj0n7DOVnQIFoN9q3Pphps1/HeC2Xiwj1YbOG//d9vYa1XLVRIaI9heLspGUVA4bYiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cme6CnMTOzz4PLsmdIvLeP1QqH2dLKmg5GEp2CJDEFg=;
 b=frfEnD6tTYt+VHM7dVHcj+ejxfuYNPL/gZNrSObnQyoDU5wCghpxdMAjIty+ZfMC0CHPXs2gwn4S+bUhcXZyKN8fk27tXskOJcNn3TE6zJTfpncdUYMFO/bF3gaAqGmyyBnTu81wNDSkDNI0kfuDSflqw91u+udDO49f8Ex+8UN1kY2ne7oS/GxRT5WLSJFrkiyRZMGyNNdY91Y8y3xBjlrGsMA7UtzypuydLRmUvhyK9fPG5z25u8lo+NtBIDh6Yox3zMoGUYzAD+oib1dd0u10sjSvYNdZ2Dtd1wGCUQ7fpyZ4Qaxq89Y48FS+V6nTyMQ/Ina43fSfLOTqueHeJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6029.namprd11.prod.outlook.com (2603:10b6:510:1d0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 15:09:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%7]) with mapi id 15.20.6521.023; Thu, 22 Jun 2023
 15:09:35 +0000
Date: Thu, 22 Jun 2023 08:09:32 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <7llgxyzbn3zmm3tuqk2pdk5werc4ihn44o32bdazqqzazkxhrk@3m7h4zknatnr>
References: <20230622123946.7-1-francois.dugast@intel.com>
 <20230622123946.7-3-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230622123946.7-3-francois.dugast@intel.com>
X-ClientProxiedBy: MW3PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:303:2b::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6029:EE_
X-MS-Office365-Filtering-Correlation-Id: fa435a7d-d649-49b4-fd9f-08db7332b073
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dyzxgTA/NKXAs1kAAWC3m0G6fe34QkUprZfZ5v2wnhD6A+BFCK/PnOj1C2YyuJXHjNpLqMQDVvmQjqm4/RP2/AgNCuNRXABvmW2hVlnKgKDo3EaolRwUyzSpdfCTNnbvDs0TLTu1KPq3wueycnQCJhrKdIJFsHzeOwAZkh4HlBgS2HIgF/gahW6tnoEP9Rw1AqG/AMGCa0wMh7PBe66epDgBYlOhMbouQ32bsUpJV8nMFuPt6E4m7c7jK88Aq3nsC2cfwSCw0ZEQpLaPtapLaUwYHFNLN64ENTXB7gZ4j+kpvuDwez5omT1QA2f4hdAxw3RC7t3+ggMvsVFKuxgcV2UECjtn26YAWt8HMB0BvnmrCtJSLf1cJGgmLF20GzN5himxS3hLM/CWOvsPkkGRuOw+RC0Ny3TsfSBGqPKL22OZ26LgqCT985eP0dMuaCoYXRV9EMyb7hKxCHZSz/7YWkiGL1lklm8abVxIqWbSJwH8+Fi+nyRknhLh774WfZAuHQ/7DrtRIvIPtB3hEgzi4gjcF6UA3yNKMUo0yS3FFHs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(136003)(39860400002)(396003)(376002)(346002)(451199021)(82960400001)(9686003)(966005)(38100700002)(5660300002)(26005)(6506007)(83380400001)(6512007)(186003)(41300700001)(2906002)(8936002)(6862004)(6666004)(6486002)(4326008)(6636002)(66476007)(478600001)(66556008)(66946007)(86362001)(316002)(8676002)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q6gBN6arQeXmdTmHYT/Id8kVP9xSVHzz9aSrKuqwQAZvkpZfpgnKqgVX2YER?=
 =?us-ascii?Q?H8XeKNW1SiQcg8IxmBVVppWYZZNxswHyiooIbzFdtCl8NGuzdz1+xR3jQ/ej?=
 =?us-ascii?Q?/mF9OJxArcd8vRUSBiQHbqomXxym58DjMk4OOsZeACt2VhAVTI+DD1B62M/0?=
 =?us-ascii?Q?ijIHSxeRxTdHiZocoey/AUem+cE0zW+HQ/4trO2hd7/m0AluYwit6nj1X/j7?=
 =?us-ascii?Q?tglOMtAckFXv/2bA9qWgIKgmZ0i1PriEQb4fSXJBBszd0PA4MdvqhyEIFnjw?=
 =?us-ascii?Q?xFkb0UbB34LhIpcHpnhPOQh+mDvqSDCnlcpnkGEC2vZ9/4PC1CqWCHV30ZCI?=
 =?us-ascii?Q?LDQE3dVaPxzW+wK2zK0pv9qTJWvFIVDrmfUUcs2VUFeDr6taVa+8ximl1YJW?=
 =?us-ascii?Q?7UCiJY8J+dVh1U/j32iUd23VzzDSq9qLCFSlnsE86DYVi6smO97tI12wqrXg?=
 =?us-ascii?Q?bj01x0ZUWb5fylCX94/wcMBAgr0svYxH0RTPND2lp/6FpUmViRYd334aBkOo?=
 =?us-ascii?Q?ZhiscaMP/IDAvmk/u77VjC3SdHsHbmesLoUiylF+wSiw/gvn5QrbosnbBWQA?=
 =?us-ascii?Q?gCBGQFXOvvA57KLW1z5hLs3SQual1zmp75+si/hpXMZCz0f1qm7+LoG85k10?=
 =?us-ascii?Q?pQ0iVMJDf1QNX5qdLxBe1o88DfRRbwa6uuqO5pGmsfHPfiHOKTzy/MHI4Qse?=
 =?us-ascii?Q?qjogVgQtyGmOeNkiqxJ9vDrqDIVbWi35Cc4eHuo3Cd+P7gGsPmCFbPorywuQ?=
 =?us-ascii?Q?0O6v4P+J2TYX+JfYQoRCQh4WsyCFDpdB/En+wQvIwe4ZGG/JHYPVcVtGU6Qg?=
 =?us-ascii?Q?Tapqx96MklEhMHuVVCfrz9vCTWgx07jhKRK0YFFDT9zw3N5kaj7Vx4ZtfuPR?=
 =?us-ascii?Q?I13uBFxtvD6tTrmHk/LnWQQmh/hmvWtuj2fax/RuvWJnmu/+z38MBFOgFVZR?=
 =?us-ascii?Q?Ffv7ldPcd4ZOkmYq6cQQlWhMhbVosrphgdapwSGG0E+QxhWgikAI/cJNRBEu?=
 =?us-ascii?Q?GQ5bQb3DSo0iLPzf1UcNKmUcpnKs7zgBPOi8IL25Gai93saUtAo2ZX/NkLUE?=
 =?us-ascii?Q?uT+xmFPZbVOYs9hHvtMN9HIVsr+iSBQnOUB6HdhKHkeqnLiYo26pHpSBFrWn?=
 =?us-ascii?Q?BnyqpMgg25kO5pK2RFWYaoi5xBhDl3rAWij94T+prIFzo8UmYZpVyJDfcS5e?=
 =?us-ascii?Q?wzfCix6FemTQmcVOF7p6Iohsg1rsalpXFIiPa0zzGP9gziBO4ElpfRQupgFX?=
 =?us-ascii?Q?pNe7kfJUU9lzZV4IC5dpUmnfC3qhFFkiJyS1xReAZ93rv8Xuu4mpLqwvJaUj?=
 =?us-ascii?Q?Ra+z9MlCm6uU+/iLGkaN4qAud5O/2WnhAVwjmbOE7vZxFput8razBFfqqFI1?=
 =?us-ascii?Q?OF+JvlMTpvAjWzCoNWw1Y9pWXwfJUk4PGho23Jd1VUcYV+SiA6F7mOBK5QKF?=
 =?us-ascii?Q?Mj3Qb7XXYteHWJbPdDkq5ktACggqD+a3ja2cFC/hukv7B3KeQEk5AGhWzNyS?=
 =?us-ascii?Q?08dbw4m2ieZB43o1NyPGxoumVZWBnoUPVVJssTFeaMnZ7cF2BLGIqW55tDfy?=
 =?us-ascii?Q?po+PoCDg/E9bOBzoHWepAzLkTxg+SDsNQMSzLSKz6A+HZg+1x4W0g7gyrOxF?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa435a7d-d649-49b4-fd9f-08db7332b073
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 15:09:35.0523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sf0Rd6cVbwcN/knMVymnI5NnV/+RJSRWzvmqZ0vmVwiH1e8Le/iXIqHMtrOGOK4dTNtQ6VeHWcI9DrVvj7Yihmr+ucFxAuexlzuhCCuyu4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6029
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 2/3] drm/xe: Move defines before relevant
 fields
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

On Thu, Jun 22, 2023 at 12:39:45PM +0000, Francois Dugast wrote:
>Align on same rule in the whole file: defines then doc then relevant
>field, with an empty line to separate fields.
>
>v2:
>  - Rebase on drm-xe-next
>  - Fix ordering of defines and fields in uAPI (Lucas De Marchi)
>v3: Remove useless empty lines (Lucas De Marchi)
>v4: Move changelog to commit
>v5: Rebase
>
>Reported-by: Oded Gabbay <ogabbay@kernel.org>
>Link: https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> include/uapi/drm/xe_drm.h | 73 ++++++++++++++++++++++-----------------
> 1 file changed, 42 insertions(+), 31 deletions(-)
>
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 9421e144005d..f412150fa636 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -60,6 +60,7 @@ struct xe_user_extension {
> 	 * Pointer to the next struct xe_user_extension, or zero if the end.
> 	 */
> 	__u64 next_extension;
>+
> 	/**
> 	 * @name: Name of the extension.
> 	 *
>@@ -70,6 +71,7 @@ struct xe_user_extension {
> 	 * of uAPI which has embedded the struct xe_user_extension.
> 	 */
> 	__u32 name;
>+
> 	/**
> 	 * @pad: MBZ
> 	 *
>@@ -218,11 +220,11 @@ struct drm_xe_query_topology_mask {
> 	/** @gt_id: GT ID the mask is associated with */
> 	__u16 gt_id;
>
>-	/** @type: type of mask */
>-	__u16 type;
> #define XE_TOPO_DSS_GEOMETRY	(1 << 0)
> #define XE_TOPO_DSS_COMPUTE	(1 << 1)
> #define XE_TOPO_EU_PER_DSS	(1 << 2)
>+	/** @type: type of mask */
>+	__u16 type;
>
> 	/** @num_bytes: number of bytes in requested mask */
> 	__u32 num_bytes;
>@@ -270,15 +272,14 @@ struct drm_xe_device_query {
> 	/** @extensions: Pointer to the first extension struct, if any */
> 	__u64 extensions;
>
>-	/** @query: The type of data to query */
>-	__u32 query;
>-
> #define DRM_XE_DEVICE_QUERY_ENGINES	0
> #define DRM_XE_DEVICE_QUERY_MEM_USAGE	1
> #define DRM_XE_DEVICE_QUERY_CONFIG	2
> #define DRM_XE_DEVICE_QUERY_GTS		3
> #define DRM_XE_DEVICE_QUERY_HWCONFIG	4
> #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY	5
>+	/** @query: The type of data to query */
>+	__u32 query;
>
> 	/** @size: Size of the queried data */
> 	__u32 size;
>@@ -301,12 +302,12 @@ struct drm_xe_gem_create {
> 	 */
> 	__u64 size;
>
>+#define XE_GEM_CREATE_FLAG_DEFER_BACKING	(0x1 << 24)
>+#define XE_GEM_CREATE_FLAG_SCANOUT		(0x1 << 25)
> 	/**
> 	 * @flags: Flags, currently a mask of memory instances of where BO can
> 	 * be placed
> 	 */
>-#define XE_GEM_CREATE_FLAG_DEFER_BACKING	(0x1 << 24)
>-#define XE_GEM_CREATE_FLAG_SCANOUT		(0x1 << 25)
> 	__u32 flags;
>
> 	/**
>@@ -357,10 +358,13 @@ struct drm_xe_gem_mmap_offset {
> struct drm_xe_vm_bind_op_error_capture {
> 	/** @error: errno that occured */
> 	__s32 error;
>+
> 	/** @op: operation that encounter an error */
> 	__u32 op;
>+
> 	/** @addr: address of bind op */
> 	__u64 addr;
>+
> 	/** @size: size of bind */
> 	__u64 size;
> };
>@@ -370,8 +374,8 @@ struct drm_xe_ext_vm_set_property {
> 	/** @base: base user extension */
> 	struct xe_user_extension base;
>
>-	/** @property: property to set */
> #define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
>+	/** @property: property to set */
> 	__u32 property;
>
> 	/** @pad: MBZ */
>@@ -385,17 +389,16 @@ struct drm_xe_ext_vm_set_property {
> };
>
> struct drm_xe_vm_create {
>-	/** @extensions: Pointer to the first extension struct, if any */
> #define XE_VM_EXTENSION_SET_PROPERTY	0
>+	/** @extensions: Pointer to the first extension struct, if any */
> 	__u64 extensions;
>
>-	/** @flags: Flags */
>-	__u32 flags;
>-
> #define DRM_XE_VM_CREATE_SCRATCH_PAGE	(0x1 << 0)
> #define DRM_XE_VM_CREATE_COMPUTE_MODE	(0x1 << 1)
> #define DRM_XE_VM_CREATE_ASYNC_BIND_OPS	(0x1 << 2)
> #define DRM_XE_VM_CREATE_FAULT_MODE	(0x1 << 3)
>+	/** @flags: Flags */
>+	__u32 flags;
>
> 	/** @vm_id: Returned VM ID */
> 	__u32 vm_id;
>@@ -430,6 +433,7 @@ struct drm_xe_vm_bind_op {
> 		 * ignored for unbind
> 		 */
> 		__u64 obj_offset;
>+
> 		/** @userptr: user pointer to bind on */
> 		__u64 userptr;
> 	};
>@@ -448,12 +452,6 @@ struct drm_xe_vm_bind_op {
> 	 */
> 	__u64 tile_mask;
>
>-	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
>-	__u32 op;
>-
>-	/** @mem_region: Memory region to prefetch VMA to, instance not a mask */
>-	__u32 region;
>-
> #define XE_VM_BIND_OP_MAP		0x0
> #define XE_VM_BIND_OP_UNMAP		0x1
> #define XE_VM_BIND_OP_MAP_USERPTR	0x2
>@@ -500,6 +498,11 @@ struct drm_xe_vm_bind_op {
> 	 * intended to implement VK sparse bindings.
> 	 */
> #define XE_VM_BIND_FLAG_NULL		(0x1 << 19)
>+	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
>+	__u32 op;
>+
>+	/** @mem_region: Memory region to prefetch VMA to, instance not a mask */
>+	__u32 region;
>
> 	/** @reserved: Reserved */
> 	__u64 reserved[2];
>@@ -528,6 +531,7 @@ struct drm_xe_vm_bind {
> 	union {
> 		/** @bind: used if num_binds == 1 */
> 		struct drm_xe_vm_bind_op bind;
>+
> 		/**
> 		 * @vector_of_binds: userptr to array of struct
> 		 * drm_xe_vm_bind_op if num_binds > 1
>@@ -575,7 +579,6 @@ struct drm_xe_engine_set_property {
> 	/** @engine_id: Engine ID */
> 	__u32 engine_id;
>
>-	/** @property: property to set */
> #define XE_ENGINE_SET_PROPERTY_PRIORITY			0
> #define XE_ENGINE_SET_PROPERTY_TIMESLICE		1
> #define XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
>@@ -591,6 +594,7 @@ struct drm_xe_engine_set_property {
> #define XE_ENGINE_SET_PROPERTY_ACC_TRIGGER		6
> #define XE_ENGINE_SET_PROPERTY_ACC_NOTIFY		7
> #define XE_ENGINE_SET_PROPERTY_ACC_GRANULARITY		8
>+	/** @property: property to set */
> 	__u32 property;
>
> 	/** @value: property value */
>@@ -602,8 +606,6 @@ struct drm_xe_engine_set_property {
>
> /** struct drm_xe_engine_class_instance - instance of an engine class */
> struct drm_xe_engine_class_instance {
>-	__u16 engine_class;
>-
> #define DRM_XE_ENGINE_CLASS_RENDER		0
> #define DRM_XE_ENGINE_CLASS_COPY		1
> #define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
>@@ -614,14 +616,15 @@ struct drm_xe_engine_class_instance {
> 	 * creating ordered queues of VM bind operations.
> 	 */
> #define DRM_XE_ENGINE_CLASS_VM_BIND		5
>+	__u16 engine_class;
>
> 	__u16 engine_instance;
> 	__u16 gt_id;
> };
>
> struct drm_xe_engine_create {
>-	/** @extensions: Pointer to the first extension struct, if any */
> #define XE_ENGINE_EXTENSION_SET_PROPERTY               0
>+	/** @extensions: Pointer to the first extension struct, if any */
> 	__u64 extensions;
>
> 	/** @width: submission width (number BB per exec) for this engine */
>@@ -659,8 +662,8 @@ struct drm_xe_engine_get_property {
> 	/** @engine_id: Engine ID */
> 	__u32 engine_id;
>
>-	/** @property: property to get */
> #define XE_ENGINE_GET_PROPERTY_BAN			0
>+	/** @property: property to get */
> 	__u32 property;
>
> 	/** @value: property value */
>@@ -685,19 +688,19 @@ struct drm_xe_sync {
> 	/** @extensions: Pointer to the first extension struct, if any */
> 	__u64 extensions;
>
>-	__u32 flags;
>-
> #define DRM_XE_SYNC_SYNCOBJ		0x0
> #define DRM_XE_SYNC_TIMELINE_SYNCOBJ	0x1
> #define DRM_XE_SYNC_DMA_BUF		0x2
> #define DRM_XE_SYNC_USER_FENCE		0x3
> #define DRM_XE_SYNC_SIGNAL		0x10
>+	__u32 flags;
>
> 	/** @pad: MBZ */
> 	__u32 pad;
>
> 	union {
> 		__u32 handle;
>+
> 		/**
> 		 * @addr: Address of user fence. When sync passed in via exec
> 		 * IOCTL this a GPU address in the VM. When sync passed in via
>@@ -753,8 +756,6 @@ struct drm_xe_mmio {
>
> 	__u32 addr;
>
>-	__u32 flags;
>-
> #define DRM_XE_MMIO_8BIT	0x0
> #define DRM_XE_MMIO_16BIT	0x1
> #define DRM_XE_MMIO_32BIT	0x2
>@@ -762,6 +763,7 @@ struct drm_xe_mmio {
> #define DRM_XE_MMIO_BITS_MASK	0x3
> #define DRM_XE_MMIO_READ	0x4
> #define DRM_XE_MMIO_WRITE	0x8
>+	__u32 flags;
>
> 	__u64 value;
>
>@@ -781,47 +783,57 @@ struct drm_xe_mmio {
> struct drm_xe_wait_user_fence {
> 	/** @extensions: Pointer to the first extension struct, if any */
> 	__u64 extensions;
>+
> 	union {
> 		/**
> 		 * @addr: user pointer address to wait on, must qword aligned
> 		 */
> 		__u64 addr;
>+
> 		/**
> 		 * @vm_id: The ID of the VM which encounter an error used with
> 		 * DRM_XE_UFENCE_WAIT_VM_ERROR. Upper 32 bits must be clear.
> 		 */
> 		__u64 vm_id;
> 	};
>-	/** @op: wait operation (type of comparison) */
>+
> #define DRM_XE_UFENCE_WAIT_EQ	0
> #define DRM_XE_UFENCE_WAIT_NEQ	1
> #define DRM_XE_UFENCE_WAIT_GT	2
> #define DRM_XE_UFENCE_WAIT_GTE	3
> #define DRM_XE_UFENCE_WAIT_LT	4
> #define DRM_XE_UFENCE_WAIT_LTE	5
>+	/** @op: wait operation (type of comparison) */
> 	__u16 op;
>-	/** @flags: wait flags */
>+
> #define DRM_XE_UFENCE_WAIT_SOFT_OP	(1 << 0)	/* e.g. Wait on VM bind */
> #define DRM_XE_UFENCE_WAIT_ABSTIME	(1 << 1)
> #define DRM_XE_UFENCE_WAIT_VM_ERROR	(1 << 2)
>+	/** @flags: wait flags */
> 	__u16 flags;
>+
> 	/** @pad: MBZ */
> 	__u32 pad;
>+
> 	/** @value: compare value */
> 	__u64 value;
>-	/** @mask: comparison mask */
>+
> #define DRM_XE_UFENCE_WAIT_U8		0xffu
> #define DRM_XE_UFENCE_WAIT_U16		0xffffu
> #define DRM_XE_UFENCE_WAIT_U32		0xffffffffu
> #define DRM_XE_UFENCE_WAIT_U64		0xffffffffffffffffu
>+	/** @mask: comparison mask */
> 	__u64 mask;
>+
> 	/** @timeout: how long to wait before bailing, value in jiffies */
> 	__s64 timeout;
>+
> 	/**
> 	 * @num_engines: number of engine instances to wait on, must be zero
> 	 * when DRM_XE_UFENCE_WAIT_SOFT_OP set
> 	 */
> 	__u64 num_engines;
>+
> 	/**
> 	 * @instances: user pointer to array of drm_xe_engine_class_instance to
> 	 * wait on, must be NULL when DRM_XE_UFENCE_WAIT_SOFT_OP set
>@@ -882,7 +894,6 @@ struct drm_xe_vm_madvise {
> #define		DRM_XE_VMA_PRIORITY_HIGH	2	/* Must be elevated user */
> 	/* Pin the VMA in memory, must be elevated user */
> #define DRM_XE_VM_MADVISE_PIN			6
>-
> 	/** @property: property to set */
> 	__u32 property;
>
>-- 
>2.34.1
>

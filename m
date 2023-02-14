Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F74C61DA4
	for <intel-xe@archiver.kernel.org>; Tue, 14 Feb 2023 19:37:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E9310E027;
	Tue, 14 Feb 2023 19:37:36 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494C410E027
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Feb 2023 19:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676403454; x=1707939454;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vJ0RK/59Dh0h2JlDmdNeygAICRED+PV11E8eoGLXV08=;
 b=NtA4cYbvdl1nz3GHNAQ0SFfUL2ka3t4k4Cu4l9lMKtGrv45S4UnIvIo5
 8WSd7jngps3mpUvIsCUlXfeg7nUSsAZ9YgaGUsui2gSTH12WA7DIw7mJU
 Mf8BvZA5eK9zASA82ZiWW/TUghDjyVOk9gMhRih+cgBDtKKG6f3xoCpFU
 hnwRhD0HWDT8NPOJ1Zut4Ju1BaCuJfWV9Yf0BsMF5Iaq9pq9hJcYvhjo7
 9lwBBQygpWwacHdvCgILWeBV2L17n5VZWLlC7xDEdJScys4H3BUgJ+5CE
 xLwYg5fjohJ9WMUPUt2wETD80wRPmUuEE8B9H9UxCoPSw3116pQ0a1xeh A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="333384306"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; d="scan'208";a="333384306"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 11:37:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="793206752"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; d="scan'208";a="793206752"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 14 Feb 2023 11:37:33 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 14 Feb 2023 11:37:33 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 14 Feb 2023 11:37:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 14 Feb 2023 11:37:32 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 14 Feb 2023 11:37:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rs4X0BsMqEg85/sApk02M5O+2H3JXYZ7PwohiVOD9qDyCP8UdIP5S120VDbARCYvKxn8DOctgdEcpmVfRsoRiTLJWtHdlS+/oG8zj6bJ7dphfsMeDuJqbju0NLFu2yTaqrSw+f/c/2tFbur4V+ChetQlyxzv0GR7fYJe/Xu3THiaF09eqcTcWHzrBu0kV19l57aNHYUZjMSHQrfBNJ321nsfDhfBVXkkMOo2HMP3pGQ3mXwzI4Mqcc01cL3dKWzvj0IGalLir/XUnsY87CEduLPPkfOHUNkJ4TVoguB54yhbpoNdH1DvA9LfKqIx8d1c0cshPUe0xOYgGL+hanMogQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hVVoyq+hRncKEd9Yfe8Mjr5qmbVSat1nbpekZkyT0CE=;
 b=JKxAvck8zc9wcBfeVte4EIH5Sbfxhd01XF6T+amG3sVboXcjztoOBtg/6+DUp9VR4ECbhbZw3J5kgvi6PWhfd+nt38atxHcj1ciNJDd2g6LU00ng6nAaFmiuMBiNSDDqCLhDIwf1Az/oHBGiuAiGX/wZPubwfXi1XEnWmttC8b7jchE+BldwS/eOrTJlR/bU5LiSj1pY6SesaEnBi7bGma96qww4m5skusQKwW4p1tr6ZJcuSHWZ5XSKgYS6v6eOr2WIize2DZL6R1nfYxetZLwjbX3DcMSVBsrGiZGCdcdRaM+r/YQ/UPtXs7IFbbiOcLPn+XQYyKjlTdNHl8NXTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB6062.namprd11.prod.outlook.com (2603:10b6:8:75::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Tue, 14 Feb
 2023 19:37:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a%7]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 19:37:31 +0000
Date: Tue, 14 Feb 2023 11:37:28 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <20230214193728.i7r6zyrtgs3ole2v@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230214173224.198898-1-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230214173224.198898-1-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB6062:EE_
X-MS-Office365-Filtering-Correlation-Id: 63cb5cb2-07bb-4cd6-07f9-08db0ec2e9a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D3yKREBEPfE1wE9erudNIiDS557VSQ2/LvncjzmonAZvKslgyngnwvqEhzu9YpcqyDuacKQW07ekhg9S+2yipoJfNLtwKKwyplJPXOhUyh+DUvDhBUlnnMvzYsBOb2HmfJkRH+NrAV//P3eD13GQslfIJonAzERgMl145vpcvmbi/io2GSfIpvsECfAK3ScD1SVqH9p1ONUQUfCEdgRwLwwRoSTWznYEy/mqo2tQYAZGXyOigARjphZRjuIEnLDckjzT+9QQ7Ts5HStTpYU2ujXAj6PIW6aPpuqA42RjsbFrUa3q8SHEifYBQEcP6mtQN038nSirWAmmcPFO1tus/fDWwsV+Ph2KhPRpUbk8WqXPdJutrzMj7M0AomSAMy12fvHydBjwUlzIoDRCZDo/JkdnZKeFrsAwpzpYaWwT8bm72ZbsnxfuCcu9Y5KtL6K0W36+1NqaSTlj32SN6A9H3VbrHGHEbPEl2JiG/imYn2fHkfBY54uxDzC+IlFoQGcMfHCKloqioOfSJga3r6SNgz7GNwTtuOQ1++NX+4pKSepazgXljDxPQz5ybKACG9iUnsDGlHqLapm3q4YKs2leFvF4RsPsA4LUeAjMBfDA0CbRxmVovxLhZjkPHeM47BZ2L90Xtm+jmqik2eadlwzrdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199018)(86362001)(38100700002)(186003)(66946007)(316002)(6636002)(66556008)(4326008)(66476007)(36756003)(41300700001)(8676002)(8936002)(2906002)(6862004)(5660300002)(6506007)(6666004)(1076003)(6512007)(83380400001)(26005)(9686003)(6486002)(478600001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fncS+6070zIEWGYPQSD6wBmg88H4a/jVDJRN5EQ2sm091fYrvN9MNeCBDPeI?=
 =?us-ascii?Q?IQdoBaEx08FzH6YoBT2zUwn6BydWvigwg/ayV+bm1Hcv7XCRyUVAMrufm/32?=
 =?us-ascii?Q?I01bJUcWI3wwE7owrnKh9ZwBftQKNdD0LVNuAq0ushTSn6sxCH8n/cb69XsL?=
 =?us-ascii?Q?28FAV5o2ZgA37/njyfOTvT6Px/EN1GXHV9FBdXxV22KQ4pMpSo9ALWDMiIlb?=
 =?us-ascii?Q?0GV6RYwbjaTjWR5hiPan/RLDhdoDETDVN8o/oCSR/JTtPEcrZtKDTkB2Q6JH?=
 =?us-ascii?Q?fVpEZ8ue6aqnAiNdOPAUQTSeb2MHcO7lol61njCFrH4yltPB1kBCuM6+Y13t?=
 =?us-ascii?Q?On4uk9WBKZG0tvAji8T92xDuQOTDQuPm+kPR8q7NRhCVciEOLjslpBDkK/lN?=
 =?us-ascii?Q?LrAxZ2Ndr+aaV5N4+EZlfAQt5ubL4TRBA35SjzsTOKD3waAWgC2C16SHimh4?=
 =?us-ascii?Q?mW+eFFj0g8fRvcPC8QMKWGvnV+Qu5vfACR6MyShlTGsP01uwZsOIFc+SH6u7?=
 =?us-ascii?Q?NSGYIiFKDlE8UXn/FnELdceWxvCXNGASGmYuE8RM5qDlhCsrbEU2puMpM5y6?=
 =?us-ascii?Q?9g2a1E2X1pPGVeRis9O3Gc6Fh1DQhcasdQoMHV87+tySruwgQxQRaR81sdRU?=
 =?us-ascii?Q?h7gjMPPyDIjABbtPOwxr36NHcsAt4drJOysuYu+tPHtYZ0T9hoSorF8tTfiB?=
 =?us-ascii?Q?RmjD/BFtqJhNxIoLl1FXD66OrbcYzMWXzwxK2vAI8fX60m4ozd571JtSHtcv?=
 =?us-ascii?Q?d5EumxhO8eoud4ZeLXp7IzbDAanzWOQu2EiC1iBeS+an6Ut9tKt2cDAuOFHA?=
 =?us-ascii?Q?XhNG4g2KehIkbvfz6xTzB5Dgs9mlBgKy+B2f+1Wl6Ib+Fgl1iQsqyScEcyv2?=
 =?us-ascii?Q?3k5AQBtOxCMZUVP5UqYQ7xmTttt2fbPFu6qk7Us4hPKCGY0eTqT3e5UCb3Sq?=
 =?us-ascii?Q?usikMawVEYQCosH21eDN/0kXegD24+XZxkITIH27YC56z++5p454u9nSK0H7?=
 =?us-ascii?Q?aJKEuXEn4l9im6vZ7TmPqlxD4M5EkQDndApTJerX1i9YFp/A+znZEdAIRRyw?=
 =?us-ascii?Q?eezs98x9bq6U8PKI3FQO80oALPYkmU2lz7bf/VppUGpaHeIaGFTKKgYWF88q?=
 =?us-ascii?Q?Z+YzrU5oWLgundADfHaTCSMbDymivImXVmIhN6lwDXiHdzMFO7nLQQSDV3m9?=
 =?us-ascii?Q?0yEhUq2Bq0t37FltfqlSK36OltZO4xJW3vDZKuby5HV9W1+bokhv7AgM3zkj?=
 =?us-ascii?Q?beETRlg6xJD8zL3WSc6APB729SpX8mgSA9YVdOwOGx82uDJ2x6xO50jFufl2?=
 =?us-ascii?Q?wNYWGz1OR7Ff4U186A36+yqnTySWRqUs/LCZCZsdZpdLfF5R2MwjnKkemtV3?=
 =?us-ascii?Q?BMlFQS5KS/UenhJPEAVEfhkmjfutlhcprLZGTkdn22mCJv018hkaCR312fYi?=
 =?us-ascii?Q?W2FhmPmIVTPMIA9bOU9EJMnJlQzOi63S9evN7aN+koTKN0K6YrkOoLQ1GtQZ?=
 =?us-ascii?Q?H6kJrcX/DJ8+IL8dARK+BxGaQ8yh794efp/Fn/+icleX4zRCgXoY1ua0vVBr?=
 =?us-ascii?Q?EGKDCBQKLzChBJ5HCaN6FQbQOFjE2xrEjnbNZK4u0YlL/a1vRiGEsutwkcm3?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63cb5cb2-07bb-4cd6-07f9-08db0ec2e9a0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 19:37:31.1267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RLKmEcSB6FoT5+d9jfq7yWKnKXwfbgI+owvDfK7cfU0n5PZdY7FXFFGSeAtZ0YkpeFywSb75EWVvfkZq2F/N5A6HqX+rNE6jsAqnHLbruhc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6062
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/2] drm/xe/mmio: don't leak the forcewake
 ref
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

On Tue, Feb 14, 2023 at 05:32:23PM +0000, Matthew Auld wrote:
>Make sure we properly release the forcewake ref on all error paths.
>
>Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_mmio.c | 18 ++++++++++++------
> 1 file changed, 12 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index 8a953df2b468..497f643271ae 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -426,12 +426,16 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
> 	if (args->flags & DRM_XE_MMIO_WRITE) {
> 		switch (bits_flag) {
> 		case DRM_XE_MMIO_8BIT:
>-			return -EINVAL; /* TODO */
>+			ret = -EINVAL; /* TODO */
>+			goto exit;
> 		case DRM_XE_MMIO_16BIT:
>-			return -EINVAL; /* TODO */
>+			ret = -EINVAL; /* TODO */
>+			goto exit;
> 		case DRM_XE_MMIO_32BIT:
>-			if (XE_IOCTL_ERR(xe, args->value > U32_MAX))
>-				return -EINVAL;
>+			if (XE_IOCTL_ERR(xe, args->value > U32_MAX)) {
>+				ret = -EINVAL;
>+				goto exit;
>+			}
> 			xe_mmio_write32(to_gt(xe), args->addr, args->value);
> 			break;
> 		case DRM_XE_MMIO_64BIT:
>@@ -447,9 +451,11 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
> 	if (args->flags & DRM_XE_MMIO_READ) {
> 		switch (bits_flag) {
> 		case DRM_XE_MMIO_8BIT:
>-			return -EINVAL; /* TODO */
>+			ret = -EINVAL; /* TODO */
>+			break;
> 		case DRM_XE_MMIO_16BIT:
>-			return -EINVAL; /* TODO */
>+			ret = -EINVAL; /* TODO */
>+			break;


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Suggestion, up to you:  move the read and write to separate functions
and just surround the them with the forcewake. Or just moving the
default and adding a fallthrough would make it less verbose too. Up to
you.

-----------------8<----------------
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index ced757ba9ccb..10704d8ed8b8 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -383,6 +383,52 @@ static const i915_reg_t mmio_read_whitelist[] = {
  	RING_TIMESTAMP(RENDER_RING_BASE),
  };
  
+static int mmio_ioctl_read(struct xe_device *xe,
+			   struct drm_xe_mmio *args)
+{
+	switch (args->flags & DRM_XE_MMIO_BITS_MASK) {
+	case DRM_XE_MMIO_32BIT:
+		if (XE_IOCTL_ERR(xe, args->value > U32_MAX))
+			return -EINVAL;
+		xe_mmio_write32(to_gt(xe), args->addr, args->value);
+		break;
+	case DRM_XE_MMIO_64BIT:
+		xe_mmio_write64(to_gt(xe), args->addr, args->value);
+		break;
+
+	default:
+		drm_WARN(&xe->drm, 1, "Invalid MMIO bit size");
+		fallthrough;
+	case DRM_XE_MMIO_8BIT: /* TODO */
+	case DRM_XE_MMIO_16BIT: /* TODO */
+		return -ENOTSUPP;
+	}
+
+	return 0;
+}
+
+static int mmio_ioctl_write(struct xe_device *xe,
+			    struct drm_xe_mmio *args)
+{
+	switch (args->flags & DRM_XE_MMIO_BITS_MASK) {
+	case DRM_XE_MMIO_32BIT:
+		args->value = xe_mmio_read32(to_gt(xe), args->addr);
+		break;
+	case DRM_XE_MMIO_64BIT:
+		args->value = xe_mmio_read64(to_gt(xe), args->addr);
+		break;
+
+	default:
+		drm_WARN(&xe->drm, 1, "Invalid MMIO bit size");
+		fallthrough;
+	case DRM_XE_MMIO_8BIT: /* TODO */
+	case DRM_XE_MMIO_16BIT: /* TODO */
+		return -ENOTSUPP;
+	}
+
+	return 0;
+}
+
  int xe_mmio_ioctl(struct drm_device *dev, void *data,
  		  struct drm_file *file)
  {
@@ -424,43 +470,13 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
  	xe_force_wake_get(gt_to_fw(&xe->gt[0]), XE_FORCEWAKE_ALL);
  
  	if (args->flags & DRM_XE_MMIO_WRITE) {
-		switch (bits_flag) {
-		case DRM_XE_MMIO_8BIT:
-			return -EINVAL; /* TODO */
-		case DRM_XE_MMIO_16BIT:
-			return -EINVAL; /* TODO */
-		case DRM_XE_MMIO_32BIT:
-			if (XE_IOCTL_ERR(xe, args->value > U32_MAX))
-				return -EINVAL;
-			xe_mmio_write32(to_gt(xe), args->addr, args->value);
-			break;
-		case DRM_XE_MMIO_64BIT:
-			xe_mmio_write64(to_gt(xe), args->addr, args->value);
-			break;
-		default:
-			drm_WARN(&xe->drm, 1, "Invalid MMIO bit size");
-			ret = -EINVAL;
+		ret = mmio_ioctl_write(xe, args);
+		if (ret)
  			goto exit;
-		}
  	}
  
-	if (args->flags & DRM_XE_MMIO_READ) {
-		switch (bits_flag) {
-		case DRM_XE_MMIO_8BIT:
-			return -EINVAL; /* TODO */
-		case DRM_XE_MMIO_16BIT:
-			return -EINVAL; /* TODO */
-		case DRM_XE_MMIO_32BIT:
-			args->value = xe_mmio_read32(to_gt(xe), args->addr);
-			break;
-		case DRM_XE_MMIO_64BIT:
-			args->value = xe_mmio_read64(to_gt(xe), args->addr);
-			break;
-		default:
-			drm_WARN(&xe->drm, 1, "Invalid MMIO bit size");
-			ret = -EINVAL;
-		}
-	}
+	if (args->flags & DRM_XE_MMIO_READ)
+		ret = mmio_ioctl_read(xe, args);
  
  exit:
  	xe_force_wake_put(gt_to_fw(&xe->gt[0]), XE_FORCEWAKE_ALL);
-----------------8<----------------

Lucas De Marchi

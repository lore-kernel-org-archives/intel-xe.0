Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E519ACD8CB3
	for <intel-xe@archiver.kernel.org>; Tue, 10 Oct 2023 19:10:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A028610E3D2;
	Tue, 10 Oct 2023 19:10:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB7810E3D2
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Oct 2023 19:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696965027; x=1728501027;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GlScj1Qacy6mCBBt6hE9cazxTsOik6O6m84Jqev3NY8=;
 b=M0lolP2DUKOXJCTDQADb5I63lAvdpJy7tNIhOuq0nmhYDQELOj5DGtsK
 sxLLWCrQ/VsqP7C128h6uf2B6PmAu9/dtT8QxpazjlCfhrA6cXHQ8bFYq
 jJMm9aeH1T5piveXBfInm+D9TW1HgIA3TO+NcmxjLqexIDEhksoML9tBA
 G+N0hF7ekZ/tifOuDkPfohDScSAOnnOwGoEeXISupqskAlbBx+HKCzXkw
 M7mVKayVnIzqVMjZ77/OpKQf25L/YG67c53Bfnwk8sx2G6pRZHOSnfine
 79T58bCo+KDSPk1yldXwc9s7As5MjJJRlksI6T3jDQqi7tBd6rOYe0+nW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="6048675"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="6048675"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 12:10:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="730215939"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; d="scan'208";a="730215939"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2023 12:10:26 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 10 Oct 2023 12:10:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 10 Oct 2023 12:10:26 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 10 Oct 2023 12:10:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GiKanKWiQdW4mRljrjPv5KijgOqF2GeZEB5wN37yCrzSqRQWqblnJMX4LpP2TVT92n1bNGTopsgTH8p2BRYYjJnVF1noXWU0v/veP6Ip67JuR9JmxT8TemICc6giVuaOY7I7s0AUyMGI9eoEh8wkJ/5uJvjmK6sGL2tOkjGCNs0WBtN2VJXjT94l9aK0savmRkgVMVfUn7tFhN55uofdcPACxDUKuss7ZTfsRV4aYtzbyGMyd6ASkRsc7QZ7IfRlpAbdFWIlejZS1MSCAFG2jsBZZCjz/yXaJXkMuF6vqUGHFwNTJ8ZIEEl4Ko50EU6rfAHfagW7h5P4347rAHPLig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wUQxOMcQ+LXegYdsRZJrNk7Pf6+a1GP94aWV8J0s1HM=;
 b=TGwNrJiGrKhrr7TgIDygwWJ/l+BDQXt4QYuYHjt9P/LDq6PCmu0ibU10nrE4cvHBKyOPLBZI+PiunCBZhLSH06UyMznd2EN5nPgEw32N9zgjUu+PmEX8Le4ak0p8faYlE0eEHympDLx0FKfHpb8RJ6sYsXQsH5bOo+AOtuxAar8x1fFwhoyAOhBSO6pDEDNcbQb+up9Gf7Vp7pwBAaBtpphH16tynEHEDlD7eII5EW7qZr5AG/S6YlmGG7TAFHLgb4MQZxGyBC5bUuMrsr6j8tdYM9F2kuHlrM6spyEeTRG1P+rEgBMe+0+lDOxp4SK4XFtiu4EBDuCi088RBzzg4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5405.namprd11.prod.outlook.com (2603:10b6:5:394::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 19:10:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 19:10:19 +0000
Date: Tue, 10 Oct 2023 14:10:17 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <m7g3c2sydfrvsrwgxjlohif7iotednqnt6d6vkzbkdyq7k5zed@fjkn3cwpwglu>
References: <20230926125540.7-1-francois.dugast@intel.com>
 <20230926125540.7-28-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230926125540.7-28-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR05CA0196.namprd05.prod.outlook.com
 (2603:10b6:a03:330::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5405:EE_
X-MS-Office365-Filtering-Correlation-Id: e6d4af20-5247-472a-397c-08dbc9c48b5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nv6T1YhH2MfFFjax+JDgnUpJ6WBDwlk+iadZjw+1LKTciPD9iDEkCDOf6Kp0MFkMI/pcGfFDCB5bua6/n7q/pOfeChjmE6CpOXQVSJhajDKbmllcWUtsZWyiBt30iVgdv/WC14NSWrgYsmzRA5WkwIeGOyZ1ZL0ccJjUpKqRZYzfkRZZEOlpRwTlMgrk/sQCcqdruwUo2BVdwjx+G8Lb1Lh9TkdrZome3z2BcGhrgIrzOI2NoouP5wz25cWy9fljVo6jRmYvbrTVbjww2jPR9vS+tBcGQHTqdgWNQLOlIi9duEv3fkdo2Tm3W2ANNXSRSDjKHXNsluuRtWbRvc7rLokImtzclzJlCExhkwm1Mvak6f/DEbhIR/P/+HbXqyMQewDxOXG66kFE618NjA2Sum5JgouO+UlMACtr/yhCB+wpZfqQo7EnevWBko9x5tN8KyOxZ6kQZjqyO76HKZoKuGgETwwmxmTQpB48ZPEKBoOBuHRCK6CmMt0o0bxdUTUzE3jE/yzFTncidCDjNxa225kUhPfqR8I1ZjGFnfpH+hxvqkHMqI8lEOKowLDBWTq+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(136003)(376002)(346002)(396003)(366004)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(9686003)(6512007)(6506007)(6486002)(26005)(83380400001)(2906002)(4326008)(66556008)(5660300002)(33716001)(66476007)(66946007)(8676002)(6636002)(6862004)(8936002)(41300700001)(316002)(82960400001)(38100700002)(86362001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w8e2rG8HwmjBYI8laUwlaXyQaf8mXArVfAxDR3RQDJe98XAXxQcrb51W0I1W?=
 =?us-ascii?Q?zh66r2BlewplzRxJKn67rw7TtcQBdjolARlz2BfNdddYYhD0vUC9hxN4qau9?=
 =?us-ascii?Q?CVKauMB0dwYODcTkc46G276yNhCETDwwNRLVe/nBAptgnZfpLPnOJAvxdclq?=
 =?us-ascii?Q?wFSblKwPQUvRjsRlmhmTxG//frDfzCQNJEfAne2IbxsDgCqEAvhoo6PHsdEF?=
 =?us-ascii?Q?qw8A6tVsfjf8gYaWDX7VD1tSxtKZ9HWWL7n0omyTExdwoIQ9bRhS5sZcJrr/?=
 =?us-ascii?Q?3nOEZWMS++5JDjo4evfw4HOff3ejRkK5JWbkaBFykl1j0EWsueEVwg4AyZXl?=
 =?us-ascii?Q?TapW+8gGhIme1c/77LximteIywjtj5NnnBRZllh34vkRGwURPSHHzx/MuBb7?=
 =?us-ascii?Q?Q49rJXI8wuCZ9jEr0g3LYRsubTWV1Y2eIUxmS4Qq6S89MB/hwNmtJef5YxNc?=
 =?us-ascii?Q?7HyVvl7wHfAKp3wIqenruvQN4pXb3sm4lYob7ZAuGbJp1o7boIwQ8nOmX1v/?=
 =?us-ascii?Q?DG7LznI4lBi8gWgx1ZGXxEzy3npW78808j0FbOa61LcESC1u6U6hR7O6P/+Q?=
 =?us-ascii?Q?BajIGR4+h5U5ZP5bKO0ygvwtHo3VX8mx306JpmkmVbW+QsMDwNJA2Xnei73N?=
 =?us-ascii?Q?Ft/3gVLBOUIqMVXTMqTU36/CYdoKM6nyybwbpFTrQu0kMMdSSJf4RUml9rIV?=
 =?us-ascii?Q?vRorqKdYghzDmyoEZVZfuN3nhCtg9Je7bPxZmZ1sXb4EQ2fisqCWzUeM+eJv?=
 =?us-ascii?Q?g0ty5fVKe2B2t52YcH2uUB37YJtGHZQGIcERem5Cx8LizUpUL8NVkAItrKaa?=
 =?us-ascii?Q?S+L9SDf5sQvlGbeC1AAkxGOEZu5rPmkTcWBkPtqpl5nbrVDEGiQEUqIiC7Et?=
 =?us-ascii?Q?BIM19pZWyTi74h29f1NS8aJ9VvqL17EokrSRFcbMKiiUHgpgE7UmY+a+/kPb?=
 =?us-ascii?Q?vw5ZnJvHI6w64p/q8xifsgZV3wEZmFc1gcaIEmW7EY5pgrIgwNX1z1Xxk4xt?=
 =?us-ascii?Q?XcY0SE3UfcBJ2EKD1MDejTKh2L4ZhOpom4R4BO4bFw/uFCvS+Wz1yhVGEHYf?=
 =?us-ascii?Q?FqUCOxPhgvKDHluTQvBKZX1sOKct6POd2wT0dhoZmTY0Lsp0advq5idurWkl?=
 =?us-ascii?Q?H9ngqAcbKYIgY3IN1zXSW+gwHBfaxK332Rm5QX6w96cWhvBmjof5kbkBYhmD?=
 =?us-ascii?Q?cQT27fBGLXntIxrFy59RREXYfYq81lkh932PObs9ypYRHXWodT2LblEpFKPG?=
 =?us-ascii?Q?Y3XpV5AuirvImMWNrI4G2DZzC3b+7acusdpsEOKvInjPS4U4SKiYmKUdQ1Zi?=
 =?us-ascii?Q?PAEi+GsWhCvB9mMh9cQK3cEor2dvzfWAhG2qRRGOA6ntFt76Ae8U1VipT/gi?=
 =?us-ascii?Q?K3MXDaxSblLaHUG6YzV+oUqDcpCjjf1vTWzOxYS2cz38lCXzcq/3i3L99wsj?=
 =?us-ascii?Q?r8XP1r47TbFx7nuNfqX4eTJMvcjGpVfG0YMHzPyvKfpdDLhpbRIty50e9Xun?=
 =?us-ascii?Q?A/bF9CoT2L0rLZ2nCIiSMcrR92Fv/JPxqvuaC0qMhDEkqs3RQ/swOeeJSuN6?=
 =?us-ascii?Q?hAbCPd27EYJVL4K175U3u9ZKi6mL+LOkYIF/dtjhkKc/63Gj/rwQWnt8A3FS?=
 =?us-ascii?Q?GA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6d4af20-5247-472a-397c-08dbc9c48b5a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 19:10:19.7008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N/XpEd4Era557YFxfDMsIp2bjCEHCJ5ERujtNgqSCcpkxG9CIdmN9DZF3NXJ+sW7Vl5qLVsYq4+JBKUBY2x2hkxgIpB/LLSsQze9iJbT8u8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5405
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 27/30] drm/xe: Extend uAPI to query HuC
 micro-controler firmware version
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

On Tue, Sep 26, 2023 at 12:55:37PM +0000, Francois Dugast wrote:
>The infrastructure to query GuC firmware version is already in place. It
>is extended with a new micro-controller type to query the HuC firmware
>version. It can be used from user space to know if HuC is running.
>
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>---
> drivers/gpu/drm/xe/xe_query.c | 9 +++++++++
> include/uapi/drm/xe_drm.h     | 1 +
> 2 files changed, 10 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index 7a0ffd9a654a..c250ca534bb9 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -530,6 +530,15 @@ query_uc_fw_version(struct xe_device *xe, struct drm_xe_device_query *query)
> 		resp.branch_ver = 0;
> 		break;
> 	}
>+	case XE_QUERY_UC_TYPE_HUC: {
>+		struct xe_huc *huc = &xe->tiles[0].primary_gt->uc.huc;

This doesn't look right... on MTL/LNL we are expected to have media
engines only on the media_gt and huc is only loaded there. I think this
could be either of:
	
	a) use media_gt if media_gt is non-NULL
	b) loop through the tiles and use the first gt that has
	   a media engine

Another thing is... does this capture the scenario in which HuC is
selected / loaded , but it's not yet running? Looking at
xe_uc_fw_init() it doesn't seem so because after parsing the header and
printing the version, there are still failure scenarios and we simply
leave the version set.

Maybe we should have a status or a simplified form of it?
 From drivers/gpu/drm/xe/xe_uc_fw_types.h:

enum xe_uc_fw_status {
         XE_UC_FIRMWARE_NOT_SUPPORTED = -1, /* no uc HW */
         XE_UC_FIRMWARE_UNINITIALIZED = 0, /* used to catch checks done too early
         XE_UC_FIRMWARE_DISABLED, /* disabled */
         XE_UC_FIRMWARE_SELECTED, /* selected the blob we want to load */
         XE_UC_FIRMWARE_MISSING, /* blob not found on the system */
         XE_UC_FIRMWARE_ERROR, /* invalid format or version */
         XE_UC_FIRMWARE_AVAILABLE, /* blob found and copied in mem */
         XE_UC_FIRMWARE_INIT_FAIL, /* failed to prepare fw objects for load */
         XE_UC_FIRMWARE_LOADABLE, /* all fw-required objects are ready */
         XE_UC_FIRMWARE_LOAD_FAIL, /* failed to xfer or init/auth the fw */
         XE_UC_FIRMWARE_TRANSFERRED, /* dma xfer done */
         XE_UC_FIRMWARE_RUNNING /* init/auth done */
};



Lucas De Marchi

>+
>+		resp.major_ver = huc->fw.major_ver_found;
>+		resp.minor_ver = huc->fw.minor_ver_found;
>+		resp.patch_ver = huc->fw.patch_ver_found;
>+		resp.branch_ver = 0;
>+		break;
>+	}
> 	default:
> 		return -EINVAL;
> 	}
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 84091860c7d2..fe7e83a5bd3e 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -478,6 +478,7 @@ struct drm_xe_query_topology_mask {
> struct drm_xe_query_uc_fw_version {
> 	/** @uc: The micro-controller type to query firmware version */
> #define XE_QUERY_UC_TYPE_GUC 0
>+#define XE_QUERY_UC_TYPE_HUC 1
> 	__u16 uc_type;
>
> 	/** @pad: MBZ */
>-- 
>2.34.1
>

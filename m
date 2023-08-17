Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D13C2FC2E
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 13:51:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E21010E48F;
	Thu, 17 Aug 2023 13:51:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F378210E48F
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 13:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692280298; x=1723816298;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RAfXxGtNzgVYIw0Oaope5yC17CMoQBmaPQ6iE3Qw7OY=;
 b=ndfDhsMwvWX1YgKz2ykbX2kUCh6pnXwrJkIKjee60euERv6yEh9n92C9
 11PUM0BnVyIhKkxRh5YWzOlarLTy8QGw1q9Cd3dxX3vc5UlPhXDRr2cI9
 Tgs3D0kbKfdsgVB/ThPnAwQHFc9M1tp3ZVWgoPg8K0PEDaCOzMIcpzVC+
 y7PETHoREnLwq/xK5ms7TDQgDiuT8dOqjwO2Bcsl0wedG7Rxu/g12HVQ8
 gZLhYOSkUCuEMT7xNwpGe4H6RkIyy9TX/Ds0rPKMFS81GrP5Od7Ce/Qj3
 WbYMI7zoS7kriddfkCW/U7B7eG4pd7SWPhY+fcsAdLFt8NZxHlmOGn38G w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="403794740"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="403794740"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 06:51:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="1065258812"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="1065258812"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 17 Aug 2023 06:51:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 06:51:37 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 06:51:37 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 17 Aug 2023 06:51:37 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 17 Aug 2023 06:51:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B0wZZBpK3rBz3GwqPvZqJDYdlathl9rrrsEgKBUqKhAn67Uilp6Jib/W2auPEv14d2W100RGHUhHCjnILVpodGavK7r+azrsc57hM8Jf5maoLbw7jaF1iIpo397Ho33ti0J2o4JjST8ZhRJqBG5KP3g4Mmxe7fZ9KO6oh/PbUcIFI7zgStxYxvfte4ajbdgUmYX4GcnTljsokBMVw0wtIq9P4DcWVtseJ1rB5cZEwR9O6HjXhwNVeM4okxMJqLF4AVWvLq2XMcYZWnufi4bTSzeS6fBM+NxpMAqScXPbpR1XXETi42MtlcrfPQhjesMOflQOE5A1z16tsNT1Xe3W7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1SYD/tGfnftJR+VN42XFxbG+WzhcSLCgKs6/2QtjsI=;
 b=itURew4B+laswmrBdUik/eaJ8ZW62pCga0WQUL3XqvgrFNkrhpcyyyn7KDhy8chydjA+bICsulEw+cb2s+Tbti0Itvzgy8YWcBcseL3XfvQvN6hB/y2MzfFCMNcEmlGP/nycxLfPygf6TjfrdFggxGjtCZ9mCefwjR9znWf/z6WsSUKk90YwLpLxnMgdx8a/B6eWtKjt3LieOoIDegtlfa/Z9FJ8PUieIQH39zqlX0/J+C5aBoBCTaCZZWrMISxAI24jAi0iw7ckyl3zYCP4HDigm4dfdYGMecQ0PWZCaiiW+ktKnYiA3ldgyNgImY8sGqxckLvIF29mhrpeGRI68g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SN7PR11MB7439.namprd11.prod.outlook.com (2603:10b6:806:343::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Thu, 17 Aug
 2023 13:51:33 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f%4]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 13:51:33 +0000
Date: Thu, 17 Aug 2023 19:21:21 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Message-ID: <ZN4l2X+hoiHQdfcV@bvivekan-mobl>
References: <20230811160618.477297-1-lucas.demarchi@intel.com>
 <20230811160618.477297-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230811160618.477297-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: PN2PR01CA0138.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::23) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SN7PR11MB7439:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e4825ad-b56a-4a66-7ffd-08db9f2910d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s9OgqcnJlWR4C5LqMykvNqqbEsTChrhvCJrmZQpgC5sS8CT5ravgebl5xSTc06ipj88UFvVTwL2f19HS1GCcgG4Bh48Pa+OvWWkVXCCr5/CzMU1P8IwTNepwuGF9zVc1MTqThXjrEYAMQi7f54I0OOsASL0y9l2nV7VQQDn42rDxXMMHSUemqmT4pmSrYUoavePM9dqiQMU0/ef0Jx+d+ExT4hKFIqz4n9R/5yBh+HXgOnukhrT7jqQ2wTzA7xVfO9e027xFtR+rmu1Qvkoan1FCeHsr2dfyO7hqaCoRKUHT27sIrmtc0esCnV+7M+ej3mqadfu5ktJZytjGAwmEch14B467Z5HxiBym7IvJRLx1gTKrgATP5rsgAG6IGiV16+ZJ8jXl+sU/gynCzTWvuU6JTkOGfOr47OCwxaVeBpjq6cyIS29ngDdab6pkuTdwgFLhjXh1TOLMzyVriWSsbTUmXhxWuQpvUnvoB8j1qO05J48G0pliZxp0aZi3h4bvEPGlI0YzyxOM5MdZ5CEZBtgWVietEY4zUmG/ztkbsVHz7RZoSV+0upzpeNOmb1JYxMBdNR3qWYdz3WU1xoIEwEveUzjB/SCQ/y5JByvefUQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(376002)(136003)(346002)(39860400002)(396003)(186009)(451199024)(1800799009)(2906002)(83380400001)(26005)(86362001)(478600001)(6506007)(107886003)(6666004)(6486002)(6512007)(9686003)(53546011)(44832011)(5660300002)(41300700001)(316002)(66946007)(66476007)(66556008)(4326008)(8676002)(8936002)(82960400001)(33716001)(38100700002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0I2OG5mMUgrNDZuMXpnV3JUTEZHUTNCS01haG9FUE15U0xGYmdqVzdtVHNW?=
 =?utf-8?B?Z0tZemtrRkVlQUgzUjZqKzJ3NVdLUlN4bk1pWVd4endWd3Z2OFFWNEh0RmtI?=
 =?utf-8?B?MGhsd1lXMjZKb2xaSkRNT2REV0djQ2owZ3FlaVBjZnVMb3gzQllRbzRNZk5i?=
 =?utf-8?B?cmVMMWRQSWhFS2lhc1ozdEwvdHY4eVU0cGVXRUkyRUhMN2FnQVlob3ZCZVhX?=
 =?utf-8?B?RTFpMjFvVXJlYnZ3di9uUE4zSEVzOWVEVTFHSGRWTTdRNGE5N3JvL05WVFV5?=
 =?utf-8?B?UENvWmNNV3JDSERTZk9PUVo4TG13TEgvT3NFTklpQTlUVTJnRCtzOFVkUHly?=
 =?utf-8?B?Rjk0bkJFSkdoUStaamdYWGtzcXRHajAwNDNvaWx2WkgrMS9RUnF1SGE2VHJo?=
 =?utf-8?B?MmZyWFFnUVp6NDBYVThPdXI4WWtGRHBBRWUwL1F6NnRiTEZuUkpYTkxNVXpz?=
 =?utf-8?B?TjFSY0xTbGlXYm9hWVUxc1VyVUVkM2lpKytmZWFhL01EN2w1U2ZTdHVBRE9m?=
 =?utf-8?B?SFM4U2VzbjhnTmsrRFdmVUljV2J4TjhkdXBtSmVHdnZQNE5vbXh3T21NdTJX?=
 =?utf-8?B?N2NtTkNtUXlSYWd0WHJCcmorRGFaK0FGT1lzYVloWFJkL0pjeXMxVExyT3ZR?=
 =?utf-8?B?YUpubTBvMFZkSWljL0JEODJySFlqb1pHSU1HUlZ5UHRWY29QWnFCZkpZNkZ1?=
 =?utf-8?B?SEZCT1YwclFSWVV6WnZIVzNzOWtNaEN1TElhelh3UVRmS0FhQy95UFZNY2hF?=
 =?utf-8?B?TjJkVCtLbzYvd0ZIQVk3dFdrcFhQeXp3WW04b0h5Q0MweHRZeFRzVUZkc0pU?=
 =?utf-8?B?V2ZSR2hHd0Z4a253cTY1MVUrWGMvQlIwYnRGVGY5NkJmQkFGVmVkY01RZ25W?=
 =?utf-8?B?YjZCREZWUW1mNENaNnJEc1l5dzhaN2xacEkzKzg0cnhNVDZldlhrN3c5MDNQ?=
 =?utf-8?B?QXQrOENKeGY2b3Y0TVpEVnZpclo4ajY0Vi9CUUw2SGl1UXJOcmpKdDc1aTFI?=
 =?utf-8?B?amlKUWJCSVg5bEhhcHVBcWNrUVMxaVdRVmoyKzVtMVV3dUp0S2w0NCtTOWNp?=
 =?utf-8?B?SWNjSTlJa3MyZmNNTUxka3FVSURtNSsxU2FkZEFETHZ3Y1RpbHhISGlzNzVr?=
 =?utf-8?B?ZjBhZEZkT3lIazRMQmExS2NjVlN5NXhCT29ENFNoZ3psbGxDZE1HL05wV05F?=
 =?utf-8?B?VmxBUkViWHVjaUs0ckUzdHlMY3NETVJ0L1U4Zld5eUNjNXV3U3AwNEh2dXNl?=
 =?utf-8?B?SzJCV2pTMHBHQStoNi84VUZrNHZxYkdrY1BBVGFGdlZGVkVNRW1PbGcwTG9N?=
 =?utf-8?B?L1NYUnNXNWJ4NzgvOEg5Y2poNHB5SHJBYWJsK3dWekgrMGRob09VQytZdlpl?=
 =?utf-8?B?YUtIc2RvOUFpb3A3UWdYTVpuWnd0RlZ5MERLajhBOXA5UVhrSlE4R3Uxbjh2?=
 =?utf-8?B?djBhM1doa21Cai9YamtZcDFtbytiVFlGZXE0UUUxWFdsTnAxK3JhaCs2K3A5?=
 =?utf-8?B?R3F4TXhHc3d3SzZLUTF6cDFjZkx6TzVNTkhoNE1rNzVuS2lDZHQ0YzRPK1Ir?=
 =?utf-8?B?K1RoZ0RoM2JmM3ozWGdVSWFPZHppZDVxMnVkZE1FaVphWk8vNXQycU95RXFn?=
 =?utf-8?B?RVY4azYyK1U2Y0tIUHN2Q0JtWEV2M29sUzBMc2liT3IyRlRFRDZFdVVKN3dq?=
 =?utf-8?B?MXAxeG1QYVRjUi8ySkxHRVg0ZEE0endwMFlPazZiUzBxZEFNdXRmY1I1eVFj?=
 =?utf-8?B?YTZaTlM1TUhoMVAxRGcycjNZM2NiTDBJWUpZbnhuWWtyNW4vcTMwTjB0NXp4?=
 =?utf-8?B?bXV2Qi8zdTNLdDZCNERjQjRJc3ZOUnUxQ29TNU04QzI4M2FDVjdDbmJnempQ?=
 =?utf-8?B?L0h5amQybjhJank2SnlneXhlNXN0VW9ZLzZ0WUlsUFVlSW1iL3E4NFdtdEpp?=
 =?utf-8?B?dmFNSk9PQmNQNHVldDVxRVlUK3pXM0hoOTE2dUEycDN5aHViRkROWjB5ajZ0?=
 =?utf-8?B?Vmt6cjVHaGxaNHRRd1VtK211T0w4ZWdGZTltSGNMN2VxblFXTldESW5TUElt?=
 =?utf-8?B?WkhMTEJNYy9HV3h1T21INEw4QTg0WUFzMkFsdmw4c1NUek9VRTRSTE1ZaGlV?=
 =?utf-8?B?dUR3LzZENUJNZjNpcTR6czY0aFQ1dGN4djJ2WnppRXJDcTlPcVpJbUFQTCtR?=
 =?utf-8?Q?eIOmkY2q/ZG3Ox5neZB3d44=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e4825ad-b56a-4a66-7ffd-08db9f2910d7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 13:51:33.1934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YE2fSEhzNdQ4FTTYv/kCNDFUaoczR4XKldsg6RNXY4t8nYbFW2VO30CfFkLas+feBghbvkxsfR4d/qvCmSFgNy3Nrl9YNXNlhfN9b3RX74MtfLnrLe2tUAaS46WxmUBC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7439
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 02/15] drm/xe/xe2: Add GT topology readout
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 11.08.2023 09:06, Lucas De Marchi wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> Xe2 platforms have three DSS fuse registers for both geometry and
> compute.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
>  drivers/gpu/drm/xe/xe_gt_topology.c  | 16 +++++++++++-----
>  drivers/gpu/drm/xe/xe_gt_types.h     |  2 +-
>  3 files changed, 15 insertions(+), 6 deletions(-)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala

> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index c93d8f8cd93a5..ad7ae6a28caca 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -164,6 +164,9 @@
>  #define XELP_GT_GEOMETRY_DSS_ENABLE		XE_REG(0x913c)
>  #define XEHP_GT_COMPUTE_DSS_ENABLE		XE_REG(0x9144)
>  #define XEHPC_GT_COMPUTE_DSS_ENABLE_EXT		XE_REG(0x9148)
> +#define XE2_GT_COMPUTE_DSS_2			XE_REG(0x914c)
> +#define XE2_GT_GEOMETRY_DSS_1			XE_REG(0x9150)
> +#define XE2_GT_GEOMETRY_DSS_2			XE_REG(0x9154)
>  
>  #define GDRST					XE_REG(0x941c)
>  #define   GRDOM_GUC				REG_BIT(3)
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index d4bbd0a835c22..a8d7f272c30a0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -65,7 +65,10 @@ load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
>  static void
>  get_num_dss_regs(struct xe_device *xe, int *geometry_regs, int *compute_regs)
>  {
> -	if (GRAPHICS_VERx100(xe) == 1260) {
> +	if (GRAPHICS_VER(xe) > 20) {
> +		*geometry_regs = 3;
> +		*compute_regs = 3;
> +	} else if (GRAPHICS_VERx100(xe) == 1260) {
>  		*geometry_regs = 0;
>  		*compute_regs = 2;
>  	} else if (GRAPHICS_VERx100(xe) >= 1250) {
> @@ -90,15 +93,18 @@ xe_gt_topology_init(struct xe_gt *gt)
>  	 * Register counts returned shouldn't exceed the number of registers
>  	 * passed as parameters below.
>  	 */
> -	drm_WARN_ON(&xe->drm, num_geometry_regs > 1);
> -	drm_WARN_ON(&xe->drm, num_compute_regs > 2);
> +	drm_WARN_ON(&xe->drm, num_geometry_regs > 3);
> +	drm_WARN_ON(&xe->drm, num_compute_regs > 3);
>  
>  	load_dss_mask(gt, gt->fuse_topo.g_dss_mask,
>  		      num_geometry_regs,
> -		      XELP_GT_GEOMETRY_DSS_ENABLE);
> +		      XELP_GT_GEOMETRY_DSS_ENABLE,
> +		      XE2_GT_GEOMETRY_DSS_1,
> +		      XE2_GT_GEOMETRY_DSS_2);
>  	load_dss_mask(gt, gt->fuse_topo.c_dss_mask, num_compute_regs,
>  		      XEHP_GT_COMPUTE_DSS_ENABLE,
> -		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT);
> +		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
> +		      XE2_GT_COMPUTE_DSS_2);
>  	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss);
>  
>  	xe_gt_topology_dump(gt, &p);
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 35b8c19fa8bf5..48fd698ff62aa 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -24,7 +24,7 @@ enum xe_gt_type {
>  	XE_GT_TYPE_MEDIA,
>  };
>  
> -#define XE_MAX_DSS_FUSE_REGS	2
> +#define XE_MAX_DSS_FUSE_REGS	3
>  #define XE_MAX_EU_FUSE_REGS	1
>  
>  typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
> -- 
> 2.40.1
> 

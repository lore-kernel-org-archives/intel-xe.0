Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93258E7E657
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 17:28:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4714210E40E;
	Tue, 26 Sep 2023 17:28:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E4910E40E
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 17:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695749303; x=1727285303;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0gM3AvzjsPXI2tfedJ6/QIv3VTI7+DyVrVUWjiO7Kfk=;
 b=lj+1zvGg+0xOYQl9fXpaxD47aAA4UZae59ykQFR/nxNyeV4Wev1F2DAH
 SxhRnBV8xCabDy0mBKTALg+LhyKyp3r+EDQhhjDMETKdfCZFfMelzECr0
 2wP6eE56SHNguJDyz4/DHMOyqchLiglXvuLVYEvodN9cb6cEfIXGoav+Y
 AcFeRJraU2nVYl5HBLQjTXFn6H0jq9hDfRElvyoDW+f5yd6ieSVrgbJrL
 PTQHG6CaD4JsCV2hUYUCJ8teVnRrRjnQzrElXsg2NXoKWE/IccCG0trKR
 KjFLDfew4I2f1MRtNXaGPDfgk/CZ1tu4XXQWHsm3cqiELX5aKxTUBo2W7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="371959819"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="371959819"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 10:28:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="752263195"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="752263195"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 10:28:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 10:28:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 10:28:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 10:28:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+QbjcSlk4irzYJzj6uE0MHxzjoTfdG9+kDhdAnCUdtxgMUXyMOvPz+XEUVy4muxxCt5Pw3dFD1Vu2ub8zNVGEWo8sHmp1xfoVzUaSgr8vg788TLlIsN4y3Vn//0xTMAADuzfmhE4ELzvJle19Y+vhMeySRpHDgpLRprKDN+xs2nkp0m2ge/utwpM/zD8DShOyZXPTgejr2fj8cMgUYBXIxcdRfgZsCkdQ/iVs1RGY0ZRmYXv5srF8bZqPQGEEDmYFWyMLtjt1gzLxgFgRgbiiHDQQxCE/iOiAGfwGsTPkF5lT4AFyjd+vbvVAIIzroPDrPW5xwTezOQhRlnWrvjCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Zq/X4vhUNfFRG1km8VW+9PksZI/p8Nrr0RPYhVns3M=;
 b=LzJRwa9TnmKrZ3h6d62VoY0j0apowkVGxvldHVSHAfW58t5TOqpUDcis5EvYHM/A3EAXQVaS7GFH1doZHdQDl11QdIFsvAblXjWtpptOSRdtq+JOjFjYHAwR+uvoUm71bCr7MATEc/IgYPV8R70QnK0oPss8GVoO2ShJrzlnlkjKyFU9Mh3ZAm8EJZRbqf/XOtNQZ2Rwpa4xVKK/IsWs/6H+h20F0lz+8//tqWtG6my408oIuJ8GO122UlVpfdZNlEB7mZ4E7J/PHonQ2nKRftrOgoAP8qEDSnB1nNcoEHKSnNNEOmHeDIqpBUDR0la57c/5k0HQrPlOXvez6+17PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB6666.namprd11.prod.outlook.com (2603:10b6:303:1eb::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.34; Tue, 26 Sep
 2023 17:28:15 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6813.017; Tue, 26 Sep 2023
 17:28:15 +0000
Date: Tue, 26 Sep 2023 13:28:11 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Message-ID: <ZRMUqwN70Bl+foMo@intel.com>
References: <20230926144120.334009-1-sujaritha.sundaresan@intel.com>
 <20230926144120.334009-2-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230926144120.334009-2-sujaritha.sundaresan@intel.com>
X-ClientProxiedBy: SJ0PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB6666:EE_
X-MS-Office365-Filtering-Correlation-Id: aa2a8a54-11f2-4fd7-fb65-08dbbeb5f773
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YDmjGX8RnPD6dZ517LONBEqn/PYROQwn+WGd8Tgo4P7XziuDHMy4Z4YC1XcOiVlwgIMtd85zkS761/e7NdXJgLeftdBCvyKY0X7/EwpBfwc6q6uPPStB88fd64Wnt+UPpiFlDxVeFPEDgOs/22Xrt479nnOuA4SS8L6R+lHwofOYu5ArPnLDUxLWbABbTGCBy7+5I5hdYPu7dHDEozGL/gBFOSeRQc8F8TmiC3zTUePJo4Au/bDQoufp85JAimTgc+GCx9uN5tPEWCCUdUxsuflj2RVKrzyu7yMaXAA/Vvw1zdqx79j1NThy7bHcC53ofPIcxreZv7xKlibVbj1QIBT0lvTcnc05EjCYg0bTAXIJqKQE7xBCSaixT8OA/jVHLoQAnkefOCWDqxkVDnDfmCL68QuxbRDDRbuSBsaAfPPMAPoWijJFZUO8vbY3xmj/wVs0vJ5eckFLT2yakyVV0aPzcm/mo1GAa/UUbM3frwcVBCei+MSnMPR+PCYxXec6Vd+W/NcQlH8ubsNUuU2j9pwv/KPwZKyuAT8yyxRCh/u5GIxkcqguFcY2Jqn76D2t/Ok+DW1LWEB0PKKW/XGYw0oovKt5zwlZgxdyUdP2bo4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(396003)(39860400002)(376002)(230922051799003)(186009)(451199024)(1800799009)(2906002)(86362001)(2616005)(6512007)(36756003)(6486002)(6666004)(478600001)(6506007)(38100700002)(83380400001)(82960400001)(26005)(44832011)(8676002)(8936002)(6862004)(4326008)(5660300002)(41300700001)(66556008)(37006003)(66476007)(66946007)(6636002)(316002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zayZawfS0bOBl+RryLoWEbLwuHblvYV1GJE4lOGpWC0thlxvz0Eu0btVh4dc?=
 =?us-ascii?Q?2Hl8jKa/Ye0J2NyYZ3bWgQHukkQjzbpI90kmy4ALfM+rvphTrlhSE6xlJFi7?=
 =?us-ascii?Q?DU1bWOuHFLg6CsxvlFddZPgcbz65bh8AvRGRqiALiYvFT6dTEmcT9N4GcW3V?=
 =?us-ascii?Q?6QaTFbrx0klFDbmykJQTvKaBRR31Iq/TMG69wKJBxPKqo8Uc/y25dffgamF9?=
 =?us-ascii?Q?pVRW3rWeXdHaI/S84qrGkcpf3Q872d3PoSJGqAG9yx3l5DydAy5xbexjXZ76?=
 =?us-ascii?Q?yvhjD4z6y213DNpYvRL4FcKcGPljovXrPhQYrzZp3mLno8qcOarTD47Blfvs?=
 =?us-ascii?Q?VU9Kk1cPwAzvXuQaA/Fay3ucDciNFh9qaSowaGoqkmjA0XTDPjsyUczSeI3J?=
 =?us-ascii?Q?p5sJ2+4KJxtvzpZAek35c6A3LWXjCxcT93V+WfKzA4xZLrAUGidTLUOK891f?=
 =?us-ascii?Q?QwYWGIuKVT0OmBSTiQPswlmITxFtAYum7n3pAD/W/6jePGb87GLmqs7pN2Ik?=
 =?us-ascii?Q?DOTnPc6JTE9H1xIzfvbCeegrrvTi1j1tQX+b2mqMS31eHGu+cnzeSw8GOCE2?=
 =?us-ascii?Q?oghU9QHY4kNpniBUo9OAKn1DnXVhx2QHsHStnklZv0iG6iOSdT+x2Ym6BKyT?=
 =?us-ascii?Q?qvEDPAfchJdZbZ5r8ScST+UYsL0VVbCEeTpj2JcjkijnLRlgJ2pRj51JIZrK?=
 =?us-ascii?Q?SflGM7I8QWDW3uwKMguRpG8FV2kzsjgMdTrJYRCaddhc1uSNI5gEVVH1OhqT?=
 =?us-ascii?Q?OvJUsXuKUZp6Wh2erxtXkyO8tM6sa6WObsfzdHsxTgWzs4bPfhcJF7/XizUV?=
 =?us-ascii?Q?R5QJ8MdK5IYmatOZv8JDLwnS8Rxv2t3BKrJ58xh/xKPqOidfd54P+I9bRzFR?=
 =?us-ascii?Q?z14POnkpHUJq3b0XB5nQwzI16j3BMpuqgbe1RJ0e4S0j3TKsz6Suerid49S+?=
 =?us-ascii?Q?vVtsS5UOdHWptf7/w7GdpJk0lASGluftsKeuJJLAGE+B2M1gZHAs00rJVwrO?=
 =?us-ascii?Q?oAm98rC4OaxVEX5UQ9Xv0w0BcehnLZaJ5Ao+XXBKY/DXAKXkFNOILHumRxmq?=
 =?us-ascii?Q?MxMwXio3fLwuQouOs+vZvrINmvGdw6BrnWhk8fPXS33Rr73mt8nF+0BKbO8k?=
 =?us-ascii?Q?GZ6kO1FwFkMBlFm8bSyRSskEfXvA2a28CqwvZwRO6qWmWBaFdojI1VjLs+jm?=
 =?us-ascii?Q?ClkJ6WODbFXzGr0H+7EXoOg0V/u6VnVpbaBTxtsw+MunYkfuMsVPoqrUfmvy?=
 =?us-ascii?Q?higneaF2sysKzhPwwA5NGbXLdSf4rec3+UVp6Ap/AVku07qFX+25V/cvkWyn?=
 =?us-ascii?Q?AfVbg+MeT9imdDSpPQ+D4xwB9lssbblSSdTB+0FcnomMGVYTRseKs8r4sdxn?=
 =?us-ascii?Q?3pVGWhHL8KFgvWBIWMHac349EfroEJQ2IAdJTMqxNZQKw4CwXDjEoozejbnl?=
 =?us-ascii?Q?d+/b3FPu2igoRnHwBhPnEvJTmHjb3rZJj+c/08ji3kcljsZmcZ9lilTAPTT8?=
 =?us-ascii?Q?vmfJ6SFJttkY3w4GWFeL5mP8eq2DqCvHzWHLFJO0PZ7+OGfOwELagzqw1OA1?=
 =?us-ascii?Q?RunkZNAZ4RDrPil+DO5bpL9F3Sse8yvzTIZz+CLYwo27hFcdNi8mCPIA7tSg?=
 =?us-ascii?Q?GA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa2a8a54-11f2-4fd7-fb65-08dbbeb5f773
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 17:28:15.7151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2NrlvsKbIW/ZNoL0aVCBhb611bvmcXq7neITyksMNym5VT+VkPQWpVkeklCHP+ImmpbIGTIl+soGsD25PgZ/yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6666
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/2] drm/xe: Add a couple of pcode helpers
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

On Tue, Sep 26, 2023 at 08:11:19PM +0530, Sujaritha Sundaresan wrote:
> Some pcode commands take additional sub-commands and parameters. Add a
> couple of helpers to help formatting these commands to improve code
> readability.
> 
> v2: change function name (Rodrigo)
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pcode.c | 28 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pcode.h |  3 +++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index 7f1bf2297f51..eed096ffc23c 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -104,6 +104,34 @@ int xe_pcode_read(struct xe_gt *gt, u32 mbox, u32 *val, u32 *val1)
>  	return err;
>  }
>  
> +int xe_gt_pcode_read(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, u32 *val)
> +{
> +	u32 mbox;
> +	int err;
> +
> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, mbcmd)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, p1)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, p2);
> +
> +	err = xe_pcode_read(gt, mbox, val, NULL);
> +
> +	return err;
> +}
> +
> +int xe_gt_pcode_write(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, u32 val)
> +{
> +	u32 mbox;
> +	int err;
> +
> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, mbcmd)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, p1)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, p2);
> +
> +	err = xe_pcode_write(gt, mbox, val);
> +
> +	return err;
> +}
> +
>  static int xe_pcode_try_request(struct xe_gt *gt, u32 mbox,
>  				u32 request, u32 reply_mask, u32 reply,
>  				u32 *status, bool atomic, int timeout_us)
> diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
> index 3b4aa8c1a3ba..79ae45e71228 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.h
> +++ b/drivers/gpu/drm/xe/xe_pcode.h
> @@ -19,6 +19,9 @@ int xe_pcode_write_timeout(struct xe_gt *gt, u32 mbox, u32 val,
>  #define xe_pcode_write(gt, mbox, val) \
>  	xe_pcode_write_timeout(gt, mbox, val, 1)
>  
> +int xe_gt_pcode_read(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, u32 *val);
> +int xe_gt_pcode_write(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, u32 val);

A few things that are wrong here:

1. namespace: xe_pcode is the name of the component. That should be in the prefix.
Please notice the xe_mmio for instance on the tile option vs gt... 'tile' comes
after the xe_mmio, not before.

2. 'gt' is already the main argument in the other xe_pcode functions, why are
you adding that as prefix?

3. Please unify the read and write functions, without creating new ones.
Please take a look to hwmon series there... There's a need for something
different there, and that solution from Badal is better than adding new
signatures. But please, let's combine them all.

> +
>  int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
>  		     u32 reply_mask, u32 reply, int timeout_ms);
>  
> -- 
> 2.25.1
> 

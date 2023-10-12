Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6391ACDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 04:27:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239A410E402;
	Thu, 12 Oct 2023 04:27:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D069E10E402
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 04:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697084864; x=1728620864;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nAjyoMGB1O9ai29LDWOOQaiRCvIoYZ1eSm/2nu01ItM=;
 b=GllCGYWPzWk4aV2Vu1pXdmagFBTDbTFXKG73xERDpo6/GRHAYOtiVZsl
 Mj/XWVn4o8xebza+LFmlVgoZybNDel6sm8LBS620lDufYoJlA9PxqPCQw
 TJPfXhXdnk982EJhgywbNZyIErhEcSWrzpRHCjdClKvdlTpY5tusyU29c
 GBFNqKwe9BKmJbWK8uuy8pnlCdZ6XIR4z/qTiILi7Ixzf9NbZoSACacUp
 MEjRtbve3LWt+5rIqUb44s670k5B2N8yPh/+cvM4gOLV7HITFT5g0kzYx
 G1zviPCUjsIrAocUHdjV/UXBMzN2GfPOViqW6iPMSB89cuR3cmTPlIgEc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="3415185"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="3415185"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 21:27:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="747728795"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="747728795"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2023 21:27:43 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 21:27:42 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 21:27:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 21:27:42 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 11 Oct 2023 21:27:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UwArIU1G0b2Bs4IxfqGZiHYOt7UsGDBy/pbpHHnQVsuqlOwY7Aa91ID8sj8Zikxh7CHU5XXUlegyxzjcyu3o9hu16ssaA7kO5LopH0QlxJ17D20WrZZvhLrX3NfkGmjdIzPAry2thgWgf0SKUMi7IBldlfZoXQxwGiEt1rui/2ti7XePg+DiEGzDNOwpwoXH6TiOscQEMYXh7TQva7omTzpQAEI+pItEpf+LuBB27LH+GMC4E8xLkQkpPxdJw/AAOHvBYdQe8GRDI1C8x6wWyLziuSHXccVvVcelM4fIlYNM4kLbAEv/ZRxMw/UkohwRG4xfah31Tk0ze0cU6PrDdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iA2bMttzbuJJlPXYXp3aTXZeBEPmmqaDjnTZSkZxYK0=;
 b=lz9KWMxzwgSwBCltTawowYvXdNXu5aq6KFRTJ2gNd87mvphOtpBPYIsQ8S528e19QXC/tWv5y6IrbWEJ5VzRsCGo1aHWq9Ne4RshHHmQfsiHG7rbnnu5vo3IyzN6JAahc3VIuBLMOtla9tGkJ1tTOuoza8WqSKD8SvKyyKn+hWfQiFylKz1wuJ3zNOVwbuZzM0dDA8f8XQR6xoZqIuGiPW6UVh/fGY8fWhP22WIJLqoZNyTSqc0fLrp5A/UFsAEFbgUPu30yFlGUs1Fq8ejbTo+0TbLAY7YOnUUY9AjpxvxbnH6EWVV7wi6gch/WNjuk/OG9dCme/LK0R2d4uK6RIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB7039.namprd11.prod.outlook.com (2603:10b6:806:2b5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Thu, 12 Oct
 2023 04:27:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6863.040; Thu, 12 Oct 2023
 04:27:39 +0000
Date: Thu, 12 Oct 2023 04:26:26 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZSd1clmlqgzNxqY7@DUT025-TGLU.fm.intel.com>
References: <20231011230957.463381-8-matthew.d.roper@intel.com>
 <20231011230957.463381-13-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231011230957.463381-13-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR05CA0095.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::36) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB7039:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e340ce6-dd63-442b-10a2-08dbcadb911f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h34DU1smakITbZU6kQUIINMCOHAmAvdHjcaEK3ObUjo2NHVam8XBmTozWfar6yO48agKzBqHlXex4EEDw62E6T7vSnbXUiGJ7hqNdx8gRpg9kMCAEXhG5W8A91TobRXqqh5/+QDPHKY+SBPNS7FnANvRQq2YoxvOgAHN9EJYIaEBJfOtrxY+xwCbqduY/Ro3Xoj0CXQTIY78aX/Ob1HL8CDsbBtietT5fbszD1Nae9G2BXFWcRy0KRAHi5i6CkfZgwY5nvRMMxqNKfM4DUNw3DKTi6jRazoNNvXYgoc47ouIDaNKEhfc2jWFGVa4I6Qv1BeiwqdHXftoy5D91eFsT9xL6u7eskqP+0UtmC3/A5/VibxRhXRH1dEjCLHYuh/YjydE2B0p7Bd0thafttvCqZHbGj46j/TkErAd76Up/edVn/mcSBNmL0DD25WT0u51zbIJ5FkglCliVbSxTgQ5OuRs3LGrVyRottM9v8DtmPcPBTFbGyIOrmYYPl9ODNCXMRObc296bzJD163eqOiOFVVMf+2NHGiSuR0zGmCYs9UZJGlHtGeYpb/R7PI2G4iJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(366004)(346002)(376002)(39860400002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(86362001)(2906002)(41300700001)(44832011)(66946007)(6486002)(6512007)(5660300002)(6636002)(66556008)(66476007)(316002)(478600001)(6506007)(6666004)(4326008)(26005)(82960400001)(6862004)(8676002)(8936002)(38100700002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WRX4QZUgdcJUWDXR02mx8GnR2JdQGzL4YhSmR8gjhvwL1ogIGJzY8PyBLxja?=
 =?us-ascii?Q?9+PAJu7sl12/obG5AexxmcfTck7t33gv6dYBcv//UaKsFKowQAtWS/b+liN2?=
 =?us-ascii?Q?Qv7arz4RSrhtHAlGV5gDezHuJAhV7p4mjnGw4i2ULO6zRzNJf5hHy14mpXy6?=
 =?us-ascii?Q?ngWhFXWD66TNiKcx1Q1IP9rCLVgAgI7QeDXJUfGxk7J97WtjFVrkZFxv7B6T?=
 =?us-ascii?Q?AhUf1NvFypgB8WjeXuzKezM2uMv6mVCAWV3l53f1Zje6iOkgyMAY+xWF9R3l?=
 =?us-ascii?Q?w0N5+3yYLcXJBcl82bYGB9GHKGluq7dinB4rYAh1mFrGinxDkpndpkzBsqFD?=
 =?us-ascii?Q?M2yYR59k/2Ycz/RDIGojoVV/iFEntDXxrsn4zGQgtX/oNKma4zvNCCy06B/S?=
 =?us-ascii?Q?MwuD3p9bt/UAocnpeYrK00zSOEziLREJ43Apwt/X858ylQ8LvZcrZjXOQ8hN?=
 =?us-ascii?Q?rkB7EMqHxgZSOnznRIE0xDCrKpdLH/zSjLqfP89AaRbVPiclzZHgnHzio/Xb?=
 =?us-ascii?Q?weDP1wYXn03nRndsIVaXbm9eZD536awC8Xr9YiYqxenTpjV66wkVOAJRp66Q?=
 =?us-ascii?Q?mdG8/mkQD3SorZvUFFekuxCWqxX+uoQxlCvGrmtpsnmZ4d1zpXWopzGqc0pW?=
 =?us-ascii?Q?/pImGRo1BIMRXr0FJ6THB0tV2M+SESQr1VXZ9e4StCKT6jNX6bRzOHyQGAUj?=
 =?us-ascii?Q?GuPaihyGxRKOxWLlTvKfsA8PufPbtL/8RQrxx5UtV0PtfiFJJ3QaOXlWgFkW?=
 =?us-ascii?Q?w6bQ/KGsBe3HqQM4626BfW/8Z88g7P5WEW+uq0LMT88UhxZViX7W6Gyfue2W?=
 =?us-ascii?Q?xbfXicOjVMy0lrTPImmnLQnxIeg4kS+dOfAfLIvZol6ZOB8xSSz2V+IENWMC?=
 =?us-ascii?Q?uU+Wo0QfGzttcLgLFmMcPre1BNPN83V8cytN1mKrECc7EonKNxfixfdQtgeA?=
 =?us-ascii?Q?rDFyG/x8Z1b4D9nhcln8aLAmTW+E2w5SdbDtXjtz5FrodFpGTCySPc6VONBF?=
 =?us-ascii?Q?yA7iY8ENaSHgoNfx5c7lTgmMdVkdz4MlojEVW8d/MRdFSAZaQ33wv7lEzEPI?=
 =?us-ascii?Q?1CoL/5rZdgGl5IRzdV8Ep79TiObSCiStwbT90ueNVWWrXCUbc57M32YgJDSN?=
 =?us-ascii?Q?TgUydzN/xDUjCYDuP0qX5SD2ePe1az555qQXrv95FFnaDDGUTU8F958+Ozga?=
 =?us-ascii?Q?ZuvTN+ShEL3KBo8L+1JuzngVP6gx9mi+8Vv8RwelZ4F6kUj4xckMUKUWXSRM?=
 =?us-ascii?Q?23ko69Axv50EIzpFNyR4wg4Hjip0VgU+6h8O0kQIz0nlzaDlgKVGXQ05sK5S?=
 =?us-ascii?Q?cIUqzy4A19BmnsxisvXlPKp8AE8T6QmwS78VMV57MeUAXhsoFYEDI45Tuv86?=
 =?us-ascii?Q?Pv/LvI2n6neC/XSmPURCTpY8z1z6Z9b4PSBut7iMxQTiavlBvErH2XiVRPAQ?=
 =?us-ascii?Q?ZgPWKv0wKXtcl7cdAaK6bDovOn0qJZ1nU2Rc/6xImGrn1uWxiPPyu0BYeN+x?=
 =?us-ascii?Q?cEw9OiKbntvVwDM18UVXH5JaB6wKYgt2O5X57xChswD0zPo75i5HcOlSbiek?=
 =?us-ascii?Q?PiDa6iByR1GorE1zCIMqUQ1tIeA4TtQYHtiuHdDBkM8+Irv/qnkYKhNbPtIe?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e340ce6-dd63-442b-10a2-08dbcadb911f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 04:27:38.6716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KLO8Wm1RhmSPaVTin0mMhS3X5e0JbXbR5FaKFY5iovLrDidKowN3/Cx6smQTdVZo61/HZSRXZ9cndjiEuz6hQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7039
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 5/6] drm/xe/debugfs: Add dump of default
 LRCs' MI instructions
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

On Wed, Oct 11, 2023 at 04:10:03PM -0700, Matt Roper wrote:
> For non-RCS engines, nearly all of the LRC state is composed of MI
> instructions (specifically MI_LOAD_REGISTER_IMM).  Providing a dump
> interface allows us to verify that the context image layout matches
> what's documented in the bspec, and also allows us to check whether LRC
> workarounds are being properly captured by the default state we record
> at startup.
> 
> For now, the non-MI instructions found in the RCS and CCS engines will
> dump as "unknown;" parsing of those will be added in a follow-up patch.
> 
> Bspec: 64993
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  .../gpu/drm/xe/instructions/xe_inst_defs.h    |  1 +
>  .../gpu/drm/xe/instructions/xe_mi_commands.h  |  3 +
>  drivers/gpu/drm/xe/xe_gt_debugfs.c            | 41 +++++++++
>  drivers/gpu/drm/xe/xe_lrc.c                   | 84 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_lrc.h                   |  5 ++
>  5 files changed, 134 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/instructions/xe_inst_defs.h b/drivers/gpu/drm/xe/instructions/xe_inst_defs.h
> index c992ad767f08..d665a7e21f3b 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_inst_defs.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_inst_defs.h
> @@ -15,6 +15,7 @@
>   */
>  #define XE_INST_CMD_TYPE		GENMASK(31, 29)
>  #define   XE_INST_MI			REG_FIELD_PREP(XE_INST_CMD_TYPE, 0x0)
> +#define   XE_INST_GFXPIPE		REG_FIELD_PREP(XE_INST_CMD_TYPE, 0x3)
>  
>  /*
>   * Most (but not all) instructions have a "length" field in the instruction
> diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> index 4a37b2b86b40..8cd1fc0e4f17 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> @@ -30,6 +30,9 @@
>  #define   MI_ARB_DISABLE		0x0
>  
>  #define MI_BATCH_BUFFER_END		__MI_INST(0xA)
> +#define MI_TOPOLOGY_FILTER		__MI_INST(0xD)
> +#define MI_FORCE_WAKEUP			__MI_INST(0x1D)
> +
>  #define MI_STORE_DATA_IMM		__MI_INST(0x20)
>  #define   MI_SDI_GGTT			REG_BIT(22)
>  #define   MI_SDI_LEN_DW			GENMASK(9, 0)
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index cd6d28c7b923..e2483cb7721a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -15,6 +15,7 @@
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_topology.h"
>  #include "xe_hw_engine.h"
> +#include "xe_lrc.h"
>  #include "xe_macros.h"
>  #include "xe_pat.h"
>  #include "xe_reg_sr.h"
> @@ -149,6 +150,41 @@ static int pat(struct seq_file *m, void *data)
>  	return 0;
>  }
>  
> +static int rcs_default_lrc(struct seq_file *m, void *data) {
> +	struct drm_printer p = drm_seq_file_printer(m);
> +
> +	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_RENDER);
> +	return 0;
> +}
> +
> +static int ccs_default_lrc(struct seq_file *m, void *data) {
> +	struct drm_printer p = drm_seq_file_printer(m);
> +
> +	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_COMPUTE);
> +	return 0;
> +}
> +
> +static int bcs_default_lrc(struct seq_file *m, void *data) {
> +	struct drm_printer p = drm_seq_file_printer(m);
> +
> +	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_COPY);
> +	return 0;
> +}
> +
> +static int vcs_default_lrc(struct seq_file *m, void *data) {
> +	struct drm_printer p = drm_seq_file_printer(m);
> +
> +	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_VIDEO_DECODE);
> +	return 0;
> +}
> +
> +static int vecs_default_lrc(struct seq_file *m, void *data) {
> +	struct drm_printer p = drm_seq_file_printer(m);
> +
> +	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_VIDEO_ENHANCE);
> +	return 0;
> +}
> +
>  static const struct drm_info_list debugfs_list[] = {
>  	{"hw_engines", hw_engines, 0},
>  	{"force_reset", force_reset, 0},
> @@ -159,6 +195,11 @@ static const struct drm_info_list debugfs_list[] = {
>  	{"register-save-restore", register_save_restore, 0},
>  	{"workarounds", workarounds, 0},
>  	{"pat", pat, 0},
> +	{"default_lrc_rcs", rcs_default_lrc},
> +	{"default_lrc_ccs", ccs_default_lrc},
> +	{"default_lrc_bcs", bcs_default_lrc},
> +	{"default_lrc_vcs", vcs_default_lrc},
> +	{"default_lrc_vecs", vecs_default_lrc},
>  };
>  
>  void xe_gt_debugfs_register(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index a04867131839..825b229212ae 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -6,6 +6,7 @@
>  #include "xe_lrc.h"
>  
>  #include "instructions/xe_mi_commands.h"
> +#include "instructions/xe_gfxpipe_commands.h"
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gpu_commands.h"
>  #include "regs/xe_gt_regs.h"
> @@ -903,3 +904,86 @@ struct iosys_map xe_lrc_parallel_map(struct xe_lrc *lrc)
>  {
>  	return __xe_lrc_parallel_map(lrc);
>  }
> +
> +static int instr_dw(u32 cmd_header)
> +{
> +	/* Most instructions have the # of dwords (minus 2) in 7:0 */
> +	return REG_FIELD_GET(XE_INST_LEN_MASK, cmd_header) + 2;
> +}
> +
> +static int dump_mi_command(struct drm_printer *p,
> +			   struct xe_gt *gt,
> +			   u32 *dw,
> +			   int remaining_dw)
> +{
> +	u32 numdw = instr_dw(*dw);
> +	u32 opcode = REG_FIELD_GET(MI_OPCODE, *dw);
> +
> +	switch (*dw & MI_OPCODE) {

Drive by comment, 'switch (opcode)'.

Matt

> +	case MI_NOOP:
> +		int num_noop = 1;
> +		while (num_noop < remaining_dw &&
> +		       (*(++dw) & REG_GENMASK(31, 23)) == MI_NOOP)
> +			num_noop++;
> +		drm_printf(p, "MI_NOOP (%d dwords)\n", num_noop);
> +		return num_noop;
> +
> +	case MI_LOAD_REGISTER_IMM:
> +		drm_printf(p, "MI_LOAD_REGISTER_IMM: %d regs\n", (numdw - 1) / 2);
> +		for (int i = 1; i < numdw; i += 2)
> +			drm_printf(p, " - %#6x = %#010x\n", dw[i], dw[i + 1]);
> +		return numdw;
> +
> +	case MI_TOPOLOGY_FILTER:
> +		drm_printf(p, "MI_TOPOLOGY_FILTER\n");
> +		return 1;
> +
> +	case MI_FORCE_WAKEUP:
> +		drm_printf(p, "MI_FORCE_WAKEUP\n");
> +		return numdw;
> +
> +	case MI_BATCH_BUFFER_END:
> +		drm_printf(p, "MI_BATCH_BUFFER_END\n");
> +		return 0;
> +
> +	default:
> +		drm_printf(p, "unknown MI opcode %#x, likely %d dwords\n",
> +			   opcode, numdw);
> +		return numdw;
> +	}
> +}
> +
> +void xe_lrc_dump_default(struct drm_printer *p,
> +			 struct xe_gt *gt,
> +			 enum xe_engine_class hwe_class)
> +{
> +	u32 *dw;
> +	int remaining_dw, num_dw;
> +
> +	if (!gt->default_lrc[hwe_class]) {
> +		drm_printf(p, "No default LRC for class %d\n", hwe_class);
> +		return;
> +	}
> +
> +	/* First page of LRC is a ppHWSP */
> +	dw = gt->default_lrc[hwe_class] + LRC_PPHWSP_SIZE;
> +	remaining_dw = (xe_lrc_size(gt_to_xe(gt), hwe_class) - LRC_PPHWSP_SIZE) / 4;
> +
> +	while (remaining_dw) {
> +		if ((*dw & XE_INST_CMD_TYPE) == XE_INST_MI) {
> +			num_dw = dump_mi_command(p, gt, dw, remaining_dw);
> +		} else {
> +			num_dw = min(instr_dw(*dw), remaining_dw);
> +			drm_printf(p, "Unknown instr <%#x> of type %#x, likely %d dwords\n",
> +				   *dw, REG_FIELD_GET(XE_INST_CMD_TYPE, *dw),
> +				   num_dw);
> +		}
> +
> +		/* 0 is returned on MI_BATCH_BUFFER_END */
> +		if (num_dw == 0)
> +			break;
> +
> +		dw += num_dw;
> +		remaining_dw -= num_dw;
> +	}
> +}
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 3a6e8fc5a837..a7056eda5e0c 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -7,6 +7,7 @@
>  
>  #include "xe_lrc_types.h"
>  
> +struct drm_printer;
>  struct xe_device;
>  struct xe_exec_queue;
>  enum xe_engine_class;
> @@ -47,4 +48,8 @@ struct iosys_map xe_lrc_parallel_map(struct xe_lrc *lrc);
>  
>  size_t xe_lrc_skip_size(struct xe_device *xe);
>  
> +void xe_lrc_dump_default(struct drm_printer *p,
> +			 struct xe_gt *gt,
> +			 enum xe_engine_class);
> +
>  #endif
> -- 
> 2.41.0
> 

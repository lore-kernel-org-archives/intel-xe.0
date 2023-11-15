Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CEBC072A2
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 16:10:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1656C10E038;
	Wed, 15 Nov 2023 16:10:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF8C10E038
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 16:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700064619; x=1731600619;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hR9EgsoemYDWU4CyQwijK4Kb9M86UeVkX1FhOE8DC58=;
 b=NfOmcbLkOMSSwNVhKl5qQxYNO6koBjeFzOQizTa+QTx1G1Fi2+9AeuDr
 2Qj4fGXp2FIyEfRJiHlADTC8meL4Gk/V9zL6u4dmvcTttKPRK9WaVmGtY
 rBTlIWpDTTPOBicKzoMWlLMuyymQfHfSgzpgV/qOgR/hPan+MOn/XfLsp
 Y0wtddCBW24JKeLGTpGdc4X9f1+EvAfS33aCqWKdX6R+Kt4tk1uAbhnvK
 03Fq9AXzgUiBJISVuMawSexzXDeiywpBkHtgJXGzCF726ska4jcw19bhZ
 abMw2FBz56KW0gzpEI/A02C1l0fCor1xtYH9aaCcReyrrkG4OFPplSeqN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="477123640"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="477123640"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 08:09:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="794204019"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="794204019"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 08:09:58 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 08:09:58 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 08:09:57 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 08:09:57 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 08:09:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLQ4OXdHgF4wjgGsb8C+XT87HdWh3Sl46bfTHhBXW5cN7aBz1tK8SFhkaY39x7CKsS44U9Ekmn5eaKouO+dMLU7hB4VIEht9CVjBVNReBkocqGleU2pee988bG0Jgeptsy28w0ih07ZEM74k2n0GH4TMKj5FalPpnmxJSctnXcii0f2dUw62RcBzAhBwpNgQxFC3tiNBSR/Ujhs9Ts/tryyHbYHVs81eDI/Jdr7LIU/aa72Wm1FqNyEpywuJq9JNlSocsbrXgk4QL3RQvWh6+/zWKrmcupS7ROoWDoXIt3r1D2u4qS3eDR15nVPV0NGybNTcY+X+wjNMjBDaOZDU9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brDg2SqXxhOQARjMeWE+AQwIE6tSxEyczengR/cDM+4=;
 b=IocV1Y+HOrcN0gdWsydl1ghYk/syBjWdnMl/5JvzkFnkKNH8Ox5vuvygTCtrfTyBDsbDj+uVDSI6fal9EMuO/PVAqVXbyl37xHr35r5Ht9NnD1p51W5n73RelfMFtgm0Pas67GCFsjhUvp88MerF1QcY4tvDeSuueHNP7UwMrhtmC11ME9w8PqUJw5C2pYnytLVe+ov3TSs8+5OIK7IuQd7TNUE/YSJu+Z3ufzQ3ne3LWxDoXV6E0nxREXWn5xa8saMyo1YOWWQR3fnSaWLJ+iFOfQHTsyi/jbLw7i8iE7t3XBb42zWP3DkolWtZxE3rMCox1g60soYXGYGSXR31ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB5706.namprd11.prod.outlook.com (2603:10b6:610:ed::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.19; Wed, 15 Nov
 2023 16:09:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9%3]) with mapi id 15.20.6977.033; Wed, 15 Nov 2023
 16:09:53 +0000
Date: Wed, 15 Nov 2023 09:08:38 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <ZVSKlnisPnTJh0+x@DUT025-TGLU.fm.intel.com>
References: <20231115113748.1949-1-michal.wajdeczko@intel.com>
 <20231115113748.1949-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231115113748.1949-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR21CA0019.namprd21.prod.outlook.com
 (2603:10b6:a03:114::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB5706:EE_
X-MS-Office365-Filtering-Correlation-Id: a036b8f0-82ec-45cc-c836-08dbe5f54d77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cod4nv1h3yLqAlZUIB592ePXH4ar5KHiVtdUQ+n6b7kOegtMl62KEGTrWr7qJdhLFhFQJ0WAWo4jJ6kN/SDTfinLPitdinWATwchoFnb4uOnLOUajTOCmrKvNY7iVRaGtvHLYV5veyv96CQ1PJAs5+ta4BS/js58c6S+FXkLdp8PAGtjS04cqgCJU8e0Nq08QLUvPuQ+W4cCOKb4QGRKb057fy7g/MIiSYWSPKJy2YYYnq0VAWr57n+iMf9sOX7hIGJ6D14P4CK5uX9fCGQTqwnNPVkn8PNi/3C9e6UNJy3S+JdMIh9XLmcH+y1lKCzXcaevBqtPveVs5BNvNWd1WfhyDXR9qXiSCe76YKytoO/Xp+NjjOOhtgt/euWIXkZhBbPsqwQdWHaWhIeIxFwPbpHf+/CisCkfZNrZPmhd4r3e1c0pKS06SkRWrvxWfNfmShbDiNbXAkOQp6QNdsjFGFhAaX14d03VHycF8TE4QOa9WvrICbAc5tXRl7Cnt+LCKD5gBMVBa8VqVbN70QrkLZR8N6xPXByN1n99lXJNjUQ5/bampzczZOqAvNSs6HRcp6WIxlmoEFuY3/zsPiZDah+Fzb3lScwmg1OWD4H5Csg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(376002)(346002)(136003)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(4744005)(38100700002)(2906002)(5660300002)(86362001)(44832011)(6512007)(6506007)(82960400001)(83380400001)(26005)(478600001)(6666004)(41300700001)(6486002)(6636002)(6862004)(316002)(66946007)(8936002)(4326008)(8676002)(66556008)(66476007)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wnzQzIHAEXekba0iAhCqA30p5CfcHqIkFXuCOKw7bkZx6QCCc0aD+p/fxsLw?=
 =?us-ascii?Q?gxsNN3jO8u2BAHIomD9YHa0nO8TxpZusNOV+k2uaDDZmDEqG53YXOVy00V9v?=
 =?us-ascii?Q?KBD+ug8G2073j1vW9hVbpcqlZIX7UyodvBdHTu7XTng6cYwiNXET+rkROFiu?=
 =?us-ascii?Q?Mf2s1Bssu1AiaNdX+qKMFyh3AgKOb+5AA0hF8oa4z5nWIhFvhg9fuGxmvvT0?=
 =?us-ascii?Q?qrYrHhpU8F4rkLLdoqZPC5KJScSn7s9NFj3ecAgHjJ+4hzYrW8IA3TgXPEr5?=
 =?us-ascii?Q?5y79UgYj9ANOtwK3kKnVg6llToaEL7Jpa6bDK8P7f7XbqjwTWyc+sZGQ3yGT?=
 =?us-ascii?Q?3mbQkc/qfkemG/EHmrLD68gdEShQF/DIhj48yCfjV9mnXccPKvhGzNuzDRYZ?=
 =?us-ascii?Q?Dc3x1AKYf3sWfTAKkY2IwmtHD2keWvZtbnvtPNmot++NSacfp9GnhZEDvdck?=
 =?us-ascii?Q?uVY7ul1UtFEIU3FG4E/vQaYSaKNRRMsDMf49JkZwl8Kckm95nFgPpm1Td41c?=
 =?us-ascii?Q?iqm8de54T33aW6b1H1pLVcpiI+pg06bAitBdCZac0pYekhLPIbYTVB3gTZyw?=
 =?us-ascii?Q?3mAOkqq0E18aa+agnOp5pKKDco9575JQtjbekT8d+cppo0XCHFdjKzoXvlL+?=
 =?us-ascii?Q?dYP9KeS4tuUGHS3WKbOPVvJNrBsu03fEbLx2kiTRxShqRsChajg4nDU3lCJU?=
 =?us-ascii?Q?B/41Dy1iyvD39p2l5V0SM0zgJiicFI4OBvbhKd4k8aabaBiWQF11rLWt7GMU?=
 =?us-ascii?Q?nCYkEg91FMLOw1RgYmyzF68o19mESM+tLKCqlCcdKg24rrYzI2bMvu7rrqkM?=
 =?us-ascii?Q?0R243yydYSdE6LBamRn4HgPryNC3R6yiovhYN9fROrQqn/5Lxe0nZ6mi8DM5?=
 =?us-ascii?Q?bR5maJd8ptRMJy8QMDXDMpiD4FzFbQuv+9nkzVMT4Q9B/Y3uEDzASEx2aBsk?=
 =?us-ascii?Q?NEFemyBLi9Lkpgk65SXAzBAPcl7ADEpNVMXSyZJBVJQe8j2gtyj+lZPI8/F5?=
 =?us-ascii?Q?3LoV82E54rQDYB/vhfGHOEdS4ThEIMFi7fuyru4B+aGsI5SR+VMjc9PZW973?=
 =?us-ascii?Q?xm0M1aL7MOJmI7BnELMGg4r8/wHS+RcAGH18zmIkn2MbNaNf0XtBwPfe1KzM?=
 =?us-ascii?Q?wdqic+orrCf8Ct9DmRIQkbt2VhzZTqTtE57zh1+/2Xjg3eX60404hXl4xKtq?=
 =?us-ascii?Q?D3K/9b36YqIlwyEDNiAG5c5atev3xJYlQgv7y2Cr/jnJkZj/iD/s6yKQSvfd?=
 =?us-ascii?Q?3BB6wwyKAEfsOxz3OurHXGvObUPzID+V6LxZm4qVg5I8hAUiVWoxLQj6Pzh+?=
 =?us-ascii?Q?JWFYLJltk7ea1aFyxN+D0CWxfrHao/PRdCv4Jre7cmJt2A6sfuRmjtEVNaaX?=
 =?us-ascii?Q?h8Qbj2RAHVXSyFZ67QkV9BOXM2nZ5KPJ0cbUpycjm1tbof4m1/yXe4biiKJw?=
 =?us-ascii?Q?XO/hYESF0JyuCpob+eTz9lWxbhkIpTZ3MDWN+3Ebz9jr4vgQvxFKV5eyXcb9?=
 =?us-ascii?Q?rggK9nGMyER840h3rPaCicxQG+vbbpJD/NOJu/U/Am3qOxnIFW8DEMuhLIM/?=
 =?us-ascii?Q?k6da8XltHmV9OshuUpQAXeLTg3zrexKAhqx8xeozX/xy0hwSSxeWL9RTdeNn?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a036b8f0-82ec-45cc-c836-08dbe5f54d77
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 16:09:53.3785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PK5iuRlTivwQHR3nVYmr69/tFpDoClNl3L9O7dGhv4r9PeEgVmnJSyFDbTOPCZzYj0EV2dcVpmynlqr2tIvIsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5706
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/4] drm/xe/guc: Use valid scratch register
 for posting read
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

On Wed, Nov 15, 2023 at 12:37:48PM +0100, Michal Wajdeczko wrote:
> There are only 4 scratch registers VF_SW_FLAG(0..3) on each GuC.
> We shouldn't use non-existing register VF_SW_FLAG(4) for posting
> read.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 16c233f120c6..c05858847919 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -627,7 +627,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  	u32 header, reply;
>  	struct xe_reg reply_reg = xe_gt_is_media_type(gt) ?
>  		MED_VF_SW_FLAG(0) : VF_SW_FLAG(0);
> -	const u32 LAST_INDEX = VF_SW_FLAG_COUNT;
> +	const u32 LAST_INDEX = VF_SW_FLAG_COUNT - 1;
>  	int ret;
>  	int i;
>  
> -- 
> 2.25.1
> 

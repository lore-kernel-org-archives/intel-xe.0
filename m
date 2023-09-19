Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A709CD5BCB
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:26:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE80F10E3D8;
	Tue, 19 Sep 2023 14:26:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A8110E3CE
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 14:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133608; x=1726669608;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=4Kp0hgV6Mt8IofMap4rElN+xvwGfvFHGfB+9Ca/tFYg=;
 b=JXA/m9pNzy6bRX3DuJ9FfBJlyKKUwuQMehvxR0XlsUJtAloexUqYPPP2
 rUVti0VEza9jsl95qxzU8XrB6SxY9Q5Eo5epUImPU4n/HWlxcIprZTot2
 ouEK6mQokCA2sh275FBftotjVJfqe7b0O7is39/hLqzKQJknnn3nfwD1o
 ypm3ryvvwe3gkLfFRCh6eSONdJF6/QDfRMI9pw/FrhUwsfoeLgFYexBp6
 /JsFibpN6ToXStolcD9XNVLVWXA/OVVa2nrYeZQn88x5Oo5Af6lCcNCI8
 vPOm4Ym1o1RrX+0tBcqq9gFjJQZ7SJnntlefYlsno5Ktf7XL70HUrhPLx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="466278997"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="466278997"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:26:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="695924501"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="695924501"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:26:43 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:42 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:26:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vd2Gy989OtwEhdIxWxOmX4iQV2HYKG+jZY+pvyuCvXhBclmXmpJxvtYuiWAV5ul59aDsVHaj66EmiMvTlGathK2MeFs2dWILNP0rFQxhyvqUX4uKArGOZD4iuj3hmAHycUuLKrWtxaUKCVyiMqMIiwQswIa2Jp845VFTe0jBcIWeTwk1qLVNrwok0fazq8HqSdgouMy9hKlubifDmgzTTLC/OIEh0obYSTy3g71wm3RoPmQrEEaZsZttdYmn4iTLDeQ3CnzdAoWmPM0IQTEHmSqtVzBjFGiPzEPlLYyqrlaKh5aYUaGU0khdxZXwW/ex5jsWLXtfvkeCnDew+FclvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1D5nbQFW/HlzmT283MX39DBen7lY3ynH5J0aaU8ZeU=;
 b=WXbkSbubwJeXoDI1vTTIm75lMML1C2rbn+XZb4gcc0d7fI1j0DW90X48TsDmkFAOmRYlJxtX+ZG5j0BgJxP8xDNSemoVknqaFzzbjv8/ORB78Di75uTfpaj2jmiLeVR5tUqPizbnNfCIcYl2Nn5l+fgsRtenw/M2F/XfbdlhIsmVeLAkbQqLKNUXkrE/N/S/RdmodOsacUJP0Mo4s9isBeAYUknP9jZZPFGbmLQVmr3U70bU4umgRusRYvaZRpjdhymr48Gn9bZKPVf71fzH40aHuAruQhgppbhL77jbp+5FNEPYikIRN/I0Q4SC/9vpvhkYNayx1vSVUydej5rQHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7591.namprd11.prod.outlook.com (2603:10b6:806:32b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 19 Sep
 2023 14:26:37 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:26:37 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:25:02 -0400
Message-ID: <20230919142504.91652-16-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919142504.91652-1-rodrigo.vivi@intel.com>
References: <20230919142504.91652-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0056.namprd17.prod.outlook.com
 (2603:10b6:a03:167::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: 1216c919-e358-4808-6181-08dbb91c6eab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WavTj3x+UxribKF9TTz9QjjxXnWGHvWlGuAx1nXWNDES2JVPYVxi2eNnw7sc9hmeOvX6d8mQuuAtOv4sk4ippgCdjZG7B2K8FLFms2pay2hijwpWjl2tZUAfdKE5brTNzz2M8rv67r/V9U6qP79qTm5SBa9RE/xaB/Jb16wTyXyYxTSUjF2cq0jTsuSt+fmJthQgc8WQLAP/uhhaK8D3HqCKCkpY60IwSlxA2pY76zKoggMbX489uztnQX/u5MHyaBOjUb0wroj2eV/dJ0n/fA+EDO8UpZX4TNSP04T7KP+86jB86qkNssUtqKuAVVbuX1+e0nE0RKOtYyfvpOHLzMzSx8NOJk+I7KwvDcWMcn9M3KbYf6KgoEcjJEPDpGE2DAigCEoBs4wUv4q785QPYPdxH0F1WAKDOgxmeQbXk9kIGzMgRL246A+ike5GbXsQ708d6OHLZVYc3LjNZ76dO0MeKx22zMfxpkX3WIweSrEYGS3bI1vGryH0xFwKDNd74tCH8S9ZHXGGUum+3Hbr/5L7+AnU3RRU9uTpKQA1x4c5AnpwxZVYnfoLe0YgTEw5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199024)(186009)(1800799009)(316002)(54906003)(6916009)(8936002)(8676002)(4326008)(41300700001)(1076003)(107886003)(2616005)(26005)(83380400001)(6512007)(478600001)(6486002)(6666004)(6506007)(36756003)(86362001)(82960400001)(38100700002)(66476007)(66946007)(66556008)(4744005)(2906002)(44832011)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WdiJLUifVk6IpGdL3aSExhv4Kly7cQCjNto/TrSvi41HG1wyAje6mhDlpaCw?=
 =?us-ascii?Q?ABAEl3hNnyFLOm46ORprw8OztD+7LfRAdgb2x/LY4VlRip25y2XDk4lTMQAD?=
 =?us-ascii?Q?PMg0BSaOjj93pEzAksMYoS3M40nFI+zbWM7jR0A3/wbPhN4bPY0w4fX2Se5k?=
 =?us-ascii?Q?0/BHFUCHgfPG63Z1rEb3/1Ymdq+5hbMIVpjwEXNxkM6XuTSym5AKTEW4BFOX?=
 =?us-ascii?Q?X0/JJlEgYELYpZIiMAJKqIWE8zngDVHkDIaIn11t5b4YMCaBELsGr7YHUnrO?=
 =?us-ascii?Q?I5xXURhqIrpiEGBN04And6Di8HYlzraWow3PBkfFw6hXJwHH2IouMHM086Io?=
 =?us-ascii?Q?PGw+W6bwCY4wZWy0jw32EVdmciVoXTcjtJx5G1l/wBviTg+dss56TvS2ldoq?=
 =?us-ascii?Q?hK3XLaaQC91vbN1cOCAx+Nts8+HS6wShTbopH2h8sjgQJkFUxHL5AXzR2gYG?=
 =?us-ascii?Q?N79H8uaJuMWz/TExiP0qhjT/JGJCUMYzzSJ9/s7h9368+HazoXRofb9P1QBG?=
 =?us-ascii?Q?VeD601igbHhHgsLU0JazfzeX815sKzBTLJkE9plkZs9baHRoEUuvA4V2sBm1?=
 =?us-ascii?Q?4b1t1aLi4UbqiTgE2g9UIb093ocniZukcAf7c/vyWLKc+PCbWacWpIe8diie?=
 =?us-ascii?Q?chAdfgOMMj9E4H0X2Yfv2iIWpkiriUCS4BA3hvxuPY2SMb4MZ/0dAgItILcY?=
 =?us-ascii?Q?GN7hSt4WKTHfg73nzYIg33lLN+bnKhkgaD9DmrLnEgZpMNIPrvx9qDEw2N71?=
 =?us-ascii?Q?buqbYx/Madtl4iZJEaQ6gkqOzh9yfTqGgPX2cYhJMRUKXGGhZwHnE/2jfdXx?=
 =?us-ascii?Q?iO0b3xjC1v9BYMRVIW3dQw0rHiaXDHMf96NxoIDozpl/zmZLCkwlfzrQR5vD?=
 =?us-ascii?Q?boWscIRPZG6/juMP/apmgP7wfj9tPDxJet2IGqT4JtYYUKs0vQRf1yxOmzxa?=
 =?us-ascii?Q?fO56K1uF9huZ8igilgkXKibJR6JpgD0zToLO1Zl6VQkoF0iygNzIfhiGxp8e?=
 =?us-ascii?Q?WfCp4jvDIZcTwQMyevtAMIj1TbJGdICADmmAx83ZVZbYXnBotQ9POUH1gk2Z?=
 =?us-ascii?Q?O50PAQLrPSrKMqWUkrsxadLsCCVAg7aqybqbBPIbwniGnVgpFeMctzZ2YQCM?=
 =?us-ascii?Q?+oAKw2eWvo15PxUvs7BMcjlDOTDxwTOkiuCtAVAYsQ7unNdDpxK4VL1yYwmU?=
 =?us-ascii?Q?hWITW4rirh72ct2IMcKL5W4/DfKvJsxY1Pz2ifSBc/777vZi/OiE02xtc9rS?=
 =?us-ascii?Q?vcOxQO5kYnyYy09lZPNVnm8YNSpYBelkrWAqeNkvCQ8KiKgO6ik+SzxHoTNJ?=
 =?us-ascii?Q?45dn6SbVLz3CcDaCygLTRvN70jWhRLHlCJRo+kemI1bqM/ngvyewzhya9oDr?=
 =?us-ascii?Q?DCpAxvBWtFcMzYqWafZBn6zND+ju+TBiM0feA+D3VRpBJNvZqX5ka1gIRMao?=
 =?us-ascii?Q?DcT44pGH38nkOQUfy+OlwmJScXU009773ThuadWW+nJPxvJcWM3h/WnFEPmf?=
 =?us-ascii?Q?1CFVud2WCsJiuHFVVJD2mX4soCtKCvYps48P73K7+UvrNOUOim2Ra/YOEJT1?=
 =?us-ascii?Q?JyJkdoki0iqPruDrSPcbWDs5l+D7r3xfJQTGYDRN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1216c919-e358-4808-6181-08dbb91c6eab
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:26:37.0931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nWyfmsDiuYq/3ztnaQChCu8yFuY+CYkZ4yhTIdHoM+u7PsU/ZKP5NUIjfPzscMYWNvA7n+i/2cVW5gJ4lY2Teg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7591
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 15/17] drm/xe/uapi: Remove unused field of
 drm_xe_query_gt
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
Cc: kamil.kopryk@intel.com, filip.hazubski@intel.com,
 Francois Dugast <francois.dugast@intel.com>, jakub.chaberek@intel.com,
 effie.yu@intel.com, bartosz.dunajski@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, carl.zhang@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We already have many bits reserved at the end already.
Let's kill the unused ones.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/uapi/drm/xe_drm.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index ca93b43fe3c9..7db4cafd4651 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -354,8 +354,6 @@ struct drm_xe_query_gt {
 	__u16 gt_id;
 	/** @clock_freq: A clock frequency for timestamp */
 	__u32 clock_freq;
-	/** @features: Reserved for future information about GT features */
-	__u64 features;
 	/**
 	 * @native_mem_regions: Bit mask of instances from
 	 * drm_xe_query_mem_usage that lives on the same GPU/Tile and have
-- 
2.41.0


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9DEC6FD1D
	for <intel-xe@archiver.kernel.org>; Fri, 17 Mar 2023 21:19:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA86F10E2BF;
	Fri, 17 Mar 2023 21:19:33 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B332710E2BF
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Mar 2023 21:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679087971; x=1710623971;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=f0O7LpGmTW62fuQT1+5x0kA6gRGwflgOz9LokBrC+as=;
 b=gkOReQV/+kVwGSHfirHYDpNITqu3HPmrxe7rFpou8h+OQPSOFV/qu3ed
 ZCKBYCfneJPY30P7dtTLd7/z7IoG99WXIpZmqz63B2n8TebiJAFzKiCKc
 kT3AYAZGtPNXeKcsaxlQ0R8wZlNDxqcIqSvNHBWxpnAUAGOZmEy0xQgEV
 Rp0BbitMFHiOr6aqmCM3aYw1u1sXM5DTXdxMufJvBoWns4O74hikz4tdj
 H+rv+6vpnAHrxIZUFGah/KlQ+ksvDuBJePxuJxcuV1uXQBPWdY1ULYnDx
 fPe4i/wNndK11unm2vU2csVRlbt3TubkVvs5A6fiT5FPzlQUuVfI+amyj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="335859731"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="335859731"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 14:19:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="926271033"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="926271033"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 17 Mar 2023 14:19:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 17 Mar 2023 14:19:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 17 Mar 2023 14:19:31 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 17 Mar 2023 14:19:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7KJ2oD1K6vn1MMDYUCmryC0DJic9b9oXlCHreUERFDDUGfV9SCipeRGO+0gGcBxKn/J9w0merFAoTgfifCNRe2AyIDh6uKA2PaVXc/l/tM5dkKIHE1lf9g+FKeZ6XuDXxSNerK8un1cObMHo64O7hu4zxDz0TQETs1XVrC+y9Z8Bcqno+CWoOhQ1qjJDcpN+klmn+choH6uSO/22BKEY8wBHlT2ow0A89xWzHYwf9dJ/+bGY1+TsI8YrQtOog2M0Zi+jSbxidNzrEljDr1GuLlNqNYkgidQshxahmiDKpIz9I8yNQ1GBrnV4GwL19+IpuvHHzKse8fef9fdNna7HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzYDGQkVKMgrIx7+eZz5JR1nkqZLXkdyE+Qa2cQpMJc=;
 b=G03QDQVSAjFU49ujaY99ocTpHTnLE9UYCaYr+wEY1Fbz00C+4YVkGeDTNbIYNYt+OLtl7M+0DhXD3P9eRJciFsDKbHYGysrLAC8BDIoj1TmA+9t1FYW36ES3oSbx1AUsjq85Zofk71JmoOjc+pV1LxPMvloIl9xmsBNtiNyiER1BoG5imTRsSwNRBUhsn6gsOj8eAD6jAp7GeN+2SjQpMiIk0qTY0Izql6a/KzTccvgiIZIAg0y34m4enJTzEqTe+3eH2/oyeyW/RUvbTQxmI4ZnSkoEN65IKiZ45myaPhu06toL/iS/g7goOhdkWAU6Y+GA8NlOfA2KLG2/ovTE7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7756.namprd11.prod.outlook.com (2603:10b6:208:420::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 21:19:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da%5]) with mapi id 15.20.6178.025; Fri, 17 Mar 2023
 21:19:23 +0000
Date: Fri, 17 Mar 2023 21:18:48 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Message-ID: <ZBTZOBzKweD86L81@DUT025-TGLU.fm.intel.com>
References: <20230317165335.1014314-1-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230317165335.1014314-1-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: SJ0PR05CA0193.namprd05.prod.outlook.com
 (2603:10b6:a03:330::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7756:EE_
X-MS-Office365-Filtering-Correlation-Id: 074dbf59-d7c1-4b31-af1a-08db272d47c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B4GaOlKNJK/el8F7kk3Lh4lAmWP7c/XKTaxIfgYV5/hwEHtCsAfuJBDinJDhD0LD8m6wUd4tVgUf3LluX7ois09ak5hNU7ucWNV2mMxsLSWa+ggtmeUycVS1OOK5GbSK9OrsEcrqga7z4qsaX4WnKla16BX+1me7K5YyQACO3J/ZJNldTcQKZs9P+BMVzvAi2+5YTwBX1Zkj+nqPVzb1hAMnkaicG4mmx9gv6GHl+1LVPzj3AViL2LnZf2mmw+nj9mmz+lExbgi9Lwz/A+RlzbM8gV9IJSiNjSeFv0DDPGcQYc8arJbCLpAHvdz5IHBUM/5J6u1500UTfDvq8FAPd4Bo3oCNLgJL7tXgA9uNNsGp3IWQstbcB1BIazdrD1SDY01I8IDzuMhBADQqQ28ezkfzeajY6gTTMMhO2Q/ziY0+c4L5+2FABxy/IN9XFla5TsWBujqrE+0uV81tbHpk2aX+YCKDHP4uJmm2MsWjOSB/ZySnAvQFmc+o9/nOUr8hcyKL0H9a0aosHxPorS6pKNLH1Ko2XPTA7b08BYi9Yq/v+UnD9jSeCA/1aGzS/ddNTRiNTn8hVWWdx8JfoV+F3/B9gVdPAIY4fveJRrCinEblFlRKTUxIijboUGr4QmEqq6emx1wziiC2bxPxUoNdpw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(39860400002)(366004)(346002)(136003)(396003)(451199018)(6486002)(66476007)(6666004)(478600001)(6862004)(41300700001)(2906002)(5660300002)(6636002)(4326008)(316002)(8936002)(66946007)(44832011)(82960400001)(8676002)(86362001)(66556008)(26005)(6512007)(6506007)(186003)(38100700002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0jg6bjZRf7WmcZJ+4gJSx0LrPL1JQYvny7dZ2NekWTtYJhIy9OL2NaBHj1Ru?=
 =?us-ascii?Q?EOH2T7ExXQBaYHLVQO4UM45qcMHbmPNW5u10zloHPgexlKULGQZQbUHmIUlf?=
 =?us-ascii?Q?lVRrY7SUV1AvWN780Y8XH7jlDv0fxRVjqstjyX5B9CeblvG5sTWPvkYwPbuW?=
 =?us-ascii?Q?3TpEWa7Ups1rfSqWvr/MyrC+pboipXO1P8NRUMZJZwgypsZbEV47AA8ZP5oX?=
 =?us-ascii?Q?ua0VK6fxc5/kcSFOZ8PPZRMuSi0acabcB7bkiofopj9nrRlQiAV+ZiQb3fEQ?=
 =?us-ascii?Q?nvvejQAaYsA4qnlJsS/I6+MGrk1aFxArYx6IVKSoBx4Wawhw7bu5dsDigwxc?=
 =?us-ascii?Q?sZs2QiTTAL3VtoIC/EbB/DZ7AVuucPHBTiMkXSxd3pE3+t7TtGEsn+E1HFIA?=
 =?us-ascii?Q?FsSzHZFnOU+wFQJWpjywokl6lfBtACPLljl4qrcTVYbZUoR+v9ih90QS+mmV?=
 =?us-ascii?Q?jX6RH25495o/8tZh8OLzsqEkmMWwT0QWywfdKog5WpRFA18+rwJXzC/E3fQW?=
 =?us-ascii?Q?pU7+mbhxhh2uKOp193GTJ44bk3toqKLyZsyu4fO4tCCJJgnBQhlN0DybGFlG?=
 =?us-ascii?Q?tvQ+tQuAlvC17b8p0S2bctQDb7qur3A8G6tTbUyYyj2Y6cSDRqBDb8MoQndE?=
 =?us-ascii?Q?61Hrg544VRykksVbZoFb0gbNYK8uB82In1ASLXbsqd3v4TDMpFbDAyPbBYuZ?=
 =?us-ascii?Q?gENaBVZLmgseOJsiZHJFYu/HEms8bE32o7XVl6LXNE/dvem5HPpPd75hIBUA?=
 =?us-ascii?Q?rIdXECV5IBl65PBFShL4OkWc1KTkR4jvvk/8zJ9PF51tge+EH0dlIIiXwIc2?=
 =?us-ascii?Q?uLxqMXpdpWqOuKCDvmOMLb1nmtGqrmfFtwc9Se/Ejs15d73VMvpu89g7+4CW?=
 =?us-ascii?Q?3WQbb6dnDwAUZNYvB/TA+pE+LbzX6cLug4Y+ZkXfiDpxeQ4Gmi2CQtn1UZjJ?=
 =?us-ascii?Q?918SIEfCi2dJ1+sjodkV0PG/HthaykJlpsBOPoQjEy5xTl1uHRpQwZX60ROw?=
 =?us-ascii?Q?cnexdu/5ZxgmrH1MA1EKGn0Tayy5bmCDY/Sxr5PifhesAkWN67nIcrY3a7vZ?=
 =?us-ascii?Q?jdrdEKtfiXm+E4k9ZGvQ01rr3Ekn9f9bdeC3aMis41HXN+qtrpA6GzMXO+mm?=
 =?us-ascii?Q?iU4Z7E7jYvIeV8smtcMIXN3TxFmbEZ7FaSayTGuPkBcz3FE3/6kPNCqGUzce?=
 =?us-ascii?Q?kLBu//ksx/SSRXF3CrRaBu2rNLXLoXnzjrmUUyvOU/b5ndBpIh8N6jP/a5E4?=
 =?us-ascii?Q?5BCloJFNJvhrc6CjvIqBTm5ndsaEVJP6OQhai1Kquye2e+b4KhMGj1kKyYIH?=
 =?us-ascii?Q?g0vFomOSH8iH5NoN/wirxNy+nc9IDdYW/fkXx0GeBs1LITV23aLEhyK0im4+?=
 =?us-ascii?Q?DcWGWQEPuinRfmeMW62mSbOIi8p60BhDZ7OX7dPYP1dr18Ga9Mg++QUYg3x+?=
 =?us-ascii?Q?WpWgsJ8lRU95K0PL8T1bU9QUqRcYtPOyDx1OazkoDzsS+2/ypzL5NsZYX/s6?=
 =?us-ascii?Q?uTtDRAEJUsx7F6LKm2FSfHav8YRAPrMjOgkkvT0DURQKrAD9wb6hvHsX83dn?=
 =?us-ascii?Q?ARTLyAhlTr8yAnqpZHBOxJ7LY4wJwtLZcEnFfr7LJEOLT8d9apaIUUQ1yVHl?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 074dbf59-d7c1-4b31-af1a-08db272d47c3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 21:19:23.5963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MJEDK+1dd2TxswZhXoW/7hfIa/LwUQQmreNAc9YUCopeXFNhnX02xJnBaIypmAGjD8j2cV4AWVzPDyL3mACssQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7756
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Use max wopcm size when validating
 the preset GuC wopcm size
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

On Fri, Mar 17, 2023 at 10:23:35PM +0530, Balasubramani Vivekanandan wrote:
> When the GuC wopcm base and size registers are populated by BIOS/IFWI,
> validate the parameters against the maximum allowed wopcm size.
> 
> Bpsec: 44982
> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_wopcm.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> index 0f2485d9d9af..d55469e941bf 100644
> --- a/drivers/gpu/drm/xe/xe_wopcm.c
> +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> @@ -54,6 +54,8 @@
>  						   for MTL, do a proper probe
>  						   sooner or later */
>  #define GEN11_WOPCM_SIZE		SZ_2M
> +
> +#define GEN12_MAX_WOPCM_SIZE            SZ_8M
>  /* 16KB WOPCM (RSVD WOPCM) is reserved from HuC firmware top. */
>  #define WOPCM_RESERVED_SIZE		SZ_16K
>  
> @@ -226,6 +228,13 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
>  	if (locked) {
>  		drm_dbg(&xe->drm, "GuC WOPCM is already locked [%uK, %uK)\n",
>  			guc_wopcm_base / SZ_1K, guc_wopcm_size / SZ_1K);
> +		/*
> +		 * When the GuC wopcm base and size are preprogrammed by
> +		 * BIOS/IFWI, check against the max allowed wopcm size to
> +		 * validate if the programmed values align to the wopcm layout.
> +		 */
> +		wopcm->size = GEN12_MAX_WOPCM_SIZE;
> +
>  		goto check;
>  	}
>  
> -- 
> 2.34.1
> 

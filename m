Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A46CCCA462
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 22:06:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B9C1124EC;
	Thu, 15 Oct 2026 22:05:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33971124EC
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 22:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792101950; x=1823637950;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=w299E6+SxHtr2uBJIXBH1f6fQveGneT3Soa/ozYEnVU=;
 b=EoyWEPV2bs2zlltzjcHbmX2r9acrx9jvEfMrSxPSQFfe4cbtavRJr7gM
 3FRvY4cL6DS3r2LFHO2UoerpoV22G03qXT6tOwoTdWiy3TiFG+L8OBCkX
 p5iYXydb4CA6L451exS4zUgx+EnLfT+JpVGXgn4jrsFlWoIFQ33yr8P5o
 7Es7UstFoTis5xIrS7WYoLFy72xjoejIZSkKobMnWGf2Hw1XxoDuzvqad
 nCidGjxSYPIom88z6T29KAzOXCgoMdUdxI1jFoYv/kz0/cEQac96q+7Va
 MQdiizd7LTT0Jggth/KwAx0or9BSstVNA/wjCHBKDrjDPm/RKudJhiCpg g==;
X-CSE-ConnectionGUID: RCmjBZgnSGSufCJ/YF2ehQ==
X-CSE-MsgGUID: J10HoFOFRWa8daZSeEnWCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="776181"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="776181"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 15:05:50 -0700
X-CSE-ConnectionGUID: o/wFkVeQQaOrQH3RrKxE/g==
X-CSE-MsgGUID: 6KVHCypOSEeaQfP7OCRE7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1773469"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 15:05:50 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 15:05:49 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 15:05:49 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.64) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 15:05:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVrWGZ/RccVf9/L3Zo4Qp52IlVpaI8V/bEX7K8fjaHSurS9H5M91RvbT578W24eHzbIef0HB8QOSvdEdpdGqS/CYCl4GkFksx7gsOYiktwQfpUNGHdHp9bPhrZrJ/y33Z1MBw7E8d7g5VQBDF8jmibqkhGHWGdV4RBspNYIdYu2a5pd63pZIQCO9WBJG7XLhiOF8eEKhxGbvGJXEiQD1SEgJVAxy9wV0y6fBARXfuZM/bBSaR98eCxvKPdlElOLGPiB6p5tKA3AF8nwXPPo3qWAG/z2zRXAJ+Oh5G77aXsGZquI9E8scBI29G6o6T+7obLonk+c9NYA9+UsWAe/0qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZSr95mXLRP8myLiI9g3pfeKLdkvnOIVCvOnrp7N8ITE=;
 b=BXUSWoh1qvLBfhCv9gafRbsiRjHwxvXNhlST3Sx9ICQg0WVeF45lzOkYGnGmh41WgWfpWWlrlK4uV1C23mF7YmHBeekDci+NCnIiLSyBzZIeZ3Hck69d3PBu7QrbCzTXtllZv65xmUyQKlb07kAnV/hDQvY49rDBtxHlGhtArbz5l8s4tZBLJPC311BrbXEy3mDfPyHXSIRwLHhjrSsTAKFvz0Xyp5ZM4i0P061WV4ZxTFIQgq0PorZ+7kVapnX4RsWSYlRNVl7y6vlmOJyGEK023PkIikphf8FYyHORuPwPPnRIhAMwz/68FyjBQWlPYd6sr4uxiJsLxf8QBF7MgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by BL3PR11MB6412.namprd11.prod.outlook.com (2603:10b6:208:3bb::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 22:05:40 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4%4]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 22:05:40 +0000
Date: Thu, 15 Oct 2026 15:05:37 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1 2/2] drm/xe/tuning: Restrict Anyhit NULL-query tuning
 to render engines
Message-ID: <20261015220537.GF578251@mdroper-desk1>
References: <20261012171901.19508-4-nitin.r.gote@intel.com>
 <20261012171901.19508-6-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261012171901.19508-6-nitin.r.gote@intel.com>
X-ClientProxiedBy: SJ0PR03CA0345.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::20) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|BL3PR11MB6412:EE_
X-MS-Office365-Filtering-Correlation-Id: 70451aa5-51e0-473f-cd94-08df2b08732d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|10067099003|4143699003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: nl2MIM8OGwsr27YbDabzBEslKuYAEJO1bG+njSm/dlh2CNMGFy8dk3xeytbvhXEYAXrlSLZ+18en7B8TVRjI/mCXPG9FrC9Bym9gndbCIQ2D5g3ap37ALV2epwL6UavW3cM9rY7usuyEEjt29yHcOZagcaZfkic4KUSfSO1aVoGD9Cgya/RfTgQeqiyx8ncierZV+Hfu8HHlAldMIX68fUgmPHP8nijtPb0OiF0UPdiRxjcU0zxoGYCWMloUfyB14kXyPsSSKZAJ6JKHmZ7ctbYfcP2KlgmU4k+yAkeWM2EsTgiLfkEvQNVvHP8j7H4DSukfSdSLcUA8xF92DvFXuEWC+wFg1PYvyrNP5zI4oIDYOrrJsJBIZONyC4MYCqyaVjeN9Ixwmxs4o9roNWZUh2FqCLygMsHeuklxey78zOHuyAaSiv1mEPxXRi6DIwiI89M11Yefhn+T/tmwix9PxRsiqtHPGxqKdPHjWTs3Bm8PZYiM4s83lChC2oxYnzNfT0HkESfCSfcMkakkpb/wehidRuNP32APSTVXIb43uyanPHjJnuw9fVoiGYEmp/w+0cWd5ee4to8pIYyrQ5nKRxPmKFuShshi7hFWH2un2UpYtZOtNbSY8dOP1NH1jeIKQcpnzI6P7jYhTeJqkN6Mxh5ZoJAK06o8t6EL/J62dXY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(4143699003)(261009223027099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1dyNbkY+jnsaj16y6UamYrYH7TZF7d9u2TKepSpSmHihIS+UvkIYBQ/5KlVo?=
 =?us-ascii?Q?ED0G4JpBZYlBBhoZ/Xlm/R9+0A9z/EmEjOf6QKaWjaJ/kAXtXfTHij7w6cDN?=
 =?us-ascii?Q?tNno1wiTmsZSyT+t9Ap+ReGmP0rt0dZCBT9/GeErg5rlBM9ChtB+zlbLQFWQ?=
 =?us-ascii?Q?wsQrfoaELzNWt+UoacbnqZfF+gpaX++7w0RyKq6hw38+uxMNdIYkVlXC795F?=
 =?us-ascii?Q?/uILrIUWdtUflYjBduyRNGrPfXJW99KWiiivGsVaN8cv51lZHFY4dEZdVDAe?=
 =?us-ascii?Q?ftuacs+BHWHIlGmHorvpL8rQoivmoj1WaQvPCYRPferQTpZhFV3mhjyECxkW?=
 =?us-ascii?Q?gEelSL9CI9Z3PvfhOZroXHGX3FsBwmc4nIa7o5/3ot0RDDeBTZy8LfnaFI7C?=
 =?us-ascii?Q?/u0BUlS8BXuWEew9Gko+Zjqv2n1yu0GgRwHa8X0dEkXr35kMxmkhDlpQ7mE+?=
 =?us-ascii?Q?fULiq8XQL+rJe6DhEN8171nCcaLwrgC8+bTmqm3DcIi+gN4cJEQqEiB5iEc0?=
 =?us-ascii?Q?6J4NUU46QpwcN5i55mWPbyUSqhxVz4Twl4yja6z0YhpnuH+2sWyE/nXvH7AT?=
 =?us-ascii?Q?Qn/P/Xh1DdI3ur9fcJt6RlTOxGwyVq7QIxNJo4yR4uX1jt+wTIU2+wB/rtOL?=
 =?us-ascii?Q?REWRfW1ZSTUk/8oDkBo5XdMb7NXzh8kbQn7QWe9pGHyMegiDl2gS6l2WyYz+?=
 =?us-ascii?Q?9AhEwVTBj66HgMPRx899Gv3mgEUZnBvxg0HMNVALJwzoHA7lFy68bMa4FzoS?=
 =?us-ascii?Q?do0772waKPpvNljFa2P1IS/hIAGyT7Po4H2cdu0wuFjyprBo7J2oTT0M+Xd8?=
 =?us-ascii?Q?ALCBzURVPBOpq7AI62lJRDoAOvysuNi7/gO5eD6setGqs3Hhinw8RgJViUJs?=
 =?us-ascii?Q?xgxlUBla7icKpw0toKg7DXYCLZbY8OPJDBWAGmfhO95jD4QQ11lcaCKipaBF?=
 =?us-ascii?Q?X9abg54m6l/QvgQZqm5lPRa2MhZLaxZRyiKU+mqxZxMrM67iWoI8hVas1O/J?=
 =?us-ascii?Q?TzX+TpQuD9Sz6YrGftYeq7a3w1YEu7rCJPjnDkHv2zUFezWfoNTXe0b1IGC0?=
 =?us-ascii?Q?sw79UwpNs0/uV0KmNoMCAuVbVn7MJjHSD2Ea6oDvQCmwjpw9A4AOrPhoxhih?=
 =?us-ascii?Q?Vpf+fjNO6iJzDjCBEd7Cz6/TnQtAAqcBzp2jiEcNjjhW2f7JzJ3NC7InduWu?=
 =?us-ascii?Q?uQ6wUVWhUAS+pQTN7W+AjmxecrwLAf+M2+4yNujkjGuqnyIt0E6HZTl2lF9z?=
 =?us-ascii?Q?BpWBsHpJqBsrSihHju1Jm88DNkcION9dNwvnOaaFTP5kwrlLWOp7Q4lis6Pl?=
 =?us-ascii?Q?nwWp2aOdbKkhLsZvvZNkuFyq/IZ1gQMZ+yC8ZZB0eTSA60zw54vL2Ry2JbjN?=
 =?us-ascii?Q?mtnqRK4sI5ehtgCK/cxL9uYjYYbq1j2Hf2Nm38zRhyvLUf+U0ePa8se9Lv9E?=
 =?us-ascii?Q?Za+apL62E5jzTbsYsAb99HKmBVUWJyARhhDNUyhZfDzVWjc5bA+h0Kfp7hy6?=
 =?us-ascii?Q?CPRfviBoIUfW49KWUKMWH/iap22tBLG4KjMa0l/AifX597YdRQ5nGAwDDZHE?=
 =?us-ascii?Q?/xHKZIKGEA6nS97SYK3zdcOqE7hSB7YJUzrAOtZLjwO1gWeMRi78ANe8x+kn?=
 =?us-ascii?Q?12esYSmjozKTpeo5ApO+fhnoXHkJlKTQ6/87RPmHXac1LduHWSYVf68Sqjle?=
 =?us-ascii?Q?/hhNYlCShvrpFkVzwvXB59GlaucP2at3qTzOXl1OGLbbOptOIfqGGP03IIut?=
 =?us-ascii?Q?27W+PgqQD0lNGIajn4CXNSVp1zTK0DQ=3D?=
X-Exchange-RoutingPolicyChecked: QbNpNp706v8TwAPWegcxgdjitaLcK7MWxQhbfz1laG47haef3MSNQbUrpYE/gPGJDjnojKlRdLYwArovIpm7Khl/eD4HdQ+N4yehVWk8g9VXOcJFLNFpDJjFrJpVo6Duayql1OUUg6DUmYKHwMj7quXzJaC6awbg6lZou7I99C7j/MG/bi5OspRtL/MrNWqj6l01E6UX+9CeWf5ejMBDobnO+ENEVt22OICTgqoTfVv2Nb8cV9FTHMvf+XeMa6SlWhPGUnTZIE0CZZyBkNA8lg0Nv+wN84nYHanW59AVVb8JmLb/mVUWcbJGWwS3U3MGqn4+sA2b3Shgja7/AUCNhQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 70451aa5-51e0-473f-cd94-08df2b08732d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 22:05:40.4699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/7bD2B1D5oNaHTQrxNMBZyKWjlgLGrvU3Hp3r361sRvurJN390ytSbX37s8OzwTJgIg2ScWKZGeZxwsj32n/3rXT/praP8hC1iSUT35vKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6412
X-OriginatorOrg: intel.com
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Oct 12, 2026 at 10:49:04PM +0530, Nitin Gote wrote:
> The "Disable NULL query for Anyhit Shader" tuning uses
> xe_rtp_match_first_render_or_compute to program RT_CTRL once per GT.
> On a GT with no render (RCS) engine, that match falls back to a
> compute (CCS) engine instead, so the tuning is still written even
> though RT_CTRL's ray-tracing logic has no hardware behind it there.
> 
> A CRI compute-only GT hits exactly this path, causing
> igt@xe_debugfs@check-gt-reg-sr to report a save-restore mismatch:
> 
>   Mismatch on 0xe530, expected 0x400 got 0x0
> 
> Restrict the rule to ENGINE_CLASS(RENDER) so it only applies where
> ray-tracing hardware is actually present. Every other in-tree platform
> in this version range (BMG, LNL, PTL, NVL) always has a render engine,
> which xe_rtp_match_first_render_or_compute already resolves ahead of
> any compute engine, so this is a no-op for them.
> 
> Assisted-by: LLM
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>

Fixes: 8d8431298f69 ("drm/xe/xe3: Disable null query for anyhit shader")
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_tuning.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 514deded1163..de7f0f23620d 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -120,7 +120,7 @@ static const struct xe_rtp_table_sr engine_tunings = XE_RTP_TABLE_SR(
>  	},
>  	{ XE_RTP_NAME("Tuning: Disable NULL query for Anyhit Shader"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED),
> -		       FUNC(xe_rtp_match_first_render_or_compute)),
> +		       ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(RT_CTRL, DIS_NULL_QUERY))
>  	},
>  	{ XE_RTP_NAME("Tuning: disable HW reporting of ctx switch to GHWSP"),
> -- 
> 2.50.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

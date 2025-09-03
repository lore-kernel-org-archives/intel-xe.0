Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80097CA1007
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 04:27:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1AF10E087;
	Wed,  3 Sep 2025 04:27:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UA75h/lV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6158410E087
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 04:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756873664; x=1788409664;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XT4i8eo+s8sdyWQH/n8fkKWfufjAvt/VL1tk41023YI=;
 b=UA75h/lVXAhZDPACbzsqatkVc96A/DkbP4VbO+ychiRPXu7cz8HadtJx
 jCouL1I11zRC6HN+qQ8balSyqpcIzATekMPya1Y0ztMl6YhVotQ3AxZlq
 68hGutidM1kJjScQB/MuMisrtY9ZbQDRhLC7qqoPV2ZN3V0GzWf8/64IE
 F7Q1btFpfrLYDG8nhCtGh6Ean071qkSB/rZuuRdW2PrBM2FyJzL+hfsXU
 jUCkwLBfu1SiLR1WaqP8jjUkEwOrN1Hvo/TZs+ja//QtIUR6fIivOyV6b
 hB13C/a/lWAc3NnynVe1vlX+CGdpT6uRGpPCmDSFyZtts0dRwvZ2JqMo3 g==;
X-CSE-ConnectionGUID: Mo8NmcP3SdGIMWgMkRvmUw==
X-CSE-MsgGUID: 64Zy2MZZTcCboJL4CVk8ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="69788389"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="69788389"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 21:27:43 -0700
X-CSE-ConnectionGUID: JMCgGDodQzuiwQ9cCfrdLA==
X-CSE-MsgGUID: MOQ7imYOQhiJXPuRgfNasw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="171041945"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 21:27:43 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 21:27:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 21:27:42 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.87) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 21:27:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xESogmxILxtH/4Y6hhLdwk6jJo6AiHrbri/suNVbHCgP5NQy8LhkLJVFcuI5zymCvByt4PgASiZKweVf2fjG2PeNpxbamqXajIFN4e/ZD8A+V35glw3PwGiKjyA6IaE0uOfre37etKgrJbs+eSrpYXGF0r0js/DFP1xv8BapB8hGVEdvMpNnpFcn0KLxTHO3k/9eogdfIRwtAibL8gRO8KvcLKbLPAaCYfXdw3i4ldAvmovtdQ1VUjJzDCPeKRDuFvJl1bmfe1EI7cnloLq9uTei4MZBrch9hbPeJdJic3CQiZn9I+PO4hSsft2MPbeQi9/ARadZkR09EJ1aHaXxuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46EqjxTBpYl+vPMM+7/QJ1QR0viKXAv5QWNsTK4DPx4=;
 b=n/4P0qofj6XpBZyrrYyVs9liv1Dy3l8VEWf2XJxClaxPQe8YDIlzlhC3AT22UPaltSs+DXTranVsYfL5Zas4xm8vSe+fH8z6R9KbnWq/MZpipv4FIBC0ti70UCNN5e1mmsfih/tqoVD1lDsfmBe689fTQAERatrON3DIGTnXQNW6H+55FJdC1j4H4c/xP8G/HCbxqJ0X6fa8JlGPHsja5G2omP80Ux7XReYJBvWspWCgHFADKRutBd0+8HPHHn3qSaG87CIUYmQfCqKBd9gH1G3FG+IGz9R/91VF9BOnocQ4UONVX/M5lQZJ6ThY3kk+9S6QNFF72mtaT9upFI58Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5781.namprd11.prod.outlook.com (2603:10b6:510:14a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.29; Wed, 3 Sep
 2025 04:27:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9094.015; Wed, 3 Sep 2025
 04:27:40 +0000
Date: Tue, 2 Sep 2025 21:27:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Set upper limit of H2G retries over CTB
Message-ID: <aLfDuVw9q6IKDOSo@lstrano-desk.jf.intel.com>
References: <20250902124850.5040-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250902124850.5040-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR04CA0279.namprd04.prod.outlook.com
 (2603:10b6:303:89::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5781:EE_
X-MS-Office365-Filtering-Correlation-Id: 925f30d2-b719-41cd-397a-08ddeaa237de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uOnw/nPucszaNm6x4uK4wrxvn07ZOnSn7Ga0Idv+gSpQZohFQhm2p+CP2x6q?=
 =?us-ascii?Q?ysDxAzXZ/62vsoKKEW1BHrYMFnf1hp14qOlolTFhW+w2FFVlFVTLXwAAbepO?=
 =?us-ascii?Q?0XGwHwgzq+t55v/c4xumU4fZIECDiIyekRPSnNyBA/VcJX8MXkOtcFrA4EZ5?=
 =?us-ascii?Q?UsfjM4D9yRm8sne1KP3ik6bg1m3Z5J3uqMD6BXBQR7Ve43G4Q7a4OiKIyFUV?=
 =?us-ascii?Q?9/ShmG0p2CwB/aR1P/gHOkmZZa4RYhuSe0rORW8dRS2ZTDBtl6z3HaBhkEZF?=
 =?us-ascii?Q?RkvJFcBFQ5YFvnXeQICbVCwSk7G1HATH3KvSHJEvFOdXlaMhfA1MZsijLNtF?=
 =?us-ascii?Q?womgtvH0isz9R9hTTsgns91gcVkouQH98PBN+y9s/gD/YT4RAl1vnQVzuPyD?=
 =?us-ascii?Q?Wwr5Fuzopie04ClFcYfT0y7UVne4iSVO/thUFKUIHGxm7mzxES/lsg/TS6Mg?=
 =?us-ascii?Q?KRJDURfD+427gEZ06V9Oq1i081l661BvcoiZivfcOR0P6SG2zsgH2SbYXyeQ?=
 =?us-ascii?Q?9CQ5p5Ry88REWfqTXVQo/uZaOVFQGmDUa8QssKh93bqPnJ4vU4N1IXf6R1gp?=
 =?us-ascii?Q?XE7yIBn4dR04JsQYkRqY3i1fvv6p7JaINYlAci3djxHH+5YiG6lcnHElwDvb?=
 =?us-ascii?Q?3T7XZecHIH868CSfXicrXCihpV4zhwskG2uUZ4rrknezisrNwghoyuXx420D?=
 =?us-ascii?Q?AIzfAUY9eufZoFGbJemjhtzYVRPUQGrKErbee6Y/SjMcyeyS6lhm2UICRmCj?=
 =?us-ascii?Q?Z6ue1DylZ08HC4oQPpFJGuhO57Hk8m44ap21vVyLppcMd0h/IdN5UVskkIaX?=
 =?us-ascii?Q?ZeAMFVpQ0QuBAlz7+TYoTECauE0ndsDDRWz6W7A1oHxcAYD7GDB+Ie7usSdJ?=
 =?us-ascii?Q?YjVGK2LQT3A/46XicKftJ1ayRHPhHTu2tdK5mIGQVDRoYaIapyAEVLO5PKxW?=
 =?us-ascii?Q?6OjJWkPxt1G0R/l1jiA1MM5h8EKWHwff/OBiHdhv6gFdKHrIIiKslpqqLbcf?=
 =?us-ascii?Q?0f4ua361VWEvfQFRcxwikAZWwtDZBkGcBC+qk2DicDgxhdfH0mflJNMn28uI?=
 =?us-ascii?Q?ZkClrU83RmY1EPRE3F0wBCxz0pbmSPN8gxf6BNfS7mxHUBktNsoAzvl/2t23?=
 =?us-ascii?Q?hwXl2xBmMAhLxkJBjxkC7/Iv1JcEu4Ypf5g/SnH1rYed5TzBE8DR3Abt4lIQ?=
 =?us-ascii?Q?KVPz7Twyna3kczy3uokxML1kUuoQJX89Tljg6y32fgEoSmZv/T+zPrY9zlfS?=
 =?us-ascii?Q?aj9W5YnTQCE1jve7wnyDxlTfoJv3qZn0rJyE9Q18Hj1kz84CRE/yX1+O4v/n?=
 =?us-ascii?Q?OiMZPYeEeJuRjv2nfStxqsjdN3Wuizqd/jVClOqFpGp3Z9iCFfr5+W2KjpZz?=
 =?us-ascii?Q?xrJ/1axpBu3V2l5umu9kJu04WYMagT/jjZZ9MGtRccHA/HcECtvsl032XbXl?=
 =?us-ascii?Q?5GQcN6CKsbk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DqmqoWmCLXaWdTC8JBHJU0HUtcbpiqxZixi/IqMuMtHQn003hjiU5noIMxej?=
 =?us-ascii?Q?c2auSGHYmlipifA4aXFvbmNY4efTjUbZ3AL1J4aIvnfOs+hEgOP/agfL7btP?=
 =?us-ascii?Q?FZMXAmoeSjxfWQC1KLMKgv3VdU8hOo6A7AT6c6UO9vrBe8b8YS2Ai0x5Lp7D?=
 =?us-ascii?Q?lKmwLjEnIFAr54Hl6QUyRCfKeaOFJrUYnIEbWT/7dWNS8aTU6AJrv7gpyhLk?=
 =?us-ascii?Q?fjkHiTFJczRd3pft0vySEzWGg1TBVNEYDlv4+9IultkEL594gEgMlCevaie1?=
 =?us-ascii?Q?sYKubuPkT95U27P//rhVqL7EjV4vDgl37lp8m4SICNWvmoSmWyE0+/Q2YsK6?=
 =?us-ascii?Q?4VOtc40T4+/Y1wQsVVc2UeshCBvubKroIySvFdZHrTjPJFemywUkBHMGOELX?=
 =?us-ascii?Q?2+INQXOic2cE7ndQvXPOIEY2q2fEk5E5vAMPIDKMb0Pe/kZjVbQv64zUoQhC?=
 =?us-ascii?Q?3zz116PNT7xACcq5g3B92v8L9v6TagtfMPRSYLupnWzvirXt/INZ+qB1G8EQ?=
 =?us-ascii?Q?C1DymOx7S93ep2a/ilVAt1pz7eW017WnkdPKg1zMMjHqd6VWGk4I6Cc+zhFw?=
 =?us-ascii?Q?d/mmRf7VEg50A35NFTIwIjusrX9pugR4a6quZ9ORRmIZzBUXtL0paQ2vaJTx?=
 =?us-ascii?Q?UBitPfq3l+WfNT5xz5YiWPgSLpxnad5mEJgqKbfC7iWIjY8oxlwFH+kKykfz?=
 =?us-ascii?Q?XdjAi/tixu22+zkTIMYg3jtlLZgcCISc8IrCc1lNRaD2vBmEVeja+2bR0xZF?=
 =?us-ascii?Q?JRLECZfqFf+c7Qfp9ZH5Whu/BtoX4PS+y+Md7b4R1oVJkgAmIUma+TvXyMv8?=
 =?us-ascii?Q?CtuAxz32RZqDP4qLohdQXEdLTioJpL3PRG45GTmT5b5C5phlaIzIXHc6juQu?=
 =?us-ascii?Q?+r5+yMiQxmQEWrE1Y9xyanYJiIrjb2R+pGKh/+SXRCOq/n6Qsy0XTDz2OuDd?=
 =?us-ascii?Q?Liwn5IKzatawcfi/nxbXX31pZpqFxBbq4sW3oWorwqkARqCw1EyoecGwgv+Z?=
 =?us-ascii?Q?/pNsjowk24ZO8zDKMItaJHGJ6G6Q9Y7wDb8ZHhlQa9hhvO2+tQAgPDPlGMGk?=
 =?us-ascii?Q?i2+CYN/mfGQZJOpRJD7igMR4gwYsB1wXmf9ncAeAMT6/f885ecQAsKrceCK2?=
 =?us-ascii?Q?H1Dhf1ur7gKx2f42qP9uRveNLXWv2zTTqJHFrM0aSjI4C1IiXjuAp6GFOyvy?=
 =?us-ascii?Q?hg0oC/Sh9FiiVLniPlK7pDg032ulzMqBadi2lSNHntFwMfGyoPiNLmP4dGZl?=
 =?us-ascii?Q?Ty/GMJWgYVo9gjZnlhD8mHgO0x2fVG8Y9xQdVjcKiD5ibWcDBhZ47IyOxujz?=
 =?us-ascii?Q?9hvWee07W+pRTo3wENFcfyxDi/XYYnpY4JIz4CAi79fQCjffzhSX8dYLuTps?=
 =?us-ascii?Q?7HpYZSOf5QgIlm/9/Nd+DaJ5tXu1vEM0L4Dr3bIjo0VEAl/6pPOPP+bwQDVR?=
 =?us-ascii?Q?lKRO4841uZXXBsgrTn5QfERR0K/WTpi+YRH9LKR1FOtMUVSyDAERM12l+jt9?=
 =?us-ascii?Q?2JvZEvlgn+ApvZypbHW1M3Bn3tS8EVngWYoTyydF0QX5cJiDZt994nUlkrJY?=
 =?us-ascii?Q?rKrjGxIq0VOZk6FY3IUfOnri67b0CEIuuIhomPwq3I9u8XY6B824YA125dst?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 925f30d2-b719-41cd-397a-08ddeaa237de
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 04:27:40.1132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CEQleggrFZyzInJ34Q69wQPl6c3aO8T8mwxExo9Kw/DQWtT1dWM5vY8z4df4eIQ3ugp7tMxg5czouPcfslDeWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5781
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

On Tue, Sep 02, 2025 at 02:48:50PM +0200, Michal Wajdeczko wrote:
> The GuC communication protocol allows GuC to send NO_RESPONSE_RETRY
> reply message to indicate that due to some interim condition it can
> not handle incoming H2G request and the host shall resend it.
> 
> But in some cases, due to errors, this unsatisfied condition might
> be final and this could lead to endless retries as it was recently
> seen on the CI:
> 
>  [drm] GT0: PF: VF1 FLR didn't finish in 5000 ms (-ETIMEDOUT)
>  [drm] GT0: PF: VF1 resource sanitizing failed (-ETIMEDOUT)
>  [drm] GT0: PF: VF1 FLR failed!
>  [drm:guc_ct_send_recv [xe]] GT0: H2G action 0x5503 retrying: reason 0x0
>  [drm:guc_ct_send_recv [xe]] GT0: H2G action 0x5503 retrying: reason 0x0
>  [drm:guc_ct_send_recv [xe]] GT0: H2G action 0x5503 retrying: reason 0x0
>  [drm:guc_ct_send_recv [xe]] GT0: H2G action 0x5503 retrying: reason 0x0
> 
> To avoid such dangerous loops allow only limited number of retries
> (for now 100) and add some delays to slow down the rate of resending
> this repeated request.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index e431ff73227c..9738888531e8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1079,11 +1079,15 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
>  	return true;
>  }
>  
> +#define GUC_SEND_RETRY_LIMIT	100
> +#define GUC_SEND_RETRY_MSLEEP	5
> +
>  static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  			    u32 *response_buffer, bool no_fail)
>  {
>  	struct xe_gt *gt = ct_to_gt(ct);
>  	struct g2h_fence g2h_fence;
> +	unsigned int retries = 0;
>  	int ret = 0;
>  
>  	/*
> @@ -1148,6 +1152,12 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  		xe_gt_dbg(gt, "H2G action %#x retrying: reason %#x\n",
>  			  action[0], g2h_fence.reason);
>  		mutex_unlock(&ct->lock);
> +		if (++retries > GUC_SEND_RETRY_LIMIT) {
> +			xe_gt_err(gt, "H2G action %#x reached retry limit=%u, aborting\n",
> +				  action[0], GUC_SEND_RETRY_LIMIT);
> +			return -ELOOP;
> +		}
> +		msleep(GUC_SEND_RETRY_MSLEEP * retries);

In the worst case wouldn't this be a rather long period retrying. If my
math is correct this would be ~25s in the worst case. That seems like a
lot. Could be make this total timeout period closer to ~5s?

Matt

>  		goto retry;
>  	}
>  	if (g2h_fence.fail) {
> -- 
> 2.47.1
> 

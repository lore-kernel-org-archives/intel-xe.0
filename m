Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBC4C88E53
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 09:49:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10C310FB4B;
	Tue, 15 Sep 2026 09:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aPUaO6KP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58AA10FB4B
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 09:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789465794; x=1821001794;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bAoezQWfh9pXHBibZWSQemF+Cax5DSoDvzx/8ZQD0U8=;
 b=aPUaO6KPvCTeihDaXt3moCCzYuB7ssNOnK2N0ecDyup2UU6ngrk6fdTp
 FkDRZlB2w+s5mFtSIY+QMrji+GwUZmlcu3j/twpWN91X2IrpGf6bwDCN3
 bkxyUvH/b4/AG5webKXOYes8szNy+PFsGx3PglCf8UxHmz4AVwQ3Z/RB7
 7hu1jcTKvKxlC0D94MbeMJhCPoyNsnj7QkSqO4oVwHJjOwiXkhE/peeSM
 /x8HP3bvUslOi7BS10AHyg4cYR4FwVzLxPxav+e7ppFzPWiiohQvh34V/
 ZCnycBJVilEpItmt3IrEc1nIpH2H9USL+isfeOByiAFjAHSGIJX+m+QPQ A==;
X-CSE-ConnectionGUID: O5GSDaZiRSu3c8guHk9HNA==
X-CSE-MsgGUID: BBboWu7xRlqRjcbGaH5V9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89584087"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89584087"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 02:49:53 -0700
X-CSE-ConnectionGUID: dDLTGIDfSM+QmeAQbc2Hkw==
X-CSE-MsgGUID: IRm1hBnBQkKjb52B1WfpFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1327394"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 02:49:54 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 02:49:53 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 02:49:53 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 02:49:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wA77qdzWZICoZUKO4IuyuVGvTqV7LlJnbpDTSnkmStBpBcFLtEsvpUvQkQ+3Daeau6K60bnbrdiv2eN1QBZ2OTr26hCIvpnlz9ulQChe4whwEAkwfAzcpQV+REhmulvR3kDlj2wBmFUb7N8T75vb2buTetf2eJKVa+kAKuPlkma5z3HzPpDUfpjXIc25zMAl4ycMtfqSpWNiu1vnOTivFwbcrU3M9XOMKOanKOPrbHolcVQAfCrld1GEr4KXJc4A/2EnBonTBmAiMmB0ypjPO5WFmFga21f/o2H/H16h8mxNUitVO64z4d7eHMvGynprYQgS29zdXKV4L3W+9ykW+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xyWQ1Cd6nq/kmRZs0ZAZq+JVBVdpOMFfdoHvPu2JHu4=;
 b=JnytfXmolLuEcpxT0z7LZjOeBUBqa+iuNTVgLbSVS40M3ggMlFby04MwE+aZsYaU2Sz8XqsWuVoIu1DiDnTLFaJNbiLuRwc/5vQtDJN6PTifK4XzKifB17kZwSvN0vbQk0oNrc/gkIgUbcLcJlwMiymhakWhWI2WWs/duRfpvs1djh5GrJTxEAxNc+oUzWRyeCm3IfEN3uiqttGqPDuDGUL18aUKVUoHwz7iLSFIh/OCKseTln6u+tMkvZIcRStdGP99zm+5r8bEQcoafldYsIdi68LNTfd+Nr+qlIsIOy8z4Rk9cZ6qO8dqH0MyvqBblS6caVE6PJ4YYZ/HhJyQbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by DS0PR11MB8161.namprd11.prod.outlook.com (2603:10b6:8:164::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 09:49:49 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 09:49:48 +0000
Message-ID: <088c7152-3776-4670-b939-c1fe558e0381@intel.com>
Date: Tue, 15 Sep 2026 11:49:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] drm/xe/guc: Use different error codes for CT errors
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <daniele.ceraolospurio@intel.com>, <aravind.iddamsetty@intel.com>,
 <mallesh.koujalagi@intel.com>, <alan.previn.teres.alexis@intel.com>,
 <julia.filipchuk@intel.com>
References: <20260903233958.475162-7-umesh.nerlige.ramappa@intel.com>
 <20260903233958.475162-9-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260903233958.475162-9-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2P251CA0029.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:230::31) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|DS0PR11MB8161:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fa4dc52-8a36-40a1-02b0-08df130eae04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: ppkIXWXfGtzY1QjOT+NiSZkXfxD7jbB5/YrIGKH9jZOr9p5qzP86TSHnO/yHwt1htwHPAPBoWEfyhdHNHQH5k30qLL8q9yZow/rR6UgI9A7R7MoG85izDjeXmzNFseg/hWajpneawZuiRgpClQRT8HrMcu9nqTGtxPavhUO6G1Qw4iY7J0j2vA+U/Il4OqcqnfhA1bA772CzzLmhIs/JfeVK+fXYUPVnAkQUOSQYYC/zpMMff+b7nbxxDk+VxQyfOZhgi4UZCCXWhOufni+SIIrK7aXFwU17ZieaaERnn2jFWM78zlguHyvJi/uQ1sdVzovCH8e3huGQxviCTtSkknGikhTqOrDh3TXxCdEP4DD5HC5m2yrkgsLc8WWt/FRisJ7ChHhu656n75rJ8KQVHc1BXXzL5FJOxVWsHAtLs3783djbV3zOQlNjQUYcPeTqci8AFeSb6TqvXsQOUauxAaOatJ1OYz1aflwNECfmGso2TYCL+/DynPqUWeri7O31xNoYYAy5z4p62knexZOjZ4EjrRxErRv79WncTZFDBtCgnePNKaN6MvBXAs6gRodZQdGSuLHAONZLCZcm0lZcoe/n4tlRNOZewg2MkOf00K8V2qJLbLMaVy5MKnmVfaqz8lMXUY7HQbYHY+uMWs8OmRs0Vg/dAPLX2Hb0KYqn08Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjJrRFErblR5djhmNCtQcG9pUzZiN0J0d25oTnU2TnJoNWRaMFNKdmh5QlEx?=
 =?utf-8?B?WCtsV0NpNnAvM0tvTEJ4Mzd3aUpHUmZoZERtdEpCQ2YrNklHZm12Q3g1MHV3?=
 =?utf-8?B?TkFUR3RZU0xMeFBKT1FiWGp3cVFnK0hoK0RIeEEzSWNqZ3JiZ0kweHZhTVN6?=
 =?utf-8?B?R3lPdDJhUWd5SHdSeTFEVzBmVW5HdmxYTXZwc3FqNHBnenlqRFVyaUM1cXpu?=
 =?utf-8?B?eGI0UDFGY284VGFCd1Zuakx2UzdtVGN3QnJGUm1uNFRCNlFwNzN1d1lNbVRW?=
 =?utf-8?B?VmJRQ0RIbmpZbjFXWGRJaU5POG1MaElrc3dOd3pLQklmN29BNUIydTZoOGdw?=
 =?utf-8?B?ZzFQVTl0NGkyMmsvNXpEWUsrZERDNGR5WHNnV1dFd1ZPTlA0Nk94L3pQZVo1?=
 =?utf-8?B?VG9qRmtkajYyUk5uU0M0ZXdqT3lYR3NmVzMva21Obm9ZV0ZrRlNwckl3OVZH?=
 =?utf-8?B?NTNSVW1NRlJiSzNBaHIxYUZ0aEtvekRQaFpBT3lMdzVFNlVqck1sa0pmNlYz?=
 =?utf-8?B?VVVJOWU3L25zZ24zOStnb0pwTzJpbDhHY085MFdSR2N4SkNtN1lYYzlIM1VL?=
 =?utf-8?B?NGRuUExNMUsrenJDK1MrRTJSZHZmaEh3SERHZUtKZGpxSDJPbm1FL1luQ3h4?=
 =?utf-8?B?V3F6dksrcjROclFxQnlHbW01Q2xwNk1YQ2Vhbm4xRUt3SGhXQ01wc1dvc3oz?=
 =?utf-8?B?eG5uQ29BdU15SklkUTBGVTdwMWZtWFlrTkU3MCtsdTJXQUtUZzZlT0RMNDRF?=
 =?utf-8?B?THAxWjIrZ2JyZ1pwNDdQbVhXejdSN0w0YjdYZC9LemxZWHpxTk04VDZ5ZUsw?=
 =?utf-8?B?THFpbjlGVUlEdjU4RTlMU3FaZDVSa2pSVndKeDZJOUlWYWhBS08wbS9salE4?=
 =?utf-8?B?L1ZOS2ZreU5vczhqb01uTVIwcXFCU2pkeFUvbUVZT0RJZ2ljRFJqTXFLNU5x?=
 =?utf-8?B?VEdJeWNQRmJjd0VOQzBHOHBuUGQxNjZXTGJxRjdUeTFzZitKQ1BXL1FjeVcv?=
 =?utf-8?B?KzE2YlZaTlFwK3N0UUR2S3BmcGZQVlpSMU5sM2RLTC9DM2VNUXNtVTZ1b0hl?=
 =?utf-8?B?cnZ3STBRb2ozTE5pTyttV3U4djh0TWpud0NvQzZiVzVYZGtRbVl1TXhMdko1?=
 =?utf-8?B?bjlGbDBsOG9HNDVhUHZyMVl5Mlg0NkJaQ1lkSjNjMzRzVmRRenVmUGFudEwv?=
 =?utf-8?B?WnByOGxKM0s1MDdkMFE4dHJnTXpCakJSOVArdGpYc0Zxb3UyeWZHV3BpZm94?=
 =?utf-8?B?aEhnL2RFZUcrWFJINVNzRDZXSUF4aHhtK2pxTG1pOWh6M05YVStVbEEvZ1ZP?=
 =?utf-8?B?M0xFRDhYbmVVQkJGTkpxZ1lUMncrOUFMMkE3OEFnN1NNdDNaa2pwWDBGUHdQ?=
 =?utf-8?B?cU5lRGRDcXFIK0N5ek5sL0R4bVJuakpNbEE2YlJxQ25yQm5wVE8vWS84S3o5?=
 =?utf-8?B?RzdaUWhmdWtHUXRHSXFMMEV0TzVnQ2RVc3NTZUV3azBDR2k5YndzMk1RRlJp?=
 =?utf-8?B?b3RFRkVIaWhDZEkzb3pDb1dnb1NjV3VxZ0svYmVqRVkzNFRkUVh3VHc4bmVX?=
 =?utf-8?B?djMwOFJydjB1SjJYVi8xWUJvWDY4WXVBSkpwazVRYS9kV0VJdDZBeGhoMTZj?=
 =?utf-8?B?UjVsQnRseUdhVGpPR3pta1FsY2ZwMDIvS09uZ3FvRkZPTER4UWk4Rk1VYmZO?=
 =?utf-8?B?RThnd01TbDNHKzYvQ28wRzc1dkxJUlJ3R2swOUZyNnlHeHExYmtDS3NST2xB?=
 =?utf-8?B?bjBta1NoR2U1YlRVV2VhMWVmTXlIMnNvcVRpbk53UmNmSEh0SmFEMkVsU3R4?=
 =?utf-8?B?ZTVqUGR3TE9FbXVoQnNnU3BsaVBJK3hDV0F3OHREQUFqQmtuWTZ3RmMzNGll?=
 =?utf-8?B?MkxUMjFOQTVVREN6Tm9SR0M1VUlxOGgwTTlJZzlnTjhTNi9tUWkyVHByUDBP?=
 =?utf-8?B?TkluUzVnN1A1L28ySzU1UEE0ZllRcDV3Smkrc0tWMmxjYTJyOCtncnVZWFE3?=
 =?utf-8?B?RVJTVmwvT3p4TDZxTjVWUU5XUmVmZDlSbzVlRk1nUjl4aWtWTXVCWVdCVUpR?=
 =?utf-8?B?SG5xMWJGZVl5Q2QrcEpNNHpndldMRzI5ZXcxdjA1YWdnNUdSSEljbjlzZWVv?=
 =?utf-8?B?cjZjQWZvRC9vT2xNcTR3dEpad2NJSHoyMThCa3duN3cwbnRMalk4NlhsSVlL?=
 =?utf-8?B?bUpJVHVUYkN5Wm9waStjTDhQbHI3cnNRS0JwWEtHbmttMW1nS00rVDdBaVNK?=
 =?utf-8?B?bWp3Q1lLWnBpSkNORVdGOXpMTlU2M3lXazJBSm9mQTM0MHprV0xxVWxBTmNR?=
 =?utf-8?B?cWJHM2N5a1hLQUlFZVgwSDJVc212TDY0YXpvYkJOQVE5T01mbmZFWDFadStk?=
 =?utf-8?Q?Qdid7hjrIsgwDWDQ=3D?=
X-Exchange-RoutingPolicyChecked: Oyhk6MvuMj2zs/M9LT29bG8M52u62ydnqKrjXXA0/F6QAft0A2jWZ/q6gS7HVKOSPIusOCGuiYV0+0F+mN7fKrrfp3ZLvABAma2pNrykrT79ChUa01ABZaO8I1cRT3X2CeZH9yDP94EMOboA3kcznhP7fRRGHOuvn06dJ5NeGYFeJfkYLQXuvu0N9qPXZe2d4iiesG6v3i7DzVi3p9zDUFDwNo77tJUJJQJDWvFHVOHS0vv7y13z+SvAsoVrZk3T2A5Hp5a+PVySnOnRNgkFMMWHx4UfRUEUDIXWXzyOys7PjvF2cbbevlMRbUR0SgQLa2M9tvgbnh/LB32XhVXmbA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fa4dc52-8a36-40a1-02b0-08df130eae04
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 09:49:48.1252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HdiHU6Qx6v58Nag4fUluzWhq0m7zqEoCUXyz5bnka0XONSLXiC6MEseA/XzsAVCdmUgiOjI8l09wzwMVgcPzTCO0bnz89wVAhsclez+xi2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8161
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



On 9/4/2026 1:40 AM, Umesh Nerlige Ramappa wrote:
> Instead of always returning -EPROTO for most errors, use different error
> codes based on the error type. -EPROTO is retained for the cases that
> are genuine protocol violations by the GuC.  The remaining cases now
> report what actually went wrong.
> 
> receive_g2h() used to escalate to CT_DEAD + kick_reset() by matching the
> two error codes that dequeue_one_g2h() could return on a fatal error.
> Invert the check to simplify reset handling.
> 
> v2: (Michal)
> - Sync order of errors in g2h_read and __guc_ct_send_locked
> - For CT errors use EPIPE and for HXG errors use EPROTO
> - Convert the non-fatal EPIPE to EPERM in the helper

nit: move change log under --- line

> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Assisted-by: Claude:claude-opus-5
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 51 +++++++++++++++++++++++++++-------
>  1 file changed, 41 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 5c4733da385c..c5a417fef913 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -947,6 +947,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	u32 cmd[H2G_CT_HEADERS];
>  	u32 tail = h2g->info.tail;
>  	u32 full_len;
> +	int err;
>  	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&h2g->cmds,
>  							 tail * sizeof(u32));
>  
> @@ -961,12 +962,14 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  
>  		desc_status = desc_read(xe, h2g, status);
>  		if (desc_status) {
> +			err = -EPIPE;
>  			xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
>  			goto corrupted;

I'm wondering if maybe we should introduce helper:

	int ct_corrupted(ct, const char *msg, ...)
	{
		va_start()
		xe_gt_err(gt, "GUC: CT: %pV", vaf);
		va_end()
		CT_DEAD()
		ct_stop() 	// ?
		kick_reset()	// ?
		return -EPIPE;
	}

and just call it instead using goto?

this helper can be later reused by g2h_read

>  		}
>  
>  		if (tail > h2g->info.size) {
>  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
> +			err = -EPIPE;
>  			xe_gt_err(gt, "CT write: tail out of range: %u vs %u\n",
>  				  tail, h2g->info.size);
>  			goto corrupted;
> @@ -974,6 +977,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  
>  		if (desc_head >= h2g->info.size) {
>  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
> +			err = -EPIPE;
>  			xe_gt_err(gt, "CT write: invalid head offset %u >= %u)\n",
>  				  desc_head, h2g->info.size);
>  			goto corrupted;
> @@ -1044,7 +1048,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  
>  corrupted:
>  	CT_DEAD(ct, &ct->ctbs.h2g, H2G_WRITE);
> -	return -EPIPE;
> +	return err;
>  }
>  
>  static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
> @@ -1067,11 +1071,6 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  		goto out;
>  	}
>  
> -	if (unlikely(ct->ctbs.h2g.info.broken)) {
> -		ret = -EPIPE;
> -		goto out;
> -	}
> -
>  	if (ct->state == XE_GUC_CT_STATE_DISABLED) {
>  		ret = -ENODEV;
>  		goto out;
> @@ -1082,6 +1081,11 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  		goto out;
>  	}
>  
> +	if (unlikely(ct->ctbs.h2g.info.broken)) {
> +		ret = -EPIPE;
> +		goto out;

to be fixed with -EPERM/-EUCLEAN, or ...

... maybe this should be just xe_gt_assert()?

IMO we should immediately STOP the CTB once we detect that CTB channel
is broken so we should look for STOPPED status rather than info.broken

> +	}
> +
>  	xe_gt_assert(gt, xe_guc_ct_enabled(ct));
>  
>  	if (g2h_fence) {
> @@ -1809,10 +1813,12 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  	s32 avail;
>  	u32 action;
>  	u32 *hxg;
> +	int err;
>  
>  	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
>  	lockdep_assert_held(&ct->fast_lock);
>  
> +	/* Keep in sync with g2h_err_is_fatal() */
>  	if (xe_device_wedged(xe))
>  		return -ENOTRECOVERABLE;
>  
> @@ -1823,7 +1829,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  		return -ECANCELED;
>  
>  	if (g2h->info.broken)
> -		return -EPIPE;
> +		return -EPERM;
>  
>  	xe_gt_assert(gt, xe_guc_ct_enabled(ct));
>  
> @@ -1840,6 +1846,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  		}
>  
>  		if (desc_status) {
> +			err = -EPIPE;
>  			xe_gt_err(gt, "CT read: non-zero status: %u\n", desc_status);
>  			goto corrupted;
>  		}
> @@ -1871,6 +1878,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  
>  		if (g2h->info.head > g2h->info.size) {
>  			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
> +			err = -EPIPE;
>  			xe_gt_err(gt, "CT read: head out of range: %u vs %u\n",
>  				  g2h->info.head, g2h->info.size);
>  			goto corrupted;
> @@ -1878,6 +1886,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  
>  		if (desc_tail >= g2h->info.size) {
>  			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
> +			err = -EPIPE;
>  			xe_gt_err(gt, "CT read: invalid tail offset %u >= %u)\n",
>  				  desc_tail, g2h->info.size);
>  			goto corrupted;
> @@ -1898,6 +1907,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  			   sizeof(u32));
>  	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
>  	if (len > avail) {
> +		err = -EPIPE;
>  		xe_gt_err(gt, "G2H channel broken on read, avail=%d, len=%d, reset required\n",
>  			  avail, len);
>  		goto corrupted;
> @@ -1950,7 +1960,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  
>  corrupted:
>  	CT_DEAD(ct, &ct->ctbs.g2h, G2H_READ);
> -	return -EPROTO;
> +	return err;
>  }
>  
>  static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
> @@ -2042,6 +2052,27 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)
>  	return 1;
>  }
>  
> +/*
> + * Errors reported by dequeue_one_g2h() come in two flavours: either the channel
> + * is simply not available right now, which is expected and handled gracefully,
> + * or the channel state or the message itself is inconsistent, in which case the
> + * only way forward is to declare the CT dead and reset the GuC. Since the
> + * former is a short and well known list, check against that and treat anything
> + * else as fatal, so that new error codes don't silently escape the escalation.
> + */
> +static bool g2h_err_is_fatal(int err)
> +{
> +	switch (err) {
> +	case -ENOTRECOVERABLE:	/* device wedged */
> +	case -ENODEV:		/* CT disabled */
> +	case -ECANCELED:	/* CT stopped */
> +	case -EPERM:		/* CT already declared broken */
> +		return false;
> +	default:
> +		return true;

shouldn't this be other way around?
IMO original fatal errors are:

	-EPIPE
	-EPROTO
	-EDEADLK

as once we hit them, we should trigger a RESET (which will then
result in cancelling all pending H2G with -ECANCELED, turning off
the CTB), so any new CTB request will get either

	-EPERM - already stopped
	-ENOTRECOVERABLE - if recovery fails

> +	}
> +}

maybe we should document in a separate DOC section all error codes used by the CTB?

	-ENODEV = CTB disabled
	-ENOTRECOVERABLE = device wedged
	-EDEADLK = CTB deadlocked ==> RESET/STOP
	-EPIPE = detected problems with CTB descriptor/channel ==> RESET/STOP
	-EPROTO = detected problem with CTB message ==> RESET/STOP
	-ECANCELED = pending H2G cancelled due to a RESET
	-EPERM = CTB already stopped
	-EUCLEAN = CTB already broken
		btw, should we ever reach ctb.broken?
		shouldn't we move the CTB to STOPPED state before?
	...

> +
>  static void receive_g2h(struct xe_guc_ct *ct)
>  {
>  	bool ongoing;
> @@ -2079,8 +2110,8 @@ static void receive_g2h(struct xe_guc_ct *ct)
>  		ret = dequeue_one_g2h(ct);
>  		mutex_unlock(&ct->lock);
>  
> -		if (unlikely(ret == -EPROTO || ret == -EOPNOTSUPP)) {
> -			xe_gt_err(ct_to_gt(ct), "CT dequeue failed: %d\n", ret);
> +		if (unlikely(ret < 0 && g2h_err_is_fatal(ret))) {
> +			xe_gt_err(ct_to_gt(ct), "CT dequeue failed (%pe)\n", ERR_PTR(ret));
>  			CT_DEAD(ct, NULL, G2H_RECV);
>  			kick_reset(ct);

hmm, it looks that during send() we kick_reset() only for EDEADLK
error, even if we detect broken channel (EPIPE), right?


>  		}


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7814C44501
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 15:35:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6414910EDB7;
	Tue, 14 Jul 2026 15:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sen/2F9N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D2410EDCB
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 15:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784043340; x=1815579340;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ziPCxUy54aa33e7NuxQe3GDv2fvDZcxq79RTfOiYdGY=;
 b=Sen/2F9NcKM/vr1AgwEhcwUdpyrCNP+uI35HjDBvGPyV4kszTwa95tQG
 L4gbAM9tdgjTGPNiVNmqAePgblqR63y3qkPyvPsCK/PztaS2AMxjiPcvs
 OaQ+04qpclUG3njlMa8a/o4dQIPY0E9qwtGnmIemDOTLlkEzdbpQWy+aQ
 +t0Ck2XQHQo9KL2u4BbQRMZxrGnc4sRHuqP3EH0jBTp4ElVOKLpaqdlPw
 Ew2T7cTiMZsdQD/9dwjbWnRMbrZIXLgl1w+ig9vkuzq+DlyLhQkVnUPvu
 NoFEBeyIGGJhycb13XFszfFepxReCzNddqNUsA4tdgnIlfXk7fMxh+dEN Q==;
X-CSE-ConnectionGUID: q//7wyWMQu2ANiVtSl4qXg==
X-CSE-MsgGUID: kWeDoRI4SnqM40tIAORROg==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="102223111"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="102223111"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 08:35:40 -0700
X-CSE-ConnectionGUID: WJkzBL0ST++mLhoquQYPLQ==
X-CSE-MsgGUID: SSKuPZAfSOmFNpUel3qr4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="280313814"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 08:35:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 08:35:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 14 Jul 2026 08:35:39 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.69) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 08:35:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=piYQ/8LS+jLxYbIZl0jhRMY6YyhNyWt9fYoYuyx5rUC821cNYf+ANg3gOndXl1ExrV9Z+hpQDUmtBFjXwjUFSlJCJb+Fhrv3rbnl1LNIlfCzcLacJmAaDLwpaTuhZx5bPSordnIwJrNr3rL0dXWWSAoYXOlMo0OQRMahaBLq27lgck+S9oK9EygbIvIc7M+1oVulXb2o23B1n/5Z84AraQS/fogoa4maCpnGkArgtXAhGQICriX27N26tKvet3/zKpfWhRbNtOPWMCkSfhYvOPiQk3xr0UPGa/LuLVNjlboTetqfqhbphnw3QqYyRJJ0e/Mm4qp2wzx9tgU400TseQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymghiUiVRjL+IBc8vyCqXLxqjXQ5gc5UX6L6dQPuMZs=;
 b=U3KKYaVWeLbqgIb1+MWi/8krRtEZjnlDiw7XQTc0Pu2g26b0QEXh6MsCEM460ZkeHZS/StI16tDNuPX4zNtTrtWoAxOwrXt5bdcqO1+dnjYQ4TSUp9lVlUvVf53j6MoDoJtlfqJgeG/xFHWc83+Fui27vRcrjWKQXn6MeRniv2p3AM2scF3toqT4JksSsAbYfMV2wntWrSFQBtMXvj98i+ekzQ3TWHdCflYEw22Ef7jD/MTDNDSpbarpLh4l40LQKc2tXhl0/EdgtBUAmOscjsdniXHSCf5kKm81Ks65eWFtmGwVGxIGiifTqCT36rGhipfca2EWd+6hDjpWxDst9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by LVUPR11MB9567.namprd11.prod.outlook.com (2603:10b6:408:39e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Tue, 14 Jul
 2026 15:35:33 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0223.008; Tue, 14 Jul 2026
 15:35:33 +0000
Date: Tue, 14 Jul 2026 11:35:30 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>
Subject: Re: [PATCH v3] drm/xe/pf: Disable display in admin only PF mode
Message-ID: <alZXQhIBCuj5xjOD@intel.com>
References: <20260714053259.504308-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260714053259.504308-2-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: BY1P220CA0039.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::7) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|LVUPR11MB9567:EE_
X-MS-Office365-Filtering-Correlation-Id: 51e4a760-c629-433d-02dc-08dee1bd8b54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: D+cyBdOi1BB1IkdZWgMnK6mHn3STHuN1W4z3JbcZE2uMuqjMfFw0cqMYcLpULJ/zEWdyrKkelf33JoRaNiKZ4MQx/7bcBWrZnFLH+cfR4dXPAlRKmEjanAPMLwnBEr4zlLV7Cp6rupRmG3rXwucFbcbbuZHEczBCDapa5Yp+ZTYJMoYbcjw5siKF7X0bGA5hrna+8umU+oS794aMN5UM77Y3aqVDBSVnZ2g4UCo16cvs3JiHSv+TxC8LwgOj8t21GA8hYm5Pxt8fHwqKc6NZ2X+vo3UyrKO6/tCYJ7wIUL/VjUhufofdBdpCRnIBUTqlWGMGkYH4FQqfX+B0taFL7kb6I+1H1KH1eE/iz++MCHX8Qb16p3puzEC9m08+e2NkU6urHanfTNHbrSvtR3e9MfFh/moJ2NreF7fIqnoGpdLJdXB1RQ45j3JNNZEI4QUHBC5FjTOCZ9jCheiybZsbACUi47pslWGCsK8gZPMQ8jqet9Ar5NDU0XOI8a6gGMUAb6xUh1I++3BXmAqrU+q5bNLAjkBRfncT7kj1UgUrm9f1LQxGvFqaJJGlQyCDmSkZZg/A1UvNe751ResISOwjJDQVgN+hQWRwAdBId67UoZhmOs7R4o5LptpbdIXf9tPd5bhYPNZv09nFHnrkwAE7cwQ5bkcpacsg8qyg1kQA5/c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1BRckdoTTMwVEw3bm1TdGJnRTQ0VXdZamh4TkVSVzdWSFlwWk9nckwrZ0do?=
 =?utf-8?B?aHhycFhKeFVBb29ZYk5zQW1TRG15aU1TQzFGM1Q2dGwrQ29wRXpwV0ozcTZo?=
 =?utf-8?B?aVdVaTZ6RXh2Um5qSmJEN0NoUENvc1cxNnhuNmtFN0M3cEY1TWlTTm1tQ1Zp?=
 =?utf-8?B?dU5lRERJeThKOWRqeWpNKzFOekRMUUkvY2xOUjVlRFVZR2tVclNEdTZncGtM?=
 =?utf-8?B?UkhzOFQwSUlTTTFxSXlLamVodUc0Q0ZnOWJkdHBKbVA5TmJuVE1qSHNzS2JF?=
 =?utf-8?B?Z2hGdHhIalNBZ3A2TVBHQTZFMlZTcDFWOHVLd0hwdGovVVBBb05vTk93cFg1?=
 =?utf-8?B?NDd1RWpiMzlrNmx5Y2F4RTkxbHFGZDZTdFEwM1BLYzBOWVRiSkJyOS9YcTk0?=
 =?utf-8?B?aGhpYXg4Y3RheTBJTFFwRWhSanJ0Mk11aFRFb0M4TFlySXVrQ09ORHM1Qk16?=
 =?utf-8?B?aVFrS3RWMVltTUxWc1lmdHphK0orQ1orZmphYy9VRkxSYVduaDhtcUY0ZEE2?=
 =?utf-8?B?aHo4Z0tQbGEyNWdSZWViYmgzZVE0d09heXRISlI5QytsQVBBY2txTTAwRUVC?=
 =?utf-8?B?ZkkyWFJNWHluaWZZaWQ2Sm11ZDBaamh2OTJRd3ZWL25CemM3R2Q4d3NGS2cv?=
 =?utf-8?B?ZHZhaWtaWTFvNHIrMG5TL0NKcklOdXhtYkMxWlVLMW1ZQ0dnUzF3ZmRKM2hn?=
 =?utf-8?B?dXlmNnlmeEFpNTZtUzVkWnRsaHdEK3BxSWZ4RUh1S2J4RXcwaEd3UjlCeDlq?=
 =?utf-8?B?MTNmelVlVWVURVZ3bytQb3VpaDFncFZuR0piRkVIcXVNV3poRHZwbzUveGJz?=
 =?utf-8?B?RGxXeVVabWVJdWtJK0ZzWW0rdHNUQWJtUXRVUW03cW9lbGEvbERvVXdZalZP?=
 =?utf-8?B?NGVra2NPWEloY0RaMUE0TFdmTHFXcGNVTHZNNHhxdjh1OFNDYzlKODlLWkpt?=
 =?utf-8?B?SENIREk0N1pxQ3NrUXlMb1Y5c3hranlHdk1IeTdmV3pleld4ZHlSZmR1MU1q?=
 =?utf-8?B?ekhienRPYWhVeW5Yc09jM0hmQ0RRNVB1d2ROZWY4T1ZTYTM4Vmo2OWRHbnYx?=
 =?utf-8?B?UHdJa3pBMW9kZFZSZUxCV3IyMUF6amlna25aRnFLcUZqMkZONnpNSm0wVGpY?=
 =?utf-8?B?ZXRRVllWKzlid0pJNExjZnJXNENwYzRCd0NnS2E1QmZrenA3Q3NrUE5FQ2xU?=
 =?utf-8?B?VHZRM2NDZGt4ZVluQ0pHSGxIRUg1ZTZ3R2QvMkdWeU9RcnZoQ25xbnN4R1FI?=
 =?utf-8?B?YytjRHNiZGVJSU5qeUZwNUxnMjV5Yjh6N1JwVXRRSStkZjBLcjBQR1cyVFRF?=
 =?utf-8?B?OHE5L0FYUUZCOC96eUVxWWVLQVc2bDZiSE9mR3dENFVjd1Q0MitlTjdQVGhH?=
 =?utf-8?B?RGZtRDNUWFFiN1NSV0FSNnJlZUppRk9YZ3JjUWhCZjZsYzlPUGkwVFRMTnR2?=
 =?utf-8?B?RENlOGg4SFBYRFRVY0F4NUdsUWNxMGlFOEJIKzh2OUpvMlM1R2dvOEg4YTB1?=
 =?utf-8?B?Y2J0VndzSkRHWk55c3p1WmpDb28zUmxZK1dINGFrWHVPSEdPVDRmTGg2am0z?=
 =?utf-8?B?K2FiSEN6emtjanA4blE3OVphQnRJWlltb3RKeWFXUWEzMmV4M3QvenpTRG80?=
 =?utf-8?B?STZLV21WR1pZdHdQRzBwc1M0akdOVUpacXhETUYvV3BFNStoRml1bDNlQUFF?=
 =?utf-8?B?SWpLdkdaY1hTdmZQOXp1QlF0K2xzcWJ3ZVMxREl5RngzQ0RJeTk1MVpmbVVX?=
 =?utf-8?B?T0dCeEgzeGRzVFgyV2lCWkxONG9qampCVWgySjE0N2lOZVBTQ0hOSzZoOGhT?=
 =?utf-8?B?T0lveHZBK2hlbTFUS1Q0VTYrWTJ5UEpTK25jVmtwc1JuQ0lIb3dyaU4rV2dE?=
 =?utf-8?B?bG1pNGxLVm9kNWJXbVo4dGc3NmRXUzg3QUFuak1WbStGZSthcnduNkcrN3Yx?=
 =?utf-8?B?eVNiSldXRU9ZZ0ZQS09lQ3RlQUwzWm5FRUpIRHFXUHMvdnhRQkxXTi9ITVRk?=
 =?utf-8?B?OUJ3bVA5bWk0K1NYUDNwQ0UwNnMrTHFGbWFUaCtOT2hRRGpmNzgvL0xOdHJJ?=
 =?utf-8?B?eUpUb1FsQXJJcDdMR0ZGWXMvMVp0aXNwYUFFQ2xNNzgyOXhuNENOUjVXYldV?=
 =?utf-8?B?SmxZN2hjbDNxa1lQenlBSzlpclNuajJkaEo4MTRQMjIrZW5YYldWVnJWMlha?=
 =?utf-8?B?UThCNjlZVzI4LzJNOW1HL2UvMGhxcEx2bVZhNzM0bGxFMFdneVVCR0luN0ky?=
 =?utf-8?B?Y292K3dCb3Fpa2p0TndVSWZOdXN3Q29IQndOckNsWGZibHoxK2lBVExBZWwy?=
 =?utf-8?B?WjRYb3EweVZaZkNnSU9DL01YQm1XUGJqbnUrS2ovUWxIME5VazVmQT09?=
X-Exchange-RoutingPolicyChecked: MsMt5qz9CDaf6XGXBkyVFYTYtbp6mA7U9tuswXFqA83r30SHpsXZ1iJh5CkFKgem9KyFi0nKN78I9Kelm2WVk6z4x2VOP4rA1xyzRionYzoNYIQaqkbvmHfcsfBLnGY/8Wl25+kEgvIeif1lnuhSeXZinS8m0XumrleAnL5n7D6+nFhhV1LednzMYIbd0cgkTjPFXkzFq75/a03sBBAbK29wrJgeAJOOCslMZFteApRRAHkou9Yd65EPMCII9qsj/6zkY1fuZM+H9MzTGv19e9q2+yTChujm/ppTq7cng/ZcAOu9FNpShpE9EbdAZRfsdb6yvbk/yxIRmuyEJ+crVA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 51e4a760-c629-433d-02dc-08dee1bd8b54
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 15:35:33.7567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fvehVJt3Q8bartE1cMwPMPms95Y/5byzj/Y12mDy/Zlb9YZWCx/PVMCEkwccGkZ1YXSlcat69dAsO+m/kBVFzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9567
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

On Tue, Jul 14, 2026 at 11:03:00AM +0530, Satyanarayana K V P wrote:
> Admin-only PF mode does not expose media or 3D execution capabilities
> to userspace, so display pipelines cannot receive rendered content.
> 
> Fixes: d88c4bac8c2a ("drm/xe/pf: Restrict device query responses in admin-only PF mode")
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> ---
> V2 -> V3:
> - Missed RB while resolving rebase conflicts. Fixed it.

pushed to drm-xe-next. Thanks for the patch and review

> 
> V1 -> V2:
> - Rebased to resolve merge conflicts.
> ---
>  drivers/gpu/drm/xe/xe_device.c | 2 --
>  drivers/gpu/drm/xe/xe_pci.c    | 3 ++-
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index ad7f3e61d457..785222d54701 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -427,7 +427,6 @@ static const struct drm_ioctl_desc xe_ioctls_admin_only[] = {
>  
>  static const struct drm_driver admin_only_driver = {
>  	.driver_features =
> -	    XE_DISPLAY_DRIVER_FEATURES |
>  	    DRIVER_GEM | DRIVER_RENDER,
>  	.open = xe_file_open,
>  	.postclose = xe_file_close,
> @@ -439,7 +438,6 @@ static const struct drm_driver admin_only_driver = {
>  	.major = DRIVER_MAJOR,
>  	.minor = DRIVER_MINOR,
>  	.patchlevel = DRIVER_PATCHLEVEL,
> -	XE_DISPLAY_DRIVER_OPS,
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index a3b968bccd40..3133e1b99565 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -822,7 +822,8 @@ static int xe_info_init_early(struct xe_device *xe,
>  
>  	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>  				 xe_modparam.probe_display &&
> -				 desc->has_display;
> +				 desc->has_display &&
> +				 !xe_device_is_admin_only(xe);
>  
>  	xe_assert(xe, desc->max_gt_per_tile > 0);
>  	xe_assert(xe, desc->max_gt_per_tile <= XE_MAX_GT_PER_TILE);
> -- 
> 2.53.0
> 

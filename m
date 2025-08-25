Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23E0C8303F
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 18:20:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A05F10E27E;
	Mon, 25 Aug 2025 18:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FpAYTNYY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F5410E27E
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 18:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756146038; x=1787682038;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gWwfZCNgaArKb10SfFrlaXOKi7oxxbrZzVcEXrz4d2g=;
 b=FpAYTNYYXS8cV3xqKtS6uiOBD09zfkGgfBl8//ULtgK+aWVmomDSHJ24
 MmUNxHs9BPqDrcmQl+gXnK1jvzDjB8lbZYWQTdi5KK0UXmyfyU0xR0eEu
 2+I6WtRKnsTq1Q5bXes75N1N7qVMjrEcGX/wPXMcSlANoZI6bJ7mAbFNh
 LgbM7Z0Y4sYqZR39oY/MHfo8PY767NCaXCfGtpyUzE7yQhQzzcA2WTy6q
 CtHD5sAf5AFR5P5bJTfup4fQo8iLccEc2m9UpswCvnBCugYTbKMA+Yp3i
 nQbPles3IZrEQub999aPubwIee8HqMRyRuNyx0slvatdqh62hCKZn74Sc g==;
X-CSE-ConnectionGUID: 0oh4F+BSQyefiMznXOLemg==
X-CSE-MsgGUID: aQ3PdyvdTyC3MWTm/IDDTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="62185945"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="62185945"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 11:20:38 -0700
X-CSE-ConnectionGUID: zOvvd/kJQ3mKO6PcURgVhg==
X-CSE-MsgGUID: PmZtDfEpRNauexbIw9xvaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="168874738"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 11:20:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 11:20:37 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 11:20:37 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.81)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 11:20:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K05yQdAFhg4mOrCLjDrd2jtV+e1c1xdgNs1nADBtcI/WtxBVNLrj6SJxs01U9DBcwHLfTo8g4S+Zw+pVf9EWnO2+JkmLGMCYdSACIEvmAlQPxTqPSjpPoloQk3VA15ejT7JQ6MM/Ib/McdBJ9mal+OzF6dinTiSl0GdXH7TIYmnORn/JRMqgrlK13p0T779C0ptsE5QOEBjAS+pB7hUa0w3p1kR9PzeldW8t+io+FNLRqbXUUC8XJQrLTQUDi6h+JFkuc/3XKO152j2kiDvatrg7412EUbtfqV7zLQLgB0Uf2iDOxptlEAzKmUMjDSDVDz1OypJMf2FhWz3kG7OaTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TXq5vT2A2WGqxrB7TyYsyvmGkHYgg/Y3U9/k3u4gQkw=;
 b=MSh0kVoatMMKzHGocqrHh553iaDCQVu8kUpJgh/D2vsB0RuQJWgcdHhkQZ7qD/kYJ1/k/pyKdnAr61JKeVF+I/8YD7MaLL9scAofo3pRS9aFhWG9ZFuhnmHvc125Gfc1B8TUGemYJGoYvHQocUyntVMA2Yt6QclrAB9FSHgHin9n7VWBbu7zUcDiljHO/b0/qbS23cR2O9vqtFEYmyozzeiIxLEnMcKb4/X1rB2sc/3bO1BlFqHLdbmAbHLMYJ7VDVwE6VALZgYjza8zoW3NvmV6r9Tx/IIvjtorxTzeI0K4ycT+mSb2e4JsgzXZBzmj8+7Caus8kTs1yj7YuOtk9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8383.namprd11.prod.outlook.com (2603:10b6:610:171::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Mon, 25 Aug
 2025 18:20:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 18:20:34 +0000
Date: Mon, 25 Aug 2025 11:20:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Kassabri, Farah" <farah.kassabri@intel.com>
Subject: Re: [PATCH 2/9] drm/xe: Cancel pending TLB inval workers on teardown
Message-ID: <aKypcLC+rauQ7sBN@lstrano-desk.jf.intel.com>
References: <20250825175721.89129-1-stuart.summers@intel.com>
 <20250825175721.89129-3-stuart.summers@intel.com>
 <049695bfb6f8496cafef33310f574b0a52737761.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <049695bfb6f8496cafef33310f574b0a52737761.camel@intel.com>
X-ClientProxiedBy: BY3PR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:217::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8383:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e6db0fb-8adc-48d9-85ba-08dde404156f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?AT6cQghLHHvluvJ3bxrwgQee4xULGsCiVB6Vm+lWOXjXj3hm8nkl3iWIy4?=
 =?iso-8859-1?Q?/bSpfTeNnuHA5A3PZCVRisT17WBex9ULzfpEPEn34hok3hlXFNMdNsnQGz?=
 =?iso-8859-1?Q?s8k9EFj75VXyD+zEn9nUQGlR2YaahtpVZLtjgLRdPh+fcPfqzfhEdEVWK/?=
 =?iso-8859-1?Q?MkuGZtkPKoVNhgCay8MA66ZA5htyQU0XgEXRom/msrZe9+r01pUpx0LB2J?=
 =?iso-8859-1?Q?wrOcu1b7wT6w+hif3eKlBqSsTppoPM/aZghLL82VsAgJ2oZYqYkqEuPxRQ?=
 =?iso-8859-1?Q?GdkQh2zcySg5cIh0d/aosIJLsAPhMLti6koWqNTlOOaEAMVvVzF+NtEPJl?=
 =?iso-8859-1?Q?5wxrIpoPO8xOKsac2QgunXIeYUtfQwQYupkpiw7KA4EbAMM/q9hDlEMorm?=
 =?iso-8859-1?Q?ApFkX+oD3MRLKkRk6Y/IE9TIJ3/UkKBHuGayQXCFClZMeksp2KikYthnLH?=
 =?iso-8859-1?Q?9ED7AEPz8lCaVzOsa4yzQOvfGS5cZHkZ+iD8p9WsNnTdU+QmZA6S1YwtuN?=
 =?iso-8859-1?Q?9vIWbb7/JFvRmvS6yS6xX3bh6uacan3K0GnNdXt6TxL+BL3erX43P1CgQI?=
 =?iso-8859-1?Q?dy1o2E+CL42Cxn8iISAYunwCa1HzmUafwppPDXWh8+DUw1+N9HVg2IhPGm?=
 =?iso-8859-1?Q?mEOVd27MSl4+1ppzh2LSEbbmYyKqXaypAbeKwGNH7fUACJu9k+RXydNbe3?=
 =?iso-8859-1?Q?PA83hk/htCUjofOzIn/u3mSbgumIp3qmRzyGHEfXdGf3wtQ62Q39Cf4UOF?=
 =?iso-8859-1?Q?wEZttwO/Dkp1rIQSIEztSCLCdVmyFDRT/nGD3NGyqMPSGaWqupDCa6g7vS?=
 =?iso-8859-1?Q?Ded+k2WCME5BVh8ePtFGJBvw3YmwuPmrbeLURSVgxkdFlYlb6+w+zQTqC0?=
 =?iso-8859-1?Q?o8T6r1j+BtdLGmjeq997zrN0pg1tVDRISLPAdHckBWEspNYldGu/k5T7US?=
 =?iso-8859-1?Q?OI5sq5w0KxfOeMH0QSmWWG8BLSz8EnDLcNwKimHJsgde7ZSfJIxLzSqDCq?=
 =?iso-8859-1?Q?fk24eA2jVPxOVEzrCTaIWAVVBLdfrF32syOMw2TLdxwaQJv+frQ/yHyCJQ?=
 =?iso-8859-1?Q?du/XaFx1XIy3dNFSh3RQbFhb3vaM7N1s0GCyxAoHk+3BCcJ++IRtrI9x2t?=
 =?iso-8859-1?Q?Cz4/Bn6/iFu1wh9nqnO724rwgkOM+Lnpun3ZGgebjFwaCN7/Z6JHKJDjQe?=
 =?iso-8859-1?Q?nqG/MvGpA22Ks8owXKYH7kqLdKH5qtaQySKGKFwHW2yjZjknaxmDHUTU87?=
 =?iso-8859-1?Q?MFR07Uicra+selt+I6qbBdnsl4nRp6V471YLZKVGSE22fYRAY4V369xqY5?=
 =?iso-8859-1?Q?YiCnMs0VE8s3NMO3R9BEW14uJL0TzxuE84t6HFIuBjVwhsQnP5Wa6Klqhc?=
 =?iso-8859-1?Q?NaLuDBsi4gMvsOfGkug5gu3+k1uaD/RcjFlLWibCnXxSMxGRyGD0NsKoHd?=
 =?iso-8859-1?Q?z7Dmecvzq242Kmrn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PL49Z/BFqy6M5CXd8xrgWFCEb83zdov2tO8TxcAeDS/TDcHHBDdSHiYSEc?=
 =?iso-8859-1?Q?GNKRS/ypbFOoyS7IelEm3LSbh5H0btNDx0Tc4X7hNDnFciOGfsCK/VBSn7?=
 =?iso-8859-1?Q?iDPmegjXOQGC06Lsh/PymmJ0dQP5c3QaPC5a/BDc3tFDsmwSPjxqukzv40?=
 =?iso-8859-1?Q?bFVIJ/MN9aTYZ+vZsYfAUL4RkEttw6F2k01Y/tOR+pjN53/ZANflL8RUc1?=
 =?iso-8859-1?Q?YGRLeSgDd8rdjs402yqPw6bP3HkFo74ZZhPQ/pMjI7MjlICXn7kBgM4gYX?=
 =?iso-8859-1?Q?kcyvsS8yqmgIIagnA3byeVkO74bc/Pf4NaUbUY1yqjsrbwiKW8rX1czFIV?=
 =?iso-8859-1?Q?O5tU70VE9uTxUMO5GOrNWS3QKABPUairrkb42uoSCS6eBpXT8NP9QV7BAI?=
 =?iso-8859-1?Q?4c5tmgwtHtnVEHaJMIA34/4p5mzTX6eGtuerazuf44KgnJGUC9ru0RV57p?=
 =?iso-8859-1?Q?WQJN3w6GkFcZle6jjm92b8yo22LJ51r9muY1I7dUB+jWcMMJFs91EBQ8FO?=
 =?iso-8859-1?Q?npP9CoDUPr2mIJMWJnzYsyYP7Ezd1pEBrqI7f0znlhk/NiyMIPJMHE4jbO?=
 =?iso-8859-1?Q?xQohcJoKULKGO1ElQAiBFcuz8AdWeYJ2k0mmfScfy7EzGYS0G2zYY873eh?=
 =?iso-8859-1?Q?bgqFcu/Vdgcp1xn6DMFq8b7hK6pyns4TXSFAj+Wce6FTKpmTNfMFKDYfBR?=
 =?iso-8859-1?Q?+oPUJi/74raGKhqiudNJaNKCWYoxNFbjYLMBapf6Q+WZvhqCFhrNFsEidW?=
 =?iso-8859-1?Q?l6bKN+e91V5oLq5nxcMLXteD10b1NzRWMGgrcl80hGZ3Qj8McmRPLzaTsv?=
 =?iso-8859-1?Q?h6QU4bI7LcquI9BTRSTGhuK7upcf0NDeuu+8FiNscIpn13YcNs7VjNN2mp?=
 =?iso-8859-1?Q?e30hWaLDQREn6ygUyOO70aDjeq3hFL5X6esjfgU6bWZPz1f03R56fcdfRZ?=
 =?iso-8859-1?Q?pNprDXl8eA+4Z9ya3SwIye6jFM53g4dUrZ+voHlh/wnqAGbd97Zj8/VWW2?=
 =?iso-8859-1?Q?E9ZkFjCj/AUtIwBwL/kVaXRokY8uH61mpfKMVGCKleAEJSOFMl/xCEpxpw?=
 =?iso-8859-1?Q?BmbTYcuhdNPOO3ZDb4qtXZC1SeLBZcHpZgEz/DLs9Phnx/H4A8ygnPrITH?=
 =?iso-8859-1?Q?D9sgjkeu63mgmuzsi4qgRbExujoVm5X8c8OdbxI9F5Jy00n8JH+UERGP1a?=
 =?iso-8859-1?Q?0TXpOGTU4yu3wQwfx8SA/GAW5Bfs7kQLy3DaZF525qYSporuN65I5+SRoV?=
 =?iso-8859-1?Q?/RzSNTT6vkRC/99qVXMHKedOG/LxQadCUICD967CTQ0GIRubaQVMW9V99P?=
 =?iso-8859-1?Q?N+YBpGQ4RCMqnpbPsR8zaWExXx8x7l+iJ7ROtJcDjlUEWuOaD2BULfVw1o?=
 =?iso-8859-1?Q?djBwngLAg2w33KKO+cfiGoa7QlBRpSHww8ifE6v4SdQP1SjdOv5Tnm7A3s?=
 =?iso-8859-1?Q?OGu2QV4NlO67yuvFt5Dfg6FhVE9Dp7xtGy5UwXWwavojZfJgv93I7IdT6k?=
 =?iso-8859-1?Q?23S1iRBejla9LKiUVjo86zJH7+dOjBRvDBSVHrynNxXvxtyTNvnK5jwtLa?=
 =?iso-8859-1?Q?PfxwFLyZYFlgwhObtOPGf6hmYtQOY51MBKLL50gNi0z4b5hvk7pDb4Dx82?=
 =?iso-8859-1?Q?hJvHROa2o1KK3mQ50swBGKP9wb4Bc05Zzr7I9x2aPyKtdV+10TwrB2SA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e6db0fb-8adc-48d9-85ba-08dde404156f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 18:20:34.8658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ihIkdgh0dCj6kxZEph65wRFk4xsEwJaOlUqFLiTP0RZ+68+V3p/2GsJd6c4ftJzjYu8t6K9sYregfYRNCkcqsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8383
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

On Mon, Aug 25, 2025 at 12:06:44PM -0600, Summers, Stuart wrote:
> On Mon, 2025-08-25 at 17:57 +0000, Stuart Summers wrote:
> > Add a new _fini() routine on the GT TLB invalidation
> > side to handle this worker cleanup on driver teardown.
> > 
> > v2: Move the TLB teardown to the gt fini() routine called during
> >     gt_init rather than in gt_alloc. This way the GT structure stays
> >     alive for while we reset the TLB state.
> > 
> > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c                  |  2 ++
> >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 12 ++++++++++++
> >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  1 +
> >  3 files changed, 15 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index a3397f04abcc..178c4783bbda 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -603,6 +603,8 @@ static void xe_gt_fini(void *arg)
> >         struct xe_gt *gt = arg;
> >         int i;
> >  
> > +       xe_gt_tlb_invalidation_fini(gt);
> > +
> >         for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
> >                 xe_hw_fence_irq_finish(&gt->fence_irq[i]);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > index 75854b963d66..db00c5adead9 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > @@ -188,6 +188,18 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt
> > *gt)
> >         mutex_unlock(&gt->tlb_invalidation.seqno_lock);
> >  }
> >  
> > +/**
> > + *
> > + * xe_gt_tlb_invalidation_fini - Clean up GT TLB invalidation state
> > + *
> > + * Cancel pending fence workers and clean up any additional
> > + * GT TLB invalidation state.
> > + */
> > +void xe_gt_tlb_invalidation_fini(struct xe_gt *gt)
> > +{
> > +       xe_gt_tlb_invalidation_reset(gt);
> 
> I've been seeing an issue on fault injection, running in a tight while

I think fault injection case will be fixed by [1] whenever that merges.

[1] https://patchwork.freedesktop.org/series/152870/

For general safety though, I think calling tlb_invalidation_reset is a
good idea.

> loop, where occasionally we see that a couple of sysfs files weren't
> properly torn down on a prior driver instance, followed by TLB
> invalidation timeouts. Up until today I was only able to reproduce that
> with this series, so I wanted to be sure we weren't causing something
> here, particularly with this _reset() call (one of the reasons I had
> declined to include this in the original series). Today though, even
> without the series, I was able to reproduce that behavior (-EEXIST on
> sysfs create, followed by TLB inval timeout). So I don't think we
> should block this series on that debug.
> 

I agree. The prior CI run LGTM. The failure here [2] should be fixed by
[3] which merged last night.

[2] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v8/shard-lnl-7/igt@xe_exec_compute_mode@many-execqueues-userptr-rebind.html
[3] https://patchwork.freedesktop.org/series/153197/ 

> I see a few things in ci-buglog that could be related, although I don't
> see any results in those to confirm:
> https://gfx-ci.igk.intel.com/cibuglog-ng/issue/7175?query_key=a5707a4d3ae2ebb8c04ef6cea0ef747322df4ee1
> https://gfx-ci.igk.intel.com/cibuglog-ng/issue/10412?query_key=402f2615406c4afa4814a29849b312a0c7b66e9c
> https://gfx-ci.igk.intel.com/cibuglog-ng/issue/15004?query_key=e0ce601ae69ec76bbdf27293dc2919ba07357de3
> 
> Anyway, at least for this series, I think we can ignore that issue.
> 

Again agree. I think if this CI run is clean, go ahead and merge.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Thanks,
> Stuart
> 
> > +}
> > +
> >  static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
> >  {
> >         int seqno_recv = READ_ONCE(gt->tlb_invalidation.seqno_recv);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > index f7f0f2eaf4b5..3e4cff3922d6 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > @@ -16,6 +16,7 @@ struct xe_vm;
> >  struct xe_vma;
> >  
> >  int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt);
> > +void xe_gt_tlb_invalidation_fini(struct xe_gt *gt);
> >  
> >  void xe_gt_tlb_invalidation_reset(struct xe_gt *gt);
> >  int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
> 

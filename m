Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8CEC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 14:17:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873CF10E801;
	Tue, 23 Apr 2024 14:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VDHaD4IM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777AC10E801
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 14:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713881869; x=1745417869;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kEPX5AXVc0WAytweqRmBYFRbE2r0gJmr/QGAYcpzeQ8=;
 b=VDHaD4IMFmHVEfD6yrjXWpG33xj8i2BEHaqqn1gugBiWHPXJR1animgg
 5qThF+VrtM6Lx6mYoKe3wYICHmvOuKQPQLMe2FF2sJN9+SJy3fl7Ba9Lp
 7sYXwerZQBMDxTuWX6hhQ0U65EKSC85Gyqzoa25gRMt69g97rzwUQU+wk
 pKt3+tp11gR8eHXWinl4Yjgpf2VHJ/GV20AV99+6kHMrP5nascLzeuowP
 6zumRbTBVHTh9n/wE92dX9renH4CohMbIabeTwqO4So7u0hs66DuAPd+G
 Yhq3obsYLgXcMQWmGUlIWNbYHSpRZT06MGQxIMJLwL0XCzwiyQMrdV8En w==;
X-CSE-ConnectionGUID: yfVmZz/vSg+WxztW2gXwjA==
X-CSE-MsgGUID: Q5A8cxpFSDiZaTX+6Od6Lg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20867174"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="20867174"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 07:17:47 -0700
X-CSE-ConnectionGUID: axMLs2tTT2iOlig9I09LVg==
X-CSE-MsgGUID: GA3Eo6JPRieLRh4oCfuWJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24358870"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 07:17:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 07:17:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 07:17:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 07:17:46 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 07:17:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYKQ9d4+aabgfRcvyHMar8prNu2COVFbILmOCDbEEq1TS2Gfv/F60gxK7irbKh9stXCwD9R2wjGtwxGbKx3+2nre/hjuTL32T+ZQVQPfte3R3lIV0UWVJpV/jgd9DfmnrUqh3qlbpIlD3c3O4dxYSeEwvEvXVFw5nnedwgkgBmTX2MVLBwYtsF6SJuivse2GObd9f7sRXK6W0KgSNoXfKvpdwnHrqzhiid62NjfAKSArrp7TZCAPcWCaLzL0VPL0jAcuCDfFKNl1PL9XF8U+9yG/6GvhD4fxmNSFJoKtuXm1+FGvBc5e8zg6tzJNwEH84cLlJ0qhIkKxJz6YMEE5cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6sX422yG0vmdYas4qbBfMW48LtvkC64CDn0sTKghkYU=;
 b=e5XZnWLya2qYowwKWGqBwR57fFmNzhGdgL+uHRqGzorZz2iiv7VpvYRUJXRZX67jtL0ePCK8DfH/Hb37pukLH7VRewYs2Di34mtAP7mfdM2LNpgj7k9gGYkAfGgBJMxxgPnMC2eZDz3/W9FSsLGhuyeBepnq9WT4Ib6wT3x2VNsKhdMVMi92hRMjUjebjRdMG/h4h2vmsxVpk6DeCoOiErfjGXWiBjMFfjK6Y+L31FZbi0NipqPW49PobreRIV33eP37zSKg6Lvst9+GqArk1iwcCl4uvAhlWawTRTyyRJlXFcBbnRUcB+vBh6LgD0NYEN0UytglIcnmWHrUP+2KPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8210.namprd11.prod.outlook.com (2603:10b6:610:163::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.30; Tue, 23 Apr
 2024 14:17:43 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.018; Tue, 23 Apr 2024
 14:17:43 +0000
Date: Tue, 23 Apr 2024 10:17:39 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Dong, 
 Zhanjun" <zhanjun.dong@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v6 3/3] drm/xe: Add INSTDONE registers to devcoredump
Message-ID: <ZifDAzOP1J_LY-f4@intel.com>
References: <20240405182326.72157-1-jose.souza@intel.com>
 <20240405182326.72157-3-jose.souza@intel.com>
 <ZicNtTSq3cH6L4PM@intel.com>
 <ca39ac515092e3ef178236ebde834afeb29b6b79.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca39ac515092e3ef178236ebde834afeb29b6b79.camel@intel.com>
X-ClientProxiedBy: BY5PR17CA0019.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB8210:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dffbf63-5faf-4a25-f2a8-08dc63a02443
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?PwpdMvJ6ADiXplpoGCkQNTQVLAo0tAhBRE9seb9WJCSZucUOPDkBXNnGVR?=
 =?iso-8859-1?Q?ldsMKCqD2kMifBH+cd3sz7ZAHWwvVjBSCs49gSkH7Aapx9lgyQP+kt3GUy?=
 =?iso-8859-1?Q?GKGWqxj0HXBfmPs4RkifJMwwQts+IycT8qSL+gxDi6DXR+dyPeVsbFnLIP?=
 =?iso-8859-1?Q?nfhl9amJQI1Z7DXrBtTmi9NyHDLdG1qBrQDGdXqmvraeD/7mq2RZTRp4b/?=
 =?iso-8859-1?Q?oeYeE/xBrXaj9hgtAvivxdXtDvGag5wydxpcCv6/kVNk0M8xgWaC+8wRnG?=
 =?iso-8859-1?Q?gdPbkqaSb9elQ2pEBvPijdN9hV6JOcP5ssOLS2h1bQPruS6SNZhav7H2UW?=
 =?iso-8859-1?Q?DcFHHPYNoZEB6MvUfJp/2EOqszddLWn8i9lcjKY/qYKGSjEvdcI9xzxjS3?=
 =?iso-8859-1?Q?05w9q5W5wT7X78ScmIwmJeO/1D8HOlm0Me7NhSJZiLG/6LfV6B6gdbDwKy?=
 =?iso-8859-1?Q?eXEMhbnMd1wGIAIUy10vJFjas1MKHo64EeLuyT2eBV82Ggf/fLqlhmMTuY?=
 =?iso-8859-1?Q?T84liE2S0AFxJlXDLrot6NPDmy3XEIMLUzLYD5X4NjRT6gYmU9l9V0ATa1?=
 =?iso-8859-1?Q?NTSPNsMZTPLbMzPzx034SH7KsgCZ4H11gAfVIZeqbkJnhrUr+ANV7kUPXk?=
 =?iso-8859-1?Q?e+SK1tDw9O84cAMddI39RP54vZtFTb0KtskopfhTHqmQ1QPFvWGUbESQCq?=
 =?iso-8859-1?Q?vACQZEEYufcypMqKLE3ZdgNioCxLuBUKJ9hVPnghb5G7M7N1Socp5RbYut?=
 =?iso-8859-1?Q?WUkUBdsfEXjU/+Bc+Rxq8d9sz9DPkayK07Jse7eyZt7Zx3Estsn9mAacZD?=
 =?iso-8859-1?Q?QsxHARFYU3hArkzO2FpaRa3t+FqFvxS61SC77sowQFoum2PvjuW/bFwjx5?=
 =?iso-8859-1?Q?1RCTFxGKtPsVDZxTn2132qg40yH4kckn5ZYSIfeTgLT+5P7sRnJGw7HEd8?=
 =?iso-8859-1?Q?JIfg5SCwM8+d2PusyBGL+QVPr3LbbWIRuK59be+WmHfHHfMhyZur8m5g6J?=
 =?iso-8859-1?Q?r+35gX6z+uFozUoHZfitvxcoQa2Ou8KWj+cZxTQxbLDptUi2vSAR/T8Rlj?=
 =?iso-8859-1?Q?/fC2G8vGjFfKqX5OuBMyXzuQO3UCVixOPLf4wiUuhC3E4fcfcrrU1fTcU3?=
 =?iso-8859-1?Q?TK9erKoBvx9AtsPJU8lxyFtOGLwhwCtrvCRrlw75JNQK+1YttJgz9acz3g?=
 =?iso-8859-1?Q?mLWGL/UCLNMir9eaKQKTEBAVdDAQbylPGnD6LxGU+TqH9lisdnADSTHcax?=
 =?iso-8859-1?Q?KzO4IAPzp2Niv6MnH2GWRXzDB1UFoxBJSbUmXKCVTcic3RFmR1t3rewwHp?=
 =?iso-8859-1?Q?TUk5FAs4NUuhbtBfqZWlpMbpaw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1W/8gQ0+LqYi51rjITVMNRoJBfyQoiJQ7iWkSd6+/9s30Q6BNqnCutqY20?=
 =?iso-8859-1?Q?oQLLCdmBCQ8BHAI9TXufg9I8f9tnwUQ4YST4C9iNBfxyQnuXHTihWbF7bo?=
 =?iso-8859-1?Q?vM1NTr5GHgsmCo4n+5SOZPqqEl5EyJD+QBxCHgT4q0KpcabCMTH618aGyf?=
 =?iso-8859-1?Q?fclZJpNklWe22LLe0RVHUXDVZ7EqR3CPbxGIPpsJg50VTEW4IzrpM0GX0A?=
 =?iso-8859-1?Q?tWClv5NL7vRsXOSEP6tMMBTcxVPGoSUX0Au8yZkmzWFJpghxIftSGMfE9q?=
 =?iso-8859-1?Q?M9PLd8YkjEL2b461n6FYT8ahUm+h8oMuLhFL04Bh3dQKBV2CviGmmRyHg6?=
 =?iso-8859-1?Q?7PwpuWbsmw4vuw/kFjTrdbppq3Zk0HfM6LidRDmefO/OHo8/7lmHM9arBn?=
 =?iso-8859-1?Q?U2mmWtZY8vpAsx6PPN2eEQl3cKgYujFE9KCwXBq5E/MfNrp+eHaD8H3AIp?=
 =?iso-8859-1?Q?dZWW9mi3RAqGorQLqEipamdH0fi/DrcpN5/jHcbVgCyv1C89CkpYgGT4ON?=
 =?iso-8859-1?Q?D3jqI4lgGDwYgjO2wi5bq9oAz5MRgFofBXeOlt+8M5JlggcxHrCPNK4kQw?=
 =?iso-8859-1?Q?jcooopkOD+XnB9njQgnSuMphsZXRm1wd+VyNZyVxWmt5PWSnKeZJA9W6Xo?=
 =?iso-8859-1?Q?Q7w/nQ/P4ZDBIH2qw9v6d8wz738mnhmbEsy6kMRu52EF5MnArtoVCfveEI?=
 =?iso-8859-1?Q?/wNqojx8ou1MpkXdgsYlgSRSN3CMtURMqkH3H/wT/Lyb7Ts2px/zkCQWT9?=
 =?iso-8859-1?Q?3xh8oXYv5u8+QTDf9gfkXzlzSKCKbZ9xsyaLOFZ+Rp2yTqX/CiaPYm9+T7?=
 =?iso-8859-1?Q?bZte/1EyL1Huyyx+ZK/iNvOTlW6XI5nXhx0O3ku7O6z/y8gzbKItmP2Ael?=
 =?iso-8859-1?Q?oMFVtloDIgn2HpHv3MUZnKqevZhb/MMubPvT+rg2qAQzPJgF+NXtVERavS?=
 =?iso-8859-1?Q?/FVkan+2UgxUnDzCEJ7EgLryJmx6JaNKECsWGYrrGeM/mDTxHQHTNLc4mR?=
 =?iso-8859-1?Q?qjwohwU+Df+XPr83fXW2WbfrX+Ll8EAla0+zpZj4LKRHwxXphyJAcaNT1N?=
 =?iso-8859-1?Q?HyP6MKOLR16yQcPz628fKRbQSi3dxHeQvnGWmMPaOoWf0ryHK48HMxLZpH?=
 =?iso-8859-1?Q?NpSRJgUzbHtgIC9zjZXK0c3Okk3AjkkSNVVPH41JXQ2GmshHLgnho3A2MO?=
 =?iso-8859-1?Q?3stOk0G0c29XF8FE/ijFdwn+4Ho8qCnSgce+lwVEdVnkJN/8chW7o3+YtE?=
 =?iso-8859-1?Q?zVXeT52AV6UJQ2mDYrzK+5grJK1Fh3hBlMxI+IJgP9RGHViQPtrq4tJ8sr?=
 =?iso-8859-1?Q?eUBA9hywFoQ1tns+IJRdvz9fXjCgwHZR9Uw8pSTpESt/d4HpTg3NEIYr48?=
 =?iso-8859-1?Q?wBFpfG439xCciwvC2vAwcFwEpsBcYhDEnEMJ37O2KpnyukPtLY1nlFUFh3?=
 =?iso-8859-1?Q?bXj8dUQmPYQsDV/bhmKP14KMrj2Ehy2g/azX1bMW3kVEeM1qPkW39gV1iv?=
 =?iso-8859-1?Q?6Mk7pgq61mDDlFfu+e5BcNtIJdrNarBkGXtEBhdmZcnCTF94QRF2nexkDt?=
 =?iso-8859-1?Q?iVSKi4P9/705Aub6WaK2KuZZoqvuLHbIK2UW+KjxetJk+H5AY7m0EB2OKY?=
 =?iso-8859-1?Q?fBiemrAP4SJPnbA05jOVmFXG2rhvjH2xct?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dffbf63-5faf-4a25-f2a8-08dc63a02443
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 14:17:43.7361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 12G98WCjg0UVfe1VVhsfPfLbmXHcignHih+k37NpeRoH8+6YcMa3UbQyq1UVx2bbMl3QJE138N4y7MjHkH/+hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8210
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

On Tue, Apr 23, 2024 at 10:13:19AM -0400, Souza, Jose wrote:
> On Mon, 2024-04-22 at 21:24 -0400, Rodrigo Vivi wrote:
> > On Fri, Apr 05, 2024 at 11:23:26AM -0700, José Roberto de Souza wrote:
> > > This registers contains important information that can help with debug
> > > of GPU hangs.
> > > 
> > > While at it also fixing the double line jump at the end of engine
> > > registers for CCS engines.
> > > 
> > > v2:
> > > - print other INSTDONE registers
> > > 
> > > v3:
> > > - add for_each_geometry/compute_dss()
> > > 
> > > v4:
> > > - print one slice_common_instdone per glice in DG2+
> > > 
> > > v5:
> > > - rename registers prefix from DG2 to XEHPG (Zhanjun)
> > > 
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > Cc: Zhanjun Dong <zhanjun.dong@intel.com>
> > > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/regs/xe_engine_regs.h |   1 +
> > >  drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  13 +++
> > >  drivers/gpu/drm/xe/xe_hw_engine.c        | 128 +++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_hw_engine_types.h  |  16 +++
> > >  4 files changed, 158 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > index a08528d9c76b2..98d830013e96b 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > @@ -65,6 +65,7 @@
> > >  #define RING_ACTHD_UDW(base)			XE_REG((base) + 0x5c)
> > >  #define RING_DMA_FADD_UDW(base)			XE_REG((base) + 0x60)
> > >  #define RING_IPEHR(base)			XE_REG((base) + 0x68)
> > > +#define RING_INSTDONE(base)			XE_REG((base) + 0x6c)
> > >  #define RING_ACTHD(base)			XE_REG((base) + 0x74)
> > >  #define RING_DMA_FADD(base)			XE_REG((base) + 0x78)
> > >  #define RING_HWS_PGA(base)			XE_REG((base) + 0x80)
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > index 6617c86a096b6..04f9077bacc57 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > @@ -94,6 +94,8 @@
> > >  #define   FF_MODE2_TDS_TIMER_MASK		REG_GENMASK(23, 16)
> > >  #define   FF_MODE2_TDS_TIMER_128		REG_FIELD_PREP(FF_MODE2_TDS_TIMER_MASK, 4)
> > >  
> > > +#define XEHPG_INSTDONE_GEOM_SVGUNIT		XE_REG_MCR(0x666c)
> > > +
> > >  #define CACHE_MODE_1				XE_REG(0x7004, XE_REG_OPTION_MASKED)
> > >  #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
> > >  
> > > @@ -111,6 +113,14 @@
> > >  #define   FLSH_IGNORES_PSD			REG_BIT(10)
> > >  #define   FD_END_COLLECT			REG_BIT(5)
> > >  
> > > +#define SC_INSTDONE				XE_REG(0x7100)
> > > +#define SC_INSTDONE_EXTRA			XE_REG(0x7104)
> > > +#define SC_INSTDONE_EXTRA2			XE_REG(0x7108)
> > > +
> > > +#define XEHPG_SC_INSTDONE			XE_REG_MCR(0x7100)
> > > +#define XEHPG_SC_INSTDONE_EXTRA			XE_REG_MCR(0x7104)
> > 
> > I believe you have an alignment problem here    ^
> 
> odd, I check it and looks good in editor also dim checkpatch is not complaining here.

probably something with my editor/view here...

> 
> > 
> > > +#define XEHPG_SC_INSTDONE_EXTRA2		XE_REG_MCR(0x7108)
> > > +
> > >  #define COMMON_SLICE_CHICKEN4			XE_REG(0x7300, XE_REG_OPTION_MASKED)
> > >  #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
> > >  
> > > @@ -327,6 +337,9 @@
> > >  #define HALF_SLICE_CHICKEN5			XE_REG_MCR(0xe188, XE_REG_OPTION_MASKED)
> > >  #define   DISABLE_SAMPLE_G_PERFORMANCE		REG_BIT(0)
> > >  
> > > +#define SAMPLER_INSTDONE			XE_REG_MCR(0xe160)
> > > +#define ROW_INSTDONE				XE_REG_MCR(0xe164)
> > > +
> > >  #define SAMPLER_MODE				XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
> > >  #define   ENABLE_SMALLPL			REG_BIT(15)
> > >  #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > index 669753f0a9c50..1864eeedf95fd 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > @@ -18,6 +18,7 @@
> > >  #include "xe_gt.h"
> > >  #include "xe_gt_ccs_mode.h"
> > >  #include "xe_gt_printk.h"
> > > +#include "xe_gt_mcr.h"
> > >  #include "xe_gt_topology.h"
> > >  #include "xe_hw_fence.h"
> > >  #include "xe_irq.h"
> > > @@ -770,6 +771,57 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
> > >  		xe_hw_fence_irq_run(hwe->fence_irq);
> > >  }
> > >  
> > > +static bool
> > > +is_slice_common_per_gslice(struct xe_device *xe)
> > > +{
> > > +	return GRAPHICS_VERx100(xe) >= 1255;
> > > +}
> > > +
> > > +static void
> > > +xe_he_engine_snapshot_instdone_capture(struct xe_hw_engine *hwe,
> > > +				       struct xe_hw_engine_snapshot *snapshot)
> > > +{
> > > +	struct xe_gt *gt = hwe->gt;
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > +	unsigned int dss;
> > > +	u16 group, instance;
> > > +
> > > +	snapshot->reg.instdone.ring = hw_engine_mmio_read32(hwe, RING_INSTDONE(0));
> > > +
> > > +	if (snapshot->hwe->class != XE_ENGINE_CLASS_RENDER)
> > > +		return;
> > > +
> > > +	if (is_slice_common_per_gslice(xe) == false) {
> > 
> > do you really need this if? I don't see equivalence in i915.
> 
> i915 is missing it for DG2+.
> Bspec: 66534, range: 0x7000 to 0x7FFF. all registers in this range has steering.

oh, I see, thanks

> 
> > 
> > > +		snapshot->reg.instdone.slice_common[0] =
> > > +			xe_mmio_read32(gt, SC_INSTDONE);
> > > +		snapshot->reg.instdone.slice_common_extra[0] =
> > > +			xe_mmio_read32(gt, SC_INSTDONE_EXTRA);
> > > +		snapshot->reg.instdone.slice_common_extra2[0] =
> > > +			xe_mmio_read32(gt, SC_INSTDONE_EXTRA2);
> > 
> > do you really need to allocate the MAX array only for these?
> > perhaps unify them in one array like i915?
> 
> I guess i915 is not doing the same because it is not doing one read of each register for each dss in DG2+.
> But yeah for gen12 we could allocate just one entry for slice_common, slice_common_extra and slice_common_extra2 but I'm allocating
> XE_MAX_DSS_FUSE_BITS just to avoid more complexity in  the allocation block... I can change if you think it is worthy.

hmm... probably not worthy indeed. Let's move with this

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> > 
> > > +	} else {
> > > +		for_each_geometry_dss(dss, gt, group, instance) {
> > > +			snapshot->reg.instdone.slice_common[dss] =
> > > +				xe_gt_mcr_unicast_read(gt, XEHPG_SC_INSTDONE, group, instance);
> > > +			snapshot->reg.instdone.slice_common_extra[dss] =
> > > +				xe_gt_mcr_unicast_read(gt, XEHPG_SC_INSTDONE_EXTRA, group, instance);
> > > +			snapshot->reg.instdone.slice_common_extra2[dss] =
> > > +				xe_gt_mcr_unicast_read(gt, XEHPG_SC_INSTDONE_EXTRA2, group, instance);
> > > +		}
> > > +	}
> > > +
> > > +	for_each_geometry_dss(dss, gt, group, instance) {
> > > +		snapshot->reg.instdone.sampler[dss] =
> > > +			xe_gt_mcr_unicast_read(gt, SAMPLER_INSTDONE, group, instance);
> > > +		snapshot->reg.instdone.row[dss] =
> > > +			xe_gt_mcr_unicast_read(gt, ROW_INSTDONE, group, instance);
> > > +
> > > +		if (GRAPHICS_VERx100(xe) >= 1255)
> > > +			snapshot->reg.instdone.geom_svg[dss] =
> > > +				xe_gt_mcr_unicast_read(gt, XEHPG_INSTDONE_GEOM_SVGUNIT,
> > > +						       group, instance);
> > > +	}
> > > +}
> > > +
> > >  /**
> > >   * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
> > >   * @hwe: Xe HW Engine.
> > > @@ -784,6 +836,7 @@ struct xe_hw_engine_snapshot *
> > >  xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
> > >  {
> > >  	struct xe_hw_engine_snapshot *snapshot;
> > > +	size_t len;
> > >  	u64 val;
> > >  
> > >  	if (!xe_hw_engine_is_valid(hwe))
> > > @@ -794,6 +847,28 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
> > >  	if (!snapshot)
> > >  		return NULL;
> > >  
> > > +	/* Because XE_MAX_DSS_FUSE_BITS is defined in xe_gt_types.h and it
> > > +	 * includes xe_hw_engine_types.h the length of this 3 registers can't be
> > > +	 * set in struct xe_hw_engine_snapshot, so here doing additional
> > > +	 * allocations.
> > > +	 */
> > > +	len = (XE_MAX_DSS_FUSE_BITS * sizeof(u32));
> > > +	snapshot->reg.instdone.slice_common = kzalloc(len, GFP_ATOMIC);
> > > +	snapshot->reg.instdone.slice_common_extra = kzalloc(len, GFP_ATOMIC);
> > > +	snapshot->reg.instdone.slice_common_extra2 = kzalloc(len, GFP_ATOMIC);
> > > +	snapshot->reg.instdone.sampler = kzalloc(len, GFP_ATOMIC);
> > > +	snapshot->reg.instdone.row = kzalloc(len, GFP_ATOMIC);
> > > +	snapshot->reg.instdone.geom_svg = kzalloc(len, GFP_ATOMIC);
> > > +	if (!snapshot->reg.instdone.slice_common ||
> > > +	    !snapshot->reg.instdone.slice_common_extra ||
> > > +	    !snapshot->reg.instdone.slice_common_extra2 ||
> > > +	    !snapshot->reg.instdone.sampler ||
> > > +	    !snapshot->reg.instdone.row ||
> > > +	    !snapshot->reg.instdone.geom_svg) {
> > > +		xe_hw_engine_snapshot_free(snapshot);
> > > +		return NULL;
> > > +	}
> > > +
> > >  	snapshot->name = kstrdup(hwe->name, GFP_ATOMIC);
> > >  	snapshot->hwe = hwe;
> > >  	snapshot->logical_instance = hwe->logical_instance;
> > > @@ -845,6 +920,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
> > >  	snapshot->reg.ring_emr = hw_engine_mmio_read32(hwe, RING_EMR(0));
> > >  	snapshot->reg.ring_eir = hw_engine_mmio_read32(hwe, RING_EIR(0));
> > >  	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
> > > +	xe_he_engine_snapshot_instdone_capture(hwe, snapshot);
> > >  
> > >  	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
> > >  		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
> > > @@ -852,6 +928,49 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
> > >  	return snapshot;
> > >  }
> > >  
> > > +static void
> > > +xe_hw_engine_snapshot_instdone_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p)
> > > +{
> > > +	struct xe_gt *gt = snapshot->hwe->gt;
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > +	u16 group, instance;
> > > +	unsigned int dss;
> > > +
> > > +	drm_printf(p, "\tRING_INSTDONE: 0x%08x\n", snapshot->reg.instdone.ring);
> > > +
> > > +	if (snapshot->hwe->class != XE_ENGINE_CLASS_RENDER)
> > > +		return;
> > > +
> > > +	if (is_slice_common_per_gslice(xe) == false) {
> > > +		drm_printf(p, "\tSC_INSTDONE[0]: 0x%08x\n",
> > > +			   snapshot->reg.instdone.slice_common[0]);
> > > +		drm_printf(p, "\tSC_INSTDONE_EXTRA[0]: 0x%08x\n",
> > > +			   snapshot->reg.instdone.slice_common_extra[0]);
> > > +		drm_printf(p, "\tSC_INSTDONE_EXTRA2[0]: 0x%08x\n",
> > > +			   snapshot->reg.instdone.slice_common_extra2[0]);
> > > +	} else {
> > > +		for_each_geometry_dss(dss, gt, group, instance) {
> > > +			drm_printf(p, "\tSC_INSTDONE[%u]: 0x%08x\n", dss,
> > > +				   snapshot->reg.instdone.slice_common[dss]);
> > > +			drm_printf(p, "\tSC_INSTDONE_EXTRA[%u]: 0x%08x\n", dss,
> > > +				   snapshot->reg.instdone.slice_common_extra[dss]);
> > > +			drm_printf(p, "\tSC_INSTDONE_EXTRA2[%u]: 0x%08x\n", dss,
> > > +				   snapshot->reg.instdone.slice_common_extra2[dss]);
> > > +		}
> > > +	}
> > > +
> > > +	for_each_geometry_dss(dss, gt, group, instance) {
> > > +		drm_printf(p, "\tSAMPLER_INSTDONE[%u]: 0x%08x\n", dss,
> > > +			   snapshot->reg.instdone.sampler[dss]);
> > > +		drm_printf(p, "\tROW_INSTDONE[%u]: 0x%08x\n", dss,
> > > +			   snapshot->reg.instdone.row[dss]);
> > > +
> > > +		if (GRAPHICS_VERx100(xe) >= 1255)
> > > +			drm_printf(p, "\tINSTDONE_GEOM_SVGUNIT[%u]: 0x%08x\n",
> > > +				   dss, snapshot->reg.instdone.geom_svg[dss]);
> > > +	}
> > > +}
> > > +
> > >  /**
> > >   * xe_hw_engine_snapshot_print - Print out a given Xe HW Engine snapshot.
> > >   * @snapshot: Xe HW Engine snapshot object.
> > > @@ -891,9 +1010,12 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
> > >  	drm_printf(p, "\tBBADDR: 0x%016llx\n", snapshot->reg.ring_bbaddr);
> > >  	drm_printf(p, "\tDMA_FADDR: 0x%016llx\n", snapshot->reg.ring_dma_fadd);
> > >  	drm_printf(p, "\tIPEHR: 0x%08x\n", snapshot->reg.ipehr);
> > > +	xe_hw_engine_snapshot_instdone_print(snapshot, p);
> > > +
> > >  	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
> > >  		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
> > >  			   snapshot->reg.rcu_mode);
> > > +	drm_puts(p, "\n");
> > >  }
> > >  
> > >  /**
> > > @@ -908,6 +1030,12 @@ void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot)
> > >  	if (!snapshot)
> > >  		return;
> > >  
> > > +	kfree(snapshot->reg.instdone.slice_common);
> > > +	kfree(snapshot->reg.instdone.slice_common_extra);
> > > +	kfree(snapshot->reg.instdone.slice_common_extra2);
> > > +	kfree(snapshot->reg.instdone.sampler);
> > > +	kfree(snapshot->reg.instdone.row);
> > > +	kfree(snapshot->reg.instdone.geom_svg);
> > >  	kfree(snapshot->name);
> > >  	kfree(snapshot);
> > >  }
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > > index 27deaa31efd31..9f9755e31b9fe 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > > @@ -211,6 +211,22 @@ struct xe_hw_engine_snapshot {
> > >  		u32 ipehr;
> > >  		/** @reg.rcu_mode: RCU_MODE */
> > >  		u32 rcu_mode;
> > > +		struct {
> > > +			/** @reg.instdone.ring: RING_INSTDONE */
> > > +			u32 ring;
> > > +			/** @reg.instdone.slice_common: SC_INSTDONE */
> > > +			u32 *slice_common;
> > > +			/** @reg.instdone.slice_common_extra: SC_INSTDONE_EXTRA */
> > > +			u32 *slice_common_extra;
> > > +			/** @reg.instdone.slice_common_extra2: SC_INSTDONE_EXTRA2 */
> > > +			u32 *slice_common_extra2;
> > > +			/** @reg.instdone.sampler: SAMPLER_INSTDONE */
> > > +			u32 *sampler;
> > > +			/** @reg.instdone.row: ROW_INSTDONE */
> > > +			u32 *row;
> > > +			/** @reg.instdone.geom_svg: INSTDONE_GEOM_SVGUNIT */
> > > +			u32 *geom_svg;
> > > +		} instdone;
> > >  	} reg;
> > >  };
> > >  
> > > -- 
> > > 2.44.0
> > > 
> 

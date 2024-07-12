Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6133C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 23:15:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674AB10EDBE;
	Fri, 12 Jul 2024 23:15:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K9bULa17";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0F410EDBE
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 23:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720826143; x=1752362143;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8c3FGxBzJQYvTHwnt/9Kx6iqvdnBz8HcUKWFiP+PB9A=;
 b=K9bULa17zTj5vMaxHBwXooyiDmJLPstgBb1kPVJeqSfHt48yR27xlebI
 hGTOsRJ7hjFnG1FZhutV2EzHPLWBFbE5Y2TP5pPB4Y6Ob51exaSaGMtHz
 eFgg6mHQqvG3PmgQyyLjiSSKKWVgTiUT+UroQGSJoXtOR220EHwgEjsSE
 tQrpztSYdIvhS8KHrxXx0tLurM43QUX4BMwMWRKU3t8m4mZ743lSSs9s7
 BlOIt+Bj46+1ztadVI0inl/l4iGrSHypCB7wKcn/QFGha+d6ye7pMtHnP
 NgzTTXpvzFjQXtYR/LKm8zfXUjrhQT2OMPPyT5ezW6HKctY+WqcVcIosA Q==;
X-CSE-ConnectionGUID: xvqdmcjVTC+dkkZd/0HrjQ==
X-CSE-MsgGUID: 16RHQfUBR1OCWL7VSFcrxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="28879574"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="28879574"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 16:15:43 -0700
X-CSE-ConnectionGUID: syxxvWhZSU2eYSWpTfH55w==
X-CSE-MsgGUID: eF56fFKoQfaXdyWg93Nt2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="49709459"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jul 2024 16:15:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 16:15:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 12 Jul 2024 16:15:41 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 12 Jul 2024 16:15:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FMRENmW6Wu3BzaNdWxUYZBB9iLRtxTbq6M2/Sq4KeQ0W+1uanHICqlCW+sDbsfx7sHM23KaXryDx5YGH49vDJsQSY/lHPZRZF03r1PbkFJJ58PEdeJRnHgI2yv5DtmCe0LpPJhSEp5h3f1JdTOfI+ig5Rptbg0zAH7ZsFVO2utqgzoUPyIeVhqVx5sNVs2FnsY/DEaw9F16U9hMJSw9I2n9t4M1T+R6A7S9Q+J6R7j82ZPmxZckjg6rk8oRJlOtk1k9cIc8qu5LKVgv7RgmwRO1X6rMNcrfLNuvM8Wv5qSA0ZesokrP18XN0zi6m9xQqemCaHN+mSPLNdIjP7GMSsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bnb7bTCeGn5owq33n5EboFkotjcr5gzx9+FI6W3vnSs=;
 b=zVg3/hLzKugf4r6+qJ3CLAzVtDEPNejNp8FFW0I2FR235VSunUUXMpHX/553lMiDcoKO7j/0Ax1/EQD3XkdigvGXT/mgWXf01LbFFkJ8DlLNaUY1cOHMbkxS0OZ/vrEsY4MbIcxVb0MV+VSwH+hamcMCw7r+ZD9QYMw3QH2MEo4XDcry8o0RMBrLKa+KlEIl4Db1mZaYaN18Fzwdr6uvSqQDQ+m4FaSCiJ/6+ZNpytIbPv5Kh0PY3K56LiUH9W4Ppb28x05hSJQQEk8P5iHSxkTxui9a4eV0VqfOHWjMA2aTAw3nbGm2OLZ/vnclM4ZfvY4BE2FkCmZ9D5nxTV6Ing==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7732.namprd11.prod.outlook.com (2603:10b6:930:71::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Fri, 12 Jul
 2024 23:15:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7762.024; Fri, 12 Jul 2024
 23:15:37 +0000
Date: Fri, 12 Jul 2024 23:14:46 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC 03/14] drm/xe/pxp: Allocate PXP execution resources
Message-ID: <ZpG45uRIhhoEaw5n@DUT025-TGLU.fm.intel.com>
References: <20240712212901.2684239-1-daniele.ceraolospurio@intel.com>
 <20240712212901.2684239-4-daniele.ceraolospurio@intel.com>
 <ZpGxh5xGsijGwn3f@DUT025-TGLU.fm.intel.com>
 <3c263f0e-7308-424b-9533-609cf778b724@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3c263f0e-7308-424b-9533-609cf778b724@intel.com>
X-ClientProxiedBy: BY5PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7732:EE_
X-MS-Office365-Filtering-Correlation-Id: 174b7786-3e48-4e14-a225-08dca2c889f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?jFGUxmfpfEfg3d0Oz9h0vELAF55Lcr1/BgNJex8xcSN0B79EdpXCk1Ts/4?=
 =?iso-8859-1?Q?HgSLyhpge43pWy+KHMHnU6tb9RCOSbNHZyQ/ucHXeRNW+o+n515kSSqUHW?=
 =?iso-8859-1?Q?2Q1Q0ElNj4+9hu2NcsVEcB0PYBxQvLEkR3FLJRZQtQtUSvjf0OACGa/5ii?=
 =?iso-8859-1?Q?Kvj8F2MvX5LDaA60HdqIdU7RrFCLoQMJX/9crDV3272B7SLRpsBP320nvS?=
 =?iso-8859-1?Q?OcHtP8w8YfqrDh20X1jpaw/BEm3FGubjlk5mXP1V55ZWuxoBhrcDH4yUW+?=
 =?iso-8859-1?Q?IJ2NqRKVz1xOkxIviGmPeMcT6kJi6iRUpSwWY3ATTlMWiqzmY1tWKuSuDv?=
 =?iso-8859-1?Q?/Yd4xUF/OIxKOiPJs73Hzbrj0A2qqMrE5AVWbYC/ZlPDJAXbjnUCSoil8y?=
 =?iso-8859-1?Q?bnZRqzd+eBYC49BXWzsqa2vb97+cpylZieuJmZ2rJlzHauNfj31hUgGdTj?=
 =?iso-8859-1?Q?uLUiJdwpjSbhpz13/uZpuaH4vzyxfBXt/Tgat8n29n/1O8lSwZQveMk6lK?=
 =?iso-8859-1?Q?cRszUNI9ovwLMz8QGJ++THXHNN2UiW0aIvW9gg82MhbFShWLm1CthxCE/f?=
 =?iso-8859-1?Q?SfLDsynxwegOFt31mN4nA9h9CJNQ3ySal1YJNgmI2TlubPrZc8B169YEpm?=
 =?iso-8859-1?Q?mEdgV7j9rGJsKesbT8L8I9B0jwfvunwzLd7Qr80ICoD1KlNa6xOx+f+7tt?=
 =?iso-8859-1?Q?jY3A1oVocKM50mG1OnnTMqwvBb9mrUvyEr5+szxM1ZR320L8IDMu9/KrEZ?=
 =?iso-8859-1?Q?NSfudPBlW7rcDsJhyN6vcZD/stAVeHEvhph0sa0Kb2+iMTetFo/xfMQ6W0?=
 =?iso-8859-1?Q?lXlnB+MBB3AUWZclJmAZzH+PrZUs3nQjSQVQLgeniPwCW/qt8SKbM6h31a?=
 =?iso-8859-1?Q?5OKYdaCHydSNnScLNAraahLja7BDtnilMxH5HF9orGQMvYiao9lIc3xusO?=
 =?iso-8859-1?Q?AA5hs/AO4EiRtzU138kDvYnbSURyUZrMrf6rW1hRDKBPenH3+LiRdoHUbe?=
 =?iso-8859-1?Q?QJiFK9hVWa2Ucv4RxHnkvtJJ34ykAASMNsmk29JdpKVdtqDRLb+d09tDd/?=
 =?iso-8859-1?Q?UDxAQv4YiUV2/EWQugXCjfWKRW7OBJcl8Br3bJrEib+X0L//ni6DBBSgJc?=
 =?iso-8859-1?Q?k7MvIKVKrXaMX5+FNO6aJiepSk87wxf7ED/6t0OZZ84zeTPwoedhRgKGsc?=
 =?iso-8859-1?Q?S/zdHPySqu+fg4xM1GWKgkIOwIseooVdTiW0baW8DzTJ+5EzYt9jnuoDUx?=
 =?iso-8859-1?Q?tqsbg9BoVw+vC4Anh3M6Dmaj16H5tdOd7rvfzbw0IZA+EsGKbutIF+Kdf1?=
 =?iso-8859-1?Q?3hoIiOiye/6p9sb+Z07BFndHRU3JgFMXwlUsl0A5WmxXtes=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?LedZXjH1bF7g/RdISgmQCGqRhLUosQlwTF+45dtvfCv+ksusuXpophm5G5?=
 =?iso-8859-1?Q?KhGId9XOsb3/KprHNQtpYNgQhZYZ+UFsF4BKCYCbuYodh5Lhu/kNbmZpwd?=
 =?iso-8859-1?Q?hmPub8Iyp8kacAddPf3O1K3MUeU6ouR1Lf5FlNftEqSZvUZtzxTXjy8MbN?=
 =?iso-8859-1?Q?Yyk7lTpW2+PbNs26jGXo7YpTBmKTTmouWIpTAK80eJ/PehtDDSrY7f5Ao9?=
 =?iso-8859-1?Q?ZHpCRt06TkGZPr7OgBmZRi7glJxLIdVLQs67YBe7rpijmEW3Uz0qipsweU?=
 =?iso-8859-1?Q?ck8WSsziOGfUvP0KRfvuxppHI9MQWWKb/NqbQCNorXvCfeRPjjHVHnVYTB?=
 =?iso-8859-1?Q?J7nbWak0O3XcMHmoF2Etygi3juhn6KVNPUymWPoTHWHuGiJHQ8vEThISJx?=
 =?iso-8859-1?Q?4aRP41PGCuRR8R+2Z0PMbL4l4TbepfKTOaD+E+LAmR6H1dB087GF7vk8Bo?=
 =?iso-8859-1?Q?Wu9dT65b27y9Z/xIx/BhnP3aD37ReDFN4pXTMKKkY6wWWhRIBYL4OFIg9U?=
 =?iso-8859-1?Q?4ze5PYa2u1D60eaGZfXO5wkD196R5Cz/DTXQMR97zFjF+NllRJL6L5nu0P?=
 =?iso-8859-1?Q?DQ3HtcsV0PB11ueq3poLw4yedjoG+IvAUf6d1ih4Zq7UOqbWO3js/tTvtr?=
 =?iso-8859-1?Q?VE3/TCe64N5XQmsXXwhLuJKW0FjmBE3SEF1fFASvNFjnXA3MuaPpvhh0MU?=
 =?iso-8859-1?Q?TtS45mETQgx3JExFWhHczkStwyFbTcZ5abOLEF56jgH0fM/YUqFfbCSF5U?=
 =?iso-8859-1?Q?H6YxPUVnBQ/3lBLCn5tvpi+78hiiXn/3wlF3gK6IwkMVq1k1Zr2j7t1syy?=
 =?iso-8859-1?Q?8dntM8kEq8H9ytmgK52NI4nyr4Nihp1xCyNntJOChe2XIse87l+epLdA/2?=
 =?iso-8859-1?Q?j/mNqNitRXZFR7XcIZJ2EQkTgdoj/D0Up4J8t2jKJBoItdcuZyw2RgFjov?=
 =?iso-8859-1?Q?8f7GDrc7ImudIU7ifFEa/x5Mk5VOvWQIN8sDheuWFsy3qQnpogbfdI0t5Q?=
 =?iso-8859-1?Q?RMNFXgFY75HKLEtupAfEp6RpQNo9ixKv3HdmpT8WLpWaE3iGi9yzaqBAVr?=
 =?iso-8859-1?Q?aeKrX6lRc3xabp14AZflWKJqQx8x2EthCOOfYyndYsTmtrVnNOvmW3HovW?=
 =?iso-8859-1?Q?4fpWlrmwIc5drwhlAPV9Q26uTtENaKRSY+RNyKgD85/M8EQ4ko8jgq8HC4?=
 =?iso-8859-1?Q?YoLNGgU/mt3gg2JvDko7Xa1bCtKg1gcJWN0iXqctTXIsTRFhgkXso0Rx25?=
 =?iso-8859-1?Q?RHxwtWoAG39aMl4f9vbOEk0FoXJtlGmejkRvElsiAWxNl4r+KTSIjteAkk?=
 =?iso-8859-1?Q?I8w6PrkjpsJweqQ83Ik08ydPB+W/S2N+KtrL9iWCdqsYtV17PXg+8cenEK?=
 =?iso-8859-1?Q?5eReHReS2u8UPRzyvx8dsaQlfV7W79m+7jo/2Tdaoj0TapXF6WzMlQtyrR?=
 =?iso-8859-1?Q?y8oj6z9HqevCUq9Sp/FzZEc3tmxVYzTLXRKvNezD5kDHwRa5xeRTJt+K6V?=
 =?iso-8859-1?Q?o7+cM1QXHf8vxA+jncEau0bBqdc7fhuWZabNruPOiiJOt/Jx0UKLcFNu/g?=
 =?iso-8859-1?Q?EHTa/bsWBK8AhwKv58iXxCq/iYvwBGt0hBeZyM2eT+4U3lO/+ic8dtDFn7?=
 =?iso-8859-1?Q?gc/qt9A2YXUUa/YP/MF68d2S2bFmAUEH3x7znEi9TlkRt2Imkb8wTzSw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 174b7786-3e48-4e14-a225-08dca2c889f7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 23:15:37.2866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fO4Fk5sYe3x05X6JWVVnlrgeUfOn5nFdmppaV7PFgoT+2t0c7zCBC0EL2V/pCu07XUaPj4aCiMrZEraYOp4hKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7732
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

On Fri, Jul 12, 2024 at 04:00:09PM -0700, Daniele Ceraolo Spurio wrote:
> 
> 
> On 7/12/2024 3:43 PM, Matthew Brost wrote:
> > On Fri, Jul 12, 2024 at 02:28:47PM -0700, Daniele Ceraolo Spurio wrote:
> > > PXP requires submissions to the HW for the following operations
> > > 
> > > 1) Key invalidation, done via the VCS engine
> > > 2) Communication with the GSC FW for session management, done via the
> > >     GSCCS
> > > 
> > > For #1 we can allocate a simple kernel context, but #2 requires the
> > > submissions to be done with PPGTT, which is not currently supported in Xe.
> > > To add this support, the following changes have been included:
> > > 
> > > - a new type of kernel-owned VM (marked as GSC)
> > > - a new function to map a BO into a VM from within the kernel
> > > 
> > > RFC note: I've tweaked some of the VM functions to return the fence
> > > further up the stack, so I can wait on it from the PXP code. Not sure if
> > > this is the best approach.
> > > 
> > > Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > Not a complete review but adding some thoughts. Looks sane enough to me.
> > 
> > Random musing and nits below.
> > 
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/Makefile                   |   1 +
> > >   drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h |   7 +
> > >   drivers/gpu/drm/xe/xe_exec_queue.c            |   3 +
> > >   drivers/gpu/drm/xe/xe_pxp.c                   |  25 ++-
> > >   drivers/gpu/drm/xe/xe_pxp_submit.c            | 188 ++++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_pxp_submit.h            |  16 ++
> > >   drivers/gpu/drm/xe/xe_pxp_types.h             |  33 +++
> > >   drivers/gpu/drm/xe/xe_vm.c                    | 100 +++++++++-
> > >   drivers/gpu/drm/xe/xe_vm.h                    |   6 +
> > >   drivers/gpu/drm/xe/xe_vm_types.h              |   1 +
> > >   10 files changed, 372 insertions(+), 8 deletions(-)
> > >   create mode 100644 drivers/gpu/drm/xe/xe_pxp_submit.c
> > >   create mode 100644 drivers/gpu/drm/xe/xe_pxp_submit.h
> > > 
> > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > index 5f15e6dd5057..a4514265085b 100644
> > > --- a/drivers/gpu/drm/xe/Makefile
> > > +++ b/drivers/gpu/drm/xe/Makefile
> > > @@ -105,6 +105,7 @@ xe-y += xe_bb.o \
> > >   	xe_pt.o \
> > >   	xe_pt_walk.o \
> > >   	xe_pxp.o \
> > > +	xe_pxp_submit.o \
> > >   	xe_query.o \
> > >   	xe_range_fence.o \
> > >   	xe_reg_sr.o \
> > > diff --git a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
> > > index 57520809e48d..f3c4cf10ba20 100644
> > > --- a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
> > > +++ b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
> > > @@ -6,6 +6,7 @@
> > >   #ifndef _ABI_GSC_PXP_COMMANDS_ABI_H
> > >   #define _ABI_GSC_PXP_COMMANDS_ABI_H
> > > +#include <linux/sizes.h>
> > >   #include <linux/types.h>
> > >   /* Heci client ID for PXP commands */
> > > @@ -13,6 +14,12 @@
> > >   #define PXP_APIVER(x, y) (((x) & 0xFFFF) << 16 | ((y) & 0xFFFF))
> > > +/*
> > > + * A PXP sub-section in an HECI packet can be up to 64K big in each direction.
> > > + * This does not include the top-level GSC header.
> > > + */
> > > +#define PXP_MAX_PACKET_SIZE SZ_64K
> > > +
> > >   /*
> > >    * there are a lot of status codes for PXP, but we only define the cross-API
> > >    * common ones that we actually can handle in the kernel driver. Other failure
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > index 0ba37835849b..bc6e867aba17 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > @@ -131,6 +131,9 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
> > >   	struct xe_exec_queue *q;
> > >   	int err;
> > > +	/* VMs for GSCCS queues (and only those) must have the XE_VM_FLAG_GSC flag */
> > > +	xe_assert(xe, !vm || (!!(vm->flags & XE_VM_FLAG_GSC) == !!(hwe->engine_id == XE_HW_ENGINE_GSCCS0)));
> > > +
> > We should be able to remove this soon. More on that below.
> > 
> > >   	q = __xe_exec_queue_alloc(xe, vm, logical_mask, width, hwe, flags,
> > >   				  extensions);
> > >   	if (IS_ERR(q))
> > > diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
> > > index cdb29b104006..01386b9f0c50 100644
> > > --- a/drivers/gpu/drm/xe/xe_pxp.c
> > > +++ b/drivers/gpu/drm/xe/xe_pxp.c
> > > @@ -12,6 +12,7 @@
> > >   #include "xe_gt.h"
> > >   #include "xe_gt_types.h"
> > >   #include "xe_mmio.h"
> > > +#include "xe_pxp_submit.h"
> > >   #include "xe_pxp_types.h"
> > >   #include "xe_uc_fw.h"
> > >   #include "regs/xe_pxp_regs.h"
> > > @@ -50,6 +51,20 @@ static int kcr_pxp_enable(const struct xe_pxp *pxp)
> > >   	return kcr_pxp_set_status(pxp, true);
> > >   }
> > > +static int kcr_pxp_disable(const struct xe_pxp *pxp)
> > > +{
> > > +	return kcr_pxp_set_status(pxp, false);
> > > +}
> > > +
> > > +static void pxp_fini(void *arg)
> > > +{
> > > +	struct xe_pxp *pxp = arg;
> > > +
> > > +	xe_pxp_destroy_execution_resources(pxp);
> > > +
> > > +	/* no need to explicitly disable KCR since we're going to do an FLR */
> > > +}
> > > +
> > >   /**
> > >    * xe_pxp_init - initialize PXP support
> > >    * @xe: the xe_device structure
> > > @@ -97,7 +112,15 @@ int xe_pxp_init(struct xe_device *xe)
> > >   	if (err)
> > >   		return err;
> > > +	err = xe_pxp_allocate_execution_resources(pxp);
> > > +	if (err)
> > > +		goto kcr_disable;
> > > +
> > >   	xe->pxp = pxp;
> > > -	return 0;
> > > +	return devm_add_action_or_reset(xe->drm.dev, pxp_fini, pxp);
> > > +
> > > +kcr_disable:
> > > +	kcr_pxp_disable(pxp);
> > > +	return err;
> > >   }
> > > diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
> > > new file mode 100644
> > > index 000000000000..4fc3c7c58101
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
> > > @@ -0,0 +1,188 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright(c) 2024 Intel Corporation.
> > > + */
> > > +
> > > +#include "xe_pxp_submit.h"
> > > +
> > > +#include <drm/xe_drm.h>
> > > +
> > > +#include "xe_device_types.h"
> > > +#include "xe_bo.h"
> > > +#include "xe_exec_queue.h"
> > > +#include "xe_gsc_submit.h"
> > > +#include "xe_gt.h"
> > > +#include "xe_pxp_types.h"
> > > +#include "xe_vm.h"
> > > +#include "regs/xe_gt_regs.h"
> > > +
> > > +static int create_vcs_context(struct xe_pxp *pxp)
> > > +{
> > > +	struct xe_gt *gt = pxp->gt;
> > > +	struct xe_hw_engine *hwe;
> > > +	struct xe_exec_queue *q;
> > > +
> > > +	hwe = xe_gt_hw_engine(gt, XE_ENGINE_CLASS_VIDEO_DECODE, 0, true);
> > > +	if (!hwe)
> > > +		return -ENODEV;
> > > +
> > Ugh, really want to completely decouple an exec queue from hwe (e.g.
> > don't pass in hwe to xe_exec_queue_create). I guess this already in code
> > so fine here just a reminder of this ugliness.
> > 
> > > +	q = xe_exec_queue_create(pxp->xe, NULL, BIT(hwe->logical_instance), 1, hwe,
> > > +				 EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_PERMANENT, 0);
> > > +	if (IS_ERR(q))
> > > +		return PTR_ERR(q);
> > > +
> > > +	pxp->vcs_queue = q;
> > > +
> > So how is this used? Not attached to a VM? GGTT or ring instructions
> > only? Any downside of attaching this to GSC VM?
> 
> Ring instruction only, yes; we only use it to submit a key termination (next
> patch in the series).
> I've made the GSC_VM only usable with the GSCCS so I didn't have to care
> about potentially having a kernel-owned non-faulting VM on user-accessible
> engines, where userspace might instead want to use a faulting VM. If we're
> removing the limitation and allowing the 2 types to mix that limitation for
> the GSC_VM should go away.

If this is going to be ring instructions only yea I guess leave it
without a VM as there will be a pentally to switch between fault mode
and non-fault mode. I think if we never export a dma-fence from the
vcs_queue queue we can bypass a mode switch. If you export a dma-fence
from the vcs_queue anywhere (install in sync obj, dma-resv, etc...) we
cannot without lockdep getting upset or potentially deadlocking
ourselves. We will need to double check with Thomas / Francois though.

Matt

> 
> > 
> > > +	return 0;
> > > +}
> > > +
> > > +static void destroy_vcs_context(struct xe_pxp *pxp)
> > > +{
> > > +	if (pxp->vcs_queue)
> > > +		xe_exec_queue_put(pxp->vcs_queue);
> > > +}
> > > +
> > > +/*
> > > + * We allocate a single object for the batch and the input and output BOs. PXP
> > > + * commands can require a lot of BO space (see PXP_MAX_PACKET_SIZE), but we
> > > + * currently only support a subset of commands that are small (< 20 dwords),
> > > + * so a single page is enough for now.
> > > + */
> > > +#define PXP_BB_SIZE		XE_PAGE_SIZE
> > > +#define PXP_INOUT_SIZE		XE_PAGE_SIZE
> > > +#define PXP_BO_SIZE		(PXP_BB_SIZE + (2 * PXP_INOUT_SIZE))
> > > +#define PXP_BB_OFFSET		0
> > > +#define PXP_MSG_IN_OFFSET 	PXP_BB_SIZE
> > > +#define PXP_MSG_OUT_OFFSET 	(PXP_MSG_IN_OFFSET + PXP_INOUT_SIZE)
> > > +static int allocate_gsc_execution_resources(struct xe_pxp *pxp)
> > > +{
> > > +	struct xe_gt *gt = pxp->gt;
> > > +	struct xe_tile *tile = gt_to_tile(gt);
> > > +	struct xe_device *xe = pxp->xe;
> > > +	struct xe_hw_engine *hwe;
> > > +	struct xe_vm *vm;
> > > +	struct xe_bo *bo;
> > > +	struct xe_exec_queue *q;
> > > +	struct dma_fence *fence;
> > > +	long timeout;
> > > +	int err = 0;
> > > +
> > > +	hwe = xe_gt_hw_engine(gt, XE_ENGINE_CLASS_OTHER, OTHER_GSC_INSTANCE, false);
> > > +
> > > +	/* we shouldn't reach here if the GSC engine is not available */
> > > +	xe_assert(xe, hwe);
> > > +
> > > +	/* PXP instructions must be issued from PPGTT */
> > > +	vm = xe_vm_create(xe, XE_VM_FLAG_GSC);
> > > +	if (IS_ERR(vm))
> > > +		return PTR_ERR(vm);
> > > +
> > > +	/* We allocate a single object for the batch and the in/out memory */
> > > +	xe_vm_lock(vm, false);
> > > +	bo = xe_bo_create_pin_map(xe, tile, vm, PXP_BO_SIZE, ttm_bo_type_kernel,
> > > +				  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED | XE_BO_FLAG_NEEDS_UC);
> > > +	xe_vm_unlock(vm);
> > > +	if (IS_ERR(bo)) {
> > > +		err = PTR_ERR(bo);
> > > +		goto vm_out;
> > > +	}
> > > +
> > > +	fence = xe_vm_bind_bo(vm, bo, NULL, 0, XE_CACHE_WB);
> > > +	if (IS_ERR(fence)) {
> > > +		err = PTR_ERR(fence);
> > > +		goto bo_out;
> > > +	}
> > > +
> > > +	timeout = dma_fence_wait_timeout(fence, false, HZ);
> > > +	dma_fence_put(fence);
> > > +	if (timeout <= 0) {
> > > +		err = timeout ?: -ETIME;
> > > +		goto bo_out;
> > > +	}
> > > +
> > > +	q = xe_exec_queue_create(xe, vm, BIT(hwe->logical_instance), 1, hwe,
> > > +				 EXEC_QUEUE_FLAG_KERNEL |
> > > +				 EXEC_QUEUE_FLAG_PERMANENT, 0);
> > > +	if (IS_ERR(q)) {
> > > +		err = PTR_ERR(q);
> > > +		goto bo_out;
> > > +	}
> > > +
> > > +	pxp->gsc_exec.vm = vm;
> > > +	pxp->gsc_exec.bo = bo;
> > > +	pxp->gsc_exec.batch = IOSYS_MAP_INIT_OFFSET(&bo->vmap, PXP_BB_OFFSET);
> > > +	pxp->gsc_exec.msg_in = IOSYS_MAP_INIT_OFFSET(&bo->vmap, PXP_MSG_IN_OFFSET);
> > > +	pxp->gsc_exec.msg_out = IOSYS_MAP_INIT_OFFSET(&bo->vmap, PXP_MSG_OUT_OFFSET);
> > So with this mapping, all GSC are serially executed and waited on. There
> > won't ever be a need to pipeline things? If the later is true you could
> > xe_bb_* plus suballocation of the BO you map. More complex so if serial
> > execute is all you will ever need, then yea probably don't use that.
> 
> We only send 2 types of commands, session initialization and session
> invalidation, which have to be serialized.
> 
> Even if we had other commands, the GSC is weird and submissions to it can
> complete with a "wait a bit then try again" message, so we have to wait
> until the fence is signaled, then check the memory and only if the memory
> has a "success" return we can move on to the next submission.
> 
> > 
> > > +	pxp->gsc_exec.q = q;
> > > +
> > > +	/* initialize host-session-handle (for all Xe-to-gsc-firmware PXP cmds) */
> > > +	pxp->gsc_exec.host_session_handle = xe_gsc_create_host_session_id();
> > > +
> > > +	return 0;
> > > +
> > > +bo_out:
> > > +	xe_vm_lock(vm, false);
> > > +	xe_bo_unpin(bo);
> > > +	xe_vm_unlock(vm);
> > > +
> > > +	xe_bo_put(bo);
> > Can use helper I mention below.
> > 
> > > +vm_out:
> > > +	xe_vm_close_and_put(vm);
> > > +
> > > +	return err;
> > > +}
> > > +
> > > +static void destroy_gsc_execution_resources(struct xe_pxp *pxp)
> > > +{
> > > +	if (!pxp->gsc_exec.q)
> > > +		return;
> > > +
> > > +	iosys_map_clear(&pxp->gsc_exec.msg_out);
> > > +	iosys_map_clear(&pxp->gsc_exec.msg_in);
> > > +	iosys_map_clear(&pxp->gsc_exec.batch);
> > I don't think this is strickly need as it just sets a pointer to NULL.
> > 
> > > +
> > > +	xe_exec_queue_put(pxp->gsc_exec.q);
> > > +
> > > +	xe_vm_lock(pxp->gsc_exec.vm, false);
> > > +	xe_bo_unpin(pxp->gsc_exec.bo);
> > > +	xe_vm_unlock(pxp->gsc_exec.vm);
> > > +	xe_bo_put(pxp->gsc_exec.bo);
> > > +
> > This looks awfully like xe_bo_unpin_map_no_vm. Maybe rename that
> > function and just use it?
> > 
> > If a BO is private to a VM (this one is, xe_bo_lock and xe_vm_lock mean
> > the same thing).
> 
> I didn't know the 2 locks where equivalent. I'll switch to the helper.
> 
> > 
> > > +	xe_vm_close_and_put(pxp->gsc_exec.vm);
> > > +}
> > > +
> > > +/**
> > > + * xe_pxp_allocate_execution_resources - Allocate PXP submission objects
> > > + * @pxp: the xe_pxp structure
> > > + *
> > > + * Allocates exec_queues objects for VCS and GSCCS submission. The GSCCS
> > > + * submissions are done via PPGTT, so this function allocates a VM for it and
> > > + * maps the object into it.
> > > + *
> > > + * Returns 0 if the allocation and mapping is successful, an errno value
> > > + * otherwise.
> > > + */
> > > +int xe_pxp_allocate_execution_resources(struct xe_pxp *pxp)
> > > +{
> > > +	int err;
> > > +
> > > +	err = create_vcs_context(pxp);
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	err = allocate_gsc_execution_resources(pxp);
> > > +	if (err)
> > > +		goto destroy_vcs_context;
> > > +
> > > +	return 0;
> > > +
> > > +destroy_vcs_context:
> > > +	destroy_vcs_context(pxp);
> > > +	return err;
> > > +}
> > > +
> > > +void xe_pxp_destroy_execution_resources(struct xe_pxp *pxp)
> > > +{
> > > +	destroy_gsc_execution_resources(pxp);
> > > +	destroy_vcs_context(pxp);
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.h b/drivers/gpu/drm/xe/xe_pxp_submit.h
> > > new file mode 100644
> > > index 000000000000..1a971fadc081
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_pxp_submit.h
> > > @@ -0,0 +1,16 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright(c) 2024, Intel Corporation. All rights reserved.
> > > + */
> > > +
> > > +#ifndef __XE_PXP_SUBMIT_H__
> > > +#define __XE_PXP_SUBMIT_H__
> > > +
> > > +#include <linux/types.h>
> > > +
> > > +struct xe_pxp;
> > > +
> > > +int xe_pxp_allocate_execution_resources(struct xe_pxp *pxp);
> > > +void xe_pxp_destroy_execution_resources(struct xe_pxp *pxp);
> > > +
> > > +#endif /* __XE_PXP_SUBMIT_H__ */
> > > diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h b/drivers/gpu/drm/xe/xe_pxp_types.h
> > > index 1561e3bd2676..c16813253b47 100644
> > > --- a/drivers/gpu/drm/xe/xe_pxp_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_pxp_types.h
> > > @@ -6,10 +6,14 @@
> > >   #ifndef __XE_PXP_TYPES_H__
> > >   #define __XE_PXP_TYPES_H__
> > > +#include <linux/iosys-map.h>
> > >   #include <linux/types.h>
> > > +struct xe_bo;
> > > +struct xe_exec_queue;
> > >   struct xe_device;
> > >   struct xe_gt;
> > > +struct xe_vm;
> > >   /**
> > >    * struct xe_pxp - pxp state
> > > @@ -23,6 +27,35 @@ struct xe_pxp {
> > >   	 * (VDBOX, KCR and GSC)
> > >   	 */
> > >   	struct xe_gt *gt;
> > > +
> > > +	/** @vcs_queue: kernel-owned VCS exec queue used for PXP operations */
> > > +	struct xe_exec_queue *vcs_queue;
> > > +
> > > +	/** @gsc_exec: kernel-owned objects for PXP submissions to the GSCCS */
> > > +	struct {
> > > +		/**
> > > +		 * @gsc_exec.host_session_handle: handle used in communications
> > > +		 * with the GSC firmware.
> > > +		 */
> > > +		u64 host_session_handle;
> > > +		/** @gsc_exec.vm: VM used for PXP submissions to the GSCCS */
> > > +		struct xe_vm *vm;
> > > +		/** @gsc_exec.q: GSCCS exec queue for PXP submissions */
> > > +		struct xe_exec_queue *q;
> > > +
> > > +		/**
> > > +		 * @gsc_exec.bo: BO used for submissions to the GSCCS and GSC
> > > +		 * FW. It includes space for the GSCCS batch and the
> > > +		 * input/output buffers read/written by the FW
> > > +		 */
> > > +		struct xe_bo *bo;
> > > +		/** @gsc_exec.batch: iosys_map to the batch memory within the BO */
> > > +		struct iosys_map batch;
> > > +		/** @gsc_exec.msg_in: iosys_map to the input memory within the BO */
> > > +		struct iosys_map msg_in;
> > > +		/** @gsc_exec.msg_out: iosys_map to the output memory within the BO */
> > > +		struct iosys_map msg_out;
> > > +	} gsc_exec;
> > >   };
> > >   #endif /* __XE_PXP_TYPES_H__ */
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 02f684c0330d..412ec9cb9650 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -1315,6 +1315,15 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> > >   	struct xe_tile *tile;
> > >   	u8 id;
> > > +	/*
> > > +	 * All GSC VMs are owned by the kernel and can also only be used on
> > > +	 * the GSCCS. We don't want a kernel-owned VM to put the device in
> > > +	 * either fault or not fault mode, so we need to exclude the GSC VMs
> > > +	 * from that count; this is only safe if we ensure that all GSC VMs are
> > > +	 * non-faulting.
> > > +	 */
> > > +	xe_assert(xe, !((flags & XE_VM_FLAG_GSC) && (flags & XE_VM_FLAG_FAULT_MODE)));
> > > +
> > >   	vm = kzalloc(sizeof(*vm), GFP_KERNEL);
> > >   	if (!vm)
> > >   		return ERR_PTR(-ENOMEM);
> > > @@ -1442,7 +1451,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> > >   	mutex_lock(&xe->usm.lock);
> > >   	if (flags & XE_VM_FLAG_FAULT_MODE)
> > >   		xe->usm.num_vm_in_fault_mode++;
> > > -	else if (!(flags & XE_VM_FLAG_MIGRATION))
> > > +	else if (!(flags & (XE_VM_FLAG_MIGRATION | XE_VM_FLAG_GSC)))
> > This change is good now but should become unnecessary once Francois
> > lands some code to remove the restriction of mixing faulting and
> > non-faulting VM within a device.
> > 
> > >   		xe->usm.num_vm_in_non_fault_mode++;
> > >   	mutex_unlock(&xe->usm.lock);
> > > @@ -2867,11 +2876,10 @@ static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops *vops,
> > >   	for (i = 0; i < vops->num_syncs; i++)
> > >   		xe_sync_entry_signal(vops->syncs + i, fence);
> > >   	xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> > > -	dma_fence_put(fence);
> > Nit: I'd send this change and associated change in xe_vm_bind_ioctl +
> > vm_bind_ioctl_ops_execute in its own patch, perhaps even as an
> > independent series which I'd RB immediately.
> > 
> > Change looks good though and could be useful else where too.
> > 
> > >   }
> > > -static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> > > -				     struct xe_vma_ops *vops)
> > > +static struct dma_fence *vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> > > +						   struct xe_vma_ops *vops)
> > >   {
> > >   	struct drm_exec exec;
> > >   	struct dma_fence *fence;
> > > @@ -2889,7 +2897,6 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> > >   		fence = ops_execute(vm, vops);
> > >   		if (IS_ERR(fence)) {
> > > -			err = PTR_ERR(fence);
> > >   			/* FIXME: Killing VM rather than proper error handling */
> > >   			xe_vm_kill(vm, false);
> > Looks like you are on old baseline before this series landed [1]. I
> > suggest rebasing as those changes creep up in the upper layers a bit.
> > 
> > [1] https://patchwork.freedesktop.org/series/133034/
> 
> Yes, my local tree is from last week. I'll rebase and split out the changes
> to their own patch as suggested.
> 
> > >   			goto unlock;
> > > @@ -2900,7 +2907,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> > >   unlock:
> > >   	drm_exec_fini(&exec);
> > > -	return err;
> > > +	return fence;
> > >   }
> > >   #define SUPPORTED_FLAGS	\
> > > @@ -3114,6 +3121,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >   	struct xe_sync_entry *syncs = NULL;
> > >   	struct drm_xe_vm_bind_op *bind_ops;
> > >   	struct xe_vma_ops vops;
> > > +	struct dma_fence *fence;
> > >   	int err;
> > >   	int i;
> > > @@ -3264,7 +3272,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >   		goto unwind_ops;
> > >   	}
> > > -	err = vm_bind_ioctl_ops_execute(vm, &vops);
> > > +	fence = vm_bind_ioctl_ops_execute(vm, &vops);
> > > +	if (IS_ERR(fence))
> > > +		err = PTR_ERR(fence);
> > > +	else
> > > +		dma_fence_put(fence);
> > >   unwind_ops:
> > >   	if (err && err != -ENODATA)
> > > @@ -3297,6 +3309,80 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >   	return err;
> > >   }
> > > +/**
> > > + * xe_vm_bind_bo - bind a kernel BO to a VM
> > > + * @vm: VM to bind the BO to
> > > + * @bo: BO to bind
> > > + * @q: exec queue to use for the bind (optional)
> > > + * @addr: address at which to bind the BO
> > > + * @cache_lvl: PAT cache level to use
> > > + *
> > > + * Execute a VM bind map operation on a kernel-owned BO to bind it into a
> > > + * kernel-owned VM.
> > > + *
> > > + * Returns 0 if the ops execution is successful, an errno value otherwise.
> > > + * TODO: return a fence instead.
> > > + */
> > > +struct dma_fence *xe_vm_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
> > > +				struct xe_exec_queue *q, u64 addr,
> > > +				enum xe_cache_level cache_lvl)
> > > +{
> > > +	struct xe_vma_ops vops;
> > > +	struct drm_gpuva_ops *ops = NULL;
> > > +	struct dma_fence *fence;
> > > +	int err;
> > > +
> > > +	xe_bo_get(bo);
> > > +	xe_vm_get(vm);
> > > +	if (q)
> > > +		xe_exec_queue_get(q);
> > > +
> > > +	down_write(&vm->lock);
> > > +
> > > +	xe_vma_ops_init(&vops, vm, q, NULL, 0);
> > > +
> > > +	ops = vm_bind_ioctl_ops_create(vm, bo, 0, addr, bo->size,
> > > +				       DRM_XE_VM_BIND_OP_MAP, 0,
> > > +				       vm->xe->pat.idx[cache_lvl], 0);
> > > +	if (IS_ERR(ops)) {
> > > +		err = PTR_ERR(ops);
> > > +		goto release_vm_lock;
> > > +	}
> > > +
> > > +	err = vm_bind_ioctl_ops_parse(vm, q, ops, NULL, 0, &vops, true);
> > > +	if (err)
> > > +		goto release_vm_lock;
> > > +
> > > +	/* Nothing to do */
> > > +	if (list_empty(&vops.list)) {
> > Can this ever be true? In the current usage it appear so. Maybe convert
> > to an asset !list_empty to simplify this function slightly?
> 
> will do.
> 
> Daniele
> 
> > 
> > Matt
> > 
> > > +		err = -ENODATA;
> > > +		goto unwind_ops;
> > > +	}
> > > +
> > > +	fence = vm_bind_ioctl_ops_execute(vm, &vops);
> > > +	if (IS_ERR(fence))
> > > +		err = PTR_ERR(fence);
> > > +
> > > +unwind_ops:
> > > +	if (err && err != -ENODATA)
> > > +		vm_bind_ioctl_ops_unwind(vm, &ops, 1);
> > > +
> > > +	drm_gpuva_ops_free(&vm->gpuvm, ops);
> > > +
> > > +release_vm_lock:
> > > +	up_write(&vm->lock);
> > > +
> > > +	if (q)
> > > +		xe_exec_queue_put(q);
> > > +	xe_vm_put(vm);
> > > +	xe_bo_put(bo);
> > > +
> > > +	if (err)
> > > +		fence = ERR_PTR(err);
> > > +
> > > +	return fence;
> > > +}
> > > +
> > >   /**
> > >    * xe_vm_lock() - Lock the vm's dma_resv object
> > >    * @vm: The struct xe_vm whose lock is to be locked
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > > index b481608b12f1..5e298ac90dfc 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > > @@ -19,6 +19,8 @@ struct drm_file;
> > >   struct ttm_buffer_object;
> > >   struct ttm_validate_buffer;
> > > +struct dma_fence;
> > > +
> > >   struct xe_exec_queue;
> > >   struct xe_file;
> > >   struct xe_sync_entry;
> > > @@ -248,6 +250,10 @@ int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
> > >   int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
> > >   			  unsigned int num_fences);
> > > +struct dma_fence *xe_vm_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
> > > +				struct xe_exec_queue *q, u64 addr,
> > > +				enum xe_cache_level cache_lvl);
> > > +
> > >   /**
> > >    * xe_vm_resv() - Return's the vm's reservation object
> > >    * @vm: The vm
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index ce1a63a5e3e7..60ce327d303c 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -152,6 +152,7 @@ struct xe_vm {
> > >   #define XE_VM_FLAG_BANNED		BIT(5)
> > >   #define XE_VM_FLAG_TILE_ID(flags)	FIELD_GET(GENMASK(7, 6), flags)
> > >   #define XE_VM_FLAG_SET_TILE_ID(tile)	FIELD_PREP(GENMASK(7, 6), (tile)->id)
> > > +#define XE_VM_FLAG_GSC			BIT(8)
> > >   	unsigned long flags;
> > >   	/** @composite_fence_ctx: context composite fence */
> > > -- 
> > > 2.43.0
> > > 
> 

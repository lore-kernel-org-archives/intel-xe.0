Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D22DCA0EFF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 05:09:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA02510E6F8;
	Wed, 27 Aug 2025 05:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZydVQP4X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BE510E6F8
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 05:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756271384; x=1787807384;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=yblgVhCXIzLDTFH2jxNql32S/zgooM6Smc4gV16qpu8=;
 b=ZydVQP4Xa2qhR9nAk/mD3219iZFWgCANbMCtBjo+wvcALTFdrFeSdXhM
 IWCDdVWg2sY8X0mEBAG3od1yuN7tt1eRwJnjG6cegLBMzAd2BEXuF/+0e
 ntXVIZvXzzcDp3xtgiUpyIvnU81mG3saFTFKWp9/Y10qxBNH6UvATNu/a
 8S/zmSaNkGCVTWLmvP0SGbHuLIZ/JZ+2iBg7XkdpXr7p4I1qC2b8U1A0Z
 PLfstM0hm/PvTpVho4iNUqy4Qpm+JzaCDNEIhwVGp3nf87VA9YAkFtu9V
 r3MoBs3qetdaKV6rPAAawQpbR05tQtp30QtU+ak0879vpqTpe2iJcHifu A==;
X-CSE-ConnectionGUID: 6eV83n9FRQeEseR0UIb0FQ==
X-CSE-MsgGUID: j0rZAnhrSGqWquPCt6uA2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58436110"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58436110"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 22:09:43 -0700
X-CSE-ConnectionGUID: pgmufoTNQHasQSQ0L1q2iQ==
X-CSE-MsgGUID: jZw48MgCSs2B0OciU7uPgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169932003"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 22:09:43 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 22:09:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 Aug 2025 22:09:42 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.86)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 22:09:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJ8PaanVt+rrU2Y3EFSc8xe7MNIeiGYW+FuRdPFvayZY0rkxGI7OlSP1vNpvmbWjUjJ2fw8FE2sVMIt6iFpO0Ebkovo2avUft+gj2ISoZ6McbOgoaePZpylTmgYca14efKwzXs0OefdZpW0T6zcumwvgdCaIusnv3xMG2YY5LZ0TRLBhpaWQi037j1Sh5LMffd/k4dmcUyUA5xw61fjn8bLASZbRyfK2LyGzXwi26uRE6PJGYkgJampgIa12ON2MJd7h3k6mNsOnPjkDSZN0iz1d6RUcifPDDQwN5YpAavkQKBd2NQ6+SaF6N97tTzDb066v3HE8F4FGzT0Mx2Je/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIxMck6KR/QpfkPuzNzTOuG5KQDVYL3kwsYkKogtDPI=;
 b=P8bizRqQNkppxK9KzhVLCuip4/3cTfP6H4w2nrm1rQfQbK4Wz6/6mlvg6r7NQJuV7czOcVGyvyLnjt0VKV7mztna5fFd1L+4dEXameQBBgx6dVVxYWCqGcDYZ6IHp2go6x96uIxFE1vUniCq7Y+bB+yaGU1u6XGhZ+9MkJDmYkVh7KfO9mqA+YHC6SD/hzvfRvck8Bph0vBSPXZiTG4m9MbszJD2WiJXTSQApzob/bPuIzzTxxg+QjiagcHadq76a/3BRF2+8+9b0XJR2yPz8dORNN8JeN91D/OfXD8V/SyltHyL+jgqIbHwq+Ni5tBsRP3FbPtXcq97IDsnlmTxdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MW4PR11MB6571.namprd11.prod.outlook.com (2603:10b6:303:1e2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 05:09:33 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 05:09:33 +0000
Date: Tue, 26 Aug 2025 22:09:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Stuart Summers <stuart.summers@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for Add
 TLB invalidation abstraction (rev10)
Message-ID: <aK6TCbZrlGuFAydr@lstrano-desk.jf.intel.com>
References: <20250826182911.392550-1-stuart.summers@intel.com>
 <175626995861.273111.6598496100392442466@1538d3639d33>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <175626995861.273111.6598496100392442466@1538d3639d33>
X-ClientProxiedBy: BYAPR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:a03:40::38) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MW4PR11MB6571:EE_
X-MS-Office365-Filtering-Correlation-Id: 81db7e93-ac49-491a-633b-08dde527e8b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWVZM2g2cmhVSEc5WkhEUXZ0Q2NnY2JBQ2tPdC9GbGZrWmpmL1RlRHBGa3pH?=
 =?utf-8?B?S21vejJxamRJQ3NxQnVtOGdMbmZSemhGdGVJMkNFRXF2Qi9MdXp6TDYzTmV0?=
 =?utf-8?B?dVVZa2MvTjMyQStwWVdhR2tTTmtkWG9wdTdtUVRpUE03M0xTUVpLUDM1Snda?=
 =?utf-8?B?eHdQTFhBRW5ZRlQzU1l3dTdCNHozUldud3gyd3VDVUJ5VUhzUTdDOUxpMHQv?=
 =?utf-8?B?dkc2WlU0dzZkZ0NzcUxtNXBwQUN4enlmUkgrWElFQmFFTlhVVnB4eEQvMVhu?=
 =?utf-8?B?UVRQVUhOcFVVRTlKWmtMcE53bTZEYzBhUWsyd3hDLzMrQ09HU3dPWHRIenBq?=
 =?utf-8?B?QlpuQXJyZ1B0YXlKL1dpOXRSd0EyV1lVU1lrQXd0dnFvZkhPbHZzZThQMkgx?=
 =?utf-8?B?ajEyV0RtL2V3am5FMFFCekhHa2Z6TUJzMjdjb3RFY1l0cnkrOEFNT1F4UUVJ?=
 =?utf-8?B?dFIvQUtLZEZJRE1lemJkV2h5T01jK3B6Mm9MQkViMGZjdk9QbncrbzNHWFRF?=
 =?utf-8?B?L1dCSXdERGxudHRpZk5ySk1DNDFNTXk5YWw5NjVTQUdTS1hQZ25FaUhicGtC?=
 =?utf-8?B?Qk5rVVNmczkyT0JBVU1uN1U1cFBpa2R2WWtWMkVlMWFUbVBlVS9PaSs4SnhC?=
 =?utf-8?B?ellCNmZrWlRXbi9pKzJubW52NnlPQ29WVDh1U1RndEdkRkY0YWk0dGVsWFNK?=
 =?utf-8?B?M1JqT0pZUUwrVWFIVjZlcG4rc2Z0ZGlpM2pNdDBTb2pTVmdtY0Y3T0NtcW5w?=
 =?utf-8?B?c0ZJVGNDbzBMRVY5RW5UK2h4VjZpb2xjYkp3VUtZTHkxeFZGaG5VTFdsTDZE?=
 =?utf-8?B?bUR5Ui9JU05aSCtYK3pvYkVSYmhZaVlreFA2dTNEN255MG13c0ordUR3N1Ny?=
 =?utf-8?B?SmFGZWM4SzlvbGRFSW81MkV3V1V2V0ZjSG10WHFxYlpqYmU1azBKSUw3YkVJ?=
 =?utf-8?B?T25tSVQzWjkwZ05FOHZMVlJzMkNCQWNsdzBMNkYxYTFFVmZFSU11L082UmJX?=
 =?utf-8?B?K0ZqLzNlZkFDUVhXZXh3T3k1cERNVEhPYWwzNlFvTjFJODRQQVlmV0dUVmd6?=
 =?utf-8?B?cGNIbndBLzMvQ1ZWOFJuMXV4aXFaREdPMngyZFl0bVJlbE5xM1BxU0Y1RE8x?=
 =?utf-8?B?eXhNQ0ZKWkZMRENjL0VJRzdCb1NSY21kdEVBY2dQTWsrQXZBUUNLSDVrdzFp?=
 =?utf-8?B?elBHcXRteTVIaW5IOXVBNWlWcXJmaDZLMlVDQmhEZHVUZTlybUNIZTlrU2Y3?=
 =?utf-8?B?QTZYSk02Y0NLMDhUeE5jbEVwWTRkU0VUTjk2L2dhNVpyaGJQVGkxSm9CZTcw?=
 =?utf-8?B?eHN1c1lEVmhyVS9RM0oxaVNWNTZHRm0zQU1US04vcHZQR25DYzVSTTRKTk8x?=
 =?utf-8?B?RDc5ZnhhWGZLZFZ2clIxQ2hYR09ZdUJNTlJBM3dlNkJrOTJ0NTZTMEhzRHR0?=
 =?utf-8?B?THo0dGNTODNEbzRpSGJJajJmVXBpVlZlM2hRaTdFN2g4QkIxVHBscVVqSWln?=
 =?utf-8?B?M0c3NldCVzVpZVNGSUhCZUdmUklzalIrekhxMzNNRHFibmNEYWZUUWM2Zytv?=
 =?utf-8?B?TUJKNU81WW15V0FjUGcvMlFzb2tGK0dIUFpDS2w0RXZLMWYya3pMdVhUamdB?=
 =?utf-8?B?TUtJZE9XaXpxY2t6czZqdUM4QU9mZGMrUTYyMzNsV1lhZ01qZGx0QkdqcGdo?=
 =?utf-8?B?WnJ1UWNiUHVnL3RHUjB3My9RaC9JQ1BtTkZ6M2YwQTN6SEQ3Z3M3dmVRRld5?=
 =?utf-8?B?U1hKYkwxVFNySGx3VmlvU0R3RUh5a3QxS003WCs1cGdlL1N4d3VxWStlNnVz?=
 =?utf-8?Q?70t+rCqPhX4B/Afc5Qfhn0A7W9ODwrW6qTHKw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ck5mTkFLakc4UlhxN3pnTkw4clV1N3E2OXlUUjlZTC9LamVidWs4S29CZFpp?=
 =?utf-8?B?aG9CQVpKN0VZOHVXdWpJcnNMMzl4eWNaS2kyNmVTaUxZZFNZellCaFgyc1d1?=
 =?utf-8?B?aUNpUk1JeFFGY1JjWUhINEQzTGpCRkIyWXoyZ2s0c3Z6YjhTS1hyMWpyWTBN?=
 =?utf-8?B?Y2NlOFdxS2FhT2QyYmxjSUVIcUdUR2txOFJIekFrSDNuQkw4ZUVHSFFPOHR0?=
 =?utf-8?B?YjFYMlE0UEl1bXZZc2htOThQZHYzYkh1aG1xMGgxNEZ4VlFoOW5TTE5GQWN3?=
 =?utf-8?B?OXhkSXRQcHVZVStvWTMvOENSU0NuRTNMZlJlM0cwV1R5NU1OSVJiR2JFVGtM?=
 =?utf-8?B?bjhHQjNSUE1SbXA2UGNKa1U1UFJrbFpIVy9NanpxTndZMHRxYmJ6ZG93bVU1?=
 =?utf-8?B?M2FrRDJVUFUralNRM1UvbFUwOCtKUldCSFBJcjNlV3dqN1JZMGFYSWRwL29F?=
 =?utf-8?B?L3VXZ3EzVSthZkhITzQrRnIrWVpjYloxWTZVWG1DL2ZCNWZnUlN1N2w1NXI2?=
 =?utf-8?B?ZFVjem9EVFhRRnZBLzFoVFdUT2daL1ZWM2NIL0JmaUpVbC9BR1d5WktTTko3?=
 =?utf-8?B?YWcyOVpHR1NRRmFCd2hjOXFYMEp2QjdscUc0SkhxVmpCZExWL2ZhSWVsRDFx?=
 =?utf-8?B?K3pQVGhmSHRZd3kwTWVxMFhKUVlNRDlwTEp5cmlBb3l6aFBuV3YwWkgvQlU5?=
 =?utf-8?B?bE04NVRzb3NGSXJFcGN4T3puTm5ncEtBeUtOckgwVnNuRTNaMUFkVXc4UFJx?=
 =?utf-8?B?a0hTamZLNWk5UDN2REg3eUN2Z0c4d01LTzNTVTlXN0ZiLzg4YU1KUGE0WTVK?=
 =?utf-8?B?dXNIOEJ4b0hrZ0ZkNDJlK21VRW9OVG9YV1VIRDJXZytzbE0rUlY2U051Zjlr?=
 =?utf-8?B?ZTlPRC9ZSDlhenRnOW1XZnc2aUpSTHVEa3l0eXRQVlVwRDVNdzBObXRyVW90?=
 =?utf-8?B?ZHYrK1d2dnJrRThxaVVCanJTZUEwZVBzVHQvNGhTelBDUzB2SDJpV292WFVK?=
 =?utf-8?B?Unl6bTRrZ0hkRThkeUNrdzkrSE5PaVA0cmxYVUpYeGpUbkRWWURMM1RDQnZZ?=
 =?utf-8?B?cnZlMURNODJEeldZVnE4MGtLYXRjY3h0anRCZE14c1lnNW54LzlLdHhXMCtF?=
 =?utf-8?B?OXBxazlCVkZOZVgwMXE0RmlFTGpobmhrRGtadTl5aHpBb1FOUVczZTlQanNr?=
 =?utf-8?B?ZXBmMXdob1JPSnZTQnNpQTJkK3RRZkNaOU5UNFl3dmg5eEVLRU9jYnhabVN1?=
 =?utf-8?B?M3pWRlhza21ReE1EK1pFQmMxazdLWGwrcEZUTlFoOCtBNUo3ZHBlRUV5NzBu?=
 =?utf-8?B?bXdoaWJkcyt5S2hHejFjeVpnUVNGck5KYzNnT25oYThzUGNld2VKS3VoWC9q?=
 =?utf-8?B?UHNxbWMrdXpvaEpTOTFzQVBMV1BDbmZrUjJybTlZWGxzdk9OU1BXKzB1RVFP?=
 =?utf-8?B?YWJidG9PVmpaTVg4ZnhGeDRIRWZ6YkFhR1A3WFBkaS84SUhESVBUa1h2ZXp6?=
 =?utf-8?B?bUd4UmQyVmtrVWZBcW5qOFFjZDdPNXdrdWgwbTZlQXpCTjVST0lBRWRWczIy?=
 =?utf-8?B?QklkOWV5SGZTS1FCV3hROXA0a215Q1lKV3h5L0x2Y1lPM3FMZWovUHBka05T?=
 =?utf-8?B?TFlKTTJPMy9XUGFLdjNGNlFGTzVoenVSSWp1TXk1Y0Y3Rlppa2w3MlJkdWx1?=
 =?utf-8?B?eUkxUlQyQlZOTlZYQjF3YVpKcUFVcHRuQ1BDWkJKY3BoM2VrQzJJWGxoRU1i?=
 =?utf-8?B?MHNGSmw5b0J3TEJ5M09XU0piVzBhQmdBaTd3RXAwMW11bUNSQ2NvbHlUakRI?=
 =?utf-8?B?TmcyZ2JDc05LSEEzdWxtWkVONjVycUhnUmZNMnpvcFdXSTlzY0ZSNFVYQi83?=
 =?utf-8?B?TkhBNUVGWkkwR2NBQ0RLRVI1b2lyQWp5RWJSMjlVOUFWcnZIL1FUUFJ2bmV5?=
 =?utf-8?B?TWxaWUtBcE1sSitKcEJhWWdQbUZHVTBic201bllyc0NpNExSRWN5M2poOEYr?=
 =?utf-8?B?dUc3WnRkRTlUR0NFRCtXREVZTXc2eEVrQXA1NEowdi9Sd3hDL0ZEektZVi93?=
 =?utf-8?B?aVBENlg5NnB2dmkrYWN3M3J2THZpdEc0UVRTWEF0eklMZzRPOEdXVTdQZFlk?=
 =?utf-8?B?MEZYRUxqY2pQdE1QdVhaNUxrOGZlbjRjaXpqbUhjOTBUaFJkUzBEL2NQd1Q2?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81db7e93-ac49-491a-633b-08dde527e8b6
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 05:09:33.0147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ieDYpZrTKIRpWXaHi6JXviAcgyxfsqqOVs3U3K45rRIJHY8xCfP1JeDZhBkP2HsjKwqOceuB82IBtK+YT2TbLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6571
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

On Wed, Aug 27, 2025 at 04:45:58AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Add TLB invalidation abstraction (rev10)
> URL   : https://patchwork.freedesktop.org/series/152022/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907_FULL -> xe-pw-152022v10_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-152022v10_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-152022v10_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-152022v10_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-mlock:
>     - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-mlock.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-mlock.html


I think this is noise, but the xe_exec_system_allocator section is our
best coverage for correct TLB-invalidation behavior. An “incomplete”
result is odd, since the test relies on user fences with timeouts, and
nothing concerning shows up in dmesg.

I ran 100 passes of this section to completion on my BMG, as well as a
full xe_exec_system_allocator run—no issues.

Given how sensitive and hard-to-reproduce TLB-invalidation issues are,
Stuart, could you hit the retry button?

Matt

> 
>   * igt@xe_pmu@engine-activity-most-load@engine-drm_xe_engine_class_copy0:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][3] +1 other test incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-5/igt@xe_pmu@engine-activity-most-load@engine-drm_xe_engine_class_copy0.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-152022v10_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_getversion@all-cards:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][4] ([Intel XE#4208])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@core_getversion@all-cards.html
> 
>   * igt@core_getversion@basic:
>     - shard-dg2-set2:     [PASS][5] -> [FAIL][6] ([Intel XE#4208])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-436/igt@core_getversion@basic.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@core_getversion@basic.html
> 
>   * igt@fbdev@eof:
>     - shard-dg2-set2:     [PASS][7] -> [SKIP][8] ([Intel XE#2134])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-432/igt@fbdev@eof.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@fbdev@eof.html
> 
>   * igt@fbdev@unaligned-read:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#2134])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@fbdev@unaligned-read.html
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1125])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@intel_hwmon@hwmon-write.html
> 
>   * igt@kms_addfb_basic@addfb25-modifier-no-flag:
>     - shard-dg2-set2:     [PASS][11] -> [SKIP][12] ([Intel XE#4208] / [i915#2575]) +54 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-464/igt@kms_addfb_basic@addfb25-modifier-no-flag.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_addfb_basic@addfb25-modifier-no-flag.html
> 
>   * igt@kms_async_flips@test-cursor:
>     - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#664])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@kms_async_flips@test-cursor.html
> 
>   * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#4208] / [i915#2575]) +28 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1124]) +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-90:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1407])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@kms_big_fb@linear-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-270:
>     - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#316])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-adlp-8/igt@kms_big_fb@linear-64bpp-rotate-270.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#316]) +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
>     - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1124]) +3 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [PASS][20] -> [DMESG-FAIL][21] ([Intel XE#4543])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1124]) +4 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
>     - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#2191])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1512])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#2191])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-adlp-8/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#2191])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#367])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#787]) +11 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-adlp-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#455] / [Intel XE#787]) +12 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#2669]) +3 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#3432])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#787]) +69 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#2887]) +6 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-a-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#4417]) +3 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html
> 
>   * igt@kms_chamelium_color@ctm-limited-range:
>     - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#306])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@kms_chamelium_color@ctm-limited-range.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#306])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-436/igt@kms_chamelium_color@gamma.html
>     - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#306])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-adlp-8/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_frames@dp-crc-fast:
>     - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#373]) +1 other test skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-adlp-8/igt@kms_chamelium_frames@dp-crc-fast.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>     - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#373]) +4 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#373]) +3 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-436/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> 
>   * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][42] ([Intel XE#1178])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
> 
>   * igt@kms_content_protection@atomic@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][43] ([Intel XE#1178])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-4/igt@kms_content_protection@atomic@pipe-a-dp-2.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#3278])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#2321]) +1 other test skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#308])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-433/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-random-max-size:
>     - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1424]) +1 other test skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@kms_cursor_crc@cursor-random-max-size.html
> 
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
>     - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#309]) +2 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-adlp-8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
>     - shard-bmg:          [PASS][49] -> [SKIP][50] ([Intel XE#2291]) +1 other test skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-bmg-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>     - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#309]) +1 other test skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-bmg:          [PASS][52] -> [FAIL][53] ([Intel XE#1475])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_dp_link_training@non-uhbr-mst:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#4354])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-436/igt@kms_dp_link_training@non-uhbr-mst.html
>     - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#4354])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-adlp-8/igt@kms_dp_link_training@non-uhbr-mst.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#2244])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#703])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-433/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_flip@2x-blocking-absolute-wf_vblank:
>     - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#310])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-adlp-8/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-bmg:          [PASS][59] -> [SKIP][60] ([Intel XE#2316]) +2 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:
>     - shard-bmg:          NOTRUN -> [FAIL][61] ([Intel XE#3321])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend:
>     - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1421]) +5 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@kms_flip@2x-flip-vs-suspend.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#1397]) +1 other test skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1397] / [Intel XE#1745]) +1 other test skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#2351] / [Intel XE#4208]) +7 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#455]) +5 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2311])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
>     - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#651]) +7 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#656]) +7 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#651]) +8 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
>     - shard-dg2-set2:     [PASS][71] -> [SKIP][72] ([Intel XE#2351] / [Intel XE#4208]) +7 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#656]) +19 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
>     - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#651]) +3 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#653]) +4 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#4208]) +143 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#658])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2313])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-slowdraw:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#653]) +7 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-slowdraw.html
> 
>   * igt@kms_hdmi_inject@inject-4k:
>     - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1470])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@kms_hdmi_inject@inject-4k.html
> 
>   * igt@kms_hdr@static-toggle:
>     - shard-bmg:          [PASS][81] -> [SKIP][82] ([Intel XE#1503])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-bmg-3/igt@kms_hdr@static-toggle.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-6/igt@kms_hdr@static-toggle.html
> 
>   * igt@kms_joiner@basic-force-ultra-joiner:
>     - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#2925])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@kms_joiner@basic-force-ultra-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-ultra-joiner:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#2927])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-436/igt@kms_joiner@invalid-modeset-ultra-joiner.html
>     - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#2927])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-adlp-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> 
>   * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#599]) +4 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#5020])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-adlp-8/igt@kms_plane_multiple@tiling-yf.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#5020])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-436/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#870])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-436/igt@kms_pm_backlight@fade-with-suspend.html
>     - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#870])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-adlp-8/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>     - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#836])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-adlp-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>   * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#1406] / [Intel XE#2893]) +1 other test skip
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#1406] / [Intel XE#4208]) +5 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1406] / [Intel XE#2893] / [Intel XE#4608])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1406] / [Intel XE#4608]) +1 other test skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html
> 
>   * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-adlp-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-436/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1128] / [Intel XE#1406])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr@fbc-psr2-no-drrs:
>     - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +1 other test skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-adlp-8/igt@kms_psr@fbc-psr2-no-drrs.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-move:
>     - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1406]) +2 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@kms_psr@fbc-psr2-sprite-plane-move.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#1406] / [Intel XE#4609])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1.html
> 
>   * igt@kms_psr@pr-sprite-plane-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-436/igt@kms_psr@pr-sprite-plane-move.html
> 
>   * igt@kms_setmode@clone-exclusive-crtc:
>     - shard-bmg:          [PASS][103] -> [SKIP][104] ([Intel XE#1435])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-bmg-7/igt@kms_setmode@clone-exclusive-crtc.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html
>     - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#455]) +2 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-adlp-8/igt@kms_setmode@clone-exclusive-crtc.html
> 
>   * igt@kms_setmode@invalid-clone-exclusive-crtc:
>     - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1435])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-bmg:          [PASS][107] -> [SKIP][108] ([Intel XE#1499])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-bmg-7/igt@kms_vrr@negative-basic.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-6/igt@kms_vrr@negative-basic.html
> 
>   * igt@kms_vrr@seamless-rr-switch-vrr:
>     - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#1499])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-vrr.html
> 
>   * igt@xe_ccs@block-multicopy-compressed:
>     - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#455] / [Intel XE#488] / [Intel XE#5607])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-adlp-8/igt@xe_ccs@block-multicopy-compressed.html
> 
>   * igt@xe_eu_stall@unprivileged-access:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#5626])
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-433/igt@xe_eu_stall@unprivileged-access.html
> 
>   * igt@xe_eudebug@multigpu-basic-client-many:
>     - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#4837]) +5 other tests skip
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@xe_eudebug@multigpu-basic-client-many.html
> 
>   * igt@xe_eudebug@read-metadata:
>     - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#4837] / [Intel XE#5565]) +2 other tests skip
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-adlp-8/igt@xe_eudebug@read-metadata.html
> 
>   * igt@xe_eudebug_online@debugger-reopen:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#4837]) +3 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-436/igt@xe_eudebug_online@debugger-reopen.html
> 
>   * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram:
>     - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#4837])
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-5/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram.html
> 
>   * igt@xe_evict@evict-small-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-adlp-8/igt@xe_evict@evict-small-cm.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
>     - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#688]) +2 other tests skip
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html
> 
>   * igt@xe_exec_balancer@once-parallel-rebind:
>     - shard-dg2-set2:     [PASS][118] -> [SKIP][119] ([Intel XE#4208]) +137 other tests skip
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-464/igt@xe_exec_balancer@once-parallel-rebind.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#1392] / [Intel XE#5575]) +1 other test skip
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
>     - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#1392]) +3 other tests skip
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
>     - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#288] / [Intel XE#5561]) +5 other tests skip
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-adlp-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#288]) +8 other tests skip
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
> 
>   * igt@xe_exec_system_allocator@once-mmap-free-huge-nomemset:
>     - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#4943]) +15 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@xe_exec_system_allocator@once-mmap-free-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@process-many-mmap-free-race-nomemset:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#4915]) +69 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-436/igt@xe_exec_system_allocator@process-many-mmap-free-race-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-many-malloc-fork-read-after:
>     - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#4915]) +60 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-adlp-8/igt@xe_exec_system_allocator@threads-many-malloc-fork-read-after.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset:
>     - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#4943]) +1 other test skip
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset.html
> 
>   * igt@xe_oa@closed-fd-and-unmapped-access:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#3573]) +1 other test skip
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-436/igt@xe_oa@closed-fd-and-unmapped-access.html
> 
>   * igt@xe_oa@oa-tlb-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#2248])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html
> 
>   * igt@xe_oa@privileged-forked-access-vaddr:
>     - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#3573]) +1 other test skip
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-adlp-8/igt@xe_oa@privileged-forked-access-vaddr.html
> 
>   * igt@xe_pm@d3hot-mmap-vram:
>     - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#1948])
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@xe_pm@d3hot-mmap-vram.html
> 
>   * igt@xe_pm@s2idle-d3cold-basic-exec:
>     - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-adlp-8/igt@xe_pm@s2idle-d3cold-basic-exec.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-436/igt@xe_pm@s2idle-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s3-multiple-execs:
>     - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#584])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@xe_pm@s3-multiple-execs.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#579])
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html
> 
>   * igt@xe_query@multigpu-query-engines:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#944])
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-433/igt@xe_query@multigpu-query-engines.html
> 
>   * igt@xe_query@multigpu-query-pxp-status:
>     - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#944]) +2 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-1/igt@xe_query@multigpu-query-pxp-status.html
> 
>   * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#4130])
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-433/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
> 
>   * igt@xe_sriov_flr@flr-each-isolation:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#3342])
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-436/igt@xe_sriov_flr@flr-each-isolation.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_setmaster@master-drop-set-user:
>     - shard-dg2-set2:     [FAIL][140] ([Intel XE#4208]) -> [PASS][141]
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@core_setmaster@master-drop-set-user.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@core_setmaster@master-drop-set-user.html
> 
>   * igt@fbdev@nullptr:
>     - shard-dg2-set2:     [SKIP][142] ([Intel XE#2134]) -> [PASS][143]
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@fbdev@nullptr.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@fbdev@nullptr.html
> 
>   * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:
>     - shard-adlp:         [DMESG-WARN][144] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][145] +7 other tests pass
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-adlp-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-adlp-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
>     - shard-bmg:          [SKIP][146] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][147]
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-bmg:          [INCOMPLETE][148] ([Intel XE#3862]) -> [PASS][149] +1 other test pass
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2:
>     - shard-bmg:          [FAIL][150] ([Intel XE#5376]) -> [PASS][151] +1 other test pass
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][152] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [PASS][153]
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
>     - shard-dg2-set2:     [INCOMPLETE][154] ([Intel XE#3124]) -> [PASS][155]
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [DMESG-WARN][156] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][157]
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>     - shard-bmg:          [SKIP][158] ([Intel XE#2291]) -> [PASS][159] +3 other tests pass
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-bmg:          [SKIP][160] ([Intel XE#2316]) -> [PASS][161] +1 other test pass
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_flip@busy-flip:
>     - shard-dg2-set2:     [SKIP][162] ([Intel XE#4208] / [i915#2575]) -> [PASS][163] +67 other tests pass
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-435/igt@kms_flip@busy-flip.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-433/igt@kms_flip@busy-flip.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>     - shard-lnl:          [FAIL][164] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][165] +1 other test pass
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-bmg:          [INCOMPLETE][166] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][167] +1 other test pass
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-bmg-7/igt@kms_flip@flip-vs-suspend.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:
>     - shard-adlp:         [FAIL][168] ([Intel XE#1874]) -> [PASS][169]
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
>     - shard-adlp:         [DMESG-FAIL][170] ([Intel XE#4543]) -> [PASS][171] +1 other test pass
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][172] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][173] +7 other tests pass
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_hdr@static-toggle-dpms:
>     - shard-bmg:          [SKIP][174] ([Intel XE#1503]) -> [PASS][175]
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-bmg-6/igt@kms_hdr@static-toggle-dpms.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-4/igt@kms_hdr@static-toggle-dpms.html
> 
>   * igt@xe_exec_reset@parallel-gt-reset:
>     - shard-bmg:          [DMESG-WARN][176] ([Intel XE#3876]) -> [PASS][177]
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-bmg-8/igt@xe_exec_reset@parallel-gt-reset.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-5/igt@xe_exec_reset@parallel-gt-reset.html
> 
>   * igt@xe_exec_threads@threads-cm-fd-rebind:
>     - shard-bmg:          [FAIL][178] -> [PASS][179] +2 other tests pass
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-bmg-8/igt@xe_exec_threads@threads-cm-fd-rebind.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-5/igt@xe_exec_threads@threads-cm-fd-rebind.html
> 
>   * igt@xe_vm@large-split-binds-536870912:
>     - shard-dg2-set2:     [SKIP][180] ([Intel XE#4208]) -> [PASS][181] +131 other tests pass
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@xe_vm@large-split-binds-536870912.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@xe_vm@large-split-binds-536870912.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][182] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][183] ([Intel XE#316])
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][184] ([Intel XE#4208]) -> [SKIP][185] ([Intel XE#316]) +1 other test skip
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-90.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][186] ([Intel XE#316]) -> [SKIP][187] ([Intel XE#4208]) +2 other tests skip
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-464/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-dg2-set2:     [SKIP][188] ([Intel XE#619]) -> [SKIP][189] ([Intel XE#2351] / [Intel XE#4208])
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-dg2-set2:     [SKIP][190] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][191] ([Intel XE#1124]) +3 other tests skip
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-dg2-set2:     [SKIP][192] ([Intel XE#1124]) -> [SKIP][193] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     [SKIP][194] ([Intel XE#610]) -> [SKIP][195] ([Intel XE#4208])
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-dg2-set2:     [SKIP][196] ([Intel XE#4208]) -> [SKIP][197] ([Intel XE#1124]) +3 other tests skip
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-dg2-set2:     [SKIP][198] ([Intel XE#1124]) -> [SKIP][199] ([Intel XE#4208]) +5 other tests skip
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][200] ([Intel XE#2191]) -> [SKIP][201] ([Intel XE#4208] / [i915#2575])
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][202] ([Intel XE#4208] / [i915#2575]) -> [SKIP][203] ([Intel XE#2191])
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>     - shard-dg2-set2:     [SKIP][204] ([Intel XE#367]) -> [SKIP][205] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][206] ([Intel XE#4208] / [i915#2575]) -> [SKIP][207] ([Intel XE#367])
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     [SKIP][208] ([Intel XE#4208]) -> [SKIP][209] ([Intel XE#2907]) +1 other test skip
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
>     - shard-dg2-set2:     [SKIP][210] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][211] ([Intel XE#4208]) +7 other tests skip
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
>     - shard-dg2-set2:     [SKIP][212] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][213] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     [SKIP][214] ([Intel XE#2907]) -> [SKIP][215] ([Intel XE#4208])
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
>     - shard-dg2-set2:     [SKIP][216] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][217] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     [SKIP][218] ([Intel XE#4208]) -> [SKIP][219] ([Intel XE#3442])
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     [SKIP][220] ([Intel XE#3442]) -> [SKIP][221] ([Intel XE#4208])
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
>     - shard-dg2-set2:     [SKIP][222] ([Intel XE#4208]) -> [SKIP][223] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-0-75:
>     - shard-dg2-set2:     [SKIP][224] ([Intel XE#4208] / [i915#2575]) -> [SKIP][225] ([Intel XE#306]) +1 other test skip
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-435/igt@kms_chamelium_color@ctm-0-75.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-433/igt@kms_chamelium_color@ctm-0-75.html
> 
>   * igt@kms_chamelium_color@ctm-limited-range:
>     - shard-dg2-set2:     [SKIP][226] ([Intel XE#306]) -> [SKIP][227] ([Intel XE#4208] / [i915#2575]) +1 other test skip
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-436/igt@kms_chamelium_color@ctm-limited-range.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html
> 
>   * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
>     - shard-dg2-set2:     [SKIP][228] ([Intel XE#373]) -> [SKIP][229] ([Intel XE#4208] / [i915#2575]) +7 other tests skip
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-464/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
>     - shard-dg2-set2:     [SKIP][230] ([Intel XE#4208] / [i915#2575]) -> [SKIP][231] ([Intel XE#373]) +6 other tests skip
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-bmg:          [SKIP][232] ([Intel XE#2341]) -> [FAIL][233] ([Intel XE#1178])
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-bmg-6/igt@kms_content_protection@atomic.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-4/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-dg2-set2:     [SKIP][234] ([Intel XE#4208] / [i915#2575]) -> [FAIL][235] ([Intel XE#1178])
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-dg2-set2:     [SKIP][236] ([Intel XE#4208] / [i915#2575]) -> [SKIP][237] ([Intel XE#307])
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-1.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-bmg:          [FAIL][238] ([Intel XE#1178]) -> [SKIP][239] ([Intel XE#2341])
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-bmg-3/igt@kms_content_protection@legacy.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-6/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - shard-dg2-set2:     [FAIL][240] ([Intel XE#1178]) -> [SKIP][241] ([Intel XE#4208] / [i915#2575]) +1 other test skip
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-432/igt@kms_content_protection@lic-type-0.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>     - shard-dg2-set2:     [SKIP][242] ([Intel XE#308]) -> [SKIP][243] ([Intel XE#4208] / [i915#2575])
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-dg2-set2:     [SKIP][244] ([Intel XE#4208] / [i915#2575]) -> [SKIP][245] ([Intel XE#308]) +1 other test skip
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x170.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-max-size:
>     - shard-dg2-set2:     [SKIP][246] ([Intel XE#455]) -> [SKIP][247] ([Intel XE#4208] / [i915#2575]) +7 other tests skip
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-max-size.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-max-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-dg2-set2:     [SKIP][248] ([Intel XE#323]) -> [SKIP][249] ([Intel XE#4208] / [i915#2575])
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_dsc@dsc-with-bpc:
>     - shard-dg2-set2:     [SKIP][250] ([Intel XE#4208]) -> [SKIP][251] ([Intel XE#455]) +1 other test skip
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@kms_dsc@dsc-with-bpc.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@kms_dsc@dsc-with-bpc.html
> 
>   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
>     - shard-dg2-set2:     [SKIP][252] ([Intel XE#4208]) -> [SKIP][253] ([Intel XE#4422])
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-dg2-set2:     [SKIP][254] ([Intel XE#4208] / [i915#2575]) -> [SKIP][255] ([Intel XE#701])
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@kms_feature_discovery@chamelium.html
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-dg2-set2:     [SKIP][256] ([Intel XE#1135]) -> [SKIP][257] ([Intel XE#4208] / [i915#2575])
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-464/igt@kms_feature_discovery@psr1.html
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank:
>     - shard-bmg:          [SKIP][258] ([Intel XE#2316]) -> [FAIL][259] ([Intel XE#3321])
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>     - shard-dg2-set2:     [SKIP][260] ([Intel XE#455]) -> [SKIP][261] ([Intel XE#4208])
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>     - shard-dg2-set2:     [SKIP][262] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][263] ([Intel XE#455]) +1 other test skip
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-dg2-set2:     [SKIP][264] ([Intel XE#455]) -> [SKIP][265] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:
>     - shard-dg2-set2:     [SKIP][266] ([Intel XE#4208]) -> [SKIP][267] ([Intel XE#651]) +13 other tests skip
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][268] ([Intel XE#2312]) -> [SKIP][269] ([Intel XE#2311]) +9 other tests skip
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
>     - shard-bmg:          [SKIP][270] ([Intel XE#2311]) -> [SKIP][271] ([Intel XE#2312]) +6 other tests skip
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-suspend:
>     - shard-dg2-set2:     [SKIP][272] ([Intel XE#651]) -> [SKIP][273] ([Intel XE#2351] / [Intel XE#4208]) +8 other tests skip
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
>     - shard-bmg:          [SKIP][274] ([Intel XE#5390]) -> [SKIP][275] ([Intel XE#2312]) +3 other tests skip
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
>     - shard-bmg:          [SKIP][276] ([Intel XE#2312]) -> [SKIP][277] ([Intel XE#5390]) +3 other tests skip
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][278] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][279] ([Intel XE#651]) +7 other tests skip
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][280] ([Intel XE#651]) -> [SKIP][281] ([Intel XE#4208]) +12 other tests skip
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
>     - shard-dg2-set2:     [SKIP][282] ([Intel XE#653]) -> [SKIP][283] ([Intel XE#4208]) +14 other tests skip
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
>     - shard-bmg:          [SKIP][284] ([Intel XE#2313]) -> [SKIP][285] ([Intel XE#2312]) +5 other tests skip
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-dg2-set2:     [SKIP][286] ([Intel XE#1158]) -> [SKIP][287] ([Intel XE#4208])
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][288] ([Intel XE#2312]) -> [SKIP][289] ([Intel XE#2313]) +5 other tests skip
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][290] ([Intel XE#653]) -> [SKIP][291] ([Intel XE#2351] / [Intel XE#4208]) +7 other tests skip
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
>     - shard-dg2-set2:     [SKIP][292] ([Intel XE#4208]) -> [SKIP][293] ([Intel XE#653]) +16 other tests skip
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
>     - shard-dg2-set2:     [SKIP][294] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][295] ([Intel XE#653]) +3 other tests skip
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-dg2-set2:     [SKIP][296] ([Intel XE#4208] / [i915#2575]) -> [SKIP][297] ([Intel XE#455]) +4 other tests skip
>    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@kms_hdr@brightness-with-hdr.html
>    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@kms_hdr@brightness-with-hdr.html
>     - shard-bmg:          [SKIP][298] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][299] ([Intel XE#3544])
>    [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
>    [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_joiner@basic-max-non-joiner:
>     - shard-dg2-set2:     [SKIP][300] ([Intel XE#4298]) -> [SKIP][301] ([Intel XE#4208])
>    [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-464/igt@kms_joiner@basic-max-non-joiner.html
>    [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_joiner@basic-max-non-joiner.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
>     - shard-dg2-set2:     [SKIP][302] ([Intel XE#4208]) -> [SKIP][303] ([Intel XE#4359])
>    [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-435/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
>    [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-433/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
> 
>   * igt@kms_plane_multiple@2x-tiling-y:
>     - shard-dg2-set2:     [SKIP][304] ([Intel XE#5021]) -> [SKIP][305] ([Intel XE#4208] / [i915#2575])
>    [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-y.html
>    [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_plane_multiple@2x-tiling-y.html
> 
>   * igt@kms_pm_backlight@brightness-with-dpms:
>     - shard-dg2-set2:     [SKIP][306] ([Intel XE#2938]) -> [SKIP][307] ([Intel XE#4208])
>    [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-436/igt@kms_pm_backlight@brightness-with-dpms.html
>    [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-set2:     [SKIP][308] ([Intel XE#1406] / [Intel XE#4208]) -> [SKIP][309] ([Intel XE#1406] / [Intel XE#1489]) +5 other tests skip
>    [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
>    [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-433/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
>     - shard-dg2-set2:     [SKIP][310] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][311] ([Intel XE#1406] / [Intel XE#4208]) +4 other tests skip
>    [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
>    [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-dg2-set2:     [SKIP][312] ([Intel XE#1122] / [Intel XE#1406]) -> [SKIP][313] ([Intel XE#1406] / [Intel XE#4208]) +1 other test skip
>    [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html
>    [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@fbc-psr-no-drrs:
>     - shard-dg2-set2:     [SKIP][314] ([Intel XE#1406] / [Intel XE#2351] / [Intel XE#4208]) -> [SKIP][315] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +4 other tests skip
>    [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html
>    [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@kms_psr@fbc-psr-no-drrs.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-move:
>     - shard-dg2-set2:     [SKIP][316] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) -> [SKIP][317] ([Intel XE#1406] / [Intel XE#4208]) +2 other tests skip
>    [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-move.html
>    [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html
> 
>   * igt@kms_psr@psr-dpms:
>     - shard-dg2-set2:     [SKIP][318] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) -> [SKIP][319] ([Intel XE#1406] / [Intel XE#2351] / [Intel XE#4208]) +4 other tests skip
>    [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-432/igt@kms_psr@psr-dpms.html
>    [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_psr@psr-dpms.html
> 
>   * igt@kms_psr@psr2-basic:
>     - shard-dg2-set2:     [SKIP][320] ([Intel XE#1406] / [Intel XE#4208]) -> [SKIP][321] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +6 other tests skip
>    [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@kms_psr@psr2-basic.html
>    [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@kms_psr@psr2-basic.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-dg2-set2:     [SKIP][322] ([Intel XE#4208] / [i915#2575]) -> [SKIP][323] ([Intel XE#1127])
>    [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
>    [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-dg2-set2:     [SKIP][324] ([Intel XE#1127]) -> [SKIP][325] ([Intel XE#4208] / [i915#2575])
>    [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>    [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-dg2-set2:     [SKIP][326] ([Intel XE#4208] / [i915#2575]) -> [SKIP][327] ([Intel XE#3414]) +1 other test skip
>    [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
>    [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-dg2-set2:     [SKIP][328] ([Intel XE#330]) -> [SKIP][329] ([Intel XE#4208] / [i915#2575])
>    [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-464/igt@kms_tv_load_detect@load-detect.html
>    [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_vrr@cmrr:
>     - shard-dg2-set2:     [SKIP][330] ([Intel XE#2168]) -> [SKIP][331] ([Intel XE#4208] / [i915#2575])
>    [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-432/igt@kms_vrr@cmrr.html
>    [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@kms_vrr@cmrr.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>     - shard-dg2-set2:     [SKIP][332] ([Intel XE#4208] / [i915#2575]) -> [SKIP][333] ([Intel XE#1091] / [Intel XE#2849])
>    [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
>    [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x369:
>     - shard-dg2-set2:     [SKIP][334] ([Intel XE#1123]) -> [SKIP][335] ([Intel XE#4208])
>    [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x369.html
>    [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x369.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x3fff:
>     - shard-dg2-set2:     [SKIP][336] ([Intel XE#4208]) -> [SKIP][337] ([Intel XE#1123])
>    [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
>    [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfd:
>     - shard-dg2-set2:     [SKIP][338] ([Intel XE#4208]) -> [SKIP][339] ([Intel XE#1126])
>    [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfd.html
>    [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html
> 
>   * igt@xe_eu_stall@blocking-re-enable:
>     - shard-dg2-set2:     [SKIP][340] ([Intel XE#5626]) -> [SKIP][341] ([Intel XE#4208])
>    [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-432/igt@xe_eu_stall@blocking-re-enable.html
>    [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@xe_eu_stall@blocking-re-enable.html
> 
>   * igt@xe_eudebug@sysfs-toggle:
>     - shard-dg2-set2:     [SKIP][342] ([Intel XE#4837]) -> [SKIP][343] ([Intel XE#4208]) +9 other tests skip
>    [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-464/igt@xe_eudebug@sysfs-toggle.html
>    [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@xe_eudebug@sysfs-toggle.html
> 
>   * igt@xe_eudebug@vma-ufence-faultable:
>     - shard-dg2-set2:     [SKIP][344] ([Intel XE#4208]) -> [SKIP][345] ([Intel XE#4837]) +10 other tests skip
>    [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@xe_eudebug@vma-ufence-faultable.html
>    [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@xe_eudebug@vma-ufence-faultable.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
>     - shard-dg2-set2:     [SKIP][346] ([Intel XE#1392]) -> [SKIP][347] ([Intel XE#4208]) +1 other test skip
>    [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
>    [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
> 
>   * igt@xe_exec_basic@multigpu-once-null-rebind:
>     - shard-dg2-set2:     [SKIP][348] ([Intel XE#4208]) -> [SKIP][349] ([Intel XE#1392]) +4 other tests skip
>    [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@xe_exec_basic@multigpu-once-null-rebind.html
>    [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:
>     - shard-dg2-set2:     [SKIP][350] ([Intel XE#4208]) -> [SKIP][351] ([Intel XE#288]) +18 other tests skip
>    [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html
>    [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
>     - shard-dg2-set2:     [SKIP][352] ([Intel XE#288]) -> [SKIP][353] ([Intel XE#4208]) +18 other tests skip
>    [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
>    [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
> 
>   * igt@xe_exec_reset@parallel-gt-reset:
>     - shard-dg2-set2:     [SKIP][354] ([Intel XE#4208]) -> [DMESG-WARN][355] ([Intel XE#3876])
>    [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html
>    [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html
> 
>   * igt@xe_exec_system_allocator@many-large-malloc-nomemset:
>     - shard-dg2-set2:     [SKIP][356] ([Intel XE#4915]) -> [SKIP][357] ([Intel XE#4208]) +182 other tests skip
>    [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-464/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html
>    [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset:
>     - shard-dg2-set2:     [SKIP][358] ([Intel XE#4208]) -> [SKIP][359] ([Intel XE#4915]) +176 other tests skip
>    [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset.html
>    [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - shard-dg2-set2:     [SKIP][360] ([Intel XE#255]) -> [SKIP][361] ([Intel XE#4208])
>    [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-436/igt@xe_huc_copy@huc_copy.html
>    [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@xe_huc_copy@huc_copy.html
> 
>   * igt@xe_media_fill@media-fill:
>     - shard-dg2-set2:     [SKIP][362] ([Intel XE#4208]) -> [SKIP][363] ([Intel XE#560])
>    [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@xe_media_fill@media-fill.html
>    [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@xe_media_fill@media-fill.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-dg2-set2:     [SKIP][364] ([Intel XE#512]) -> [SKIP][365] ([Intel XE#4208])
>    [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-432/igt@xe_mmap@small-bar.html
>    [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_oa@buffer-size:
>     - shard-dg2-set2:     [SKIP][366] ([Intel XE#4208]) -> [SKIP][367] ([Intel XE#5103])
>    [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@xe_oa@buffer-size.html
>    [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@xe_oa@buffer-size.html
> 
>   * igt@xe_oa@mi-rpc:
>     - shard-dg2-set2:     [SKIP][368] ([Intel XE#4208]) -> [SKIP][369] ([Intel XE#3573]) +4 other tests skip
>    [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@xe_oa@mi-rpc.html
>    [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@xe_oa@mi-rpc.html
> 
>   * igt@xe_oa@whitelisted-registers-userspace-config:
>     - shard-dg2-set2:     [SKIP][370] ([Intel XE#3573]) -> [SKIP][371] ([Intel XE#4208]) +5 other tests skip
>    [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-432/igt@xe_oa@whitelisted-registers-userspace-config.html
>    [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@xe_oa@whitelisted-registers-userspace-config.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - shard-dg2-set2:     [SKIP][372] ([Intel XE#4208]) -> [SKIP][373] ([Intel XE#977])
>    [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@xe_pat@pat-index-xe2.html
>    [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_pm@d3cold-i2c:
>     - shard-dg2-set2:     [SKIP][374] ([Intel XE#4208]) -> [SKIP][375] ([Intel XE#5694])
>    [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-435/igt@xe_pm@d3cold-i2c.html
>    [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-433/igt@xe_pm@d3cold-i2c.html
> 
>   * igt@xe_pm@d3cold-mocs:
>     - shard-dg2-set2:     [SKIP][376] ([Intel XE#2284]) -> [SKIP][377] ([Intel XE#4208])
>    [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-464/igt@xe_pm@d3cold-mocs.html
>    [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@xe_pm@d3cold-mocs.html
> 
>   * igt@xe_pmu@all-fn-engine-activity-load:
>     - shard-dg2-set2:     [SKIP][378] ([Intel XE#4650]) -> [SKIP][379] ([Intel XE#4208]) +1 other test skip
>    [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-432/igt@xe_pmu@all-fn-engine-activity-load.html
>    [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@xe_pmu@all-fn-engine-activity-load.html
> 
>   * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
>     - shard-dg2-set2:     [SKIP][380] ([Intel XE#4733]) -> [SKIP][381] ([Intel XE#4208]) +1 other test skip
>    [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-432/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html
>    [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html
> 
>   * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
>     - shard-dg2-set2:     [SKIP][382] ([Intel XE#4208]) -> [SKIP][383] ([Intel XE#4733])
>    [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html
>    [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html
> 
>   * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
>     - shard-dg2-set2:     [SKIP][384] ([Intel XE#944]) -> [SKIP][385] ([Intel XE#4208]) +1 other test skip
>    [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-436/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
>    [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-434/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
> 
>   * igt@xe_query@multigpu-query-oa-units:
>     - shard-dg2-set2:     [SKIP][386] ([Intel XE#4208]) -> [SKIP][387] ([Intel XE#944]) +2 other tests skip
>    [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@xe_query@multigpu-query-oa-units.html
>    [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@xe_query@multigpu-query-oa-units.html
> 
>   * igt@xe_sriov_auto_provisioning@fair-allocation:
>     - shard-dg2-set2:     [SKIP][388] ([Intel XE#4208]) -> [SKIP][389] ([Intel XE#4130])
>    [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@xe_sriov_auto_provisioning@fair-allocation.html
>    [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@xe_sriov_auto_provisioning@fair-allocation.html
> 
>   * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
>     - shard-dg2-set2:     [SKIP][390] ([Intel XE#4208]) -> [SKIP][391] ([Intel XE#4351]) +1 other test skip
>    [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907/shard-dg2-434/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
>    [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/shard-dg2-432/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
>   [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
>   [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
>   [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
>   [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
>   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>   [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
>   [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
>   [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
>   [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>   [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4359
>   [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
>   [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>   [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
>   [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5103]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5103
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
>   [Intel XE#5376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5376
>   [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
>   [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
>   [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
>   [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
>   [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
>   [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
>   [Intel XE#5607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607
>   [Intel XE#5624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624
>   [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
>   [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>   [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907 -> xe-pw-152022v10
> 
>   IGT_8511: 8511
>   xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907: 4b94f8fef771cb0b1d0131675e2d794ef6464907
>   xe-pw-152022v10: 152022v10
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v10/index.html
